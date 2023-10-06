import S from './hero-base.styles';
import { HeroBaseProps } from './hero-base.types';

const HeroBase = ({ children }: HeroBaseProps) => {
  return (
    <S.Wrapper>
      <S.InnerWrapper>{children ?? 'HERO BASE'}</S.InnerWrapper>
    </S.Wrapper>
  );
};

export default HeroBase;
