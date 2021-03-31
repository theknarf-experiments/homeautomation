const express = require('express');
const graphqlmiddleware = require('../src/index.js');

const app = express();
const port = 3000;

app.use('/graphql', graphqlmiddleware());

app.listen(port, () => {
  console.log(`GraphQL api listening at http://localhost:${port}/graphql`);
});
