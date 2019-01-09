<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no">
<title>����� �˻�</title>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2ea2633155fc8b442f8cc095a5798ccf&libraries=services"></script>
<style type="text/css">
#SearchAndMap {
	width: 60%;
	height: 780px;
	text-align: center;
}

#search {
	width: 100%;
	height: 80px;
	background-color: white;
	margin: 0 10px;
/* 	border: solid 1px black; */
	vertical-align: middle;
}

#wmap {
	
	width: 100%;
	height: 700px;
	border: solid 1px black;
	margin: 0 10px;
}

#map .buttons {
	position: absolute;
	top: 0;
	left: 0;
	z-index: 1000;
	padding: 5px;
}

#map .buttons .control-btn {
	margin: 0 5px 5px 0;
}

option {
	font-size: large;
}
</style>
</head>
<body>
<div id="L" align="center">
	<div id="SearchAndMap" >
		<form action="search.child" method="post">
		<div id="search">
			<div style=" margin :0 auto; /* vertical-align: middle; */ width : 100%; display: inline-block;">
				<div style="width:100%; height: 30px; margin:5px auto;">
					<div style="width:33%; float: left;">
					���� �������ּ���&nbsp;&nbsp;
					<select name="gu">
							<option>������</option>
							<option>������</option>
							<option>���ϱ�</option>
							<option>������</option>
							<option>���Ǳ�</option>
							<option>������</option>
							<option>���α�</option>
							<option>��õ��</option>
							<option>�����</option>
							<option>������</option>
							<option>���빮��</option>
							<option>���۱�</option>
							<option>������</option>
							<option>���빮��</option>
							<option>���ʱ�</option>
							<option>������</option>
							<option>���ϱ�</option>
							<option>���ı�</option>
							<option>��õ��</option>
							<option>��������</option>
							<option>��걸</option>
							<option>����</option>
							<option>���α�</option>
							<option>�߱�</option>
							<option>�߶���</option>
					</select>
					</div>
					<div style="width:33%; float: left;">
					����� ����&nbsp;&nbsp;
					<select name="type">
							<option value="">�����ϼ���</option>
							<option>����</option>
							<option>������</option>
							<option>�ΰ�</option>
							<option>���Ρ���ü��</option>
							<option>��ȸ��������</option>
							<option>����</option>
					</select>
					</div>
					<div style="width:33%; float: left;">
					��� ���� ����&nbsp;&nbsp;
					<select name="bus">
							<option value="">�����ϼ���</option>
							<option>�</option>
							<option>�̿</option>
					</select>
					</div>
				</div>
				<div style="width:100%; height : 30px; margin : 5px auto;">
				<input type="text" name="word" placeholder="�˻��� �ܾ �Է����ּ���">
				<input type="submit" value="�˻�">			
				</div>
			</div>
		</div>

		</form>
		<div id="wmap" align="center">
				<div id="map" style="width: 95%; height: 95%; margin: 15px auto;  padding:10px;"align="center"></div>

		
		
		</div>
		<script type="text/javascript">
		<%-- ���� ���� --%>
		var container = document.getElementById('map');
		var options = {
			center: new daum.maps.LatLng(33.450701, 126.570667),
			level: 3
		};

		var map = new daum.maps.Map(container, options);

		</script>
		<script type="text/javascript">
		<%--��ǥ ���� --%>
		var geocoder = new daum.maps.services.Geocoder();
		
		
		// ��Ŀǥ��
		 var positions = new Array();
		   
		   window.onload = function() {
		      for (var i = 0; i < positions.length; i ++) {
		          // ��Ŀ�� �����մϴ�
		          var marker = new daum.maps.Marker({
		              map: map, // ��Ŀ�� ǥ���� ����
		              position: positions[i].latlng // ��Ŀ�� ��ġ
		          });
		      
		          // ��Ŀ�� ǥ���� ���������츦 �����մϴ� 
		          var infowindow = new daum.maps.InfoWindow({
		              content: positions[i].content // ���������쿡 ǥ���� ����
		          });
		      
		          // ��Ŀ�� mouseover �̺�Ʈ�� mouseout �̺�Ʈ�� ����մϴ�
		          // �̺�Ʈ �����ʷδ� Ŭ������ ����� ����մϴ� 
		          // for������ Ŭ������ ����� ���� ������ ������ ��Ŀ���� �̺�Ʈ�� ��ϵ˴ϴ�
		          daum.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
		          daum.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
		      }
		   };
		   
		   
		   
		
		
		
		
		// HTML5�� geolocation���� ����� �� �ִ��� Ȯ���մϴ� 
		if (navigator.geolocation) {
		    
		    // GeoLocation�� �̿��ؼ� ���� ��ġ�� ���ɴϴ�
		    navigator.geolocation.getCurrentPosition(function(position) {
		        
		        var lat = position.coords.latitude, // ����
		            lon = position.coords.longitude; // �浵
		        
		        var locPosition = new daum.maps.LatLng(lat, lon), // ��Ŀ�� ǥ�õ� ��ġ�� geolocation���� ���� ��ǥ�� �����մϴ�
		            message = '<div style="padding:5px;">���� ��ġ �Դϴ�.</div>'; // ���������쿡 ǥ�õ� �����Դϴ�
		        
		        // ��Ŀ�� ���������츦 ǥ���մϴ�
		        displayMarker(locPosition, message);
		            
		      });
		    
		} else { // HTML5�� GeoLocation�� ����� �� ������ ��Ŀ ǥ�� ��ġ�� ���������� ������ �����մϴ�
		    
		    var locPosition = new daum.maps.LatLng(33.450701, 126.570667),    
		        message = '���� ��ġ�� ã�� �� �����ϴ�. '
		        
		    displayMarker(locPosition, message);
		}
		
		
		// Ŭ���� �������� 
		// ���������츦 ǥ���ϴ� Ŭ������ ����� �Լ��Դϴ� 
		   function makeOverListener(map, marker, infowindow) {
		       return function() {
		           infowindow.open(map, marker);
		       };
		   }
		   
		   // ���������츦 �ݴ� Ŭ������ ����� �Լ��Դϴ� 
		   function makeOutListener(infowindow) {
		       return function() {
		           infowindow.close();
		       };
		   }
		   
		var callback = function(result, status) {
		    if (status === daum.maps.services.Status.OK) {
		        console.log(result);
		    }
		};
		</script>
		<c:forEach var="addrs" items="${addr}">
		<script>
		geocoder.addressSearch(${addrs}, callback);
		</script>
		</c:forEach>
		<script>
		// ������ ��Ŀ�� ���������츦 ǥ���ϴ� �Լ��Դϴ�
		function displayMarker(locPosition, message) {

		    // ��Ŀ�� �����մϴ�
		    var marker = new daum.maps.Marker({  
		        map: map, 
		        position: locPosition
		    }); 
		    
		 	// ��Ŀ�� ���� ���� ǥ�õǵ��� �����մϴ�
			marker.setMap(map);

		    var iwContent = message, // ���������쿡 ǥ���� ����
		        iwRemoveable = true;

		    // ���������츦 �����մϴ�
		    var infowindow = new daum.maps.InfoWindow({
		        content : iwContent,
		        removable : iwRemoveable
		    });
		    
		    // ���� �߽���ǥ�� ������ġ�� �����մϴ�
		    map.setCenter(locPosition);  
            // ��Ŀ�� �巡�� �����ϵ��� �����մϴ� 
			marker.setDraggable(true);
			// ���������츦 ��Ŀ���� ǥ���մϴ� 
		    infowindow.open(map, marker);
		}    
	
	  </script>
      <c:forEach items="${daycarelist}" var="daycare">	<!-- ����Ʈ ��� -->
      <script type="text/javascript">
         var content = {
              	 content: '<div>${daycare.name}</div>', /* �̸� */
                 latlng: new daum.maps.LatLng("${daycare.lat}", "${daycare.lon}")/* ���� �浵 */
         }
         positions.push(content);
      </script>
      </c:forEach>
	
	
	
	<div class="map_wrap">
    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>

    <div id="menu_wrap" class="bg_white">
        <div class="option">
            <div>
                <form onsubmit="searchPlaces(); return false;">
                    Ű���� : <input type="text" value="���¿� ����" id="keyword" size="15"> 
                    <button type="submit">�˻��ϱ�</button> 
                </form>
            </div>
        </div>
        <hr>
        <ul id="placesList"></ul>
        <div id="pagination"></div>
    </div>
</div>
	
	<script>
// ��Ŀ�� ���� �迭�Դϴ�
var markers = [];

var mapContainer = document.getElementById('map'), // ������ ǥ���� div 
    mapOption = {
        center: new daum.maps.LatLng(37.566826, 126.9786567), // ������ �߽���ǥ
        level: 3 // ������ Ȯ�� ����
    };  

// ��� �˻� ��ü�� �����մϴ�
var ps = new daum.maps.services.Places();  

// �˻� ��� ����̳� ��Ŀ�� Ŭ������ �� ��Ҹ��� ǥ���� ���������츦 �����մϴ�
var infowindow = new daum.maps.InfoWindow({zIndex:1});

// Ű����� ��Ҹ� �˻��մϴ�
searchPlaces();

// Ű���� �˻��� ��û�ϴ� �Լ��Դϴ�
function searchPlaces() {

    var keyword = document.getElementById('keyword').value;

    if (!keyword.replace(/^\s+|\s+$/g, '')) {
        alert('Ű���带 �Է����ּ���!');
        return false;
    }

    // ��Ұ˻� ��ü�� ���� Ű����� ��Ұ˻��� ��û�մϴ�
    ps.keywordSearch( keyword, placesSearchCB); 
}

// ��Ұ˻��� �Ϸ���� �� ȣ��Ǵ� �ݹ��Լ� �Դϴ�
function placesSearchCB(data, status, pagination) {
    if (status === daum.maps.services.Status.OK) {

        // ���������� �˻��� �Ϸ������
        // �˻� ��ϰ� ��Ŀ�� ǥ���մϴ�
        displayPlaces(data);

        // ������ ��ȣ�� ǥ���մϴ�
        displayPagination(pagination);

    } else if (status === daum.maps.services.Status.ZERO_RESULT) {

        alert('�˻� ����� �������� �ʽ��ϴ�.');
        return;

    } else if (status === daum.maps.services.Status.ERROR) {

        alert('�˻� ��� �� ������ �߻��߽��ϴ�.');
        return;

    }
}

// �˻� ��� ��ϰ� ��Ŀ�� ǥ���ϴ� �Լ��Դϴ�
function displayPlaces(places) {

    var listEl = document.getElementById('placesList'), 
    menuEl = document.getElementById('menu_wrap'),
    fragment = document.createDocumentFragment(), 
    bounds = new daum.maps.LatLngBounds(), 
    listStr = '';
    
    // �˻� ��� ��Ͽ� �߰��� �׸���� �����մϴ�
    removeAllChildNods(listEl);

    // ������ ǥ�õǰ� �ִ� ��Ŀ�� �����մϴ�
    removeMarker();
    
    for ( var i=0; i<places.length; i++ ) {

        // ��Ŀ�� �����ϰ� ������ ǥ���մϴ�
        var placePosition = new daum.maps.LatLng(places[i].y, places[i].x),
            marker = addMarker(placePosition, i), 
            itemEl = getListItem(i, places[i]); // �˻� ��� �׸� Element�� �����մϴ�

        // �˻��� ��� ��ġ�� �������� ���� ������ �缳���ϱ�����
        // LatLngBounds ��ü�� ��ǥ�� �߰��մϴ�
        bounds.extend(placePosition);

        // ��Ŀ�� �˻���� �׸� mouseover ������
        // �ش� ��ҿ� ���������쿡 ��Ҹ��� ǥ���մϴ�
        // mouseout ���� ���� ���������츦 �ݽ��ϴ�
        (function(marker, title) {
            daum.maps.event.addListener(marker, 'mouseover', function() {
                displayInfowindow(marker, title);
            });

            daum.maps.event.addListener(marker, 'mouseout', function() {
                infowindow.close();
            });

            itemEl.onmouseover =  function () {
                displayInfowindow(marker, title);
            };

            itemEl.onmouseout =  function () {
                infowindow.close();
            };
        })(marker, places[i].place_name);

        fragment.appendChild(itemEl);
    }

    // �˻���� �׸���� �˻���� ��� Elemnet�� �߰��մϴ�
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;

    // �˻��� ��� ��ġ�� �������� ���� ������ �缳���մϴ�
    map.setBounds(bounds);
}

// �˻���� �׸��� Element�� ��ȯ�ϴ� �Լ��Դϴ�
function getListItem(index, places) {

    var el = document.createElement('li'),
    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                '<div class="info">' +
                '   <h5>' + places.place_name + '</h5>';

    if (places.road_address_name) {
        itemStr += '    <span>' + places.road_address_name + '</span>' +
                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
    } else {
        itemStr += '    <span>' +  places.address_name  + '</span>'; 
    }
                 
      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
                '</div>';           

    el.innerHTML = itemStr;
    el.className = 'item';

    return el;
}

// ��Ŀ�� �����ϰ� ���� ���� ��Ŀ�� ǥ���ϴ� �Լ��Դϴ�
function addMarker(position, idx, title) {
    var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // ��Ŀ �̹��� url, ��������Ʈ �̹����� ���ϴ�
        imageSize = new daum.maps.Size(36, 37),  // ��Ŀ �̹����� ũ��
        imgOptions =  {
            spriteSize : new daum.maps.Size(36, 691), // ��������Ʈ �̹����� ũ��
            spriteOrigin : new daum.maps.Point(0, (idx*46)+10), // ��������Ʈ �̹��� �� ����� ������ �»�� ��ǥ
            offset: new daum.maps.Point(13, 37) // ��Ŀ ��ǥ�� ��ġ��ų �̹��� �������� ��ǥ
        },
        markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new daum.maps.Marker({
            position: position, // ��Ŀ�� ��ġ
            image: markerImage 
        });

    marker.setMap(map); // ���� ���� ��Ŀ�� ǥ���մϴ�
    markers.push(marker);  // �迭�� ������ ��Ŀ�� �߰��մϴ�

    return marker;
}

// ���� ���� ǥ�õǰ� �ִ� ��Ŀ�� ��� �����մϴ�
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}

// �˻���� ��� �ϴܿ� ��������ȣ�� ǥ�ô� �Լ��Դϴ�
function displayPagination(pagination) {
    var paginationEl = document.getElementById('pagination'),
        fragment = document.createDocumentFragment(),
        i; 

    // ������ �߰��� ��������ȣ�� �����մϴ�
    while (paginationEl.hasChildNodes()) {
        paginationEl.removeChild (paginationEl.lastChild);
    }

    for (i=1; i<=pagination.last; i++) {
        var el = document.createElement('a');
        el.href = "#";
        el.innerHTML = i;

        if (i===pagination.current) {
            el.className = 'on';
        } else {
            el.onclick = (function(i) {
                return function() {
                    pagination.gotoPage(i);
                }
            })(i);
        }

        fragment.appendChild(el);
    }
    paginationEl.appendChild(fragment);
}

// �˻���� ��� �Ǵ� ��Ŀ�� Ŭ������ �� ȣ��Ǵ� �Լ��Դϴ�
// ���������쿡 ��Ҹ��� ǥ���մϴ�
function displayInfowindow(marker, title) {
    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

    infowindow.setContent(content);
    infowindow.open(map, marker);
}

 // �˻���� ����� �ڽ� Element�� �����ϴ� �Լ��Դϴ�
function removeAllChildNods(el) {   
    while (el.hasChildNodes()) {
        el.removeChild (el.lastChild);
    }
}
</script>






>>>>>>> branch 'map' of https://github.com/ParkBum/child
	</div>
</div>
</body>
</html>