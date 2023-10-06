import Block from '@/components/blocks/block';
import { PageTemplateProps } from './page.types';

const PageTemplate = ({ page }: PageTemplateProps) => {
  return page.content.map((block) => <Block key={block.id} {...block} />);
};

export default PageTemplate;
