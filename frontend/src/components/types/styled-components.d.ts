import { Theme } from '../../theme/theme.types';

declare module 'styled-components' {
  interface DefaultTheme extends Theme {}
}
