import { existsSync, mkdirSync, writeFileSync } from 'fs';
import { dirname } from 'path';

const structure = [
  'src/app/api/auth/route.ts',
  'src/app/api/proprietaires/route.ts',
  'src/app/api/locataires/route.ts',
  'src/app/api/proprietes/route.ts',
  'src/app/api/locations/route.ts',
  'src/app/api/loyers/route.ts',
  'src/app/api/rapports/route.ts',
  'src/app/dashboard/page.tsx',
  'src/app/login/page.tsx',
  'src/app/register/page.tsx',
  'src/app/layout.tsx',
  'src/components/Navbar.tsx',
  'src/lib/auth.ts',
  'src/prisma/schema.prisma',
  'src/styles/globals.css',
  'src/types/index.d.ts',
  '.env.example'
];

structure.forEach(file => {
  const dir = dirname(file);
  if (!existsSync(dir)) {
    mkdirSync(dir, { recursive: true });
    console.log(`📁 Dossier créé : ${dir}`);
  }
  if (!existsSync(file)) {
    writeFileSync(file, '', 'utf8');
    console.log(`📄 Fichier créé : ${file}`);
  }
});

console.log("\n✅ Structure du projet créée avec succès !");
