import { ApiBlock, Block, BlockType } from '@packages/types/blocks/blocks.types';
import { ApiImage, Image } from '@packages/types/common.types';

export const apiBlockToBlock = (apiBlock: ApiBlock): Block => {
  switch (apiBlock.collection) {
    case BlockType.HERO_PRIMARY: {
      return {
        type: apiBlock.collection,
        id: apiBlock.item.id,
        props: {
          heading: apiBlock.item.heading,
          image: apiBlock.item.image && apiImageToImage(apiBlock.item.image),
        },
      };
    }
  }
};

const apiImageToImage = (image: ApiImage): Image => {
  return {
    src: image.id,
    alt: image.description ?? '',
    width: image.width,
    height: image.height,
  };
};
