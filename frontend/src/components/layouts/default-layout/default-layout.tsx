import { CommonLayoutProps } from '../layout/layout.types';
import Navbar from '../../shared/layout/navbar/navbar';
import Footer from '@/components/shared/layout/footer/footer';
import S from './default-layout.styles';

const DefaultLayout = ({ children, navbar }: CommonLayoutProps) => {
  return (
    <>
      <Navbar {...navbar} />
      <S.Main>{children}</S.Main>
      <Footer />
    </>
  );
};

export default DefaultLayout;
