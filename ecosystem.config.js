module.exports = {
  apps: [
    {
      name: 'repo-backend',
      script: 'babel-node --presets @babel/preset-env ./pg-server/index.js',
      interpreter: './node_modules/babel-cli/bin/babel-node.js ',
      args: null,
      instances: 1,
      autorestart: true,
      watch: true,
      max_memory_restart: '1G',
      env: {
        NODE_ENV: 'development',
        'cross-env': true,
        PORT: 4000
      },
      env_production: {
        NODE_ENV: 'production'
      }
    },
    {
      name: 'repo-frontend',
      script: 'babel-node --presets @babel/preset-env ./client.js',
      interpreter: './node_modules/babel-cli/bin/babel-node.js ',
      args: null,
      instances: 1,
      autorestart: true,
      watch: true,
      max_memory_restart: '1G',
      env: {
        NODE_ENV: 'development',
        'cross-env': true,
        PORT: 4000
      },
      env_production: {
        NODE_ENV: 'production'
      }
    },
    {
      name: 'repo-server',
      script: 'babel-node --presets @babel/preset-env ./pg-server/index.js',
      interpreter: './node_modules/babel-cli/bin/babel-node.js ',
      args: null,
      instances: 1,
      autorestart: true,
      watch: true,
      max_memory_restart: '1G',
      env: {
        NODE_ENV: 'development',
        'cross-env': true,
        PORT: 4000
      },
      env_production: {
        NODE_ENV: 'production'
      }
    }
  ]
}
