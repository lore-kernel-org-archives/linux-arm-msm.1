Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792653286;
	b=44bXvS9jJ/5n671S2YTV3gm947ClxBUMRBAj2rPUzYjLH4Yuy2zwhkx9N+li231DDUth
	 ry20uzUXGqM44UkGuGAkp4lOPV6zVqB6XW94Zt92tiXOqcUduSSRxvny8ALbxH+V3x8Mf
	 bvXd4I/yd4msAuvdSAJ0FB6xe1HZNQXV+RvD9vAQcNFWsciQNCLGNIFoDPIouujMHmPH4
	 uYaQnFL5WGEDdab9A3SWUbUEejKnhTAyDPvW1uH5sSSVw/+74jVLzUmUQpa195k+KbDFv
	 yMVYmpvkr0YXSuBHFIlYP0fB5/BUjL8f1uWZ8LfRg3jks2zrNHbJzC1fyFdae+ASrog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792653286;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rbQd37yNdLoEoUUb1uI07DktRFDbgbFgP3dMH/u8vgc=;
	b=PrsqY2wlDR10b1v9LPJeFEbn4HWcXqfkNkZKc+sEssTPp/D0TTcRDz68DXjwZE8PxOKM
	 EQHGwNkxjhEqESuBBow1/bmy9uruFC6Orzh8Qqqa03DK3rt/M2VoRtp+oLhnx1Z8Fr2YA
	 G31vKTFdUkqFOL3IB/PlhG9K6VtgaDNkXNnqC7WfyoyN2Ue2DKWIWcUYS8jVSDrtO/p5w
	 HLFlbM/MpIGcT+MJql2Q4X2//yqRA5NCMmQj7tg+Z/zRChdUzD58NTLhsqxIxFN3zM8U2
	 I8lhkh1KPo5czHWYBQv7OmJ7Yy/Gc0EQSlqL1WdBgfgq/n4pQK5AXzV8e1teHAIaziw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BFZUQwc0;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 169B1606A322
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 07:14:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 169B1606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BFZUQwc0
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-14fd9dafb0dso871843c88.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 00:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792653285; x=1793258085; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rbQd37yNdLoEoUUb1uI07DktRFDbgbFgP3dMH/u8vgc=;
        b=BFZUQwc0glnGG0PC89J6I5yzkEC2MR9OBVnxAlTWSNJ8PjQOGdEdTojkyZ000fkN7e
         /dLlw/5WtvHT5jU1Yxb+WnqLDWSfzrof6bbJL5BZmrl46WtCGkJg1OKvHcF6eU990bAV
         QkHS0G/s1TMlcc/SSQtVmAUmBSr7R0IzoGXCX5PvLjuokmEWSK3+cL7NJtu2hTzoBPQw
         GG0wDpoO3cgyMe2DJJPE3vuBX0vjYr5isphipLLx2VirrFABjVhrX9oCuv1HUbrkPgMw
         PJJ41YcltJaXXf0As8L62f7a0Q+dPDQjyiJoOoXy2zqV4PouQ59trMIUpagKBt8KDJSM
         FKHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792653285; x=1793258085;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rbQd37yNdLoEoUUb1uI07DktRFDbgbFgP3dMH/u8vgc=;
        b=wINjBbjEEBNfJYlx9TcokD/d42djbhdJR53lqCO5gw9FEZZiCV8i6PBn9TZUABeexr
         xdRGulEyTJ5ahe7iK+D0YydzN1BnTaVLKBo45opyh2gbXYWlkXjz/ZF6XdDNoyZqYDTY
         L97ng/xd+V6AmTNNrrvG661njm4NKtCiw9pArFKyf3FGthyG65XaSX9Vsgbt/9FN+Fhz
         He7tM6CL/0KiopUgz4gNB5FrLGM3poxPLcdRppf2g/40K97LvV7SFYzaP7EIPDna1lFY
         pij/1HHO38F03F/3Lr0zzZIxLEPRWK7XxZYWRzvIOHTyBHDvnrv6nrBEpSfQ0MVy7pQR
         anfA==
X-Forwarded-Encrypted: i=1; AKwUvBx+DsrbZsRpUiZGASk8H6LDkAFgdU9YPGamVD9dLOrSxECtZbtznMeYqcGh8ay2V6m+TFN/ynNROEFc+y5g@vger.kernel.org
X-Gm-Message-State: AFq9FYJlH7X5v+pxCoYQGuCIcFYAlJrNj3PWUUyy1Iy48cpQPBDh1MpS
	JefNQkOAIj/cm99PQFdraht/dFNBsjMZIlIpuUFNTYhyAWKok74afOMTkiEH1TshjNA=
X-Gm-Gg: AYBFou3ZJg/vMSV3zqtb3RLuSgdtur/QXUFwFLxh/ydT/bVnRwNctXEOp3k0NyJpWw4
	8rIAqyFSt9gwiSBbvp7zkM4iqNBbNCnx3OZCuzXFV41QpNIXeD5ZHE5hze3VtfVJL0XjXjFJn0+
	mR1yBvlIpRxpubDiXIjhfZq/0e+m3la5CVxk5kUUHafaxcNpC0W3BbouKWSizENgw7rIjuBhbwa
	hKiM2nbsT/R6VLiW9lzkhLbHRa2wvYFcoA0d2MT7N0MFvEyXvtrVIrstvF3I+Mas66flnPFRxjF
	QuiHKZk7gjeAXKbgna3wIRAEZdjF/p0y9khgWItPRcAfIkVDlWN/cUkoFRU5XiJ2I7Mm6IX9RGv
	tw67fkoh8AAIEboxvuTsapgaaCGYNYNTtwVuhJk/LqnB3LxdV76hb8sm6aiwKNP9L39pY6/gqwD
	rtH9pAZXazd9Gb9IB1+60IIXaYkwcOyZjii+QcU32fgk6mM1NiBqgZ8fTtrZDGR51KvfmtVuzwZ
	3OuI43QQQEqos6SYUxCb269IGgVcGnmRXZqg7POp+1hV9A4MnrvIyknYv9eqIbheOJoziSXdHc=
X-Received: by 2002:a05:7022:c43:b0:194:3a84:e67a with SMTP id a92af1059eb24-1943a84eaabmr325046c88.41.1792653285121;
        Thu, 22 Oct 2026 00:14:45 -0700 (PDT)
Received: from fedora-x1e ([210.89.35.119])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903bd6b7ccsm11112321c88.13.2026.10.22.00.14.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 00:14:44 -0700 (PDT)
From: Saikiran <bjsaikiran@gmail.com>
To: loic.poulain@oss.qualcomm.com
Cc: rfoss@kernel.org,
	andi.shyti@kernel.org,
	sakari.ailus@linux.intel.com,
	hansg@kernel.org,
	bod@kernel.org,
	mchehab@kernel.org,
	vladimir.zapolskiy@linaro.org,
	jishnu.prakash@oss.qualcomm.com,
	birk.skyum@pm.me,
	linux-i2c@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v1 2/2] media: ov02c10: Fix sensor power sequencing
Date: Thu, 22 Oct 2026 12:44:18 +0530
Message-ID: <20261022071418.26895-3-bjsaikiran@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261022071418.26895-1-bjsaikiran@gmail.com>
References: <20261022071418.26895-1-bjsaikiran@gmail.com>
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

The OV02C10 driver enables MCLK before the sensor supplies and disables it
after the supplies. This can back-power the sensor through MCLK while its
supplies are off and contributes to camera brownouts on the Lenovo Yoga
Slim 7x.

Follow the power sequence used by the firmware on this platform: enable the
supplies before MCLK and disable MCLK before the supplies. Hold reset for
at least 1 ms before disabling MCLK on power-off, and wait at least 10 ms
after releasing reset on power-on to allow the sensor to start up.

Update the power-on error path to disable the supplies if enabling MCLK
fails.

Tested-on: Lenovo Yoga Slim 7x (Snapdragon X Elite)
Signed-off-by: Saikiran <bjsaikiran@gmail.com>
---
 drivers/media/i2c/ov02c10.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
index 221cb93126ec..42aa43ea0a22 100644
--- a/drivers/media/i2c/ov02c10.c
+++ b/drivers/media/i2c/ov02c10.c
@@ -661,12 +661,13 @@ static int ov02c10_power_off(struct device *dev)
 	struct ov02c10 *ov02c10 = to_ov02c10(sd);
 
 	gpiod_set_value_cansleep(ov02c10->reset, 1);
+	usleep_range(1000, 1100);
+
+	clk_disable_unprepare(ov02c10->img_clk);
 
 	regulator_bulk_disable(ARRAY_SIZE(ov02c10_supply_names),
 			       ov02c10->supplies);
 
-	clk_disable_unprepare(ov02c10->img_clk);
-
 	return 0;
 }
 
@@ -682,23 +683,24 @@ static int ov02c10_power_on(struct device *dev)
 		usleep_range(5000, 6000);
 	}
 
-	ret = clk_prepare_enable(ov02c10->img_clk);
+	ret = regulator_bulk_enable(ARRAY_SIZE(ov02c10_supply_names),
+				    ov02c10->supplies);
 	if (ret < 0) {
-		dev_err(dev, "failed to enable imaging clock: %d", ret);
+		dev_err(dev, "failed to enable regulators: %d", ret);
 		return ret;
 	}
 
-	ret = regulator_bulk_enable(ARRAY_SIZE(ov02c10_supply_names),
-				    ov02c10->supplies);
+	ret = clk_prepare_enable(ov02c10->img_clk);
 	if (ret < 0) {
-		dev_err(dev, "failed to enable regulators: %d", ret);
-		clk_disable_unprepare(ov02c10->img_clk);
+		dev_err(dev, "failed to enable imaging clock: %d", ret);
+		regulator_bulk_disable(ARRAY_SIZE(ov02c10_supply_names),
+				       ov02c10->supplies);
 		return ret;
 	}
 
 	if (ov02c10->reset) {
 		gpiod_set_value_cansleep(ov02c10->reset, 0);
-		usleep_range(5000, 5500);
+		usleep_range(10000, 11000);
 	}
 
 	return 0;
-- 
2.56.0

