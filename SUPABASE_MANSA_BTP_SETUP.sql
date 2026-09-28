-- MANSA BTP — configuration Supabase Storage
-- 1) Dans Supabase > Storage, créez un bucket nommé: site-images
-- 2) Rendez le bucket PUBLIC (lecture des images du site).
-- 3) Collez ensuite ce SQL dans SQL Editor > New query > Run.

create policy "MANSA BTP - lecture publique"
on storage.objects for select
to public
using (bucket_id = 'site-images');

create policy "MANSA BTP - upload admin"
on storage.objects for insert
to authenticated
with check (bucket_id = 'site-images');

create policy "MANSA BTP - modification admin"
on storage.objects for update
to authenticated
using (bucket_id = 'site-images')
with check (bucket_id = 'site-images');

create policy "MANSA BTP - suppression admin"
on storage.objects for delete
to authenticated
using (bucket_id = 'site-images');

-- IMPORTANT : dans Authentication > Users, garde uniquement le compte administrateur
-- créé pour MANSA BTP et désactive les inscriptions publiques si elles sont activées.
