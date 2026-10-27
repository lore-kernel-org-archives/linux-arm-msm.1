Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793105412;
	b=j3+FGy+XtbBlQMS0fM8N8Mgj7XEfhi897F8dsgP9giSOeX/PsqdWTCFZTN3Ymh+/FdgX
	 jBxbDm8F72TwxHaGOfTxjlY1GVsKvYta425/myp/E6ETE9NPIdPsxKqJFsy11r0i3ZejA
	 nEQC6rJkFfZpigcX1w3yokZMdN+Xj7umFPpL3C8OGkcQFgNbMeq6+5m/dmhnBplRTj44l
	 aY1QoMSvubzLdji4N9E4kOvOZ5QhcUrezV+OMiEJrAu7XAcJZIm9HNvFn2mjarUYWFgsf
	 mmyll5LSaw1mIzWe/G8QISN+EzlQPzdQDlpJEvKXRTTuRE8PLO43Pq48WxNQOb+QwYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793105412;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+ZfYLczmvRoSi6CaREX5Mwnwxrh4r7FBoQ6OBNNjGi4=;
	b=bGWMeEs66uOIn71fKPWXsOaedXUIo5s1zINW7IBWqeSI7Ys0aGwCmHj29FSZtnt/9bY/
	 U4ovqgkCqKULsMTF1el5yyFRrlnDKwjxT4fnK/9IllyBi5j+axndbdiySOo+brHFPFxQn
	 ZoFYzqRBNGnJhg1zckTiymDesO7KW5Wf3InawYeA/Va8+DWxhNqYlLb6lNl4a+766rtFr
	 N9Tq/ErfaAhF6IiJ7xfjZE058be9kKT+Er0+RIAQpEP+u22yzCqM5acv9ZAjjKKX6E2xA
	 QuzMVidKb7bzlwD3nodZEOfll3wCoVFytcs52SkoJ5t8xAZIaizLOnvmxY3T3kf468w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="EzESZW/H";
	arc=none smtp.remote-ip=209.85.167.44
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AAFF60A380A
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 12:50:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AAFF60A380A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EzESZW/H
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5be4d648aacso3747864e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 05:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793105410; x=1793710210; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+ZfYLczmvRoSi6CaREX5Mwnwxrh4r7FBoQ6OBNNjGi4=;
        b=EzESZW/H7tOi7GvKKOrMRq6axsqyMq3xScPbGJQxm5ZGKGsHeduTOyDyl4r3phHpuD
         6DkQepdlV5Dr4XL0yivuJYfJSLm4VTu+fuIbIrw9aWrgrSOywUqKeZtlcsC4r+yiAqpg
         HOSQ98PfzDkySybEL05MI3yswMOq0127zLMk+KJY87FefJ4VPs/CSepGX1P18B1uz1v5
         At0gAEGEBj7pbxoLX6hasgbkDtIChAacXgbOfJyR2y2nfLjMqNw/l9dSgFOuXUG9KLkS
         fNAAgoVRWlOuF8kw8lviqRD9bkQ2jIRlfPejz7IcTidhncHCvrU63Oe4SHlNWseWhFy8
         Clww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793105410; x=1793710210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+ZfYLczmvRoSi6CaREX5Mwnwxrh4r7FBoQ6OBNNjGi4=;
        b=JNjmJLQHEkfKlis3f1eq3NtKAaWQ7p5nJkxVCzwwJ3OMpvwExPpDFWcSHXiAWBYRya
         MAar4UQZX/gNzAOKLA/gEnbsf3GQ4FD4yHQpjciC9+GbMdOFIenousDhsdbE7gxBcope
         MyYqg1Uwxzz03Ga95/SRWDoi3G4F1coAYT8E5LHe2z2ATayy3AjycyBE4vf648fULd4q
         QKfuucUyj5dEBqZcQEsOGzI2WsDfMhNM8W18UGIKxU3kYfIoJB86+7AEKGVmszMnhQD9
         LWIS0B5/XGF7TP9Vs1912jRi9K4MrEJ7/TAP3O8edgx4HQAFpW1Y/I50FF6hr4NnCF8f
         gO1Q==
X-Forwarded-Encrypted: i=1; AKwUvBydbnixkXq+mYNzBk5dG2qgj5TqbP/6Mw9WVWQ/2foUV3vNRb0ByU1V8aHMN+szwfUTLzzULq454vt+VGIF@vger.kernel.org
X-Gm-Message-State: AFq9FYJ0TaaNq+kbpunPJMZI68ck66EAXgBX9EiM8BeqPK7l8UDSCr2B
	d7oRKH7qLTaupNTFZA9IrWtgfhACDVp5b6cofuryBbdQErLNx6c5kKSm8dT5jiKH
X-Gm-Gg: AYBFou0FJZywXkLNhZANGQmIONj8t0UZWDyMpWjnZoSNGhQVaZSCs4L8keS5FgX+n1a
	odTur9/LeCnD+mXHnlgk4IuotlUyxaEHVYAT9AfQWGjOaZTvbl9wI0XLgiwgkZlvfMIiVaPA7fE
	n8zraXzGA9zs8T9qFe4CmKU9VsWuKyQVOuvk8NclVmhT0lOMi0oI3uW5yRlefqvZnN+nLCgv5bq
	fpY6mP/fyllysMhkL2GwNuxPIbLI15nZtQlH6gVSp69jETxi/qMaqXDwjIGqAI+dHCABd1qNNhh
	XPjq424ZXVjftsEZBtue6N0Iy1qgMmxi9Bri1VPlY/+Tvvw/SaSXdJ2Qt46hzCdWM1HYMeYCDYc
	Ij8sLIOXiQN/UdqngBgu6oDybglrJMmKF48V65/4WjKEijbKB0/5fFlz2LrbfGxNWxZb0rTsd1K
	hH8WIeZeQPqNsHV2A4PgwWmIH+xeRrIZbTE9eAwhvZG/VH8PcFZ9PJG4ZFl+zO0f+NPAWbX9Tql
	JPO0Nd2Os3vJvpyF9TOYw7UenKYRYlb2YgTXRzYWSL6RQpuNR6HvuHd8ak0XFYaquNMD/DP6v3R
	yDc5ogeUmEZl6NsIxJ3ORZJrAbnxP9V859O7lgzkKorVqEVtVYXsnCMTCbXlIrPrjw==
X-Received: by 2002:a05:6512:10ca:b0:5bf:c27b:8e52 with SMTP id 2adb3069b0e04-5bfc27b8f26mr1690144e87.65.1793105409656;
        Tue, 27 Oct 2026 05:50:09 -0700 (PDT)
Received: from yantra.. (nekmmqtcmoboczbkdcs-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:55c8:a52b:6ba2:979c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7e7cb24sm2052803e87.25.2026.10.27.05.50.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:50:09 -0700 (PDT)
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
Subject: [PATCH v4 7/9] iio: light: opt3001: mark the interrupt handler __context_unsafe
Date: Tue, 27 Oct 2026 14:49:52 +0200
Message-ID: <20261027124954.110697-8-zoone.rupert@gmail.com>
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

opt3001_irq() takes opt->lock only when ok_to_ignore_lock is false, and
releases it under the same test. Context analysis does not follow a
lock taken and released on a condition, so mark the handler
__context_unsafe().

Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
Cc: Marco Elver <elver@google.com>
Cc: Bart Van Assche <bvanassche@acm.org>

 drivers/iio/light/opt3001.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iio/light/opt3001.c b/drivers/iio/light/opt3001.c
index a948353014ac..cfd4a0ba9bd7 100644
--- a/drivers/iio/light/opt3001.c
+++ b/drivers/iio/light/opt3001.c
@@ -817,6 +817,7 @@ static int opt3001_configure(struct opt3001 *opt)
 }
 
 static irqreturn_t opt3001_irq(int irq, void *_iio)
+	__context_unsafe(/* lock only taken when !ok_to_ignore_lock */)
 {
 	struct iio_dev *iio = _iio;
 	struct opt3001 *opt = iio_priv(iio);
-- 
2.43.0

