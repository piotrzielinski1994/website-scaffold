import { takePageByPath } from '@/api/pages/pages.helpers';
import { getPages } from '@/api/pages/pages.requests';
import Layout from '@/components/layouts/layout/layout';
import { pagesToHeaderProps } from '@/components/shared/layout/header/header.transformers';
import PageTemplate from '@/components/templates/page/page';
import { notFound } from 'next/navigation';
import { getPageMetadata } from './page.helpers';
import { slugsToPath } from './page.transformers';
import { PageProps } from './page.types';

export const generateMetadata = getPageMetadata;

const Page = async ({ params }: PageProps) => {
  const path = slugsToPath(params.slugs ?? []);
  const pages = await getPages();
  const page = takePageByPath(pages, path);

  if (page === undefined) return notFound();

  return (
    <Layout layout={page.layout} header={pagesToHeaderProps(pages)}>
      <PageTemplate page={page} />
    </Layout>
  );
};

export default Page;
