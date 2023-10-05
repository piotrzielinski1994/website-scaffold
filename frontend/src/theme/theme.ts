import { lightTheme } from './theme.colors';
import { defaultFontSize } from './theme.sizes';
import { Theme } from './theme.types';

const defaultTheme: Theme = {
  color: lightTheme,
  font: {
    size: defaultFontSize,
    family: {
      default: 'Arial',
      primary: 'Arial',
    },
  },
  sizing: {
    maxWidth: {
      lg: '1200px',
    },
    spacing: {
      md: '20px',
    },
  },
  component: {},
};

export default defaultTheme;
