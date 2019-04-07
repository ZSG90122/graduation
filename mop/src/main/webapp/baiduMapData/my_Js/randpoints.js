

function rand_points(currentpoints_x,currentpoints_y)
{
	var rand_R = 10;

    var pointarray = [];
    // var OBJ = {JSON_Data:pointarray}
    var temp_x = currentpoints_x;
    var temp_y = currentpoints_y;
    var tempare = 20;
    var pointsObject = {"lng":116.418261,"lat":39.921984,"count":50};
// var points =[
//     {"lng":116.418261,"lat":39.921984,"count":50},
	for (var i=0; i < rand_R*100; i++)
	{
		temp_x += 0.00001;
		temp_y += 0.00001;
       // tempare = tempare +0.1;
        if(tempare>=100)
        {
          tempare = tempare - 0.2;
        }
        else
        {
		 tempare = tempare +0.2;
        }
		var tempobj = {"lng":temp_x,"lat":temp_y,"count":tempare};

          pointarray.push(tempobj);
	}

	return pointarray;
}
 
/**
*得到垂直面天线方向图数据
*/
function getDirectionMapData_E()
{
   
}
/**
*
*/
function getDirectionMapData_H()
{

}
