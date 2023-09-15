import { getPage } from "@/components/templates/page/page.helpers";
import type { Page } from "@/shared/types/page.types";
import { PageProps } from "./page.types";
import PageTemplate from "@/components/templates/page/page";

const Page = async ({ params }: PageProps) => {
  const slug = params.segments.at(-1);
  
  if (slug === undefined) {
    return;
  }

  const page = await getPage(slug);

  return <PageTemplate page={page} />;
}

export default Page;
