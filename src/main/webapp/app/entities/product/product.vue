<template>
    <div>
        <h2 id="page-heading">
            <span id="product-heading">Products</span>
            <router-link :to="{name: 'ProductCreate'}" tag="button" id="jh-create-entity" class="btn btn-primary float-right jh-create-entity create-product">
                <font-awesome-icon icon="plus"></font-awesome-icon>
                <span >
                    Create a new Product
                </span>
            </router-link>
        </h2>
        <b-alert :show="dismissCountDown"
            dismissible
            :variant="alertType"
            @dismissed="dismissCountDown=0"
            @dismiss-count-down="countDownChanged">
            {{alertMessage}}
        </b-alert>
        <br/>
        <div class="alert alert-warning" v-if="!isFetching && products && products.length === 0">
            <span>No products found</span>
        </div>
        <div class="table-responsive" v-if="products && products.length > 0">
            <b-table
                striped hover fixed head-variant
                :items="products"
                :fields="fields">
                <template v-slot:cell(image)="data">
                    <b-img :src="data.item.imgUrl" class="img-category"></b-img>
                </template>
                <template v-slot:cell(config)="data">
                    <div class="btn-group">
                        <b-button pill variant="success">
                            <router-link :to="{name: 'CategoryView', params: {categoryId: data.item.id}}" class="cus-router">
                                <font-awesome-icon icon="eye"></font-awesome-icon>
                                <span class="d-none d-md-inline">Chi tiết</span>
                            </router-link>
                        </b-button>
                        <b-button pill variant="primary">
                            <router-link :to="{name: 'ProductEdit', params: {categoryId: data.item.id}}" class="cus-router">
                                <font-awesome-icon icon="pencil-alt"></font-awesome-icon>
                                <span class="d-none d-md-inline">Cập nhật</span>
                            </router-link>
                        </b-button>

                        <b-button v-on:click="prepareRemove(data.item)"
                            pill
                            variant="danger"
                            v-b-modal.removeEntity>
                            <font-awesome-icon icon="times"></font-awesome-icon>
                            <span class="d-none d-md-inline">Xoá</span>
                        </b-button>
                    </div>
                </template>
            </b-table>
        </div>
        <b-modal ref="removeEntity" id="removeEntity" >
            <span slot="modal-title"><span id="shopdminApp.product.delete.question">Confirm delete operation</span></span>
            <div class="modal-body">
                <p id="jhi-delete-product-heading" >Are you sure you want to delete this Product?</p>
            </div>
            <div slot="modal-footer">
                <button type="button" class="btn btn-secondary" v-on:click="closeDialog()">Cancel</button>
                <button type="button" class="btn btn-primary" id="jhi-confirm-delete-product" v-on:click="removeProduct()">Delete</button>
            </div>
        </b-modal>
        <div v-show="products && products.length > 0">
            <div class="row justify-content-center">
                <jhi-item-count :page="page" :total="queryCount" :itemsPerPage="itemsPerPage"></jhi-item-count>
            </div>
            <div class="row justify-content-center">
                <b-pagination size="md" :total-rows="totalItems" v-model="page" :per-page="itemsPerPage" :change="loadPage(page)"></b-pagination>
            </div>
        </div>
    </div>
</template>

<script lang="ts" src="./product.component.ts">
</script>
