import { BlockProps } from '@/components/blocks/block.types';
import {
  ApiWithPublicationStatus,
  ApiWithTimestamps,
  Model,
  WithPublicationStatus,
  WithTimestamps,
} from '../common.types';

export interface ApiPage extends Model, ApiWithTimestamps, ApiWithPublicationStatus {
  parent_page: ApiPage['id'] | null;
  subpages: ApiPage['id'][];
  sort: number | null;
  is_visible_in_navbar: boolean;
  slug: string | null;
  layout: 'default';
  title: string;
  description: string | null;
  image: string | null;
  content: {
    collection: string;
    item: Model & unknown;
  }[];
}

export interface Page extends Model, WithTimestamps, WithPublicationStatus {
  parentPage: ApiPage['parent_page'];
  subpages: ApiPage['subpages'];
  sort: ApiPage['sort'];
  isVisibleInNavbar: ApiPage['is_visible_in_navbar'];
  slug: string;
  path: string;
  layout: ApiPage['layout'];
  title: ApiPage['title'];
  description: ApiPage['description'];
  image: ApiPage['image'];
  content: BlockProps[];
}

export type Pages = Record<Page['id'], Page>;
