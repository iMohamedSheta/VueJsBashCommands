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
        <!-- lang-selector modal-->
        <div class="modal fade" id="country-selector">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content country-select-modal">
                    <div class="modal-header">
                        <h6 class="modal-title">Choose Country</h6><button aria-label="Close" class="btn-close" data-bs-dismiss="modal" type="button"><span aria-hidden="true">×</span></button>
                    </div>
                    <div class="modal-body">
                        <div class="row p-3">
                            <div class="col-lg-6">
                                <input type="radio" class="btn-check" name="btnradio" id="btnradio1"  checked="">
                                <label class="btn btn-country btn-lg btn-block" for="btnradio1">
                                <span class="country-selector"><img alt="" src="@/assets/images/flags/us_flag.jpg" class="me-3 language"></span>USA
                            </label>

                                <input type="radio" class="btn-check" name="btnradio" id="btnradio2" >
                                <label class="btn btn-country btn-lg btn-block" for="btnradio2">
                                <span class="country-selector"><img alt="" src="@/assets/images/flags/italy_flag.jpg" class="me-3 language"></span>Italy
                            </label>

                                <input type="radio" class="btn-check" name="btnradio" id="btnradio3" >
                                <label class="btn btn-country btn-lg btn-block" for="btnradio3">
                                <span class="country-selector"><img alt="" src="@/assets/images/flags/spain_flag.jpg" class="me-3 language"></span>Spain
                            </label>

                                <input type="radio" class="btn-check" name="btnradio" id="btnradio4" >
                                <label class="btn btn-country btn-lg btn-block" for="btnradio4">
                                <span class="country-selector"><img alt="" src="@/assets/images/flags/india_flag.jpg" class="me-3 language"></span>India
                            </label>

                                <input type="radio" class="btn-check" name="btnradio" id="btnradio5" >
                                <label class="btn btn-country btn-lg btn-block" for="btnradio5">
                                <span class="country-selector"><img alt="" src="@/assets/images/flags/french_flag.jpg" class="me-3 language"></span>French
                            </label>
                            </div>
                            <div class="col-lg-6">
                                <input type="radio" class="btn-check" name="btnradio" id="btnradio7" >
                                <label class="btn btn-country btn-lg btn-block" for="btnradio7">
                                <span class="country-selector"><img alt="" src="@/assets/images/flags/russia_flag.jpg" class="me-3 language"></span>Russia
                            </label>

                                <input type="radio" class="btn-check" name="btnradio" id="btnradio8" >
                                <label class="btn btn-country btn-lg btn-block" for="btnradio8">
                                <span class="country-selector"><img alt="" src="@/assets/images/flags/germany_flag.jpg" class="me-3 language"></span>Germany
                            </label>

                                <input type="radio" class="btn-check" name="btnradio" id="btnradio9" >
                                <label class="btn btn-country btn-lg btn-block" for="btnradio9">
                                <span class="country-selector"><img alt="" src="@/assets/images/flags/argentina.jpg" class="me-3 language"></span>Argentina
                            </label>

                                <input type="radio" class="btn-check" name="btnradio" id="btnradio10" >
                                <label class="btn btn-country btn-lg btn-block" for="btnradio10">
                                <span class="country-selector"><img alt="" src="@/assets/images/flags/malaysia.jpg" class="me-3 language"></span>Malaysia
                            </label>

                                <input type="radio" class="btn-check" name="btnradio" id="btnradio11" >
                                <label class="btn btn-country btn-lg btn-block" for="btnradio11">
                                <span class="country-selector"><img alt="" src="@/assets/images/flags/turkey.jpg" class="me-3 language"></span>Turkey
                            </label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- lang-selector modal-->
</template>

<style scoped>
/* Your scoped styles here */
</style>