import cmsClient from '@/api/cms-client/cms-client';
import { Page } from '@/shared/types/page.types';

export const query = cmsClient.query(`
  query Pages {
    pages {
      data {
        id
        attributes {
          title
          slug
          publishedAt
          createdAt
          updatedAt
        }
      }
    }
  }
`)

export const getPages = async (): Promise<Page[]> => {
  const result = await cmsClient.request<Page[], 'pages'>(query);
  return result.data.pages.data;
}
