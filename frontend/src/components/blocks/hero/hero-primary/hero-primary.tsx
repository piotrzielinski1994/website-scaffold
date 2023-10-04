import React from 'react';
import { HeroPrimaryProps } from './hero-primary.types';

const HeroPrimary = ({ heading }: HeroPrimaryProps) => {
  return <div>
    <h1>Hero Primary</h1>
    <h2>{heading}</h2>
  </div>;
};

export default HeroPrimary;
