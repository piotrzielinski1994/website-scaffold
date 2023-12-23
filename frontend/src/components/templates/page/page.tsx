'use client';

import Block from '@/components/blocks/block';
import { PageTemplateProps } from './page.types';
import { useLanguage } from '@/components/providers/language/language.provider';

const PageTemplate = ({ page }: PageTemplateProps) => {
  const lang = useLanguage();
  return page.content[lang].map((block) => <Block key={block.id} {...block} />);
};

export default PageTemplate;
