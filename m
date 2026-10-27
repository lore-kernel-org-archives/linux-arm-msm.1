Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793105409;
	b=O3WnMuwM9iNkzoBxTSCqaAPIxMJJbSdZcegfZwxsJ7I8XUgMEmdwOvJzmdWTZHuWuZqb
	 f4bPZD0/RCXms4SeZc2m90eKHqZxpmdmel3UCM2sOZOxTIfaN2EzNBSNPMQrdKrrJhlei
	 qzR8MVFftXxc0Nhefo9I8fIcKRgtZjHt8oqi4MOLW50JMnpxl2FyFLum6sT053JMb4CG3
	 cgM6ipB7m4jpaPZvYWXErg2R0NMqkhhwtNtvSG9N/zgOBBMhAK3r1tkFL0W2/C5U4Vsku
	 kEXnt6WXCvBP9GOI2/oZhvGrGHuFNj/z5mSzlWOb0Rs3u3UKT9aalIDmGPzMLg7kBtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793105409;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=w9bm/VqfouJwe/E4PVyOUQraLP3MHwcXiPF4bxf1G7Y=;
	b=TMWJGn+LalDThVOykHLkJ5Uzi0x6ZNgezaxESwKoHKKrTj723BOGsqZYUQ8RsZwaYGuy
	 q7ylYnmIKAg4KsXvdUlsS5t6Xh1yVhfNvChkZUSpaux9oDqsa6O0IKF0Bx0pXWB1ixqOM
	 MXNHWiCVE4iaWU8B86vMzyBUO+IABTE490hmLWtCqGWvdChj2rE25aoh7mYgbe8Hc3np/
	 JlgnevOEp2CBb/eQTqFf+3UMchv0I9ZrubWuwe86icozAXHAxLMm9nk/zI1fYq/f/7MuY
	 KbSKU7kFygiJyABW+I6SaF0vlR2y0UZnoQY3svy7rwtfe/tC5vAQYIIP4dKRleRjytg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0OUrL+4G;
	arc=none smtp.remote-ip=209.85.208.170
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 956F3606A33A
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 12:50:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 956F3606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0OUrL+4G
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3ac8c03cea4so13739031fa.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 05:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793105408; x=1793710208; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w9bm/VqfouJwe/E4PVyOUQraLP3MHwcXiPF4bxf1G7Y=;
        b=0OUrL+4GZOE8uUTEfdA96OGH/ToNP4d63/vuiTYPji/+otCz4ks/vG1EWxNvbamZSZ
         +iew7Dp+3NkgTOTPVfzlFsDV1vCHubeaxrOkZp5KMum46mDTgymZdVTCbNnu8SoZZl3i
         6pyW2zYTtTwr2gPudthxKg5wJiL5BgvnepW0CNZ9FWk40ur+KMi8bHlPZNQksCFQ3Yq2
         8KK/5HYUGQuRCc1+3YevwzQ3X4HFCj4Xa852iGmqDCFO/9xN1p+bOZQZ/G8pte/2s0U6
         NQUTy7Jr8h/wqSmsEa6Bh1nMIHbIrlQYsAR91RqarU16FI6CvO3DgTBFSM+QaCdQoD1y
         JYMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793105408; x=1793710208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=w9bm/VqfouJwe/E4PVyOUQraLP3MHwcXiPF4bxf1G7Y=;
        b=ja1VbwFSw4a+URJBBxWgm8pP8PMt95EZzYiV1jdWr/7gS/x3V7lzWXDWBtDIOsRKw3
         JE4H6GjH55Sr3JXewaGaI5FtYWbPMtw6P6beKIrf3Up0sEw1fHQ+/OxGO3WN5hOTmITW
         nEHIlfSE68UPT/UorqgL3C7ZrSwvg3YnS/DEE2em1/KzkQzR6xQyjnuHfnj7/sVfsjC6
         HVWwka69g8HivyAB9waW0GcePl2dBMEgCsR3PLKYm4JcQn+TaQ99RyyOlIUD1iuatryq
         JS2XNE71ql8ekaYvUWNsLpYGeoo8FKuvwBHERpSmeamCxS226w2Yhm6QLeJDRHMpVG6F
         XBRg==
X-Forwarded-Encrypted: i=1; AKwUvBzYTbU8QWbdOcVML4ABkpfJliKRQlr2Ls8/GrC2MyVn1gT5tkGqYUPAHozCFi3OtEO9NxjvdWoBODOBDNVI@vger.kernel.org
X-Gm-Message-State: AFq9FYIZfJM5llGnsbgT+EH5qLoYZvb6TemIyldKUOp2BtQKVMICxcTa
	yFcv1Q21TXwGYKPM2eJqsYoc3oqGn1au3DJumJoURVmfhHW+68+7fqQz
X-Gm-Gg: AYBFou1LiHAFXy4xnwxSQ7fx7ebG6BU78AI34PsBQfk75bFvdy5LU+SMS4lb9UviZB0
	cqQaWOzLY3fHnLlubqj6N3LqrodtaPigiMS6/dSDa5qPRx1bJu5bEaZwRYUaNtABrXRlwuHEMSx
	3uYBvAbeTu6n6mgOz+Anr84pT2JzbGFHjn0tTta9roRkm6iIC4/8ezGOblRg8V3XexXeXzjjRTn
	O0I0C9usEmDnQQEKzJLXAGIvRQJbSF+sHuxlt/Th/K5TJgHzVHdpvZN5/B7Iry+hX/TIz6IjNQC
	X6a41sx6FBlbO6naOl/tLSYlv6utV4QycxUo9YPUkxPiSfqW10HZZQ9XcpPpzSfmttZ3U3Uck1Y
	n1DnU11kW+f9OmNLX8hwkayiPP7LFuPLWzd3ip4E+pDUbCkvNb1koDSs+8lCESlIlp2DYPEXM9y
	AMFrgzOOWTDH4a0FYz6S8HjSxW7xwy18TOg2w4LESMy2UxzI80sDEbAoAeripMRrV0zmxkBlx5X
	QRx7RNazgkZCGpFd5O5do6aZN0qOvAZXqDXgPY9f/D0ylZKWG2TSN10KqaRA5iMeBLJpp9OjqaF
	ZmgzjU2YpINthUJZNYTHDnftKnInciE/wyXtayTB7tK8UncXgP+i1gc5KnFZj/fGc8u9SxHE8CY
	3udg9COIQKQ==
X-Received: by 2002:a05:651c:a331:b0:3a6:622a:2cad with SMTP id 38308e7fff4ca-3ac6fd0c2efmr24122901fa.10.1793105407711;
        Tue, 27 Oct 2026 05:50:07 -0700 (PDT)
Received: from yantra.. (nekmmqtcmoboczbkdcs-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:55c8:a52b:6ba2:979c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7e7cb24sm2052803e87.25.2026.10.27.05.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:50:07 -0700 (PDT)
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
Subject: [PATCH v4 5/9] iio: adc: meson_saradc: annotate the lock helpers
Date: Tue, 27 Oct 2026 14:49:50 +0200
Message-ID: <20261027124954.110697-6-zoone.rupert@gmail.com>
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

meson_sar_adc_lock() returns 0 with priv->lock held, and
meson_sar_adc_unlock() releases it. Annotate both so context analysis
follows the lock into the callers. Only indio_dev is in scope in the
annotation, so the lock is reached through iio_priv().

Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
Cc: Marco Elver <elver@google.com>
Cc: Bart Van Assche <bvanassche@acm.org>

 drivers/iio/adc/meson_saradc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/iio/adc/meson_saradc.c b/drivers/iio/adc/meson_saradc.c
index 2b003fd5afeb..3c1bc2274129 100644
--- a/drivers/iio/adc/meson_saradc.c
+++ b/drivers/iio/adc/meson_saradc.c
@@ -578,6 +578,7 @@ static void meson_sar_adc_stop_sample_engine(struct iio_dev *indio_dev)
 }
 
 static int meson_sar_adc_lock(struct iio_dev *indio_dev)
+	__cond_acquires(0, &((struct meson_sar_adc_priv *)iio_priv(indio_dev))->lock)
 {
 	struct meson_sar_adc_priv *priv = iio_priv(indio_dev);
 	int val, ret;
@@ -608,6 +609,7 @@ static int meson_sar_adc_lock(struct iio_dev *indio_dev)
 }
 
 static void meson_sar_adc_unlock(struct iio_dev *indio_dev)
+	__releases(&((struct meson_sar_adc_priv *)iio_priv(indio_dev))->lock)
 {
 	struct meson_sar_adc_priv *priv = iio_priv(indio_dev);
 
-- 
2.43.0

