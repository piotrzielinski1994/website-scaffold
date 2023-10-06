import { ApiPage, Pages } from '@packages/types/pages/pages.types';
import cmsClient from '../cms-client/cms-client';
import { apiPagesToPagesCollection } from './pages.transformers';

export const getPages = async (): Promise<Pages> => {
  const apiPages = await cmsClient.get<ApiPage[]>(
    '/items/pages?fields=*,content.collection,content.item.*.*',
  );
  return apiPagesToPagesCollection(apiPages);
};
