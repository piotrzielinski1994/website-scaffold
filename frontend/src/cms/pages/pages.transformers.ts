import { ApiPage, Page, Pages } from '@packages/types/pages/pages.types';
import { apiBlockToBlock } from '../blocks/blocks.transformers';
import { takePagePaths } from './pages.helpers';
import { Seo } from '../content/seo/seo.types';
import { ApiLanguage } from '@packages/types';
import { objectEntries, objectFromEntries, Entry } from '@packages/helpers/entries/entries';

const asd = (
  languages: ApiPage['translations'][0]['languages_code'][],
): Record<ApiPage['translations'][0]['languages_code'], Seo> => {
  const zxc = languages.map((lang) => {
    return [
      lang,
      {
        url: '',
        title: '',
        description: '',
        image: null,
      },
    ];
  });

  return Object.fromEntries(zxc);
};

export const apiPageToPage = (pages: ApiPage[], pageId: ApiPage['id']): Page => {
  const page = pages.find((page) => page.id === pageId);
  if (!page) throw Error(`Page ${pageId} not found.`);

  const pathPerLanguage = takePagePaths(pages, pageId);

  const zxc = objectFromEntries<Record<ApiLanguage['code'], Seo>>(
    objectEntries(pathPerLanguage).map(([lang, path]) => {
      const entry: Entry<Page['seo']> = [
        lang,
        {
          url: path,
          title: '',
          description: '',
          image: '',
        },
      ];
      return entry;
    }),
  );

  console.log('@@@ zxc | ', zxc);

  return {
    id: page.id,
    status: page.status,
    parentPage: page.parent_page,
    subpages: page.subpages,
    sort: page.sort,
    menus: page.menus,
    layout: page.layout,
    path: pathPerLanguage,
    seo: zxc,
    // title: page.title,
    // description: page.description,
    // image: page.image,
    // content: page.content.map(apiBlockToBlock),
    createdAt: new Date(page.created_at),
    updatedAt: page.updated_at ? new Date(page.updated_at) : null,
  };
};

export const apiPagesToPagesCollection = (apiPages: ApiPage[]): Pages => {
  return apiPages.reduce(
    (map, apiPage) => ({
      ...map,
      [apiPage.id]: apiPageToPage(apiPages, apiPage.id),
    }),
    {},
  );
};
