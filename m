Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793105408;
	b=IM6JHJlb0w1kcd7uiF8kw32THj46V8PI65P/2Psok7omYsT0g4jmIY4uBWAUHe5eaCtz
	 MbDgFLtZfpusFdlyJJWZ9UE84KPcClV5oeqK3flGQt1OrluEgtwQAhAQWhZEXD/W1ACH/
	 oxfth8uNqREC37WJhxHLewKXZy6o8URDczFJT5oW/IdcjmRkr3EgYTxecadAxChUCTHNu
	 FvH+U4SC2R65vMqQrJTHqH3bzs66aZ1hn/Ack30OfOkn97ZlL7tnE4YVCArOiAvrDQboe
	 TC7Akm91yYZtZrQtjwkiE3YtsZm2FVwZF25hC0TTMYmDDTahD9MOO101it6zBWlPTpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793105408;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=5maieUrV3gg0OvUYuumtngfF5Rbt74fkE8XBQYCal3Q=;
	b=EJ0zHRwplWF7I7eQAHGfJXV+PGWjp++5FdfZXTqBwHrY5AmUDRYFbyPIpdEuVi3EdNqO
	 Sp5G8IThtmC63Nvs7WYja46HKqQgkKbhFC+M8z4/tvoRJ0GVV3pjcEs24PGhRBC72hnE3
	 5yVSsV3DGuACE/FkwICUndDtPC6eYA2Jbu/+IiIAvBsE+gcMt7r8wSeH99yoHII/XJ38X
	 Tf44JDcEs8WFQ5iL0DAhHCkNIgmsJ/igA+RY0qs1wM5Q/aZgRCHpLykHUyoJwdWRosm+7
	 Xny32gAn3/KMYFPP85RAMmMnbXGxU+4aKnV9lAM6PWqX9N3P4zBIQjt8Lal60W5e4lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hRl9iP1r;
	arc=none smtp.remote-ip=209.85.167.41
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC30860A2604
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 12:50:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC30860A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hRl9iP1r
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5bb7c6980f1so1787130e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 05:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793105406; x=1793710206; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5maieUrV3gg0OvUYuumtngfF5Rbt74fkE8XBQYCal3Q=;
        b=hRl9iP1rX7Yescz/IkmbkH6cXyf/ED1aKA7Xz0y5VNBAW8maE8GgmBLi1Wh1HJz5Xq
         zK07nv2LlnsuYPggwoPLVCpg9cILU7yxCYhUI8kfh//X0q4h84Uxy4WnAqOym2Z8oQ94
         870cWd01UkCi1PlsYPmlcE4siKtHAmuIkZEvSG/jnBk6fQ5mVK2vhe27IgRTfeNsKKDl
         YMuUVPSGHaTgX13h5g1TJatd7M9jShSpYRsgvpTcBOVfsiSGUtW2jk4UkN8GZ1buI9G5
         uY4QIKF9bGFC6ba9VYdtJIgBxMjedCj7bDXcmJ1v/U2lGc93fGlda0Wo+SvL83E1oZsb
         G2PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793105406; x=1793710206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5maieUrV3gg0OvUYuumtngfF5Rbt74fkE8XBQYCal3Q=;
        b=hwXtgZiNg063hJ93xSQ804vnvAReO1gkeGhIpWY569OqXErVgKcRMkgG+p5JLWu7TJ
         I8qSRLPTd/OTwPu/Jp/SXzeC46VTelhdmsLOgi0pmp3txx89ZljNb8Bj5I4Bb5u9p8JG
         ejzP1TJi/seR27umosHQiK5lJ0mxMIFZCM3oJKzbchDO1GU4Ou7rRRaUQ0BvspUxcnjH
         os36bK6v7WyjZuXDGdmU4ypH/Q4V9k5/r/Pd+9JcC//67LC9ODOyoEK13SHU8uf9ycAg
         0Z7Q8glnNILAF7BfMFRKYKKsA7FfiFLXx70qncPlpgexUfjZ607g6hPQ3nJ2j/XA1OMl
         vlbg==
X-Forwarded-Encrypted: i=1; AKwUvBwq8kLA8UoRLU7kC9HIp5Ogz07WKhjbMeK7GPWARbzL4wBthBPxtzTduKh7pnsFX8Zm8DH5l/uIqI9Vdi5S@vger.kernel.org
X-Gm-Message-State: AFq9FYJIMbVys1HuwEo0sSKSLkWa8wpjHLx8c8ArYAKv6D2vLX36QgQf
	hhWYqjT75zVC0rdqrQZiAoUssShmtgCOupPUCgvrLIgeC7pRr5n+VqLe
X-Gm-Gg: AYBFou0V0iB4LdlH4GXIicCIF9XyeNG4cfnuoEx2pbXrQ8Q2urjdEMHByTOON1Db8gy
	QyLX06tdwMBUqt2rR36IX5xt2ucNU1YiZYJYCgS+w0V67UOGS8Kr24xB3OWe1ZzjHvEGDU6km8C
	ExBD+5Mh/ZiuRMni5KIAtmaWc0wqwaZfhQtykV75hpbwE3xFtLHZPOmkzlytAav+TymJx2mRLXp
	ulnJNoR8Nkqq/790S/qsFoXvaQCgDMaKS5Fy3uqKlAzUnLT16Ws1SXqmZBcJx74wW4CXDja3RP/
	IfTzjyclLUu+VZetzv1qcqFTaUrFJATJPGAzhM4/dcNIgD8hupBWswxm0w0ggMXvnwFMBlZkmV/
	m7JSr5pDOKAi1CX8Y9X37RxCjufHNF3BUhgWY8gmGkxhpMbyKm0E+TtEvA2O76bKARDR/DFHgKw
	iUH2GtE+3ahAs9P5JRR2eksqGxT75JTiUupi4RJOw/EAiCbHWFTYsbsWG4E2WSwQ9xRx1aIp93A
	WdawOhfpccBSVsN5zSn4FMkHlrI/G7YOzW7OYyXfBltrkniHV9DtvQY8hH9VjvGqdGZqzTqHANw
	XJtG0TcvjrLiJP/ImULMhaxsPn9iZutXzOs9/vN1bVMeXeMm4iFhNbrfHWLftQCD
X-Received: by 2002:ac2:4c47:0:b0:5bc:b15d:beb9 with SMTP id 2adb3069b0e04-5bfb71c6b52mr3628166e87.29.1793105405831;
        Tue, 27 Oct 2026 05:50:05 -0700 (PDT)
Received: from yantra.. (nekmmqtcmoboczbkdcs-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:55c8:a52b:6ba2:979c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7e7cb24sm2052803e87.25.2026.10.27.05.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:50:05 -0700 (PDT)
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
Subject: [PATCH v4 3/9] iio: core: mark the mode lock helpers __context_unsafe
Date: Tue, 27 Oct 2026 14:49:48 +0200
Message-ID: <20261027124954.110697-4-zoone.rupert@gmail.com>
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

__iio_dev_mode_lock() and __iio_dev_mode_unlock() are declared to take
and release indio_dev, a token for the mode lock, because the mutex
itself is private to the core. Their bodies take and release the mutex
instead, which context analysis reports once it is on for the core.
Mark both definitions __context_unsafe().

Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
Cc: Marco Elver <elver@google.com>
Cc: Bart Van Assche <bvanassche@acm.org>

 drivers/iio/industrialio-core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/iio/industrialio-core.c b/drivers/iio/industrialio-core.c
index d73f2541375f..e9a5d1d905c1 100644
--- a/drivers/iio/industrialio-core.c
+++ b/drivers/iio/industrialio-core.c
@@ -2252,6 +2252,7 @@ EXPORT_SYMBOL_GPL(__devm_iio_device_register);
  * iio_device_try_claim_buffer_mode() pairs or related helpers instead.
  */
 void __iio_dev_mode_lock(struct iio_dev *indio_dev)
+	__context_unsafe(/* returns with mlock held */)
 {
 	mutex_lock(&to_iio_dev_opaque(indio_dev)->mlock);
 }
@@ -2262,6 +2263,7 @@ EXPORT_SYMBOL_GPL(__iio_dev_mode_lock);
  * @indio_dev: the iio_dev associated with the device
  */
 void __iio_dev_mode_unlock(struct iio_dev *indio_dev)
+	__context_unsafe(/* releases mlock */)
 {
 	mutex_unlock(&to_iio_dev_opaque(indio_dev)->mlock);
 }
-- 
2.43.0

