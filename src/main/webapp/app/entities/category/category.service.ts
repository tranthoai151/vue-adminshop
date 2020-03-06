import axios from 'axios';

import buildPaginationQueryOpts from '@/shared/sort/sorts';

import { ICategory } from '@/shared/model/category.model';

const baseApiUrl = 'api/categories';

export default class CategoryService {
  public find(id: number): Promise<ICategory> {
    return new Promise<ICategory>(resolve => {
      axios.get(`${baseApiUrl}/${id}`).then(function(res) {
        resolve(res.data);
      });
    });
  }

  public retrieve(paginationQuery?: any): Promise<any> {
    return new Promise<any>(resolve => {
      axios.get(baseApiUrl + `?${buildPaginationQueryOpts(paginationQuery)}`).then(function(res) {
        resolve(res);
      });
    });
  }

  public delete(id: number): Promise<any> {
    return new Promise<any>(resolve => {
      axios.delete(`${baseApiUrl}/${id}`).then(function(res) {
        resolve(res);
      });
    });
  }

  public create(category: ICategory, data: FormData): Promise<ICategory> {
    data.append('jsonCategory', JSON.stringify(category));
    return new Promise<ICategory>(resolve => {
      axios.post(`${baseApiUrl}`, data).then(function(res) {
        resolve(res.data);
      });
    });
  }

  public update(category: ICategory, data: FormData): Promise<ICategory> {
    data.append('jsonCategory', JSON.stringify(category));
    return new Promise<ICategory>(resolve => {
      axios.put(`${baseApiUrl}`, data).then(function(res) {
        resolve(res.data);
      });
    });
  }
}
