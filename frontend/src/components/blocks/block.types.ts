import { Model } from '@/api/common.types';
import { HeroPrimaryBlock } from './hero/hero-primary/hero-primary.types';

export type BlockProps = HeroPrimaryBlock;

export interface Block<T extends BlockType, P> {
  type: T;
  id: Model['id'];
  props: P;
}

const blockPrefix = 'block';
export enum BlockType {
  HERO_PRIMARY = `${blockPrefix}_hero_primary`,
}
