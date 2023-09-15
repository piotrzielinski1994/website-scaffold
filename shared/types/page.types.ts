import { Model } from './model.types';

export type Page = Model<'Page', {
  title: string;
  slug: string;
  publishedAt: string;
}>
