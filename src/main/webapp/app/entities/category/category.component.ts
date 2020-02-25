import { mixins } from 'vue-class-component';

import { Component, Inject } from 'vue-property-decorator';
import Vue2Filters from 'vue2-filters';
import { ICategory } from '@/shared/model/category.model';
import AlertMixin from '@/shared/alert/alert.mixin';

import CategoryService from './category.service';

@Component
export default class Category extends mixins(Vue2Filters.mixin, AlertMixin) {
  @Inject('categoryService') private categoryService: () => CategoryService;
  private removeId: number = null;
  public itemsPerPage = 5;
  public queryCount: number = null;
  public page = 1;
  public previousPage = 1;
  public propOrder = 'id';
  public reverse = false;
  public totalItems = 0;
  public categories: ICategory[] = [];
  public title = 'Tạo mới danh mục';
  public toLink: object = {
    name: 'CategoryCreate'
  };
  public fields = [
    { key: 'id', label: 'Mã danh mục', tdClass: 'align-middle' },
    { key: 'name', label: 'Tên danh mục', class: 'text-center', tdClass: 'align-middle' },
    { key: 'image', label: 'Hình ảnh', class: 'text-center', tdClass: 'align-middle' },
    { key: 'config', label: '', class: 'text-center', tdClass: 'align-middle' }
  ];
  public isFetching = false;

  public mounted(): void {
    this.retrieveAllCategorys();
  }

  public clear(): void {
    this.page = 1;
    this.retrieveAllCategorys();
  }

  public retrieveAllCategorys(): void {
    this.isFetching = true;

    const paginationQuery = {
      page: this.page - 1,
      size: this.itemsPerPage,
      sort: this.sort()
    };
    this.categoryService()
      .retrieve(paginationQuery)
      .then(
        res => {
          this.categories = res.data;
          this.totalItems = Number(res.headers['x-total-count']);
          this.queryCount = this.totalItems;
          this.isFetching = false;
        },
        err => {
          this.isFetching = false;
        }
      );
  }

  public prepareRemove(instance: ICategory): void {
    this.removeId = instance.id;
  }

  public removeCategory(): void {
    this.categoryService()
      .delete(this.removeId)
      .then(() => {
        const message = 'A Category is deleted with identifier ' + this.removeId;
        this.alertService().showAlert(message, 'danger');
        this.getAlertFromStore();

        this.removeId = null;
        this.retrieveAllCategorys();
        this.closeDialog();
      });
  }

  public sort(): Array<any> {
    const result = [this.propOrder + ',' + (this.reverse ? 'asc' : 'desc')];
    if (this.propOrder !== 'id') {
      result.push('id');
    }
    return result;
  }

  public loadPage(page: number): void {
    if (page !== this.previousPage) {
      this.previousPage = page;
      this.transition();
    }
  }

  public transition(): void {
    this.retrieveAllCategorys();
  }

  public changeOrder(propOrder): void {
    this.propOrder = propOrder;
    this.reverse = !this.reverse;
    this.transition();
  }

  public closeDialog(): void {
    (<any>this.$refs.removeEntity).hide();
  }
}
