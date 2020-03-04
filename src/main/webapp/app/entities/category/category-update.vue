<template>
    <div class="row justify-content-center">
        <div class="col-8">
            <form name="editForm" role="form" novalidate v-on:submit.prevent="save()" >
                <h2 id="shopdminApp.category.home.createOrEditLabel">Create or edit a Category</h2>
                <div>
                    <div class="form-group" v-if="category.id">
                        <label for="id">ID</label>
                        <input type="text" class="form-control" id="id" name="id"
                               v-model="category.id" readonly />
                    </div>
                    <div class="form-group">
                        <label class="form-control-label" for="category-name">Name</label>
                        <input type="text" class="form-control" name="name" id="category-name"
                            :class="{'valid': !$v.category.name.$invalid, 'invalid': $v.category.name.$invalid }" v-model="$v.category.name.$model"  required/>
                        <div v-if="$v.category.name.$anyDirty && $v.category.name.$invalid">
                            <small class="form-text text-danger" v-if="!$v.category.name.required">
                                This field is required.
                            </small>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="form-control-label" for="category-status">Status</label>
                        <b-form-select
                            id="input-3"
                            :options="status"
                            v-model="category.status"
                            required
                            ></b-form-select>
                        <!-- <input type="text" class="form-control" name="status" id="category-status"
                            :class="{'valid': !$v.category.status.$invalid, 'invalid': $v.category.status.$invalid }" v-model="$v.category.status.$model" /> -->
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
                    <button type="submit" id="save-entity" :disabled="$v.category.$invalid || isSaving" class="btn btn-primary">
                        <font-awesome-icon icon="save"></font-awesome-icon>&nbsp;<span>Save</span>
                    </button>
                </div>
            </form>
        </div>
    </div>
</template>
<script lang="ts" src="./category-update.component.ts">
</script>
<style scoped>
#preview {
  display: flex;
  justify-content: center;
  align-items: center;
}

#preview img {
  max-width: 100%;
  max-height: 500px;
}
</style>
