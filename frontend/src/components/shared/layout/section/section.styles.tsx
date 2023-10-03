import styled from "styled-components";
import { SectionClassname } from "./section.types";

const Wrapper = styled.section.attrs({ className: SectionClassname.WRAPPER })`
  border: 2px solid red;
`;

export default {
  Wrapper,
};
