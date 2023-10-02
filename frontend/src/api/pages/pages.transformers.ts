import { takePagePath } from './pages.helpers';
import { ApiPage, Page } from './pages.types';

export const apiPageToPage = (apiPage: ApiPage): Page => {
  return {
    ...apiPage,
    parentPageId: apiPage.parent_page_id,
    isVisibleInNavbar: apiPage.is_visible_in_navbar,
    createdAt: new Date(apiPage.created_at),
    updatedAt: apiPage.updated_at ? new Date(apiPage.updated_at) : null
  }
}

export const pagesToPagePerPath = (pages: Page[]): Record<string, Page> => {
  return pages.reduce((map, page) => {
    const path = takePagePath(pages, page.id);
    return { ...map, [path]: page };
  }, {});
}
