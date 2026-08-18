Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD904582EA
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 10:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787049977; cv=none; b=ICXj9Pi8EZ7Pg0EzarDpZ7EqEQ+Rfg2Kr0Q5nSC6YP4XCMu5dWy0ZXYN80Po/iohi+KBYLgK4vuchPnKbISXP3eDyxRZvJPdiJ54vZZG3INNW50FJfGHZ4o2Ym+hGu0BtFG7qNw8BI75vctEtx+5I/VihnQ75fJ4KdxltDFEJcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787049977; c=relaxed/simple;
	bh=3GxZsZZ0axdMoB5qI/U/nBuEqGc/X6IlpBABVEOP41k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mUKMdYI6WuYzJfV0YszPBECfLlvXU2JKuR/4H6E/hhdBVqYlIktXT1aOLOLEfks+mZ1619CXTxBMaljnbeqdud5PRgpsYO25q/rq2LWORZTttu7EDxuDF1p8aLydNZ+YDtz+TI/+LRWv35PnP8A4kH40YDXdqze/Hne+JmhUAlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PRe5LD00; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B48YOAcM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PRe5LD00";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B48YOAcM"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IABUH31021537
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 10:46:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AjFfNFXT66wBzziVDwKp+u3lssV0V1KcVKuQX4YISx0=; b=PRe5LD00N+LtatCM
	KVd8+Bq7YhI3a6A6WRo3Aaj7Cou3qXabzMyCrrNLpim3c34WtaTDyH0aho0BorUH
	GasHbUL96jR4TLLDLEGo7VBsa4ugXxl8f+eE3G7GL66Yv1czUyKLbAqZ29CyOYNx
	KlLwRjAKgfBowVYb8KOWNotQRd+RDZs26yT8aFK5mWbmOJ9EM+OnixYM+l2muaRb
	daUOWlALR6gE+emgxyMOaUO+OlkXM6qgQvgUKqGFDLUgXPHVtxiCYF5quGFZ1idv
	wD+DLiyuKmuHa3JtN+MbwoGY86tP/DYT5J4vLPA3B+wOheiRFsiPgyfaTmUTYcQr
	d3ZRCg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g48q0u8u6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 10:46:14 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cf7dd9fd91so51603145ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 03:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787049973; x=1787654773; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AjFfNFXT66wBzziVDwKp+u3lssV0V1KcVKuQX4YISx0=;
        b=B48YOAcMgt5HA5rsGli1Ft8I7xH+Tp0TMHrSv9bzHiDRKNA00G3PsWzQzT5TSirbAO
         47a/JOc00Jw+wp0OEWa/L42hz88AiFluZN6gjZaCoSAH0DgJ/M151s7zLw43ocP9+7+k
         g96RACZOQ2JYIvzkm5ixcpvXUL29ZLFnYXMcwX0SXLF8zoY/l0k2Ew4vlpiRtPi1zIS+
         G1hTbabMyTIYc8rgcJw7RZT1B23bbdHEqcbKwG+v3ODYBKFz+IRf11Y3Lm/Z3y7EgzDo
         0X7mZG1rr0CpD1Oq8m0EOx+4zOX/lTtOFCxmshjizxlOk6IPUwi6Vfv0yHgxjVuZRVtj
         5S1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787049973; x=1787654773;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AjFfNFXT66wBzziVDwKp+u3lssV0V1KcVKuQX4YISx0=;
        b=dXpPaG0lKXqYi0dkZKS6o3zRqyXeH2YU1DABmWfAq6d9YInfvGV60oPrJUwgoX+kK1
         qtSRhpZDoeg2gafSPMGCZhRUc98DCRYZgRuFjAM1OXIfEOHEUEt71LGrsqc+5A0riMor
         n/lEx5nV7bnoAjkxXZDBlkI3+0HH2haf65ixIiyn8G97LI9xUaQcCI97s8IKzGshHel5
         vYLZX1Oe9+XKMkOjiVxT8D73zyTKlBsFGVcn7hbYqSxLH8DWi+LI1xy5w40Krvf5cNpY
         8Pn/wgF0yuBPtYgg29rPgukAD3HpvCRcTOpgkSRMGksjGvShg8Zw35y+8FWZT9ALeixA
         yDaQ==
X-Forwarded-Encrypted: i=1; AHgh+RobDDvc1qB0AaeGgJYjeiFounVQ70X+KmselKBJOVS+3T8TTwrcS597PrCzv5HkqazXNzQlUV7bw2TZMRoH@vger.kernel.org
X-Gm-Message-State: AOJu0YyB+Tb2PlxfwxBNp2+wuMdXuYfGRWXnNKpdR023WzlxH3LAOq9S
	12hj1auUqPmwq5/gdcSHcda5LS87z3IGoyTbrOPfj6eKTgUFkQ0L3+0dvoBnjsGh785Fc5Zj1/F
	6nKg8NSmU9n3FmPafCAc8QquXfJDMzjaSj+5ojVtlrRIiX2ZCOlok0k35qnunzxiOTZJI
X-Gm-Gg: AR+sD13Eo5LoH0aMMhm/ssu9HU5v4j9VE+s9c8+JcKhIR+8q1R/5RnKIr/Pb5O6Sbu5
	P/M4LBDxXdXOL4SatOkOIG96FMdNx1EeuQ+wqGrnA9v//yeaD3jmvVe8Fiut6td41ExIFwu4+N5
	Db+AZoaBCKRTsc0W77B417I4TOJJmm8IAKOqNW8DfvkisI4pasAOH3saj+0nEoeXYnIZyW8lk+M
	Ef/v5Y5Pu4mO02Imk3aRCchtp5lhGH0Pe0oRX6V/Wq1z+VMSNoeiviWG3Oz2YXNYZyTjyz61tI6
	sjAHMILju2Mkd5RI7S31YEcsuzgCgiU0HBbMmal8vy31663V8vS3l8lV26po+Tw0B899TSZHa4t
	OZBnjG6fdS53IYRPWd56eQHuNiPs/j7Hwow==
X-Received: by 2002:a17:903:320b:b0:2c0:b6c7:227e with SMTP id d9443c01a7336-2d3b0aeeb9bmr389242705ad.5.1787049973502;
        Tue, 18 Aug 2026 03:46:13 -0700 (PDT)
X-Received: by 2002:a17:903:320b:b0:2c0:b6c7:227e with SMTP id d9443c01a7336-2d3b0aeeb9bmr389241725ad.5.1787049972953;
        Tue, 18 Aug 2026 03:46:12 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d5c1ef9b3esm12877935ad.79.2026.08.18.03.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 03:46:12 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 16:15:55 +0530
Subject: [PATCH v2 2/2] spi: qcom-geni: Add panic notifier to cancel and
 reset DMA during panic
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260818-add-shutdown-and-panic-notifier-for-spi-v2-2-eb25d56634a0@oss.qualcomm.com>
References: <20260818-add-shutdown-and-panic-notifier-for-spi-v2-0-eb25d56634a0@oss.qualcomm.com>
In-Reply-To: <20260818-add-shutdown-and-panic-notifier-for-spi-v2-0-eb25d56634a0@oss.qualcomm.com>
To: konrad.dybcio@oss.qualcomm.com, Mark Brown <broonie@kernel.org>
Cc: mukesh.savaliya@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
        chandana.chiluveru@oss.qualcomm.com,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787049963; l=4545;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=3GxZsZZ0axdMoB5qI/U/nBuEqGc/X6IlpBABVEOP41k=;
 b=Vmp+4pR3Ikr51hFiJQkeBKwYy8LsSjWFDL/TVXb0gU+xALJFCDZOATRZJwlU3DEhDgIHIjU3o
 jhERsAUS5siAEu8VSaQ+Qtip+ldmkiK6aTcujrlcX7CEiXIgUDnEBEP
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA3OCBTYWx0ZWRfXySL6igi+J8CJ
 rjtzz0PMzbxb2vleqGpUGcoTU6bbOL1J8Tzo1qOK9lT0/K93NQ2tqHGts68jJXqOp1+RHm4usjt
 6ZZatIFKXUGinvCN8SbjxVh/Sv2A5qg=
X-Authority-Analysis: v=2.4 cv=VuITxe2n c=1 sm=1 tr=0 ts=6a8437f6 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=xoWfBlptTmbWqyQa1LgA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: s-_XvL3vimHgImw95imng2JARYSGpH35
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA3OCBTYWx0ZWRfXx8FLEwhC5l7Y
 2vH09P9C4kLMiNT2psX4fZ33S619KuMfYEo57Jk9X6UkYngFg9dB09ziciDbzzDzZGDgw9ckP4P
 dWmupAXoq7KY3BWaXVcuxFFlZgwsFeB+EgNZ8bMyaJr1wFuQM6MqNkSyMinOJKWAxU8mt1p6AZ9
 WMGck5/ItLZpzVu7VMfsqtfMyQXF3r8o5KHotsJ9MK2irgMMEgJFZ1jKjnzB5bgsjQQxxI4Loxz
 xdMErfaFhS8sQHbFEfIi7e9m3nocebBfQrbYxjSLxiac7YpxzpokLbVIEZnskft+bUL/kvxjdeJ
 EGhu3f829bIVOEBBL2+cap323XkaNIGlM5wqqsww+zWEr85PZS1LtQZRUK9sAbnDQmFBo5VgkZX
 1vJEs0Y+kLCyAJ6kRmY52Kd5gn+OhaG6+KmUDOUaJ/5Ae6suW4VNZNPF7JOa7vq97dtzX6Esg0L
 abrBBbOo5U939wZixpw==
X-Proofpoint-ORIG-GUID: s-_XvL3vimHgImw95imng2JARYSGpH35
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 clxscore=1015 spamscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180078

When a VM crashes with an active SPI DMA transfer in progress, the
SMMU raises context faults as the DMA engine continues to access
IOVAs that are invalidated when the VM's memory context is torn down.
These faults can affect other VMs sharing the same SMMU instance and
obscure the root cause of the crash.

Register a panic notifier that cancels (or aborts, if cancel doesn't
complete) the in-flight command and resets the TX/RX DMA FSMs, so the
DMA engine stops issuing transactions against invalidated IOVAs
before the system halts. For GPI DMA mode, the DMA channels are
terminated directly via dmaengine_terminate_async().

The notifier bails out early if the device is not runtime-active or
if there's no active GENI command, avoiding unnecessary register
accesses while the SE is clock-gated or idle.

Since panic notifiers run with IRQs and preemption disabled,
completion-based waits used by the regular error-handling path
(handle_se_timeout()) cannot be reused here. Instead, the relevant
status registers are polled directly with
readl_poll_timeout_atomic(), which is safe to call in this context.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/spi/spi-geni-qcom.c | 68 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
index 39d67f19244c..dae806818413 100644
--- a/drivers/spi/spi-geni-qcom.c
+++ b/drivers/spi/spi-geni-qcom.c
@@ -12,8 +12,10 @@
 #include <linux/dma/qcom-gpi-dma.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/log2.h>
 #include <linux/module.h>
+#include <linux/panic_notifier.h>
 #include <linux/platform_device.h>
 #include <linux/pm_opp.h>
 #include <linux/pm_runtime.h>
@@ -115,6 +117,7 @@ struct spi_geni_master {
 	struct dma_chan *rx;
 	int cur_xfer_mode;
 	const struct geni_spi_desc *dev_data;
+	struct notifier_block panic_nb;
 };
 
 static void spi_slv_setup(struct spi_geni_master *mas)
@@ -1073,6 +1076,62 @@ static void spi_geni_shutdown(struct platform_device *pdev)
 	spi_controller_suspend(spi);
 }
 
+static int spi_geni_panic_notifier(struct notifier_block *nb,
+				   unsigned long action, void *data)
+{
+	struct spi_geni_master *mas = container_of(nb, struct spi_geni_master, panic_nb);
+	struct spi_controller *spi = dev_get_drvdata(mas->dev);
+	struct geni_se *se = &mas->se;
+	u32 val;
+
+	if (!pm_runtime_active(mas->dev))
+		return NOTIFY_OK;
+
+	if (mas->cur_xfer_mode == GENI_GPI_DMA) {
+		dmaengine_terminate_async(mas->tx);
+		dmaengine_terminate_async(mas->rx);
+		return NOTIFY_OK;
+	}
+
+	if (!(readl_relaxed(se->base + SE_GENI_STATUS) & M_GENI_CMD_ACTIVE))
+		return NOTIFY_OK;
+
+	if (!spi->target) {
+		geni_se_cancel_m_cmd(se);
+		if (!readl_poll_timeout_atomic(se->base + SE_GENI_M_IRQ_STATUS, val,
+					       val & M_CMD_CANCEL_EN, 10, 50000)) {
+			writel_relaxed(M_CMD_CANCEL_EN, se->base + SE_GENI_M_IRQ_CLEAR);
+			return NOTIFY_OK;
+		}
+	}
+
+	geni_se_abort_m_cmd(se);
+	if (!readl_poll_timeout_atomic(se->base + SE_GENI_M_IRQ_STATUS, val,
+				       val & M_CMD_ABORT_EN, 10, 50000))
+		writel_relaxed(M_CMD_ABORT_EN, se->base + SE_GENI_M_IRQ_CLEAR);
+
+	if (mas->cur_xfer_mode == GENI_SE_DMA) {
+		writel_relaxed(1, se->base + SE_DMA_TX_FSM_RST);
+		readl_poll_timeout_atomic(se->base + SE_DMA_TX_IRQ_STAT, val,
+					  val & TX_RESET_DONE, 10, 50000);
+		writel_relaxed(val, se->base + SE_DMA_TX_IRQ_CLR);
+
+		writel_relaxed(1, se->base + SE_DMA_RX_FSM_RST);
+		readl_poll_timeout_atomic(se->base + SE_DMA_RX_IRQ_STAT, val,
+					  val & RX_RESET_DONE, 10, 50000);
+		writel_relaxed(val, se->base + SE_DMA_RX_IRQ_CLR);
+	}
+
+	return NOTIFY_OK;
+}
+
+static void spi_geni_unregister_notifiers(void *data)
+{
+	struct spi_geni_master *mas = data;
+
+	atomic_notifier_chain_unregister(&panic_notifier_list, &mas->panic_nb);
+}
+
 static int spi_geni_probe(struct platform_device *pdev)
 {
 	int ret, irq;
@@ -1161,6 +1220,15 @@ static int spi_geni_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	mas->panic_nb.notifier_call = spi_geni_panic_notifier;
+	ret = atomic_notifier_chain_register(&panic_notifier_list, &mas->panic_nb);
+	if (ret)
+		return ret;
+
+	ret = devm_add_action_or_reset(dev, spi_geni_unregister_notifiers, mas);
+	if (ret)
+		return ret;
+
 	return devm_spi_register_controller(dev, spi);
 }
 

-- 
2.34.1

