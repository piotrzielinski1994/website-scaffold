export interface NavbarProps {
  items: MenuItem[];
}

export interface MenuItem {
  label: string;
  href: string;
  items?: MenuItem[];
}
