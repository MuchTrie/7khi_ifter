import { type BreadcrumbItem, type SharedData } from '@/types';
import { Head, usePage } from '@inertiajs/react';

import HeadingSmall from '@/components/heading-small';
import { Label } from '@/components/ui/label';
import AppLayout from '@/layouts/app-layout';
import SettingsLayout from '@/layouts/settings/layout';
import { edit } from '@/routes/profile';

const breadcrumbs: BreadcrumbItem[] = [
    {
        title: 'Profile settings',
        href: edit().url,
    },
];

export default function Profile() {
    const { auth } = usePage<SharedData>().props;

    return (
        <AppLayout breadcrumbs={breadcrumbs}>
            <Head title="Pengaturan Profil" />

            <SettingsLayout>
                <div className="space-y-6">
                    <HeadingSmall
                        title="Informasi Profil"
                        description="Informasi akun Anda"
                    />

                    <div className="space-y-4">
                        <div className="grid gap-2">
                            <Label>Nama</Label>
                            <div className="mt-1 block w-full rounded-md border border-neutral-700 bg-neutral-800 px-3 py-2 text-neutral-200">
                                {String(auth.user.name)}
                            </div>
                        </div>

                        {auth.user.role !== 'siswa' && auth.user.username && (
                            <div className="grid gap-2">
                                <Label>Username</Label>
                                <div className="mt-1 block w-full rounded-md border border-neutral-700 bg-neutral-800 px-3 py-2 text-neutral-200">
                                    {String(auth.user.username)}
                                </div>
                            </div>
                        )}
                    </div>
                </div>
            </SettingsLayout>
        </AppLayout>
    );
}
