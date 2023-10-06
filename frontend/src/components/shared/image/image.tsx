import { getImageProps } from './image.helpers';
import S from './image.styles';
import { ImageProps } from './image.types';

const Image = ({ src, alt, srcsets, priority = 'lazyload', className }: ImageProps) => {
  const { defaultImageProps, extendedSrcsetPerBreakpoint } = getImageProps({
    src,
    alt,
    srcsets,
    priority,
  });

  return (
    <S.Wrapper className={className}>
      {/* <S.Img src={'http://localhost:3001/assets/c26700f1-2870-4aab-a66c-a3257237d5f1'} alt={alt} /> */}
      {/* {extendedSrcsetPerBreakpoint.map(([breakpoint, srcSet]) => {
        return <source key={breakpoint} media={`(min-width:${breakpoint})`} srcSet={srcSet} />;
      })} */}

      <S.Img {...defaultImageProps} />
    </S.Wrapper>
  );
};

export default Image;
