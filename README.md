# Nest/React/Prisma template

## Description

Just a small template with a simple fullstack setup that I like to start side projects easily.

- Based on Turborepo
- /api: Nestjs project
- /web: React project with Vite.
- Prisma ORM.
- Dockerfile for easy deployment

The frontend app is setup to be served from the Nestjs server as static assets for simplicity reasons.

## Table of Contents

- [Installation](#installation)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Installation

Generate and edit .env file:

```sh
sh scripts/setup.sh
```

Install dependencies:

```sh
pnpm install
```

Start services such as database:

```
make start-services
```

Make changes to the schema and run database migrations in development mode:

```sh
pnpm migrate
```

## Usage

Run in development mode:

```sh
pnpm dev
```

Then the client and api development servers will be running together.

## Contributing

[Explain how others can contribute to your project]

## License

[Specify the license under which your project is distributed]
