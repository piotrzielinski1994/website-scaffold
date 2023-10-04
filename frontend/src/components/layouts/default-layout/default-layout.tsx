import { CommonLayoutProps } from '../layout/layout.types';
import Footer from '@/components/shared/layout/footer/footer';
import S from './default-layout.styles';
import Header from '@/components/shared/layout/header/header';

const DefaultLayout = ({ children, header }: CommonLayoutProps) => {
  return (
    <>
      <Header {...header} />
      <S.Main>{children}</S.Main>
      <Footer />
    </>
  );
};

export default DefaultLayout;
