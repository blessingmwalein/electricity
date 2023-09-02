<script >
import AppLayout from '@/Layouts/AppLayout.vue';
import { Head, Link, router } from '@inertiajs/vue3';

export default {
    name: "Tokens",
    data() {
        return {
            //current dat in this format 15 APR 2020
            current_date: new Date().toLocaleDateString('en-GB', {
                day: 'numeric',
                month: 'short',
                year: 'numeric'
            }).replace(/ /g, '-'),
        }
    },
    props: ['meters', 'consumers', 'total_sold_units', 'total_used_units', 'tokens'],
    components: {
        AppLayout
    },
    methods: {
        calculateConsumption() {
            this.$inertia.post(route('admin.calculateConsumption'));
        }

    }
}

</script>

<template>
    <AppLayout>
        <div class="p-6 lg:p-8 footer-inner  mx-auto main-container " x-bind:class="setting.page_layout">
            <div class="grid grid-cols-1 lg:grid-cols-3 lg:gap-8">
                <div class="grid row-3 grid-cols-1 lg:col-span-4">
                    <h4 class="mb-4 rtl:mr-2 dark:text-white">Admin Dashboard</h4>
                    <div class="flex justify-right items-center mb-1">

                        <div class="flex justify-right items-center mb-1">
                            <button @click="calculateConsumption()" class="btn btn-primary mb-2">Calculate
                                Consumption</button>
                        </div>
                    </div>
                    <div class="grid lg:grid-cols-4 md:grid-cols-2 grid-cols-1 gap-8 mb-8 items-center">
                        <div class="bg-white shadow rounded dark:bg-dark-card p-6 text-center dark:text-white">
                            <h2 class="dark:text-white mb-4">{{ consumers }}</h2>
                            <h5 class="dark:text-white mb-0">Consumers</h5>
                        </div>
                        <div class="bg-white shadow rounded dark:bg-dark-card p-6 text-center">
                            <h2 class=" dark:text-white mb-4">{{ meters }}</h2>
                            <h5 class="dark:text-white mb-0">Meters</h5>
                        </div>
                        <div class="bg-white shadow rounded dark:bg-dark-card p-6 text-center">
                            <h2 class="dark:text-white mb-4">{{ total_sold_units }}watts</h2>
                            <h5 class=" dark:text-white mb-0">Units Sold</h5>
                        </div>
                        <div class="bg-white shadow rounded dark:bg-dark-card p-6 text-center">
                            <h2 class="dark:text-white mb-4">{{ total_used_units }}watts</h2>
                            <h5 class="dark:text-white mb-0">Units Consumed</h5>
                        </div>
                    </div>

                </div>

            </div>
            <div class="relative flex flex-col mb-8 md:mb-0 last-container bg-white rounded shadow-lg dark:bg-dark-card ">
                <div class="flex-wrap flex justify-between items-center p-4 border-b dark:border-secondary-800">
                    <div>
                        <h4 class="dark:text-white mb-0">Recent Issued Tokens</h4>
                    </div>

                </div>
                <div class="px-6 p-6">
                    <small class="dark:text-white text-secondary-600">{{ current_date }}</small>
                    <div class="flex items-center justify-between mt-3 mb-4 flex-wrap" v-for="token in tokens">
                        <div class="flex items-center">
                            <svg width="20" height="19" viewBox="0 0 20 19" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <path opacity="0.4"
                                    d="M15.554 4.79639C18.005 4.79639 20 6.85618 20 9.38782V14.4201C20 16.9456 18.01 19.0002 15.564 19.0002L4.448 19.0002C1.996 19.0002 0 16.9414 0 14.4098V9.3775C0 6.85205 1.991 4.79639 4.438 4.79639H5.378L15.554 4.79639Z"
                                    fill="#1AA053"></path>
                                <path
                                    d="M10.5459 13.5374L13.4549 10.5695C13.7549 10.2627 13.7549 9.76911 13.4529 9.46338C13.1509 9.15867 12.6639 9.15968 12.3639 9.46541L10.7709 11.0905L10.7709 0.782097C10.7709 0.35042 10.4259 0 9.99994 0C9.57494 0 9.23094 0.35042 9.23094 0.782097L9.23094 11.0905L7.63694 9.46541C7.33694 9.15968 6.84994 9.15867 6.54794 9.46338C6.39694 9.61675 6.32094 9.81685 6.32094 10.018C6.32094 10.217 6.39694 10.4171 6.54594 10.5695L9.45494 13.5374C9.59994 13.6847 9.79594 13.768 9.99994 13.768C10.2049 13.768 10.4009 13.6847 10.5459 13.5374Z"
                                    fill="#1AA053"></path>
                            </svg>
                            <div class="ml-3">
                                <h6 class="mb-0 dark:text-white mr-4">{{ token.user.name }}</h6>
                                <small class="dark:text-white mr-4 text-secondary-600">{{ token.token }}</small>
                            </div>
                        </div>
                        <div class="grid">
                            <small class="text-success-500 mb-0 dark:text-success-500">{{ token.units }} watts </small>
                            <small class="text-end mb-0 dark:text-white text-secondary-600">${{ token.cost }} RTGS</small>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </AppLayout>
</template>
