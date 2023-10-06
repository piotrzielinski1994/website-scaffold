import { getImageProps } from './image.helpers';
import S from './image.styles';
import { ImageProps } from './image.types';

const Image = ({ className, priority = 'lazyload', ...props }: ImageProps) => {
  const { defaultImageProps, extendedSrcsetPerBreakpoint } = getImageProps({ ...props, priority });

  return (
    <S.Wrapper className={className}>
      {extendedSrcsetPerBreakpoint.map(([breakpoint, srcSet]) => {
        return <source key={breakpoint} media={`(min-width:${breakpoint})`} srcSet={srcSet} />;
      })}

      <S.Img {...defaultImageProps} />
    </S.Wrapper>
  );
};

export default Image;
