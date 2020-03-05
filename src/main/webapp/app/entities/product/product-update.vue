<template>
    <div class="row justify-content-center">
        <div class="col-8">
            <form name="editForm" role="form" novalidate v-on:submit.prevent="save()" >
                <h2 id="shopdminApp.product.home.createOrEditLabel">Create or edit a Product</h2>
                <div>
                    <div class="form-group" v-if="product.id">
                        <label for="id">ID</label>
                        <input type="text" class="form-control" id="id" name="id"
                               v-model="product.id" readonly />
                    </div>
                    <div class="form-group">
                        <label class="form-control-label" for="product-name">Name</label>
                        <input type="text" class="form-control" name="name" id="product-name"
                            :class="{'valid': !$v.product.name.$invalid, 'invalid': $v.product.name.$invalid }" v-model="$v.product.name.$model"  required/>
                        <div v-if="$v.product.name.$anyDirty && $v.product.name.$invalid">
                            <small class="form-text text-danger" v-if="!$v.product.name.required">
                                This field is required.
                            </small>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="form-control-label" for="product-imgUrl">Img Url</label>
                        <input type="text" class="form-control" name="imgUrl" id="product-imgUrl"
                            :class="{'valid': !$v.product.imgUrl.$invalid, 'invalid': $v.product.imgUrl.$invalid }" v-model="$v.product.imgUrl.$model" />
                    </div>
                    <div class="form-group">
                        <label class="form-control-label" for="product-price">Price</label>
                        <input type="text" class="form-control" name="price" id="product-price"
                            :class="{'valid': !$v.product.price.$invalid, 'invalid': $v.product.price.$invalid }" v-model="$v.product.price.$model" />
                    </div>
                    <div class="form-group">
                        <label class="form-control-label" for="product-discount">Discount</label>
                        <input type="number" class="form-control" name="discount" id="product-discount"
                            :class="{'valid': !$v.product.discount.$invalid, 'invalid': $v.product.discount.$invalid }" v-model.number="$v.product.discount.$model" />
                    </div>
                    <div class="form-group">
                        <label class="form-control-label" for="product-descriptions">Descriptions</label>
                        <input type="text" class="form-control" name="descriptions" id="product-descriptions"
                            :class="{'valid': !$v.product.descriptions.$invalid, 'invalid': $v.product.descriptions.$invalid }" v-model="$v.product.descriptions.$model" />
                    </div>
                    <div class="form-group">
                        <label class="form-control-label" for="product-quantity">Quantity</label>
                        <input type="number" class="form-control" name="quantity" id="product-quantity"
                            :class="{'valid': !$v.product.quantity.$invalid, 'invalid': $v.product.quantity.$invalid }" v-model.number="$v.product.quantity.$model" />
                    </div>
                    <div class="form-group">
                        <label class="form-control-label" for="product-status">Status</label>
                        <input type="text" class="form-control" name="status" id="product-status"
                            :class="{'valid': !$v.product.status.$invalid, 'invalid': $v.product.status.$invalid }" v-model="$v.product.status.$model" />
                    </div>
                    <div class="form-group">
                        <label class="form-control-label" for="product-category">Category</label>
                        <select class="form-control" id="product-category" name="category" v-model="product.category">
                            <option v-bind:value="null"></option>
                            <option v-bind:value="product.category && categoryOption.id === product.category.id ? product.category : categoryOption" v-for="categoryOption in categories" :key="categoryOption.id">{{categoryOption.id}}</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <input type="file" @change="onFileChange" />
                        <div id="preview">
                            <img v-if="url" :src="url" />
                        </div>
                    </div>
                </div>
                <div>
                    <button type="button" id="cancel-save" class="btn btn-secondary" v-on:click="previousState()">
                        <font-awesome-icon icon="ban"></font-awesome-icon>&nbsp;<span>Cancel</span>
                    </button>
                    <button type="submit" id="save-entity" :disabled="$v.product.$invalid || isSaving" class="btn btn-primary">
                        <font-awesome-icon icon="save"></font-awesome-icon>&nbsp;<span>Save</span>
                    </button>
                </div>
            </form>
        </div>
    </div>
</template>
<script lang="ts" src="./product-update.component.ts">
</script>
