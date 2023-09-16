import { getPage, getPages } from "@/components/templates/page/page.helpers";
import type { Page } from "@/shared/types/page.types";
import { PageProps } from "./page.types";
import PageTemplate from "@/components/templates/page/page";
import { notFound } from 'next/navigation';

const Page = async ({ params }: PageProps) => {
  const slug = params.segments?.at(-1) ?? '';
  const page = await getPage(slug);
  
  if (page === undefined) {
    return notFound();
  }

  return <PageTemplate page={page} />;
}

export default Page;
