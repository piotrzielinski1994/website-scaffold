import { Breakpoint } from '@/theme/theme.types';
import { WithClassName } from '@/types/styles.types';

export interface ImageProps extends Partial<WithClassName> {
  src: string;
  alt: string;
  srcsets: Partial<Record<Breakpoint, string>>;
  priority?: 'preload' | 'lazyload' | 'default';
}

export interface GetImagePropsOptions {
  src: ImageProps['src'];
  alt: ImageProps['alt'];
  srcsets: ImageProps['srcsets'];
  priority: ImageProps['priority'];
}
