module.exports = {
  extends: ['next/core-web-vitals', '@packages/configs/.eslintrc'],
  rules: {
    'import/no-anonymous-default-export': 'off',
    '@typescript-eslint/no-explicit-any': 'error',
  },
};
