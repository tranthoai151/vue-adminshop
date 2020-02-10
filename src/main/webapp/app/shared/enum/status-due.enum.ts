export enum StatusDue {
  DUE_ING = 'DUE_ING',
  DUE_ED = 'DUE_ED'
}

export namespace StatusDue {
  export function values() {
    return Object.keys(StatusDue).filter(type => isNaN(<any>type) && type !== 'values');
  }
}
