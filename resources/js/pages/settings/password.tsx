import PasswordController from '@/actions/App/Http/Controllers/Settings/PasswordController';
import InputError from '@/components/input-error';
import AppLayout from '@/layouts/app-layout';
import SettingsLayout from '@/layouts/settings/layout';
import { type BreadcrumbItem } from '@/types';
import { Transition } from '@headlessui/react';
import { Form, Head } from '@inertiajs/react';
import { useRef, useState, useEffect } from 'react';
import { Eye, EyeOff } from 'lucide-react';

import HeadingSmall from '@/components/heading-small';
import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
import { Label } from '@/components/ui/label';
import { useToast } from '@/components/ui/toast';
import { edit } from '@/routes/settings/password';

const breadcrumbs: BreadcrumbItem[] = [
    {
        title: 'Pengaturan Kata Sandi',
        href: edit().url,
    },
];

export default function Password() {
    const passwordInput = useRef<HTMLInputElement>(null);
    const currentPasswordInput = useRef<HTMLInputElement>(null);

    const [showCurrentPassword, setShowCurrentPassword] = useState(false);
    const [showNewPassword, setShowNewPassword] = useState(false);
    const [showConfirmPassword, setShowConfirmPassword] = useState(false);

    return (
        <AppLayout breadcrumbs={breadcrumbs}>
            <Head title="Pengaturan Kata Sandi" />

            <SettingsLayout>
                <div className="space-y-6">
                    <HeadingSmall
                        title="Perbarui Kata Sandi"
                        description="Pastikan akun Anda menggunakan kata sandi yang panjang dan acak agar tetap aman"
                    />

                    <Form
                        {...PasswordController.update.form()}
                        options={{
                            preserveScroll: true,
                        }}
                        resetOnError={[
                            'password',
                            'password_confirmation',
                            'current_password',
                        ]}
                        resetOnSuccess
                        onError={(errors) => {
                            if (errors.password) {
                                passwordInput.current?.focus();
                            }

                            if (errors.current_password) {
                                currentPasswordInput.current?.focus();
                            }
                        }}
                        className="space-y-6"
                    >
                        {({ errors, processing, recentlySuccessful }) => {
                            const { showToast } = useToast();

                            useEffect(() => {
                                if (recentlySuccessful) {
                                    showToast('Kata sandi berhasil diubah!', 'success');
                                }
                            }, [recentlySuccessful]);

                            return (<>
                                <div className="grid gap-2">
                                    <Label htmlFor="current_password">
                                        Kata Sandi Saat Ini
                                    </Label>

                                    <div className="relative mt-1">
                                        <Input
                                            id="current_password"
                                            ref={currentPasswordInput}
                                            name="current_password"
                                            type={showCurrentPassword ? 'text' : 'password'}
                                            className="block w-full pr-10"
                                            autoComplete="current-password"
                                            placeholder="Kata sandi saat ini"
                                        />
                                        <button
                                            type="button"
                                            className="absolute inset-y-0 right-0 flex items-center pr-3 text-neutral-400 hover:text-neutral-600"
                                            onClick={() => setShowCurrentPassword(!showCurrentPassword)}
                                        >
                                            {showCurrentPassword ? (
                                                <EyeOff className="h-4 w-4" />
                                            ) : (
                                                <Eye className="h-4 w-4" />
                                            )}
                                        </button>
                                    </div>

                                    <InputError
                                        message={errors.current_password}
                                    />
                                </div>

                                <div className="grid gap-2">
                                    <Label htmlFor="password">
                                        Kata Sandi Baru
                                    </Label>

                                    <div className="relative mt-1">
                                        <Input
                                            id="password"
                                            ref={passwordInput}
                                            name="password"
                                            type={showNewPassword ? 'text' : 'password'}
                                            className="block w-full pr-10"
                                            autoComplete="new-password"
                                            placeholder="Kata sandi baru"
                                        />
                                        <button
                                            type="button"
                                            className="absolute inset-y-0 right-0 flex items-center pr-3 text-neutral-400 hover:text-neutral-600"
                                            onClick={() => setShowNewPassword(!showNewPassword)}
                                        >
                                            {showNewPassword ? (
                                                <EyeOff className="h-4 w-4" />
                                            ) : (
                                                <Eye className="h-4 w-4" />
                                            )}
                                        </button>
                                    </div>

                                    <InputError message={errors.password} />
                                </div>

                                <div className="grid gap-2">
                                    <Label htmlFor="password_confirmation">
                                        Konfirmasi Kata Sandi
                                    </Label>

                                    <div className="relative mt-1">
                                        <Input
                                            id="password_confirmation"
                                            name="password_confirmation"
                                            type={showConfirmPassword ? 'text' : 'password'}
                                            className="block w-full pr-10"
                                            autoComplete="new-password"
                                            placeholder="Konfirmasi kata sandi"
                                        />
                                        <button
                                            type="button"
                                            className="absolute inset-y-0 right-0 flex items-center pr-3 text-neutral-400 hover:text-neutral-600"
                                            onClick={() => setShowConfirmPassword(!showConfirmPassword)}
                                        >
                                            {showConfirmPassword ? (
                                                <EyeOff className="h-4 w-4" />
                                            ) : (
                                                <Eye className="h-4 w-4" />
                                            )}
                                        </button>
                                    </div>

                                    <InputError
                                        message={errors.password_confirmation}
                                    />
                                </div>

                                <div className="flex items-center gap-4">
                                    <Button
                                        disabled={processing}
                                        data-test="update-password-button"
                                    >
                                        Simpan Kata Sandi
                                    </Button>

                                    <Transition
                                        show={recentlySuccessful}
                                        enter="transition ease-in-out"
                                        enterFrom="opacity-0"
                                        leave="transition ease-in-out"
                                        leaveTo="opacity-0"
                                    >
                                        <p className="text-sm text-neutral-600">
                                            Tersimpan
                                        </p>
                                    </Transition>
                                </div>
                            </>);
                        }}
                    </Form>
                </div>
            </SettingsLayout>
        </AppLayout>
    );
}
