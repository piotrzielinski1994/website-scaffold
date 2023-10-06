import { Model } from '@packages/types/common.types';
import { ApiBlockHeroPrimary, BlockHeroPrimary } from './hero-primary.types';

export type ApiBlock = ApiBlockHeroPrimary;

export type Block = BlockHeroPrimary;

// ==========================================

export interface ApiBlockDeclaration<T extends BlockType, P> {
  collection: T;
  item: Model & P;
}

export interface BlockDeclaration<T extends BlockType, P> {
  type: T;
  id: Model['id'];
  props: P;
}

// ==========================================

const blockPrefix = 'block';
export enum BlockType {
  HERO_PRIMARY = `${blockPrefix}_hero_primary`,
}
