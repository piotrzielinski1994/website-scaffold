'use client';

import { BlockType } from '@packages/types/blocks/blocks.types';
import { lazy } from 'react';
import { BlockProps } from './block.types';

const HeroPrimary = lazy(() => import('./hero/hero-primary/hero-primary'));

const Block = ({ type, props }: BlockProps): JSX.Element => {
  switch (type) {
    case BlockType.HERO_PRIMARY:
      return <HeroPrimary {...props} />;
    default: {
      const exhaustiveCheck: never = type;
      throw new Error(`Unhandled switch case for type: ${exhaustiveCheck}`);
    }
  }
};

export default Block;
