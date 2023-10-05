import Link from 'next/link';
import React from 'react';
import { NavItemProps } from './nav-item.types';

const NavItem = ({ label, href, items }: NavItemProps) => {
  return (
    <li>
      <Link href={href}>{label}</Link>
    </li>
  );
};

export default NavItem;
