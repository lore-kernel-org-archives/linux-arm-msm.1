Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3ADE43F084
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 14:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787581585; cv=none; b=HYaeq2pUfSd9lLV3SucQ/Qgjhe7vSXG7ZNoSUvyAXO7gwtW70TqfVjpVJxR1uHlrZci4274Q+JhfECmp1juthWcHwsjl7MUccPc+GUBQSQcPO2lFeyG23Hn3ojfqpYZe/2vLnu4kea5/3rpd922ELIjHTn4LjJ7tL6GZaryJvpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787581585; c=relaxed/simple;
	bh=UvVHpzmYAfm8x8s9r5dn96M9ZLyoJz4Am9wFhLKObB4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tE/9eySeRpOkYz9pBlo0sUonrpvNFtJ89g3ArtwkbYwHLh5CeyTpWj0tQkp9GUdhHrJ+aVgMDQ4TKS0U6LpRHjKug9U1rBEX0hOtOQ/gkFrfNWjkZEaOht2brq6H54Iuz/djENRXhBN0TWaqxfiR2p+40wGdEsnOC0SP+iDnWZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TZ5w8YL7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BFJp21TF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TZ5w8YL7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BFJp21TF"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OCvBc72584268
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 14:26:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3SReanLla1WlrfhYe7C5Vi18U84iOx3ldphBDpFUirk=; b=TZ5w8YL7tZ9D4XNX
	Z0avjLn3CoGWJCm9YJIX1Ud4RHpsOKrYTOxHpgq6uMR4tN/h3NhJeZI44iqD0Fhr
	KP9VGI1+gRlBoFtEOzVJAwjVuICUbiD/JODsHTOemIXREBeLhoe61Ny/phWGU574
	USrlXlTXl6CJCy756HBk1abakKjx7QUaybi2JAXUO/YT6VpBttUws6r3lHKsR9eA
	oMJQ9+LIJVwtVgaMenj2NgOW+zuKK2VPo93fPYm9yo2bMMjXy/1z3wjh08o/dvxL
	tRnBi8RXv6jOHnZsMzztUbfWBZ9ftWRUi7FUzOj+rDNw3IrZJJHiCoWVXu/RtCZG
	Lnwy/w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8hbthsvx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 14:26:22 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ce8a76df2dso65512155ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 07:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787581582; x=1788186382; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3SReanLla1WlrfhYe7C5Vi18U84iOx3ldphBDpFUirk=;
        b=BFJp21TFwoHhS23B+Xvpf3p5BSL74/eG8zBrmiR4VRsJs5yqqhBU1dxQnniQN6nTTb
         vcOd5PEnWLi3C/puuJMIFZEgQ45rAQ1pJ0rf5GMLYJGcMZ+TFLNc0TLn9k43H2vgg1pz
         PMnvBZP+PNx7IG9yqDnRglVSUiziFEC0mrmJcEg0AVoXWuCKdXWIA+BrDSqQhj6cHc4i
         RChlgQjQUou9ax4KXM8UYMpYXjFjw+wfiDoYngyXw6eWHulEl8uFYiyTY6GBPAjZM/TS
         JDoCteDiS5Op5F16EGauFIgpQtInLwAuf3jvQg3bb3JYxsxiilUpP0PZze2z6x968VZ3
         FJJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787581582; x=1788186382;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3SReanLla1WlrfhYe7C5Vi18U84iOx3ldphBDpFUirk=;
        b=UiH3Zd1JXjPHOdQv7/+HN/GpHagLjBhvCvfgx9DjxKWyPTHBefgbQG2ONuaEn/ngp5
         U4oLeqPdJ7ECwPbUgR7b1hdFsVnj9IUTwpBczM+M+3xn0/i5SvspUyZvTJwvkjalRK5t
         wOPWOFyek5v5gtCmWIzDkRGMdVBGvc4ZV4GByo7qVN++l4lrOZgXjU8eBcPIC/mq+WzE
         4qytYFvdo1f5b5/iSFCA++DBX6zH/Rc6MWMsu+UBnsnV32JLQ62UxcdsORcKvrfn6+E/
         L5XwVlX2dTIgWGemRJ6mvxl8HaW88m5g80aTEEYDTYKIeOODVp6wZv3Xqu+v8oe+H9yv
         DQwg==
X-Forwarded-Encrypted: i=1; AHgh+RofIYG8btuW1wS4TknwmpTbKkuGMbKmxZwdfznlZjcIDIXmGc0/nu5R1vSAiDXdZloV49jUjr9CTzUIdNn2@vger.kernel.org
X-Gm-Message-State: AFuF++kNWy4jPtimyl7Eff4dezxEKqdxMsZszZ27Kf7SWL/AcSjDTYYu
	IXwMvrqGBtRQHEM3gzwxnT3ZsROClCNyxnGO06RtSsf5AtktvHpT6N54bgdiXW5/Me2pVqiyOEl
	TVu7vKNDvKHskddlFiAbqNFm6cV+O3mavLzsG86UVWC6i6flcOVaN+OrTO+ViBKPzie8t
X-Gm-Gg: AR+sD12zvtdgwIVmoWpWxOhNSHNABGj1eDfcmFkFE6omTf6XaMnUUjkilzQ0v+1gLSj
	oDDtg/juMb5sQOy+LmHrKzHxh6mERHGHkL9J3WWFXm2IYYr4pUiR1D5okFiEYurEao2ckJ3P6Vp
	ywZl4ekMOsaWHjQ43If9dHlQmGZQ1c055m7aKJ2SPBbEi3YoZsLOVR70RWnuuZ0lBUSltDUUOZ3
	l5pju7zUzhHw8WD9Bp7my43sKzdSK6xLUBJxlJc6EBpTh8IuUir7PQpgiZUFqadjhu8ubzPDFh3
	xFyLX3YqdlRvl8pWhDLy8AhBiw73b91ze94N50Ng6hJebhP/qPJ1zDsyAUbm/qNtYxtsAmyTzYn
	HhFvrOmLV3X3HtC+lhCez8hTeHZjcjUdL/g==
X-Received: by 2002:a17:903:b10:b0:2d5:cc73:c744 with SMTP id d9443c01a7336-2d64aa24c1cmr511930575ad.0.1787581581528;
        Mon, 24 Aug 2026 07:26:21 -0700 (PDT)
X-Received: by 2002:a17:903:b10:b0:2d5:cc73:c744 with SMTP id d9443c01a7336-2d64aa24c1cmr511929125ad.0.1787581580922;
        Mon, 24 Aug 2026 07:26:20 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d676761fbcsm18523275ad.4.2026.08.24.07.26.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 07:26:20 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 19:56:00 +0530
Subject: [PATCH v4 2/2] spi: qcom-geni: Use GPIO to notify master of SPI
 target activity
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-use_gpio_to_notify_master_of_spi_target_activity-v4-2-fde2ebf043db@oss.qualcomm.com>
References: <20260824-use_gpio_to_notify_master_of_spi_target_activity-v4-0-fde2ebf043db@oss.qualcomm.com>
In-Reply-To: <20260824-use_gpio_to_notify_master_of_spi_target_activity-v4-0-fde2ebf043db@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787581567; l=3820;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=UvVHpzmYAfm8x8s9r5dn96M9ZLyoJz4Am9wFhLKObB4=;
 b=D+LF41ff00aEPftNbkzyMj7eBA5Wwwnv7ov7txMg4VGd1h+0I14kFKGrS1/XwCGh99RlKPvG2
 1MthrE1hihrDxrIDIBlrydaX5Dbi8vNn/r4al0kbsjNxo7TN+4IeWSi
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDEyMSBTYWx0ZWRfX3TYGruBElycc
 9da0Fbuc/xqimmiOnBlqW1GhKOZUgR4gdYTy3OIkjmwERQ/sxQ/a7Hy1O4Pp22E6/yeFrtaulHf
 nLdpiLbbhNdqxX9LpGbatD0ngIY77PipZuWq8kgQr3lTNEN867pMjzkV+jsQSYn5Ex++f33rVWi
 4zDluBIxCkQdp/g712EAUrNfNP8ejp9eHbFbh+hmnETGf6Ynt+IIkiQSOlMe1YMgGj91qqwz9CB
 oRa+q7nl9L1m7KIIM21CS8LSobPHxsDCIhsVztUtskICHZseTQpcO1RS0tiMAxv4bv85LZlDDfs
 e2/RErK22BtUIZG6ERfduIh38dsLUwCJJ826Np8Oe6wON2fIkQ3ri/Dj11LwvXwDbad1sEVajDF
 IngRZZ5/KFEdn06mArTQGiy9LQrsDGHl6f9FLp1nvPhHsfU9fPc/A/3GEmqUKCn59SfCadbq/S/
 +vQoGMaYL48m6P8U3dg==
X-Authority-Analysis: v=2.4 cv=JL0LdcKb c=1 sm=1 tr=0 ts=6a8c548e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Fo9EMwYq_bmgDG0ZVhAA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDEyMSBTYWx0ZWRfX9r+iSRrYhmHR
 GjfCU4IlWLe7Up/xD0hdjlWQRwYKe93gZn7AIEdoIG+yTgB2lv57lAV7Vwj8sHyFixj7Jd67fwZ
 wJJQufyR8yf1tCpz5wnaoiJOCQE4uAY=
X-Proofpoint-GUID: 0Sfkx9sYMwyAhWOJPA-7Ls0i7ovpT-4b
X-Proofpoint-ORIG-GUID: 0Sfkx9sYMwyAhWOJPA-7Ls0i7ovpT-4b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_04,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 adultscore=0 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240121

When operating in SPI target mode, the GENI controller relies on an
external GPIO to notify the SPI master about the target's active state.

Add support for an optional ready GPIO that is asserted when a target
transfer begins and deasserted when the transfer completes, is aborted,
or hits a timeout. This allows the target to explicitly signal its
availability to the master and ensures the GPIO is released in all error
and completion paths, preventing the master from observing a stale or
incorrect target-ready indication.

The ready GPIO is intentionally made optional and is requested only
when target mode is enabled. This preserves existing behaviour for
systems that do not require the signal and avoids regressions on
deployed platforms where the GPIO is already controlled from userspace.
Targets without a ready GPIO continue to operate unchanged by using
devm_gpiod_get_optional().

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/spi/spi-geni-qcom.c | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
index 6c57f8309a3b..fcf5c3f057b8 100644
--- a/drivers/spi/spi-geni-qcom.c
+++ b/drivers/spi/spi-geni-qcom.c
@@ -10,6 +10,7 @@
 #include <linux/dmaengine.h>
 #include <linux/dma-mapping.h>
 #include <linux/dma/qcom-gpi-dma.h>
+#include <linux/gpio/consumer.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/log2.h>
@@ -115,6 +116,7 @@ struct spi_geni_master {
 	struct dma_chan *rx;
 	int cur_xfer_mode;
 	const struct geni_spi_desc *dev_data;
+	struct gpio_desc *ready_gpio;
 };
 
 static void spi_slv_setup(struct spi_geni_master *mas)
@@ -173,6 +175,9 @@ static void handle_se_timeout(struct spi_controller *spi)
 	xfer = mas->cur_xfer;
 	mas->cur_xfer = NULL;
 
+	if (spi->target)
+		gpiod_set_value(mas->ready_gpio, 0);
+
 	/* The controller doesn't support the Cancel commnand in target mode */
 	if (!spi->target) {
 		reinit_completion(&mas->cancel_done);
@@ -938,8 +943,12 @@ static int spi_geni_transfer_one(struct spi_controller *spi,
 	if (mas->cur_xfer_mode == GENI_SE_FIFO || mas->cur_xfer_mode == GENI_SE_DMA) {
 		ret = setup_se_xfer(xfer, mas, slv->mode, spi);
 		/* SPI framework expects +ve ret code to wait for transfer complete */
-		if (!ret)
+		if (!ret) {
+			if (spi->target)
+				gpiod_set_value(mas->ready_gpio, 1);
 			ret = 1;
+		}
+
 		return ret;
 	}
 	return setup_gsi_xfer(xfer, mas, slv, spi);
@@ -981,6 +990,8 @@ static irqreturn_t geni_spi_isr(int irq, void *data)
 			if (mas->cur_xfer) {
 				spi_finalize_current_transfer(spi);
 				mas->cur_xfer = NULL;
+				if (spi->target)
+					gpiod_set_value(mas->ready_gpio, 0);
 				/*
 				 * If this happens, then a CMD_DONE came before all the
 				 * Tx buffer bytes were sent out. This is unusual, log
@@ -1027,6 +1038,8 @@ static irqreturn_t geni_spi_isr(int irq, void *data)
 		if (!mas->tx_rem_bytes && !mas->rx_rem_bytes && xfer) {
 			spi_finalize_current_transfer(spi);
 			mas->cur_xfer = NULL;
+			if (spi->target)
+				gpiod_set_value(mas->ready_gpio, 0);
 		}
 	}
 
@@ -1131,8 +1144,16 @@ static int spi_geni_probe(struct platform_device *pdev)
 	init_completion(&mas->rx_reset_done);
 	spin_lock_init(&mas->lock);
 
-	if (spi->target)
+	if (spi->target) {
 		spi->target_abort = spi_geni_target_abort;
+		mas->ready_gpio = devm_gpiod_get_optional(dev, "ready",
+							  GPIOD_OUT_LOW);
+		if (IS_ERR(mas->ready_gpio)) {
+			dev_err(dev, "Failed to request GPIO: %ld\n",
+				PTR_ERR(mas->ready_gpio));
+			mas->ready_gpio = NULL;
+		}
+	}
 
 	pm_runtime_use_autosuspend(&pdev->dev);
 	pm_runtime_set_autosuspend_delay(&pdev->dev, 250);

-- 
2.34.1

