import Image from '@/components/shared/image/image';
import HeroBase from '../hero-base/hero-base';
import { HeroPrimaryProps } from './hero-primary.types';

const HeroPrimary = ({ heading, image }: HeroPrimaryProps) => {
  return (
    <HeroBase>
      <h1>Hero Primary</h1>
      <h2>{heading}</h2>
      <Image
        alt=""
        src={`http://backend:3001/assets/${image}`}
        srcsets={{
          '480px': 'https://placehold.co/600x100',
          '768px': 'https://placehold.co/600x200',
          '992px': 'https://placehold.co/600x300',
          '1350px': 'https://placehold.co/600x400',
        }}
      />
    </HeroBase>
  );
};

export default HeroPrimary;
