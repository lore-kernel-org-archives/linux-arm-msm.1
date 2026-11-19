Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795081888;
	b=RkzFlDxCz8na5W45uXWAxQXWO4o+0NRkBs7/qYTcTZExtZDr4DbpRNt0lroDl6b0XA3v
	 KgYkIujk3HJKLgbK5/RXnd7AHNZIXjz3gxVnvY3ro8rgyNa+AD8s331IRRp5m/QjZHpUw
	 LUOPKC/fVfsXiBOiywPWokFvVxCxSxnu11y5rCIs0Jlg0ap7AjBlw6nnqPZ+lMheEaoU0
	 /68sv0XXaEoOlRlAxGQuy7is77/uCUqyN1xYmX9G2lx9PMhv+95XU3XZGr/E3+DBqoRDc
	 xtTcfTCAe4gdVpcJRYITTrZ3F6D+iNS9YbN3izbWQuUIqFowTj++ay0jNbmjYEcVlXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795081888;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=aoPl+pQm9ZHcIGL4Om5Oc2NfD/t8KVMY3eNtZkgFANg=;
	b=AlDhq3gXPoMk2pm/N4/6vNejPBRlw8192SCao7DTKfnX1AAspJ+PpmAF4x7kHr9wACpc
	 1UsIrog+DLPSRhqTdRR65kX+Z8fIki05K3c0r1ch90SQJcEqaQ7NQsv/2z1oYnoBMR88F
	 SqCQOUjuZ9vrASD4ysExK5RyINz8KxryJxruzHwQ4k9pB2pYKt884eaNu4fC3eF9IjLB7
	 JPF/Qh+jdUgcQlfGqyMBgx15OOiqrjVEeXjY8EtqwhVSnCsWWKoZ497yL644nPPvBnCfq
	 3RXQMbJ6zqR204whvRgX7sGiT4Q1yqwyCABZqxedApSANlZbLOwpwdAYFK3vPiHFBtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=FWeDOLMX;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E399960A2619
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 09:51:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E399960A2619
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=FWeDOLMX
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c505186727fso308041066b.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 01:51:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1795081886; x=1795686686; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aoPl+pQm9ZHcIGL4Om5Oc2NfD/t8KVMY3eNtZkgFANg=;
        b=FWeDOLMX7eEjKZwV4FINw51BroOkvQE1Ee9sZMTI7oinGpI5vzMgLfaFEliLunRZ+c
         2abObKZcLrZs1rxgD6kcSoL9855bUYx56B+1LZTacZFu7FtJwPYl/HUTMVqtLE27OWll
         Xx90WS26Pw5KnX88ygisBJfnAWsBm8iXpSPPRQfOymrbM3MpoJvIGpuLSjo2LhTGxoXQ
         cz7gzYjpu0HH7cP3ppKGKb7iu25zHGXZm5UcBFhQLt7VqBgAFN+Rg8Sa7xjSZCqm7UQo
         t59bB+tXUhLXJgF3N/RmBLs6Y1Lm/RzP9dHvJBkZpUi6PXF/RgdF+Qf8SRcixWpgNXxo
         ptiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795081886; x=1795686686;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aoPl+pQm9ZHcIGL4Om5Oc2NfD/t8KVMY3eNtZkgFANg=;
        b=N5oW7/zBqwDft/TQzJDnrXQBbavGc7YrPPvy8eroq+nw38KYTRfI5qRQ+EA42KKacE
         /A9bsbUvI+6wo8hg5ffs1FjviV8ScwYtSBHHXDRr5ATDzAPB/azGMRhdvRq3nedtYOlY
         oecUPhyN72ZB57mket7utQ4ietEAggnvR6BoSi01UWBT1utYGWEj0J69w1IokMD2XDiD
         yplWrtAoABk2cxkhBtfUMUHRtvC8dI2zjSYhN5C3LrIU7J+oI3+UThAAK92/voHVOErQ
         bK4LODZNi4LGT3j0PHDLIUTXehM998jZW0wdT8o2SGRk/T0xl390WyLqR5Xvkx1GtU37
         5q/A==
X-Forwarded-Encrypted: i=1; AL+hErF6YNA2Zb+/jszwCcwNJ28yF5Cfv9+ZqL90FrZJLlDrV3Z5xCvcuLzLzOIpEvZE25e2Ed3CD6/+p+U3lEi1@vger.kernel.org
X-Gm-Message-State: APuU4Z+rPm3h6HgAl6P64gDAoJkcL18vC2C76y7EK3Xr05YNNQNHiZ6Z
	2AB/phBwys8tbwWbbsZRotRErhnLStbqiwYwPA/Ttns/rAcsa7unKfSNVAxlxe+exe0OeBt5IGI
	6FgEfHPc=
X-Gm-Gg: AYBFou2FDuU2KX+2A18kM9UwDa7MGteP4DRPkm2+qfjA3IFZeI1d9Y0+JUV3gFTh5tp
	H0842yjTeBP65wC8emIDBMfT5HsefjEjvDm42WX05E3HVkNrpvP+SBp2+M1fyRDflnZSRe8pIPZ
	u2tF7cGUqMKg9L9iQjp+j9zryxRrVS1HBDeUIs/R/tzn9FohgvbloY7rPNDaSCjmfc8HqxOBWqo
	xy0JDMpVYTJZZuo4IwU8TM5kpRSYqtAcph4zE88HsQHG6BJb97agyaZJ67y/pL5mF71mUrypQkR
	iecdQogwEd8sXKwv1Ft1VEoM2r52K4YdOD7kMJoUk/yEYH3LZpuozg65emuSZ8KtcXuupoTQQ1L
	KRxebjziQ+7fDOC7GVcq0mVW9sMN5aShvNNJak97E4dvyYYWzRb5easXyrgzVBt6BdEDV5flpJd
	CJ804ER8cyvezAvHfjBsNmtTsuqQetBOenhHEuOv3Jbjh2jT/uyRbP2QB+BVkhy3kY1frF+K9Fj
	9tN9ulxEc509vmE4j7PbJcZvdDt+ZOuh6C0PYZXm7FlSvap5sB9IREQioXdGFnVQCDJdM/kafcT
	miWScWLqV1OgV6isv3Seq9qcohRZLq2Etbm+Tb/RBki0IEH+k9MYj2TRic5AfyY8V8kKXuECo4m
	9NtAkAdAYd/Y=
X-Received: by 2002:a17:906:8f8a:b0:c50:5996:5b89 with SMTP id a640c23a62f3a-c510e219138mr480420266b.23.1795081886208;
        Thu, 19 Nov 2026 01:51:26 -0800 (PST)
Received: from [172.16.220.224] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c51231bc213sm95057166b.12.2026.11.19.01.51.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 01:51:25 -0800 (PST)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Date: Thu, 19 Nov 2026 10:51:24 +0100
Subject: [PATCH v4 2/3] media: i2c: dw9719: Update DW9800K driver
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
Message-Id: <20261119-b4-dw9800k_cleanup-v4-2-df26c431595e@fairphone.com>
References: <20261119-b4-dw9800k_cleanup-v4-0-df26c431595e@fairphone.com>
In-Reply-To: <20261119-b4-dw9800k_cleanup-v4-0-df26c431595e@fairphone.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795081884; l=4881;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=rR/uSR6FC+oVbJMW9ps010sQx6WkZ4oy9AD9qxw5jIE=;
 b=DpULb/h5PTjtt0PSNy9pvRAVvuv7bvSa72vNW3KbU0KgiLkAHuEv4Rb0KyCk+pu/EvcwbJdA3
 O/gw60nW0FnAalBove+6U/7ZUom1QfXUT9S/FbndkUbJ1m9rJ0XfkoY
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
 drivers/media/i2c/dw9719.c | 68 +++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 58 insertions(+), 10 deletions(-)

diff --git a/drivers/media/i2c/dw9719.c b/drivers/media/i2c/dw9719.c
index 3b7ba88fd67c044ef9005a0aac6a5d26ab939a90..2879dc99088005cba2567b2a73627c91c270906b 100644
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
@@ -185,15 +196,52 @@ static int dw9719_power_up(struct dw9719_device *dw9719, bool detect)
 		/* Optional indication of VCM prescale */
 		device_property_read_u32(dw9719->dev, "dongwoon,vcm-prescale",
 					 &dw9719->vcm_freq);
+
+		/* Optional indication of SAC timing */
+		device_property_read_u32(dw9719->dev, "dongwoon,timing-control",
+					 &dw9719->sac_time);
 	}
 
 	switch (dw9719->model) {
-	case DW9800K:
-		cci_write(dw9719->regmap, DW9719_CONTROL, DW9719_ENABLE_RINGING, &ret);
+	case DW9800K: {
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
+	}
 	case DW9718S:
 		/* Datasheet says [OCP/UVLO] should be disabled below 2.5V */
 		dw9719->sac_mode &= DW9718S_CONTROL_SAC_MASK;

-- 
2.43.0

