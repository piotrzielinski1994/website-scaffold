import { PropsWithChildren } from 'react';

export interface HeroBaseProps extends PropsWithChildren {}

const stylesPrefix = 'hero-base';
export enum HeroBaseClassname {
  WRAPPER = stylesPrefix,
  CONTAINER = `${stylesPrefix}__container`,
}
