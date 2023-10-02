import type { Page } from '@/shared/types/page.types';
import { PageProps } from './page.types';
import { getPageByPath } from '@/api/pages/pages.requests';
import PageTemplate from '@/components/templates/page/page';
import { notFound } from 'next/navigation';

const Page = async ({ params }: PageProps) => {
  const path = `/${params.segments?.join('/') ?? ''}`;
  const page = await getPageByPath(path);
  
  if (page === undefined) {
    return notFound();
  }

  return <PageTemplate page={page} />;
};

export default Page;
