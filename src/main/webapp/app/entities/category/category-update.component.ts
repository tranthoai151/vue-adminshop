import { Component, Vue, Inject } from 'vue-property-decorator';

import { numeric, required, minLength, maxLength } from 'vuelidate/lib/validators';

import ProductService from '../product/product.service';
import { IProduct } from '@/shared/model/product.model';

import AlertService from '@/shared/alert/alert.service';
import { ICategory, Category } from '@/shared/model/category.model';
import CategoryService from './category.service';

const validations: any = {
  category: {
    name: {
      required
    },
    imgUrl: {},
    status: {}
  }
};

@Component({
  validations
})
export default class CategoryUpdate extends Vue {
  @Inject('alertService') private alertService: () => AlertService;
  @Inject('categoryService') private categoryService: () => CategoryService;
  public category: ICategory = new Category();

  @Inject('productService') private productService: () => ProductService;

  public products: IProduct[] = [];
  public isSaving = false;
  public url = null;
  public file = null;

  beforeRouteEnter(to, from, next) {
    next(vm => {
      if (to.params.categoryId) {
        vm.retrieveCategory(to.params.categoryId);
      }
      vm.initRelationships();
    });
  }
  onFileChange(e) {
    this.file = e.target.files[0];
    this.url = URL.createObjectURL(this.file);
  }

  public save(): void {
    console.log(this.url);
    this.isSaving = true;
    if (this.category.id) {
      this.categoryService()
        .update(this.category)
        .then(param => {
          this.isSaving = false;
          this.$router.go(-1);
          const message = 'A Category is updated with identifier ' + param.id;
          this.alertService().showAlert(message, 'info');
        });
    } else {
      const fileUpload: FormData = this.getFileUploadInformation();
      this.categoryService()
        .create(this.category, fileUpload)
        .then(param => {
          this.isSaving = false;
          this.$router.go(-1);
          const message = 'A Category is created with identifier ' + param.id;
          this.alertService().showAlert(message, 'success');
        });
    }
  }

  public retrieveCategory(categoryId): void {
    this.categoryService()
      .find(categoryId)
      .then(res => {
        this.category = res;
        this.url = 'http://localhost:8080' + res.imgUrl;
      });
  }

  public previousState(): void {
    this.$router.go(-1);
  }

  public initRelationships(): void {
    this.productService()
      .retrieve()
      .then(res => {
        this.products = res.data;
      });
  }
  public getFileUploadInformation() {
    const fileUpload = new FormData();
    fileUpload.append('files', this.file);
    return fileUpload;
  }
}
