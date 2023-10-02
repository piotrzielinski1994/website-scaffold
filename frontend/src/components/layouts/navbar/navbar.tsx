import React from 'react';
import { NavbarProps } from './navbar.types';
import Link from 'next/link';

const Navbar = ({ items }: NavbarProps) => {
  return <header>
    <nav>
      <ul>
        {items.map(({ label, href }) => {
          return <li key={href}>
            <Link href={href}>{label}</Link>
          </li>
        })}
      </ul>
    </nav>
  </header>
}

export default Navbar;
