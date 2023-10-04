import { Pages } from '@/api/pages/pages.types';
import { HeaderProps } from './header.types';
import { pagesToMenuItems } from '../navbar/navbar.transformers';

export const pagesToHeaderProps = (pages: Pages): HeaderProps => {
  return {
    navbar: {
      items: pagesToMenuItems(pages),
    },
  };
};
