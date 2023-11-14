const myAPP=angular.module("loginModule",[]).controller("loginCtrl",function($scope,$http)
{
    $scope.username=null;
    $scope.password=null;
    $scope.checkAccount=function()
    {
        if($scope.username!=null&&$scope.password!=null)
        {
            $http(
                {
                    method:"POST",
                    url:"https://localhost:44334/api/TaiKhoan/Login",
                    data:{
                        "username": $scope.username,
                        "password": $scope.password
                    }
                }               
            ) .then(function(response)
            {
                alert("Đăng nhập thành công")
                var user=JSON.stringify(response.data)
                localStorage.setItem("user",user)
                console.log(localStorage.getItem("user"))
                location.href="./home.html"
            }).catch(function(error)
            {
                alert("Đăng nhập thất bại hãy thử lại")
            })
        }
        else{
            alert("Hãy nhập đầy đủ thông tin tài khoản mật khẩu !")
        }
    }
})