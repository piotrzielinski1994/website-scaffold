import { createGlobalStyle } from 'styled-components';

const GlobalStyles = createGlobalStyle`
  *, *::before, *::after {
    box-sizing: border-box;
  }

  html {
    font-size: ${({ theme }) => theme.font.size};
  }

  body {
    margin: 0;
  }

  #root {
    min-height: 100vh;
    display: grid;
  }

  img {
    display: block;
    max-width: 100%;
  }
`;

export default GlobalStyles;
