"use client";

import { signOut } from "next-auth/react";
import Link from "next/link";

// eslint-disable-next-line @typescript-eslint/no-explicit-any
export default function Navbar({ user }: { user: any }) {
  return (
    <nav className="bg-white shadow p-4 flex justify-between items-center">
      <div className="flex items-center gap-6">
        <Link href="/dashboard" className="font-bold text-lg">
          TS Immo
        </Link>
        <Link href="/proprietaires">Propriétaires</Link>
        <Link href="/locataires">Locataires</Link>
        <Link href="/proprietes">Propriétés</Link>
        <Link href="/loyers">Loyers</Link>
        <Link href="/rapports">Rapports</Link>
      </div>
      <div className="flex items-center gap-4">
        <span className="text-gray-600">{user?.email}</span>
        <button
          onClick={() => signOut({ callbackUrl: "/login" })}
          className="bg-red-500 hover:bg-red-600 text-white px-3 py-1 rounded"
        >
          Déconnexion
        </button>
      </div>
    </nav>
  );
}
