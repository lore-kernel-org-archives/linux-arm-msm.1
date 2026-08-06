Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1483442FAE
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Aug 2026 10:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786011254; cv=none; b=oymVcXSP4pfjqhf5IGOjjWN3nPWaS0CLa25tRuD+ZuBSeYcgr/vtxowPzKWTh65mcS3alBiNOO+sWhn94pCGIFWjG1WbXkfMB5Y4LeHC7zs3TevEXzYlIF8TB8YK+Cdrv3xIWF9Bx5FMljwFvP4yJ8eIAir6Xkafmfz+NeR7GqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786011254; c=relaxed/simple;
	bh=V5V5s6ABXoH6ecteKraTt569MwVJ9lwyTYOAYyLIlWA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XLJtZRQqqIBPlVtvm+5xpL0oINmz++8dG+/K3phE/vlQu4TJFU0vinWQ3z9N24RvoqjGuOPu6x9jOBP5eneDik1AQvSl82Z6DjFtRCmAghPQiN3d4OuKJgiUutDFA2y6wglgarPEu8k87MRCnAFkkLvwmP3Ko3d20XWhCtascac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m+xCT3Cz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YE1LoVST; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m+xCT3Cz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YE1LoVST"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769ntqF1579452
	for <linux-arm-msm@vger.kernel.org>; Thu, 6 Aug 2026 10:14:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	416ezvAa7vht3zxlOak+Weqz9U31JUNYz4MnW33AYGc=; b=m+xCT3CzsTA6brgR
	f68XPWovoeySZ9NDumAJ50iZorjaymkHUuFVL2u6/pVcqdpifEcXmKjyO7DZISwJ
	pprDhMFVgoTt3lB8q2wA69T4EOpspzkZLun9wwS+5r0T9rrgj6O3uLhxdXUgh+p8
	sIvbK8aLSO/07hxaIhCzI2J5aJLlpRxOF2R6psnHceX8/fmcyojA33kSgiDXufor
	jBfBIxzdtlcl+wm6TfBGaKSImmWFc8TocJP9reVflUrR2ggcVzr++eE5BU1+Y7AT
	5MjAhgsg5j9ZOV0EhilxU1bnd6BDgBpS17DTznZkKvm8UWN9F7qKu3xnIBxxq2gK
	HWof4Q==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvju8hgfp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 10:14:10 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb6cf425e86so2279495a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 03:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786011249; x=1786616049; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=416ezvAa7vht3zxlOak+Weqz9U31JUNYz4MnW33AYGc=;
        b=YE1LoVSTVq5vVMnM5SLSTvSTaWNViXltihBiIdbKzbuWi+bFVqAwOCYqZ/BF7CXVZR
         C6kY1Lmc7hF1xyb7XYVMUGaRDx+Lm6ets5q/OVQlFktQTaluQ5aqRaxHMJSeJcYMVP9S
         excs+JoZQXpuwG4o1g4uMt+sPvlfwmyhkqcH1ahTPdTH0QmBlOJ7QxKkD9+xT7WX3BFk
         4IkPV+HUorvVaDPEjVVEZXZ4QP1VXFOWnIV5KJgTjFjUKYvbCzEYOHLv8g158ncvDoRN
         itxzhLQ/OEjzsJh31WKRH5QTMXwcDtTbNN7dgv8cYkx4gGBJPsM7RgilAhpWrlTsxOt5
         Ej/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786011249; x=1786616049;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=416ezvAa7vht3zxlOak+Weqz9U31JUNYz4MnW33AYGc=;
        b=dRUjf1VIQPKWH6sFqZXb3GG4mM6QIpyB98EDZRhfrzVpPKFkaO634wkR4eOoLzxlap
         /ZLwjqxJfbR8dxS/GXv9CB272PobE7ISb2oT0XwjOV7RXqK3JSLdV2JD8Ut0ab3f8lrr
         SU2t0SyceIAxoE0dfXfAKEZBmwUvKTS8dge9/2Ud/kVMPScDy9iJG6yQHxhEK+oRuK0Q
         VQw/RCn7BqJEMHe+CXjnA2UUNZrQtHPYwaDVrXn6SltEdepPv4BeUTE+VT0qjR1hpYRt
         cdDlkm4NADmGPJua8vrxFDWkA5P+APTAT3oWfXTxZ3sQ9hgLBxEncdp29bbTTec305c4
         Hobg==
X-Forwarded-Encrypted: i=1; AHgh+Rr5pmgK8kcnFGCxXChlqxJsN2W1MlEXrVpUzp4kcg429Qy+70M5ZLUQeqKSnGChH8tybOlFsgaXW6QcBUAW@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0VY+nILGoMbpR9rLKHUNlLvWNHWPF4uJQ+YBnEV9NQCyJeUwo
	Yp84oVyeHFn5PKHXsK4nPtnmuQ7SVJMx0QGPVmfKuAQsxd4ctr6ipI0ArsDEcfOP4tDQ21xZrlL
	XS5nCR69fhkQXSUHZzVpL93pquMwbDY5JdGMgdqNb+sV1XdYIf1YP6F7cxEe3dZfbrFwn
X-Gm-Gg: AR+sD10wSlSydZGalorN3oEoxJT4r0hkHyhHs6EinVNzERyP9Kp1W8n/5r5Vzw583mt
	A8oa+C35P0pMiXKuZ5j4eyD5iNjeqdar31XoIKwuxG2ufm3qCLO2jNPy/KGyqINMBQDJmrBGojR
	q6JQByc5Et3fQ+SnrEEXsssuywinPXQ64NroTNAcQx+X+TM+PUI6zWMKPG3PC7RA0ob+2fZrj59
	5ZXkAqhlgrnX6Ze4449gLZwd0Ktfc/03iyPHk+uFG7fBWAvXs2hFGX2RTo5I2uQ588aZVklSc7B
	FkPvO7Mz3B5cMWAnl3gXAAeaGSZb47fj9yy+aK/yc17aVmYIiOChaWjzyE58+X08gvl4ps7gQPV
	OQxrVa8tZsY5aKAOkYqkFoyuasV2oNi8h/g==
X-Received: by 2002:a05:6a20:728f:b0:3a2:d316:de53 with SMTP id adf61e73a8af0-3cb85c0732fmr15100510637.0.1786011249080;
        Thu, 06 Aug 2026 03:14:09 -0700 (PDT)
X-Received: by 2002:a05:6a20:728f:b0:3a2:d316:de53 with SMTP id adf61e73a8af0-3cb85c0732fmr15100334637.0.1786011247257;
        Thu, 06 Aug 2026 03:14:07 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe707c9970sm2668814a12.6.2026.08.06.03.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 03:14:06 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Thu, 06 Aug 2026 15:43:45 +0530
Subject: [PATCH 2/2] spi: qcom-geni: Use GPIO to notify master of SPI
 target activity
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-use_gpio_to_notify_master_of_spi_target_activity-v1-2-c363a9b5df69@oss.qualcomm.com>
References: <20260806-use_gpio_to_notify_master_of_spi_target_activity-v1-0-c363a9b5df69@oss.qualcomm.com>
In-Reply-To: <20260806-use_gpio_to_notify_master_of_spi_target_activity-v1-0-c363a9b5df69@oss.qualcomm.com>
To: konrad.dybcio@oss.qualcomm.com, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: chandana.chiluveru@oss.qualcomm.com, Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786011233; l=3714;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=V5V5s6ABXoH6ecteKraTt569MwVJ9lwyTYOAYyLIlWA=;
 b=FMqYfS8Uf9RpOP4VVG+4mnDIrNxYrkCSfp21CcgNIAgopjBtrmSVUEWIIxyI8VxaRQhKGu2Z8
 CrCK3k22DeNDAem4S+X2BvPPJb+XzbcxiXm2FPJSDezOG/I2boLUKgm
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-GUID: 1DOIXPdur7GjIQdFJvIrM9NMLO0iNMVV
X-Proofpoint-ORIG-GUID: 1DOIXPdur7GjIQdFJvIrM9NMLO0iNMVV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA4MCBTYWx0ZWRfX6e7shV3eYmsf
 SxreqZJABcoMk+Tjr8LNLWx+Z3IfeCTXMCej9aKg+kyG2kIkE66fQz5kg5vhsDFASbE1RYLP+4v
 /SxqbxeofAzZKhwmhrywHAllX5dVfkSnR7O6N3nA5tdJUcxyveyPLAidbDIFzw2welGalX/+nzn
 PP9tQQLBUFmV3sU5cHD8DQ7htOPl+gw7fgkF+16RkxgV8uKLBFpqP6cm9sakKaA4QzqvIYVyfh7
 gWYjK5Eydh/b1J+LHebUzBdI5VbJESGnTpILrwv37iemjphlPX2Y8H9gIYnEy4t7gCQUfS/5wjS
 xVrXPSHB7HUOZPyhoiXZFB8hqGbhut9BWCKx7hGYpiP6WmPSldYIcpub+dl6zNpbpgcjVJkQa86
 lRZAsABzFKkgL3qYDxxjYIoLVEvFxOO2QZyNBcSwve5re9+h4UAn9Coity9wff5CRjbY9qQfYQn
 J5QrsT4B3oRXnVuv7Xg==
X-Authority-Analysis: v=2.4 cv=K5cS2SWI c=1 sm=1 tr=0 ts=6a745e72 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Fo9EMwYq_bmgDG0ZVhAA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA4MCBTYWx0ZWRfX64hqhHe5jd/0
 lpuG1jV/QWOInDsxQX5Dpy8Q7kuSMkidI8R4VzM4WoeCOxHn4+w+tGAegj75C+o3MT+JPQj6VgQ
 56MpyKlEAEf+lhfBa/OpO2U2HHYldEo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060080

When operating in SPI target mode, the GENI controller relies on an
external GPIO to notify the SPI master about the target's active state.

Add support for an optional device GPIO that is asserted when a target
transfer begins and deasserted when the transfer completes, is aborted,
or hits a timeout. This allows the target to explicitly signal its
availability to the master and ensures the GPIO is released in all error
and completion paths, preventing the master from observing a stale or
incorrect target-ready indication.

The GPIO is optional and requested only when target mode is enabled,
using devm_gpiod_get_index_optional() so targets without this signal
continue to work unchanged.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/spi/spi-geni-qcom.c | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
index d262206ed663..ffb8871a55d8 100644
--- a/drivers/spi/spi-geni-qcom.c
+++ b/drivers/spi/spi-geni-qcom.c
@@ -8,6 +8,7 @@
 #include <linux/dmaengine.h>
 #include <linux/dma-mapping.h>
 #include <linux/dma/qcom-gpi-dma.h>
+#include <linux/gpio/consumer.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/log2.h>
@@ -113,6 +114,7 @@ struct spi_geni_master {
 	struct dma_chan *rx;
 	int cur_xfer_mode;
 	const struct geni_spi_desc *dev_data;
+	struct gpio_desc *target_gpio;
 };
 
 static void spi_slv_setup(struct spi_geni_master *mas)
@@ -171,6 +173,9 @@ static void handle_se_timeout(struct spi_controller *spi)
 	xfer = mas->cur_xfer;
 	mas->cur_xfer = NULL;
 
+	if (spi->target && mas->target_gpio)
+		gpiod_set_value(mas->target_gpio, 0);
+
 	/* The controller doesn't support the Cancel commnand in target mode */
 	if (!spi->target) {
 		reinit_completion(&mas->cancel_done);
@@ -928,8 +933,12 @@ static int spi_geni_transfer_one(struct spi_controller *spi,
 	if (mas->cur_xfer_mode == GENI_SE_FIFO || mas->cur_xfer_mode == GENI_SE_DMA) {
 		ret = setup_se_xfer(xfer, mas, slv->mode, spi);
 		/* SPI framework expects +ve ret code to wait for transfer complete */
-		if (!ret)
+		if (!ret) {
+			if (spi->target && mas->target_gpio)
+				gpiod_set_value(mas->target_gpio, 1);
 			ret = 1;
+		}
+
 		return ret;
 	}
 	return setup_gsi_xfer(xfer, mas, slv, spi);
@@ -969,6 +978,8 @@ static irqreturn_t geni_spi_isr(int irq, void *data)
 			if (mas->cur_xfer) {
 				spi_finalize_current_transfer(spi);
 				mas->cur_xfer = NULL;
+				if (spi->target && mas->target_gpio)
+					gpiod_set_value(mas->target_gpio, 0);
 				/*
 				 * If this happens, then a CMD_DONE came before all the
 				 * Tx buffer bytes were sent out. This is unusual, log
@@ -1012,6 +1023,8 @@ static irqreturn_t geni_spi_isr(int irq, void *data)
 		if (!mas->tx_rem_bytes && !mas->rx_rem_bytes && xfer) {
 			spi_finalize_current_transfer(spi);
 			mas->cur_xfer = NULL;
+			if (spi->target && mas->target_gpio)
+				gpiod_set_value(mas->target_gpio, 0);
 		}
 	}
 
@@ -1116,8 +1129,16 @@ static int spi_geni_probe(struct platform_device *pdev)
 	init_completion(&mas->rx_reset_done);
 	spin_lock_init(&mas->lock);
 
-	if (spi->target)
+	if (spi->target) {
 		spi->target_abort = spi_geni_target_abort;
+		mas->target_gpio = devm_gpiod_get_index_optional(dev, "device", 0,
+								 GPIOD_OUT_LOW);
+		if (IS_ERR(mas->target_gpio)) {
+			dev_err(dev, "Failed to request GPIO: %ld\n",
+				PTR_ERR(mas->target_gpio));
+			mas->target_gpio = NULL;
+		}
+	}
 
 	pm_runtime_use_autosuspend(&pdev->dev);
 	pm_runtime_set_autosuspend_delay(&pdev->dev, 250);

-- 
2.34.1

