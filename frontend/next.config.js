/** @type {import('next').NextConfig} */
const nextConfig = {
  images: {
    remotePatterns: [
      {
        // TODO: Rework
        protocol: 'http',
        hostname: 'backend',
        port: '3001',
        pathname: '/assets/**',
      },
    ],
  },
};

module.exports = nextConfig;
