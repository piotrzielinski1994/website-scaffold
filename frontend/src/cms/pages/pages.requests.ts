import { ApiPage, Pages } from '@packages/types/pages/pages.types';
import cmsClient from '../client';
import { apiPagesToPagesCollection } from './pages.transformers';

export const getPages = async (): Promise<Pages> => {
  const apiPages = await cmsClient.get<ApiPage[]>(
    '/items/pages?fields=*,translations.languages_code,translations.seo.*',
  );

  return apiPagesToPagesCollection(apiPages);
};
