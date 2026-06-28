# Interview Agent - Frontend

Vue 3 + TypeScript frontend for the AI Interview Practice System. Handles resume upload, interview setup, streaming chat, session recovery, progress display, and feedback submission.

## Architecture

```
Interview Agent - Frontend (Vue 3 + Vite)
  ├── Views
  │   ├── ResumeUploadView  — Resume upload & JD input
  │   └── AgentChatView     — Streaming interview chat
  ├── Components
  │   ├── ResumeUploadCard  — Drag-and-drop file upload
  │   └── InterviewReportBell — Report ready notification
  ├── Services
  │   ├── bff-api           — HTTP client to BFF
  │   ├── agent-stream      — SSE stream consumer
  │   └── interview-*       — Session recovery, progress, validation
  ├── Stores (Pinia)
  │   └── upload            — Resume upload state
  └── Schemas               — Zod validation for interview setup & feedback
```

## Tech Stack

- **Vue 3** (Composition API, `<script setup>`)
- **TypeScript** (strict mode)
- **Vite** (dev server & build)
- **Pinia** (state management)
- **Vue Router** (SPA routing)
- **Vitest** (unit testing with jsdom)
- **Zod** (runtime validation)
- **Nginx** (production serving)

## Development

```bash
npm install
npm run dev             # Start Vite dev server (http://localhost:4173)
npm test                # Run unit tests
npm run test:coverage   # Run tests with coverage
npm run build           # Type-check + production build
npm run preview         # Preview production build
```

The dev server proxies `/api` requests to the BFF at `http://localhost:3000`.

## Docker

```bash
docker build -t interview-agent-frontend .
docker run -p 8080:80 interview-agent-frontend
```

The Docker image serves the built static files via Nginx on port 80.

## Sibling Repositories

| Repository | Description |
|------------|-------------|
| [Interview Agent - BFF](https://github.com/TobeNext/interview-agent-bff) | NestJS backend-for-frontend |
| [Interview Agent - Langgraph](https://github.com/TobeNext/interview-agent-langgraph) | Python LangGraph interview runtime |
| [Interview Agent - Mastra](https://github.com/TobeNext/interview-agent-mastra) | Archived legacy Mastra runtime |
