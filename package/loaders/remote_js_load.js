module.exports = {
  test: require.resolve('rails_com/package/remote_js_load'),
  use: [
    {
      loader: 'babel-loader',
      options: {
        cacheDirectory: 'tmp/cache/webpacker/babel-loader-node-modules',
        cacheCompression: false,
        compact: false
      }
    },
    {
      loader: 'expose-loader',
      options: {
        expose: 'remote_js_loader',
        exportKey: 'default'
      }
    }
  ]
}