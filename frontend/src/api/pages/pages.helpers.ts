import { Page } from "./pages.types";

export const getPagePath = (pageId: Page['id'], pages: Page[]): string => {
  const page = pages.find((page) => page.id === pageId);
  if (!page) throw Error(`Page ${pageId} not found.`);

  const slug = page.slug ?? '';
  if (page.parentPageId === null) return slug;

  const parentPagePath = getPagePath(page.parentPageId, pages);
  return `${parentPagePath}/${slug}`.replace(/\/\//g, '/');
}
