import { ReactNode } from "react";
import { NavbarProps } from "../navbar/navbar.types";

export interface LayoutProps extends CommonLayoutProps {
  layout: 'default';
}

export interface CommonLayoutProps {
  children: ReactNode;
  navbar: NavbarProps;
}
