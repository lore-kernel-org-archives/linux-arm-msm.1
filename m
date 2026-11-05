Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793874545;
	b=o/X3yggIIATvmMMEJ4RMAGo+weHCD7xcYyNz4cE8vNehwip7UF1pqC5hXaH/yZHYfwY7
	 7E33KFzvCKAmu7uilKDfgTMC2ouYItuBzNKARWhkr8yoI2HvWJOU28/MUrrgJqsnu1c+a
	 KH+H93t2dq+D1CUJSsnC4jFX1SV+yPn00hAs3jUSuGpQaeoOBeSFtarNLh7PgEErxU3iI
	 dZPVvvLqZCqWyuuD4/rC+WDcmU6Qtb+nNxpKxXB7g4hgWy2wGcOnKNPJQ6o7vj3Zx3o+z
	 Mj7yIasj7O36PUe7SBAklU+IOO+FOamOp1v6dAVfOQ28QOyL1qVDys3DxngWrDD5whg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793874545;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=kuiqWlPXMfPHzXfjavSlArdOnzZ4gKQLgR8XLdjD/d4=;
	b=VI2XX0ZT3ZOUCIvR1W4Dnu9xUcv4eLBYZy6DbceNVDQJayOLRs/6w+zAa13MdVjZWdD9
	 H7tB3NA8E6jv4BdLruePFyh3cSOxEs9tKl+A1K3QJiPjY6hElxLpJ02jVA/9rhJiF+hd8
	 SLEOJvap6TowGcQX/NlcP+CuaBponmoTp0jmmD6RmLAeA/b+p7l9Poil79aeMusvj8wzL
	 UQ1JLqe6pzyiF2KuEONwuasBsi/NcG7z8WSsqnQewtjP8Avq962qT/BT2FjhfMFavh2NO
	 RoQ9Ukx1FjNl1OkyWBw4KwQk+g6BkgTDMG+Jq9c9AehhP2cJB8bFI7H3uVVSJChry0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=rpkKo2tu;
	arc=none smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA91C606D817
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 10:29:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA91C606D817
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=rpkKo2tu
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b429f71dbeso1691081a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 02:29:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1793874543; x=1794479343; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kuiqWlPXMfPHzXfjavSlArdOnzZ4gKQLgR8XLdjD/d4=;
        b=rpkKo2tu99qcrPys0C/XByLVaqgRKyDLy5hwXBlYwnlBUw0XJxAh+YlCeFNWURR4yX
         xMChmFQXpXPOddaoUiW761WyIUnxA3ArhlFo6+qFdXLHmlzgfqHMnUVTLIg3RTeQEx+F
         lQBe1Jp7OZmyzKDJ00S7moxP2Y0oo7kIuWVB6tnYunZ/Z3kovCbpSCn5AgIhDs0M9VtS
         7sEvNZhSNvp000PLpA8FINskroYfLgCzDEfKqDo1dBN7cylbtWs/E0LZWYcA9iH5h+Tp
         OvYg0x8H78RaH+xwjeZUjlBJ15wIEYThQ111qfiUJTFQkU0wLG4RKghL3WbgBV5ySE8X
         5XEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793874543; x=1794479343;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kuiqWlPXMfPHzXfjavSlArdOnzZ4gKQLgR8XLdjD/d4=;
        b=epZ4p2MD/Z2FSuUGBB94leIGwIKzG618PFc1SlGWRa1mj/QinfD+SfsOLxFaLQ0JGo
         Y6H2EfkyyvuummMIcXetqq+ktxcFUYXuW7UhbaaRitzqODwWhucp0NFvMXh5chGn1URW
         JZHP3ZdYaI/OP7W16blHzQdtub9lF2loSC+uGteT1AgX22RycCJIN6CSuW38utyPs4sP
         71A5uG2+a2fXhhMkR7aocKZQBxKBWUxT+SH5rBfIVe8WH3Jgp8x9bk4ENvNZnJbyit7K
         roWZTCO0dWE32sKO6JZYf8tLz0nUgIrRTlX8/AZRbFGEKsrXKfc6akKI9Qcx4nqwEmMI
         6znw==
X-Forwarded-Encrypted: i=1; AKwUvBxDwaF23UqDFOvFMu9oNFGaRK0qypsgXrz+YaHkJx8O8rQnR5HK02u/yBJqtCnopRLZbYZDL6AB2ZnrETfq@vger.kernel.org
X-Gm-Message-State: APuU4Z/T5wnSvMjZ+hoZ2G9M2L20oqgd5ArgD1CzMwlg9z2C3zDjukFV
	crkHct8j9xy3+htPco/ckIsZzAxyNKosNzepdX/M8K7wx4SfbHjeE+RqBG2RJ8X8ceE=
X-Gm-Gg: AYBFou0pmCgMwb44SW8DuN2/gXuI4N3i7zYOLs9B7qiaeJcP5TcTnDwlGDkLw+2B9+4
	X4V/tFflAi0Y/2jK2fJp6vAkuZ2uqfUUMnHVXMk36rTwebEVoNq+Me8tpmvGKp+J65jIyJgRulJ
	Gu6aFAokYQJESRlPYC54viiXYku8Xx4XbGtUPiuHl2KiI35jVY+eLc8L3Wl6ShVMCh6r0UtJfDe
	unwUIn28ziSgImIm/Ca89uyM4kr2tfHI0dZzugvxqm/NtdYa+brpbpsOt9tO6tvdkghpNXn0di2
	P2B+mw1sTtraCXWGjd34xF/W0/k+Nt4lEPxoJYq7kYFBZA8EPBodzKFKkcoHRib0lfPcDr9TfzG
	r3ZGVWIBLJUtADYVygurooKnRWPrG9sMOKFWZki+CO9VLLOxlxWN0Z8VWCw5IED5o6jdQ7dTW0C
	TkoLGprGHI1IxAm1vMKiqoQpjC10Dfh/oFnmYWEqwey/q9c10br6CuPFpNflfpikcy4sOt7rMGG
	jH+Pn9ZdSz997JlPx06l7zzBeLLQvp0T5NQbUKHMeOkGdyTxcnqD+avHxGljOf9YVo6uBldyLQD
	STvo/2kJohvFGFaYwhv2jwdDAhUXUgfsxCh+n7FuhuiTePksINWKlYWW1u5sTfjhnkMNW+kL5qO
	36XIROtpDOqiSw7dEEaHD2g07MXTPY69e
X-Received: by 2002:a05:6402:1f45:b0:6b1:cea1:a023 with SMTP id 4fb4d7f45d1cf-6b4d4c6f85amr15321879a12.19.1793874543256;
        Thu, 05 Nov 2026 02:29:03 -0800 (PST)
Received: from [172.16.220.224] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b5864a87c1sm278665a12.2.2026.11.05.02.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:29:03 -0800 (PST)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Date: Thu, 05 Nov 2026 11:29:01 +0100
Subject: [PATCH v3 2/3] media: i2c: dw9719: Update DW9800K driver
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
Message-Id: <20261105-b4-dw9800k_cleanup-v3-2-6850ee6a5a5a@fairphone.com>
References: <20261105-b4-dw9800k_cleanup-v3-0-6850ee6a5a5a@fairphone.com>
In-Reply-To: <20261105-b4-dw9800k_cleanup-v3-0-6850ee6a5a5a@fairphone.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 stable@vger.kernel.org, Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793874541; l=4806;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=vIdVuZXzskHp6BB4VyvbfPYAsFbE+ScV5dXe5s5BsrI=;
 b=6+AAeHghITHv//1oWnkYUBCUdUedB1RP6RwrpnwU99n2tT+uf1GomnfMlKYV19Tc5Y/NU8ycr
 vFJN8EdB3hvD8BvCbxnsAeHP+8ErbZ1tN5JXFFUg7bL6D3on6uj6zrc
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=drSBvqKFiR+xucmLWONHSq/wGrW+YvcVtBXFYnYzn8U=

The previous DW9800K driver code was created without access to a
datasheet for the part, now that we have one we can clean up some
misunderstandings and add some features for further expandability.

More specifically:

Previously we were blindly writing registers to their downstream values,
Now we know what the correct default values of SAC and SACT, and write
to the correct bits as specified from the datasheet.

We found that the device does indeed have an ID, and add it to the
switch statement when setting up the default device properties.

The largest change would be the implementation of "Ringing," this is
actually an internal switch bit used to differentiate whether the SAC
(smart actuator control) modes are enabled. if the "ringing" bit is
zero, then actuator modes DIRECT and LSC are available(based on the
value written to the Mode register). If the bit is 1, SAC2-SAC5 are
available.

For the devices we tested this driver on, no new values are being
written, but now the option for further use of the DW9800k is available
to others if they wish to do so.

Fixes: 083f7f0dce16 ("media: i2c: dw9719: Add DW9800K support")
Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
---
 drivers/media/i2c/dw9719.c | 65 +++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 56 insertions(+), 9 deletions(-)

diff --git a/drivers/media/i2c/dw9719.c b/drivers/media/i2c/dw9719.c
index 3b7ba88fd67c044ef9005a0aac6a5d26ab939a90..3b99c5492522c33e0aeadb9fe7e9b49f777b9470 100644
--- a/drivers/media/i2c/dw9719.c
+++ b/drivers/media/i2c/dw9719.c
@@ -68,9 +68,18 @@
 #define DW9761_VCM_PRELOAD		CCI_REG8(8)
 #define DW9761_DEFAULT_VCM_PRELOAD	0x73
 
-#define DW9800K_DEFAULT_SAC		1
+#define DW9800K_ID			0xEB
+#define DW9800K_DEFAULT_SAC		3
 #define DW9800K_MODE_SAC_SHIFT		6
-#define DW9800K_DEFAULT_VCM_FREQ		0x10
+
+#define DW9800K_RESONANCE		CCI_REG8(7)
+
+#define DW9800K_DEFAULT_DIV		0x01
+#define DW9800K_DIV_SHIFT		6
+#define DW9800K_DIV_LOW_SHIFT		2
+
+#define DW9800K_DEFAULT_SACT		0x20
+
 
 #define to_dw9719_device(x) container_of(x, struct dw9719_device, sd)
 
@@ -90,6 +99,7 @@ struct dw9719_device {
 	u32 mode_low_bits;
 	u32 sac_mode;
 	u32 vcm_freq;
+	u32 sac_time;
 
 	struct dw9719_v4l2_ctrls {
 		struct v4l2_ctrl_handler handler;
@@ -140,10 +150,6 @@ static int dw9719_power_up(struct dw9719_device *dw9719, bool detect)
 			dw9719->sac_mode = DW9718S_DEFAULT_SAC;
 			dw9719->vcm_freq = DW9718S_DEFAULT_VCM_FREQ;
 			goto props;
-		case DW9800K:
-			dw9719->sac_mode = DW9800K_DEFAULT_SAC;
-			dw9719->vcm_freq = DW9800K_DEFAULT_VCM_FREQ;
-			goto props;
 		default:
 			break;
 		}
@@ -165,6 +171,11 @@ static int dw9719_power_up(struct dw9719_device *dw9719, bool detect)
 			dw9719->sac_mode = DW9761_DEFAULT_SAC;
 			dw9719->vcm_freq = DW9761_DEFAULT_VCM_FREQ;
 			break;
+		case DW9800K_ID:
+			dw9719->sac_mode = DW9800K_DEFAULT_SAC;
+			dw9719->vcm_freq = DW9800K_DEFAULT_DIV;
+			dw9719->sac_time = DW9800K_DEFAULT_SACT;
+			break;
 		default:
 			dev_err(dw9719->dev,
 				"Error unknown device id 0x%02llx\n", val);
@@ -185,14 +196,50 @@ static int dw9719_power_up(struct dw9719_device *dw9719, bool detect)
 		/* Optional indication of VCM prescale */
 		device_property_read_u32(dw9719->dev, "dongwoon,vcm-prescale",
 					 &dw9719->vcm_freq);
+
+		/* Optional indication of SAC timing */
+		device_property_read_u32(dw9719->dev, "dongwoon,timing-control",
+					 &dw9719->sac_time);
 	}
 
 	switch (dw9719->model) {
 	case DW9800K:
-		cci_write(dw9719->regmap, DW9719_CONTROL, DW9719_ENABLE_RINGING, &ret);
+		int ring, sac;
+
+		/*
+		 * Enable ringing for SAC3-SAC5
+		 *
+		 * sac_mode	reg	Mode
+		 * ===========================
+		 *	0	0X	Direct
+		 *	1	1X	LSC
+		 *	2	00	SAC2
+		 *	3	01	SAC3
+		 *	4	10	SAC4
+		 *	5	11	SAC5
+		 */
+		switch (dw9719->sac_mode) {
+		case 0:
+			ring = 0;
+			sac = 0;
+			break;
+		case 1:
+			ring = 0;
+			sac = 2;
+			break;
+		default:
+			ring = DW9719_ENABLE_RINGING;
+			sac = dw9719->sac_mode - 2;
+			break;
+		}
+		cci_write(dw9719->regmap, DW9719_CONTROL, ring, &ret);
+		/* DIV is 3 bits split over the bottom bit in reg 6 and the top 2 bits in reg 7 */
 		cci_write(dw9719->regmap, DW9719_MODE,
-			  dw9719->sac_mode << DW9800K_MODE_SAC_SHIFT, &ret);
-		cci_write(dw9719->regmap, DW9719_VCM_FREQ, dw9719->vcm_freq, &ret);
+			  (sac << DW9800K_MODE_SAC_SHIFT) |
+			  (dw9719->vcm_freq >> DW9800K_DIV_LOW_SHIFT), &ret);
+		cci_write(dw9719->regmap, DW9800K_RESONANCE,
+			  (dw9719->vcm_freq << DW9800K_DIV_SHIFT) |
+			  dw9719->sac_time, &ret);
 		break;
 	case DW9718S:
 		/* Datasheet says [OCP/UVLO] should be disabled below 2.5V */

-- 
2.43.0

