import { getServerSession } from "next-auth";
import { redirect } from "next/navigation";
import { authOptions } from "@/lib/auth";
import LogoutButton from "@/components/LogoutButton";

export default async function DashboardPage() {
  const session = await getServerSession(authOptions);

  if (!session) {
    redirect("/login");
  }

  return (
    <div className="p-6">
      <h1 className="text-2xl font-bold">
        Bienvenue {session.user?.name || "Utilisateur"}
      </h1>
      <p className="mt-2">
        Vous êtes connecté en tant que {session.user?.email}
      </p>
      <div className="mt-4">
        <LogoutButton />
      </div>
    </div>
  );
}
