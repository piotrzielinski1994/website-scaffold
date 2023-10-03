'use client';

import React, { PropsWithChildren, createContext, useMemo, useState } from 'react';
import { useServerInsertedHTML } from 'next/navigation';
import { ServerStyleSheet, StyleSheetManager, ThemeProvider } from 'styled-components';
import lightTheme from '@/theme/light.theme';
import { Theme } from '@/theme/theme.types';

const ThemeSetterContext = createContext<(theme: Theme) => void>(() => undefined);

const StylesProvider = ({ children }: PropsWithChildren) => {
  // Only create stylesheet once with lazy initial state
  // x-ref: https://reactjs.org/docs/hooks-reference.html#lazy-initial-state
  const [styledComponentsStyleSheet] = useState(() => new ServerStyleSheet());
  const [theme, setTheme] = useState(lightTheme);
  const content = useMemo(() => {
    return (
      <ThemeProvider theme={theme}>
        <ThemeSetterContext.Provider value={setTheme}>{children}</ThemeSetterContext.Provider>
      </ThemeProvider>
    );
  }, [theme, setTheme]);

  useServerInsertedHTML(() => {
    const styles = styledComponentsStyleSheet.getStyleElement();
    styledComponentsStyleSheet.instance.clearTag();
    return styles;
  });

  if (typeof window !== 'undefined') return content;

  return (
    <StyleSheetManager sheet={styledComponentsStyleSheet.instance}>{content}</StyleSheetManager>
  );
};

export default StylesProvider;
