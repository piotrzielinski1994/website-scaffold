import { takePagePath } from './pages.helpers';
import { ApiPage, Page, Pages } from './pages.types';

export const apiPageToPage = (pages: ApiPage[], pageId: ApiPage['id']): Page => {
  const page = pages.find((page) => page.id === pageId);
  if (!page) throw Error(`Page ${pageId} not found.`);

  return {
    ...page,
    parentPage: page.parent_page,
    isVisibleInNavbar: page.is_visible_in_navbar,
    slug: page.slug ?? '',
    path: takePagePath(pages, pageId),
    createdAt: new Date(page.created_at),
    updatedAt: page.updated_at ? new Date(page.updated_at) : null,
  }
};

export const apiPagesToPagesCollection = (apiPages: ApiPage[]): Pages => {
  const collection: Pages = apiPages.reduce((map, apiPage) => {
    return { ...map, [apiPage.id]: apiPageToPage(apiPages, apiPage.id) };
  }, {});
  return collection;
};
