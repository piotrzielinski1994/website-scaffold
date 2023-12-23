import { ApiPage, Page, Pages } from '@packages/types/pages/pages.types';
import { takePageContent, takePagePaths, takePageSeo } from './pages.helpers';

export const apiPageToPage = (pages: ApiPage[], pageId: ApiPage['id']): Page => {
  const page = pages.find((page) => page.id === pageId);
  if (!page) throw Error(`Page ${pageId} not found.`);

  const pathPerLanguage = takePagePaths(pages, pageId);

  return {
    id: page.id,
    status: page.status,
    parentPage: page.parent_page,
    subpages: page.subpages,
    sort: page.sort,
    menus: page.menus,
    layout: page.layout,
    path: pathPerLanguage,
    seo: takePageSeo(page, pathPerLanguage),
    content: takePageContent(page),
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
