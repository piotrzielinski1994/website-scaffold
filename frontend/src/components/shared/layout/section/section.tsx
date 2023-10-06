'use client';

import Container from '../container/container';
import S from './section.styles';
import { SectionClassName, SectionProps } from './section.types';

const Section = ({ htmlTag = 'section', children, className, id }: SectionProps) => {
  return (
    <S.Wrapper as={htmlTag} className={className} id={id}>
      <Container className={SectionClassName.CONTAINER}>{children}</Container>
    </S.Wrapper>
  );
};

export default Section;
