import { Block, BlockType } from "../../block.types";

export interface HeroPrimaryProps {
  heading?: string;
}

export type HeroPrimaryBlock = Block<BlockType.HERO_PRIMARY, HeroPrimaryProps>
