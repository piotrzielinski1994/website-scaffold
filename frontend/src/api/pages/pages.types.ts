import { ApiWithPublicationStatus, ApiWithTimestamps, WithPublicationStatus, WithTimestamps } from "../common.types";

export interface ApiPage extends ApiWithTimestamps, ApiWithPublicationStatus {
  id: string;
  parent_page_id: string | null;
  sort: number | null;
  is_visible_in_navbar: boolean;
  slug: string | null;
  title: string;
}

export interface Page extends WithTimestamps, WithPublicationStatus {
  id: string;
  parentPageId: string | null;
  sort: number | null;
  isVisibleInNavbar: boolean;
  slug: string | null;
  title: string;
}
