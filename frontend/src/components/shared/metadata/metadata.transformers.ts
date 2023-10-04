import { Page } from "@/api/pages/pages.types";
import { MetadataProps } from "./metadata.types";

export const pageToMetadataProps = (page: Page): MetadataProps => {
  return {
    title: page.title,
    description: page.description ?? undefined,
    image: page.image ?? undefined,
  }
};
