import { Hono } from 'hono';
import { eq } from 'drizzle-orm';
import { drizzle } from 'drizzle-orm/d1';

import { properties } from './db/schema';

export type Env = {
  DB: D1Database;
};

const api = new Hono<{ Bindings: Env }>();
api
  .get('/properties', async (c) => {
    const db = drizzle(c.env.DB);
    const result = await db.select().from(properties).all();
    return c.json(result);
  })

const app = new Hono();
app.route('/api', api);

export default app;
