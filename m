Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793105409;
	b=DyN/bk54EuUKHByhv+fVtn5nzBkSBfavPMJZc7ZT6+k7EQRqgvAcv1K6GNTC+zwWux72
	 kcj35y96K62WxwNv4O6XrIn/LEY4gWMrH67ig2YJYIFYF+IxlILgZUIGZX9xk+ZCfrFEk
	 tI4cPSItOaHVgar77U5uTRWjpyvIItkqWQeTs2uhddtn43MprYV8Voo/qRGYTo9iLmCFQ
	 EbMud6ZmI+eU62lFBCI39zHuFXwc0bieb4mCFBoDMC6BaoCXHeMvWWLrYdy24viWJVl0s
	 /a+vQZY+5nfVjGTRmZ6HhuCPm/xXgPp7xhLjpPcKmX47WqfNGWu0iE4757NRk5UcuFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793105409;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FYHn/wr28N2yNDPHhw1evl1S59ARQnHWvpuXjgekTs4=;
	b=SswF5zi4+u+/UC/1b0zDhG8Gu9p5UdEKu/TTbVIUxY+5mAy45BFJXeAePp+Gi1tXmVpI
	 IUjq5zmbxJ8u0QNObtAC7FdVPSgRur8xXBM/a1vBqqmCcpaJFo0lpH0uQWgovzyNcbImi
	 EiU0xjAbn/9K/HOHhY7+W2c7V0JnH+wMFxsVUGmtkH0F4RgpIxapc4AZqUVRWbhyno9FX
	 d/BgMNplBK4vWQOZLvbvi+5uGn5HahpnqK5qi/bitLDtmb1DfOpCRUJY4zRpESKyhVkOg
	 bcmbvjQTw2wfKzKVM0Af9BtYCoGixO48VEm3YmSh4hbBLm+P4S0ojEV9LmQt9I4X1Mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ez0oGccC;
	arc=none smtp.remote-ip=209.85.167.53
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 971BA606A338
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 12:50:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 971BA606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ez0oGccC
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5bccecba199so3487590e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 05:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793105407; x=1793710207; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FYHn/wr28N2yNDPHhw1evl1S59ARQnHWvpuXjgekTs4=;
        b=ez0oGccCIQwAhOEXNUKq4s56IEy0Key822YezRkU3GlBMBzMxj6sk7iUMGGKSFhI+f
         Te2gzPvCY286PbONIgL9EKJvrxdMru9G8rdz5dZayZqtX1YU3uq1p2YGC4y4yV7Mi/54
         mF7weiIuV2V8cwgez4F+iS6F5PbHdv128WWUuCOxz1yT8RFIktAvQGwrFzy/7couGtMA
         sXB5/VRlJXxGRhi5REiehlpoUlFDWYWOfHxiNhheodEl6ncPNKqRGSs+9l4iSQA+09Ez
         bUIKzTtcDZihGP44DwSZU8dfP5tH4GQX6jEFgjiHgdDzEOI3SQJtcB5vomFk6C7R6Y18
         kNyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793105407; x=1793710207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FYHn/wr28N2yNDPHhw1evl1S59ARQnHWvpuXjgekTs4=;
        b=CsIdQBvarph922NCmiJPtGktNNsBT/3y8cZcx/OgB28095U+8pLWRCJTqhxyZ6LOOC
         HCn9w/RZDgXO0XUuJJkTByBgkTOe/IZCTtttHlDssWqj90bM4sNo418FBbsWsYrS3hCt
         flkFtx2iD/H/GMKRhaWGrOCAK1xLFBHPPoTfFDpnIPoO1yWvLkkNwUBcIK9AY1o6aoOT
         Jv8KS9f3LwQTlA36zwNQieJw4EffbnCAL1N0EMxKLRkYOx6v3yDFCPSh3mMIBX+jDeV4
         f+6kAMGlimQmnzcXrAFEO9CDrkVjLHVNYdK0lveCUMOrjBj6JExW9SmnY/lM2QWSTJar
         mDPw==
X-Forwarded-Encrypted: i=1; AKwUvBwo/0931ZtdtirQr/rn4T4x9ONWeHx3Z5jWBzW4eQcN1hUcoyw9lCJVFfwHL0MHkMhR3RZ1DHtTgazgBIYh@vger.kernel.org
X-Gm-Message-State: AFq9FYLnIZtGOYkZqJ9buXlHwjH+QyIw2aGwWwXhHAx7JYnp6Qy1PeFS
	VjnLmRVOWgX6ewZwbaru/Bh4ltXdReHLBnmf9IBzGGh8c4TiXw4SmNey
X-Gm-Gg: AYBFou2Whd8+P59eDWKAjPXhpcgnZ1xPkusa/RvjZzUesG0zmQLZlj13QEmTMljmdTC
	uw4Z8l6rhtZXv2B3WeGxVMo7rNBT6tJ6szPhWgd9neDcKILTqkldRRNvTeDE7PmUEBN/iM3W7RJ
	pR9bdtSA2dwSusHwcgOVoilG8OTvqprlZQx6ltnDu4uu/uMF8RZz9ta/p6om5mtSCV0pKI0K+jl
	PvpO/y0ESAHWCxbDVGr2CI1bVd9VkvvOzqGP417XcVs2zyFzkaNXGl8Kdd3gHWKZ+pJ4o2pSKR5
	S3LXiQx2DJnXBKB35wQ9KPhloJQOEFL5Xt9WWJInvce3IDG/unVXOA7tcQSyO0FHSVEX/ml0NSm
	zuS+/WHpJ7uyc8/OoLhHkXrzTm+Ga/q63IE7knx80N+l5qNi34/e8YuZXbe4INkUWXY69lkqTDR
	bw2cLTUxDQZYLQV2hlwgzzOyr+FaIxdZ9rWFWve6JQiO9r6PyyR72aUgfsxgSiedKEmayPInV1r
	c3rLGzere6EKkoSdb8cEAAJbPl1Z0skZY+pM3KZb8Ag1ZpXx3dA8sGu4lL/zf77BZ14o/i68GyC
	RtU8D1ESEOEyvwSAMvbQKCzQErKVjEiXn0WlsSByQcVX8/M4Ya2zBAXsWUw3yzd7Mg==
X-Received: by 2002:a05:6512:3409:b0:5be:50f5:f789 with SMTP id 2adb3069b0e04-5bfb71c4555mr3678914e87.45.1793105406758;
        Tue, 27 Oct 2026 05:50:06 -0700 (PDT)
Received: from yantra.. (nekmmqtcmoboczbkdcs-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:55c8:a52b:6ba2:979c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7e7cb24sm2052803e87.25.2026.10.27.05.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:50:06 -0700 (PDT)
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
Subject: [PATCH v4 4/9] iio: accel: kionix-kx022a: annotate the lock helpers
Date: Tue, 27 Oct 2026 14:49:49 +0200
Message-ID: <20261027124954.110697-5-zoone.rupert@gmail.com>
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

kx022a_turn_off_lock() returns with data->mutex held when it succeeds,
and kx022a_turn_on_unlock() releases it. Annotate both so context
analysis follows the lock into the callers.

Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
Cc: Marco Elver <elver@google.com>
Cc: Bart Van Assche <bvanassche@acm.org>

 drivers/iio/accel/kionix-kx022a.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/iio/accel/kionix-kx022a.c b/drivers/iio/accel/kionix-kx022a.c
index add89512af79..a132af87fb5e 100644
--- a/drivers/iio/accel/kionix-kx022a.c
+++ b/drivers/iio/accel/kionix-kx022a.c
@@ -484,6 +484,7 @@ static int __kx022a_turn_on_off(struct kx022a_data *data, bool on)
 }
 
 static int kx022a_turn_off_lock(struct kx022a_data *data)
+	__cond_acquires(0, &data->mutex)
 {
 	int ret;
 
@@ -496,6 +497,7 @@ static int kx022a_turn_off_lock(struct kx022a_data *data)
 }
 
 static int kx022a_turn_on_unlock(struct kx022a_data *data)
+	__releases(&data->mutex)
 {
 	int ret;
 
-- 
2.43.0

