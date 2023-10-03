import styled from "styled-components";
import { SectionClassname } from "./section.types";

const Wrapper = styled.section.attrs({ className: SectionClassname.WRAPPER })`
  max-width: ${({ theme }) => theme.sizing.maxWidth.lg};
  background-color: ${({ theme }) => theme.color.secondary(0.5)};
  border: 2px solid red;
`;

export default {
  Wrapper,
};
