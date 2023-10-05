import styled from 'styled-components';
import Section from '@/components/shared/layout/section/section';

const Wrapper = styled(Section).attrs({
  htmlTag: 'footer',
})`
  align-self: end;
  border: 2px solid green;
`;

export default {
  Wrapper,
};
