import InputError from '@/components/input-error';
import { Button } from '@/components/ui/button';
import { Checkbox } from '@/components/ui/checkbox';
import { Input } from '@/components/ui/input';
import { Label } from '@/components/ui/label';
import { Spinner } from '@/components/ui/spinner';
import { store } from '@/routes/login';
import { Form, Head } from '@inertiajs/react';
import { useState } from 'react';

interface LoginProps {
    status?: string;
    canResetPassword: boolean;
    canRegister: boolean;
}

export default function Login({
    status,
    canResetPassword,
    canRegister,
}: LoginProps) {
    const [showPassword, setShowPassword] = useState(false);

    return (
        <>
            <Head title="Log in" />

            <div className="min-h-screen flex" style={{ background: 'linear-gradient(to bottom, #a8d8ea 0%, #d4f1f4 100%)' }}>
                {/* Left Side - Illustration */}
                <div className="hidden lg:flex lg:w-1/2 items-center justify-center p-12 relative">
                    <div className="absolute top-8 left-8 flex items-center gap-3">
                        <div className="w-12 h-12 bg-blue-600 rounded-full flex items-center justify-center">
                            <span className="text-white font-bold text-xl">S</span>
                        </div>
                        <span className="text-blue-700 font-bold text-xl">SMPN 37 BANDUNG</span>
                    </div>

                    {/* Sun and Cloud */}
                    <div className="absolute top-12 right-32">
                        <div className="relative">
                            <div className="w-32 h-32 bg-yellow-400 rounded-full blur-sm"></div>
                            <div className="absolute top-4 right-16 w-24 h-16 bg-white/80 rounded-full"></div>
                            <div className="absolute top-8 right-12 w-32 h-20 bg-white/60 rounded-full"></div>
                        </div>
                    </div>

                    {/* School Building Illustration */}
                    <div className="relative z-10">
                        <div className="relative">
                            {/* Tree on the left */}
                            <div className="absolute -left-40 top-20">
                                <div className="w-16 h-32 bg-green-600 rounded-full"></div>
                                <div className="w-16 h-40 bg-green-500 rounded-full -mt-20"></div>
                                <div className="w-4 h-24 bg-amber-800 mx-auto -mt-8"></div>
                            </div>

                            {/* Main Building */}
                            <div className="relative">
                                {/* Roof */}
                                <div className="w-96 h-0 border-l-[200px] border-l-transparent border-r-[200px] border-r-transparent border-b-[60px] border-b-red-500 mx-auto"></div>

                                {/* School Badge on Roof */}
                                <div className="absolute top-4 left-1/2 transform -translate-x-1/2 w-20 h-20 bg-blue-600 rounded-full flex items-center justify-center z-10">
                                    <span className="text-white font-bold text-xs">SMPN</span>
                                </div>

                                {/* Building Body */}
                                <div className="w-96 h-64 bg-yellow-500 relative">
                                    {/* School Name Plates */}
                                    <div className="absolute top-8 left-1/2 transform -translate-x-1/2 bg-white px-6 py-2 rounded-lg shadow">
                                        <span className="text-sm font-bold">SMPN 37 BANDUNG</span>
                                    </div>
                                    <div className="absolute top-20 left-1/2 transform -translate-x-1/2 bg-teal-500 px-6 py-1 rounded-lg shadow">
                                        <span className="text-xs text-white font-semibold">SMPN 37 BANDUNG</span>
                                    </div>

                                    {/* Door */}
                                    <div className="absolute bottom-0 left-1/2 transform -translate-x-1/2 w-24 h-32 bg-cyan-200 border-4 border-cyan-300"></div>

                                    {/* Windows */}
                                    <div className="absolute top-32 left-8 grid grid-cols-2 gap-2">
                                        <div className="w-12 h-16 bg-cyan-200 border-2 border-cyan-300"></div>
                                        <div className="w-12 h-16 bg-cyan-200 border-2 border-cyan-300"></div>
                                    </div>
                                    <div className="absolute top-32 right-8 grid grid-cols-3 gap-2">
                                        <div className="w-10 h-12 bg-cyan-200 border-2 border-cyan-300"></div>
                                        <div className="w-10 h-12 bg-cyan-200 border-2 border-cyan-300"></div>
                                        <div className="w-10 h-12 bg-cyan-200 border-2 border-cyan-300"></div>
                                    </div>
                                </div>

                                {/* Ground/Grass */}
                                <div className="w-[500px] h-32 bg-green-400 rounded-t-full -mt-4"></div>

                                {/* Flowers */}
                                <div className="absolute -bottom-4 left-20">
                                    <div className="flex gap-4">
                                        <div className="w-3 h-3 bg-yellow-300 rounded-full"></div>
                                        <div className="w-3 h-3 bg-yellow-300 rounded-full"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                {/* Right Side - Login Form */}
                <div className="w-full lg:w-1/2 flex items-center justify-center p-8">
                    <div className="w-full max-w-md">
                        {/* Header */}
                        <div className="text-right mb-8">
                            <h2 className="text-blue-700 font-bold text-2xl">Jurnal Harian</h2>
                        </div>

                        {/* Login Card */}
                        <div className="bg-white/90 backdrop-blur-sm rounded-2xl shadow-xl p-8">
                            <div className="mb-8">
                                <h1 className="text-2xl font-bold text-blue-700 mb-2">
                                    Login to your Account
                                </h1>
                                <p className="text-sm text-blue-600">
                                    with your registered Email Address
                                </p>
                            </div>

                            {status && (
                                <div className="mb-4 text-center text-sm font-medium text-green-600">
                                    {status}
                                </div>
                            )}

                            <Form
                                {...store.form()}
                                resetOnSuccess={['password']}
                                className="space-y-6"
                            >
                                {({ processing, errors }) => (
                                    <>
                                        {/* Email Field */}
                                        <div className="space-y-2">
                                            <Label htmlFor="email" className="text-gray-700 text-sm">
                                                Email address*
                                            </Label>
                                            <Input
                                                id="email"
                                                type="email"
                                                name="email"
                                                required
                                                autoFocus
                                                tabIndex={1}
                                                autoComplete="email"
                                                placeholder="Enter email address"
                                                className="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent text-black"
                                            />
                                            <InputError message={errors.email} />
                                        </div>

                                        {/* Password Field */}
                                        <div className="space-y-2">
                                            <Label htmlFor="password" className="text-gray-700 text-sm">
                                                Enter password*
                                            </Label>
                                            <div className="relative">
                                                <Input
                                                    id="password"
                                                    type={showPassword ? "text" : "password"}
                                                    name="password"
                                                    required
                                                    tabIndex={2}
                                                    autoComplete="current-password"
                                                    placeholder="Password"
                                                    className="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent pr-16 text-black"
                                                />
                                                <button
                                                    type="button"
                                                    onClick={() => setShowPassword(!showPassword)}
                                                    className="absolute right-3 top-1/2 transform -translate-y-1/2 text-sm text-blue-600 hover:text-blue-700 font-medium"
                                                    tabIndex={-1}
                                                >
                                                    {showPassword ? 'Hide' : 'Show'}
                                                </button>
                                            </div>
                                            <InputError message={errors.password} />
                                        </div>

                                        {/* Remember Me */}
                                        <div className="flex items-center space-x-2">
                                            <Checkbox
                                                id="remember"
                                                name="remember"
                                                tabIndex={3}
                                                className="border-blue-600"
                                            />
                                            <Label
                                                htmlFor="remember"
                                                className="text-sm text-gray-700 cursor-pointer"
                                            >
                                                Remember my password
                                            </Label>
                                        </div>

                                        {/* Login Button */}
                                        <Button
                                            type="submit"
                                            className="w-full bg-blue-600 hover:bg-blue-700 text-white font-semibold py-3 rounded-lg transition-colors"
                                            tabIndex={4}
                                            disabled={processing}
                                            data-test="login-button"
                                        >
                                            {processing && <Spinner />}
                                            Login
                                        </Button>
                                    </>
                                )}
                            </Form>
                        </div>
                    </div>
                </div>
            </div>
        </>
    );
}
