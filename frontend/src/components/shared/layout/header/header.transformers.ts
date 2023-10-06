import { Pages } from '@packages/types/pages/pages.types';
import { pagesToMenuItems } from '../navbar/navbar.transformers';
import { HeaderProps } from './header.types';

export const pagesToHeaderProps = (pages: Pages): HeaderProps => {
  return {
    navbar: {
      items: pagesToMenuItems(pages),
    },
  };
};
