import { IProduct } from '@/shared/model/product.model';

export interface ICategory {
  id?: number;
  name?: string;
  imgUrl?: string;
  status?: string;
  products?: IProduct[];
}

export class Category implements ICategory {
  constructor(public id?: number, public name?: string, public imgUrl?: string, public status?: string, public products?: IProduct[]) {}
}
