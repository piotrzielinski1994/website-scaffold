import {
  ApiLanguage,
  ApiModel,
  ApiWithPublicationStatus,
  ApiWithTimestamps,
  Model,
  WithPublicationStatus,
  WithTimestamps,
} from '@packages/types/common.types';
import { ApiBlock, Block } from '../blocks/blocks.types';
import { ApiSeo, Seo } from '@/cms/content/seo/seo.types';

export interface ApiPage extends ApiModel, ApiWithTimestamps, ApiWithPublicationStatus {
  parent_page: ApiPage['id'] | null;
  subpages: ApiPage['id'][];
  sort: number | null;
  menus: ('main-navbar' | 'footer')[];
  layout: 'default';
  translations: {
    languages_code: ApiLanguage['code'];
    seo: ApiSeo;
    content: ApiBlock[];
  }[];
}

export interface Page extends Model, WithTimestamps, WithPublicationStatus {
  parentPage: ApiPage['parent_page'];
  subpages: ApiPage['subpages'];
  sort: ApiPage['sort'];
  menus: ApiPage['menus'];
  layout: ApiPage['layout'];
  path: Record<ApiLanguage['code'], string>;
  seo: Record<ApiLanguage['code'], Seo>;
  content: Record<ApiLanguage['code'], Block[]>;
}

export type Pages = Record<Page['id'], Page>;
