const myAPP=angular.module("loginModule",[]).controller("loginCtrl",function($scope,$http)
{
    $scope.username=null;
    $scope.password=null;
    $scope.checkAccount=function()
    {
        if($scope.username!=null&&$scope.password!=null)
        {
            localStorage.removeItem("user_admin")
            $http(
                {
                    method:"POST",
                    url:"http://localhost:8888/TaiKhoan/Login",
                    data:{
                        "username": $scope.username,
                        "password": $scope.password,
                        "role":1
                    }
                }               
            ) .then(function(response)
            {
                alert("Đăng nhập thành công")
                var user=JSON.stringify(response.data)
                localStorage.setItem("user_admin",user)                
                $scope.user_admin=localStorage.getItem("user_admin")
                console.log($scope.user_admin)
                location.href="./home.html"
            }).catch(function(error)
            {
                alert("Thông tin tài khoản hoặc mật khẩu không chính xác !")
            })
        }
        else{
            alert("Hãy nhập đầy đủ thông tin tài khoản mật khẩu !")
        }
    }
})