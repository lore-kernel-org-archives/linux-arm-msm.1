Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 802B447989A
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 13:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787060320; cv=none; b=fjYXIaPcc843lj5TvbZH8V2hThZiyyfc0xvj+867atWI+YBsR/ETkkels5RQxBM+LCm7bn+AGY40i+UrxbD18tTWmHVojgBnkZb/hj0sO/GzIZdygf1Ct/3C/tQfprBh51pzwCtKoffgXbRjHHv/LteDcH8iGz92lk+/PAV4loE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787060320; c=relaxed/simple;
	bh=BG2HAs+2vxpsLD28GCWp9ALRBE+J16kkoe8+bOtWqJg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iSgqp42nLQBCiyeYzMqbENF3OqZlLRjN4tM4gjtn8WhF7DL6zTtEskH2QBawvbiAVpWDSEP0hdRqE/2cWujVOAQwOhcisMXRoNVnuGumr41ewqnhDWzzc4NRAS4IlyhPsw+zKG9MFBm5df8m1ZNuqtYJivaVWzAZjhCFjY7a9xQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DLFEbHl/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L4j77krp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DLFEbHl/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L4j77krp"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IDQsq81008475
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 13:38:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oqQF95WlbW/wBv08Y8MEkU2oObqRblIP8p9ow3LJ+JU=; b=DLFEbHl/Dhrnjuf3
	LLCt40JxjAznO62eVT61mvnV8SueW5dlCSmIDKcBmxZfTViPT+xWiInSbQ6ab76e
	ULti1SXY3Y/l5dzY8YCn0ZaahWdJb/lhJ1SbwOxyj0Ter6Eet6hoyf+bar4uLmJ8
	sbvnAzASuYVXCw05fZUnBEw23T33WBQ7j/lMYIfzVjiHVjE3Awm2kZhXkbIk745D
	NKEAh7E8VNP+rtbNJqcPCDBMWafQ+QbMEXHZUpg5eih0p+lQjYu1pXCFHC9mYThs
	HhGd7D5mI/9cHXwk9+OK/bbEF0i5M+Yyw6UWC+d0oaBgZrocmHKLs/VFptZ1dC94
	cyVnCQ==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4fbaadft-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 13:38:35 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4b28d9952a5so2010991b6e.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 06:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787060314; x=1787665114; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oqQF95WlbW/wBv08Y8MEkU2oObqRblIP8p9ow3LJ+JU=;
        b=L4j77krpYcWQEgXcWTh+b9XweVeBsSzB7PRK6rgCDwzd8cIO1X2J77wM/2t3w/TvD3
         2DSbYrsanB8ec+14+ozxNL1DtscyGt49kb0rJ4kLBqh4scMsKs0mWmCWpWe2xEDoclUS
         bH6T5bnIhuyud4GOputgU868s6sbItTivCiOYuaF3UJhtZUSih4nX9yParw6Q4s8pD9q
         VOk4n136s8j72Y77PeD85a3en6yM5HECXT6SplgFMtPkFGsk7f0wkTUtSrv5UEf5nbk/
         hrOk/DJEYa2MsY7loapodTb/hlb3B5ky0fnkK0hVDOJoRssdlK9M+5FFG9rV7YTM2FAF
         RqCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787060314; x=1787665114;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oqQF95WlbW/wBv08Y8MEkU2oObqRblIP8p9ow3LJ+JU=;
        b=s0LRlkXYeiG82y8pG7Zag9DZrRd2KqOdQrKlJ0ywivd4WVCfzPvbIsNwuCL2i8YvuK
         EkHDydWu5+ez11jQyLXU/aB00FfGfeYP3+vkQH3irJaUGMjsCb/uqNX1SWuT42LnVFCv
         e6bXtSzDGGHrL7ZmhEAt+7OYzrBhCIiiWQsgzS0KqkgVYYdT3GXKDwXhuN3IqRkBP/p1
         9v+fHIaYZaLVPYlT85ab9eUyzUBAi/J2gGF+NlXrCucCttcjxm2DU8wF4GeqjVDPorKc
         qOihtqoalXz/2Gp+C0egzWaQSQPBwDZGL3O22RflmbSsRhFbJlRlLsSWwvhIFCq/NToH
         7Njw==
X-Forwarded-Encrypted: i=1; AHgh+RrB4v7Sl0fOBYg+pYlZzmLbVx1Yi0HqKSuVZkNWxS0tJxOES5U1DzvD8dh2MFODBix+XBTO26Os0ax7M7cg@vger.kernel.org
X-Gm-Message-State: AOJu0YzPjrwcnmKbt74YGXqY6YR+CIvjUZfVJhcU32lW7zk+3gwfSEco
	cP5faH19IH5Y4hQ8QiU5CLU6SjmADfSecEJjXEuHxrSf1+mAaqS8H0jxRiI5mhHmzKel+gHXJbM
	A7P8mrTLC+qiH5hX1UdHa2/DQAcSX1FtSQpcy6MxUABWRvsQEEKUK7gSrqlS0Jb6q+TvqvcVnGn
	bh
X-Gm-Gg: AR+sD10q/j8OjmmdBozON/nlzPeoe+SaaiZwuYVbC6vvf/Pg/VB/Oj66OMoKW3TKvB0
	hahEt+8bCSc6KO34hd1y2vZ0Q5qQDlqEpSNZ1lT6v2TZuOTqTA9gwJZxAmAW3JKzFZSXjSTuKK5
	JAPtldliMSu8tGekErocsvIubet/DgTmiUGv86YZjsr6wfxeYyacdIa6HLBsdikunq1KSJWovVo
	2T2UcoYyQ9K5oSQwxWPRVF365JsFZ5sqzRJlrRn2SgGo203OOyFTSJZiLz40Wl7gDAsuJeaVk5Y
	nIK6SG9uJN7uUJsfHgdiNFO7yZtpZTogVzODerv9BFV8zZ/bE7aRqkl9IdVzRviin4KXu82otW+
	r+naHd6KkAQX8OVWYDDOy4WT3STnfm05qPQ==
X-Received: by 2002:a05:6808:4fe0:b0:489:93ff:9ea0 with SMTP id 5614622812f47-4b240fa99d4mr34038137b6e.2.1787060314037;
        Tue, 18 Aug 2026 06:38:34 -0700 (PDT)
X-Received: by 2002:a05:6808:4fe0:b0:489:93ff:9ea0 with SMTP id 5614622812f47-4b240fa99d4mr34038009b6e.2.1787060313452;
        Tue, 18 Aug 2026 06:38:33 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-45f22aea368sm3232956fac.5.2026.08.18.06.38.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 06:38:33 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 19:08:11 +0530
Subject: [PATCH v3 2/2] spi: qcom-geni: Use GPIO to notify master of SPI
 target activity
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260818-use_gpio_to_notify_master_of_spi_target_activity-v3-2-e1c9e0dabbda@oss.qualcomm.com>
References: <20260818-use_gpio_to_notify_master_of_spi_target_activity-v3-0-e1c9e0dabbda@oss.qualcomm.com>
In-Reply-To: <20260818-use_gpio_to_notify_master_of_spi_target_activity-v3-0-e1c9e0dabbda@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787060297; l=3924;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=BG2HAs+2vxpsLD28GCWp9ALRBE+J16kkoe8+bOtWqJg=;
 b=um2Py9tYx5SurUsctZdhicd/AgopT7VEvseEsZ9J2HkAE+t8ehMwCdpb8ayQ/grCWPLnH5bKK
 AmwJ+ZFIonmDNH+9E/ILjU4ZWh9QnNcaFPjcIRkxUIv9JkLdOc1brs+
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDEwMCBTYWx0ZWRfXyLU81pMAlmmC
 kJBIo30XnSAqaofFO3sB9lrSwXevgFEPFsNKF0v8msQZpSwHd6ZJ1Hl4cd6d3woagAL+tFwOkkO
 706+Nv7SR1gOrItNKiu6rE7OR0XjAkE=
X-Authority-Analysis: v=2.4 cv=VsITxe2n c=1 sm=1 tr=0 ts=6a84605b cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Fo9EMwYq_bmgDG0ZVhAA:9 a=QEXdDO2ut3YA:10
 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-ORIG-GUID: T1iAW_KDTFQ4KigUw-_L8L_O9VJHkJLN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDEwMCBTYWx0ZWRfX43ZI76HbiUuM
 3wOsol0oHxWSSF54ERHwbHawy72T040GWFSvQcO60N4ptik5wPjZUN8ssAQJKaxkkpGAL1XfpDG
 K/5oNwyGECgBjHpix/iu8AN4Lkk6DR/JjIwvTOoDq9fdMf/xwJwPvE48ZwMy3jqWjekfxSvzxjx
 v7eI3XXDByB2xvs9X0GiR7uXCPSQs15jtmUWeWJxpY9gYGS1NEoebN3G3RJ+aOoM9zJD16zstZv
 Rq4e0roEZnBp8TH+6WLWpdsLHLqmZZ6RGP4UOrB2LkAnUIJ8CjUj1Q9ZyA43dxlGn4uX61i2QcX
 Ez09GRirq+tgp9aT/GFrTorWZ16LTu+LfXAXOakeC4RVyirYyfl+FT7y6YF2+vETC7S2O8bLE9U
 JLpFepRaP2y8E07MoqfsNi+ZBVZR+GjHPv3Q4VWHShAid7scObxHq7gPmf++HDILugZs3mZ13xf
 FNrpQ3r9kZZKg3pfwZg==
X-Proofpoint-GUID: T1iAW_KDTFQ4KigUw-_L8L_O9VJHkJLN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608180100

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
devm_gpiod_get_index_optional().

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/spi/spi-geni-qcom.c | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
index 6c57f8309a3b..bbe040383d53 100644
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
+	struct gpio_desc *target_gpio;
 };
 
 static void spi_slv_setup(struct spi_geni_master *mas)
@@ -173,6 +175,9 @@ static void handle_se_timeout(struct spi_controller *spi)
 	xfer = mas->cur_xfer;
 	mas->cur_xfer = NULL;
 
+	if (spi->target && mas->target_gpio)
+		gpiod_set_value(mas->target_gpio, 0);
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
+			if (spi->target && mas->target_gpio)
+				gpiod_set_value(mas->target_gpio, 1);
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
+				if (spi->target && mas->target_gpio)
+					gpiod_set_value(mas->target_gpio, 0);
 				/*
 				 * If this happens, then a CMD_DONE came before all the
 				 * Tx buffer bytes were sent out. This is unusual, log
@@ -1027,6 +1038,8 @@ static irqreturn_t geni_spi_isr(int irq, void *data)
 		if (!mas->tx_rem_bytes && !mas->rx_rem_bytes && xfer) {
 			spi_finalize_current_transfer(spi);
 			mas->cur_xfer = NULL;
+			if (spi->target && mas->target_gpio)
+				gpiod_set_value(mas->target_gpio, 0);
 		}
 	}
 
@@ -1131,8 +1144,16 @@ static int spi_geni_probe(struct platform_device *pdev)
 	init_completion(&mas->rx_reset_done);
 	spin_lock_init(&mas->lock);
 
-	if (spi->target)
+	if (spi->target) {
 		spi->target_abort = spi_geni_target_abort;
+		mas->target_gpio = devm_gpiod_get_index_optional(dev, "ready", 0,
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

