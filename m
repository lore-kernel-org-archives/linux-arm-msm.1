Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5A8396D1C
	for <linux-arm-msm@vger.kernel.org>; Sun,  2 Aug 2026 14:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785679563; cv=none; b=BPWYo0VLlGB3vANdeB+l2dSAYouxbgjTowH2GIPJ3gFLPTZFLJnKfZfgiBphcHQhJ6Iycyg0Es3Ib0Zqn517Rgj3C1VRxV2V6ipqkMvNqotq0zJzYIwQOLA/kFIxpNGgnfvFq+dKebIiiTmKmJzGXJL+koM0Ft8Fpb06JNiALfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785679563; c=relaxed/simple;
	bh=NBDioksG5pOpKo0k7xIWjDfLaLsiWZzCb//BdAiMZP4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=o4aiYJrOjFxKGHQSqeYzykc2m+ncX7avpNkhEfMTpqA8EwaChkPNnP+3JgLUWtC3eOn2WmMQvbAVskxflxzLBX6Zo4CoNIa8KDfWYeDjPpjyxoONjAYIWMQr8ButmpZZhcJV4MUHHrR6xUu9Wh04zH1ykQaOK6W/kQWpLIgzUgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YKVtLapQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kGtl0acz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YKVtLapQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kGtl0acz"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 672B6oFJ936814
	for <linux-arm-msm@vger.kernel.org>; Sun, 2 Aug 2026 14:06:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=IUBrw7txsJyrtbO2uks4gb
	XgkSo0IF8NQtTXkzJyWQc=; b=YKVtLapQxcdEBSB6WppKRo5LugMC7Yg56KlN0m
	et8x9EJVV63bsrTS6MhujKgjwtbj40Uc+p9c7V9R4yPxaVgIGS3fDghv5xtBsU9P
	xNUY58kIJwahtmetyXBo5M8u+NJn1kTyMr5/M/z6I4xRMfYQuyY8uyX/NAuz5C1U
	en2w5P3lDYbIBbOPh7i2wpmz7s6lD+xNMWW2eKFGFiZ3/jwgDRgxQ9sHKGCZL1dS
	Hzrs/fm22rhDw+E/Ha2WzICFPko5IJYvQ7mbyYFDrdPQpbMEopoLRW0tG+wMNWCN
	bqRrw9t78SEajFGLVe+ZOw2cf1GI+U04UqylDaiO//v0o8sA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs9ygjrpm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 02 Aug 2026 14:06:01 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38dbe39ce62so2332132a91.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Aug 2026 07:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785679561; x=1786284361; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IUBrw7txsJyrtbO2uks4gbXgkSo0IF8NQtTXkzJyWQc=;
        b=kGtl0aczCQpTPSuJ13nIiQvBuhF3kZxQgqyAl3IoTSACVMwkjCKBYyNTFV/wXFkyVt
         u2I8y9Qhe9JOko/PYOpbbk6ZSFEd0yt1hbn8J4QCwnbXzyCPslPeSp3GwWSfGPC+Dn/K
         HLrgguwfHkWCnzQRrqTOKH85gg+6T2sHDEkof4VaxU3o1rPi2Ir3Tr/A+RLwCNXQ0iY7
         qYpNDPjHjUeLW+ujEGNyecOVAE+2+AV8EWnLwQiHMRSgZOgNErtYv3JTG0F9eprD6hPy
         axKGEr+ngGOLgsfnLawNG7/NfRDXqeYIuzsJpvMUPz6BL0GvNCDrxiZ8r1w00EGboyjm
         jPhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785679561; x=1786284361;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=IUBrw7txsJyrtbO2uks4gbXgkSo0IF8NQtTXkzJyWQc=;
        b=K/DTVvMbJ2vpppEGG/qQJPKHNgrp84SUHKh88rv9Fl8w+Wkv6z9b/poziQA3ndym5I
         3JIFk3Vbq7HSW5zG7SylLTrAqgZi3R+cjHpja7IYQrAIiO2dPRK7Xq3mFK5K0nFPSEtA
         HvkHPEsKugQgKyzGNA+Mo+fbXjBXrgFRPd7fijc1NEqDtoIeK8nq9XKrfNHQ2tIvIkPg
         s8JttuKu/w2AzwCKXSJCwabzSHFuBSo5aZYzgb4qrW4wt20+ZLNk4mAYhXOtthnrIuVF
         dxpa2eLARyXvIe07NDjJSfs4cHeF4V0Oyywiti3XgcVkzBOf57Tic85XYoV2jwHPE68b
         KdxQ==
X-Forwarded-Encrypted: i=1; AHgh+RqO3FGLbcr3dL0f44eQzBimvd6rFprmpfCVvh0kQbAfdS78F8GMlRmOg8gqFJ3v5hcyavM7qJhw5RgYOVG4@vger.kernel.org
X-Gm-Message-State: AOJu0YwnjQ4iz19QdbOjetXCbP/EcJVe7PeL+ikVxXsBXRs+7Uoa0Ycr
	DfDyAK90egn6wNqYOs9SqEK0udCTFZ4aAfdQ9kZgXJ3hhU9y0Ionpqcka2ql4xMAdkgEu1SMl4d
	7kJ/dld+8pcGMuRIGQV+7M6pSE1TfWsRY90tNYRWc3kElasJMzJP5WE8Tl9JyE+HPILQ6
X-Gm-Gg: AR+sD10VlQcggZiiDMgTh1xNmrK3kzau0zoVnsC5HDgEc4fVRg1yI4yW3Mb+Vmp7chS
	FAnYcld9tVfIKl+AQMB4drVg7jE7V8L1K8tekLSgv2MUfd41CRNIjuEz3oDAnTswTMqxaZ2dE/e
	GVf44m1zzSPiJQDDptdGYlCE+qjzvalIMR3VMePoZNdvKSJzl9pxiAdpNTOATNlocZtp9R7hJAt
	135fZx94wthvxjWfIZXFIFkhbaJ3vYDNrj9VfB9OVqQBP+bIrYalnjyzFG+ruje+eesE7GFG3Et
	DI7jYgY6C9Tm8mZByahqaFCbX6bFCLTaoRvDtFhqUQdjLaITo3sgg4pcp1dQLaEbC9E+xRfVAO9
	8WrjaW6Ys/2z1F3ipBf5SHo9EdqI5
X-Received: by 2002:a17:90b:57ed:b0:385:3ab:fecb with SMTP id 98e67ed59e1d1-38fbc9f3ebemr4727137a91.4.1785679560490;
        Sun, 02 Aug 2026 07:06:00 -0700 (PDT)
X-Received: by 2002:a17:90b:57ed:b0:385:3ab:fecb with SMTP id 98e67ed59e1d1-38fbc9f3ebemr4727101a91.4.1785679559963;
        Sun, 02 Aug 2026 07:05:59 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab4cb51asm34484816c88.9.2026.08.02.07.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 07:05:59 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Sun, 02 Aug 2026 19:35:43 +0530
Subject: [PATCH] pinctrl: Use IRQ trigger mask helpers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260802-b4b4-irq-trigger-mask-pinctrl-v1-1-1c398ab53d28@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIALZOb2oC/yXMOw7CMAwA0KtUnrGUpgEVroIYamOC+YTWCQip6
 t0JML7lzZDFVDLsmhlMXpr1kSraVQN8HlIU1GM1eOc3rnceKVBAtQmLaYxieB/yFUdNXOyG3Xr
 LoWcKbUdQj9HkpO/fvz/8nZ90ES7fFJblAxVw+3aBAAAA
X-Change-ID: 20260802-b4b4-irq-trigger-mask-pinctrl-359c48cb413b
To: Linus Walleij <linusw@kernel.org>,
        =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Bianconi <lorenzo@kernel.org>, Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Sean Wang <sean.wang@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-actions@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, openbmc@lists.ozlabs.org,
        linux-arm-msm@vger.kernel.org, soc@lists.linux.dev,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785679551; l=6841;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=NBDioksG5pOpKo0k7xIWjDfLaLsiWZzCb//BdAiMZP4=;
 b=c21evJbK163GncmcfCcbMaR7yLK/XPxyAIAtf7iEWai9uXE/ByvKLgPIYH43r4tLlQgGRBNDB
 1flMBKgF77UCMyTh6ruqr+wSpTq0lACBWDakgwRVSnCqIKrHE0AmMJv
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAyMDEyNSBTYWx0ZWRfX01ErgynVtQNi
 BktswZU/AIxbenS60UkcI8OKFg+kfHPyp+72QhXrXE3EZvNVGmQscOgivj1b7kgorK8Alo8rxu+
 YfRT+MeWdH149L1wjHdVl+mqKGIXs9U=
X-Proofpoint-GUID: 55wJhetzdyrhiP5nbZHgd0NzwI6k_61H
X-Authority-Analysis: v=2.4 cv=Gu5yPE1C c=1 sm=1 tr=0 ts=6a6f4ec9 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=aROEccOD733urgNQ4cUA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: 55wJhetzdyrhiP5nbZHgd0NzwI6k_61H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAyMDEyNSBTYWx0ZWRfX1V4YElg1p2kH
 RzZRvp7Xvp7L1GWvqd0GH2MyJTCETEL3DObLLZ+OVOMkPgmCIBvjyCNdOYYfx79Y4hlTEv09hRc
 A+VZVAx9ZsX2FPIiCBG0sGN46arGn3QobZgEOqgTOR0XUvve6ZiSYd2lyRXMqgY92MccgKGuEfQ
 ro1iLj6W7rqXrlxl8NpIspoGWa92FpXN20+g1+1kp4bc6VIN4/Mr/ntAoLQf1Szwb5xTvxXcZNv
 Px1uLaHzcUYUFX6jrStt3NYjo1Y1cqui5/jX9Ib4kzgARup1EttZ9r+mA4P8J3usWcM6+wOtgQo
 CJRL/cgZeQQtNrm8YaGAdBC3eo7x69h3PxnWNtQAVozLfWEv8wMm7SdQfe1cAM1N4o7XeR6OR3C
 tRrh0z0w+a2Q1LemMhG6rHI/vwTH8mbU1MIo7Qa5+MhOggcpiFlbsrBXbeV/KX5miJgAASj42GD
 Tfd/RzF9j/Vpq7ltpcA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 malwarescore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608020125

Use IRQ_TYPE_LEVEL_MASK and IRQ_TYPE_EDGE_BOTH instead of open-coded
trigger type combinations in irqchip callbacks.

No functional change intended.

Assisted-by: Claude:claude-sonnet-5
Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 drivers/pinctrl/actions/pinctrl-owl.c     | 2 +-
 drivers/pinctrl/airoha/pinctrl-airoha.c   | 2 +-
 drivers/pinctrl/bcm/pinctrl-nsp-gpio.c    | 4 ++--
 drivers/pinctrl/mediatek/mtk-eint.c       | 2 +-
 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c | 5 ++---
 drivers/pinctrl/pinctrl-ocelot.c          | 2 +-
 drivers/pinctrl/pinctrl-sx150x.c          | 2 +-
 drivers/pinctrl/qcom/pinctrl-msm.c        | 4 ++--
 drivers/pinctrl/spear/pinctrl-plgpio.c    | 2 +-
 9 files changed, 12 insertions(+), 13 deletions(-)

diff --git a/drivers/pinctrl/actions/pinctrl-owl.c b/drivers/pinctrl/actions/pinctrl-owl.c
index 1f0ef4727ba7..9f5637756bd3 100644
--- a/drivers/pinctrl/actions/pinctrl-owl.c
+++ b/drivers/pinctrl/actions/pinctrl-owl.c
@@ -824,7 +824,7 @@ static int owl_gpio_irq_set_type(struct irq_data *data, unsigned int type)
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
 	struct owl_pinctrl *pctrl = gpiochip_get_data(gc);
 
-	if (type & (IRQ_TYPE_LEVEL_LOW | IRQ_TYPE_LEVEL_HIGH))
+	if (type & IRQ_TYPE_LEVEL_MASK)
 		irq_set_handler_locked(data, handle_level_irq);
 	else
 		irq_set_handler_locked(data, handle_edge_irq);
diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index abfb018f207e..90372827639d 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -2435,7 +2435,7 @@ static int airoha_irq_type(struct irq_data *data, unsigned int type)
 		if (gpiochip->irq_type[data->hwirq])
 			return 0;
 
-		type = IRQ_TYPE_EDGE_RISING | IRQ_TYPE_EDGE_FALLING;
+		type = IRQ_TYPE_EDGE_BOTH;
 	}
 	gpiochip->irq_type[data->hwirq] = type & IRQ_TYPE_SENSE_MASK;
 
diff --git a/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c b/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c
index 1fbb101386a3..83fcc80d5967 100644
--- a/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c
+++ b/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c
@@ -159,7 +159,7 @@ static void nsp_gpio_irq_ack(struct irq_data *d)
 	u32 trigger_type;
 
 	trigger_type = irq_get_trigger_type(d->irq);
-	if (trigger_type & (IRQ_TYPE_EDGE_FALLING | IRQ_TYPE_EDGE_RISING))
+	if (trigger_type & IRQ_TYPE_EDGE_BOTH)
 		writel(val, chip->base + NSP_GPIO_EVENT);
 }
 
@@ -177,7 +177,7 @@ static void nsp_gpio_irq_set_mask(struct irq_data *d, bool unmask)
 	u32 trigger_type;
 
 	trigger_type = irq_get_trigger_type(d->irq);
-	if (trigger_type & (IRQ_TYPE_EDGE_FALLING | IRQ_TYPE_EDGE_RISING))
+	if (trigger_type & IRQ_TYPE_EDGE_BOTH)
 		nsp_set_bit(chip, REG, NSP_GPIO_EVENT_INT_MASK, gpio, unmask);
 	else
 		nsp_set_bit(chip, REG, NSP_GPIO_INT_MASK, gpio, unmask);
diff --git a/drivers/pinctrl/mediatek/mtk-eint.c b/drivers/pinctrl/mediatek/mtk-eint.c
index 8b022545a3e9..827231dc0d24 100644
--- a/drivers/pinctrl/mediatek/mtk-eint.c
+++ b/drivers/pinctrl/mediatek/mtk-eint.c
@@ -216,7 +216,7 @@ static int mtk_eint_set_type(struct irq_data *d, unsigned int type)
 		writel(mask, reg);
 	}
 
-	if (type & (IRQ_TYPE_EDGE_RISING | IRQ_TYPE_EDGE_FALLING)) {
+	if (type & IRQ_TYPE_EDGE_BOTH) {
 		reg = mtk_eint_get_offset(eint, d->hwirq, eint->regs->sens_clr);
 		writel(mask, reg);
 	} else {
diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
index 0df749cbcba8..e051ff141d6c 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
@@ -259,11 +259,10 @@ static int npcmgpio_set_irq_type(struct irq_data *d, unsigned int type)
 		return -EINVAL;
 	}
 
-	if (type & (IRQ_TYPE_LEVEL_HIGH | IRQ_TYPE_LEVEL_LOW)) {
+	if (type & IRQ_TYPE_LEVEL_MASK) {
 		npcm_gpio_clr(&bank->chip, bank->base + NPCM7XX_GP_N_EVTYP, gpio);
 		irq_set_handler_locked(d, handle_level_irq);
-	} else if (type & (IRQ_TYPE_EDGE_BOTH | IRQ_TYPE_EDGE_RISING
-			   | IRQ_TYPE_EDGE_FALLING)) {
+	} else if (type & IRQ_TYPE_EDGE_BOTH) {
 		npcm_gpio_set(&bank->chip, bank->base + NPCM7XX_GP_N_EVTYP, gpio);
 		irq_set_handler_locked(d, handle_edge_irq);
 	}
diff --git a/drivers/pinctrl/pinctrl-ocelot.c b/drivers/pinctrl/pinctrl-ocelot.c
index 0fe0527863b8..58d3cde9f964 100644
--- a/drivers/pinctrl/pinctrl-ocelot.c
+++ b/drivers/pinctrl/pinctrl-ocelot.c
@@ -2317,7 +2317,7 @@ static const struct irq_chip ocelot_irqchip = {
 
 static int ocelot_irq_set_type(struct irq_data *data, unsigned int type)
 {
-	if (type & (IRQ_TYPE_LEVEL_HIGH | IRQ_TYPE_LEVEL_LOW))
+	if (type & IRQ_TYPE_LEVEL_MASK)
 		irq_set_chip_handler_name_locked(data, &ocelot_level_irqchip,
 						 handle_level_irq, NULL);
 	if (type & IRQ_TYPE_EDGE_BOTH)
diff --git a/drivers/pinctrl/pinctrl-sx150x.c b/drivers/pinctrl/pinctrl-sx150x.c
index 89fdfa96843f..2dd1f220bff1 100644
--- a/drivers/pinctrl/pinctrl-sx150x.c
+++ b/drivers/pinctrl/pinctrl-sx150x.c
@@ -525,7 +525,7 @@ static int sx150x_irq_set_type(struct irq_data *d, unsigned int flow_type)
 	struct sx150x_pinctrl *pctl = gpiochip_get_data(gc);
 	unsigned int n, val = 0;
 
-	if (flow_type & (IRQ_TYPE_LEVEL_HIGH | IRQ_TYPE_LEVEL_LOW))
+	if (flow_type & IRQ_TYPE_LEVEL_MASK)
 		return -EINVAL;
 
 	n = irqd_to_hwirq(d);
diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 641113831a7b..27f06bbc113c 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -1191,9 +1191,9 @@ static int msm_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 
 	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
 
-	if (type & (IRQ_TYPE_LEVEL_LOW | IRQ_TYPE_LEVEL_HIGH))
+	if (type & IRQ_TYPE_LEVEL_MASK)
 		irq_set_handler_locked(d, handle_level_irq);
-	else if (type & (IRQ_TYPE_EDGE_FALLING | IRQ_TYPE_EDGE_RISING))
+	else if (type & IRQ_TYPE_EDGE_BOTH)
 		irq_set_handler_locked(d, handle_edge_irq);
 
 	return 0;
diff --git a/drivers/pinctrl/spear/pinctrl-plgpio.c b/drivers/pinctrl/spear/pinctrl-plgpio.c
index 1ec22010a3f9..5fcbea32089d 100644
--- a/drivers/pinctrl/spear/pinctrl-plgpio.c
+++ b/drivers/pinctrl/spear/pinctrl-plgpio.c
@@ -339,7 +339,7 @@ static int plgpio_irq_set_type(struct irq_data *d, unsigned trigger)
 	if (plgpio->regs.eit == -1)
 		supported_type = IRQ_TYPE_LEVEL_HIGH;
 	else
-		supported_type = IRQ_TYPE_EDGE_RISING | IRQ_TYPE_EDGE_FALLING;
+		supported_type = IRQ_TYPE_EDGE_BOTH;
 
 	if (!(trigger & supported_type))
 		return -EINVAL;

---
base-commit: 415606a7be939835db9b0d6b711887586646346d
change-id: 20260802-b4b4-irq-trigger-mask-pinctrl-359c48cb413b

Best regards,
--  
Maulik Shah <maulik.shah@oss.qualcomm.com>

