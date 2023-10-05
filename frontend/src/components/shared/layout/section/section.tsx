'use client';

import React from 'react';
import { SectionClassname, SectionProps } from './section.types';
import S from './section.styles';
import Container from '../container/container';

const Section = ({ htmlTag = 'section', children, className, id }: SectionProps) => {
  return (
    <S.Wrapper as={htmlTag} className={className} id={id}>
      <Container className={SectionClassname.CONTAINER}>{children}</Container>
    </S.Wrapper>
  );
};

export default Section;
