<script setup>
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
import { Head, Link } from '@inertiajs/vue3';

const props = defineProps({
    companies: Array,
    deals: Array,
    query: String
});

const formatCurrency = (value) => {
    return new Intl.NumberFormat('es-AR', { style: 'currency', currency: 'ARS' }).format(value);
};
</script>

<template>
    <Head title="Resultados de Búsqueda" />

    <AuthenticatedLayout>
        <template #header>
            <h2 class="font-semibold text-xl text-gray-800 dark:text-gray-200 leading-tight">
                Resultados para: "<span class="text-indigo-600">{{ query }}</span>"
            </h2>
        </template>

        <div class="py-12">
            <div class="max-w-7xl mx-auto sm:px-6 lg:px-8 space-y-8">

                <div v-if="companies.length > 0">
                    <h3 class="text-lg font-bold text-gray-700 dark:text-gray-300 mb-4 border-b pb-2">🏢 Clientes Encontrados</h3>
                    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
                        <Link v-for="company in companies" :key="company.id"
                              :href="route('companies.show', company.id)"
                              class="block bg-white dark:bg-gray-800 p-4 rounded-lg shadow hover:bg-gray-50 dark:hover:bg-gray-700 transition">
                            <div class="font-bold text-lg text-indigo-600">{{ company.name }}</div>
                            <div class="text-sm text-gray-500">{{ company.email }}</div>
                        </Link>
                    </div>
                </div>

                <div v-if="deals.length > 0">
                    <h3 class="text-lg font-bold text-gray-700 dark:text-gray-300 mb-4 border-b pb-2">💰 Oportunidades Encontradas</h3>
                    <div class="space-y-3">
                        <div v-for="deal in deals" :key="deal.id"
                             class="bg-white dark:bg-gray-800 p-4 rounded-lg shadow flex justify-between items-center">
                            <div>
                                <div class="font-bold text-gray-800 dark:text-gray-200">{{ deal.title }}</div>
                                <div class="text-sm text-gray-500">Cliente: {{ deal.company.name }}</div>
                            </div>
                            <div class="font-mono font-bold text-indigo-600">
                                {{ formatCurrency(deal.amount) }}
                            </div>
                        </div>
                    </div>
                </div>

                <div v-if="companies.length === 0 && deals.length === 0" class="text-center py-12">
                    <div class="text-gray-400 text-6xl mb-4">🔍</div>
                    <p class="text-gray-500 text-lg">No encontramos nada que coincida con tu búsqueda.</p>
                    <p class="text-gray-400 text-sm">Intenta con el nombre de un cliente o el título de un negocio.</p>
                </div>

            </div>
        </div>
    </AuthenticatedLayout>
</template>
