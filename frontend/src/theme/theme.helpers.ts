import { Color, Hsl } from "./theme.types";

export const hsl = ([hue, saturation, lightness]: Hsl) => (opacity = 1): Color => {
  return `hsl(${hue}, ${saturation}%, ${lightness}%, ${opacity})`;
}
