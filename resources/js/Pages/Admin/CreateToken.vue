
<script >
import AppLayout from '@/Layouts/AppLayout.vue';
import InputError from '@/Components/InputError.vue';
import { Head, Link, useForm } from '@inertiajs/vue3';

export default {
    name: "Tokens",
    props: ['users'],
    components: {
        AppLayout,
        InputError
    },
    data() {
        return {
            unit_cost: 0.5,
            form: useForm({
                user_id: '',
                cost: '',
                units: '',
            })
        }
    },

    methods: {
        submit() {
            this.form.post(route('store.tokens'));
        },
        calculateUnits() {
            this.form.units = this.form.cost / this.unit_cost;
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
                        <h4 class="text-xl font-medium text-black dark:text-white mb-4">Create Token</h4>
                    </div>
                    <div class="p-6">
                        <form @submit.prevent="submit">
                            <div class="mb-4">

                                <label class="w-1/4 mb-0 mr-10 dark:text-white text-sm rtl:mr-0">Amount:</label>
                                <input type="number" v-model="form.cost" @input="calculateUnits()"
                                    class="w-full px-4 py-2 border rounded outline-none placeholder-secondary-400 dark:border-secondary-800 dark:bg-dark-card focus:border-primary-500 focus:shadow dark:focus:border-primary-500 text-sm rtl:mr-[3rem]"
                                    placeholder="Amount">
                                <InputError class="mt-2" :message="form.errors.cost" />


                            </div>
                            <div class="mb-4">

                                <label class="w-1/4 mb-0 mr-10 dark:text-white text-sm rtl:mr-0">Units:Watts</label>
                                <input type="number" v-model="form.units" disabled
                                    class="w-full px-4 py-2 border rounded outline-none placeholder-secondary-400 dark:border-secondary-800 dark:bg-dark-card focus:border-primary-500 focus:shadow dark:focus:border-primary-500 text-sm rtl:mr-[3rem]">
                                <InputError class="mt-2" :message="form.errors.units" />


                            </div>
                            <div class="mb-4">

                                <label class="w-1/4 mb-0 mr-10 dark:text-white text-sm rtl:mr-0">Consumer:</label>
                                <select id="selectInput" v-model="form.user_id"
                                    class="block w-full px-4 py-2 text-secondary-500 bg-white border dark:focus:border-primary-500 dark:border-secondary-800 dark:bg-dark-card rounded outline-none focus:border-primary-500 focus:shadow">
                                    <option selected="">Select user</option>
                                    <option :value="user.id" v-for="user in users">{{ user.name }}</option>
                                </select>
                                <InputError class="mt-2" :message="form.errors.user_id" />


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
