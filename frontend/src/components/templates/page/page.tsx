import React from 'react';
import { PageTemplateProps } from './page.types';

const PageTemplate = ({ page }: PageTemplateProps) => {
  return <div>Page: {page.title}</div>
}

export default PageTemplate;
