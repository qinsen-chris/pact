$(function () {
    $("#jqGrid").jqGrid({
        url: baseURL + 'relationGenerateType/list',
        datatype: "json",
        colModel: [
			{ label: 'ID', name: 'id', index: "id", width: 45, key: true },
			{ label: '模板', name: 'name', width: 90 },
			{ label: '字典', name: 'dictKey', width: 90 },
			{ label: '模板字典关系Id', name: 'relationId',index: "relationId", width: 60},
			{ label: '标的协议下必输', name: 'bid', width: 60, formatter: function(value, options, row){
				return value === false ?
					'<span class="label label-danger">否</span>' :
					'<span class="label label-success">是</span>';
			}},
			{ label: '转让协议下必输', name: 'o2mBid', width: 60, formatter: function(value, options, row){
				return value === false ?
					'<span class="label label-danger">否</span>' :
					'<span class="label label-success">是</span>';
			}},
			{ label: '投资标的下必输', name: 'invest', width: 60, formatter: function(value, options, row){
				return value === false ?
					'<span class="label label-danger">否</span>' :
					'<span class="label label-success">是</span>';
			}},
			{ label: '投资转让下必输', name: 'o2mInvest', width: 60, formatter: function(value, options, row){
				return value === false ?
					'<span class="label label-danger">否</span>' :
					'<span class="label label-success">是</span>';
			}}

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
			$("#jqGrid").setGridParam().hideCol("relationId").trigger("reloadGrid");
        	//隐藏grid底部滚动条
        	$("#jqGrid").closest(".ui-jqgrid-bdiv").css({ "overflow-x" : "hidden" });
        }
    });
});

//字典数据
function pactDict() {
	$("#jqDictGrid").jqGrid({
		url: baseURL + 'pactDictRelation/list',
		datatype: "json",
		colModel: [
			{ label: 'ID', name: 'id', index: "id", width: 45, key: true },
			{ label: '模板版本', name: 'name', width: 75 },
			{ label: '字典', name: 'dictKey', width: 90 }
		],
		viewrecords: true,
		height: 385,
		rowNum: 10,
		rowList : [10,30,50],
		rownumbers: true,
		rownumWidth: 25,
		autowidth:true,
		multiselect: true,
		pager: "#jqDictGridPager",
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
}

var vm = new Vue({
	el:'#rrapp',
	data:{
		q:{
			name: null
		},
		dictQ:{
			dictKey: null
		},
		showList: true,
		title:null,
		relationGenerateType:{
			id:null,
			relationId:null,
			bid:true,
			o2mBid:false,
			invest:true,
			o2mInvest:true,
			name:null,
			dictKey:null
		},
		isModuleWrite:false,
		isDictWrite:false
	},
	methods: {
		query: function () {
			vm.reload();
		},
		add: function(){
			vm.showList = false;
			vm.title = "新增";
			vm.relationGenerateType.id = null;
			vm.isModuleWrite=true;
		},
		update: function () {
			var id = getSelectedRow();
			if(id == null){
				return ;
			}
			vm.showList = false;
            vm.title = "修改";
			var getRow = $('#jqGrid').getRowData(id);//获取当前的数据行
			vm.relationGenerateType = getRow;
			vm.isModuleWrite=true;
			vm.isDictWrite=true;
		},
		del: function () {
			var ids = getSelectedRows();
			if(ids == null){
				return ;
			}
			
			confirm('确定要删除选中的记录？', function(){
				$.ajax({
					type: "POST",
				    url: baseURL + "relationGenerateType/delete",
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

			var url = vm.relationGenerateType.id == null ? "relationGenerateType/save" : "relationGenerateType/update";

			$.ajax({
				type: "POST",
			    url: baseURL + url,
                contentType: "application/json",
			    data: JSON.stringify(vm.relationGenerateType),
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
                postData:{'name': vm.q.name},
                page:page
            }).trigger("reloadGrid");
		},
        validator: function () {
            if(isBlank(vm.relationGenerateType.relationId)){
                alert("字典必选");
                return true;
            }
            if(isBlank(vm.relationGenerateType.bid)){
                alert("标的协议必选");
                return true;
            }
            if(isBlank(vm.relationGenerateType.o2mBid)){
                alert("转让协议必选");
                return true;
            }
            if(isBlank(vm.relationGenerateType.invest)){
                alert("投资标的必选");
                return true;
            }
            if(isBlank(vm.relationGenerateType.o2mInvest)){
                alert("投资转让必选");
                return true;
            }
        },
		addContact:function(){
			//新增弹窗
			layer.open({
				type : 1,
				offset : '150px',
				skin : 'layui-layer-molv',
				title : "新增字典",
				area : [ '600px', '350px' ],
				shade : 0,
				shadeClose : false,
				content : jQuery("#addContacts"),
				btn : [ '确定', '取消' ],
				btn1 : function(index) {
					var ids=$('#jqDictGrid').jqGrid('getGridParam','selrow');
					if(ids == null ){
						alert("请至少选中一条数据！");
						return;
					}
					var rowData = $('#jqDictGrid').jqGrid('getRowData',ids);
					//用于显示
					vm.relationGenerateType.name = rowData.name;
					vm.relationGenerateType.dictKey = rowData.dictKey;
					//实际保存ID
					vm.relationGenerateType.relationId = ids;
					layer.close(index);
				}
			});
			//字典加载
			pactDict();
		},
		dictionarySearch :function () {
			var page = $("#jqDictGrid").jqGrid('getGridParam','page');
			$("#jqDictGrid").jqGrid('setGridParam',{
				postData:{'dictKey': vm.dictQ.dictKey},
				page:page
			}).trigger("reloadGrid");
		}
	}
});