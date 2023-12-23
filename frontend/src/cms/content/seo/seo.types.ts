import { ApiModel } from '@packages/types';

export interface ApiSeo extends ApiModel {
  slug: string | null;
  title: string;
  description: string | null;
  image: string | null;
}
