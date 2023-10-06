module.exports = {
  parser: '@typescript-eslint/parser',
  plugins: ['@typescript-eslint'],
  ignorePatterns: ['node_modules'],
  rules: {
    'import/no-anonymous-default-export': 'off',
  },
};
