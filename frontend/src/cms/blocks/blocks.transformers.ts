import { ApiBlock, Block } from '@packages/types/blocks/blocks.types';
import { ApiImage, Image } from '@packages/types/common.types';

export const apiBlockToBlock = (apiBlock: ApiBlock): Block => {
  const type = apiBlock.collection;
  switch (type) {
    case 'block_hero_primary': {
      return {
        type: apiBlock.collection,
        id: apiBlock.item.id,
        props: {
          heading: apiBlock.item.heading,
          image: apiBlock.item.image && apiImageToImage(apiBlock.item.image),
        },
      };
    }
    default: {
      const exhaustiveCheck: never = type;
      throw new Error(`Unhandled switch case for collection: ${exhaustiveCheck}`);
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
