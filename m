Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792955028;
	b=QqAMtqCQAxyeO9b8/WHgN+UImN6Yd33gTshvQuZj5oHu/fAKGhgeeWyECU9u7IW+qg4E
	 c627b7HpbKucyTuK5c44vIG2I8zQQnu/o/jo9ExBs2UsJI2Y8Uf9LF4XO73VlNzLEL+Ta
	 DBrjVjeZ9cPCNe0GEVVLHTBmD8qOu+vAbKsE1t38Wo5njFZ0tCpD0v7udB5hRdS05ai3z
	 kla+ptlAYBFD8kHaJYDrlSPDGorwgLYxqV6UW3ycsyJkHASYOSzi+Bl9r/ReMvd4veI4v
	 gfPfjvk3vXLuNHixUgDfMWG6vot2DLdhNCMmq8YON2AaLHQ1xwI7xQ7d24nShTwcoQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792955028;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=R9qaCbPxl/UFmTQFVY4bs9QcJuc49zcAUsVA+5r/co0=;
	b=Vejzfczuwzu0sK6YKzovgv0aFPic3bR60jNV2hXwFkeQVsIrlanFXOeOXqKgtUtOMraD
	 kXUdNSXjSFHZteCkOwTABKKfFom+WF+pIx4GmQXXOe6Gynemw95thIIlQuVPpIV0b+ZEj
	 38r5KU5Lty/MQMO1l+3fFvFs1p7fhMlIc+va46VCICxh0NQnzg5q1D7v1Z/cxw2GWvLj1
	 dV3X2w51fS5+CJFtXsGzu89E1bW2F0aIUV19O6H3iYd27zbd/dAFsxRMvH4wSeI7ihr6o
	 Qqu3ZM2PKVPlD/WiyE7QQyYvfqLNHPYKIfcsoLqK+WmBbaSzGAGR5CTQSvl3qruJTwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WJgPkCja;
	arc=none smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE7A606A31B
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Oct 2026 19:03:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DE7A606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WJgPkCja
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b167ffd132so3548444a12.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Oct 2026 12:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792955026; x=1793559826; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=R9qaCbPxl/UFmTQFVY4bs9QcJuc49zcAUsVA+5r/co0=;
        b=WJgPkCjaveAzr0VVPWHkhIvN7ysCwpJVuRE6e0O1PUkWj2RZQRy9RbHz4DSd6ofLfd
         dR8XaKKd04Z7EwzgWXEboXeb3KWNIT9nu70gwD/k5OOqHIrSPbjeu3IxtvTlNakw9P1a
         gaXTmTn9osslPJ5wEp8/b152E8Efd+zeKEquTmYS9Bt//LOcxMK/AJm1VPg6jzET4TiM
         4baEZ2MW2hoTTtl5wNf5BDFNzhGLKKr0MegT8bUPLuD1BxouI8nSA8k1fThqSb5txHbZ
         LrGoHKKhrgcABWd3tNgE2I/hyTcOGHBynq+9Q7QQnKK3LKjaZHI9CLITI3rxzLCBmDRR
         slLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792955026; x=1793559826;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R9qaCbPxl/UFmTQFVY4bs9QcJuc49zcAUsVA+5r/co0=;
        b=yePJ4q80I6saDXuGjQXyJ9JhMsItiTbvt+GEus//D1600efuZAIYsTw56KxWLiNjtT
         NOP9h4H5kvVgEFBACP6uX31Oqe41GTGObBsQqSzaA5CalhERpiWv+JDjVhMdtZTtbEte
         9IPrCiNY6MUtrN/sBKhwSeyZYs8srPFKEGm5GGseLcdOnesgaUrgS/6UY76Kz7RlO71g
         WeKIQZrBQ6x4uegLoHAYbs6HtEBRVk2MGkn9SqmLu8GjX95ejPJ/PZmQbFKKiJ6HZgb1
         H/628OzM0nKYl/gLB9s9aZWAYCn7k8K3TxmgdVkyEDj6tNpvfleYAG7tMjZA2cvnvQKa
         Yr1A==
X-Forwarded-Encrypted: i=1; AKwUvBwF1BVP+tSbIi0V3xnPENG6mmLM8Uhh3FenN0y4S/UcSnYINxqo1vaXLKqvn3TSjvxi8kvLCV/zBjM42oVy@vger.kernel.org
X-Gm-Message-State: AFq9FYJFWf0BYhaYJmSGGY7peVS6yTucuIBzyEngW4eG0aMRbvf2D9dT
	VCVcNvEgyR8xeRdPaerbFr3tIOuuVfT8hF6l1g2SXuFmtk5vxQuq5gsz
X-Gm-Gg: AYBFou1Hxchg+jceTc/WXGQCfbuiAE1uU7SU8vFhVjSfpyW1/Q12KKMEf4knEhVAjvu
	EXS+TQhLDSbC0/56KIIyV92OTetjfDSbSQsqy1FWi8uOTO6e7MWl7qGarl3K7pw/OZ4MaqVwFt/
	7t8XPVJuVfIupXHnwTgWeuAdLnKolGE/aT1UFraT+ZC5NeRiuXz0S429C1rySQjr690gmJVwtmk
	5WQNaN94HIDqZUXsM2VTIwwL/hyX+VBhcgUicNOIlyU+GLG5sW5MX8qVzwzNV1aXHQCvSEfRqHf
	tbdLuIX9qXC6eiLpyiy4SSIGlDxhnznrAO8UKpXEo3t4R4uYmyILkB9jMSa9sQKeJsdVPBQ7lzA
	vJPYCnz3le5SuOHk64RpKdZqvYo5EqVeW2MneuckJVGQwJl4vney9NqtfwlOyvVBPv+iidVHLIs
	admwI0X2Ae7cgdqYH984A9dH4PtasFJcfjtACvU6UsfgsdmBGoeaYrNOPHOuWpo6J7J6vtFZeJE
	qS4ejcvwwWw7iBzsYKUMP3f5lCojjrV66pID+gSy7QJeiKe/kyejYDsSwtLGtT7Vw7wmalyGflQ
	HNZNDrGg1JBd6AEqsC5+My3w7O77w2z1Iw4qpuTlDc9XjXPRc4TFpvL4J20Uix5KuWSJua+2/Ax
	GfO8iBu5+0p263O51GftUpY0Qnn8ntRK+cfnyyKWDbh+G
X-Received: by 2002:a05:6402:5024:b0:6b3:e575:f4da with SMTP id 4fb4d7f45d1cf-6b442a81523mr6769954a12.4.1792955025764;
        Sun, 25 Oct 2026 12:03:45 -0700 (PDT)
Received: from localhost ([2605:59c1:3500:c210:a19e:c679:44e8:e9a])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b45e167f4esm1231230a12.2.2026.10.25.12.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 12:03:45 -0700 (PDT)
From: Selby Mashiki <mashikiselby@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Selby Mashiki <mashikiselby@gmail.com>
Subject: [PATCH] ASoC: qcom: qdsp6: fix device_node leak when parsing "iommus" phandle
Date: Sun, 25 Oct 2026 21:03:40 +0200
Message-ID: <20261025190340.449613-1-mashikiselby@gmail.com>
X-Mailer: git-send-email 2.56.0
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

q6asm_dai_probe(), q6apm_dai_probe(), and q6usb_component_probe() call
of_parse_phandle_with_fixed_args() to parse the "iommus" property and
extract the stream ID from args.args[0], but never release the reference
acquired on args.np.

Call of_node_put(args.np) after reading args.args[0] in all three probe
functions.

Fixes: 2a9e92d371db ("ASoC: qdsp6: q6asm: Add q6asm dai driver")
Fixes: 9b4fe0f1cd79 ("ASoC: qdsp6: audioreach: add q6apm-dai support")
Fixes: 72b0b8b29980 ("ASoC: qcom: qdsp6: Add USB backend ASoC driver for Q6")
Signed-off-by: Selby Mashiki <mashikiselby@gmail.com>
---
 sound/soc/qcom/qdsp6/q6apm-dai.c | 6 ++++--
 sound/soc/qcom/qdsp6/q6asm-dai.c | 6 ++++--
 sound/soc/qcom/qdsp6/q6usb.c     | 4 +++-
 3 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index bf1f872a0..49bd0582d 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -1030,10 +1030,12 @@ static int q6apm_dai_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	rc = of_parse_phandle_with_fixed_args(node, "iommus", 1, 0, &args);
-	if (rc < 0)
+	if (rc < 0) {
 		pdata->sid = -1;
-	else
+	} else {
 		pdata->sid = args.args[0] & SID_MASK_DEFAULT;
+		of_node_put(args.np);
+	}
 
 	dev_set_drvdata(dev, pdata);
 
diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
index 4f09fdd40..f09856ee4 100644
--- a/sound/soc/qcom/qdsp6/q6asm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
@@ -1309,10 +1309,12 @@ static int q6asm_dai_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	rc = of_parse_phandle_with_fixed_args(node, "iommus", 1, 0, &args);
-	if (rc < 0)
+	if (rc < 0) {
 		pdata->sid = -1;
-	else
+	} else {
 		pdata->sid = args.args[0] & SID_MASK_DEFAULT;
+		of_node_put(args.np);
+	}
 
 	dev_set_drvdata(dev, pdata);
 
diff --git a/sound/soc/qcom/qdsp6/q6usb.c b/sound/soc/qcom/qdsp6/q6usb.c
index 6381b289c..5888bc41a 100644
--- a/sound/soc/qcom/qdsp6/q6usb.c
+++ b/sound/soc/qcom/qdsp6/q6usb.c
@@ -382,8 +382,10 @@ static int q6usb_dai_dev_probe(struct platform_device *pdev)
 	}
 
 	ret = of_parse_phandle_with_fixed_args(node, "iommus", 1, 0, &args);
-	if (!ret)
+	if (!ret) {
 		data->priv.sid = args.args[0] & Q6_USB_SID_MASK;
+		of_node_put(args.np);
+	}
 
 	ret = devm_mutex_init(dev, &data->mutex);
 	if (ret < 0)
-- 
2.56.0

