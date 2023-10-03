import React from 'react';
import { NavbarProps } from './navbar.types';
import NavItem from './components/nav-item/nav-item';

const Navbar = ({ items }: NavbarProps) => {
  return <header>
    <nav>
      <ul>
        {items.map((item) => <NavItem key={item.href} {...item}/>)}
      </ul>
    </nav>
  </header>
}

export default Navbar;
