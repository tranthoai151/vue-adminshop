<template>
    <div class="row justify-content-center">
        <div class="col-8">
            <div v-if="product">
                <h2 class="jh-entity-heading"><span>Product</span> {{product.id}}</h2>
                <dl class="row jh-entity-details">
                    <dt>
                        <span>Name</span>
                    </dt>
                    <dd>
                        <span>{{product.name}}</span>
                    </dd>
                    <dt>
                        <span>Img Url</span>
                    </dt>
                    <dd>
                        <span>{{product.imgUrl}}</span>
                    </dd>
                    <dt>
                        <span>Price</span>
                    </dt>
                    <dd>
                        <span>{{product.price}}</span>
                    </dd>
                    <dt>
                        <span>Discount</span>
                    </dt>
                    <dd>
                        <span>{{product.discount}}</span>
                    </dd>
                    <dt>
                        <span>Descriptions</span>
                    </dt>
                    <dd>
                        <span>{{product.descriptions}}</span>
                    </dd>
                    <dt>
                        <span>Quantity</span>
                    </dt>
                    <dd>
                        <span>{{product.quantity}}</span>
                    </dd>
                    <dt>
                        <span>Status</span>
                    </dt>
                    <dd>
                        <span>{{product.status}}</span>
                    </dd>
                    <dt>
                        <span>Category</span>
                    </dt>
                    <dd>
                        <div v-if="product.category">
                            <router-link :to="{name: 'CategoryView', params: {categoryId: product.category.id}}">{{product.category.id}}</router-link>
                        </div>
                    </dd>
                </dl>
                <button type="submit"
                        v-on:click.prevent="previousState()"
                        class="btn btn-info">
                    <font-awesome-icon icon="arrow-left"></font-awesome-icon>&nbsp;<span> Back</span>
                </button>
                <router-link v-if="product.id" :to="{name: 'ProductEdit', params: {productId: product.id}}" tag="button" class="btn btn-primary">
                    <font-awesome-icon icon="pencil-alt"></font-awesome-icon>&nbsp;<span> Edit</span>
                </router-link>
            </div>
        </div>
    </div>
</template>

<script lang="ts" src="./product-details.component.ts">
</script>
