const express = require('express')
const winston = require('winston')
const winstonGlobalMeta = require('winston-meta-wrapper')
const WinstonElasticSearch = require('winston-elasticsearch')
const app = express()

// Create a winston logger instance
const logger = winstonGlobalMeta(
  new winston.Logger({
    level: 'info',
    transports:
      process.env.NODE_ENV === 'production'
        ? [new WinstonElasticSearch({clientOpts: { host: 'http://elasticsearch:9200' }})]
        : [new winston.transports.Console({ colorize: true, timestamp: true })]
  })
)

// Add some metadata to all outputs
logger.addMeta({ container: 'api' })

// Add a route and do some fun logging
app.get('*', function(req, res) {
  logger.info('Incoming API request', {
    method: 'GET',
    path: req.path,
    duration: Math.random() * 100
  })

  res.send({ method: 'GET', path: req.path })
})

// Start em up!
app.listen(3000, function() {
  logger.info('Listening on port 3000')
})
