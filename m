Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794405238;
	b=IJ9AvjxMvCBx/Se5faru74jqa23AvbSzpNzDpqjp3Bsu/mFPgRjHLjdU7n58nr2ap/NZ
	 4dvll5KgZKRC7xalGravkwnYtT3FWqHftIMJsgUwUrDtN1/IpaBZESE2UkTeFyM9dy3OR
	 DnSDDA7DcKesLBtRVGQ6NZcmAxxQYLqAv0THoDUONmX5Drvxa8GYeIMU0KABhxY+J/Qj7
	 yL7hLlU/rOs8Ug0/4ELSZIbWk3uJS2XTP+0Ogj5eEAVkr1FdMLMGNiIdgxw3MBwW1u1wm
	 joMHs1pXRGie+7q2Ye6CwXsvb6Bgs4QY1Mcv3w5Mu9i33doM7n1dYM5A7sPMgrdLDig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794405238;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Hp5NL5226MQjlVpt8yA9XVBrfAe/2M6ujvxXtj+9scw=;
	b=Z7hRlU9Xb5IACQVXVmvmKA9vg8hgTbU4a1BeuWFmi3b0lVlueeX1vgAJa2MWJtnl5mVE
	 9BGV2hDc2UOXTJaKEBAxXyJ3dW9HQDBdJTH+d6YoXYOzoVHruAJyIDTXynBeuGDeVdcuT
	 bCxwJLz7cLQ3xL44mpYjQnqYc4v6/lflY1U6udE3KSBrSpcIYnISipDvLiDXzKn5fZaYU
	 WSL0FXN87ZRkPOUwCgaixyBM2nZIblMqIPUFq8W07e6OCm+8Jz17/NLSBw3HQF/h+B6oS
	 gLKoeulVw1mWeh+RkqaN3HLo2rUjnfzMImXXbouvZ4Y3K1EB3jrYI2gFRCSUEeP6Rsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=fatecpompeia.edu.br;
	spf=none smtp.mailfrom=fatecpompeia.edu.br;
	dkim=pass header.d=fatecpompeia-edu-br.20260707.gappssmtp.com header.i=@fatecpompeia-edu-br.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=KAX2UuD5;
	arc=none smtp.remote-ip=209.85.217.47
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67DDF606A31C
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 13:53:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67DDF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fatecpompeia.edu.br
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fatecpompeia.edu.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fatecpompeia-edu-br.20260707.gappssmtp.com header.i=@fatecpompeia-edu-br.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=KAX2UuD5
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-7cc0e865dd1so1160129137.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 05:53:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fatecpompeia-edu-br.20260707.gappssmtp.com; s=20260707; t=1794405237; x=1795010037; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hp5NL5226MQjlVpt8yA9XVBrfAe/2M6ujvxXtj+9scw=;
        b=KAX2UuD5HdxGgKaKE8mN+DK92AKsfSeUbVO/EvEFmbuq5+sligftgbylhvdihktyVk
         AEqUtsVtpty0dckuyBrcrTcjQKXMOMieMfXAVDQi9yZPh4ceykZ4luBWaSMlarQ7dqA0
         zuHwXJjf9VY6T0GqpAvJZGpMi9sBcK9h4dsAsCMUaE4mt+QsDi4tIYuGKvF7aB/IjLC9
         YygBMOzuKws9BiZSxBrwsd5cnPBplHCsUht+/YDZNvRa7PP5ubCulh+h68vBgJ68jS2D
         XQttiO0sSySVUGRiXx8EDbG135uIY4x3SZ/d5JkG5ZOkGIeaTXzKkojRBE+YW20lTNtk
         1jSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794405237; x=1795010037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Hp5NL5226MQjlVpt8yA9XVBrfAe/2M6ujvxXtj+9scw=;
        b=XXcdS5C102kWXOlGosjFIm6Utt97+5zDxXAAtaUFK4tSFXi8VJCT+JbJLR0A4KA75z
         /BxKxXLKEulPzFxPOZc/aFKWgd3EpgX2EUveRt+fAal4eCtT61hUztb7ocprwjsgV3uw
         dy5mXMp6xlReaz4JWuWb3BuulJIBqXdvWbby2lMtm1GcRl0BcFUmdqls8kJb2fu80MbX
         /dwp63XpYP3LXH51+ipdcjyBx8L1aWNjXbW24pyMxJU3wthhC799DFDN3iLfID1SqLGX
         2rBK8Hjfimg9FDzfchDAMfgMVuFuF/cnldzTdx68yz5MbtFbPOhU4ObV5HIay1OEVgwb
         OAkg==
X-Forwarded-Encrypted: i=1; AL+hErETJZoAIqZE02ZqqQpCn+mqur+S7r2GWm8v4VjIRYSjIaqZFxqS6Ynk/kbHesK5iN1O7zZUIs2wnlWFyxb4@vger.kernel.org
X-Gm-Message-State: APuU4Z/3UXs1P53/jFwokOXWn18zLF48yVco8oC3LeV1uQYpGmIPeS0g
	orwVc6FP2G0Irdhfrd2Z6J1P9wDXJVu1IZUwR2rjYcfmJ7i4PPwjYIuwXPoJyU4U3bE=
X-Gm-Gg: AYBFou18WzPCdvDGnz8/mlvtrhEDqBqoeWePvjKxptAn0+byYOnCTQgt2D5e7ok8nQh
	8OlCq+Rb/nolNziXHFP0VV+R1uH0D3zUKXG5s+674VrVBKJR/a9LF9ih3yLgRqb48tm3DYOgI06
	ymwbBcIH4QP3Fu+IUK82uDbc3Q6UYHXigSl7TGv6ZgKG3snIbIJ22OjaSWmQLg9Ew3Pc97/KwCL
	RB3a47eW1BIMxKjHXCrgOBbtZLq22qaTih3WNFE1yiRAO7bygvtQcVi3hBPUAc+TNsc/de2aE2U
	+sYXOvdZ3uXsGlxRXHROplHaVAZY7bhBiIN/t2K+Ugijk1L49OE+oS5QjI4QAHkxHzMXpzv4cYs
	vIpDMVuGHG6j5uFGxCRCsoPnuRTDkkCgnvow+tZVSRM4ekMt+8eRtFVRbKpwgLqSmAFtsw/SrxQ
	f0h6k/6FMBQV5hChf9Zr9Kynm+KIwRPY0QCHqTDLP0DYxTBfb/XZyT/hqrhTzBftgzhX0O4pKRf
	4El55HVRCnHsUv5a+Nbm+YfiQbz9Pbzg2ubfz951ESawy7+Uv/tQyYmmTYC61qxiO6Ltv3m1/Im
	+hZuif6swm0/Vb77yVFGybgZCW2IGDt0AGOOURk0lMddRLHypLanKnI3a7qatO8aXNOS/Go2KeG
	MPnI=
X-Received: by 2002:a05:6102:4457:b0:7d0:9587:1b90 with SMTP id ada2fe7eead31-7d4fb2bf05bmr480165137.13.1794405237106;
        Wed, 11 Nov 2026 05:53:57 -0800 (PST)
Received: from localhost.localdomain ([104.28.212.25])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d62241eca6sm786932137.11.2026.11.11.05.53.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 05:53:56 -0800 (PST)
From: Allan Siriani <allan@fatecpompeia.edu.br>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Todor Tomov <todor.too@gmail.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/4] media: qcom: camss: always stop the pipeline in stop_streaming
Date: Wed, 11 Nov 2026 10:53:37 -0300
Message-Id: <20261111135338.27008-4-allan@fatecpompeia.edu.br>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261111135338.27008-1-allan@fatecpompeia.edu.br>
References: <20261111135338.27008-1-allan@fatecpompeia.edu.br>
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

Fixes: 89013969e232 ("media: camss: sm8250: Pipeline starting and stopping for multiple virtual channels")
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Allan Siriani <allan@fatecpompeia.edu.br>
---
 drivers/media/platform/qcom/camss/camss-video.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
index 5de6ff5ec..4388f2708 100644
--- a/drivers/media/platform/qcom/camss/camss-video.c
+++ b/drivers/media/platform/qcom/camss/camss-video.c
@@ -314,11 +314,9 @@ static void video_stop_streaming(struct vb2_queue *q)
 		subdev = media_entity_to_v4l2_subdev(entity);
 
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

