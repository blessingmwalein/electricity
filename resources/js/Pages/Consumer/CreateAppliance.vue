
<script >
import AppLayout from '@/Layouts/AppLayout.vue';
import InputError from '@/Components/InputError.vue';
import { Head, Link, useForm } from '@inertiajs/vue3';

export default {
    name: "Tokens",
    props: ['appliances'],
    components: {
        AppLayout,
        InputError
    },
    data() {
        return {
            form: useForm({
                power_rating: 0,
                appliance_id: '',

            })
        }
    },

    methods: {
        submit() {
            this.form.post(route('store.consumer.appliances'));
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
                        <h4 class="text-xl font-medium text-black dark:text-white mb-4">Add Appliance</h4>
                    </div>
                    <div class="p-6">
                        <form @submit.prevent="submit">


                            <div class="mb-4">

                                <label class="w-1/4 mb-0 mr-10 dark:text-white rtl:mr-0">Power Rating:</label>
                                <input type="number" v-model="form.power_rating"
                                    class="w-full px-4 py-2 border rounded outline-none placeholder-secondary-400 dark:border-secondary-800 dark:bg-dark-card focus:border-primary-500 focus:shadow dark:focus:border-primary-500 text-sm rtl:mr-[3rem]"
                                    placeholder="Full name">
                                <InputError class="mt-2" :message="form.errors.power_rating" />


                            </div>

                            <div class="mb-4">

                                <label class="w-1/4 mb-0 mr-10 dark:text-white text-sm rtl:mr-0">Appliance:</label>
                                <select id="selectInput" v-model="form.appliance_id"
                                    class="block w-full px-4 py-2 text-secondary-500 bg-white border dark:focus:border-primary-500 dark:border-secondary-800 dark:bg-dark-card rounded outline-none focus:border-primary-500 focus:shadow">
                                    <option selected="">Select Appliance</option>
                                    <option :value="appliance.id" v-for="appliance in appliances">{{ appliance.name }}
                                    </option>
                                </select>
                                <InputError class="mt-2" :message="form.errors.appliance_id" />
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
