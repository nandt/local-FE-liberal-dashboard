FROM node:22-bookworm-slim
RUN apt-get update && apt-get install -y --no-install-recommends git ca-certificates \
    && rm -rf /var/lib/apt/lists/*
RUN corepack enable
ENV HUSKY=0
ENV NEXT_TELEMETRY_DISABLED=1
WORKDIR /app
CMD ["sh","-c","pnpm install --config.dangerouslyAllowAllBuilds=true && pnpm exec next dev -p 3000 -H 0.0.0.0"]
