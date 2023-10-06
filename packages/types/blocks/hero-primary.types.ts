import { ApiImage, Image } from '@packages/types/common.types';
import { ApiBlockDeclaration, BlockDeclaration, BlockType } from './blocks.types';

export type ApiBlockHeroPrimary = ApiBlockDeclaration<
  'block_hero_primary',
  {
    heading: string | null;
    image: ApiImage | null;
  }
>;

export type BlockHeroPrimary = BlockDeclaration<
  'block_hero_primary',
  {
    heading: ApiBlockHeroPrimary['item']['heading'];
    image: Image | null;
  }
>;
