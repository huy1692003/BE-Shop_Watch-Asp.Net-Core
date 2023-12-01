
myAdmin.controller("thongkeCtrl",function($scope,$http)
{
   
    $scope.getAllDH_CXN=function()
    {
        $http(
            {
                method:"GET",
                url:"http://localhost:8888/ThongKe/getHDB_CXN",
                headers: { "Authorization": 'Bearer ' + $scope.user.token }
            }
        ).then(function(reponse)
        {
            $scope.listHDB_CXN=reponse.data
            $scope.countHDB_CXN=$scope.listHDB_CXN.length
           
        })
    }
    $scope.getAllDH_CXN();
    $scope.getListKH=function()
    {
        $http(
            {
                method:"GET",
                url:"http://localhost:8888/ThongKe/getListKH_muanhieu",
                headers: { "Authorization": 'Bearer ' + $scope.user.token }
            }
        ).then(function(reponse)
        {
            $scope.listKH_muanhieu=reponse.data
            $scope.countListKH=$scope.listKH_muanhieu.length
            console.log(  $scope.listKH_muanhieu)
            console.log( $scope.countListKH)
        })
    }
   
    $scope.clickThongKe_KH=function()
    {
        $scope.showThongKe_main=false
        $scope.showThongKe_KH=true
        $scope.getListKH()
    }

    $scope.getListSP_banchay=function()
    {
        $http(
            {
                method:"GET",
                url:"http://localhost:8888/ThongKe/getListSP_BanChay",
                headers: { "Authorization": 'Bearer ' + $scope.user.token }
            }
        ).then(function(reponse)
        {
            $scope.listSP_banchay=reponse.data
            $scope.countListSP_banchay= $scope.listSP_banchay.length
           
        })
    }
    $scope.clickThongKeSP_banchay=function()
    {
        $scope.showThongKe_main=false
        $scope.showThongKe_SPbanchay=true
        $scope.getListSP_banchay()
    }



    $scope.time_start_input;
    $scope.time_end_input;
    $scope.time_start = "0"
    $scope.time_end = "0"

    $scope.formatdate=function(inputDate) {
        var date = new Date(inputDate);

        // Lấy ngày, tháng, năm
        var day = date.getDate();
        var month = date.getMonth() + 1; // Tháng bắt đầu từ 0, nên cộng thêm 1
        var year = date.getFullYear();

        // Đảm bảo rằng ngày và tháng có hai chữ số
        day = day < 10 ? '0' + day : day;
        month = month < 10 ? '0' + month : month;

        // Định dạng thành chuỗi "dd-MM-yyyy"
        return   year+ '-' + month +'-'+day;
    }
    $scope.getDoanhThu_time=function()
    {
        
        $http(
            {
                method:"POST",
                url:"http://localhost:8888/ThongKe/getListHDB_Date?time_start="+$scope.time_start+'&time_end='+$scope.time_end,                
                headers: { "Authorization": 'Bearer ' + $scope.user.token }

            }
        ).then(function(reponse)
        {
            $scope.listHDB_time=reponse.data.listDHB
            $scope.tongdoanhthu=reponse.data.tongdoanhthu
        })
    }

  



  
    $scope.clickThongke_doanhthu_time=function()
    {
       
        $scope.showThongKe_main=false
        $scope.showThongKe_DoanhThu_time=true
        $scope.getDoanhThu_time()
    }
    $scope.clickSearch_time=function()
    {
      if($scope.time_start_input && $scope.time_end_input)
      {
        $scope.time_start = $scope.formatdate($scope.time_start_input)
        $scope.time_end =$scope.formatdate($scope.time_end_input)       
        $scope.getDoanhThu_time()
      }
      else{
        alert("Hãy chọn thời gian cần tìm !")
      }
    }

    $scope.data_month=[]
    $scope.data_Doanhthu=[]
    $scope.getData_Chart = function() {
        $scope.data_month = $scope.objData_Chart.map(x => 'Tháng ' + x.thang);
        $scope.data_Doanhthu = $scope.objData_Chart.map(x => x.doanhThu);    
        const chartCanvas = document.getElementById("chart");  
        const chartContext = chartCanvas.getContext('2d');
        var line_chart = new Chart(chartContext, {
            type: "line",
            data: {
                labels: $scope.data_month,
                datasets: [{
                    label: "DoanhThu-2023",
                    data: $scope.data_Doanhthu
                }]
            }
        });
    };
    
    
    
    $scope.showDoanhThu_Chart=function()
    {
        
        $http(
            {
                method:"GET",
                url:"http://localhost:8888/ThongKe/showDoanhThu",                
                headers: { "Authorization": 'Bearer ' + $scope.user.token }

            }
        ).then(function(reponse)
        {
           $scope.objData_Chart=reponse.data 
           console.log($scope.objData_Chart)
           $scope.getData_Chart()          
        })
    }
    $scope.showDoanhThu_Chart()
  
  
})
