<script setup>
defineProps({
  /**
  msg: {
    type: String,
    required: true
  }
  **/
})
</script>

<template>

<!--APP-SIDEBAR-->
<div class="sticky">
  <div class="app-sidebar__overlay" data-bs-toggle="sidebar" ></div>
  <div class="app-sidebar">
      <div class="side-header">
          <router-link class="header-brand1" :to="{name: 'dashboard'}">
              <img src="@/assets/images/brand/logo.png" class="header-brand-img desktop-logo" alt="logo">
              <img src="@/assets/images/brand/logo-1.png" class="header-brand-img toggle-logo" alt="logo">
              <img src="@/assets/images/brand/logo-2.png" class="header-brand-img light-logo" alt="logo">
              <img src="@/assets/images/brand/logo-3.png" class="header-brand-img light-logo1" alt="logo">
          </router-link>
          <!-- LOGO -->
      </div>
      <div class="main-sidemenu">
          <div class="slide-left disabled" id="slide-left"><svg xmlns="http://www.w3.org/2000/svg" fill="#7b8191" width="24" height="24" viewBox="0 0 24 24"><path d="M13.293 6.293 7.586 12l5.707 5.707 1.414-1.414L10.414 12l4.293-4.293z"/></svg></div>
          <ul class="side-menu">
              <li class="sub-category">
                  <h3>Main</h3>
              </li>
              <li class="slide">
                  <router-link class="side-menu__item" data-bs-toggle="slide" :to="{name: 'dashboard'}"><i class="side-menu__icon fe fe-home"></i><span class="side-menu__label">Dashboard</span></router-link>
              </li>
            <li class="slide">
                  <router-link class="side-menu__item" data-bs-toggle="slide" :to="{name: 'table'}"><i class="side-menu__icon fe fe-users"></i><span class="side-menu__label">table</span></router-link>
              </li>
          </ul>
          <div class="slide-right" id="slide-right"><svg xmlns="http://www.w3.org/2000/svg" fill="#7b8191" width="24" height="24" viewBox="0 0 24 24"><path d="M10.707 17.707 16.414 12l-5.707-5.707-1.414 1.414L13.586 12l-4.293 4.293z"/></svg></div>
      </div>
  </div>
</div>

<!--/APP-SIDEBAR-->
</template>

<style scoped>
/* Your scoped styles here */
</style>