
<script >
import AppLayout from '@/Layouts/AppLayout.vue';

export default {
    name: "Tokens",
    props: ['meters'],
    components: {
        AppLayout
    },
    data() {
        return {
        }
    },
}
</script>

<template>
    <AppLayout>

        <div class="p-6 lg:p-8 footer-inner  mx-auto main-container ">
            <div class="flex flex-wrap contet-inner">
                <div class="flex-auto w-full">
                    <div class="relative flex flex-col mb-8  bg-white dark:bg-dark-card shadow rounded">
                        <div class="flex justify-between flex-auto p-5 border-b dark:border-secondary-800 rounded">
                            <h4 class="mb-0 dark:text-secondary-200">Meters</h4>
                        </div>
                        <div class="pb-6 pt-2 px-0">
                            <div class="overflow-x-auto">
                                <div class=" overflow-x-auto p-5">

                                    <table
                                        class="min-w-full overflow-hidden divide-y divide-secondary-200 dark:divide-secondary-800 border dark:border-secondary-800">
                                        <thead>
                                            <tr class="bg-secondary-100 dark:bg-dark-bg">

                                                <th
                                                    class="px-6 py-4 text-left font-medium text-secondary-600 dark:text-white">
                                                    User </th>
                                                <th
                                                    class="px-6 py-4 text-left font-medium text-secondary-600 dark:text-white">
                                                    Meter Number</th>
                                                <th
                                                    class="px-6 py-4 text-left font-medium text-secondary-600 dark:text-white">
                                                    Current Units</th>



                                                <th
                                                    class="px-6 py-4 text-left font-medium text-secondary-600 dark:text-white">
                                                    Create Date</th>

                                            </tr>
                                        </thead>
                                        <tbody class="divide-y divide-secondary-200 dark:divide-secondary-800">
                                            <tr v-for="meter in meters">


                                                <td
                                                    class="px-6 py-4 whitespace-nowrap text-secondary-600 dark:text-secondary-500">
                                                    {{ meter.user.name }}</td>
                                                <td class="px-6 py-4"><span
                                                        class="inline-block whitespace-nowrap px-2 py-1 text-xs text-center font-bold leading-none text-white bg-primary-500 rounded">{{
                                                            meter.meter_number }}</span>
                                                </td>

                                                <td class="px-6 py-4"><span
                                                        class="inline-block whitespace-nowrap px-2 py-1 text-xs text-center font-bold leading-none text-white bg-primary-500 rounded">{{
                                                            meter.current_units }}watts</span>
                                                </td>



                                                <td
                                                    class="px-6 py-4 whitespace-nowrap text-secondary-600 dark:text-secondary-500">
                                                    {{ meter.created_at }}</td>

                                            </tr>

                                        </tbody>
                                    </table>

                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </AppLayout>
</template>
