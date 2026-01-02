<script setup>
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
import { Head } from '@inertiajs/vue3';
import { computed } from 'vue';

import { Doughnut, Bar } from 'vue-chartjs';
import { Chart as ChartJS, ArcElement, Tooltip, Legend, BarElement, CategoryScale, LinearScale } from 'chart.js';

ChartJS.register(ArcElement, Tooltip, Legend, BarElement, CategoryScale, LinearScale);

const props = defineProps({
    kpis: Object,
    charts: Object
});

const formatCurrency = (value) => {
    return new Intl.NumberFormat('es-AR', { style: 'currency', currency: 'ARS' }).format(value);
};

const doughnutData = computed(() => ({
    labels: props.charts.byStage.map(s => s.name),
    datasets: [{
        backgroundColor: ['#4F46E5', '#10B981', '#F59E0B', '#EF4444', '#6366F1', '#8B5CF6'],
        data: props.charts.byStage.map(s => s.count)
    }]
}));

const doughnutOptions = {
    responsive: true,
    maintainAspectRatio: false,
    plugins: {
        legend: { position: 'right' }
    }
};

const barData = computed(() => ({
    labels: props.charts.monthlySales.map(d => d.month),
    datasets: [{
        label: 'Ventas Ganadas ($)',
        backgroundColor: '#10B981',
        data: props.charts.monthlySales.map(d => d.total)
    }]
}));

const barOptions = {
    responsive: true,
    maintainAspectRatio: false
};
</script>

<template>
    <Head title="Dashboard" />

    <AuthenticatedLayout>
        <template #header>
            <h2 class="font-semibold text-xl text-gray-800 dark:text-gray-200 leading-tight">
                Panel de Control
            </h2>
        </template>

        <div class="py-12">
            <div class="max-w-7xl mx-auto sm:px-6 lg:px-8 space-y-6">

                <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
                    <div class="bg-white dark:bg-gray-800 overflow-hidden shadow-sm sm:rounded-lg p-6">
                        <div class="text-gray-500 text-sm font-medium uppercase">Ingresos Ganados</div>
                        <div class="mt-2 text-3xl font-bold text-green-600">
                            {{ formatCurrency(kpis.totalWon) }}
                        </div>
                    </div>

                    <div class="bg-white dark:bg-gray-800 overflow-hidden shadow-sm sm:rounded-lg p-6">
                        <div class="text-gray-500 text-sm font-medium uppercase">Negocios Activos</div>
                        <div class="mt-2 text-3xl font-bold text-indigo-600">
                            {{ kpis.openDeals }}
                        </div>
                        <div class="text-xs text-gray-400 mt-1">En tu tubería de ventas</div>
                    </div>

                    <div class="bg-white dark:bg-gray-800 overflow-hidden shadow-sm sm:rounded-lg p-6">
                        <div class="text-gray-500 text-sm font-medium uppercase">Rendimiento</div>
                        <div class="mt-2 text-xl font-semibold text-gray-700 dark:text-gray-300">
                            ¡Sigue así! 🚀
                        </div>
                        <div class="text-xs text-gray-400 mt-1">Revisa tus tareas pendientes</div>
                    </div>
                </div>

                <div class="grid grid-cols-1 md:grid-cols-2 gap-6">

                    <div class="bg-white dark:bg-gray-800 shadow-sm sm:rounded-lg p-6">
                        <h3 class="text-lg font-bold text-gray-700 dark:text-gray-200 mb-4">Distribución del Pipeline</h3>
                        <div class="h-64">
                            <Doughnut :data="doughnutData" :options="doughnutOptions" />
                        </div>
                    </div>

                    <div class="bg-white dark:bg-gray-800 shadow-sm sm:rounded-lg p-6">
                        <h3 class="text-lg font-bold text-gray-700 dark:text-gray-200 mb-4">Ventas Cerradas (6 Meses)</h3>
                        <div class="h-64">
                            <Bar :data="barData" :options="barOptions" />
                        </div>
                        <div v-if="charts.monthlySales.length === 0" class="text-center text-gray-400 mt-4 text-sm">
                            No hay ventas ganadas registradas aún. Marca un negocio como "Ganado" para ver datos aquí.
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </AuthenticatedLayout>
</template>
