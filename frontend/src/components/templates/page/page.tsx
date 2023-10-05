import React from 'react';
import { PageTemplateProps } from './page.types';
import Block from '@/components/blocks/block';

const PageTemplate = ({ page }: PageTemplateProps) => {
  return page.content.map((block) => <Block key={block.id} {...block} />);
};

export default PageTemplate;
