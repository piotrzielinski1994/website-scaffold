import { hsl } from "./theme.helpers";
import { Palette, Theme } from "./theme.types";

export const lightTheme: Theme['color'] = {
  textDefault: hsl(Palette.BLACK),
  bgDefault: hsl(Palette.WHITE),
  primary: hsl(Palette.RED),
  secondary: hsl(Palette.BLUE),
};
