Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5175D3D649A
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 09:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787737905; cv=none; b=pLW/M6yNrZYerlcjl5zuDC0tWudsaRwnKEwU4Jt68EIqpW/WW2sjwJ1GgChU+aHepVz3/GOu7T4CzoZ29O/OcsW5rQq6Hg3et0TXKmC8vxe1FAS2NmaxG0xEUNs2UO83m7jBK4cA5lANc4JC+bWPPE5zhIdO/evs7nCeK11tdFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787737905; c=relaxed/simple;
	bh=q6lnsY3bEIeljUOjeWLcxQADTc6XmvxdsLsC9iNl46Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bQwPXbkkoQzZNvgWYa6PuNf3UO4XBGCGQ2cFtC3hf5dlWjGb65CmaO9s3AN/BdD+Wpbj/bwRJlLCSgTgT+jlvtYvg34vM88v938hmZXcxs+c4/yywPCLsJkhjb1NhaZMX704md3u/COGSvBvwYqZg0P4CMsBHeLli1IkjAOCazY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j1sQ1Txe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RyTK3mZZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j1sQ1Txe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RyTK3mZZ"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q9Cfcs4157812
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 09:51:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0v2IFC/8lEKzJob5TL4TVUywpLxhBRcIX0pAWlcuyR8=; b=j1sQ1TxejlHTvZyW
	zSnbaoPSaESIZ+G7RO5Ebe+2H41He0wb9adEJg/oJ3QKy7Jg7QR//jG9Sa4UcJfN
	fHAXNrzjTTB+i7d1VOcS5+WyFfkyJc+EzCh+/x9n67tV1lrMbio/c5p7jIPwFqBn
	Q+Le+/NYYD8XWfcoC1uKpAWMdcsrtCJvq9sOwGLrR/zBW7/bVYu4j0atdYMR/FMN
	mUiERTBAR+eavw5MPx0yQvwtJZuEuw+p8Fvr9Ruyxqkv9o0OICSNBi/JeODF0H2r
	qjAhh6jBAbDMKB0EM/Tx8TFhwm901JVbwSfc/KeFdIrEErfBD6RWHaIsTJEupp/r
	S/ilmA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9s9g97f9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 09:51:40 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc1c2f1acebso1029457a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 02:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787737900; x=1788342700; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0v2IFC/8lEKzJob5TL4TVUywpLxhBRcIX0pAWlcuyR8=;
        b=RyTK3mZZHYl7kdrJW5/fjkaO9E6HW0xOg4bocbOsEOfcMQ9LgI8Glyzs50rzeE44Rg
         G6MJAW7/iCKK4O+LXFMtRYUU0yBNOGz//Ut828/s2ytQqBzcyvKtfWF4vkui8ytaneDn
         fLedTkvjJ9GZZEjbQ32m4CZo0cSqXPesIblznQxgmTWUhIytyNYFzHNyhiLFLpb50s/F
         DeQ/hd8g4fe3WDNwillc19HOINa9+2YHGagfrK1tJQxPGqjlMxWP/4WfN8M942Pf2SRV
         EsriKDz56Tq98RYFiVTX8K6CXRP1YL+qv9RygmebH41E8LOACjMnNvqZRARkgGhCaPel
         VStQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787737900; x=1788342700;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0v2IFC/8lEKzJob5TL4TVUywpLxhBRcIX0pAWlcuyR8=;
        b=QEucEglN16YjXqHWT6nLZkbyKyGhPMH3e6lQxb5Kgb2Tlx5sXY1H5rcP+2OHsusOsR
         vloZQAOPyxbnva1/nqE/qv0JShxWRmkPlJR2I90F0SuBE0hsnWyYiHsdvdDnIwcCIBQA
         qjEujRuiRL9z7xj4c4w6SZgw+l6kknI3yISVXdQW4ApAnBZpjph+Q8QFAdO/BcaOrxPn
         Qjatca9qdGE7WeNeO8Bz5/HtqpuZjy2BM+mIjcNZuYLP+GKKj9693upFsJLOA8CssxLu
         cDJm1T5H992FYaaVPvKO5m3HmkhJRZX7uhhbzNOqgXHilUO9wQq7+5G/XxN0UnykhsJu
         wIIg==
X-Gm-Message-State: AFuF++n+aWhT1Y7VfdukOfsq147fbezc1WTuJSjuim96DwPE9IhVI12s
	cQ/2PK0zb/IzFe1UYe+vcE7pmARmqPLb58Amw1xH53dKxHIAjRFo51OVF58Rcd/HcMn6eyhdVa9
	ROn9vQz4QjDdbc2Yj4oDSvQYQQQQkctBlKkAO8r1p4SullgQ1uyBSTpILbUpMgC27utP6
X-Gm-Gg: AR+sD12tgFuFVoNceKN4c3Kdp9ojoJ8Lb5TvdTLCnTSmjjF6qTNdV9XtGcICwn26/8F
	kMD7deF39JHq9y1MuzXIDz0BI84+Mp/XJbm6EGm0AyfijO8oiZVSCVly4loLrB2DSZGFM74cDab
	M05lGjiXaostpxIimREy1V2HXbXCMUowk1zvAB8PrA/7kL/tRg+ukdQ5GdBnid5lqt2LN3A+jwg
	j8egyWKlTKYR2VnfNB3yTatj8sj9mbWzismjboh2qNi4NaCuqMOJqimUorZa5J/55TxmaUsGLGV
	NELLIc8zGowYXohWX2B3uCGk2Lc2N67FHAsiyiwspvRqltnMVi4A9quXoV1jbQwjt73j2F83zLW
	/qoztFv6q6tJT9stmk+/PqW4r8zRUKojbBjg=
X-Received: by 2002:a05:6a20:c786:b0:3c3:b57b:627d with SMTP id adf61e73a8af0-3cf84c5a493mr12527256637.12.1787737899820;
        Wed, 26 Aug 2026 02:51:39 -0700 (PDT)
X-Received: by 2002:a05:6a20:c786:b0:3c3:b57b:627d with SMTP id adf61e73a8af0-3cf84c5a493mr12527171637.12.1787737899416;
        Wed, 26 Aug 2026 02:51:39 -0700 (PDT)
Received: from hu-arandive-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283d8d208csm7249738eec.23.2026.08.26.02.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 02:51:38 -0700 (PDT)
From: Aniket Randive <aniket.randive@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 15:21:22 +0530
Subject: [PATCH v1 1/3] dmaengine: qcom: gpi: Add I2C bus recovery opcode
 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-i2c_bus_recovery-v1-1-203f0ec76f84@oss.qualcomm.com>
References: <20260826-i2c_bus_recovery-v1-0-203f0ec76f84@oss.qualcomm.com>
In-Reply-To: <20260826-i2c_bus_recovery-v1-0-203f0ec76f84@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Aniket Randive <aniket.randive@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787737891; l=3434;
 i=aniket.randive@oss.qualcomm.com; s=20260325; h=from:subject:message-id;
 bh=q6lnsY3bEIeljUOjeWLcxQADTc6XmvxdsLsC9iNl46Q=;
 b=5w6OCYdxBkdnA/Vfk6+SF0rNAOMSGJ7ci5lTeen32UHILV4bOZD6Ou9Wrwq2mxwPaq4Qp5Tks
 eOIaDGWrWbfD0zmdIX82fCBLN0RZ0TOmnlNDvD99I3ssCe6xRiLXdBt
X-Developer-Key: i=aniket.randive@oss.qualcomm.com; a=ed25519;
 pk=4o37X1ZqGbCO/T2SR8kq/HnWvq0yb1RUlFuNukovbQk=
X-Proofpoint-GUID: OQCbJ0G9UwA_iDdEs1IOwsDbujcDQYKx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA4MSBTYWx0ZWRfXwXEUKhOnH1zE
 JAdPUOx0Qjhg3+Bls8+8ZawF6WW8aIabnxqPbEq8R+RIwJ2PJPRiB2mtOchozOQhl5dS6HJYbcY
 j70uKDcaTgUP1ZLd3kIhg/1czbUP7alyl4kOEiRims77T/LbE+c4e0xikvK1FU+PZ8brLRlUdHa
 zJKFUy3WISSbZq1/fnvzD2UCIoscat1nAzMWZuTbZsGNaykLXmnFT+fiGzLWFZ4FjRNoxDlH+uq
 Rd7bsv0pto5v3JkwSHYN+FhrOpmMo8UAbY+X++CXbF31Ah3BZIkJ4vJxN6uBBDlG0EhOi2BJuym
 SQjL5zHJC1C6kGlYda60HEgooSJTt4fi9FWAo0zhmR95W0zPc6ZqMNOQF5cT9rNsrB3eKLJ+IE8
 qeXmyrBI71E5eTgAFt5AEhrdb2VF3ioYHEnE5hD/p4P4eU4t56jbxvG7+AzzRA9O1ykPFuStktP
 FvVs24RzrrlIE3Ciy7g==
X-Authority-Analysis: v=2.4 cv=Xfq5Co55 c=1 sm=1 tr=0 ts=6a8eb72c cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=CbeJ011b9i7gwIzP_X4A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA4MSBTYWx0ZWRfX/zGZdXN/kpTm
 Fd/aOuPZ0hbvpUQT2M76DzO3W3P7mpIgXzO3sHzc9OZC3cciGbT6QILpSQfXTEmQdzOhzQWX9h0
 jklA5FaplzaNzNmAOm/HBIa47UFsCUc=
X-Proofpoint-ORIG-GUID: OQCbJ0G9UwA_iDdEs1IOwsDbujcDQYKx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_02,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260081

The I2C_BUS_CLEAR and I2C_STOP_ON_BUS GENI sequencer opcodes release a
stuck I2C bus, but the GPI DMA driver has no way to emit these
zero-payload control commands, so an I2C controller using GPI DMA
cannot recover the bus.

Add I2C_BUS_CLEAR and I2C_STOP_ON_BUS to enum i2c_op so I2C drivers can
request them through gpi_i2c_config.op. Handle them in
gpi_create_i2c_tre() by emitting a CONFIG TRE (when set_config is set)
followed by a GO TRE with IEOT set and no DMA TRE, and reserve the
matching number of ring entries in gpi_prep_slave_sg().

Signed-off-by: Aniket Randive <aniket.randive@oss.qualcomm.com>
---
 drivers/dma/qcom/gpi.c           | 30 ++++++++++++++++++++++++++++++
 include/linux/dma/qcom-gpi-dma.h |  2 ++
 2 files changed, 32 insertions(+)

diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
index a5055a6273af..14a74f0a602d 100644
--- a/drivers/dma/qcom/gpi.c
+++ b/drivers/dma/qcom/gpi.c
@@ -1620,6 +1620,17 @@ gpi_peripheral_config(struct dma_chan *chan, struct dma_slave_config *config)
 	return 0;
 }
 
+static void gpi_create_i2c_go_recovery_tre(struct gpi_i2c_config *i2c,
+					   struct gpi_tre *tre)
+{
+	tre->dword[0] = u32_encode_bits(i2c->op, TRE_I2C_GO_CMD);
+	tre->dword[1] = 0;
+	tre->dword[2] = 0;
+
+	tre->dword[3] = u32_encode_bits(TRE_TYPE_GO, TRE_FLAGS_TYPE);
+	tre->dword[3] |= u32_encode_bits(1, TRE_FLAGS_IEOT);
+}
+
 static int gpi_create_i2c_tre(struct gchan *chan, struct gpi_desc *desc,
 			      struct scatterlist *sgl, enum dma_transfer_direction direction,
 			      unsigned long flags)
@@ -1650,6 +1661,12 @@ static int gpi_create_i2c_tre(struct gchan *chan, struct gpi_desc *desc,
 		tre->dword[3] |= u32_encode_bits(1, TRE_FLAGS_CHAIN);
 	}
 
+	if (i2c->op == I2C_BUS_CLEAR || i2c->op == I2C_STOP_ON_BUS) {
+		gpi_create_i2c_go_recovery_tre(i2c, &desc->tre[tre_idx]);
+		tre_idx++;
+		goto log_tre;
+	}
+
 	/* create the GO tre for Tx */
 	if (i2c->op == I2C_WRITE) {
 		tre = &desc->tre[tre_idx];
@@ -1692,6 +1709,7 @@ static int gpi_create_i2c_tre(struct gchan *chan, struct gpi_desc *desc,
 			tre->dword[3] |= u32_encode_bits(1, TRE_FLAGS_BEI);
 	}
 
+log_tre:
 	for (i = 0; i < tre_idx; i++)
 		dev_dbg(dev, "TRE:%d %x:%x:%x:%x\n", i, desc->tre[i].dword[0],
 			desc->tre[i].dword[1], desc->tre[i].dword[2], desc->tre[i].dword[3]);
@@ -1825,6 +1843,18 @@ gpi_prep_slave_sg(struct dma_chan *chan, struct scatterlist *sgl,
 		nr_tre = 2;
 	if (direction == DMA_DEV_TO_MEM) /* rx */
 		nr_tre = 1;
+	/*
+	 * Recovery opcodes do not require DMA data TREs, only CONFIG
+	 * (for set_config) and GO TREs. Since gpi_prep_slave_sg() is
+	 * shared with SPI, verify the channel is I2C before accessing
+	 * the configuration data.
+	 */
+	if (gchan->protocol == QCOM_GPI_I2C) {
+		struct gpi_i2c_config *i2c = gchan->config;
+
+		if (i2c->op == I2C_BUS_CLEAR || i2c->op == I2C_STOP_ON_BUS)
+			nr_tre = set_config ? 2 : 1;
+	}
 
 	/* calculate # of elements required & available */
 	nr = gpi_ring_num_elements_avail(ch_ring);
diff --git a/include/linux/dma/qcom-gpi-dma.h b/include/linux/dma/qcom-gpi-dma.h
index 332be28427e4..b9b75c302825 100644
--- a/include/linux/dma/qcom-gpi-dma.h
+++ b/include/linux/dma/qcom-gpi-dma.h
@@ -52,6 +52,8 @@ struct gpi_spi_config {
 enum i2c_op {
 	I2C_WRITE = 1,
 	I2C_READ,
+	I2C_BUS_CLEAR = 6,
+	I2C_STOP_ON_BUS,
 };
 
 /**

-- 
2.34.1

