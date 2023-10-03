import { PropsWithChildren } from "react";

export interface SectionProps extends PropsWithChildren {
  htmlTag?: 'section' | 'div' | 'header' | 'footer' | 'article';
}
