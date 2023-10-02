import cmsClient from "../cms-client/cms-client";
import { ApiPage, Page } from "./pages.types";
import { apiPageToPage } from "./pages.transformers";
import { takePagePath } from "./pages.helpers";

export const getPages = async (): Promise<Page[]> => {
  return (await cmsClient.get<ApiPage[]>('/items/pages')).map(apiPageToPage);
};

export const getPageByPath = async (path: string): Promise<Page> => {
  const apiPages = (await cmsClient.get<ApiPage[]>('/items/pages'));
  const pages = apiPages.map(apiPageToPage);
  const pathToPage: Record<string, Page> = pages.reduce((acc, page) => {
    const pagePath = takePagePath(pages, page.id);
    return { ...acc, [pagePath]: page };
  }, {});

  return pathToPage[path];
};
