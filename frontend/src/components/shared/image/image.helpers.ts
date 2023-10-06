import { Breakpoint } from '@/theme/theme.types';
import NextImage, { unstable_getImgProps as getImgProps } from 'next/image';
import { ComponentProps } from 'react';
import { GetImagePropsOptions } from './image.types';

export const getImageProps = (options: GetImagePropsOptions) => {
  const commonProps: ComponentProps<typeof NextImage> = {
    src: options.src,
    alt: options.alt,
    width: options.width,
    height: options.height,
    loading: options.priority === 'lazyload' ? 'lazy' : 'eager',
    priority: options.priority === 'preload',

    // Next.js enforces to add width/height attributes and adds inline styles
    // In case we want to disable this mechanism:
    // width: 0,
    // height: 0,
    // sizes: '100vw',
    // style: { width: undefined, height: undefined, color: undefined },
  };
  const defaultImageProps = getImgProps(commonProps).props;
  const extendedSrcsetPerBreakpoint = Object.entries(options.srcsets).sort(
    ([breakpointA], [breakpointB]) => {
      return parseInt(breakpointB) - parseInt(breakpointA);
    },
  ) as [Breakpoint, string][];

  return {
    defaultImageProps,
    extendedSrcsetPerBreakpoint,
  };
};
