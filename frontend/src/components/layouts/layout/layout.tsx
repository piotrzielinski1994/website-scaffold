'use client';

import React, { lazy, useMemo } from 'react';
import { LayoutProps } from './layout.types';
import LanguageProvider from '@/components/providers/language/language.provider';

const DefaultLayout = lazy(() => import('../default-layout/default-layout'));

const Layout = ({ lang, layout, ...props }: LayoutProps) => {
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
  }, [layout, props]);

  return (
    <html lang={lang}>
      <body>
        <div id="root">
          <LanguageProvider lang={lang}>{template}</LanguageProvider>
        </div>
        <div id="portal"></div>
      </body>
    </html>
  );
};

export default Layout;
