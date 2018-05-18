$(function () {
    $("#jqGrid").jqGrid({
        url: baseURL + 'pactDictRelation/list',
        datatype: "json",
        colModel: [			
			{ label: 'ID', name: 'id', index: "id", width: 45, key: true },
			{ label: '模板版本id', name: 'pactTemplateId', width: 75 },
			{ label: '模板版本', name: 'name', width: 75 },
			{ label: '字典id', name: 'pactDictId', width: 90 },
			{ label: '字典', name: 'dictKey', width: 90 },
			{ label: '返回参数类型', name: 'resultType', width: 100 },
			{ label: '是否必输', name: 'must', width: 80, formatter: function(value, options, row){
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
			$("#jqGrid").setGridParam().hideCol("pactDictId").trigger("reloadGrid");
			$("#jqGrid").setGridParam().hideCol("pactTemplateId").trigger("reloadGrid");
        	//隐藏grid底部滚动条
        	$("#jqGrid").closest(".ui-jqgrid-bdiv").css({ "overflow-x" : "hidden" });
        }
    });
});

//字典数据
function pactDict() {
	$("#jqDictGrid").jqGrid({
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
//协议模板
function pactTemplate() {
	$("#jqTemplateGrid").jqGrid({
		url: baseURL + 'pactTemplate/list',
		datatype: "json",
		colModel: [
			{ label: '版本号', name: 'id', index: "id", width: 10, key: true ,hidden:true},
			{ label: '平台标识', name: 'platform', index: "platform", width: 30 },
			{ label: '模板名称', name: 'name',index: "name",  width: 95 },
			{ label: '创建时间', name: 'createTime', index: "create_time", width: 60}
		],
		viewrecords: true,
		height: 385,
		rowNum: 10,
		rowList : [10,30,50],
		rownumbers: true,
		rownumWidth: 25,
		autowidth:true,
		multiselect: true,
		pager: "#jqTemplateGridPager",
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
		templateQ:{
			name:null
		},
		showList: true,
		title:null,
		pactDict:{
			
		},
		pactDictRelation:{
			id:null,
			pactTemplateId:null,
			name:null,
			pactDictId:null,
			dictKey:null,
			resultType:null,
			must:true
		},
		isUpdate:false
	},
	methods: {
		query: function () {
			vm.reload();
		},
		add: function(){
			vm.showList = false;
			vm.isUpdate= false;
			vm.title = "新增";
		},
		update: function () {
			var id = getSelectedRow();
			if(id == null){
				return ;
			}
			vm.showList = false;
			vm.isUpdate=true;
            vm.title = "修改";
			var getRow = $('#jqGrid').getRowData(id);//获取当前的数据行
			vm.pactDictRelation = getRow;
			
			vm.pactDictRelation.must = getRow.must.indexOf("是") > -1 ? true : false;
		},
		del: function () {
			var ids = getSelectedRows();
			if(ids == null){
				return ;
			}
			
			confirm('确定要删除选中的记录？', function(){
				$.ajax({
					type: "POST",
				    url: baseURL + "pactDictRelation/delete",
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
                return;
            }
			var url = vm.pactDictRelation.id == null ? "pactDictRelation/save" : "pactDictRelation/update";

			$.ajax({
				type: "POST",
			    url: baseURL + url,
                contentType: "application/json",
			    data: JSON.stringify(vm.pactDictRelation),
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
                postData:{'username': vm.q.username},
                page:page
            }).trigger("reloadGrid");
		},
        validator: function () {
            if(isBlank(vm.pactDictRelation.pactTemplateId)){
                alert("模板协议必选");
                return true;
            }
            if(isBlank(vm.pactDictRelation.pactDictId)){
                alert("字典必选");
                return true;
            }

            if(isBlank(vm.pactDictRelation.resultType)){
                alert("返回参数类型不能为空");
                return true;
            }

            if(isBlank(vm.pactDictRelation.must)){
                alert("是否必输");
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
					vm.pactDictRelation.dictKey = rowData.dictKey;
					//实际保存ID
					vm.pactDictRelation.pactDictId = ids;
					layer.close(index);
				}
			});
			//字典加载
			pactDict();
		},
		addPactTemplate:function(){
        
			//新增弹窗
			layer.open({
				type : 1,
				offset : '150px',
				skin : 'layui-layer-molv',
				title : "选择模板",
				area : [ '600px', '350px' ],
				shade : 0,
				shadeClose : false,
				content : jQuery("#addPactTemplate"),
				btn : [ '确定', '取消' ],
				btn1 : function(index) {
					var ids=$('#jqTemplateGrid').jqGrid('getGridParam','selrow');
					if(ids == null ){
						alert("请至少选中一条数据！");
						return;
					}
					var rowData = $('#jqTemplateGrid').jqGrid('getRowData',ids);
					//用于显示
					vm.pactDictRelation.name = rowData.name;
					//实际保存ID
					vm.pactDictRelation.pactTemplateId = ids;
					layer.close(index);
				}
			});
			//模板加载
			pactTemplate();
		},
		dictionarySearch :function () {
			var page = $("#jqDictGrid").jqGrid('getGridParam','page');
			$("#jqDictGrid").jqGrid('setGridParam',{
				postData:{'dictKey': vm.dictQ.dictKey},
				page:page
			}).trigger("reloadGrid");
		},
		templateSearch :function () {
			var page = $("#jqTemplateGrid").jqGrid('getGridParam','page');
			$("#jqTemplateGrid").jqGrid('setGridParam',{
				postData:{'name': vm.templateQ.name},
				page:page
			}).trigger("reloadGrid");
		}

	}
});