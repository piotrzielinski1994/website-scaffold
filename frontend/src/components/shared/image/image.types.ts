import { Breakpoint } from '@/theme/theme.types';
import { WithClassName } from '@/types/styles.types';
import { Image } from '@packages/types';

export interface ImageProps extends Partial<WithClassName>, Image {
  srcsets: Partial<Record<Breakpoint, string>>;
  priority?: 'preload' | 'lazyload' | 'default';
}

export interface GetImagePropsOptions extends Image {
  srcsets: ImageProps['srcsets'];
  priority: ImageProps['priority'];
}
