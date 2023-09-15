import React from 'react';
import { headers } from 'next/headers';

const Page = () => {
  const path = headers().get('x-invoke-path');
  return <div>Page: {path}</div>
}

export default Page;
