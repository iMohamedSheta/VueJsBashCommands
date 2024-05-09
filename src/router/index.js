import { createRouter, createWebHistory } from 'vue-router'
import Dashboard from '@/views/dashboard.vue'
import Table from '@/views/table.vue'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'dashboard',
      component: Dashboard
    },
    {
      path: '/table',
      name: 'table',
      component: Table
    }
  ]
})

export default router
