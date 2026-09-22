-- Table des demandes d'itinéraires (aperçu gratuit)
create table if not exists trip_requests (
  id uuid primary key default gen_random_uuid(),
  destination text not null,
  jours int not null,
  budget numeric,
  style text,
  created_at timestamptz default now()
);

alter table trip_requests enable row level security;

drop policy if exists "allow insert anon trip_requests" on trip_requests;
create policy "allow insert anon trip_requests"
  on trip_requests for insert
  to anon
  with check (true);

drop policy if exists "allow select anon trip_requests" on trip_requests;
create policy "allow select anon trip_requests"
  on trip_requests for select
  to anon
  using (true);

-- Table des commandes (achat de l'itinéraire complet à 29€)
create table if not exists trip_orders (
  id uuid primary key default gen_random_uuid(),
  email text not null,
  destination text,
  status text default 'pending',
  created_at timestamptz default now()
);

alter table trip_orders enable row level security;

drop policy if exists "allow insert anon trip_orders" on trip_orders;
create policy "allow insert anon trip_orders"
  on trip_orders for insert
  to anon
  with check (true);

drop policy if exists "allow select anon trip_orders" on trip_orders;
create policy "allow select anon trip_orders"
  on trip_orders for select
  to anon
  using (true);
