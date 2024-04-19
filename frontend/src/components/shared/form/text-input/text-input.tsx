import FormField from '@/shared/form/form-field/form-field';
import s from './text-input.styles';
import { TextInputProps } from './text-input.types';

const TextInput = ({ label }: TextInputProps) => {
  return (
    <FormField label={label}>
      <s.Input />
    </FormField>
  );
};

export default TextInput;
