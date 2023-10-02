import { Page } from "./pages.types";

export const takePagePath = (pages: Page[], pageId: Page['id']): string => {
  const page = pages.find((page) => page.id === pageId);
  if (!page) throw Error(`Page ${pageId} not found.`);

  const slug = page.slug ?? '';
  if (page.parentPageId === null) return `/${slug}`;

  const parentPagePath = takePagePath(pages, page.parentPageId);
  return `${parentPagePath}/${slug}`.replace(/\/\//g, '/');
}
