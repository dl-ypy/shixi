 var optionA = {
    title : {
        text: '动态数据',
        subtext: '纯属虚构'
    },
    tooltip : {
        trigger: 'axis'
    },
    legend: {
        data:['最新成交价', '预购队列']
    },
    toolbox: {
        show : true,
        feature : {
            mark : {show: true},
            dataView : {show: true, readOnly: false},
            magicType : {show: true, type: ['line', 'bar']},
            restore : {show: true},
            saveAsImage : {show: true}
        }
    },
    dataZoom : {
        show : false,
        start : 0,
        end : 100
    },
    xAxis : [
        {
            type : 'category',
            boundaryGap : true,
            data : (function (){
                var now = new Date();
                var res = [];
                var len = 10;
                while (len--) {
                    res.unshift(now.toLocaleTimeString().replace(/^\D*/,''));
                    now = new Date(now - 2000);
                }
                return res;
            })()
        },
        {
            type : 'category',
            boundaryGap : true,
            data : (function (){
                var res = [];
                var len = 10;
                while (len--) {
                    res.push(len + 1);
                }
                return res;
            })()
        }
    ],
    yAxis : [
        {
            type : 'value',
            scale: true,
            name : '价格',
            boundaryGap: [0.2, 0.2]
        },
        {
            type : 'value',
            scale: true,
            name : '预购量',
            boundaryGap: [0.2, 0.2]
        }
    ],
    series : [
        {
            name:'预购队列',
            type:'bar',
            xAxisIndex: 1,
            yAxisIndex: 1,
            data:(function (){
                var res = [];
                var len = 10;
                while (len--) {
                    res.push(Math.round(Math.random() * 1000));
                }
                return res;
            })()
        },
        {
            name:'最新成交价',
            type:'line',
            data:(function (){
                var res = [];
                var len = 10;
                while (len--) {
                    res.push((Math.random()*10 + 5).toFixed(1) - 0);
                }
                return res;
            })()
        }
    ]
};
 //---------------------------------
 optionB = {
    title : {
        text: '动态数据',
        subtext: '纯属虚构'
    },
    tooltip : {
        trigger: 'item'
    },
    legend: {
        data:['随机数据1','随机数据2','随机数据3','随机数据4','随机数据5']
    },
    toolbox: {
        show : true,
        feature : {
            mark : {show: true},
            dataView : {show: true, readOnly: false},
            restore : {show: true},
            saveAsImage : {show: true}
        }
    },
    polar : [
        {
            indicator : [
                { text : '指标一' },
                { text : '指标二' },
                { text : '指标三' },
                { text : '指标四' },
                { text : '指标五' }
            ],
            center : [900, 225],
            radius : 100
        }
    ],
    calculable : false,
    series : [
        {
            name:'pie',
            type:'pie',
            radius : [0, 110],
            center: [250, 225],
            data: (function (){
                var res = [];
                var len = 0;
                while (len++ < 5) {
                    res.push({
                        name: '随机数据' + len,
                        value: Math.round(Math.random()*10)
                    });
                }
                return res;
            })()
        },
        {
            name: 'radar',
            type: 'radar',
            itemStyle: {normal: {areaStyle: {type: 'default'}}},
            data: (function (){
                var res = [];
                var len = 0;
                while (len++ < 3) {
                    res.push({
                        name: 'data' + len,
                        value: [
                            Math.round(Math.random()*100),
                            Math.round(Math.random()*100),
                            Math.round(Math.random()*100),
                            Math.round(Math.random()*100),
                            Math.round(Math.random()*100)
                        ]
                    });
                }
                return res;
            })()
        }
    ]
};