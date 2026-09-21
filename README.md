# local-FE-liberal-dashboard — docker κέλυφος για το νέο dashboard

Το περιεχόμενο του `~/FE/` (21/09/2026): ό,τι χρειάζεται για να τρέξει τοπικά το Next.js dashboard
(`Liberal-dashboard`, branch `local/test-4480`) στο **http://localhost:3000**. Ο κώδικας του dashboard
**δεν** είναι εδώ — κάνεις clone το `Liberal-dashboard` μέσα σε αυτόν τον φάκελο ως `liberal-dashboard-app-web-v3/`.

| Αρχείο | Τι είναι |
|---|---|
| `docker-compose.yml` | service `fe-dashboard`, container `fe-dashboard-v3`, `network_mode: host`, mount `./liberal-dashboard-app-web-v3` → `/app`, `./perf-logs` → `/perf-logs` |
| `Dockerfile` | node + pnpm, Next.js dev με Turbopack |
| `.env.docker` | **τα env vars του dashboard** — 3 backends με τα OAuth τους: `develop` (develop.unicorndomain.gr), `LOCAL` (localhost:8100 = liberal-cms-d11), `ENV` (localhost:8120 = d12). Περιέχει client secrets — **μην το δημοσιεύσεις** |
| `.env.docker.bak*` | παλιότερες εκδόσεις του παραπάνω |
| `perf-logs/` | τα logs χρόνων API που γράφει το `/api/devlog` του dashboard (ανά ημέρα, `.log` + `.jsonl`) |

## Στήσιμο από το μηδέν

```bash
git clone git@github.com:nandt/local-FE-liberal-dashboard.git FE && cd FE
git clone -b local/test-4480 git@github.com:nandt/Liberal-dashboard.git liberal-dashboard-app-web-v3
docker compose up -d fe-dashboard
# http://localhost:3000/login → chips: develop / localhost old / env site
```
Αλλαγή στο `.env.docker` → `docker compose up -d --force-recreate fe-dashboard`.

## Σχετικά repos (nandt)

- `Liberal-dashboard` — ο κώδικας
- `liberal-cms` / `local-liberal-cms-` — τα backends που επιλέγονται από τα chips
