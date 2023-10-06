import { WithClassName } from '@/types/styles.types';
import { PropsWithChildren } from 'react';

export interface ContainerProps extends PropsWithChildren, Partial<WithClassName> {
  id?: string;
}

const stylesPrefix = 'container';
export enum ContainerClassName {
  WRAPPER = stylesPrefix,
}
