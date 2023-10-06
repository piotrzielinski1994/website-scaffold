import { takePageByParentId } from '@/cms/pages/pages.helpers';
import { Page, Pages } from '@packages/types/pages/pages.types';
import { MenuItem } from './navbar.types';

export const pagesToMenuItems = (pages: Pages): MenuItem[] => {
  const rootPage = takePageByParentId(pages, null);
  if (!rootPage) return [];

  return rootPage.subpages
    .map(pageIdToMenuItem(pages))
    .filter((item): item is MenuItem => item !== undefined);
};

const pageIdToMenuItem =
  (pages: Pages) =>
  (pageId: Page['id']): MenuItem | undefined => {
    const page = pages[pageId];
    if (!page) throw Error(`Page ${pageId} not found.`);

    if (!page.isVisibleInNavbar) return undefined;

    const items = page.subpages
      .map(pageIdToMenuItem(pages))
      .filter((item): item is MenuItem => item !== undefined);

    return {
      label: page.title,
      href: page.path,
      items: items.length > 0 ? items : undefined,
    };
  };
