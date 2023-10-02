export interface NavbarProps {
  items: MenuItem[];
}

interface MenuItem {
  label: string;
  href: string;
  items?: MenuItem[];
}
