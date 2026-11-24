Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795522577;
	b=IOB/yQS7VWDMwO126igymUFsOUuDOLF7FqgCzLpG4IWmbSNtpgCtNS9W69yMLTPjLIkk
	 jg3t2I/HZJeFuWFouKGhKFoulBK6dejsaJPWXzGi0mwhlrfYJ4LqlMjdfOYBL3HymgwQD
	 y0rB7luu7LRFWIRmknX5MPsbwhjquXQ+61MOWKRiRL5ApfbcPKVvTd2muFJtveAwSf4QZ
	 cHkBU5G8YOESfRUeJP5Pc0Fw2i7Eo+goa3g2ztZ1rDcT57Jep4SxJF/9eEuB7JgP06ySb
	 hc+wf+UaBCnp1qPc4uOysAeCU0dK/kH8wKORxApYp8MStfEkbnwuSPkCpnHo5ag+xsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795522577;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=tThRIWAEqLynBb1Xo30awcNxYUHaidb6DGrYg3hopys=;
	b=AViHUbEoMwk2F2GRFnH/Eov4UKyslwxGTQjFGipX5mwmP5kGDmsxShYKjpRMJTRShejQ
	 bo4eYdZX83RUAVns7MNXaluE7vBLZ96dLk6gUQbTfaVinOi7ngJDtWkqxN3TNAbVNhInK
	 nAlH5paD8HhE4pYqGLTHP8QrLOYJFHdvvGbnIzqeFMPzvHch//zmjr9M8zr6FjPebOQqf
	 x0xFXbwgwZXyMR+KkXtzx0jYCxZP5OFDcLL4OBqqtCB5Suv/sa3Uv01gcBqGSJ99Q1Wsl
	 LD48So8/RaV0cUOHz+rAIcBHGngN8BhfXsKapAldeIuHfANVqekOOSRr97Mwpfr2B6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cwDuy8t4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TKxgzPY3;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC101606A327
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 12:16:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC101606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cwDuy8t4;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TKxgzPY3
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOAuXVO1736802
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 12:16:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tThRIWAEqLynBb1Xo30awcNxYUHaidb6DGrYg3hopys=; b=cwDuy8t4cXanxmpy
	w/MDXgfxa+n+cFfUBXIGJpSOCuloYkd5L2hawTigjLsM+eCFm/RWdAcD6xb6vPuh
	8v5LP0wraBefFY4EeJWyQaJW6E+hBco2aXyAC5TNqUpTZtykjy0GJwWszb/Fwf4b
	fvsEPj0Uea1j2Ef3JhqZK+87LlFXj32IElxqV9xnS72IUWe1aMhZE7DrApWQ/TaR
	hwIWHZqFHA990n0QEu1lZkyF6NZYBwiIAt0xw1EroAXwIjDjWh0QHymBgflvTc7V
	SluTiFKLYEywCmHxJvV9qQHFgfAU6gdifdkN+fxlnsOyAPDvR940Fsh7VNXGq5mS
	0j2B9A==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yvd2n1s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 12:16:14 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8b69d1f2a18so3090394b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 04:16:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795522574; x=1796127374; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tThRIWAEqLynBb1Xo30awcNxYUHaidb6DGrYg3hopys=;
        b=TKxgzPY3g73LGdzlU3cFbl/GLulx24eJVPwSq7ZeGQo6QL2ABKolJz/J2lPOGXnrvi
         tmWpX+hZMNfXePhr5TJiYYNpgnzTXLJY+ooV+kcPvUhwgbmgHqIroAeYi81t23Slxmhg
         YRskyohPD9GnhURSPk0r2FGeCMjuFZy+4H51b2ub2wb67n6Dcq26Ti0JUpyqOEjwW1qv
         WLR1PJEyIkbUX+rCWx4SMPQulws3M1uqZQJ164vVWqYJ/cHPCghNtuhzYHIhXaCIeXsH
         YJxHYLMMQfnof8wgCJFHxyo7U4BizJEQtaQEwDFd/rwz/KPMR5XHcvrGJeNiKeF2FC7M
         EeDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795522574; x=1796127374;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tThRIWAEqLynBb1Xo30awcNxYUHaidb6DGrYg3hopys=;
        b=cYBaOhmytDI6JosbW4gNx+bE2uCyK+ItRpm6Xs2hA5T/LYgOS0XxqbRFM7WR2vNuf+
         kpf0wbRIiDTxBkZ0gYwQgRWEPJL7Rn33eEj+c2KWgf23sSiYUKA9FvuucSbsu8MIM7hg
         62r0Ss/nSvHYZNtjcXzwOUBd1GkeYqDtmxHZmmyKhHWbtBmzyI6GbVuazKFfEU3OgJSd
         +3OjLs3q2JOjrqyVG4VxMN8lkbAect7A61qXuxuasE03wSf3GcdFQutQeHdThwKXm/hq
         MvMWqzu2t6v3inf4ylmU91H8s9LQMCWLry1UuO3bOmPwikobPaTEQnFJcrJJ4X0q46LJ
         8g1A==
X-Gm-Message-State: APuU4Z/khwyo31LZmCBoVOzVqF0g93GfIDUnuqQWy88YTXBXLFtKm3uH
	zqbuXwZnar+VhWhQBFVebdaedY4WiGf7tosa/O4A2ihBmRL65a6eFA/b4YFkKVT0/EtAxB/H2nb
	5JpcCMGvatCTHUv1lnz2pPmq/0B7F+O1zggdezSDOzmLaWe5/sr6FCGp2OfXAMtyv9T+jM2V8mF
	Hv
X-Gm-Gg: AZFdTZeZulrpH3VInXeNuCVDDk24hX7OZ6qkp5PahTVfRBdTJR/5ZNdBl3oEHvuJiDs
	gMK1LP6ZQmtGHy1KtskkddjbH62KkT6yTc5eDK0NX0nT+a2U1ma27oYGtQ6G7e8BuzQYXMBRDU0
	Bj+eDulYA1SGk+yyXiIJNLMTcd2pIs70IKxZNclrDiwFURizom/hiD2EJyzBUKNbUzLlHx0/tmM
	IRQ6c0vBJJuTdIcI+kgWoPcL5AntgcrYXJC0mnX8+kbohCPEUoPgPeFxnYkHsXMNnNPZYe0atr5
	xfCAiQ2xSrbaAsL3mxg4Q9/qoeq7MRlIXszEgtnCGTqPNtTl+e0JI249lIcihyQr7WZZ9IOPKc1
	xv6hhBW7zSm33OxJDLjgD84Sb+z+YzdBqRtP6uS8LkX9o1uDl/1O3fnvXVivDPUTRSU+tWXshIH
	+bcKKny6i0
X-Received: by 2002:a05:6a00:414f:b0:89f:526f:d6cf with SMTP id d2e1a72fcca58-8c7de587969mr10210262b3a.42.1795522573607;
        Tue, 24 Nov 2026 04:16:13 -0800 (PST)
X-Received: by 2002:a05:6a00:414f:b0:89f:526f:d6cf with SMTP id d2e1a72fcca58-8c7de587969mr10210243b3a.42.1795522573019;
        Tue, 24 Nov 2026 04:16:13 -0800 (PST)
Received: from hu-jseerapu-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c8706844a0sm7245572b3a.1.2026.11.24.04.16.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 04:16:12 -0800 (PST)
From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 17:45:22 +0530
Subject: [PATCH v2 1/6] spi: spi-geni-qcom: Add transfer_one_message()
 support
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
Message-Id: <20261124-qspi_qup_upstream-v2-1-cd69894107c8@oss.qualcomm.com>
References: <20261124-qspi_qup_upstream-v2-0-cd69894107c8@oss.qualcomm.com>
In-Reply-To: <20261124-qspi_qup_upstream-v2-0-cd69894107c8@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795522563; l=12264;
 i=jyothi.seerapu@oss.qualcomm.com; h=from:subject:message-id;
 bh=j9fUAxjMXVj7YhZVIcrs7yrw2LQ9cIbCNpQaMrKd/WI=;
 b=FNMbBSAfTilW+zcIOGsGVagq5Up4sK6Pb5qFxnpyovzYaLFwKwb3GuFaw/51EJrJWReD+sZ8/
 3xmtPG55Qs2A/P+lzQM83vU/iVhdmLjvMzpERsCnshXApgzy81zB3BO
X-Developer-Key: i=jyothi.seerapu@oss.qualcomm.com; a=ed25519;
 pk=9vafyYsia0OnBKWSEwhmWe3hPVQfI2T1xOs5dPaFvEo=
X-Authority-Analysis: v=2.4 cv=ZYeIpcVA c=1 sm=1 tr=0 ts=6b05800e cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=1dw3zO4OUP3knhUqhv8A:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA0NyBTYWx0ZWRfX/DxY2O40Uox7
 uXEMNZWRCjv8dl0YADyOQglap69skRgdNK5uN6ITRDlbJMZt/4WpC1aABnYPy4IXWOsA1oD0J5E
 E4HUWmma1xkfLlbX3onC8vHsv34FCcIYiCieCDUtZtUd8jvIWa6tpwoDaHicJnhtbUyRvR9HRRp
 joibBOO8gYy29mjTYbiduuftJ7lwBRf7Qg689BOrTdHpymUy7250c3hsD9OIlRupjbkaGZsoLpV
 lxiS2QAuC9iSO5wevWvxpbvZERoIDJTLxK79kxTAWjT/6CXq79OYg3tKjTDxnkPtHHsR6iafAC5
 RVuC1TS85TGHL7SU2Rr1Z5WT/3B2YO0crK/J6vSMGvQXAxLI/HIhlTtn2h5/QuM6C23oZyL8aJz
 JvKxzMtLGB8xzdvtDTxM35tw0kXOd4xJajocMq4x9B+rTQYggd9HNtqdL33XyOkltcOQktBruzI
 nvEU/MglsdulsRCYubw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA0NyBTYWx0ZWRfXyN5TCkNaiFZZ
 MEQykU6nrDhnzwkopi0XoO0kxZNc9EJicV/q15GaIFCKuyhV2febeFb2LpI/hbkAAVMxWXnsQ5h
 qH2KSMswd0sb0RemOmUjaMhF39vFih8=
X-Proofpoint-ORIG-GUID: ALR20g7AgHqkRMndfN7O8OXwmMhGRU6_
X-Proofpoint-GUID: ALR20g7AgHqkRMndfN7O8OXwmMhGRU6_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240047

The GENI SPI driver currently relies on the SPI core's default
transfer_one_message() implementation. Adding Quad SPI (QSPI) support
requires driver-managed message sequencing. In particular, GENI QSPI
reads require combining a command/address TX phase and an RX data
phase into a single hardware command.

Add a driver-specific transfer_one_message() implementation, retaining
spi_geni_transfer_one() as an internal helper for programming individual
transfers. Handle completion, transfer delays, errors and DMA buffer
synchronization at the message level.

The custom message handler must also provide the GPIO chip-select
sequencing and delays previously handled by the SPI core. Track the
selected GPIO and its timing and polarity for device switching.
Invalidate the cached selection during setup and preserve the software
inactive delay for native chip-selects.

Signed-off-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
---
 drivers/spi/spi-geni-qcom.c | 245 ++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 224 insertions(+), 21 deletions(-)

diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
index e239c4333055..0a15e75051d8 100644
--- a/drivers/spi/spi-geni-qcom.c
+++ b/drivers/spi/spi-geni-qcom.c
@@ -6,6 +6,7 @@
 #define CREATE_TRACE_POINTS
 #include <trace/events/qcom_geni_spi.h>
 
+#include <linux/acpi.h>
 #include <linux/clk.h>
 #include <linux/dmaengine.h>
 #include <linux/dma-mapping.h>
@@ -15,6 +16,7 @@
 #include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/log2.h>
+#include <linux/math64.h>
 #include <linux/module.h>
 #include <linux/panic_notifier.h>
 #include <linux/platform_device.h>
@@ -109,10 +111,14 @@ struct spi_geni_master {
 	struct completion abort_done;
 	struct completion tx_reset_done;
 	struct completion rx_reset_done;
+	struct completion xfer_done;
 	unsigned int oversampling;
 	spinlock_t lock;
 	int irq;
-	bool cs_flag;
+	struct gpio_desc *cs_gpiod;
+	struct spi_delay cs_hold;
+	struct spi_delay cs_inactive;
+	bool cs_inactive_level;
 	bool abort_failed;
 	struct dma_chan *tx;
 	struct dma_chan *rx;
@@ -406,23 +412,23 @@ spi_gsi_callback_result(void *cb, const struct dmaengine_result *result)
 	struct spi_controller *spi = cb;
 	struct spi_geni_master *mas = spi_controller_get_devdata(spi);
 
-	spi->cur_msg->status = -EIO;
+	/*
+	 * Record only failures. msg->status is finalized when the
+	 * entire SPI message completes.
+	 */
 	if (result->result != DMA_TRANS_NOERROR) {
 		dev_err(&spi->dev, "DMA txn failed: %d\n", result->result);
 		trace_geni_se_regs(&mas->se);
-		spi_finalize_current_transfer(spi);
-		return;
-	}
-
-	if (!result->residue) {
-		spi->cur_msg->status = 0;
+		spi->cur_msg->status = -EIO;
+	} else if (!result->residue) {
 		dev_dbg(&spi->dev, "DMA txn completed\n");
 	} else {
 		dev_err(&spi->dev, "DMA xfer has pending: %d\n", result->residue);
 		trace_geni_se_regs(&mas->se);
+		spi->cur_msg->status = -EIO;
 	}
 
-	spi_finalize_current_transfer(spi);
+	complete(&mas->xfer_done);
 }
 
 static int setup_gsi_xfer(struct spi_transfer *xfer, struct spi_geni_master *mas,
@@ -516,7 +522,7 @@ static int setup_gsi_xfer(struct spi_transfer *xfer, struct spi_geni_master *mas
 		dma_async_issue_pending(mas->rx);
 
 	dma_async_issue_pending(mas->tx);
-	return 1;
+	return 0;
 }
 
 static u32 get_xfer_len_in_words(struct spi_transfer *xfer,
@@ -939,18 +945,209 @@ static int spi_geni_transfer_one(struct spi_controller *spi,
 
 	if (mas->cur_xfer_mode == GENI_SE_FIFO || mas->cur_xfer_mode == GENI_SE_DMA) {
 		ret = setup_se_xfer(xfer, mas, slv->mode, spi);
-		/* SPI framework expects +ve ret code to wait for transfer complete */
-		if (!ret) {
-			if (spi->target)
-				gpiod_set_value(mas->ready_gpio, 1);
-			ret = 1;
-		}
+		if (!ret && spi->target)
+			gpiod_set_value(mas->ready_gpio, 1);
 
 		return ret;
 	}
+
 	return setup_gsi_xfer(xfer, mas, slv, spi);
 }
 
+static int spi_geni_setup(struct spi_device *slv)
+{
+	struct spi_geni_master *mas = spi_controller_get_devdata(slv->controller);
+
+	/* The core deasserts CS after setup, possibly with a new polarity. */
+	if (!(slv->mode & SPI_NO_CS) && mas->cs_gpiod == spi_get_csgpiod(slv, 0))
+		mas->cs_gpiod = NULL;
+
+	return 0;
+}
+
+static void spi_geni_set_cs(struct spi_device *spi_slv, bool enable)
+{
+	struct gpio_desc *cs_gpiod = spi_get_csgpiod(spi_slv, 0);
+	struct spi_geni_master *mas = spi_controller_get_devdata(spi_slv->controller);
+	bool level = true;
+
+	if (spi_slv->mode & SPI_NO_CS)
+		cs_gpiod = NULL;
+
+	/* Release a previously selected GPIO before switching devices. */
+	if (mas->cs_gpiod && (!enable || mas->cs_gpiod != cs_gpiod)) {
+		spi_delay_exec(&mas->cs_hold, NULL);
+		gpiod_set_value_cansleep(mas->cs_gpiod, mas->cs_inactive_level);
+		spi_delay_exec(&mas->cs_inactive, NULL);
+		mas->cs_gpiod = NULL;
+	}
+
+	/* Preserve the software inactive delay for hardware-controlled CS. */
+	if (!cs_gpiod && !enable && !(spi_slv->mode & SPI_NO_CS))
+		spi_delay_exec(&spi_slv->cs_inactive, NULL);
+
+	if (!enable || !cs_gpiod || mas->cs_gpiod == cs_gpiod)
+		return;
+
+	/* DT polarity is handled by gpiolib; ACPI uses SPI_CS_HIGH. */
+	if (is_acpi_device_node(dev_fwnode(&spi_slv->dev)) &&
+	    !(spi_slv->mode & SPI_CS_HIGH))
+		level = false;
+
+	gpiod_set_value_cansleep(cs_gpiod, level);
+	spi_delay_exec(&spi_slv->cs_setup, NULL);
+
+	/* GPIOs belong to the controller; do not retain a spi_device pointer. */
+	mas->cs_gpiod = cs_gpiod;
+	mas->cs_hold = spi_slv->cs_hold;
+	mas->cs_inactive = spi_slv->cs_inactive;
+	mas->cs_inactive_level = !level;
+}
+
+static void spi_geni_dma_sync(struct spi_controller *spi,
+			      struct spi_transfer *xfer, bool for_device)
+{
+	/* The core maps buffers with DMA_ATTR_SKIP_CPU_SYNC. */
+	if (for_device) {
+		if (xfer->tx_sg_mapped)
+			dma_sync_sgtable_for_device(spi->cur_tx_dma_dev,
+						    &xfer->tx_sg, DMA_TO_DEVICE);
+		if (xfer->rx_sg_mapped)
+			dma_sync_sgtable_for_device(spi->cur_rx_dma_dev,
+						    &xfer->rx_sg, DMA_FROM_DEVICE);
+	} else {
+		if (xfer->rx_sg_mapped)
+			dma_sync_sgtable_for_cpu(spi->cur_rx_dma_dev,
+						 &xfer->rx_sg, DMA_FROM_DEVICE);
+		if (xfer->tx_sg_mapped)
+			dma_sync_sgtable_for_cpu(spi->cur_tx_dma_dev,
+						 &xfer->tx_sg, DMA_TO_DEVICE);
+	}
+}
+
+static int spi_geni_wait_for_xfer(struct spi_controller *spi,
+				  const struct spi_transfer *xfer)
+{
+	struct spi_geni_master *mas = spi_controller_get_devdata(spi);
+	u64 bits, ms;
+
+	if (spi_controller_is_target(spi)) {
+		/* A target cannot predict when its peer will supply clocks. */
+		if (wait_for_completion_interruptible(&mas->xfer_done)) {
+			dev_dbg(mas->dev, "SPI transfer interrupted\n");
+			return -EINTR;
+		}
+		return 0;
+	}
+
+	bits = (u64)xfer->len * BITS_PER_BYTE;
+	ms = div_u64(bits * MSEC_PER_SEC, xfer->speed_hz ?: 100000);
+	ms = min_t(u64, ms * 2 + 200, UINT_MAX);
+
+	if (!wait_for_completion_timeout(&mas->xfer_done, msecs_to_jiffies(ms))) {
+		dev_err(mas->dev, "Transfer timed out\n");
+		return -ETIMEDOUT;
+	}
+
+	return 0;
+}
+
+static int spi_geni_transfer_one_message(struct spi_controller *spi,
+					 struct spi_message *msg)
+{
+	struct spi_geni_master *mas = spi_controller_get_devdata(spi);
+	struct spi_device *spi_slv = msg->spi;
+	struct spi_transfer *xfer, *next_xfer;
+	bool keep_cs = false;
+	bool dma_synced = false;
+	bool started = false;
+	int ret = 0;
+
+	xfer = list_first_entry(&msg->transfers, struct spi_transfer, transfer_list);
+	spi_geni_set_cs(spi_slv, !xfer->cs_off);
+
+	list_for_each_entry(xfer, &msg->transfers, transfer_list) {
+		if ((xfer->tx_buf || xfer->rx_buf) && xfer->len) {
+			reinit_completion(&mas->xfer_done);
+
+			/* Synchronize buffers only for DMA; the SE FIFO path uses CPU access. */
+			dma_synced = mas->cur_xfer_mode == GENI_GPI_DMA ||
+				     ((xfer->tx_sg.nents || xfer->rx_sg.nents) &&
+				      xfer->tx_sg.nents <= 1 && xfer->rx_sg.nents <= 1);
+			if (dma_synced)
+				spi_geni_dma_sync(spi, xfer, true);
+
+			ret = spi_geni_transfer_one(spi, spi_slv, xfer);
+			if (ret < 0) {
+				dev_err(mas->dev, "Transfer failed: %d\n", ret);
+				goto out_err;
+			}
+			started = true;
+
+			ret = spi_geni_wait_for_xfer(spi, xfer);
+			if (ret)
+				goto out_err;
+
+			/* DMA errors and target aborts are reported through msg->status. */
+			if (msg->status != -EINPROGRESS) {
+				ret = msg->status;
+				goto out_err;
+			}
+			if (dma_synced) {
+				spi_geni_dma_sync(spi, xfer, false);
+				dma_synced = false;
+			}
+		} else if (xfer->len) {
+			dev_err(&spi_slv->dev,
+				"Bufferless transfer has length %u\n", xfer->len);
+			ret = -EINVAL;
+			goto out_err;
+		}
+
+		msg->actual_length += xfer->len;
+		ret = spi_transfer_delay_exec(xfer);
+		if (ret)
+			goto out_err;
+
+		next_xfer = list_is_last(&xfer->transfer_list, &msg->transfers) ?
+			    NULL : list_next_entry(xfer, transfer_list);
+		if (!next_xfer) {
+			keep_cs = xfer->cs_change;
+		} else if (xfer->cs_change) {
+			if (!xfer->cs_off)
+				spi_geni_set_cs(spi_slv, false);
+
+			spi_transfer_cs_change_delay_exec(msg, xfer);
+
+			if (!next_xfer->cs_off)
+				spi_geni_set_cs(spi_slv, true);
+		} else if (xfer->cs_off != next_xfer->cs_off) {
+			spi_geni_set_cs(spi_slv, xfer->cs_off);
+		}
+	}
+
+out_err:
+	if (!ret && msg->status != -EINPROGRESS)
+		ret = msg->status;
+
+	if (ret && started)
+		spi_geni_handle_err(spi, msg);
+
+	/* Return buffer ownership only after DMA has completed or been stopped. */
+	if (dma_synced)
+		spi_geni_dma_sync(spi, xfer, false);
+
+	if (ret || !keep_cs)
+		spi_geni_set_cs(spi_slv, false);
+
+	if (msg->status == -EINPROGRESS)
+		msg->status = ret;
+
+	spi_finalize_current_message(spi);
+
+	return ret;
+}
+
 static irqreturn_t geni_spi_isr(int irq, void *data)
 {
 	struct spi_controller *spi = data;
@@ -985,8 +1182,6 @@ static irqreturn_t geni_spi_isr(int irq, void *data)
 
 		if (m_irq & M_CMD_DONE_EN) {
 			if (mas->cur_xfer) {
-				spi_finalize_current_transfer(spi);
-				mas->cur_xfer = NULL;
 				/*
 				 * If this happens, then a CMD_DONE came before all the
 				 * Tx buffer bytes were sent out. This is unusual, log
@@ -1011,6 +1206,9 @@ static irqreturn_t geni_spi_isr(int irq, void *data)
 						mas->rx_rem_bytes, mas->cur_bits_per_word);
 					trace_geni_se_regs(se);
 				}
+
+				complete(&mas->xfer_done);
+				mas->cur_xfer = NULL;
 			} else {
 				complete(&mas->cs_done);
 			}
@@ -1033,7 +1231,7 @@ static irqreturn_t geni_spi_isr(int irq, void *data)
 		if (!mas->tx_rem_bytes && !mas->rx_rem_bytes && xfer) {
 			if (spi->target)
 				gpiod_set_value(mas->ready_gpio, 0);
-			spi_finalize_current_transfer(spi);
+			complete(&mas->xfer_done);
 			mas->cur_xfer = NULL;
 		}
 	}
@@ -1065,11 +1263,14 @@ static irqreturn_t geni_spi_isr(int irq, void *data)
 
 static int spi_geni_target_abort(struct spi_controller *spi)
 {
+	struct spi_geni_master *mas = spi_controller_get_devdata(spi);
+
 	if (!spi->cur_msg)
 		return 0;
 
+	spi->cur_msg->status = -ECANCELED;
 	handle_se_timeout(spi);
-	spi_finalize_current_transfer(spi);
+	complete(&mas->xfer_done);
 
 	return 0;
 }
@@ -1187,8 +1388,9 @@ static int spi_geni_probe(struct platform_device *pdev)
 	spi->num_chipselect = 4;
 	spi->max_speed_hz = 50000000;
 	spi->max_dma_len = 0xffff0; /* 24 bits for tx/rx dma length */
+	spi->setup = spi_geni_setup;
 	spi->prepare_message = spi_geni_prepare_message;
-	spi->transfer_one = spi_geni_transfer_one;
+	spi->transfer_one_message = spi_geni_transfer_one_message;
 	spi->can_dma = geni_can_dma;
 	spi->dma_map_dev = dev->parent;
 	spi->auto_runtime_pm = true;
@@ -1200,6 +1402,7 @@ static int spi_geni_probe(struct platform_device *pdev)
 	init_completion(&mas->abort_done);
 	init_completion(&mas->tx_reset_done);
 	init_completion(&mas->rx_reset_done);
+	init_completion(&mas->xfer_done);
 	spin_lock_init(&mas->lock);
 
 	if (spi->target) {

-- 
2.34.1

