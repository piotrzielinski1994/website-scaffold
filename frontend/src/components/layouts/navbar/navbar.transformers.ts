import { Page, Pages } from "@/api/pages/pages.types";
import { MenuItem } from "./navbar.types";

export const pagesToMenuItems = (pages: Pages): MenuItem[] => {
  const rootPage = Object.entries(pages)
    .find(([_, page]) => page.parentPage === null)
    ?.[1];
  if (!rootPage) return [];

  return rootPage.subpages.map(pageIdToMenuItem(pages));
}

const pageIdToMenuItem = (pages: Pages) => (pageId: Page['id']): MenuItem => {
  const page = pages[pageId];
  if (!page) throw Error(`Page ${pageId} not found.`);

  return {
    label: page.title,
    href: page.path,
    items: page.subpages.length > 0
      ? page.subpages.map(pageIdToMenuItem(pages))
      : undefined,
  };
}
