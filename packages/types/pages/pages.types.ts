import {
  ApiModel,
  ApiWithPublicationStatus,
  ApiWithTimestamps,
  Model,
  WithPublicationStatus,
  WithTimestamps,
} from '@packages/types/common.types';
import { ApiBlock, Block } from '../blocks/blocks.types';
import { ApiSeo } from '@/cms/content/seo/seo.types';

export interface ApiPage extends ApiModel, ApiWithTimestamps, ApiWithPublicationStatus {
  parent_page_id: ApiPage['id'] | null;
  subpages: ApiPage['id'][];
  sort: number | null;
  menu: ('main-navbar' | 'footer')[];
  slug: string | null;
  layout: 'default';
  seo_id: ApiSeo;
  content: ApiBlock[];
}

export interface Page extends Model, WithTimestamps, WithPublicationStatus {
  parentPage: ApiPage['parent_page_id'];
  subpages: ApiPage['subpages'];
  sort: ApiPage['sort'];
  isVisibleInNavbar: ApiPage['menu'];
  slug: string;
  path: string;
  layout: ApiPage['layout'];
  seo: ApiPage['seo_id'];
  content: Block[];
}

export type Pages = Record<Page['id'], Page>;
