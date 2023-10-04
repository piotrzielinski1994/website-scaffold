import type { Page } from '@/shared/types/page.types';
import { PageProps } from './page.types';
import { getPages } from '@/api/pages/pages.requests';
import PageTemplate from '@/components/templates/page/page';
import { notFound } from 'next/navigation';
import Layout from '@/components/layouts/layout/layout';
import { takePageByPath } from '@/api/pages/pages.helpers';
import Metadata from '@/components/shared/metadata/metadata';
import { pageToMetadataProps } from '@/components/shared/metadata/metadata.transformers';
import { pagesToHeaderProps } from '@/components/shared/layout/header/header.transformers';

const Page = async ({ params }: PageProps) => {
  const path = `/${params.slugs?.join('/') ?? ''}`;
  const pages = await getPages();
  const page = takePageByPath(pages, path);

  if (page === undefined) return notFound();

  return <>
    <Metadata {...pageToMetadataProps(page)} />
    <Layout layout={page.layout} header={pagesToHeaderProps(pages)} >
      <PageTemplate page={page} />
    </Layout>
  </>;
};

export default Page;
