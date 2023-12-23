import { ReactNode } from 'react';
import { HeaderProps } from '@/components/shared/layout/header/header.types';
import { ApiLanguage } from '@packages/types';

export interface LayoutProps extends CommonLayoutProps {
  lang: ApiLanguage['code'];
  layout: 'default';
}

export interface CommonLayoutProps {
  children: ReactNode;
  header: HeaderProps;
}
