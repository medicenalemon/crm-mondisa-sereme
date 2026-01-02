<script setup>
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
import { Head, Link } from '@inertiajs/vue3';

const props = defineProps({
    company: Object,
    stats: Object
});

const formatCurrency = (value) => {
    return new Intl.NumberFormat('es-AR', { style: 'currency', currency: 'ARS' }).format(value);
};

// Función para asignar colores según el estado del negocio
const getStatusColor = (status) => {
    switch(status) {
        case 'won': return 'bg-green-100 text-green-800 border-green-200';
        case 'lost': return 'bg-red-100 text-red-800 border-red-200';
        default: return 'bg-blue-100 text-blue-800 border-blue-200';
    }
};

const getStatusLabel = (status) => {
    switch(status) {
        case 'won': return 'Ganado';
        case 'lost': return 'Perdido';
        default: return 'En Progreso';
    }
};
</script>

<template>
    <Head :title="company.name" />

    <AuthenticatedLayout>
        <template #header>
            <div class="flex items-center justify-between">
                <div class="flex items-center gap-4">
                    <Link :href="route('companies.index')" class="text-gray-500 hover:text-gray-700">
                        ← Volver
                    </Link>
                    <h2 class="font-semibold text-xl text-gray-800 dark:text-gray-200 leading-tight">
                        Ficha Detallada de Cliente
                    </h2>
                </div>
            </div>
        </template>

        <div class="py-12">
            <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">

                <div class="grid grid-cols-1 md:grid-cols-3 gap-6">

                    <div class="space-y-6">
                        <div class="bg-white dark:bg-gray-800 p-6 rounded-lg shadow-sm border border-gray-200 dark:border-gray-700">
                            <div class="mb-6 text-center">
                                <div class="w-20 h-20 bg-indigo-100 text-indigo-600 rounded-full flex items-center justify-center text-3xl font-bold mx-auto mb-4 uppercase">
                                    {{ company.name.substring(0, 2) }}
                                </div>
                                <h1 class="text-xl font-bold text-gray-900 dark:text-gray-100">{{ company.name }}</h1>
                                <a v-if="company.domain" :href="'//' + company.domain" target="_blank" class="text-indigo-500 hover:underline text-sm">
                                    {{ company.domain }}
                                </a>
                            </div>

                            <hr class="my-4 border-gray-100 dark:border-gray-600">

                            <div class="space-y-4 text-sm">
                                <div>
                                    <label class="text-xs text-gray-400 uppercase font-semibold">Email</label>
                                    <div class="text-gray-700 dark:text-gray-300">{{ company.email || '---' }}</div>
                                </div>
                                <div>
                                    <label class="text-xs text-gray-400 uppercase font-semibold">Teléfono</label>
                                    <div class="text-gray-700 dark:text-gray-300">{{ company.phone || '---' }}</div>
                                </div>
                                <div>
                                    <label class="text-xs text-gray-400 uppercase font-semibold">Dirección</label>
                                    <div class="text-gray-700 dark:text-gray-300">{{ company.address || '---' }}</div>
                                </div>
                            </div>
                        </div>

                        <div class="bg-indigo-50 dark:bg-gray-700 p-6 rounded-lg border border-indigo-100 dark:border-gray-600">
                            <h3 class="font-bold text-indigo-900 dark:text-indigo-200 mb-4">Resumen Histórico</h3>
                            <div class="flex justify-between items-center mb-2">
                                <span class="text-sm text-gray-600 dark:text-gray-300">Total Ganado:</span>
                                <span class="font-bold text-green-600">{{ formatCurrency(stats.total_won) }}</span>
                            </div>
                            <div class="flex justify-between items-center">
                                <span class="text-sm text-gray-600 dark:text-gray-300">Activos ahora:</span>
                                <span class="font-bold text-indigo-600">{{ stats.open_deals }} negocios</span>
                            </div>
                        </div>
                    </div>

                    <div class="md:col-span-2 space-y-6">
                        <div class="bg-white dark:bg-gray-800 p-6 rounded-lg shadow-sm border border-gray-200 dark:border-gray-700">
                            <h3 class="text-lg font-bold text-gray-800 dark:text-gray-200 mb-6">Historial de Oportunidades</h3>

                            <div v-if="company.deals.length === 0" class="text-center py-10 text-gray-400">
                                No hay historial de negocios con este cliente.
                            </div>

                            <div v-else class="space-y-4">
                                <div v-for="deal in company.deals" :key="deal.id"
                                     class="flex flex-col sm:flex-row sm:items-center justify-between p-4 border rounded-lg hover:bg-gray-50 dark:hover:bg-gray-700 transition">

                                    <div class="flex-1">
                                        <div class="flex items-center gap-3 mb-1">
                                            <h4 class="font-semibold text-gray-900 dark:text-gray-100">{{ deal.title }}</h4>
                                            <span :class="['px-2 py-0.5 rounded text-xs border font-medium uppercase', getStatusColor(deal.status)]">
                                                {{ getStatusLabel(deal.status) }}
                                            </span>
                                        </div>
                                        <div class="text-sm text-gray-500">
                                            Etapa actual: <span class="font-medium text-gray-700 dark:text-gray-300">{{ deal.pipeline_stage.name }}</span>
                                            <span class="mx-2">•</span>
                                            Cierre: {{ new Date(deal.expected_close_date).toLocaleDateString() }}
                                        </div>
                                    </div>

                                    <div class="mt-4 sm:mt-0 text-right">
                                        <div class="text-lg font-bold text-gray-900 dark:text-gray-100">
                                            {{ formatCurrency(deal.amount) }}
                                        </div>
                                    </div>

                                </div>
                            </div>

                        </div>
                    </div>

                </div>
            </div>
        </div>
    </AuthenticatedLayout>
</template>
