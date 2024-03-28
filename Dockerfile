# Base
FROM node:18 AS base

WORKDIR /app

COPY package.json pnpm-lock.yaml pnpm-workspace.yaml ./

RUN npm install -g pnpm turbo

RUN pnpm install --frozen-lockfile

COPY . .

FROM base AS turbo-build

RUN turbo build

FROM node:18-slim AS production

WORKDIR /app

RUN apt-get update && apt-get install -y openssl libssl-dev && rm -rf /var/lib/apt/lists/*

RUN npm install -g pnpm

COPY pnpm-workspace.yaml pnpm-lock.yaml ./


COPY --from=turbo-build /app/apps/api/dist ./apps/api/dist
COPY --from=turbo-build /app/apps/client/dist ./apps/client/dist

COPY --from=turbo-build /app/apps/api/prisma ./apps/api/prisma

COPY --from=turbo-build /app/node_modules ./node_modules
COPY --from=turbo-build /app/apps/api/node_modules ./apps/api/node_modules
COPY --from=turbo-build /app/apps/client/node_modules ./apps/client/node_modules

EXPOSE 3000

COPY start.sh ./
RUN chmod +x start.sh

CMD ["./start.sh"]