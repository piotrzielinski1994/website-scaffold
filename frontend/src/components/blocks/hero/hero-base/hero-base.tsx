import React from 'react';
import { HeroBaseProps } from './hero-base.types';
import S from './hero-base.styles';

const HeroBase = (props: HeroBaseProps) => {
  return (
    <S.Wrapper>
      <S.InnerWrapper>HERO BASE</S.InnerWrapper>
    </S.Wrapper>
  );
};

export default HeroBase;
