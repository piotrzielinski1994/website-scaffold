'use client';

import React, { PropsWithChildren, createContext, useMemo, useState } from 'react';
import { useServerInsertedHTML } from 'next/navigation';
import { ServerStyleSheet, StyleSheetManager, ThemeProvider } from 'styled-components';
import { Theme, ThemeSetter } from '@/theme/theme.types';
import GlobalStyles from '@/theme/theme.global';
import defaultTheme from '@/theme/theme';

const ThemeSetterContext = createContext<ThemeSetter>({
  setColorPalette: () => undefined,
  setFontSize: () => undefined,
});

const StylesProvider = ({ children }: PropsWithChildren) => {
  // Only create stylesheet once with lazy initial state
  // x-ref: https://reactjs.org/docs/hooks-reference.html#lazy-initial-state
  const [styledComponentsStyleSheet] = useState(() => new ServerStyleSheet());
  const [theme, setTheme] = useState(defaultTheme);
  const setFontSize = (fontSize: Theme['font']['size']) => {
    setTheme((prevTheme) => ({ ...prevTheme, font: { ...prevTheme.font, size: fontSize }}));
  }
  const setColorPalette = (palette: Theme['color']) => {
    setTheme((prevTheme) => ({ ...prevTheme, color: palette }));
  }
  const content = useMemo(() => {
    return (
      <ThemeProvider theme={theme}>
        <GlobalStyles />
        <ThemeSetterContext.Provider value={{ setFontSize, setColorPalette }}>{children}</ThemeSetterContext.Provider>
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
