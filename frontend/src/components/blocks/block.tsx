import { lazy } from 'react';
import { BlockProps, BlockType } from './block.types';
import { HeroPrimaryProps } from './hero/hero-primary/hero-primary.types';
const HeroPrimary = lazy(() => import('./hero/hero-primary/hero-primary'));

const Block = ({ type, props }: BlockProps) => {
  switch (type) {
    case BlockType.HERO_PRIMARY:
      return <HeroPrimary {...props as HeroPrimaryProps} />;
  }
};

export default Block;
