import { ReactNode } from 'react';
import { HeaderProps } from '@/components/shared/layout/header/header.types';

export interface LayoutProps extends CommonLayoutProps {
  layout: 'default';
}

export interface CommonLayoutProps {
  children: ReactNode;
  header: HeaderProps;
}
