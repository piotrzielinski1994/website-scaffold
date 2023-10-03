import React from 'react';
import { ContainerProps } from './container.types';
import S from './container.styles';

const Container = ({ className, id, children }: ContainerProps) => {
  return <S.Wrapper className={className} id={id}>{children}</S.Wrapper>
}

export default Container;
