/**
 * 
 */
$(() => {
	$.get(
		// url
		'web58_1.jsp',
		// callback function
		function(data, status) {
			if (status == 'success') {
				for (let i = 0; i < 9; i++) {
					$('#product').append(
						'<div class="product col-4 float-left ">' +
						'<div class="image-container">' +

						'<a href="#">' +
						`<img src="${data.color_picture.黑}" alt="">` +

						'<div class="image-overlay"></div>' +

						`<img class="second-image" src="${data.color_picture.黑}" alt="Second Image"></a></div>` +

						'<p class="title-name title"><a href="#">' +
						'商品編號: ' + data.productId +
						'<br>' +

						'商品名稱: ' + data.model +
						'<br>' +

						'商品價格: $' + data.price +

						'</a></p>' +
						'</div>' +
						'</div>'
					);
				}

			};
		}
	);

})
function search() {
	$.get(
		// url
		'web58_1.jsp?helmetId=' + $('#helmetId').val(),
		// callback function
		function(data, status) {
			if (status == 'success') {
				var color_picture = data.color_picture;
				var keys = Object.keys(color_picture);
				var picture;
				for (let i = 0; i < 1; i++) {
					var currentKey = keys[i];
					picture = color_picture[currentKey];
				}
    			
				$('#product').empty();

				$('#product').append(
					'<div class="product col-4 float-left ">' +
					'<div class="image-container">' +

					'<a href="#">' +
					`<img src="${picture}" alt="">` +

					'<div class="image-overlay"></div>' +

					`<img class="second-image" src="${picture}" alt="Second Image"></a></div>` +

					'<p class="title-name title"><a href="#">' +
					'商品編號: ' + data.productId +
					'<br>' +

					'商品名稱: ' + data.model +
					'<br>' +

					'商品價格: $' + data.price +

					'</a></p>' +
					'</div>' +
					'</div>'
				);
			};
		}
	);
}
