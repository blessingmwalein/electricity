
<script >
import AppLayout from '@/Layouts/AppLayout.vue';

export default {
    name: "Tokens",
    props: ['meter'],
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
                <div class="w-full">
                    <div class="relative flex flex-col text-secondary-600 bg-white dark:bg-dark-card shadow rounded pb-4">
                        <div class="flex-auto p-6 rounded">
                            <h2 class="mb-4 font-sans text-3xl  text-black dark:text-white counter"
                                style="visibility: visible;">{{ meter.current_units }}watts</h2>
                            <p class=" text-secondary-600 mb-2 dark:text-white">Your Current Units</p>
                            <h6 class="text-lg  text-black dark:text-white">Meter Number: {{ meter.meter_number }}</h6>
                            <a href="#" class="btn btn-danger btn-block ">Buy Token</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </AppLayout>
</template>
