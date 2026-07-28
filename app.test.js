const request = require('supertest');
const app = require('./app');

describe('GET /', () => {
  it('should return 200 OK and JSON welcome message', async () => {
    const res = await request(app).get('/');
    expect(res.statusCode).toEqual(200);
    expect(res.body).toHaveProperty('message');
  });
});

describe('GET /health', () => {
  it('should return status UP', async () => {
    const res = await request(app).get('/health');
    expect(res.statusCode).toEqual(200);
    expect(res.body.status).toEqual('UP');
  });
});
