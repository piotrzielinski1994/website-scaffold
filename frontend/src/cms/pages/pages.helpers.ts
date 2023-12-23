import { ApiPage, Page, Pages } from '@packages/types/pages/pages.types';

export const takePagePath = (pages: ApiPage[], pageId: ApiPage['id']): Page['path'] => {
  const page = pages.find((page) => page.id === pageId);

  if (!page) throw Error(`Page ${pageId} not found.`);

  const slug = page.slug ?? '';
  if (page.parent_page_id === null) return `/${slug}`;

  const parentPagePath = takePagePath(pages, page.parent_page_id);
  return `${parentPagePath}/${slug}`.replace(/\/\//g, '/');
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
