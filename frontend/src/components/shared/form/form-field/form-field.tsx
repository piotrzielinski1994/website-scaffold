import s from './form-field.styles';
import { FormFieldProps } from './form-field.types';

const FormField = ({ label, children }: FormFieldProps) => {
  return (
    <s.Wrapper>
      <s.Label>{label}</s.Label>
      {children}
    </s.Wrapper>
  );
};

export default FormField;
