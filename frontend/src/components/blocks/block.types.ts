export type BlockProps = Block<BlockType, unknown>;

export interface Block<T extends BlockType, P> {
  type: BlockType;
  props: P;
}

const blockPrefix = 'block';
export enum BlockType {
  HERO_PRIMARY = `${blockPrefix}_hero_primary`,
}
