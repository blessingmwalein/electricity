
<script >
import AppLayout from '@/Layouts/AppLayout.vue';
import { Link } from '@inertiajs/vue3';
export default {
    name: "Tokens",
    props: ['appliances'],
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

        <div class="p-6 lg:p-8 footer-inner  mx-auto main-container ">
            <div class="flex flex-wrap contet-inner">
                <div class="flex-auto w-full">
                    <div class="relative flex flex-col mb-8  bg-white dark:bg-dark-card shadow rounded">
                        <div class="flex justify-between flex-auto p-5 border-b dark:border-secondary-800 rounded">
                            <h4 class="mb-0 dark:text-secondary-200">Appliances</h4>
                        </div>
                        <div class="pb-6 pt-2 px-0">
                            <div class="overflow-x-auto">
                                <div class=" overflow-x-auto p-5">
                                    <div class="flex flex-wrap justify-between my-6">

                                        <div class="flex justify-center items-center mb-1">
                                            <Link :href="'/consumer/appliance/create'" class="btn btn-primary mb-2">Add
                                            New
                                            Appliance</Link>
                                        </div>
                                    </div>
                                    <table
                                        class="min-w-full overflow-hidden divide-y divide-secondary-200 dark:divide-secondary-800 border dark:border-secondary-800">
                                        <thead>
                                            <tr class="bg-secondary-100 dark:bg-dark-bg">
                                                <th
                                                    class="px-6 py-4 text-left font-medium text-secondary-600 dark:text-white">
                                                    Icon</th>
                                                <th
                                                    class="px-6 py-4 text-left font-medium text-secondary-600 dark:text-white">
                                                    Name</th>
                                                <th
                                                    class="px-6 py-4 text-left font-medium text-secondary-600 dark:text-white">
                                                    Power Rating</th>
                                                <th
                                                    class="px-6 py-4 text-left font-medium text-secondary-600 dark:text-white">
                                                    Consumed Watts</th>

                                                <th
                                                    class="px-6 py-4 text-left font-medium text-secondary-600 dark:text-white">
                                                    Created Date</th>
                                                <th
                                                    class="px-6 py-4 text-left font-medium text-secondary-600 dark:text-white">
                                                    Action</th>
                                            </tr>
                                        </thead>
                                        <tbody class="divide-y divide-secondary-200 dark:divide-secondary-800">
                                            <tr v-for="appliance in appliances.data">
                                                <td class="px-6 py-4 whitespace-nowrap">
                                                    <img class="w-10 h-10 mr-3 text-primary-400 bg-primary-500/10 rounded-xl"
                                                        src="/assets/images/shapes/01.png" alt="profile">
                                                </td>
                                                <td
                                                    class="px-6 py-4 whitespace-nowrap text-secondary-600 dark:text-secondary-500">
                                                    {{ appliance.appliance.name }}</td>
                                                <td
                                                    class="px-6 py-4 whitespace-nowrap text-secondary-600 dark:text-secondary-500">
                                                    {{ appliance.power_rating }}watts / 3hours</td>
                                                <td
                                                    class="px-6 py-4 whitespace-nowrap text-secondary-600 dark:text-secondary-500">
                                                    {{ appliance?.consumption?.units_used }}
                                                    watts
                                                </td>

                                                <td
                                                    class="px-6 py-4 whitespace-nowrap text-secondary-600 dark:text-secondary-500">
                                                    {{ appliance.appliance.created_at }}</td>
                                                <td class="px-6 py-4">
                                                    <div class="flex items-center list-user-action">

                                                        <a class="btn btn-warning btn-icon btn-sm mr-1" href="#"
                                                            type="button" data-tp-toggle="tooltip" data-tp-placement="top"
                                                            data-tp-title="Edit">
                                                            <span class="btn-inner">
                                                                <svg width="17" viewBox="0 0 24 24" fill="none"
                                                                    xmlns="http://www.w3.org/2000/svg">
                                                                    <path
                                                                        d="M11.4925 2.78906H7.75349C4.67849 2.78906 2.75049 4.96606 2.75049 8.04806V16.3621C2.75049 19.4441 4.66949 21.6211 7.75349 21.6211H16.5775C19.6625 21.6211 21.5815 19.4441 21.5815 16.3621V12.3341"
                                                                        stroke="currentColor" stroke-width="1.5"
                                                                        stroke-linecap="round" stroke-linejoin="round">
                                                                    </path>
                                                                    <path fill-rule="evenodd" clip-rule="evenodd"
                                                                        d="M8.82812 10.921L16.3011 3.44799C17.2321 2.51799 18.7411 2.51799 19.6721 3.44799L20.8891 4.66499C21.8201 5.59599 21.8201 7.10599 20.8891 8.03599L13.3801 15.545C12.9731 15.952 12.4211 16.181 11.8451 16.181H8.09912L8.19312 12.401C8.20712 11.845 8.43412 11.315 8.82812 10.921Z"
                                                                        stroke="currentColor" stroke-width="1.5"
                                                                        stroke-linecap="round" stroke-linejoin="round">
                                                                    </path>
                                                                    <path d="M15.1655 4.60254L19.7315 9.16854"
                                                                        stroke="currentColor" stroke-width="1.5"
                                                                        stroke-linecap="round" stroke-linejoin="round">
                                                                    </path>
                                                                </svg>
                                                            </span>
                                                        </a>
                                                        <a @click.prevent="deleteAppliance(appliance.id)"
                                                            class="btn btn-danger btn-icon btn-sm mr-1" href="#"
                                                            type="button" data-tp-toggle="tooltip" data-tp-placement="top"
                                                            data-tp-title="Delet">
                                                            <span class="btn-inner">
                                                                <svg width="17" viewBox="0 0 24 24" fill="none"
                                                                    xmlns="http://www.w3.org/2000/svg"
                                                                    stroke="currentColor">
                                                                    <path
                                                                        d="M19.3248 9.46826C19.3248 9.46826 18.7818 16.2033 18.4668 19.0403C18.3168 20.3953 17.4798 21.1893 16.1088 21.2143C13.4998 21.2613 10.8878 21.2643 8.27979 21.2093C6.96079 21.1823 6.13779 20.3783 5.99079 19.0473C5.67379 16.1853 5.13379 9.46826 5.13379 9.46826"
                                                                        stroke="currentColor" stroke-width="1.5"
                                                                        stroke-linecap="round" stroke-linejoin="round">
                                                                    </path>
                                                                    <path d="M20.708 6.23975H3.75" stroke="currentColor"
                                                                        stroke-width="1.5" stroke-linecap="round"
                                                                        stroke-linejoin="round"></path>
                                                                    <path
                                                                        d="M17.4406 6.23973C16.6556 6.23973 15.9796 5.68473 15.8256 4.91573L15.5826 3.69973C15.4326 3.13873 14.9246 2.75073 14.3456 2.75073H10.1126C9.53358 2.75073 9.02558 3.13873 8.87558 3.69973L8.63258 4.91573C8.47858 5.68473 7.80258 6.23973 7.01758 6.23973"
                                                                        stroke="currentColor" stroke-width="1.5"
                                                                        stroke-linecap="round" stroke-linejoin="round">
                                                                    </path>
                                                                </svg>
                                                            </span>
                                                        </a>
                                                    </div>
                                                </td>
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
