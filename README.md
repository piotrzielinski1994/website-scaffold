```bash
nvm use
npm i
npm run setup
npm start
```

```bash
docker-compose exec -t db pg_dump -U website-scaffold -d website-scaffold > ./backend/dumps/init.sql
```
