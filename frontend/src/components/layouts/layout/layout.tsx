'use client';

import React, { lazy, useMemo } from 'react';
import { LayoutProps } from './layout.types';

const DefaultLayout = lazy(() => import('../default-layout/default-layout'));

const Layout = ({ layout, ...props }: LayoutProps) => {
  const template = useMemo(() => {
    switch (layout) {
      case 'default': {
        return <DefaultLayout {...props} />;
      }
      default: {
        const exhaustiveCheck: never = layout;
        throw new Error(`Unhandled switch case for layout: ${exhaustiveCheck}`);
      }
    }
  }, [layout]);

  return (
    <html lang="en">
      <body>
        <div id="root">{template}</div>
        <div id="portal"></div>
      </body>
    </html>
  );
};

export default Layout;
