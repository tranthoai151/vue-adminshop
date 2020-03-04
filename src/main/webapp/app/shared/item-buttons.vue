<template>
  <div>
    <b-button-group>
      <b-button variant="success" v-on:click="clickDetail(entity)">Chi tiết</b-button>
      <b-button variant="info" v-on:click="clickUpdate(entity)">Cập nhật</b-button>
      <b-button variant="danger" v-on:click="clickRemove(entity)">Xoá</b-button>
    </b-button-group>
  </div>
</template>

<script lang="ts" src="./item-buttons.component.ts">
</script>
