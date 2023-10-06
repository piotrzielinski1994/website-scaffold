import { ApiImage, Image } from '@packages/types/common.types';
import { ApiBlockDeclaration, BlockDeclaration, BlockType } from './blocks.types';

export type ApiBlockHeroPrimary = ApiBlockDeclaration<
  BlockType.HERO_PRIMARY,
  {
    heading: string | null;
    image: ApiImage | null;
  }
>;

export type BlockHeroPrimary = BlockDeclaration<
  BlockType.HERO_PRIMARY,
  {
    heading: ApiBlockHeroPrimary['item']['heading'];
    image: Image | null;
  }
>;
