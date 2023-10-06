'use client';

import { BlockType } from '@/api/blocks/blocks.types';
import { lazy } from 'react';
import { BlockProps } from './block.types';

const HeroPrimary = lazy(() => import('./hero/hero-primary/hero-primary'));

const Block = ({ type, props }: BlockProps) => {
  switch (type) {
    case BlockType.HERO_PRIMARY:
      return <HeroPrimary {...props} />;
  }
};

export default Block;
