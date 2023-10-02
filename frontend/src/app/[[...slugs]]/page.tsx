import type { Page } from '@/shared/types/page.types';
import { PageProps } from './page.types';
import { getPages } from '@/api/pages/pages.requests';
import PageTemplate from '@/components/templates/page/page';
import { notFound } from 'next/navigation';
import Layout from '@/components/layouts/layout/layout';
import { pagesToMenuItems } from '@/components/layouts/navbar/navbar.transformers';

const Page = async ({ params }: PageProps) => {
  const path = `/${params.slugs?.join('/') ?? ''}`;
  const pages = await getPages();
  const page = Object.entries(pages)
    .find(([_, page]) => page.path === path)
    ?.[1];

  if (page === undefined) return notFound();

  return <Layout layout='default' navbar={{ items: pagesToMenuItems(pages) }} >
    <PageTemplate page={page} />
  </Layout>;
};

export default Page;
