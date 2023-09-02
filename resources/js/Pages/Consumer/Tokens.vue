
<script >
import AppLayout from '@/Layouts/AppLayout.vue';
import { Link } from '@inertiajs/vue3';

export default {
    name: "Tokens",
    props: ['tokens'],
    components: {
        AppLayout,
        Link
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
                            <h4 class="mb-0 dark:text-secondary-200">Token List</h4>
                        </div>
                        <div class="pb-6 pt-2 px-0">
                            <div class="overflow-x-auto">
                                <div class=" overflow-x-auto p-5">
                                    <!-- <div class="flex flex-wrap justify-between my-6">

                                        <div class="flex justify-center items-center mb-1">
                                            <Link :href="'/admin/token/create'" class="btn btn-primary mb-2">Create
                                            New
                                            Token</Link>
                                        </div>
                                    </div> -->
                                    <table
                                        class="min-w-full overflow-hidden divide-y divide-secondary-200 dark:divide-secondary-800 border dark:border-secondary-800">
                                        <thead>
                                            <tr class="bg-secondary-100 dark:bg-dark-bg">

                                                <th
                                                    class="px-6 py-4 text-left font-medium text-secondary-600 dark:text-white">
                                                    User</th>


                                                <th
                                                    class="px-6 py-4 text-left font-medium text-secondary-600 dark:text-white">
                                                    Token</th>
                                                <th
                                                    class="px-6 py-4 text-left font-medium text-secondary-600 dark:text-white">
                                                    Status</th>
                                                <th
                                                    class="px-6 py-4 text-left font-medium text-secondary-600 dark:text-white">
                                                    Units</th>
                                                <th
                                                    class="px-6 py-4 text-left font-medium text-secondary-600 dark:text-white">
                                                    Cost</th>
                                                <th
                                                    class="px-6 py-4 text-left font-medium text-secondary-600 dark:text-white">
                                                    Created Date</th>

                                            </tr>
                                        </thead>
                                        <tbody class="divide-y divide-secondary-200 dark:divide-secondary-800">
                                            <tr v-for="token in tokens">

                                                <td
                                                    class="px-6 py-4 whitespace-nowrap text-secondary-600 dark:text-secondary-500">
                                                    {{ token.user.name }}</td>
                                                <td
                                                    class="px-6 py-4 whitespace-nowrap text-secondary-600 dark:text-secondary-500">
                                                    {{ token.token }}</td>


                                                <td class="px-6 py-4"><span
                                                        class="inline-block whitespace-nowrap px-2 py-1 text-xs text-center font-bold leading-none text-white bg-primary-500 rounded">{{
                                                            token.status }}</span>
                                                </td>
                                                <td
                                                    class="px-6 py-4 whitespace-nowrap text-secondary-600 dark:text-secondary-500">
                                                    {{ token.units }}watts</td>
                                                <td
                                                    class="px-6 py-4 whitespace-nowrap text-secondary-600 dark:text-secondary-500">
                                                    ${{ token.cost }}</td>
                                                <td
                                                    class="px-6 py-4 whitespace-nowrap text-secondary-600 dark:text-secondary-500">
                                                    {{ token.created_at }}</td>

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
