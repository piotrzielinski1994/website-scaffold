import styled from "styled-components";
import { ContainerClassname } from "./container.types";

const Wrapper = styled.div.attrs({ className: ContainerClassname.WRAPPER })`
  margin-inline: auto;
  max-width: ${({ theme }) => theme.sizing.maxWidth.lg};
  border: 2px solid blue;
`;

export default {
  Wrapper,
}
