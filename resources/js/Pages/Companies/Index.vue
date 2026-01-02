<script setup>
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
import { Head, useForm, Link } from '@inertiajs/vue3';
import { ref } from 'vue';
import Modal from '@/Components/Modal.vue';
import InputLabel from '@/Components/InputLabel.vue';
import TextInput from '@/Components/TextInput.vue';
import PrimaryButton from '@/Components/PrimaryButton.vue';
import SecondaryButton from '@/Components/SecondaryButton.vue';
import DangerButton from '@/Components/DangerButton.vue';
import InputError from '@/Components/InputError.vue';

const props = defineProps({
    companies: Array
});

const isModalOpen = ref(false);
const isEditing = ref(false);
const editingCompanyId = ref(null);

const form = useForm({
    name: '',
    email: '',
    phone: '',
    domain: '',
    address: ''
});

const openCreateModal = () => {
    isEditing.value = false;
    form.reset();
    isModalOpen.value = true;
};

const openEditModal = (company) => {
    isEditing.value = true;
    editingCompanyId.value = company.id;
    form.name = company.name;
    form.email = company.email;
    form.address = company.address;
    form.phone = company.phone;
    form.domain = company.domain;
    isModalOpen.value = true;
};

const submitForm = () => {
    if (isEditing.value) {
        form.put(route('companies.update', editingCompanyId.value), {
            onSuccess: () => isModalOpen.value = false
        });
    } else {
        form.post(route('companies.store'), {
            onSuccess: () => {
                form.reset();
                isModalOpen.value = false;
            }
        });
    }
};

const deleteCompany = () => {
    if (confirm('¿Estás seguro? Al borrar la empresa se borrarán TODOS sus negocios asociados.')) {
        form.delete(route('companies.destroy', editingCompanyId.value), {
            onSuccess: () => isModalOpen.value = false
        });
    }
};
</script>

<template>
    <Head title="Mis Clientes" />

    <AuthenticatedLayout>
        <template #header>
            <div class="flex justify-between items-center">
                <h2 class="font-semibold text-xl text-gray-800 dark:text-gray-200 leading-tight">
                    Cartera de Clientes
                </h2>
                <PrimaryButton @click="openCreateModal">
                    + Nueva Empresa
                </PrimaryButton>
            </div>
        </template>

        <div class="py-12">
            <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">

                <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">

                    <div v-for="company in companies" :key="company.id"
                         class="bg-white dark:bg-gray-800 overflow-hidden shadow-sm sm:rounded-lg p-6 border-l-4 border-transparent hover:border-indigo-500 relative group">

                        <button @click.stop="openEditModal(company)"
                                class="absolute top-4 right-4 text-gray-400 hover:text-indigo-600 p-1 rounded-full hover:bg-gray-100 transition">
                            ✏️ Editar
                        </button>

                        <div class="flex items-start justify-between pr-10">
                            <div>
                                <Link :href="route('companies.show', company.id)"
                                      class="text-lg font-bold text-gray-900 dark:text-gray-100 hover:text-indigo-600 hover:underline">
                                    {{ company.name }}
                                </Link>
                                <p class="text-sm text-indigo-500 font-mono mt-1">{{ company.domain || 'Sin web' }}</p>
                            </div>
                        </div>

                        <div class="mt-4 space-y-2">
                            <div class="flex items-center text-sm text-gray-600 dark:text-gray-400">
                                <span class="w-6">📍</span>
                                {{ company.address || 'Sin dirección' }}
                            </div>
                        </div>

                        <div class="mt-4 pt-4 border-t border-gray-100 dark:border-gray-700 flex justify-between items-center">
                            <div class="bg-gray-100 dark:bg-gray-700 rounded-full px-3 py-1 text-xs font-bold text-gray-600 dark:text-gray-300">
                                {{ company.deals_count }} Negocios
                            </div>
                            <Link :href="route('companies.show', company.id)" class="text-xs text-indigo-600 font-semibold hover:underline">
                                Ver Perfil →
                            </Link>
                        </div>
                    </div>

                    <div v-if="companies.length === 0" class="col-span-full text-center py-12 text-gray-500">
                        No tienes clientes registrados. ¡Crea el primero arriba a la derecha!
                    </div>

                </div>
            </div>
        </div>

        <Modal :show="isModalOpen" @close="isModalOpen = false">
            <div class="p-6">
                <h2 class="text-lg font-medium text-gray-900 dark:text-gray-100">
                    {{ isEditing ? 'Editar Cliente' : 'Registrar Nuevo Cliente' }}
                </h2>

                <form @submit.prevent="submitForm" class="mt-6 space-y-4">
                    <div>
                        <InputLabel for="name" value="Nombre de la Empresa" />
                        <TextInput id="name" v-model="form.name" type="text" class="mt-1 block w-full" required />
                        <InputError :message="form.errors.name" class="mt-2" />
                    </div>

                    <div>
                        <InputLabel for="domain" value="Sitio Web (Dominio)" />
                        <TextInput id="domain" v-model="form.domain" type="text" placeholder="ejemplo.com" class="mt-1 block w-full" />
                        <InputError :message="form.errors.domain" class="mt-2" />
                    </div>

                    <div class="grid grid-cols-2 gap-4">
                        <div>
                            <InputLabel for="email" value="Email de Contacto" />
                            <TextInput id="email" v-model="form.email" type="email" class="mt-1 block w-full" />
                            <InputError :message="form.errors.email" class="mt-2" />
                        </div>
                        <div>
                            <InputLabel for="address" value="Dirección Física" />
                            <TextInput id="address" v-model="form.address" type="text" class="mt-1 block w-full" placeholder="Av. Siempre Viva 123" />
                            <InputError :message="form.errors.address" class="mt-2" />
                        </div>
                        <div>
                            <InputLabel for="phone" value="Teléfono" />
                            <TextInput id="phone" v-model="form.phone" type="text" class="mt-1 block w-full" />
                            <InputError :message="form.errors.phone" class="mt-2" />
                        </div>
                    </div>

                    <div class="mt-6 flex justify-between items-center">
                        <div>
                            <DangerButton v-if="isEditing" type="button" @click="deleteCompany">Borrar Empresa</DangerButton>
                        </div>
                        <div class="flex">
                            <SecondaryButton @click="isModalOpen = false">Cancelar</SecondaryButton>
                            <PrimaryButton class="ml-3" :disabled="form.processing">Guardar</PrimaryButton>
                        </div>
                    </div>
                </form>
            </div>
        </Modal>

    </AuthenticatedLayout>
</template>
