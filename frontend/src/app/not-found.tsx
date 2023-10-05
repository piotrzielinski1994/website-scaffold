import { takePageByPath } from '@/api/pages/pages.helpers';
import { getPages } from '@/api/pages/pages.requests';
import Layout from '@/components/layouts/layout/layout';
import { LayoutProps } from '@/components/layouts/layout/layout.types';
import { pagesToHeaderProps } from '@/components/shared/layout/header/header.transformers';
import React from 'react';

const NotFoundPage = async () => {
  const pages = await getPages();
  const page = takePageByPath(pages, '/');
  const layout: LayoutProps['layout'] = page?.layout ?? 'default';

  return (
    <Layout layout={layout} header={pagesToHeaderProps(pages)}>
      not found
    </Layout>
  );
};

export default NotFoundPage;
