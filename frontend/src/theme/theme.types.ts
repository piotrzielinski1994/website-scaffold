export interface Theme {
  color: {
    textDefault: TakeColorWithOpacity;
    bgDefault: TakeColorWithOpacity;
    primary: TakeColorWithOpacity;
    secondary: TakeColorWithOpacity;
  };
  font: {
    family: {
      default: string;
      primary: string;
    };
    size: Size;
  };
  sizing: {
    maxWidth: {
      lg: Size;
    };
    spacing: {
      md: Size;
    };
  };
  component: {};
}

export interface ThemeSetter {
  setColorPalette: (palette: Theme['color']) => void;
  setFontSize: (fontSize: Theme['font']['size']) => void;
}

export type Color = `hsl(${number}, ${number}%, ${number}%, ${number})`;
export type Hsl = [number, number, number];

export const Palette = {
  BLACK: [255, 0, 0],
  BLUE: [240, 100, 50],
  RED: [0, 100, 50],
  WHITE: [255, 100, 100],
} satisfies Record<string, Hsl>;

type Sizing = 'xs2' | 'xs' | 'sm' | 'md' | 'lg' | 'xl' | 'xl2';
export type Breakpoint = '480px' | '768px' | '992px' | '1350px';
type Size = `${number}${'px' | 'rem'}`;
type TakeColorWithOpacity = (opacity?: number) => Color;
