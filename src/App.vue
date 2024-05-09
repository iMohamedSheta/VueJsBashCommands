
<template>
    <!-- GLOBAL-LOADER -->
    <div id="global-loader">
        <img src="@/assets/images/loader.svg" class="loader-img" alt="Loader">
    </div>
    <!-- /GLOBAL-LOADER -->
    <div class="page">
      <div class="page-main">
          <Header />
          <Sidebar />
           <!--app-content open-->
            <div class="main-content app-content mt-0">
                <div class="side-app">
                  <RouterView />
                </div>
              </div>
        </div>
        <sidebar-right />
        <lang-selector-modal />
        <Footer />
      
    </div>
</template>

<script setup>
import Header from "@/components/layout/header.vue";
import Sidebar from "@/components/layout/sidebar.vue";
import Footer from "@/components/layout/footer.vue";
import LangSelectorModal from "@/components/layout/component/langSelectorModal.vue"
import SidebarRight from "@/components/layout/component/sidebarRight.vue"

</script>

<style scoped>
/* Your scoped styles here */

</style>