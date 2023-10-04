import React from 'react';
import { HeaderProps } from './header.types';
import Section from '../section/section';
import Navbar from '../navbar/navbar';

const Header = ({ navbar }: HeaderProps) => {
  return (
    <Section htmlTag="header">
      <Navbar {...navbar} />
    </Section>
  );
};

export default Header;
