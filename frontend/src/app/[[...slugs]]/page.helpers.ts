import { Metadata } from 'next';
import { RouteMetadata } from './page.types';
import { slugsToPath } from './page.transformers';
import { getPages } from '@/api/pages/pages.requests';
import { takePageByPath } from '@/api/pages/pages.helpers';

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
