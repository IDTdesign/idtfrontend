var resizeTimer;

//  GRID TEST DATA
var testData = [
    {date: "5/23/14", serviceName: {serName: "Int’l Calling Recharge", transType: "VISA ****1234"}, amount: "$5.00", action: "REPEAT"},
    {date: "2/16/14", serviceName: {serName: "IMTU: $5 Tigo Argentina to 1 (201) 204-1125", transType: "VISA ****1234"}, amount: "$5.00", action: "REPEAT"},
    {date: "11/23/13", serviceName: {serName: "Int’l Airtime Top Up", transType: "VISA ****1234"}, amount: "$25.00", action: "REPEAT"}

];
//  referrals GRID DATA
var refData = [
    {name: {fullName: "Rosy Blinder", phone: "973-438-2951"}, sendDate: "5/23/14", earned: "$1.00", status: "Signed up"},
    {name: {fullName: "Rivka Cogan", phone: "917-973-5983"}, sendDate: "5/20/14", earned: "$2.00", status: "Pending"}
]

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

//  referrals GRID INIT
$(function () {
    $("#referralsGrid").jqGrid({
        data: refData,
        datatype: "local",
        colNames: ["Invitation Sent To", "Send Date", "Credit Earned", "Status"],
        colModel: [
            { name: "name", align: "left", formatter: sentTo, sortable: false },
            { name: "sendDate", width: 100, align: "left", sortable: false },
            { name: "earned", width: 90, fixed: true, resizable: false, align: "right", sortable: false },
            { name: "status", width: 120, fixed: true, resizable: false, align: "left", formatter: formatStatus, sortable: false},
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

//  FORMAT STATUS CELL
function formatStatus(cellvalue, options, rowObject){
    switch (cellvalue){
        case "Signed up":
        return '<span class="success"><i class="glyphicon glyphicon-ok"></i><span> ' + cellvalue + '</span></span>';
            break;
        case "Pending":
        return '<span class="pending"><i class="glyphicon glyphicon-arrow-right"></i><span> ' + cellvalue + '</span></span>';
            break;
    }
}

//  SENT TO CELL
function sentTo(cellvalue, options, rowObject){
    return cellvalue.fullName+'<br/><span class="phone-num">' + cellvalue.phone + '</span>';
}


//  GRID RESIZE ON WINDOW RESIZE
$(window).bind('resize', function () {
    var currentGrid = $("#" + $(".ui-jqgrid-btable").attr('id'));
    clearTimeout(resizeTimer);
    resizeTimer = setTimeout(resizeGrid(currentGrid), 60);
});

//  RESIZE GRID
function resizeGrid(grid){
    var currWidth;
    grid.css('position', 'absolute');
    currWidth = grid.parents(".island").width();
    grid.css('position', 'static');
    grid.setGridWidth(currWidth);
}