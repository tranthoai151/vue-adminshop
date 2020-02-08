import { ICategory } from '@/shared/model/category.model';

export interface IProduct {
  id?: number;
  name?: string;
  imgUrl?: string;
  price?: string;
  discount?: number;
  descriptions?: string;
  quantity?: number;
  status?: string;
  category?: ICategory;
}

export class Product implements IProduct {
  constructor(
    public id?: number,
    public name?: string,
    public imgUrl?: string,
    public price?: string,
    public discount?: number,
    public descriptions?: string,
    public quantity?: number,
    public status?: string,
    public category?: ICategory
  ) {}
}
