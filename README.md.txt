# Migration Order

This folder contains step-by-step SQL changes to build and evolve the MPMS database schema.

| Order | File                         | Purpose                          |
|-------|------------------------------|----------------------------------|
| 001   | `init.sql`                   | Creates core tables              |
| 002   | `add_audit.sql`              | Adds audit table and trigger     |
| 003   | `vpd_policy.sql`             | Adds VPD function and policy     |
| 004   | `add_reviewed_by_column.sql` | Adds column to job_assignments   |

Ensure these run in order, especially in new environments.
