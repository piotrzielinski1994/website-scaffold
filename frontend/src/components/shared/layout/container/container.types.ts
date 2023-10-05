import { PropsWithChildren } from 'react';

export interface ContainerProps extends PropsWithChildren {
  className?: string;
  id?: string;
}

const stylesPrefix = 'container';
export enum ContainerClassname {
  WRAPPER = stylesPrefix,
}
