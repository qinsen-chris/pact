$(function () {
    $("#jqGrid").jqGrid({
        url: baseURL + 'pactTemplate/list',
        datatype: "json",
        colModel: [
            { label: '模板id', name: 'id', index: "id", width: 0, key: true ,hidden:true},
			{ label: '平台标识', name: 'platform', index: "platform", width: 45 },
			{ label: '模板名称', name: 'name',index: "name",  width: 75 },
			{ label: '最新版本号', name: 'newVersionId',index: "newVersionId", width: 20 },
			{ label: '创建时间', name: 'createTime', index: "create_time", width: 80}
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
            records: "page.totalCount",
            platformEnum:"platformEnum"
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
			platform: null,
			name: null
		},
		showList: true,
		title:null,
		pact:{
		},
		platformEnum:null

	},
	methods: {
		query: function () {
			vm.reload();
		},
		add: function(){
			vm.showList = false;
			vm.title = "新增";

			vm.pact = {};
			vm.platformEnum = {};
		},
		update: function () {
			var pactId = getSelectedRow();
			if(pactId == null){
			    alert("文档数据有问题，id不能为空！");
				return ;
			}
			var getRow = $('#jqGrid').getRowData(pactId);//获取当前的数据行
			vm.showList = false;
            vm.title = "修改";
			vm.pact = getRow;
			//vm.getPactTemplate(pactId);

		},
		del: function () {
			var pactIds = getSelectedRows();
			if(pactIds == null){
				return ;
			}
			
			confirm('确定要删除选中的记录？', function(){
				$.ajax({
					type: "POST",
				    url: baseURL + "pactTemplate/delete",
                    contentType: "application/json",
				    data: JSON.stringify(pactIds),
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

			var url = vm.pact.id == null ? "pactTemplate/save" : "pactTemplate/update" ;
			$.ajax({
				type: "POST",
			    url: baseURL + url,
                contentType: "application/json",
			    data: JSON.stringify(vm.pact),
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
		getPactTemplate: function(pactId){
			$.get(baseURL + "pactTemplate/info/"+pactId, function(r){
				vm.pact = r.pact;

			});
		},
		reload: function () {
			vm.showList = true;
			var page = $("#jqGrid").jqGrid('getGridParam','page');
			var platformEnum = $("#jqGrid").jqGrid('getGridParam','platformEnum');
			$("#jqGrid").jqGrid('setGridParam',{ 
                postData:{'platform': vm.q.platform,'name':vm.q.name},
                page:page
            }).trigger("reloadGrid");
		},
        validator: function () {
            if(isBlank(vm.pact.platform)){
                alert("平台标识不能为空");
                return true;
            }

            if(vm.pact.name == null && isBlank(vm.pact.name)){
                alert("文档名称不能为空");
                return true;
            }
        }
	}
});