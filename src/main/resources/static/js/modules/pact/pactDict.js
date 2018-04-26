$(function () {
    $("#jqGrid").jqGrid({
        url: baseURL + 'pactDict/list',
        datatype: "json",
        colModel: [			
			{ label: '占位名ID', name: 'id', index: "id", width: 45, key: true },
			{ label: '占位名', name: 'dictKey', width: 75 },
			{ label: '占位值SQL', name: 'dictValue', width: 90 }
        ],
		viewrecords: true,
        height: 385,
        rowNum: 10,
		rowList : [10,30,50],
        rownumbers: true, 
        rownumWidth: 25, 
        autowidth:true,
        multiselect: true,
        pager: "#jqGridPager",
        jsonReader : {
            root: "page.list",
            page: "page.currPage",
            total: "page.totalPage",
            records: "page.totalCount"
        },
        prmNames : {
            page:"page", 
            rows:"limit", 
            order: "order"
        },
        gridComplete:function(){
        	//隐藏grid底部滚动条
        	$("#jqGrid").closest(".ui-jqgrid-bdiv").css({ "overflow-x" : "hidden" }); 
        }
    });
});

var vm = new Vue({
	el:'#rrapp',
	data:{
		q:{
			dictKey:null
		},
		showList: true,
		title:null,
		pactDict:{
			id:null,
			dictKey:null,
			dictValue:null
		}
	},
	methods: {
		query: function () {
			vm.reload();
		},
		add: function(){
			vm.showList = false;
			vm.title = "新增";
			vm.pactDict = {};
		},
		update: function () {
			var id = getSelectedRow();
			if(id == null){
				return ;
			}
			//var ids = $('#jqGrid').getDataIDs();//返回数据表的ID数组
            var getRow = $('#jqGrid').getRowData(id);//获取当前的数据行
			vm.pactDict = getRow;
			vm.showList = false;
            vm.title = "修改";
		},
		del: function () {
			var ids = getSelectedRows();
			if(ids == null){
				return ;
			}
			confirm('确定要删除选中的记录？', function(){
				$.ajax({
					type: "POST",
				    url: baseURL + "pactDict/delete",
                    contentType: "application/json",
				    data: JSON.stringify(ids),
				    success: function(r){
						if(r.code == 0){
							alert('操作成功', function(){
                                vm.reload();
							});
						}else{
							alert(r.msg);
						}
					}
				});
			});
		},
		saveOrUpdate: function () {
            if(vm.validator()){
                return ;
            }
			var url = vm.pactDict.id == null ? "pactDict/save" : "pactDict/update";
			$.ajax({
				type: "POST",
			    url: baseURL + url,
                contentType: "application/json",
			    data: JSON.stringify(vm.pactDict),
			    success: function(r){
			    	if(r.code === 0){
						alert('操作成功', function(){
							vm.reload();
						});
					}else{
						alert(r.msg);
					}
				}
			});
		},
		reload: function () {
			vm.showList = true;
			var page = $("#jqGrid").jqGrid('getGridParam','page');
			$("#jqGrid").jqGrid('setGridParam',{ 
                postData:{'dictKey':vm.q.dictKey},
                page:page
            }).trigger("reloadGrid");
		},
        validator: function () {
            if(isBlank(vm.pactDict.dictKey)){
                alert("占位名不能为空");
                return true;
            }
            if(isBlank(vm.pactDict.dictValue)){
                alert("占位值SQL不能为空");
                return true;
            }
        }
	}
});