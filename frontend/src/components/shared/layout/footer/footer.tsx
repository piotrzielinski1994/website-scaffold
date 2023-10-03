import React from 'react';
import Section from '@/components/shared/layout/section/section';
import { FooterProps } from './footer.types';

const Footer = ({ children }: FooterProps) => {
  return <Section htmlTag='footer'>{children}</Section>
}

export default Footer;
