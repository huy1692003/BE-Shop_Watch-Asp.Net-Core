myApp.controller("giohangCtrl",function($scope,$http)
{  
   
    $scope.getAll_Cart();
    $scope.delete_Cart=function(x)
    {     
       
        $http(
            {
                method:"DELETE",
                url:"https://localhost:44329/api/GioHang/delete_toCart/"+x.maGH              
            }
        ).then(function()
        {            
            $scope.listSP_order=[];
            $scope.listSP_select=[];
            $scope.TinhTongTien()
            $scope.getAll_Cart();           
           
            
        })
    }
    $scope.updateSL=function(x,slsp)
    {
        if(slsp===0)
        {
            slsp=1
        }
        console.log(slsp)
        $http(
            {
                method:"PUT",
                url:"https://localhost:44329/api/GioHang/update_SLCart/"+x.maGH+"/"+slsp
            }
        ).then(function()
        {
         
                  
          $scope.listSP_order=[];
          $scope.listSP_select=[];
          $scope.TinhTongTien()
          $scope.getAll_Cart();   
           
           
        })
    }
    $scope.listSP_order=[];
    $scope.listSP_select=[];
    $scope.thanhtien=0;
    $scope.add_listSP_order=function(obj)
    {
        
        var index=$scope.listSP_select.findIndex(x=>x.maSP==obj.maSP)
        // Tạo mới đối tượng chi tiết đơn hàng
        var objCTDH={
            "maChiTietHD": 0,
            "maHD": 0,
            "maSP": obj.maSP,
            "imageSP": obj.anhSP,
            "tenSP": obj.tenSP,
            "soLuong": obj.soluong,
            "giaBan": obj.giaban,
            "tongTien": obj.tongtien
        }
        
        if(index===-1)
        {
            $scope.listSP_order.push(objCTDH)
            $scope.listSP_select.push(obj)
            $scope.TinhTongTien();
        }
        else
        {
            $scope.listSP_order.splice(index,1)
            $scope.listSP_select.splice(index,1)
            $scope.TinhTongTien();
        }
        console.log( $scope.listSP_select)


        // Kiểm tra disable 
        
        
    }
    $scope.TinhTongTien=function()
    {     
        $scope.thanhtien=0
        $scope.listSP_select.forEach(x => {
        $scope.thanhtien+=x.tongtien
      });
    }
  
    $scope.deleteAll_Cart=function()
    {
       
      if($scope.listSP_select.length<1)
      {
        alert("Vui lòng chọn sản phẩm cần xóa")
      }
      else
      {
        var check=confirm("Bạn có chắc muốn xóa hết các sản phẩm đã chọn ?")
        if(check)
        {
            $scope.listSP_select.forEach(x => {
                $scope.delete_Cart(x)
            });
        }      
        $scope.TongTien();
       
      }
    }

    $scope.tenKH = "";
    $scope.diachi = "";
    $scope.email = "";
    $scope.sdt = "";
    $scope.diaChiGiaoHang = "";
    $scope.methodPay = "";
    $scope.ghichu = "";


    $scope.TaoDonHang=function()
    {
        if( $scope.checkInfor())
        {
                    if($scope.listSP_order.length>0)
                    {  
                            $http(
                                {
                                    method:"POST",
                                    url:"https://localhost:44329/api/DonHang/create_hdb_byuser",
                                    data: {
                                        "maHD": 0,
                                        "trangThai": 0,
                                        "ngayTao": "2023-11-17T12:17:57.143Z",
                                        "ngayDuyet": "2023-11-17T12:17:57.143Z",
                                        "ngayHuy": "2023-11-17T12:17:57.143Z",
                                        "tenKH": $scope.tenKH,
                                        "diachi": $scope.diachi,
                                        "email": $scope.email,
                                        "sdt": $scope.sdt+'',
                                        "diaChiGiaoHang": $scope.diaChiGiaoHang,
                                        "thanhTien": $scope.thanhtien,
                                        "thoiGianGiaoHang": "2023-11-17T12:17:57.143Z",
                                        "tenTaiKhoan": $scope.user_Customer.taikhoan,
                                        "methodPay": $scope.methodPay,
                                        "chiTietHoaDonBan": $scope.listSP_order
                                    }    
                                }
                            ).then(function(reponse)
                                {
                                    alert(reponse.data)
                                    $scope.resetData();                                    
                                }).catch(function(error)
                                {
                                    console.log(error.data)
                                })
                        }                      
                
                    else{
                        alert("Vui lòng chọn sản phẩm cần mua !")
                    }
        }
        else
        {
            alert("Nhập đầy đủ và hợp lệ thông tin của đơn hàng !")
        }
        
    }
    $scope.checkInfor=function()
    {
        if (!$scope.tenKH || !$scope.diachi || !$scope.email || !$scope.sdt || !$scope.diaChiGiaoHang || !$scope.methodPay)
        {
           
            return false;
        }

        // Các điều kiện kiểm tra khác có thể được thêm vào ở đây tùy thuộc vào yêu cầu của bạn.

        // Nếu tất cả đều hợp lệ, trả về true
        return true;
    }
    $scope.resetData=function()
    {
        $scope.tenKH = "";
        $scope.diachi = "";
        $scope.email = "";
        $scope.sdt = "";
        $scope.diaChiGiaoHang = "";
        $scope.methodPay = "";
        $scope.ghichu = "";
        $scope.listSP_select.forEach(x => {
            $scope.delete_Cart(x)
            });
                 
        $scope.listSP_order=[];
        $scope.listSP_select=[];             
        $scope.thanhtien=0
    }
})