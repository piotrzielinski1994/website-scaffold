import React from 'react';
import { FooterProps } from './footer.types';
import S from './footer.styles';

const Footer = ({ children }: FooterProps) => {
  return <S.Wrapper>{children}</S.Wrapper>
}

export default Footer;
