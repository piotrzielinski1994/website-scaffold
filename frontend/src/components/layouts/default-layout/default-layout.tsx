import { CommonLayoutProps } from "../layout/layout.types";
import Navbar from "../navbar/navbar";

const DefaultLayout = ({ children, navbar }: CommonLayoutProps) => {
  return (
    <html lang="en">
      <body>
        <Navbar {...navbar}/>
        {children}
      </body>
    </html>
  )
}

export default DefaultLayout;
