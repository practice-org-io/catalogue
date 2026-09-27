# Catalogue Service — Dockerfile

Dockerfile for the **catalogue** service from the RoboShop e-commerce application. This is the reference multi-stage Dockerfile used across the practice repos.

## What It Does

- **Stage 1 (builder)** — Install npm dependencies and build the Node.js application
- **Stage 2 (runtime)** — Copy only the built artifacts to a clean Alpine image, create a non-root user, and run the service

## Key Patterns

- **Multi-stage build** — `FROM node:20.20.2-alpine3.23 AS builder` → `FROM node:20.20.2-alpine3.23`
- **Non-root user** — Creates `roboshop` system user, chowns `/app`, sets `USER roboshop`
- **Environment variables** — `MONGO_URL` for database connection, `MONGO` feature flag
- **Image pinning** — Specific node version, not `latest`
- **EXPOSE 8080** — Documented port for the service

## Quick Start

```bash
docker build -t catalogue .
docker run -p 8080:8080 catalogue
```