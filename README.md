### Development

1. Install dependencies

```
npm install
```

2. Generate database migrations

```
npm run db:generate
```

3. Create the D1 Database

```
npx wrangler d1 create rentiful
```

4. Add D1 database credentials to wrangler.toml
5. Run the local SQLite database

```
npm run db:up
```

6. Apply migrations to local database

```
npx wrangler d1 execute rentiful --local --file=./drizzle/migrations/<migration file name here>
```

7. Start development server

```
npm run dev
```

### Production

1. Apply migrations to D1 database on Cloudflare

```
npx wrangler d1 execute rentiful --remote --file=./drizzle/migrations/<migration file name here>
```

2. Deploy the application

```
npm run deploy
```
