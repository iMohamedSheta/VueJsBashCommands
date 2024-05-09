<script setup>
let msg = "Hello sheta from table 1";
</script>

<template>
  <!-- CONTAINER -->
                    <div class="main-container container-fluid">

                        <!-- PAGE-HEADER -->
                        <div class="page-header">
                            <h1 class="page-title">Editor-Table</h1>
                            <div>
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="#">Tables</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Editor-Table</li>
                                </ol>
                            </div>
                        </div>
                        <!-- PAGE-HEADER END -->

                                   <!-- Row -->
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="card">
                                    <div class="card-header">
                                        <h3 class="card-title">Add New Row with Edit Table</h3>
                                    </div>
                                    <div class="card-body">
                                        <button id="table2-new-row-button" class="btn btn-primary mb-4"> Add New Row</button>
                                        <div class="table-responsive">
                                            <table class="table table-bordered border text-nowrap mb-0" id="new-edit">
                                                <thead>
                                                    <tr>
                                                        <th>First name</th>
                                                        <th>Last name</th>
                                                        <th>Position</th>
                                                        <th>Start date</th>
                                                        <th>Salary</th>
                                                        <th>E-mail</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td>Bella</td>
                                                        <td>Chloe</td>
                                                        <td>System Developer</td>
                                                        <td>2018/03/12</td>
                                                        <td>$654,765</td>
                                                        <td>b.Chloe@datatables.net</td>
                                                    </tr>
                                                 </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- End Row -->

                                </div>
                    <!-- CONTAINER CLOSED -->
</template>

<style scoped>
/* Your scoped styles here */
</style>
