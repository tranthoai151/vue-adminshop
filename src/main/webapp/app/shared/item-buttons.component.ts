import Component from 'vue-class-component';
import { Prop, Vue } from 'vue-property-decorator';

@Component
export default class ItemButtonsComponent extends Vue {
  @Prop()
  entity: Object;

  @Prop()
  clickDetailEntiy;

  clickDetail(entity) {
    console.log('clickDetail', entity);
    this.$emit('clickDetailEntiy');
  }

  clickRemove(entity) {
    console.log('clickRemove', entity);
  }

  clickUpdate(entity) {
    console.log('clickUpdate', entity);
  }
}
