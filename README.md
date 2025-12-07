## Seeds Monorepo

TypeScript-first pnpm workspace for a tiny seed-catalog app: reusable domain models, an Express API serving seed data from YAML, and a Svelte + Tailwind client that visualizes the packets. The repo is wired for fast iterative work (pnpm, Nx target defaults) and consistent code quality (ESLint, Prettier, Vitest).

### Tech stack
- Workspace: pnpm 10, Volta-pinned Node 22, Lerna (versioning scaffold), Nx 22 (target defaults + caching), TypeScript 5.8.
- Domain models (`@seeds/models`): plain TypeScript models, emits `dist/` ESM + d.ts, API Extractor + API Documenter config for reference docs.
- API (`@seeds/server`): Express 5 + CORS, YAML-backed data loader, Winston structured logging, simple REST at `/api/seeds`.
- Web UI (`@seeds/client`): Svelte 5 + Vite 6, Tailwind CSS 4 + DaisyUI, Svelte stores for data fetching, typed against `@seeds/models`.
- Quality: Vitest 3 (plus Testing Library for Svelte/UI), ESLint 9, Prettier 3; optional coverage via `vitest --coverage`.

### Monorepo layout
```
packages/
	models/        # Domain types, API Extractor config, generated docs in docs/
	server/        # Express API, YAML data in data/seeds.yml, routes under src/
	ui/            # Svelte client, Tailwind 4 styling, Vite config
scripts/
	dev.sh         # Convenience script to run client/server/models in parallel (posix shell)
```

### Getting started
1) Install deps
- `pnpm install`

2) Run everything (posix shell required for the helper script)
- `pnpm dev` (calls `scripts/dev.sh` via concurrently). On Windows, run under Git Bash/WSL or start the processes below manually.

3) Run services individually (recommended on Windows)
- `pnpm --filter @seeds/models run build:watch`
- `pnpm --filter @seeds/server run dev` (default port 3000; set `PORT`/`LOG_LEVEL` if needed)
- `pnpm --filter @seeds/client run dev` (default Vite port 5173; add `-- --host` to expose)

### Core commands
- Test: `pnpm test` (repo-wide) or `pnpm --filter <pkg> run test`
- Lint: `pnpm lint` or `pnpm --filter <pkg> run lint`
- Type check: `pnpm --filter @seeds/client run check`, `pnpm --filter @seeds/server run build`, `pnpm --filter @seeds/models run build`
- Format: `pnpm format`
- Build artifacts: `pnpm --filter @seeds/models run build`, `pnpm --filter @seeds/server run build`, `pnpm --filter @seeds/client run build`

### API surface
- `GET /api/seeds` returns the seed packet collection loaded from `packages/server/data/seeds.yml`. The response shape follows `SeedPacketCollectionModel` from `@seeds/models`.

### Nx & caching
- `nx.json` defines target defaults (cached outputs for build/test/lint/check). When you add Nx project configs, `nx run <project>:<target>` will reuse those defaults and enable the Nx task graph/caching. For now, commands are run via package scripts and pnpm filters.

### Notes & troubleshooting
- `scripts/dev.sh` assumes a posix shell; on Windows prefer running the three commands under “Run services individually.”
- Tailwind CSS 4 (oxide) is listed in `onlyBuiltDependencies` for pnpm to prebuild native bits; ensure pnpm respects that on fresh installs.

### Techstack for configuring a scalable typescript monorepo

- pnpm-workspace - for managing multiple packages
- manypkg/cli - for formatting packages package.json files
- syncpack - for unifying packages dependencies versions
- @microsoft/api-extractor - for extracting typescript types info and generating docs
- @microsoft/api-documenter - for generating markdown docs from typescript types info
- nx - for orchestrating tasks along packages through affected graph with caching and interdependencies awareness
- lerna - for managing packages with multiple packages (uses nx under the hood)
- knip - for detecting unused dependencies, files, code and exports
- volta - for managing node version on machine and for syncing it along monorepo packages