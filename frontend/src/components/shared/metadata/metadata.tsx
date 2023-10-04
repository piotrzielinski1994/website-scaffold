import React from 'react';
import { MetadataProps } from './metadata.types';

const Metadata = ({ title, description, image }: MetadataProps) => {
  return <>
    <title>{title}</title>
    {description && <meta property='og:description' content={description} />}
    {image && <meta property='og:image' content={image} />}
  </>
}

export default Metadata;
