import cmsClient from '@/api/cms-client/cms-client';
import { Page } from '@/shared/types/page.types';

export const getPages = async (): Promise<Page[]> => {
  const result = await cmsClient.request<Page[], 'pages'>(
    cmsClient.query(`
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
  );

  return result.data.pages.data;
};

export const getPage = async (slug: Page['attributes']['slug']): Promise<Page> => {
  const result = await cmsClient.request<Page[], 'pages'>(
    cmsClient.query(
      `
      query Pages($filters: PageFiltersInput) {
        pages(filters: $filters) {
          data {
            id
            attributes {
              createdAt
              parent {
                data {
                  id
                }
              }
              slug
              title
              updatedAt
              publishedAt
            }
          }
        }
      }
    `),
    {
      filters: {
        slug: {
          eq: slug,
        },
      },
    }
  );

  return result.data.pages.data[0];
};
