Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795466054;
	b=y7UyCCByUxWKaqJb/ElXi+5PuYxtrNlngO4vjhqLkcbAQ1oWPh61C0jt/PcUEK0/kAiZ
	 X1nvjAI9dHl6tYoVxpcKHG1wBdH7czcJ14SMgH9dAvpSvLOkTU9ZxK4+ezbGA1t1FvppW
	 JmSeS4N9FPsCoRqdyfyw/f/Y+bk0+wpF1ms/4OGHs6emAruyaWFpqOMcTVzxyKQt7R7J5
	 tRGhX8092FkAG64nhJe2Li1W3fxDvBrePZbKHRfl9gvo9xgUTCRZdL1Zyn+lPzIl7i4co
	 MdqCLEpjB9IjleMw0oapiy4BoFcAmgghrA79y7dXj9xq1nEHCXiaUBjn1uT1Awwl6qA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795466054;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=6OR603YV4U0OwPPTqnIgdhTgPtFX3ZXpQfBjAD1u2oU=;
	b=VIriVi72/IdYljOcj6TVPvW32fp4dY2gGCNKQQa1FFKYlS8LVLfUv4yw13pj8sfIAaOm
	 QBAM98whMDYjkLC9ac5zn+RbUAONKRykqj5RmHjzEU0YpnPf772nVaPKbghbgEB9QYw1A
	 o7glNuFc/gBPuLq1yjylJqd4Uz8HKB6N5BtfE9PpJXHMKlLdFefjdhdLCIxvYzYzmkU5m
	 kWb9nvcd4J6sE7jaNy1d3++/rx8AUIB6DqhqJ5yNm0RXF9yG0Af5CXjdj0KI4c/EgH7eR
	 TGg5eVkFokqKZ6BCo+pD/0piGDtI2LXNaZ0BjVZ0zGxC+QSuguwSDYVzpaA9m5K3eSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z8KvwE2H;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5246F606A6B8
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 20:34:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5246F606A6B8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z8KvwE2H
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4bb77a462c6so35880645e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 12:34:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795466053; x=1796070853; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6OR603YV4U0OwPPTqnIgdhTgPtFX3ZXpQfBjAD1u2oU=;
        b=Z8KvwE2HmbcjiuKTw78Oy+YNYHN8GNMgYBZwyBWDc/CS0fSAzLEia6d20eoogHK0Hn
         vOuMZc1tGZkHl7DRiiN+t3bG2IFgC252SnyjViZZKXxG9fRFGcYKfrBO+gk8UHSk3PWe
         S4iem9nIFGhaqX9NQ4Js9uiYZ1+inGXClZv/XXVbBl4Y69Qr784kcrIcx08WVIOgzljm
         plrZjF8lPFXblMkh0/Wvq2uMJQ9p88D/hQep5TZFnT808MyazsF/ICLskauneupXUkER
         9bkaRo6Qx+GEcxY/itzEn9R2ug2yuZuI5MRf0EGq41C1Fta/MjuipuTd+qCOu4na/voY
         H/Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795466053; x=1796070853;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6OR603YV4U0OwPPTqnIgdhTgPtFX3ZXpQfBjAD1u2oU=;
        b=ErdrYORP88BNGyPnitkljqgTKyRPTp/swIOLgqN6h1mj/Ml4NDBQ66SqzFUchznToR
         XMra36QrZ5lGk1BJuFJcmjjkqXr/8S5FJVzBFLbbQE3PzauhbqKL7vvQoCOcwdFnmFIO
         umteW8N6735Yy9A5HlbqnFkd7Hfna61dBKTU0v/W46NSR/elP/bsJVhlcMiCo6Ck7nQe
         2HUvhRSj6x4lrM4q10effEzF6lPKZoEDh60Xj20/mDwRMdjNPsk3E08F3SgkXwVtnFAu
         k5X4UBN5KIujh5sszZK5QBhCvM6ca5bL+FsYV704wzNPf096sfO5GKSYuVY3smW6r9UV
         ON/A==
X-Forwarded-Encrypted: i=1; AL+hErFut/Gd5iFmFerAn4oaYu11zq6UCqjDTgDtqYaAQtZycnUx2fDljS/hH2S4ofXUgl2H+Cve7gnzd6qJG0si@vger.kernel.org
X-Gm-Message-State: APuU4Z8OtgUU3uqRSprM88qWf93YEqKfKdkQo1yCgw8gvTLWUzEVyDwi
	gF+8qIm5KAEzuWi8FGYY4DO0iHO2Xl51f3f96azjHTGi0tmyvRrYL3p4
X-Gm-Gg: AZFdTZfvGvSMnHDT41LfqIqwu+OVuDiu9wcr1xYd8DfaT+K9+3EURV0fT5rSCUE71EZ
	7TIJqHnqSGbz/3njVlJaqV0D22YxzJ9mPdBkdeBmoO5bYEezDGHgxmgPChN2SO/gB9Tu1FB0Aj3
	Mo7mX5aax5AUeVvXfp5g8ja3IE8vLT9we0QWxwuajnZM1UvwujNaEP9A4jWRIjsUNOn3cFPPjre
	dzulaJJ8dTsSc/4rgDz1woqHjdBHz7uyN5cbFM8spZX7yCILVfi/LmVPIdNT1Cay4NW21rQHuut
	q8tetGN8plJXRsyWkQGFFY0NbvhKSh3k6U6ja6Vpws17IaEbBbSQ31oRxuLrQEC7u6GNPJFref2
	bn4x/dqdtzQMPFYvpB7Qvo11wlGKt2V3lC8P0HXv+OKCxi5x4VSagroOleBtLUEM0cOOX1yG/o8
	93Ab+8lhniKfpdq3RaKz2fmQXVnO5yrIlpe1mgABivrhHyBJ4cyN4/S96G+HMeubpEY4ipjs6/3
	0WvPeVWR+TmtarJCBmaUkh2aRUKV2cmeFtEWWPeeoIFh4eJ6NYHrvlllNPpmcYEolyNEbYu2uuQ
	rbTevksJmk01Fsch0iZu+wkAmje6ng==
X-Received: by 2002:a05:600c:1d09:b0:4bb:66fd:ad68 with SMTP id 5b1f17b1804b1-4bb888160cdmr275019355e9.14.1795466052668;
        Mon, 23 Nov 2026 12:34:12 -0800 (PST)
Received: from unknown.local ([151.34.53.154])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb884b7515sm515946805e9.13.2026.11.23.12.34.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 12:34:12 -0800 (PST)
From: Gianluca Boiano <morf3089@gmail.com>
Date: Mon, 23 Nov 2026 21:33:55 +0100
Subject: [PATCH 3/5] media: ccs: Store the format set on a sink pad
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-b4-ccs-imx376-v1-3-2b26850a6f11@gmail.com>
References: <20261123-b4-ccs-imx376-v1-0-2b26850a6f11@gmail.com>
In-Reply-To: <20261123-b4-ccs-imx376-v1-0-2b26850a6f11@gmail.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>, stable@vger.kernel.org, 
 Gianluca Boiano <morf3089@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795466045; l=1782;
 i=morf3089@gmail.com; s=20240402; h=from:subject:message-id;
 bh=4SRiFW3bBAJ1IlBIN9DDyNFw3BbzT3m+KdYlz1JrA0Y=;
 b=l6DYb4OFrWa8aj8hDAV/Ql3Ppfpp3sLbxSS9XESSX/YP2O41q74bDTNHZvj54ZnsZPqr/xJx3
 rqMTCmBBAI2BQpjfkeyJakYJMMHHDCYCa1+p9Lfedm9CmP0aFocujWP
X-Developer-Key: i=morf3089@gmail.com; a=ed25519;
 pk=HsGrEQ3ia8BGGGO8/nUM2K2UX9JKvRPV+nbrVDGrYhA=

Setting the format on the sink pad of the binner or the scaler only
updated the crop and compose rectangles of the sub-device and its source
pad, the format itself was never stored in the sub-device state. Reading
the format back returned the one set up by ccs_init_state(), i.e. the
size of the pixel array, and the selection rectangles, which depend on
the size of the sink pad format, were bounded by it.

Link validation then fails with -EPIPE for any readout mode that does not
output the full pixel array: the scaler's sink pad format is the pixel
array size whereas the binner's source pad format is the binned size, and
there is no way to make the two match from user space since setting the
sink format has no effect.

Before the sub-device active state was used, the active sink format was
stored in struct ccs_subdev (sink_fmt) in ccs_set_format(). The switch to
the sub-device state dropped storing it. Store it in the state again.

Fixes: d8bca3ed1d70 ("media: ccs: Use sub-device active state")
Cc: stable@vger.kernel.org
Signed-off-by: Gianluca Boiano <morf3089@gmail.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 1cc4350856fd..a4af27de5453 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -2275,6 +2275,9 @@ static int ccs_set_format(struct v4l2_subdev *subdev,
 		      CCS_LIM(sensor, MIN_Y_OUTPUT_SIZE),
 		      CCS_LIM(sensor, MAX_Y_OUTPUT_SIZE));
 
+	*v4l2_subdev_state_get_format(sd_state, ssd->sink_pad,
+				      CCS_STREAM_PIXEL) = fmt->format;
+
 	crop = v4l2_subdev_state_get_crop(sd_state, ssd->sink_pad,
 					  CCS_STREAM_PIXEL);
 

-- 
2.56.1

