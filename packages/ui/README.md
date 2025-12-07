# TypeScript Monorepos Course

This repository contains the code and exercises for the TypeScript Monorepos course. The project is a seed catalog application built with Svelte, TypeScript, and Express.

## Prerequisites

- Node.js (version 22.16.0 or higher)
- ppnpm (version 10.0.0 or higher)
- Git

## Getting Started

### 1. Clone the Repository

```bash
git clone git@github.com:mike-north/ts-monorepos-v2.git
cd ts-monorepos-v2
```

### 2. Node Version Management

This project uses Node.js version 22.16.0. 

#### Volta
Volta is a great tool for managing node versions across different projects. Get it at [https://volta.sh](volta.sh)

You can install volta in any POSIX-compliant operating system that supports `curl` by running
```sh
curl https://get.volta.sh | bash
```
You may need to close and reopen your terminal before your can verify that your environment has volta installed
```sh
volta --version
> 2.0.2 
```

#### Nvm
If you have `nvm` (Node Version Manager) installed, you can automatically use the correct version:

```bash
nvm use
```

### 3. Install `pnpm` if you don't have it already
Make sure you have [`pnpm`](https://pnpm.io/) installed.

If you use `volta` you can just run
```sh
volta install pnpm
```
Alternatively you can follow [`pnpm`'s direct installation instructions](https://pnpm.io/installation)

### 3. Install Dependencies

Install all project dependencies using pnpm:

```bash
pnpm install
```

### 4. Test whether basic tasks work

```sh
pnpm run build      # Build the project
pnpm run lint       # Lint the project
pnpm run test       # Test the project
```

### 5. Test whether the `dev` script works

```sh
pnpm run dev
```
* You should be able to go to http://localhost:3000/api/seeds in a browser and see some JSON
* You should be able to go to http://localhost:5173/ and see a UI that looks like this

## Available Scripts

### Development Scripts

- **`pnpm run dev`** - Start both the server and client in development mode with hot reload
  - Runs the Express server and Vite dev server concurrently
  - Server runs on the backend, client runs on the frontend
  - Uses colored output to distinguish between server (yellow) and client (blue) logs

- **`pnpm run dev-server`** - Start only the Express server in development mode
  - Runs the backend API server using `tsx`

- **`pnpm run dev-client`** - Start only the Vite development server
  - Runs the frontend Svelte application

### Build Scripts

- **`pnpm run build`** - Build the project for production
  - Creates optimized build files in the `dist` directory

- **`pnpm run preview`** - Preview the production build locally
  - Serves the built application for testing

### Testing Scripts

- **`pnpm run test`** - Run tests once (no watch mode)
  - Useful for CI/CD pipelines

- **`pnpm run test:watch`** - Run tests in watch mode
  - Uses Vitest for running tests
  - Automatically re-runs tests when files change

- **`pnpm run test:ui`** - Run tests with Vitest UI
  - Opens a web interface for running and viewing tests

- **`pnpm run test:coverage`** - Run tests with coverage report
  - Generates code coverage reports

### Quality Assurance Scripts

- **`pnpm run check`** - Run TypeScript and Svelte type checking
  - Validates TypeScript types across the project

- **`pnpm run lint`** - Run ESLint to check code quality
  - Checks for code style and potential issues

## Project Structure

```
ts-monorepos-v2/
├── src/
│   ├── server/          # Express server code
│   ├── lib/             # Shared library code
│   ├── models/          # Data models
│   └── utils/           # Utility functions
├── tests/               # Test files
├── public/              # Static assets
├── dist/                # Build output (generated)
└── coverage/            # Test coverage reports (generated)
```

## Tech Stack

- **Frontend**: Svelte 5, TypeScript, Tailwind CSS, DaisyUI
- **Backend**: Express.js, TypeScript
- **Build Tool**: Vite
- **Testing**: Vitest, Testing Library
- **Linting**: ESLint
- **Styling**: Tailwind CSS, PostCSS, Sass

## Getting Started with Development

1. **Start the development environment**:
   ```bash
   pnpm run dev
   ```

2. **Run tests**:
   ```bash
   pnpm run test
   ```

3. **Check code quality**:
   ```bash
   pnpm run lint
   pnpm run check
   ```

4. **Build for production**:
   ```bash
   pnpm run build
   pnpm run preview
   ```

## Course Workflow

This repository is designed to support a hands-on TypeScript monorepos course. Throughout the course, you'll work with:

- TypeScript configuration and compilation
- Monorepo structure and organization
- Shared libraries and dependencies
- Build tools and bundling
- Testing strategies
- Code quality and linting

Happy coding! 🚀
