import { Component, Vue, Inject } from 'vue-property-decorator';

import { numeric, required, minLength, maxLength } from 'vuelidate/lib/validators';

import CategoryService from '../category/category.service';
import { ICategory } from '@/shared/model/category.model';

import AlertService from '@/shared/alert/alert.service';
import { IProduct, Product } from '@/shared/model/product.model';
import ProductService from './product.service';
import { Status } from '@/shared/enum/status.enum';

const validations: any = {
  product: {
    name: {
      required
    },
    imgUrl: {},
    price: {},
    discount: {},
    descriptions: {},
    quantity: {},
    status: {}
  }
};

@Component({
  validations
})
export default class ProductUpdate extends Vue {
  @Inject('alertService') private alertService: () => AlertService;
  @Inject('productService') private productService: () => ProductService;
  public product: IProduct = new Product();

  @Inject('categoryService') private categoryService: () => CategoryService;

  public categories: ICategory[] = [];
  public isSaving = false;
  public url = null;
  public file = null;
  public status = Status;

  beforeRouteEnter(to, from, next) {
    next(vm => {
      if (to.params.productId) {
        vm.retrieveProduct(to.params.productId);
      }
      vm.initRelationships();
    });
  }
  onFileChange(e) {
    this.file = e.target.files[0];
    this.url = URL.createObjectURL(this.file);
  }

  public save(): void {
    this.isSaving = true;
    if (this.product.id) {
      this.productService()
        .update(this.product)
        .then(param => {
          this.isSaving = false;
          this.$router.go(-1);
          const message = 'A Product is updated with identifier ' + param.id;
          this.alertService().showAlert(message, 'info');
        });
    } else {
      const fileUpload: FormData = this.getFileUploadInformation();
      this.productService()
        .create(this.product, fileUpload)
        .then(param => {
          this.isSaving = false;
          this.$router.go(-1);
          const message = 'A Product is created with identifier ' + param.id;
          this.alertService().showAlert(message, 'success');
        });
    }
  }

  public retrieveProduct(productId): void {
    this.productService()
      .find(productId)
      .then(res => {
        this.product = res;
        this.url = 'http://localhost:8080' + res.imgUrl;
      });
  }

  public previousState(): void {
    this.$router.go(-1);
  }

  public initRelationships(): void {
    this.categoryService()
      .retrieve()
      .then(res => {
        this.categories = res.data;
      });
  }
  public getFileUploadInformation() {
    const fileUpload = new FormData();
    fileUpload.append('files', this.file);
    return fileUpload;
  }
}
