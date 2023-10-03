import { CommonLayoutProps } from "../layout/layout.types";
import Navbar from "../../shared/layout/navbar/navbar";

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
