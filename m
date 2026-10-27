Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793105411;
	b=yG2/F391WLK/HC6idArAs1Zm2tVO/77BP/s/S3WgASgNS0D644B3PztO4Q13sLHJjHV0
	 kIH3qkkkGPhG+sZ2GefFWssS3Ju5uOfyUai+RpZn4LZ/WG5eAYmEhYgrwplbbe/cr5Shm
	 +hwHiHSIntMI60F0ZUsjcYyZu1TbmR4twildiVJSewlI6R7bxHjXqdr4bZMJWtfeagjZ2
	 qcEoHQ75puSoijvWjT84w0lFX/t3YtukT0ZOehk1aS5pMjZei/ssZvT9gpNyclU8JM98C
	 BegcyBjmsRwodtg4ttnut+UYorldqktwWADKWbq1YT1EqIXMt0E0dC4B8dfwAM8LeoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793105411;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=IAwqAAQD7kxOT9F2GvcLkLjakYWT0+JOrQ0Pn5dLBYQ=;
	b=bLcA87zaviW9yCTPikF1d6QpX0Kn6UQS1zQuOto7jr56HoAt1aa24u3IXe0b7p5Ow46T
	 BqEh/PYdeszZ3ZfXipANkC131B4xRKTC/GR0hIBvHSuVTCT9kgznhFDIYG8tDSFc65GEc
	 HhboDK/d2pSozYoqM58fGd3DI4sRBM57qVjAkjsdkE5CB75mutDzmjk4QgTqiYz6vpZ1F
	 3V6R95aS1fxaiAOid+ePtoVJfMFZRch0uS/xwObZkXgkAlO3o5e5erXwGoknMfdTcOP12
	 s4pv6yly8scU0kEu/Qk/TwyVAXbJfJ9Dbl5TIsTud3XHawce6H9EhKsXcCM9ODT8i4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NmiDqgRR;
	arc=none smtp.remote-ip=209.85.167.41
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3D260A263B
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 12:50:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E3D260A263B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NmiDqgRR
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5be4fea434bso741712e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 05:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793105409; x=1793710209; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IAwqAAQD7kxOT9F2GvcLkLjakYWT0+JOrQ0Pn5dLBYQ=;
        b=NmiDqgRRJrFmXSJIKbbdXABegTUZk0NZ6W3SMFeoK7ytpy859DpB0vLWWk62uy72mQ
         pjYh+EU5z+sZA1kfFMIrTvZhDlUciNH3ahDSHrCo6HP1QcGwD6O+YDtOovcxlTxHqNN4
         Ro+kBLbCWOtGF5rFurIW613Nu+0wZhXdZpEu442W4iwLLHs/hjUAR/earDMFAp3/UouE
         41zRkzSDusb840peCdvCfwDmpHcWRpVlOVJPVf0UHDD7HbGQ/6fUlMHtlC8qwacbXgFF
         LUleBgy9LOCvi8N+niD94TAuYGbhJFyMFzMhA/B3mQKjxu4KWIgniq9qJBQ1zRgW3akj
         IUWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793105409; x=1793710209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IAwqAAQD7kxOT9F2GvcLkLjakYWT0+JOrQ0Pn5dLBYQ=;
        b=SMscr6K1uXHmNNDAGIAXuQBPbSiT0xIgySCEg64b4uUpA3PFzu1RX7cLMU6XypwtCd
         fwSxEYdvkV31BJPnmojvIRYyMism7bJK4GLmIRqf3vDfG28dyeohYS12AYf/nSdCzaa8
         7exozwYfm/4e6I1TCCSYTvHfdo9B3aGFWSybTfIHmNMvCWz9rfOKKAHlHndWaiRiuE1R
         Yr2PzWzx7f/ZE2Or45SADCxKvC1mY22uYE5TIAqy+qYdGdjubZsYm47+m7ZXPIDiiZ5q
         ER2tQn1mJtuyBImcjvtBVBXntDYI1DfQiLGguK/m9QZlMr+VpKCwfckT9YKxZwFca6MM
         yEGA==
X-Forwarded-Encrypted: i=1; AKwUvBw/5DOTWMTvYtRRgh+IHc/S+xlWHowAkYa90sk+F/9Jx7gM/mDfRhiubx+fPOXxMeD7CskY+SeaAwA1BVdV@vger.kernel.org
X-Gm-Message-State: AFq9FYIrRKpnwFa4F4omAO5dIZ0e5MprtZcBH0fQJF2KnYmeaLndZMOG
	29UyrX1Z29pAPij3/SmPiteyQDM6HMzEd+R+j1D3Tg8yZYi1wbkg473j
X-Gm-Gg: AYBFou1A28Y5ZYv5+vMn2vSqjJbtmcZ6FhJ+G36U2y3GhkPXjemfqVpSojlK/9Njm6D
	UDpT0tt6R+RbhGpPw9iUaUuYeh34jbfRlj55DMY/MFH9Fex0/324o0UI8BU7A1EwiqddBA8YHkN
	RdQ7vusRvOQFes9fjaJLWPfiqnIYenvanMJ0gyUO58oJbob64+1+HvDR9B4YAtBtkAnUrF1XLkK
	iQMs6MOUkkhRH4RHuEz2x7qbcIBwpEKodnb1K4LO/z2FtVA2ahqNaAomjt5Qf8K6HN/CFJGgl6N
	onrpQtNjp7ByR3iqODNNv206uqsst4jyudnozwkKlzgvqcuwsY0+/xW/SUThS+hu1igXUKqejGF
	2Z7EG7AtL+tc/aVl9idfSwPTjGkLMcG9sYR39orClOsQ1NdppIqnKE1wW0V7LQeZIek7h4WaUqg
	M2tKHvIAZEl5dl5vUI3teB529o4GsVTPK1y58Lbm7kyoT5JPTbZe4MNoZ9D1iLMK/hYj2ZjV2UQ
	sfwwfpOCrOTVuSdF797mlaicra9MmFkSswofwpMfe083wKEiuv9BS5B0xCspjgCRz5G6ceaeG1O
	F7dyGGeakoExCsHK0eb6cNqXUBBMZjBb+Ik9vWk6pfVtk/VS+wxA/+8b3JHVF6034onTt6f9u0q
	yHHMV/1GGjQ==
X-Received: by 2002:a05:6512:3981:b0:5b8:f430:b617 with SMTP id 2adb3069b0e04-5bfc618c82bmr832927e87.45.1793105408719;
        Tue, 27 Oct 2026 05:50:08 -0700 (PDT)
Received: from yantra.. (nekmmqtcmoboczbkdcs-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:55c8:a52b:6ba2:979c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7e7cb24sm2052803e87.25.2026.10.27.05.50.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:50:08 -0700 (PDT)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: Alex Lanzano <lanzano.alex@gmail.com>,
	Andy Shevchenko <andy@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	David Lechner <dlechner@baylibre.com>,
	Guenter Roeck <groeck@chromium.org>,
	Jagath Jog J <jagathjog1996@gmail.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Jinseob Kim <kimjinseob88@gmail.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Remi Buisson <remi.buisson@tdk.com>
Cc: chrome-platform@lists.linux.dev,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rupesh Majhi <zoone.rupert@gmail.com>,
	Marco Elver <elver@google.com>,
	Bart Van Assche <bvanassche@acm.org>
Subject: [PATCH v4 6/9] iio: buffer-dma: annotate the queue lock helpers
Date: Tue, 27 Oct 2026 14:49:51 +0200
Message-ID: <20261027124954.110697-7-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261027124954.110697-1-zoone.rupert@gmail.com>
References: <20261027124954.110697-1-zoone.rupert@gmail.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

iio_dma_buffer_lock_queue() and iio_dma_buffer_unlock_queue() take and
release the queue lock for the core. Annotate them with that lock so
context analysis checks them.

Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
Cc: Marco Elver <elver@google.com>
Cc: Bart Van Assche <bvanassche@acm.org>

 drivers/iio/buffer/industrialio-buffer-dma.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/iio/buffer/industrialio-buffer-dma.c b/drivers/iio/buffer/industrialio-buffer-dma.c
index 1daac23087a7..b42b70e9b06d 100644
--- a/drivers/iio/buffer/industrialio-buffer-dma.c
+++ b/drivers/iio/buffer/industrialio-buffer-dma.c
@@ -763,6 +763,7 @@ struct device *iio_dma_buffer_get_dma_dev(struct iio_buffer *buffer)
 EXPORT_SYMBOL_NS_GPL(iio_dma_buffer_get_dma_dev, "IIO_DMA_BUFFER");
 
 void iio_dma_buffer_lock_queue(struct iio_buffer *buffer)
+	__acquires(&iio_buffer_to_queue(buffer)->lock)
 {
 	struct iio_dma_buffer_queue *queue = iio_buffer_to_queue(buffer);
 
@@ -771,6 +772,7 @@ void iio_dma_buffer_lock_queue(struct iio_buffer *buffer)
 EXPORT_SYMBOL_NS_GPL(iio_dma_buffer_lock_queue, "IIO_DMA_BUFFER");
 
 void iio_dma_buffer_unlock_queue(struct iio_buffer *buffer)
+	__releases(&iio_buffer_to_queue(buffer)->lock)
 {
 	struct iio_dma_buffer_queue *queue = iio_buffer_to_queue(buffer);
 
-- 
2.43.0

