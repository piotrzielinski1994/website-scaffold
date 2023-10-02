import { ApiPage } from "./pages.types";

export const takePagePath = (pages: ApiPage[], pageId: ApiPage['id']): string => {
  const page = pages.find((page) => page.id === pageId);
  if (!page) throw Error(`Page ${pageId} not found.`);

  const slug = page.slug ?? '';
  if (page.parent_page === null) return `/${slug}`;

  const parentPagePath = takePagePath(pages, page.parent_page);
  return `${parentPagePath}/${slug}`.replace(/\/\//g, '/');
}
