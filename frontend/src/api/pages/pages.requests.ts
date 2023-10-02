import cmsClient from "../cms-client/cms-client";
import { ApiPage, Pages } from "./pages.types";
import { apiPagesToPagesCollection } from "./pages.transformers";

export const getPages = async (): Promise<Pages> => {
  const apiPages = await cmsClient.get<ApiPage[]>('/items/pages');
  return apiPagesToPagesCollection(apiPages);
};
