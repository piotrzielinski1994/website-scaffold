import { ReactNode } from "react";
import { NavbarProps } from "../../shared/layout/navbar/navbar.types";

export interface LayoutProps extends CommonLayoutProps {
  layout: 'default';
}

export interface CommonLayoutProps {
  children: ReactNode;
  navbar: NavbarProps;
}
