import React from 'react';
import { NavbarProps } from './navbar.types';

const Navbar = ({ items }: NavbarProps) => {
  return <header>
    <nav>
      <ul>
        {items.map(({ label, href }) => {
          return <li key={href}>
            <a href={href}>{label}</a>
          </li>
        })}
      </ul>
    </nav>
  </header>
}

export default Navbar;
