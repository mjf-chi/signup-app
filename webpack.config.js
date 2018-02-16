const path = require('path');
const ExtractTextPlugin = require('extract-text-webpack-plugin');


module.exports = {
  entry: {
    app : [
      './src/elm/index.js'
    ]
  },

  output: {
    path: path.resolve(__dirname + '/dist'),
    filename: `[name].js`,
  },

  module: {
    rules: [
      {
        test: /\.(css|scss)$/,
        use: [
          'style-loader',
          'css-loader',
        ]
      },
      {
        test: /\.less$/,
        use: ExtractTextPlugin.extract({
                fallback: 'style-loader',
                use: 'css-loader!less-loader',
        })
      },
      {
        test: /\.html$/,
        exclude: /node_modules/,
        loader: 'file-loader?name=[name].[ext]',
      },
      {
        test: /\.elm$/,
        exclude: [/elm-stuff/, /node_modules/],
        loader: 'elm-webpack-loader?verbose=true&warn=true',
      },
      {
        test: /\.woff(2)?(\?v=[0-9]\.[0-9]\.[0-9])?$/,
        loader: 'url-loader?limit=10000&mimetype=application/font-woff',
      },
      {
        test: /\.(ttf|eot|svg)(\?v[0-9]\.[0-9]\.[0-9])?$/,
        loader: 'file-loader'
      },
    ],
    noParse: /\.elm$/,
  },

  plugins: [
    new ExtractTextPlugin('styles.css')
  ],

  devServer: {
    inline: true,
    stats: { colors: true },
  },
};
