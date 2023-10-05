import styled from 'styled-components';
import { SectionClassname } from './section.types';

const Wrapper = styled.section.attrs({
  className: SectionClassname.WRAPPER,
})`
  background-color: ${({ theme }) => theme.color.secondary(0.2)};
  border: 2px solid red;
`;

export default {
  Wrapper,
};
