Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793267739;
	b=28pZ4lX+9BCk/F5xHLtQsfqeju3QzT00rxwNVaDVwau8YzRAHOt2mt1X5oQpKaOiGgwN
	 xuoME3cShKYK33pAQFUEYqwVV/y4YPTMmT4laulE5j21ewkmVcEexQkJMH5fGN+670ZjP
	 y+Dhp7OFfsobvl3bT+KksIKDKTJNiETKOUUXlbBBykcrUJ2aNvt/eTnfoJ6hjFiaSNr2q
	 sp7w7OIYb8E/+j2H5wJqp//Jh7nRBBa59SxSV3k7nM3UE0izfC8djE8PPr9Mu+d+KTY9P
	 u+hxIC/er/ILFBU4W2DlemitBebqADftpeRZPC4LQhk2GJ29Go1S6lIiEUq+gHlvf2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793267739;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=0CCqQOpJ0Fw5aJTyhWOhah978CPl64JySHMQmrcB/Fk=;
	b=ygpv8wzMjrKgb5vTqxHONWiawgAU6rfLnm/jpAxzH3XfX5hHMH+9/y2l6JhOynw6W8N2
	 A3sgdrwp+2p4OrWZS/DUkzwsULSBq+ZWfABWRoqspUo8NYVFEuGqLswp+fxRermZjo2DY
	 FB49/eCIBC/AZoP4+3bRGHy8tgdm3rAd5+oqWQF9wDdS2gnK1Zpt/G6GF+Fp+ezVkrb3t
	 2IcUJTeR8ay8IXmPmYScvXIF6yn0Ic63dvdZfxIbl2C1/Tu3ubhq2FAx9z/4B9eiAUVon
	 q/0qmshpdKh14dDAbQVDAg1FQGml6XeJ+Z3t1c5cvYRtm/Mxl8zw6QVMYw/vezH/SCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=oEQYQoi6;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD05060A5BD3
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 09:55:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD05060A5BD3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=oEQYQoi6
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48c45111bebso879133f8f.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 02:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793267737; x=1793872537; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0CCqQOpJ0Fw5aJTyhWOhah978CPl64JySHMQmrcB/Fk=;
        b=oEQYQoi6O5OkmaVCImNttcNnUdvVKpb0O7KkvNejGJ+I/Fu4G5NZNmSQ5M7D0bbXHs
         LlXR9gm4qKWXqFAEg0pocyGjYF9o2EYKHvVNlycPS4yDoUynvYGr4k6UgrKZkVQp8QYI
         rTKHenqSu8uu/AJtE7gE5H+c8BCc1jG8pdGHKBfgCz3oWu+ADAtFpWadj7JlH5MUs+j+
         wiLDr2hi+sS041vH7Uz859v2xpYlu4Fa16AppE731ja+Go6IuRIe1rPF1Uc050QDseu/
         cLDxGnzojwXgsQTW8yR4PqOGHWaD4gilAhruMcu8mztXfgVHyk4h849p/ReKvM6R/aOD
         Keug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793267737; x=1793872537;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0CCqQOpJ0Fw5aJTyhWOhah978CPl64JySHMQmrcB/Fk=;
        b=FqkMfttxJc0UGwBuSqqTHXz7Ly40yIUTiLC7Af3+7gx1yCxmLSCBWroR9M1lK+bJll
         hyEfcv6qAc8jREpQrttBgTaec2ezocv2rV4Bm2RPLonAIJhLvffjqJ65lcIBMzpd558I
         4fq7z5CG8VwFp24o3JAibZIYKwgvGJzw+gYDHK/f2PFFogPsE7/lXpO978RedAkIZudy
         iyt9MxRVmLU5uUUg1FtLAdtlelXkZlJ1h9QXkmPU3Rm9Vq7JeO2XDVNGTD2INJgDiZkb
         3VEyjfVrXpW6INqGrEAvSa7EHa82Hd7bZrNHCaIYBisP3CyurAU55K+DdU9hqTRnvpPF
         zaQg==
X-Forwarded-Encrypted: i=1; AKwUvByDJlCxeTtC6hBK027K4lBK8HQNyN4L4oIKuDM6kpScUjOa0TnOynDDi/t8fUMV/8o16X2JWikih7qaLJeD@vger.kernel.org
X-Gm-Message-State: AFq9FYJR7cMfc5/Q+Wz87HX37/tLrDLJgof8oljoq+UOCeW4R4Bo44Yz
	TZdgTCjF8yX+ogRL+wCQuXxPkDPAHngxnCZwI+i3Py9M3oIQcOTnYhpTRA/8C0PuXLw=
X-Gm-Gg: AYBFou0tt3SpT2D1BAz9iAVJ2jSl9Akj7qRzI4G1s7EEgmqEjIqGuT8K6s+VAncXk9I
	BmAy3G8m4bx+9no6O3VxAxzPuYDaMt9ap0LrBCobLOPRN+AGIzdkP0AUOax/peIDYpE5DVepGUL
	c7e99fuYu5mh83F7Sr6AL33Ea0aAdYuAt2DMAaaoOf1HppguiIeoOh/EThh7AlrzyYu321ggNIw
	sn3IKiPZV8A9+Utr5WSXVm5zrIk1mgdFjcdylnX6LSylEm1gcrg8r4bfyDVssh9EVSwgOcIp8VY
	8wzBg6+0/mkpLXCVF9tYlUwz2U4t7Hyzna4xXd4FpXBYt1Oj3giUb6ktYVCMtIocis3IjnwBmxc
	DSm1yXCIyLaM9jZm3cSmtG5fIvyo2/F3GWWhU9lDGncoEJY+hxfX/KdcJIvgGoXqXnfquYP02Vj
	hHjiw2PYsgTArLwjuUmOUpFtcDkrEemDw2gzALdeweqeCFuiGQtTSIIhcooijdg1dIPAWma168L
	kyT/F/buwiE/r73f22XI5Ul1+xSRbmlqEpWXP69s87cMhi+CUHaNbQVNjV7hrCjNRFTN2SZgOZP
	ksU7s3I2Zg5aqZQJ/Mg=
X-Received: by 2002:a05:6000:2c08:b0:48d:bafc:a409 with SMTP id ffacd0b85a97d-48e5d2f07femr11643816f8f.26.1793267737081;
        Thu, 29 Oct 2026 02:55:37 -0700 (PDT)
Received: from [127.0.0.1] ([64.43.45.156])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd37f4sm40437160f8f.44.2026.10.29.02.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 02:55:36 -0700 (PDT)
From: bryan.odonoghue@linaro.org
X-Google-Original-From: bod@kernel.org
Date: Thu, 29 Oct 2026 09:55:19 +0000
Subject: [PATCH 10/14] media: qcom: camss: csid-gen2: Enable RDI EOF
 tracking
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
Message-Id: <20261029-v4l2-frame-sync-v1-10-d37992559c58@kernel.org>
References: <20261029-v4l2-frame-sync-v1-0-d37992559c58@kernel.org>
In-Reply-To: <20261029-v4l2-frame-sync-v1-0-d37992559c58@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1399; i=bod@kernel.org;
 h=from:subject:message-id; bh=r3fC5w8imskVkr9dtc563HKXDPLCXa7nuklJaaLzUsU=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBq4xgN/CQhAZC2zGVuf79kAiEOlROA2O29IaYdX
 +Uz6AaWj4mJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCauMYDQAKCRAicTuzoY3I
 OiibD/93UUs7BiNVc62lHKHfrHTWjqeNTuytUGxRwyB12d61SfMssCzrFjbWCl7sZup6b7NNa6L
 rwslL2n3zAnacn6iiEMXp3nTQPhhMz8RLlNtG3uz3aM1ITjLp+bctsYWqoLkGo03VfHpJzpIWTb
 AOOBn3gb9F+b489dz8NZ1mAau/Ark+ru5i73k5nKJqtwDpag1HKTCKzNC2NaMW+Jbj0kIUSxLce
 KX9j8Vq5YQgIAWo8Cvbe5PF7HlZ/9fhKLR7Cn5jOL41ndzcPZiWf2iJhylSWs0cXldMyoBhjFXF
 2d3VwOInug2JP3GTYxtX4IQA4CACRtqHNbjMeCOzsLvVXQ+u4sv5KYs9Tiwv15hYpciNVoIyetV
 LzFIMZlpK90yYl+5VWooufOIkSsU9mgfTstw9jprJcevKnjZSV7Vzk3099SbARPWCzIC6VDG2Hr
 3G8v22fPq4bsjuQCaJE0v+BJhXoIvKfinsw3vK4e0U4nK/orvY8Q6lpwIck2IUSIMXi1rUI90Rj
 R5bHMfUsOYIsrUCQunt/96L3S/v4/ub5gUvZ5K63/6VXCBUrjGQyJ7M6iT9tiZkdrbYpILqMcWS
 lRaTzT75RJkFdLqqap6owSmFrUEVRYMcU1bTen6gTXu84zWCqnUJh5Cnua91krDGodncnclxsPI
 qebnZVIn63N+7xA==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Enable the EOF interrupt and notify csid_eof_event() to drive the
vb.sequence.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-csid-gen2.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen2.c b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
index a351ac4b91728..44f437c3f1ace 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-gen2.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
@@ -39,6 +39,7 @@
 						 + 0x10 * (rdi))
 
 #define		RDIN_IRQ_INFO_INPUT_SOF		BIT(12)
+#define		RDIN_IRQ_INFO_INPUT_EOF		BIT(9)
 
 #define CSID_TOP_IRQ_STATUS	0x70
 #define		TOP_IRQ_STATUS_RESET_DONE 0
@@ -329,7 +330,7 @@ static void __csid_configure_rdi_irq(struct csid_device *csid, u8 enable, u8 rdi
 	u32 val = 0;
 
 	if (enable)
-		val = RDIN_IRQ_INFO_INPUT_SOF;
+		val = RDIN_IRQ_INFO_INPUT_SOF | RDIN_IRQ_INFO_INPUT_EOF;
 
 	writel_relaxed(val, csid->base + CSID_CSI2_RDIN_IRQ_MASK(rdi));
 }
@@ -388,6 +389,9 @@ static irqreturn_t csid_isr(int irq, void *dev)
 			writel_relaxed(val, csid->base + CSID_CSI2_RDIN_IRQ_CLEAR(i));
 			if (val & RDIN_IRQ_INFO_INPUT_SOF)
 				csid_sof_event(csid, i);
+
+			if (val & RDIN_IRQ_INFO_INPUT_EOF)
+				csid_eof_event(csid, i);
 		}
 
 	val = 1 << IRQ_CMD_CLEAR;

-- 
2.56.0

