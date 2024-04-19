import styled from 'styled-components';

const Wrapper = styled.div`
  display: grid;
  gap: ${({ theme }) => theme.sizing.spacing.md};
`;

const Label = styled.label``;

export default {
  Wrapper,
  Label,
};
