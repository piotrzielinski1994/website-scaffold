import StylesProvider from '@/components/providers/styles.provider';
import { PropsWithChildren } from 'react';

export default function RootLayout({ children }: PropsWithChildren) {
  return <StylesProvider>{children}</StylesProvider>;
}
