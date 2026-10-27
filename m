Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793105407;
	b=2dOmMirnXkj0CwM/mS9QGjzjf2kZyHC2xjT3SoXtZYKlMqt8q+o2b8a2jjf+BTdEHtFU
	 rzmMnULPf3yiU8DE+IqAZWTmjJeGWtA5bFhE6oHXEmY50Av1hxCrb3Xv9DjOZ7mJP7zfb
	 3wu6FO5FDPJKdaAuf61bMwuCu3KCNqeo8UBjvS1Jve85anKdn7ZHH3APOaX5354C947Ja
	 4VZ3vGmFOvlCqXBuDCc66ojieYHqCnBf+yZ79pPlW9+wps/6QTKrj+QnJ+MINQbciqpnP
	 EQInCnl8v97lL61mtUHuaNvb6rrZ84cLWvnfPCe4OjvbKrQJwVjf3iqDlMl6AAQ7kmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793105407;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=EOmMLjMAFJxyM/LPyWQT2i9O3ojzkNgFK3nKjeDrayg=;
	b=tP4vzkRCQBo0uQTrrALQnh3SvisWLvr0+VfVLACQQxIG3MzlB375xp/OyEpA6m034a1g
	 CXCrzT8Ikv4wP95CT9tdiijx/QVcG+EYrQArxVbaFjJUiFf4aAWgsRA4EnqyfhY39tGJe
	 aCnTpeksr/0L9WAqNc90QeCTj0M5rOV+UZkQ9HtFoRa2fMSsI/AlF9fgRal336t6eSo2n
	 LG1UUCS3tCz208ZNfvnV/KUkF7ZojsWN9UiDmEOeAFmzp2CGb8cHw5g/8xwHqBByOSj4d
	 8Ddk3iKqCO1FJPasecvkfrYEWqi4+ocj1tzxtEfKEF2dvnbSaXcbuRe95ctHSXgUuoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fERYkGLO;
	arc=none smtp.remote-ip=209.85.208.170
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E98606A332
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 12:50:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15E98606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fERYkGLO
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3ab3b29a210so9634201fa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 05:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793105405; x=1793710205; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EOmMLjMAFJxyM/LPyWQT2i9O3ojzkNgFK3nKjeDrayg=;
        b=fERYkGLO7Lnu2DkX/7bn/afdYO23mp5qW9KVQlCZBoCzvajuqGp16A/e/h/SpUkTW6
         iwweSy3pejWkTe4JIJ7d/rRMtdk0WZo7r3nnujnmoq+etqZ2TGcZwdMmgQ1CcXTlaG/1
         BVwldr6P+tCD/NLU7BGX/JYjyMcnUolSSHFxg+VvGNjeSxDY1KhUazKHOYNePLjtq7nM
         0ma5UjSP4QWMJHwVCIG0bPfx8F2qGyss425ANUkTirPGVDwCuz5Qs1K+VKxCP0sksFVS
         4jnW0V+oDHX1yzOy/2/7To+LH7S4mkSnO/9rlTTPBM+5awfi3nRll+DARFWMg3L4D0gJ
         B6Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793105405; x=1793710205;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EOmMLjMAFJxyM/LPyWQT2i9O3ojzkNgFK3nKjeDrayg=;
        b=Tg6g0gQISDt06PM0zD3JtQoAhYkfGiVpJQRE8kM45qoquE8dFzIR3P7eyffPfXM7YG
         HLGZE/27ebiEccE3cEtSr97QUxGFzwwNAIJUcd8hLivrNvlmgIKnQ5k2iNiw+FmSwKXn
         Sj4onRl/nF9G+F6g4pzRmKODWWSeER4JSpt1eEtJ6zaYbvK7V+m/2aSD+G8X9x/1SXP9
         rWr+7o63RR3AuAfioWlmeZjaOHXicMUWchtk48RlC4BbUhFV93/ijm+B9OnaxFUcE2QV
         IHVe6HRWTqudUPjGp4BDDy2QG2WYdcLnvapOqk2FKS7PMR153lO0FY5mgI+Ovlx8wzRv
         9gwA==
X-Forwarded-Encrypted: i=1; AKwUvBw7qrmNE2wdElqQnE4Ki1NcvxDmoIx7rFu0xGZwcy7p+laNFcdCxGNgvKOjT4VHzhxvMLQtteaPZHbOEbjt@vger.kernel.org
X-Gm-Message-State: AFq9FYLQWAHMQWk6I82S0D6AN1uoWyRlHASS+v82vF9D+3yxJngm4Lv1
	WcnbQrIPycE1kknpAPM1lu23pwiY/H2K2+nxA/9bDAR+heDURZEkF6jg
X-Gm-Gg: AYBFou0fZ7J4uYHWc7ROAXZBvwKDWX4oVX/x94usz3qOVsCASxrrOXvwmIq/lYWgkj+
	NTfFUIqPi5byqmtiLRDzCpVuSAApbGU8vqX8vem1BqLl7mdXRydzDu8vv/e/L5l2GxT9jyv0KER
	2qzEiMmi07xCQBzM4oCpxUeZnH3cZGqouOaF2e220VgtRImXtRtrua3fl3RtLDobdvp6SCmS6Yw
	Z8e5FHpT5T9Ia6v2BDAg25brJHgcAeUESyG11UfUgLv9bSeu//1vCg5uKcL24MmVVZsRCbzmrCT
	Og5V/90Rh4EuP2BddKy4++Dr3c4skuZegAGdp+prSLTydNqVMWY4G0lRCnMwxWTDu33RfOG1nOy
	jXV//+wLxemin/MsJG6txw3U3qkr6XrA/vbcYgHbpYHcPAknXBAhg01ngjetoOowC+V0+2VwTeu
	Vv7jgcuMfOm9TPGDp0DPbGm4a+D6vtqSX+NUp/mpEKUExLKbiECqOL0/QJA0vSvobHiPwEZ4OP1
	dwbCpeUMmeDofFAMYHdw+yAtHss9NtEpekLfR8ZCeQ2CcJCvryTvgkeRk8OhA7KwHMQZv86cUun
	aEABYOAYeeZ66ktq3DCcCMlkCupWXDR9h+dfCg4416pjyIeZXsFWFCIh1UPgZ9zc
X-Received: by 2002:a2e:a883:0:b0:3a9:7c85:a16d with SMTP id 38308e7fff4ca-3ac908e3716mr5518161fa.5.1793105404928;
        Tue, 27 Oct 2026 05:50:04 -0700 (PDT)
Received: from yantra.. (nekmmqtcmoboczbkdcs-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:55c8:a52b:6ba2:979c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7e7cb24sm2052803e87.25.2026.10.27.05.50.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:50:04 -0700 (PDT)
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
Subject: [PATCH v4 2/9] iio: core: annotate the conditional mode claims
Date: Tue, 27 Oct 2026 14:49:47 +0200
Message-ID: <20261027124954.110697-3-zoone.rupert@gmail.com>
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

iio_device_claim_direct() and iio_device_try_claim_buffer_mode() hold
the mode lock only when they return true, but carry no annotation. With
context analysis on, each caller that releases the claim is reported
for releasing a lock it never took.

Mark both __cond_acquires(true, indio_dev), the token that
__iio_dev_mode_lock() acquires. Sparse no longer reads these
annotations, so drop the comment about it.

Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
Cc: Marco Elver <elver@google.com>
Cc: Bart Van Assche <bvanassche@acm.org>

 include/linux/iio/iio.h | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/include/linux/iio/iio.h b/include/linux/iio/iio.h
index 9b63785d5aec..ca91f5a64626 100644
--- a/include/linux/iio/iio.h
+++ b/include/linux/iio/iio.h
@@ -707,13 +707,6 @@ int iio_push_event(struct iio_dev *indio_dev, u64 ev_code, s64 timestamp);
 void __iio_dev_mode_lock(struct iio_dev *indio_dev) __acquires(indio_dev);
 void __iio_dev_mode_unlock(struct iio_dev *indio_dev) __releases(indio_dev);
 
-/*
- * Helper functions that allow claim and release of direct mode
- * in a fashion that doesn't generate many false positives from sparse.
- * Note this must remain static inline in the header so that sparse
- * can see the __acquires() and __releases() annotations.
- */
-
 /**
  * iio_device_claim_direct() - Keep device in direct mode
  * @indio_dev:	the iio_dev associated with the device
@@ -726,6 +719,7 @@ void __iio_dev_mode_unlock(struct iio_dev *indio_dev) __releases(indio_dev);
  * Returns: true on success, false on failure.
  */
 static inline bool iio_device_claim_direct(struct iio_dev *indio_dev)
+	__cond_acquires(true, indio_dev)
 {
 	__iio_dev_mode_lock(indio_dev);
 
@@ -760,6 +754,7 @@ static inline bool iio_device_claim_direct(struct iio_dev *indio_dev)
  * Returns: true on success, false on failure.
  */
 static inline bool iio_device_try_claim_buffer_mode(struct iio_dev *indio_dev)
+	__cond_acquires(true, indio_dev)
 {
 	__iio_dev_mode_lock(indio_dev);
 
-- 
2.43.0

