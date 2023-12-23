import { ApiLanguage } from '@packages/types';
import { PropsWithChildren } from 'react';

export interface LanguageProviderProps extends PropsWithChildren {
  lang: ApiLanguage['code'];
}
