
<script >
import AppLayout from '@/Layouts/AppLayout.vue';
import { Link } from '@inertiajs/vue3';
export default {
    name: "Tokens",
    props: ['consumers', 'consumptions','totalWatts'],
    components: {
        AppLayout,
        Link
    },
    data() {
        return {
        }
    },

    methods: {
        deleteAppliance(id) {
            if (confirm('Are you sure you want to delete this appliance?')) {
                this.$inertia.delete(route('delete.appliances', id))

            }

        }
    }
}
</script>

<template>
    <AppLayout>

        <div class="p-6 lg:p-8 footer-inner  mx-auto main-container " x-bind:class="setting.page_layout">

            <div class="grid  grid-cols-1 lg:grid-cols-3 gap-8">
                <div class="grid-rows-3 lg:col-span-2">


                    <div
                        class="relative flex flex-col mb-8 md:mb-0  bg-white rounded shadow-lg dark:bg-dark-card grid gird-cols-1 lg:col-span-2">
                        <div class="flex flex-col overflow-hidden bg-white rounded-lg dark:bg-dark-card dark:text-white">
                            <div class=" relative flex flex-wrap justify-between p-5 border-b dark:border-secondary-800">
                                <div>
                                    <h4 class="dark:text-white mb-0">Consumption level Per House Hold</h4>
                                </div>

                            </div>
                            <div class="p-6">
                                <div class="border dark:border-secondary-800 rounded overflow-x-auto relative">

                                    <table
                                        class="min-w-full overflow-hidden divide-y divide-secondary-200 dark:divide-secondary-800 border dark:border-secondary-800">
                                        <thead>
                                            <tr class="bg-secondary-100 dark:bg-dark-bg">

                                                <th
                                                    class="px-6 py-4 text-left font-medium text-secondary-600 dark:text-white">
                                                    Consumer</th>
                                                <th
                                                    class="px-6 py-4 text-left font-medium text-secondary-600 dark:text-white">
                                                    Total Units</th>
                                                <th
                                                    class="px-6 py-4 text-left font-medium text-secondary-600 dark:text-white">
                                                    Total Used Units</th>

                                                <th
                                                    class="px-6 py-4 text-left font-medium text-secondary-600 dark:text-white">
                                                    Amount Spent</th>


                                            </tr>
                                        </thead>
                                        <tbody class="divide-y divide-secondary-200 dark:divide-secondary-800">
                                            <tr v-for="consumer in consumers.data">

                                                <td
                                                    class="px-6 py-4 whitespace-nowrap text-secondary-600 dark:text-secondary-500">
                                                    {{ consumer.name }}</td>

                                                <td class="px-6 py-4"><span
                                                        class="inline-block whitespace-nowrap px-2 py-1 text-xs text-center font-bold leading-none text-white bg-primary-500 rounded">{{
                                                            consumer.totalUnits }}watts</span>
                                                </td>
                                                <td class="px-6 py-4"><span
                                                        class="inline-block whitespace-nowrap px-2 py-1 text-xs text-center font-bold leading-none text-white bg-primary-500 rounded">{{
                                                            consumer.totalUsedUnits }}watts</span>
                                                </td>

                                                <td
                                                    class="px-6 py-4 whitespace-nowrap text-secondary-600 dark:text-secondary-500">
                                                    ${{ consumer.totalCost }}</td>

                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="grid-rows-3">
                    <div
                        class="relative flex flex-col mb-8  bg-primary-500 rounded shadow-lg dark:bg-dark-card dark:bg-primary-500">
                        <div class="bg-primary-500 rounded card portfolio-card">
                            <div class=" flex flex-wrap flex justify-between items-center p-6">
                                <div>
                                    <h6 class="mb-2 text-white">Top 20 Consuming Appliances</h6>

                                </div>
                                <div class="text-right">
                                    <svg width="20" height="20" viewBox="0 0 20 20" fill="none"
                                        xmlns="http://www.w3.org/2000/svg">
                                        <path opacity="0.4"
                                            d="M14.6756 0H5.33333C1.92889 0 0 1.92889 0 5.33333V14.6667C0 18.0711 1.92889 20 5.33333 20H14.6756C18.08 20 20 18.0711 20 14.6667V5.33333C20 1.92889 18.08 0 14.6756 0Z"
                                            fill="white"></path>
                                        <path
                                            d="M5.36866 7.36914C4.91533 7.36914 4.54199 7.74247 4.54199 8.2047V15.0758C4.54199 15.5291 4.91533 15.9025 5.36866 15.9025C5.83088 15.9025 6.20421 15.5291 6.20421 15.0758V8.2047C6.20421 7.74247 5.83088 7.36914 5.36866 7.36914Z"
                                            fill="white"></path>
                                        <path
                                            d="M10.0357 4.08887C9.58232 4.08887 9.20898 4.4622 9.20898 4.92442V15.0755C9.20898 15.5289 9.58232 15.9022 10.0357 15.9022C10.4979 15.9022 10.8712 15.5289 10.8712 15.0755V4.92442C10.8712 4.4622 10.4979 4.08887 10.0357 4.08887Z"
                                            fill="white"></path>
                                        <path
                                            d="M14.6402 10.9956C14.178 10.9956 13.8047 11.3689 13.8047 11.8312V15.0756C13.8047 15.5289 14.178 15.9023 14.6314 15.9023C15.0936 15.9023 15.4669 15.5289 15.4669 15.0756V11.8312C15.4669 11.3689 15.0936 10.9956 14.6402 10.9956Z"
                                            fill="white"></path>
                                    </svg>
                                    <p class="mb-0 text-white mt-2">{{ totalWatts }}watts</p>
                                </div>
                            </div>
                            <div class="p-4">
                                <h4 class="mb-3 text-white">Appliances</h4>
                                <div class="flex items-center justify-between mb-5" v-for="consumption in consumptions">
                                    <div class="flex items-center">

                                        <div class="ml-2">
                                            <h6 class="text-white mb-0 mr-2">{{ consumption.user_appliance.appliance.name }} -{{ consumption.user_appliance.user.name }}</h6>
                                            <p class="mb-0 text-white mr-2">Units used:{{ consumption.units_used }}watts</p>
                                        </div>
                                    </div>
                                    <h5 class="text-white">${{ consumption.units_used * 0.5  }}</h5>
                                </div>

                            </div>
                        </div>
                    </div>

                </div>
            </div>

        </div>
    </AppLayout>
</template>
