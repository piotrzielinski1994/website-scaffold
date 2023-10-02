import type { Page } from '@/shared/types/page.types';
import { PageProps } from './page.types';
import { getPages } from '@/api/pages/pages.requests';
import PageTemplate from '@/components/templates/page/page';
import { notFound } from 'next/navigation';
import Layout from '@/components/layouts/layout/layout';
import { pagesToPagePerPath } from '@/api/pages/pages.transformers';

const Page = async ({ params }: PageProps) => {
  const path = `/${params.segments?.join('/') ?? ''}`;
  const pages = await getPages();
  const pagesPerPath = pagesToPagePerPath(pages);
  const page = pagesPerPath[path];
  
  if (page === undefined) {
    return notFound();
  }

  return <Layout layout='default' navbar={{ items: [] }} >
    <PageTemplate page={page} />
  </Layout>;
};

export default Page;
