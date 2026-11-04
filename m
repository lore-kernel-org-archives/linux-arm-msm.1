Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793823810;
	b=gNfxCVZqV5tusEyPtAvd/5kgRt4FCAqH9S06MqMwZjgQpPJI7PdbWN2LkaFJwJIkggKx
	 LvXY2HNXCnnax8PW1KvqSICjvMpeGjlWTq5vAni08dvRlsreWDc1D3+1j5iSqE+XnWZw5
	 1yjH3HFXr3FPGhRy/tWbwha1LYrEXTeZadexjxlXRXUSN0699SaUxA7PXNYkVA4wUSwv/
	 XnbUYa/B5oVhVlhxORamkUa1wn0gyn5IoRgg9k85WbaUhGeMb/QPcssOAoMgcpqWbUWZk
	 7ss1LIJGeXSkQQr9rPyjuT/ZXAvXkjPKT1DlbVkv/WjTyz25bEOmUVnYxZrf9rXZyNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793823810;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=E7LZocK/+GQCTR5yix2Tw7sEbUYmazzv1KQynZMkd84=;
	b=UcwO1UQD5GHUrY0kzIkke5FswvmoJFiyF+xQZfvvJW60bM+K7QQiQFC9BkMzTe85uT3x
	 jOR8Fb7jKf7Sbry2iD00U8F05JtpSzBrfj1J+nj4SF1cLOhjIIX5fje2TdJANycBbVnY7
	 CbZ07DWbCFy8G8ik/V30kbOsjRemfPOMdYX9zVawcuTrIWtAkhV62vCOkqvxogc1zLYtj
	 fSUK2S7B6TxV4mEco5srarXwzzAZ744K3En6cd+ZyvdGLPmWHZe9Nk098IotC6WlmcIsH
	 Ig9fRemUL6l98bYywlEAcDG59M317lO0W8N356lq74CcWNYXcbx/7H0vq2HN8HrgziQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=fatecpompeia.edu.br;
	spf=none smtp.mailfrom=fatecpompeia.edu.br;
	dkim=pass header.d=fatecpompeia-edu-br.20260707.gappssmtp.com header.i=@fatecpompeia-edu-br.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=YHarwSmG;
	arc=none smtp.remote-ip=209.85.128.180
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B2DD6072F98
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2026 20:23:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B2DD6072F98
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fatecpompeia.edu.br
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fatecpompeia.edu.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fatecpompeia-edu-br.20260707.gappssmtp.com header.i=@fatecpompeia-edu-br.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=YHarwSmG
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8b305e10ac7so12192937b3.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 12:23:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fatecpompeia-edu-br.20260707.gappssmtp.com; s=20260707; t=1793823808; x=1794428608; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E7LZocK/+GQCTR5yix2Tw7sEbUYmazzv1KQynZMkd84=;
        b=YHarwSmGlmrLNnexUV8TCu9qAmUPUm7BS2v7N2S8h/bK6nAmrGBOAd4CtsmQkbRDTc
         aIvemPAxoul3uySgUhX++Ey7szslUFPOwEyBOyvvzYN9zZnXd8PJmU/Mrng4JWKWTQkf
         hEL3rMp9ZmG4tz1LOLG2F1ObftrE6xY3YNN0Xni7MagFAgkKxJp8G+uoLhiFAdpSvyU9
         x8AsSUKQhTKi1v5b5GrPqK7OGbRZhuxmehhk6B9aJG46N6Ag9IJ+4kjbry8xLV9y42fJ
         APsk/qq0rNZrcNO2kxX53Y3c/c2rT7digdE5OzKCWqHNXlvw71IOoNtcZpuAjd6mGUUZ
         VTyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793823808; x=1794428608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=E7LZocK/+GQCTR5yix2Tw7sEbUYmazzv1KQynZMkd84=;
        b=ciWx/gbrHijfLOKIu16RydBlCNy2lJ3fZpwecYg2XVBjHHN0HNkRJA9iF3G0z68t/u
         37Uyv5zMXIFeeQlj5lwTZi51/JKBFsOGHMBVRBlW5ajK/CiWpS7QqolCM5YE2bu2SouG
         UI3WUun/E6dMpTroSKJ1B2QtBIvkgEpCF4jK/JXM3iRSLIEAzLN6ubXfvh8CA4PAAMs9
         PZLHlO7up42RYwolj1o4p9C4ADTWECj7DXJnF8+QLPx51outyQwKLJfAiUXhW2h5KMC8
         wxE0opAbyvy19ZXZXB3NOeUS+S3LkiKvG/GddFBqU1AtHTyYfv0ZUgD8SBP9ui2i5Fwi
         wUCQ==
X-Forwarded-Encrypted: i=1; AKwUvBz312oodZWQ96MSCzpo2Pjciij+SNvFsuK0bKcJ/TuNg1W/SMoG6aLU1caQEDr6V/AltTFV93hj0bG6OULX@vger.kernel.org
X-Gm-Message-State: APuU4Z8U5F3/N9OwwpTnLOr9P4KFO55CSyoGVce1XKWgFgtLPD6QjU0W
	PgKjQxISw/6RJFxsVFTGz42pPDSk/hdZrIs/bDwEIPzi2mmE5tcNBZmvMPyT7SgciRiAvc9AMN/
	UQTKJtRQ=
X-Gm-Gg: AYBFou16xzxVRdlX5Qto2hRFf5I38WXskGA+aby/+4g2O3zSbhD0C43OJNhCQ00OlhB
	TL+Y3ImF2F6JSag7kjtnu+4nvPk6Q6SOLcRTj+eQ+sowzm3E7EGZCYpHDaSSO3MEmXfM9l5N3Ph
	5elcefMjeEUsm6/Nao43yMAL+wOW+OskkbYJIi9I9Npf4+OVzUk27H1aEHr5pOUkunbg/O4ggwG
	s38Z9cOmqy43F2vH3dkldl7sUxTA5UjJBoKeeRQvR4b7DfiKnxIDdG5c/FLOpzFwl528txq88i8
	jWnRVEcbi6rqBW5tc9nmbXFuNVb40vSgAP0fCLNMG+JCWKmXQl92G7/Dq41j8qrtnEokgHwxc/C
	KBY7ja2MOjA+EXqfnc3fy2MB/sQkyOx33hgGMUTlFwV5lukV/+AYJhCGmbDXUrKltfhNA1iZZcu
	e2CACKNimSjCqrUzEBSCfqXhEExiPuxN5SkDc9l1htL8Ql7vCMe14imKlL69jNbaBjnHZqX/C0l
	5HvDM4zB/297GkLZrh5GLNOyStvkvTJ9Gq58ScH7DY0Yhj1vHemr8/csuWKmhQW64PN4Q1KW9N4
	7jbyFP75PTgCaMjvDdhpcZ1fXbc4RE9DotP1867s6+WrmoFwhJ1oK2pbtS4RkzpQ6EET5wOmco6
	UK/M=
X-Received: by 2002:a05:690c:3489:b0:89c:41f9:b886 with SMTP id 00721157ae682-8b2b67f3125mr116898717b3.55.1793823808412;
        Wed, 04 Nov 2026 12:23:28 -0800 (PST)
Received: from localhost.localdomain ([104.28.244.23])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67bf91b6e7dsm1298292d50.13.2026.11.04.12.23.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 12:23:27 -0800 (PST)
From: Allan Siriani <allan@fatecpompeia.edu.br>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] media: qcom: camss: always stop the pipeline in stop_streaming
Date: Wed,  4 Nov 2026 17:23:12 -0300
Message-Id: <20261104202313.72494-4-allan@fatecpompeia.edu.br>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261104202313.72494-1-allan@fatecpompeia.edu.br>
References: <20261104202313.72494-1-allan@fatecpompeia.edu.br>
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

video_stop_streaming() walks the pipeline upstream and calls
.s_stream(0) on every subdev. It gives up on the first non-zero return,
without stopping the media pipeline and without returning the queued
buffers to vb2.

A subdev without .s_stream() returns -ENOIOCTLCMD. video_start_streaming()
already ignores that, but video_stop_streaming() does not, so with such a
subdev in the pipeline, e.g. the pixel array entity of the MT9M114 sensor
driver, every stream off:

- triggers the vb2 WARN about buffers still owned by the driver,
- leaves the pipeline started, so the next VIDIOC_STREAMON and
  "media-ctl -r" fail with -EBUSY.

Treat -ENOIOCTLCMD as success, as at stream on, and only log real
errors, then always stop the pipeline and flush the buffers: a
.stop_streaming() callback cannot fail and must give back all buffers.

Signed-off-by: Allan Siriani <allan@fatecpompeia.edu.br>
---
 drivers/media/platform/qcom/camss/camss-video.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
index 2c15546c8..9091eaa18 100644
--- a/drivers/media/platform/qcom/camss/camss-video.c
+++ b/drivers/media/platform/qcom/camss/camss-video.c
@@ -361,12 +361,16 @@ static void video_stop_streaming(struct vb2_queue *q)
 		entity = pad->entity;
 		subdev = media_entity_to_v4l2_subdev(entity);
 
+		/*
+		 * Subdevs without .s_stream(), such as a sensor pixel array
+		 * entity, return -ENOIOCTLCMD, as at stream on. On a real error
+		 * keep going: the pipeline must be stopped and the buffers
+		 * returned to vb2 in any case.
+		 */
 		ret = v4l2_subdev_call(subdev, video, s_stream, 0);
-
-		if (ret) {
-			dev_err(video->camss->dev, "Video pipeline stop failed: %d\n", ret);
-			return;
-		}
+		if (ret && ret != -ENOIOCTLCMD)
+			dev_err(video->camss->dev,
+				"Failed to stop %s: %d\n", entity->name, ret);
 	}
 
 	video_device_pipeline_stop(vdev);
-- 
2.43.0

