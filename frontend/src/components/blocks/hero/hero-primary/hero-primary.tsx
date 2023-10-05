import React from 'react';
import { HeroPrimaryProps } from './hero-primary.types';
import HeroBase from '../hero-base/hero-base';

const HeroPrimary = ({ heading }: HeroPrimaryProps) => {
  return (
    <HeroBase>
      <h1>Hero Primary</h1>
      <h2>{heading}</h2>
    </HeroBase>
  );
};

export default HeroPrimary;
