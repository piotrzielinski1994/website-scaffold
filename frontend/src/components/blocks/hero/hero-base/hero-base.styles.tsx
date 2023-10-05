import styled from 'styled-components';
import Section from '@/components/shared/layout/section/section';
import Container from '@/components/shared/layout/container/container';
import { HeroBaseClassname } from './hero-base.types';

export const Wrapper = styled(Section).attrs({
  className: HeroBaseClassname.WRAPPER,
})``;
export const InnerWrapper = styled(Container).attrs({
  className: HeroBaseClassname.CONTAINER,
})``;

export default {
  Wrapper,
  InnerWrapper,
};
