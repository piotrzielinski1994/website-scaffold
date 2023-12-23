import { objectEntries, objectFromEntries } from '@packages/helpers/entries/entries';
import { Entry } from '@packages/helpers/entries/entries.types';
import { ApiLanguage } from '@packages/types';
import { ApiPage, Page, Pages } from '@packages/types/pages/pages.types';
import { Seo } from '../content/seo/seo.types';
import { apiBlockToBlock } from '../blocks/blocks.transformers';
import { Block } from '@packages/types/blocks/blocks.types';

export const takePagePaths = (pages: ApiPage[], pageId: ApiPage['id']): Page['path'] => {
  const page = pages.find((page) => page.id === pageId);
  if (!page) throw Error(`Page ${pageId} not found.`);

  const languages = page.translations.map((it) => it.languages_code);

  const entries = languages.map((lang) => {
    const slug = page.translations.find((it) => it.languages_code === lang)?.seo.slug ?? '';

    if (page.parent_page === null) return [lang, `/${slug}`];

    const parentPagePath = takePagePaths(pages, page.parent_page)[lang];
    return [lang, `${parentPagePath}/${slug}`.replace(/\/\//g, '/')];
  });

  return Object.fromEntries(entries);
};

export const takePageByPath = (pages: Pages, path: Page['path']): Page | undefined => {
  return Object.values(pages).find((page) => page.path === path);
};

export const takePageByParentId = (
  pages: Pages,
  parentId: Page['parentPage'],
): Page | undefined => {
  return Object.values(pages).find((page) => page.parentPage === parentId);
};

export const takePageSeo = (page: ApiPage, pathPerLanguage: Page['path']): Page['seo'] => {
  const entries = objectEntries(pathPerLanguage).map(([lang, path]) => {
    const apiSeo = page.translations.find((it) => it.languages_code === lang)!.seo;
    const entry: Entry<Page['seo']> = [
      lang,
      {
        url: path,
        title: apiSeo.title,
        description: apiSeo.description,
        image: apiSeo.image,
      },
    ];
    return entry;
  });

  return objectFromEntries<Record<ApiLanguage['code'], Seo>>(entries);
};

export const takePageContent = (page: ApiPage): Page['content'] => {
  // TODO: Add blocks to CMS
  return {
    'en-US': [],
    'pl-PL': [],
  };
  return objectFromEntries<Record<ApiLanguage['code'], Block[]>>(
    page.translations.map((it) => {
      return [it.languages_code, it.content.map(apiBlockToBlock)];
    }),
  );
};
