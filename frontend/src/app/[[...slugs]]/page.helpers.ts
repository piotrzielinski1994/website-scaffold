import { takePageByPath } from '@/cms/pages/pages.helpers';
import { getPages } from '@/cms/pages/pages.requests';
import { Metadata } from 'next';
import { slugsToPath } from './page.transformers';
import { RouteMetadata } from './page.types';

export const getPageMetadata = async ({ params }: RouteMetadata): Promise<Metadata> => {
  const path = slugsToPath(params.slugs ?? []);
  const pages = await getPages();
  const page = takePageByPath(pages, path);

  if (page === undefined) return {};

  return {
    title: page.title,
    openGraph: {
      description: page.description ?? undefined,
      images: page.image ? [page.image] : undefined,
    },
  };
};
