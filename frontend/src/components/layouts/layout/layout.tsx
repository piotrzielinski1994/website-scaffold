import React from 'react';
import { LayoutProps } from './layout.types';
import DefaultLayout from '../default-layout/default-layout';

const Layout = ({ layout, ...props }: LayoutProps) => {
  switch (layout) {
    case 'default': {
      return <DefaultLayout {...props} />
    }
  }
}

export default Layout;
