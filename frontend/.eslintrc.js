module.exports = {
  extends: ['next/core-web-vitals', '@packages/configs'],
  rules: {
    'import/no-anonymous-default-export': 'off',
    '@typescript-eslint/no-explicit-any': 'error',
  },
};
