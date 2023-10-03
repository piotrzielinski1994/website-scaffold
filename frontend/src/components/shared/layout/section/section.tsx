import React from 'react';
import { SectionProps } from './section.types';

const Section = ({ htmlTag = 'section', children }: SectionProps) => {
  const CustomTag = htmlTag;
  return <CustomTag>{children}</CustomTag>
}

export default Section;
