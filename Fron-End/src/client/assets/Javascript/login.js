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
                    url:"https://localhost:44329/api/TaiKhoan/Login",
                    data:{
                        "username": $scope.username,
                        "password": $scope.password,
                        "role":2
                    }
                }               
            ) .then(function(response)
            {
                alert("Đăng nhập thành công")
                var user=JSON.stringify(response.data)
                localStorage.setItem("user_Customer",user)
                console.log(localStorage.getItem("user_Customer"))
                location.href="./index.html"
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