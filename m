Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793267739;
	b=v8HSij5WD7Ds9g6WuSKCW1YI/lL6guRRUhB5mLAiK6R3BX69GnhXURREU1TBPuj4CXVQ
	 HK+Vped+TzjoVybK5dnDi/aVP66Mj7QUCT7Nf/M5chTKimk1gaJKB3VPIrGAyESpZQR6m
	 1xvA2gfl87KZaszAAS3zblh2qASwr0FeLXpYxO6oKk6TKysxf/h177LpEqopHi7CjPgC/
	 CsmA3MCgHBTbv4jjYZwZEPghaa3OAgPgvpUnkEMZMMz3KFEA/ZfvbfoC78wc9wXF0jMS/
	 8mgi3zZFso6Ii9PRFSn7XHqyI/86L4EmSmmSnAzg6ppDsZvd/uj3Dyq/GOtfr21vP5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793267739;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=QsPZ8M0r6NfeAXBkC/hz5orq1rIe4mViDl25/r3ahXk=;
	b=3sYOP9Kp4r3JnzcjHQMC56lfWxsu6G8iYlzTZ/oP7kPPyGm/zr7nAZI+R+YDJLAq4eNf
	 UUH1u9DR1cCoXegtYh6JI8ikR16Trd/ApoTzfqU9H1Eo7W/UUWP7kKBdvxkCRTuKXS0+m
	 8AGZ8W7S9DgRHYCrioCAPfJjX/Qxucm3B55w8R5zEjb6FEY262s7LufDt1XyaPFtXGlIM
	 B0P5f3nt3fcHcT0f5XDoF2Jv8T+f8EAmNDYgYSbcOGvl3Xu93eDVYl44u7V8P5R4Jwu4v
	 fnj+AYCGirIMBu5Fw/UKtfnK6lbAFxpvepkhbULGYh1tU2QATSOxYTw26FyqZ/f6tAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="JZ7EF0/a";
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD7860A6F45
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 09:55:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CD7860A6F45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=JZ7EF0/a
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so17059115e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 02:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793267738; x=1793872538; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QsPZ8M0r6NfeAXBkC/hz5orq1rIe4mViDl25/r3ahXk=;
        b=JZ7EF0/aupHbQSIE430X9IygySRTKpUfxu5dSFJ2SZ1r3HDglDDyvEtmUlzpodOGRj
         OhrbFeh/mF1RsSdezwXnBtFSG+Zl1ye4UZ+XbvPiUV89TFe07ebOyibtl5LGItpsIZTm
         zVdqSf8SFm1R9rPRc5lU5GecuyTlOvskh7ZqzICun0uTGAECX8i/NLPNnVQAr9TxWkP8
         pPdBR97JREz57VBsgLIZyrAIG2MQlC2ImBSx7G7xvqE4hBHDL1WO9gQK4mAZBt/6pvte
         BbCmtuw5fkpv4eksAC7bg+7h9QDiJl92VYn7/QlpKESrZYQB5x9H/h2tNyDEODq51i6J
         sSPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793267738; x=1793872538;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QsPZ8M0r6NfeAXBkC/hz5orq1rIe4mViDl25/r3ahXk=;
        b=UbAThrtpQwleiyjKlUke9TbQy5ycJTCN7jlV6izkHuc9yhpw45ziwWBDyXpnhQNlfR
         mbIlOQSc4cQhKujnIKcTjwm19RlhOWUHVHUyfQBH6qu3xDowYZC3wafXardZl3nck4y4
         +AMtflWm+jkbjMDV0mf43Dsf1q/agP+ZA8kvEHB+2pMjqWY8WNE0VC1xsemANJJ277Va
         Pp8EY/TGwIJOas+C4/V/HGShKeKfMscl7OdO7uLCnRobRxlrW5PPEyZcGwrrbd5VXABz
         xCBPKdCxAcOitgWeah6dW/QLzwjVLCtDZcxxZBWJDQFetO7Z3ifnv+igNmY7mLKctWgC
         NgxQ==
X-Forwarded-Encrypted: i=1; AKwUvBw+DLLnRG6H4/63s5nGLQhKyOooxmaHCKneAFhkkR8OOd7Y+v5T/WTAjt6Py4pf12be+h2wPc2orx5AW8BJ@vger.kernel.org
X-Gm-Message-State: AFq9FYIAcUQF9gHqo1PIg8nzPICHnnCJ67ezbC5UdszyxkYmXWrZsNVT
	h72FmjkNYHX5mvR3g+MvLXcg9oyFnBc4PsPM6+F9PqGzkLOJp2b+DfwepcKccRpNqH8=
X-Gm-Gg: AYBFou06wDytshACDXJkuxBOEg2wuDz0mZrQiLcy8371V0rzaGmBS5eQYeySdxy29c1
	skSFiEWzH9cV+FmAbgFmNW57jdFJ5pElaiVgGOAm2juhtEGwUQs1Q7uz6lKYW+JdDn4Cam86kpQ
	bDSPWiE3vICNomIaLfLgrXL6aJsNPoWm0Z4q5Chyz1u2/MQyFX7xryLZjEcaUW2/Y2n8bGg6bC2
	m2ntxRG791trxVLDVzAmvC5THOkYcMVPqHjg74XltkMGRdk4ekT3vt9nJy6Oo+YR/HFXjjhG+WM
	g3sKak1yQnUoEnlme5kH6Y43B3DiSmQtAUOyHze0dVnt1VKPFokWP1/Y9f5wK6jDCqvIYi385oG
	h0L8h7rk6/IXa9ao/f5wwk2sI3pMIMFLrNneQXa2mCGrLYRGsv6nT2wkugZAFeVfpsKn/AwtcX7
	ap1s+vJwMFeS4spy5PA/FYd3AKxKJTqZ+JHmTjcN/DpkXtzxQX6z1oqcHr6GHvLIg9VFyBj6W48
	Y8isGc8N93BL0bZdlKnxzt8Utz0DchMXB4vAEU8k+nysJ/EvE6wZRQX7aU+VRK92zI2eWV+HAXv
	foynVdEGhZgVBjw4zOBE0BsIbQT3zSLqwWhkMH1x
X-Received: by 2002:a05:600c:4454:b0:4a3:5a7b:6002 with SMTP id 5b1f17b1804b1-4a96720213bmr112641605e9.28.1793267738005;
        Thu, 29 Oct 2026 02:55:38 -0700 (PDT)
Received: from [127.0.0.1] ([64.43.45.156])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd37f4sm40437160f8f.44.2026.10.29.02.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 02:55:37 -0700 (PDT)
From: bryan.odonoghue@linaro.org
X-Google-Original-From: bod@kernel.org
Date: Thu, 29 Oct 2026 09:55:20 +0000
Subject: [PATCH 11/14] media: qcom: camss: Switch on frame_sync_en logic
 for sm8650
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
Message-Id: <20261029-v4l2-frame-sync-v1-11-d37992559c58@kernel.org>
References: <20261029-v4l2-frame-sync-v1-0-d37992559c58@kernel.org>
In-Reply-To: <20261029-v4l2-frame-sync-v1-0-d37992559c58@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2018; i=bod@kernel.org;
 h=from:subject:message-id; bh=mTvCg0B/NWs/IAZBEB5VKXi7uclQSPEKpzKeZaiX4S8=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBq4xgN6GBAhE4W0DNKgVsXU9Bv6hV/nfttNNlOE
 UzIQ7zJJ3+JAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCauMYDQAKCRAicTuzoY3I
 OkhmD/9blNR/awZP4NPqP8ueMOMyekFHGCAVRwWmBpgYoLsfuXcEbFSuPcayTsUQWRXCBGn+OBI
 mW3s2vWCkzL3LBK+PfPfgNBH+ihiJx5JCHvfPBAxdyLMfLGNk3BiinDq3lcUhsHgvDx6hmikAay
 pjpAvT4qPWU9K2lJWwF2MF9RgbeYc4j8iorP6PdJDCfVpJalWTIjL5AKZd5U0bUzBo8Pkis4Tz2
 qB5V/RIVA5DZJVEbNMbpPAuwA+h1tZc9zmou1hO76KqrQQAdP2b7dyZAaxfqPKcjCJQD+iqt3jR
 JYkJUDY63mAiUQHZcSd591yg46ceWn8805TYbUYYSYMakndEFhk3BbPZqdz+/twuCGc9qzKzyC1
 2YsvdyydbTOWUdFLXm/8RHaanfFElSBVP65SHt303I814ev0eq+Qx7hzUEduq8bs/l/5+WtsGL0
 BtJVm6oPdPlurF9Vvr9ntzjf9U6ZNnGr8bsMmSSFazS1PxVwgKBbJpL+hMCf6iWCP2GfBXskrCP
 ZSfBmP2qU2YROLwN6PNpyc0hx8Y2o1ShmEIT7BZsTave7epiiawpq9duxtqb4Rf9PmaqihLtkvI
 GRxXcm6MMGim9f8a65mPklAQcj/96l8LU+Ba7VP6EW6+xriXxNT1/rPMCidaL9GGDR24OELqQ4D
 HeJs7MW1Iqs8f8Q==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Switch frame_sync_en to true to track and consume SOF/EOF data.

Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # sm8650-hdk
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 06e1bf82f4836..cd5a297a26970 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -3433,6 +3433,7 @@ static const struct camss_subdev_resources csid_res_sm8650[] = {
 		.reg = { "csid0" },
 		.interrupt = { "csid0" },
 		.csid = {
+			.frame_sync_en = true,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.hw_ops = &csid_ops_gen3,
 			.formats = &csid_formats_gen2,
@@ -3447,6 +3448,7 @@ static const struct camss_subdev_resources csid_res_sm8650[] = {
 		.reg = { "csid1" },
 		.interrupt = { "csid1" },
 		.csid = {
+			.frame_sync_en = true,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.hw_ops = &csid_ops_gen3,
 			.formats = &csid_formats_gen2,
@@ -3461,6 +3463,7 @@ static const struct camss_subdev_resources csid_res_sm8650[] = {
 		.reg = { "csid2" },
 		.interrupt = { "csid2" },
 		.csid = {
+			.frame_sync_en = true,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.hw_ops = &csid_ops_gen3,
 			.formats = &csid_formats_gen2,
@@ -3476,6 +3479,7 @@ static const struct camss_subdev_resources csid_res_sm8650[] = {
 		.reg = { "csid_lite0" },
 		.interrupt = { "csid_lite0" },
 		.csid = {
+			.frame_sync_en = true,
 			.is_lite = true,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.hw_ops = &csid_ops_gen3,
@@ -3492,6 +3496,7 @@ static const struct camss_subdev_resources csid_res_sm8650[] = {
 		.reg = { "csid_lite1" },
 		.interrupt = { "csid_lite1" },
 		.csid = {
+			.frame_sync_en = true,
 			.is_lite = true,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.hw_ops = &csid_ops_gen3,

-- 
2.56.0

