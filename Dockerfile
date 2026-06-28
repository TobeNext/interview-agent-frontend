FROM node:22-bookworm-slim AS build

WORKDIR /app

COPY interview-agent-frontend/package.json interview-agent-frontend/package-lock.json ./
RUN npm ci

COPY interview-agent-frontend/. .
COPY interview-agent-bff/src/modules/agent/interview-start-contract.ts /bff/src/modules/agent/interview-start-contract.ts
RUN ln -s /app/node_modules /bff/node_modules
RUN npm run build

FROM nginx:1.27-alpine AS runner

COPY interview-agent-frontend/nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=build /app/dist /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]