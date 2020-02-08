import Component from 'vue-class-component';
import { Prop, Vue } from 'vue-property-decorator';
import VueRouter from 'vue-router';

@Component
export default class AddItemEntity extends Vue {
  @Prop()
  title: String;

  @Prop()
  toLink;

  doChangePage() {
    this.$router.push({ name: this.toLink.name });
  }
}
