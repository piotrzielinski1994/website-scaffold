import { takePageByPath, takePageLanguage } from '@/cms/pages/pages.helpers';
import { getPages } from '@/cms/pages/pages.requests';
import { Metadata } from 'next';
import { slugsToPath } from './page.transformers';
import { RouteMetadata } from './page.types';

export const getPageMetadata = async ({ params }: RouteMetadata): Promise<Metadata> => {
  const path = slugsToPath(params.slugs ?? []);
  const pages = await getPages();
  const page = takePageByPath(pages, path);

  if (page === undefined) return {};

  const lang = takePageLanguage(page, path);

  return {
    title: page.seo[lang].title,
    openGraph: {
      description: page.seo[lang].description ?? undefined,
      images: page.seo[lang].image ?? undefined,
    },
  };
};
