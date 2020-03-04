<template>
    <div>
        <h2 id="page-heading">
            <span id="category-heading">DANH MỤC</span>
            <iCus-add-item :title="title" :toLink="toLink"></iCus-add-item>
        </h2>

        <b-alert :show="dismissCountDown"
            dismissible
            :variant="alertType"
            @dismissed="dismissCountDown=0"
            @dismiss-count-down="countDownChanged">
            {{alertMessage}}
        </b-alert>
        <br/>
        <div class="alert alert-warning" v-if="!isFetching && categories && categories.length === 0">
            <span>No categories found</span>
        </div>
        <div >
            <b-table
                striped hover fixed head-variant
                :items="categories"
                :fields="fields">
                <template v-slot:cell(image)="data">
                    <b-img :src="data.item.imgUrl" class="img-category"></b-img>
                </template>
                <template v-slot:cell(config)="data">
                     <div class="btn-group">
                            <b-button pill variant="success">
                                <router-link :to="{name: 'CategoryView', params: {categoryId: data.item.id}}">
                                    <font-awesome-icon icon="eye"></font-awesome-icon>
                                    <span class="d-none d-md-inline">View</span>
                                </router-link>
                            </b-button>
                            <b-button pill variant="primary">
                                <router-link :to="{name: 'CategoryEdit', params: {categoryId: data.item.id}}">
                                    <font-awesome-icon icon="pencil-alt"></font-awesome-icon>
                                    <span class="d-none d-md-inline">Edit</span>
                                </router-link>
                            </b-button>
                            <b-button pill variant="danger" v-on:click="prepareRemove(category)"
                                   v-b-modal.removeEntity>
                                <font-awesome-icon icon="times"></font-awesome-icon>
                                <span class="d-none d-md-inline">Delete ABC</span>
                            </b-button>
                        </div>
                </template>
            </b-table>
        </div>
        <b-modal ref="removeEntity" id="removeEntity" >
            <span slot="modal-title"><span id="shopdminApp.category.delete.question">Confirm delete operation</span></span>
            <div class="modal-body">
                <p id="jhi-delete-category-heading" >Are you sure you want to delete this Category?</p>
            </div>
            <div slot="modal-footer">
                <button type="button" class="btn btn-secondary" v-on:click="closeDialog()">Cancel</button>
                <button type="button" class="btn btn-primary" id="jhi-confirm-delete-category" v-on:click="removeCategory()">Delete</button>
            </div>
        </b-modal>
        <div v-show="categories && categories.length > 0">
            <div class="row justify-content-center">
                <jhi-item-count :page="page" :total="queryCount" :itemsPerPage="itemsPerPage"></jhi-item-count>
            </div>
            <div class="row justify-content-center">
                <b-pagination pills :total-rows="totalItems" v-model="page" :per-page="itemsPerPage" :change="loadPage(page)"></b-pagination>
            </div>
        </div>
    </div>
</template>

<script lang="ts" src="./category.component.ts">
</script>
<style scoped>
    .btnCustom{
        margin-left: 3px;
    }
    .img-category{
        height: 100px;
        width: 100px;
    }
</style>
