import { WithClassName } from '@/types/styles.types';
import { PropsWithChildren } from 'react';

export interface SectionProps extends PropsWithChildren, Partial<WithClassName> {
  htmlTag?: 'section' | 'div' | 'header' | 'footer' | 'article';
  id?: string;
}

const stylesPrefix = 'section';
export enum SectionClassName {
  WRAPPER = stylesPrefix,
  CONTAINER = `${stylesPrefix}__container`,
}
