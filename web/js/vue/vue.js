import { createApp } from 'vue'

alert(1);

createApp({
  data() {
    return {
      count: 0
    }
  }
}).mount('#app')