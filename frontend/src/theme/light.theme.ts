import { hsl } from "./theme.helpers";
import { Palette, Theme } from "./theme.types";

const lightTheme: Theme = {
  color: {
    textDefault: hsl(Palette.BLACK),
    bgDefault: hsl(Palette.WHITE),
    primary: hsl(Palette.RED),
    secondary: hsl(Palette.BLUE),
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

export default lightTheme;
