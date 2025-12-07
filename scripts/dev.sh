#!/bin/bash
pnpm dlx concurrently -n "Server,Models,Client" \
    -c "yellow,pink,blue" \
    "pnpm --filter=server run dev"  \
    "pnpm --filter=models run dev" \
    "pnpm --filter=client run dev"