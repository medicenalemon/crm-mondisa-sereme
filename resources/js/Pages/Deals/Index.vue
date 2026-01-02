<script setup>
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
import { Head, router, useForm, Link } from '@inertiajs/vue3';
import { ref, watch } from 'vue';
import draggable from 'vuedraggable';

import Modal from '@/Components/Modal.vue';
import InputLabel from '@/Components/InputLabel.vue';
import TextInput from '@/Components/TextInput.vue';
import PrimaryButton from '@/Components/PrimaryButton.vue';
import SecondaryButton from '@/Components/SecondaryButton.vue';
import InputError from '@/Components/InputError.vue';
import DangerButton from '@/Components/DangerButton.vue';

const props = defineProps({
    deals: Array,
    stages: Array,
    companies: Array
});

const columns = ref([]);
const isModalOpen = ref(false);
const isEditing = ref(false);
const editingDealId = ref(null);

const form = useForm({
    title: '',
    amount: '',
    company_id: '',
    expected_close_date: ''
});

const refreshColumns = () => {
    columns.value = props.stages.map(stage => ({
        id: stage.id,
        name: stage.name,
        deals: props.deals.filter(deal => deal.pipeline_stage_id === stage.id)
    }));
};

refreshColumns();
watch(() => props.deals, refreshColumns);

const openCreateModal = () => {
    isEditing.value = false;
    editingDealId.value = null;
    form.reset();
    isModalOpen.value = true;
};

const openEditModal = (deal) => {
    isEditing.value = true;
    editingDealId.value = deal.id;

    form.title = deal.title;
    form.amount = deal.amount;
    form.company_id = deal.company_id;
    form.expected_close_date = deal.expected_close_date;

    isModalOpen.value = true;
};

const submitForm = () => {
    if (isEditing.value) {
        form.put(route('deals.update', editingDealId.value), {
            onSuccess: () => isModalOpen.value = false
        });
    } else {
        form.post(route('deals.store'), {
            onSuccess: () => {
                form.reset();
                isModalOpen.value = false;
            }
        });
    }
};

const deleteDeal = () => {
    if (confirm('¿Estás seguro de que quieres eliminar esta oportunidad?')) {
        form.delete(route('deals.destroy', editingDealId.value), {
            onSuccess: () => isModalOpen.value = false
        });
    }
};

const onCardDrop = (columnId, event) => {
    if (event.added) {
        router.put(route('deals.move', event.added.element.id), {
            pipeline_stage_id: columnId
        }, { preserveScroll: true });
    }
};

const submitNewDeal = () => {
    form.post(route('deals.store'), {
        onSuccess: () => {
            form.reset();
            isModalOpen.value = false;
        }
    });
};

const formatCurrency = (value) => {
    return new Intl.NumberFormat('es-AR', { style: 'currency', currency: 'ARS' }).format(value);
};

const getColumnTotal = (deals) => {
    return deals.reduce((sum, deal) => sum + Number(deal.amount), 0);
};

</script>

<template>
    <Head title="Tablero Kanban" />

    <AuthenticatedLayout>

        <template #header>
            <div class="flex justify-between items-center">
                <h2 class="font-semibold text-xl text-gray-800 dark:text-gray-200 leading-tight">
                    Tablero de Ventas
                </h2>
                <PrimaryButton @click="openCreateModal"> + Nuevo Negocio
                </PrimaryButton>
            </div>
        </template>

        <div class="p-6 h-screen overflow-x-auto bg-gray-100 dark:bg-gray-900">
            <div class="flex h-full gap-6 min-w-max">
                <div v-for="column in columns" :key="column.id" class="w-80 flex-shrink-0 flex flex-col">
                    <div class="mb-4 p-3 bg-gray-200 dark:bg-gray-800 rounded-t-lg border-b-2 border-indigo-500">
                        <div class="flex items-center justify-between mb-1">
                            <h3 class="font-bold text-gray-700 dark:text-gray-200">{{ column.name }}</h3>
                            <span class="bg-gray-300 dark:bg-gray-600 text-gray-700 dark:text-gray-200 text-xs px-2 py-1 rounded-full font-bold">
                                 {{ column.deals.length }}
                            </span>
                        </div>

                        <div class="text-right font-mono text-sm text-indigo-600 dark:text-indigo-400 font-bold">
                            {{ formatCurrency(getColumnTotal(column.deals)) }}
                        </div>
                    </div>

                    <draggable
                        v-model="column.deals"
                        group="deals"
                        item-key="id"
                        class="flex-1 overflow-y-auto space-y-3 p-2 min-h-[150px]"
                        ghost-class="opacity-50"
                        @change="(e) => onCardDrop(column.id, e)"
                    >
                        <template #item="{ element: deal }">
                            <div @click="openEditModal(deal)"
                                 class="bg-white dark:bg-gray-700 p-4 rounded-lg shadow-sm cursor-pointer hover:shadow-md transition-all border border-gray-200 dark:border-gray-600 relative group">

                                <div class="absolute top-2 right-2 opacity-0 group-hover:opacity-100 transition-opacity text-gray-400">
                                    ✏️
                                </div>

                                <div class="text-xs font-semibold text-gray-400 uppercase tracking-wider mb-1 z-10 relative">
                                    <Link :href="route('companies.show', deal.company_id)"
                                          @click.stop
                                          class="hover:text-indigo-500 hover:underline">
                                        {{ deal.company.name }}
                                    </Link>
                                </div>

                                <h4 class="font-bold text-gray-800 dark:text-gray-100 mb-2">
                                    {{ deal.title }}
                                </h4>

                                <div class="flex justify-between items-center mt-3 pt-3 border-t border-gray-100 dark:border-gray-600">
                                    <div class="flex items-center text-xs text-gray-500">
                                        📅 {{ new Date(deal.expected_close_date.substring(0, 10) + 'T12:00:00').toLocaleDateString() }}
                                    </div>
                                    <span class="font-mono font-bold text-indigo-600 dark:text-indigo-400">
                                          {{ formatCurrency(deal.amount) }}
                                    </span>
                                </div>
                            </div>
                        </template>
                    </draggable>
                </div>
            </div>
        </div>

        <Modal :show="isModalOpen" @close="isModalOpen = false">
            <div class="p-6">
                <h2 class="text-lg font-medium text-gray-900 dark:text-gray-100">
                    {{ isEditing ? 'Editar Oportunidad' : 'Crear Nueva Oportunidad' }}
                </h2>

                <form @submit.prevent="submitForm" class="mt-6 space-y-4">

                    <div>
                        <InputLabel for="title" value="Título del Negocio" />
                        <TextInput
                            id="title"
                            v-model="form.title"
                            type="text"
                            class="mt-1 block w-full"
                            placeholder="Ej: Venta de Licencias"
                            required
                        />
                        <InputError :message="form.errors.title" class="mt-2" />
                    </div>

                    <div>
                        <InputLabel for="company" value="Cliente / Empresa" />
                        <select
                            id="company"
                            v-model="form.company_id"
                            class="mt-1 block w-full border-gray-300 dark:border-gray-700 dark:bg-gray-900 dark:text-gray-300 focus:border-indigo-500 focus:ring-indigo-500 rounded-md shadow-sm"
                        >
                            <option value="" disabled>Selecciona un cliente</option>
                            <option v-for="company in companies" :key="company.id" :value="company.id">
                                {{ company.name }}
                            </option>
                        </select>
                        <InputError :message="form.errors.company_id" class="mt-2" />
                    </div>

                    <div class="grid grid-cols-2 gap-4">
                        <div>
                            <InputLabel for="amount" value="Valor Estimado ($)" />
                            <TextInput
                                id="amount"
                                v-model="form.amount"
                                type="number"
                                step="0.01"
                                class="mt-1 block w-full"
                                placeholder="0.00"
                                required
                            />
                            <InputError :message="form.errors.amount" class="mt-2" />
                        </div>
                        <div>
                            <InputLabel for="date" value="Fecha Cierre Esperada" />
                            <TextInput
                                id="date"
                                v-model="form.expected_close_date"
                                type="date"
                                class="mt-1 block w-full"
                                required
                            />
                            <InputError :message="form.errors.expected_close_date" class="mt-2" />
                        </div>
                    </div>

                    <div class="mt-6 flex justify-between items-center">

                        <div>
                            <DangerButton v-if="isEditing" type="button" @click="deleteDeal">
                                Eliminar
                            </DangerButton>
                        </div>

                        <div class="flex">
                            <SecondaryButton @click="isModalOpen = false"> Cancelar </SecondaryButton>
                            <PrimaryButton class="ml-3" :disabled="form.processing">
                                {{ form.processing ? 'Guardando...' : (isEditing ? 'Actualizar' : 'Crear') }}
                            </PrimaryButton>
                        </div>
                    </div>
                </form>
            </div>
        </Modal>

    </AuthenticatedLayout>
</template>
