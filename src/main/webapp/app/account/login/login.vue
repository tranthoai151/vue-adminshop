<template>
    <div class="container">
    <div class="row">
        <div class="col-md-12 min-vh-100 d-flex flex-column justify-content-center">
            <div class="row">
                <div class="col-lg-6 col-md-8 mx-auto">
                    <!-- form card login -->
                    <div class="card rounded shadow shadow-sm">
                        <div class="card-header">
                            <h3 class="mb-0">Login</h3>
                        </div>
                        <div class="card-body">
                            <form class="form" role="form" autocomplete="off" id="formLogin" novalidate="" v-on:submit.prevent="doLogin()">
                                <div class="form-group">
                                    <label for="uname1">Tên đăng nhập</label>
                                    <input type="text" 
                                        class="form-control form-control-lg rounded-0" 
                                        name="username" 
                                        id="uname1" 
                                        required=""
                                        v-model="login">
                                    <div class="invalid-feedback">Oops, you missed this one.</div>
                                </div>
                                <div class="form-group">
                                    <label>Mật khẩu</label>
                                    <input type="password" 
                                        class="form-control form-control-lg rounded-0" 
                                        id="pwd1" 
                                        name="password" 
                                        required="" 
                                        autocomplete="new-password"
                                        v-model="password">
                                    <div class="invalid-feedback">Enter your password too!</div>
                                </div>
                                <div>
                                    <label class="custom-control custom-checkbox">
                                      <input type="checkbox" class="custom-control-input">
                                      <span class="custom-control-indicator"></span>
                                      <span class="custom-control-description small text-dark">Remember me on this computer</span>
                                    </label>
                                </div>
                                <button type="submit" class="btn btn-success btn-lg float-right" id="btnLogin">Đăng nhập</button>
                            </form>
                        </div>
                        <!--/card-block-->
                    </div>
                    <!-- /form card login -->

                </div>


            </div>
            <!--/row-->

        </div>
        <!--/col-->
    </div>
    <!--/row-->
</div>
<!--/container-->
</template>

<script lang='ts' src='./login.component.ts'>
</script>

<style scoped>
.bg-purple {
    background-color: var(--purple);
}
</style>
