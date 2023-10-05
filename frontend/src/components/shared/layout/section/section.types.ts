import { PropsWithChildren } from 'react';

export interface SectionProps extends PropsWithChildren {
  htmlTag?: 'section' | 'div' | 'header' | 'footer' | 'article';
  className?: string;
  id?: string;
}

const stylesPrefix = 'section';
export enum SectionClassname {
  WRAPPER = stylesPrefix,
  CONTAINER = `${stylesPrefix}__container`,
}
