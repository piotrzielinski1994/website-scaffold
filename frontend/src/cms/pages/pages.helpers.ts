import { ApiLanguage } from '@packages/types';
import { ApiPage, Page, Pages } from '@packages/types/pages/pages.types';

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
