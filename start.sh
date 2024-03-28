#!/bin/sh
cd apps/api

echo "Running Prisma migrations..."
npx prisma migrate deploy

echo "Starting Node.js application..."
node dist/main