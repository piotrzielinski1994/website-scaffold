import { Block, BlockType } from '@/components/blocks/block.types';
import { takePagePath } from './pages.helpers';
import { ApiPage, Page, Pages } from './pages.types';

export const apiPageToPage = (pages: ApiPage[], pageId: ApiPage['id']): Page => {
  const page = pages.find((page) => page.id === pageId);
  if (!page) throw Error(`Page ${pageId} not found.`);

  return {
    id: page.id,
    status: page.status,
    parentPage: page.parent_page,
    subpages: page.subpages,
    sort: page.sort,
    isVisibleInNavbar: page.is_visible_in_navbar,
    slug: page.slug ?? '',
    path: takePagePath(pages, pageId),
    layout: page.layout,
    title: page.title,
    description: page.description,
    image: page.image,
    content: page.content.map((it) => {
      return { type: it.collection, props: it.item };
    }) as Block<BlockType, unknown>[],
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
    {}
  );
};
