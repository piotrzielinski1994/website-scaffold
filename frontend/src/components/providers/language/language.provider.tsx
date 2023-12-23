'use client';

import React, { createContext, useContext } from 'react';
import { ApiLanguage } from '@packages/types';
import { LanguageProviderProps } from './language.provider.types';

export const LanguageContext = createContext<ApiLanguage['code']>('en-US');

const LanguageProvider = ({ lang, children }: LanguageProviderProps) => {
  return <LanguageContext.Provider value={lang}>{children}</LanguageContext.Provider>;
};

export const useLanguage = () => {
  console.log('@@@ asd | ');
  return useContext(LanguageContext);
};

export default LanguageProvider;
