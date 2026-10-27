Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793105406;
	b=x4qQk83EQhO59Uxx1rkD/yTpVohhZfpImSbg/4yVavCQBJ7Qn2SFn9rxCoTxRsYatOkv
	 q7tTC800DW9EtDbpvIJUu/z7YnDKAlsg66et8xfWvC2xJccQ+ApFYmo9ZG0oWjXGU6rcW
	 6yZcNK3O2Nh7MHeeSnAj7FkXdJa4rDUXtQvXZMXRF5PCWIeA/bIIl8GLMy0XIAAq9mIvj
	 Ycqcq8f0qnP1p3RUkCN22ir4A8UqehBmrUgsFEry93EzLLQYlB0Fksph5iVi0xhjG2ht+
	 T8z4fYob9U9H0+0Np9IarrrhO02TqbO+gqCgHRntG5tp+ryrCU77kb0j2XcAZfLsUsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793105406;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=pkcAkMdCRwIuT9szM2gCVVjCSXFflqIHrQQCvrEeeZg=;
	b=N+3Ptg9Oum2x0h5V81J4NdCQsspBlZ/2vMS8686uplBuOgmV3mG4v08s8DTMUVFczASd
	 vh9Kgu31ZC9a9BZ93eRIaUciysy2iBTt+lOXDt3gquhBs8jnzyztUUj7FBmuJytA+wIbR
	 PYhimueXFIYZaVqadG4yljArEPoR4Q1ilWEUlAxnnE38JV11qh7SOsyIqrQ7a+qjQq/mI
	 7QFhPdXTQ88m599HMbwnkTGTpBV0Soxp4IUI6I0SBmwGq71Tgj/qv/aY6baovaINXhL/W
	 yRHN5+l6ijxvRZg3DgMNCbx6Hv4VpiCmswkrWXuBi+uF0b45yEmuww9yHhn1hqHT2ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HisGQ0qh;
	arc=none smtp.remote-ip=209.85.167.41
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F93606A323
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 12:50:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5F93606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HisGQ0qh
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5bfbc67991cso1577360e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 05:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793105404; x=1793710204; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pkcAkMdCRwIuT9szM2gCVVjCSXFflqIHrQQCvrEeeZg=;
        b=HisGQ0qht2PJXTGw5WAvL5jvm2y81pQfxwwDQ4pzxV7qEjKiv/cqetdgchEhFLiQLm
         ROP5GV/aiLKdwUS5yrc42cRdpfbWE6g6/AZoVTpM3DOxB1HL5tKE2Yt5IkGDO4waVpbk
         awtdsgY7FcZ3vowE/ptcyBfXU2C336wcXkxZ7EMY2GPg1Bl/VWuYLNep3txus1W61/Ks
         uCY26n0GZGaAgOEGI1fvCI8j1vekzG/24grSoR7ldsnRPwon7x2Xrfe2Dm+IuyclK8B1
         i0l7aoi1lkIR4OxsL5LDbEJ9nIrCcBli6PE0+oWTTTNIXk3EFHKTG0yEoxJwFwqMR14s
         puDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793105404; x=1793710204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pkcAkMdCRwIuT9szM2gCVVjCSXFflqIHrQQCvrEeeZg=;
        b=lyJ3Bq0oRcbeTzI1fBqHVE7PxqTXSPPoIYiDY1l9S9Lw8BfBBTnRWYE3OtlGzJhO0v
         PLZh2UVyHmQf+ekquCOHots18vKqE9UA2QQ0YqXYRVu29mFXaYLUQNq2dLmpYGWYdInU
         K/Xmy6CiDr7DjMgz8oo0Ogk9USr2kSCNIqRJ9ajRMgQkaUiTB2SM0v3IuvTlhWkYHqiV
         YIR927IYJRYPA38rF3C5hbeZuGfsk0eWtQ0ar1t+L741eecxz0xaXzXl8I4Qahau5+jw
         2UmxEdO0DSliI4ahHLYA/7lHDl6wbDrcJ1AiQuPIQjfC3PPrPhb2iS7pX8JhvDxfRQkQ
         BGwg==
X-Forwarded-Encrypted: i=1; AKwUvBySXEk/HinACJlpPIzYBrMuJDGQbrV8APwG4k8qYBwWhkYgFeNFYlkD7hbnI20mH3CRyo1w3KwIt6lj7qAi@vger.kernel.org
X-Gm-Message-State: AFq9FYIkQhm+upDbp34vRZVwZIuLNnwqxYPOS4c1j1C6SUGysS6MjQUc
	WymqyW0JPM2/QNWDkH9M2v3CMGhDC0qhwSnJ0zm4ECVs03WWVP8DewfC
X-Gm-Gg: AYBFou0HrftoTjS27eybSogx1Qn2ZbXEAuXnkfS77qA/lmOtgBBlczm00q/X4cz44XZ
	6RARrqlE6Dh8kr35julquT6askl2HY1+4+JL3l195BkCty3zNB03GA8uFPrBvyU/eTduSkf+mIj
	sxKKOrVeL3D0YceP0DLj3rzEHa0tBp2RIBkvkqfbq4PEK6BMunyPR8Duget9Mlx1Zzposib78jV
	9cQ+7VoFuODGh/4lSGiFGsyyjznh8R6F8YM/f8NIHQVfhi9gF4hQqtuhTyO0BX/AIjSozSsqy4/
	DFcRJaXsi1ZlEGA+PZfCwcwzvplqAz2iT4+WRbfILHxdLbZa5EbRKeFi+1D/85P62D0pzEdPGF4
	AJR9hJWSWQIDj7/WLNEZDNYJ8l+3FOoSO8Xzxl9Gm6w6UCabjtTYrHUveO/R6+SDusqAx+pKAKV
	ZtT7BVl8gcH4Mxaa7kiCsJMQVnrnpP5n5NKeSSQlzg4YqN14ajF2zYtyYi+cFwl03wUHzlAbHdr
	/voiIUxwc8X1eMyTgWBkvVVRnN0pWbUFhU6sklnAuQTDtgealcOCi0gdCibyCo3YShFzEnlwX/D
	El2/HJlCu3refx4gxfF0RCba6qMj5HqR74sTemdfWHRxuVo5YX5X15xj5XcaOyjbxLRGml/R0S/
	Ei3T6WdZGCQ==
X-Received: by 2002:a05:6512:1047:b0:5bc:d9de:d75c with SMTP id 2adb3069b0e04-5bfb71e3343mr3417911e87.47.1793105403789;
        Tue, 27 Oct 2026 05:50:03 -0700 (PDT)
Received: from yantra.. (nekmmqtcmoboczbkdcs-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:55c8:a52b:6ba2:979c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7e7cb24sm2052803e87.25.2026.10.27.05.50.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:50:03 -0700 (PDT)
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
	Bart Van Assche <bvanassche@acm.org>,
	Marco Elver <elver@google.com>,
	Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Subject: [PATCH v4 1/9] iio: adc: qcom-spmi-adc5-gen3: fix lock annotations on mutex helpers
Date: Tue, 27 Oct 2026 14:49:46 +0200
Message-ID: <20261027124954.110697-2-zoone.rupert@gmail.com>
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

Since commit 5b63d0ae94cc ("compiler-context-analysis: Remove Sparse
support"), __acquires() and __releases() only feed context analysis.
Their argument is parsed before the function body, where only dev is in
scope, so with analysis enabled for this file the build fails:

  error: use of undeclared identifier 'adc'

Name the lock through dev, the same way the bodies find it. The analysis
then also checks that the helpers really take and drop it.

Suggested-by: Bart Van Assche <bvanassche@acm.org>
Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
Cc: Marco Elver <elver@google.com>
Cc: Bart Van Assche <bvanassche@acm.org>
Cc: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

v4: name the lock through dev instead of __context_unsafe() (Bart),
    now the first patch of the series that enables the analysis (Jonathan)
v3: drop Fixes tag (Jonathan), trailer cleanup (Andy)
    https://lore.kernel.org/linux-iio/20261025191510.22261-1-zoone.rupert@gmail.com/
v2: __context_unsafe() explained in commit message (Andy)
    https://lore.kernel.org/linux-iio/20261021052435.112686-1-zoone.rupert@gmail.com/
v1: https://lore.kernel.org/linux-iio/20261003214516.128573-1-zoone.rupert@gmail.com/

 drivers/iio/adc/qcom-spmi-adc5-gen3.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/adc/qcom-spmi-adc5-gen3.c b/drivers/iio/adc/qcom-spmi-adc5-gen3.c
index c68c6c5f6aca..09013c6e44a0 100644
--- a/drivers/iio/adc/qcom-spmi-adc5-gen3.c
+++ b/drivers/iio/adc/qcom-spmi-adc5-gen3.c
@@ -663,7 +663,7 @@ static int adc5_gen3_add_aux_tm_device(struct adc5_chip *adc)
 }
 
 void adc5_gen3_mutex_lock(struct device *dev)
-	__acquires(&adc->lock)
+	__acquires(&((struct adc5_chip *)iio_priv(dev_get_drvdata(dev->parent)))->lock)
 {
 	struct iio_dev *indio_dev = dev_get_drvdata(dev->parent);
 	struct adc5_chip *adc = iio_priv(indio_dev);
@@ -673,7 +673,7 @@ void adc5_gen3_mutex_lock(struct device *dev)
 EXPORT_SYMBOL_NS_GPL(adc5_gen3_mutex_lock, "QCOM_SPMI_ADC5_GEN3");
 
 void adc5_gen3_mutex_unlock(struct device *dev)
-	__releases(&adc->lock)
+	__releases(&((struct adc5_chip *)iio_priv(dev_get_drvdata(dev->parent)))->lock)
 {
 	struct iio_dev *indio_dev = dev_get_drvdata(dev->parent);
 	struct adc5_chip *adc = iio_priv(indio_dev);
-- 
2.43.0

