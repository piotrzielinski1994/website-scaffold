import { ApiWithPublicationStatus, ApiWithTimestamps, WithPublicationStatus, WithTimestamps } from "../common.types";

export interface ApiPage extends ApiWithTimestamps, ApiWithPublicationStatus {
  id: string;
  parent_page: ApiPage['id'] | null;
  subpages: ApiPage['id'][];
  sort: number | null;
  is_visible_in_navbar: boolean;
  slug: string | null;
  layout: 'default';
  title: string;
  description: string | null;
  image: string | null;
  content: [];
}

export interface Page extends WithTimestamps, WithPublicationStatus {
  id: ApiPage['id'];
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
  content: ApiPage['content'];
}

export type Pages = Record<Page['id'], Page>; 
