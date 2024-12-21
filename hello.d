<!DOCTYPE html>
<html lang="ar">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>التقاط صورة</title>
    <style>
        video {
            width: 100%;
            height: auto;
        }
        #canvas {
            display: none;
        }
    </style>
</head>
<body>

    <h1>التقط صورة باستخدام كاميرا هاتفك</h1>

    <!-- فيديو من الكاميرا -->
    <video id="video" autoplay></video>

    <!-- زر لالتقاط الصورة -->
    <button id="capture">التقاط الصورة</button>

    <!-- عنصر لعرض الصورة الملتقطة -->
    <canvas id="canvas"></canvas>
    <img id="photo" alt="الصورة الملتقطة">

    <script>
        // الوصول إلى الكاميرا
        const video = document.getElementById('video');
        const canvas = document.getElementById('canvas');
        const photo = document.getElementById('photo');
        const captureButton = document.getElementById('capture');

        // طلب الوصول إلى الكاميرا
        navigator.mediaDevices.getUserMedia({ video: true })
            .then(function (stream) {
                video.srcObject = stream;
            })
            .catch(function (err) {
                console.log("لم يتمكن من الوصول إلى الكاميرا: ", err);
            });

        // التقاط الصورة عند الضغط على الزر
        captureButton.addEventListener('click', function () {
            // رسم الصورة على الـ canvas
            const context = canvas.getContext('2d');
            context.drawImage(video, 0, 0, canvas.width, canvas.height);

            // عرض الصورة الملتقطة
            const dataUrl = canvas.toDataURL('image/png');
            photo.src = dataUrl;
        });
    </script>

</body>
</html>
