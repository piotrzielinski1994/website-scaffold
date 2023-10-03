import React from 'react';
import { NavbarProps } from './navbar.types';
import NavItem from './components/nav-item/nav-item';
import Section from '../section/section';

const Navbar = ({ items }: NavbarProps) => {
  return <Section htmlTag='header'>
    <nav>
      <ul>
        {items.map((item) => <NavItem key={item.href} {...item}/>)}
      </ul>
    </nav>
  </Section>
}

export default Navbar;
