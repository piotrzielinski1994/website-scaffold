import cmsClient from "../cms-client/cms-client";
import { ApiPage, Page } from "./pages.types";
import { getPagePath } from "./pages.helpers";
import { apiPageToPage } from "./pages.transformers";

export const getPageByPath = async (path: string): Promise<Page> => {
  const pages = (await cmsClient.get<ApiPage[]>('/items/pages')).map(apiPageToPage);
  const pathToPage: Record<string, Page> = pages.reduce((acc, page) => {
    const pagePath = getPagePath(page.id, pages);
    return { ...acc, [pagePath]: page };
  }, {});

  return pathToPage[path];
};
