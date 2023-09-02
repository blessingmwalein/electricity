
<script >
import AppLayout from '@/Layouts/AppLayout.vue';
import InputError from '@/Components/InputError.vue';
import { Head, Link, useForm } from '@inertiajs/vue3';

export default {
    name: "Tokens",
    props: ['consumers'],
    components: {
        AppLayout,
        InputError
    },
    data() {
        return {
            form: useForm({
                name: '',
                email: '',
                password: '',
                address: '',
                password_confirmation: '',
                terms: false,
            })
        }
    },

    methods: {
        submit() {
            this.form.post(route('store.users'));
        }
    }

}
</script>

<template>
    <AppLayout>
        <div class="p-6 lg:p-8 footer-inner  mx-auto main-container ">


            <div class="w-full">
                <div class="flex flex-col mb-8 text-secondary-500 bg-white dark:bg-dark-card shadow rounded">
                    <div class="p-6 pb-0 border-b dark:border-secondary-800">
                        <h4 class="text-xl font-medium text-black dark:text-white mb-4">Create Consumer</h4>
                    </div>
                    <div class="p-6">
                        <form @submit.prevent="submit">
                            <div class="mb-4">

                                <label class="w-1/4 mb-0 mr-10 dark:text-white text-sm rtl:mr-0">Full Name:</label>
                                <input type="text" v-model="form.name"
                                    class="w-full px-4 py-2 border rounded outline-none placeholder-secondary-400 dark:border-secondary-800 dark:bg-dark-card focus:border-primary-500 focus:shadow dark:focus:border-primary-500 text-sm rtl:mr-[3rem]"
                                    placeholder="Enter Your Full Name">
                                <InputError class="mt-2" :message="form.errors.name" />


                            </div>
                            <div class="mb-4">

                                <label class="w-1/4 mb-0 mr-10 dark:text-white text-sm rtl:mr-0">Email:</label>
                                <input type="email" v-model="form.email"
                                    class="w-full px-4 py-2 border rounded outline-none placeholder-secondary-400 dark:border-secondary-800 dark:bg-dark-card focus:border-primary-500 focus:shadow dark:focus:border-primary-500 text-sm rtl:mr-[3rem]"
                                    placeholder="Enter Your email">
                                <InputError class="mt-2" :message="form.errors.email" />


                            </div>
                            <div class="mb-4">

                                <label class="w-1/4 mb-0 mr-10 dark:text-white text-sm rtl:mr-0">Address:</label>
                                <textarea v-model="form.address"
                                    class="w-full px-4 py-2 border dark:border-secondary-800 dark:text-white dark:bg-dark-card rounded outline-none focus:border-primary-500 focus:shadow dark:focus:border-primary-500"
                                    rows="5"></textarea>
                                <InputError class="mt-2" :message="form.errors.address" />


                            </div>
                            <div class="mb-4">

                                <label class="w-1/4 mb-0 mr-10 dark:text-white rtl:mr-0">Password:</label>
                                <input type="password" v-model="form.password"
                                    class="w-full px-4 py-2 border rounded outline-none placeholder-secondary-400 dark:border-secondary-800 dark:bg-dark-card focus:border-primary-500 focus:shadow dark:focus:border-primary-500 text-sm rtl:mr-[3rem]"
                                    placeholder="Enter Your password">
                                <InputError class="mt-2" :message="form.errors.password" />


                            </div>
                            <div class="mb-4">

                                <label class="w-1/4 mb-0 mr-10 dark:text-white rtl:mr-0">Password:</label>
                                <input type="password" v-model="form.password_confirmation"
                                    class="w-full px-4 py-2 border rounded outline-none placeholder-secondary-400 dark:border-secondary-800 dark:bg-dark-card focus:border-primary-500 focus:shadow dark:focus:border-primary-500 text-sm rtl:mr-[3rem]"
                                    placeholder="Enter Your password">
                                <InputError class="mt-2" :message="form.errors.password_confirmation" />


                            </div>

                            <div class="mb-4">
                                <button type="submit" class="btn btn-primary">Submit</button>
                            </div>
                        </form>
                    </div>
                </div>


            </div>


        </div>
    </AppLayout>
</template>
