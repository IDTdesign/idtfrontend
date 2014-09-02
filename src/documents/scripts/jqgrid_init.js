var resizeTimer;
var containerWidth;
var gridParentSectionWidth;

//  GRID TEST DATA
var testData = [
    {date: "5/23/14", serviceName: {serName: "Int’l Calling Recharge", transType: "VISA ****1234"}, amount: "$5.00", action: "REPEAT"},
    {date: "2/16/14", serviceName: {serName: "IMTU: $5 Tigo Argentina to 1 (201) 204-1125", transType: "VISA ****1234"}, amount: "$5.00", action: "REPEAT"},
    {date: "11/23/13", serviceName: {serName: "Int’l Airtime Top Up", transType: "VISA ****1234"}, amount: "$25.00", action: "REPEAT"}

];

//  GRID INIT
$(function () {
    $("#testGrid").jqGrid({
        data: testData,
        datatype: "local",
        colNames: ["Date", "Service Name & TransType", "Amount", ""],
        colModel: [
            { name: "date", width: 70, fixed: true, resizable: false, align: "left", sortable: false },
            { name: "serviceName", formatter: serviceConcat, align: "left", sortable: false },
            { name: "amount", width: 70, fixed: true, resizable: false, align: "right", sortable: false },
            { name: "action", width: 80, fixed: true, resizable: false, align: "right", formatter: addAction, sortable: false},
        ],
        pager: "#pager",
        rowNum: 10,
        rowList: [10, 20, 30],
        viewrecords: true,
        autowidth: true,
        height: '100%'
    }); 
}); 

//  REPEAT BUTTON CREATE
function addAction(cellvalue, options, rowObject){
    return '<button class="btn btn-default btn-sm">'+cellvalue+'</button>';
}

//  TRANSACTION TYPE FORMATTER
function serviceConcat(cellvalue, options, rowObject){
    return cellvalue.serName+'<br/><span class="transaction-type">'+cellvalue.transType+'</span>';
}

//  GRID RESIZE ON WINDOW RESIZE
$(window).bind('resize', function () {
    clearTimeout(resizeTimer);
    resizeTimer = setTimeout(resizeGrid($("#testGrid")), 60);
});

//  TEMP. FOR CURRENT GRID (Resent Transactions) ONLY
function resizeGrid(grid){
    var docWidth = window.innerWidth;
    var currentWidth;
    if(docWidth < 1200){
        if(docWidth > 991){
            currentWidth = grid.parents(".container").width();
            grid.setGridWidth(currentWidth * 0.6 - 63);
        }        
        if(docWidth < 992 && docWidth > 767){
            currentWidth = grid.parents(".container").width();
            grid.setGridWidth(currentWidth-60);
        } else if(docWidth < 768){
            currentWidth = grid.parents(".container").width();
            grid.setGridWidth(currentWidth - 30);
        } 
    } else {
            currentWidth = grid.parents(".container").width();
            grid.setGridWidth(currentWidth*0.6 - 63);
    }
}