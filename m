Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB2F346E6C
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 06:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784183951; cv=none; b=mAxHYfpVoJEpGBrBQOT5xWXEDzxvW1DOvOSYnr3xqkcE0lzOcwZf58yWJSetUQMsGVXD6KP2hSFZD+GzxfJXs9v59h7Cp1MW0jt3rPjtxKGpAiGO9GrP49EBPOh9L11MYFY8oGCqQombeea9fDL3cKl0QbmvdLssnXyg9GlfiWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784183951; c=relaxed/simple;
	bh=uqzz3N+P6+FNeoSvCQyuRHyX3pwmPddM0+AKGis1MLM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lgy+ZNbuKGx//m98EatFnyYBD4G91q0PSdXf+aFlP1k7BNjitmLLB2FawIOnVxo5W/3xAWy7QxM/Cb/FY2Tr0434Y9mTrJQM2yB3K9yVbnZdDsNdiC0WYvDaJl+13j+5caVWi+10moK2yjPjDpOCLEu4ypqM/myr9lR/st2tF0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j1mjbVXk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IEfZKZyg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j1mjbVXk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IEfZKZyg"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G3wNeV1299369
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 06:39:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	skp8VRIl4KbIukNLkOh6qeVxvl4TbXnB0PjjVXS77sA=; b=j1mjbVXkaM5A8Nc2
	+1MH+xcyFC4pPa1j1+hsA9HR3iBc6hsYB6HPmPa6I5ZHm2FexREEOnyNOObIhL+u
	2XBOeOUAQxYudKAvyy6lZvtT/PG7dqPa3akJsIFGFkpC5yTvOngU/+6iUVIFtZuK
	F1DxblXhhjJPYDUH4nVh2rUh56OznPIcl81CB7C2y7zLmsVS1P5EPhAGvU2A2INa
	lZ7OPrLk744oGG7Hg3vnsd/rhBrH3Aelo9DAqaga3hao5hwZN27thV55yMlTFZED
	Wf5+gFqrjh6dQ7LyYAir1BwW0XhyH2ZBSn+IIwaY8j59HNVwCXSiy3IZHA8YMDYP
	Uo0ocA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fed062ywe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 06:39:09 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-848452dd146so7206954b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 23:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784183948; x=1784788748; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=skp8VRIl4KbIukNLkOh6qeVxvl4TbXnB0PjjVXS77sA=;
        b=IEfZKZygzlbv5iIsXw+7+EBb4+zzWs/9tBBN5e1pD0/w6qxAxsg8VSU4qIo+E3VOfs
         C73J4EDN4cDD5LUEcJ3u+8o/orMGCRywlrpTUSF1i0dq0BqVBRFcgrHdOKv9iJhaQf0M
         GCm6YwAKSb7i2dAtJOcKAniLwUi1tS8toOW9/JWUgOBwv6UCB3dc9huuOSslRYC+Qwfu
         3HBgGhpTueLRSx3sLKsbmf3auxnUGlGWkm2XFDUtFEdFYsmquVAMywBIdqTIopbEjGNi
         eoYgL1XUsaa4iE94scOMwo0j69KG4ypiEqT3i8M2nuxJW+F84VzS6HwYkAZqeMCGmXA5
         J6Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784183948; x=1784788748;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=skp8VRIl4KbIukNLkOh6qeVxvl4TbXnB0PjjVXS77sA=;
        b=YNBwdOHTwq3cOOZnLyfcRMsS4iyjlxjLAlIX9Dk7dnjS8ER8UDlGNX93yc+VW0hCdY
         6DyHstAWm4dGAIGN1qhp5zkL98JmrJeWwH+lfHK72DYt5E1jWKtvpft6QSN7b8aZLp2J
         3g8hGZZQXup3NSD4CtYxTXlzJe6SOOm2WL6AzRuRwZlmo49JJBL1pXmlLaTFzanPQW3j
         kCH6FyJsTpR28E9uU/ui1BfOS8AAlTf51zeUYvlc8+B4CBN3Yo9w618RJBxlDugULVop
         nBUHwaxoptUcXGLqOoVKdz9fu04ImFW/g1hl5HtDMOqP6vF1/u8x33TKOe/xs7ng83K3
         hF/g==
X-Gm-Message-State: AOJu0Yy6pxoCK6YtgHSbziWXVwzN2t3kK1k3C6vRt6VfQFowrfhUslVA
	b4d6PuBSOgCmtO5ECexfuhnpfldcMut2nCeHr6ACKotIRuvpaySiRWb87YeurlLn+rbpgwkyVkz
	5hfIypvBBoHqzWmrEDCv5CXjj8WG5NtIQZdAbd8b/dWp79dVAV/dt0slTNctvykwIU3ik
X-Gm-Gg: AfdE7cnf6B+3AwAjzVwn4epmaAPPzckPP3X5X7qY6KxGm8BArCsB2nIKUyb3Qrv2F+f
	qN7THyKJCe20eV5CYpC3N99YPWj8GwokIGgFkzqITvsPTHTL68pGLFW0epFXS1uHSVGUQudwOd5
	Ew9LuHcjzS1GmCW60LoBnjxr943mLWZ/OXNHsEwsMsqxMRU+txsEnmZfOSMQOE1vy6TOrRfYyN/
	GZkwquqG90380XHpZF3qE2CGt22g8t033Q5oCuUVTBfbwkWn+iZu8ph6wx6crJsSFkRqkQO4Gwt
	kKZIRXXqY7J8NI3K+9f0x/z3hr1JDWZVVmjU+fgr6nTC8VZbK0AbUszmK4b1NvOwZkvXEArImox
	qDtKgLq/y7uAtw9wPFQciRw6yKfS1jT/u4A==
X-Received: by 2002:a05:6a00:9501:b0:848:50a5:a70b with SMTP id d2e1a72fcca58-8488962feb7mr20031115b3a.21.1784183948384;
        Wed, 15 Jul 2026 23:39:08 -0700 (PDT)
X-Received: by 2002:a05:6a00:9501:b0:848:50a5:a70b with SMTP id d2e1a72fcca58-8488962feb7mr20031095b3a.21.1784183947835;
        Wed, 15 Jul 2026 23:39:07 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cb258eb82desm1320870a12.2.2026.07.15.23.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 23:39:07 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 12:08:45 +0530
Subject: [PATCH v3 3/3] i2c: qcom-geni: distinguish address-phase and
 data-phase NACK
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260716-fix_cancel_sequence_on_failure_for_i2c-v3-3-9091315a33a0@oss.qualcomm.com>
References: <20260716-fix_cancel_sequence_on_failure_for_i2c-v3-0-9091315a33a0@oss.qualcomm.com>
In-Reply-To: <20260716-fix_cancel_sequence_on_failure_for_i2c-v3-0-9091315a33a0@oss.qualcomm.com>
To: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Naresh Maramaina <naresh.maramaina@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784183935; l=4780;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=uqzz3N+P6+FNeoSvCQyuRHyX3pwmPddM0+AKGis1MLM=;
 b=IOn7XZAr/KGNzDe8dYlDpdJ/MJmxxl7rMDtaWjHPdO7jBcZrf8orkmLIYwPj4bdZxNAq8VJbn
 S0PukxN2YvxA3UQwmN+GGoyiZ9+4mQDJtaTxzDCwM9w23UKEh089yTc
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDA2NyBTYWx0ZWRfX1kbTqBN4jdO/
 JlWMdYLRVeNAZ+asZ+kOvQ3pFXguM7OWxtyow7NpKTKcZxvLnuNHOwtw//UOAn512njXiyJvXMW
 k3HhO+jmasE2d/D5++vgGxzwD3RsNEs=
X-Proofpoint-GUID: 31tj4PhvoLoHPMaaAUQFKdJmpF5Af3kP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDA2NyBTYWx0ZWRfX6HRTnrgq+MSw
 wcr5PrkfZ2ukzasYDJparFblqaJy0zOgcfaBcpwV18a9yCPwaA+W/Vm/hf7ugoIvvVrjaskljAs
 ZTV3HqDCDAtGpthIbroG/TtYSwynp9fXxei+mlc4z4vqlhwIQUs3uoAaFhr7ewdU9UG61oPeJMw
 jpPQhD+BBn5Y9MnS2x0T2r0J6yvgqGo+LUR19/IDmrNznXyBlHt4GTeVxlxZnISY1wLvOIiijtO
 MmFUu4SbckWWGTUGvW1lE9FsSJQBdhiX15J+Zt6ZgGPdtIYs+8XYXEMVuDI8mqUY3GdGIYl9jg7
 Jd4fXAIh4jX1Q9CdA73xBU0qT6DMDxU2KeX3sSP0+K6jhwILdsbc2tosXm9RLc21eUDhslRhLRa
 sSa6d4789pEOL6ag9vP0pktToI0B8bQAMaP47BRCKOGNKR19jhHeWZRPFAyI4EpZigZZwV8ZpUg
 WyiuzoxrCdCw1xg8z1Q==
X-Authority-Analysis: v=2.4 cv=Xb25Co55 c=1 sm=1 tr=0 ts=6a587c8d cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=wcK_sNrN2goZDBkbqrQA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: 31tj4PhvoLoHPMaaAUQFKdJmpF5Af3kP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160067

The M_GP_IRQ_1 interrupt signals a NACK condition, but does not
distinguish whether it occurred during the address phase or the data
phase.  The driver always attempted cancel and DMA FSM reset on any
NACK, which is incorrect for an address NACK since the DMA engine was
never armed and the hardware requires no recovery.

Add geni_i2c_check_addr_data_nack() to distinguish the two cases by
reading SE_GENI_M_GP_LENGTH after the NACK event.  A zero value means
the address phase was NACKed (ADDR_NACK) and no DMA recovery is needed.
A non-zero value on a write transfer means a data byte was NACKed
(DATA_NACK) and the normal cancel and DMA FSM reset path must run.

Co-developed-by: Naresh Maramaina <naresh.maramaina@oss.qualcomm.com>
Signed-off-by: Naresh Maramaina <naresh.maramaina@oss.qualcomm.com>
Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 29 ++++++++++++++++++++---------
 1 file changed, 20 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 9490aee4928c..c8562c06bf74 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -56,7 +56,8 @@
 
 enum geni_i2c_err_code {
 	GP_IRQ0,
-	NACK,
+	ADDR_NACK,
+	DATA_NACK,
 	GP_IRQ2,
 	BUS_PROTO,
 	ARB_LOST,
@@ -67,7 +68,7 @@ enum geni_i2c_err_code {
 	GENI_TIMEOUT,
 };
 
-#define DM_I2C_CB_ERR		((BIT(NACK) | BIT(BUS_PROTO) | BIT(ARB_LOST)) \
+#define DM_I2C_CB_ERR		((BIT(ADDR_NACK) | BIT(BUS_PROTO) | BIT(ARB_LOST)) \
 									<< 5)
 
 #define I2C_AUTO_SUSPEND_DELAY	250
@@ -143,7 +144,8 @@ struct geni_i2c_err_log {
 
 static const struct geni_i2c_err_log gi2c_log[] = {
 	[GP_IRQ0] = {-EIO, "Unknown I2C err GP_IRQ0"},
-	[NACK] = {-ENXIO, "NACK: slv unresponsive, check its power/reset-ln"},
+	[ADDR_NACK] = {-ENXIO, "NACK: target device unresponsive, check its power/reset-ln"},
+	[DATA_NACK] = {-EIO, "Data NACK: TX transfer NACK"},
 	[GP_IRQ2] = {-EIO, "Unknown I2C err GP IRQ2"},
 	[BUS_PROTO] = {-EPROTO, "Bus proto err, noisy/unexpected start/stop"},
 	[ARB_LOST] = {-EAGAIN, "Bus arbitration lost, clock line undriveable"},
@@ -258,7 +260,8 @@ static void geni_i2c_err(struct geni_i2c_dev *gi2c, int err)
 
 	switch (err) {
 	case GENI_ABORT_DONE:
-	case NACK:
+	case ADDR_NACK:
+	case DATA_NACK:
 	case GENI_TIMEOUT:
 		dev_dbg(gi2c->se.dev, "%s\n", gi2c_log[err].msg);
 		break;
@@ -269,6 +272,14 @@ static void geni_i2c_err(struct geni_i2c_dev *gi2c, int err)
 	}
 }
 
+static void geni_i2c_check_addr_data_nack(struct geni_i2c_dev *gi2c)
+{
+	if (!readl_relaxed(gi2c->se.base + SE_GENI_M_GP_LENGTH))
+		geni_i2c_err(gi2c, ADDR_NACK);
+	else if (!(gi2c->cur->flags & I2C_M_RD))
+		geni_i2c_err(gi2c, DATA_NACK);
+}
+
 static irqreturn_t geni_i2c_irq(int irq, void *dev)
 {
 	struct geni_i2c_dev *gi2c = dev;
@@ -294,7 +305,7 @@ static irqreturn_t geni_i2c_irq(int irq, void *dev)
 	    m_stat & (M_CMD_FAILURE_EN | M_CMD_ABORT_EN) ||
 	    dm_rx_st & (DM_I2C_CB_ERR)) {
 		if (m_stat & M_GP_IRQ_1_EN)
-			geni_i2c_err(gi2c, NACK);
+			geni_i2c_check_addr_data_nack(gi2c);
 		if (m_stat & M_GP_IRQ_3_EN)
 			geni_i2c_err(gi2c, BUS_PROTO);
 		if (m_stat & M_GP_IRQ_4_EN)
@@ -443,7 +454,7 @@ static void geni_i2c_rx_msg_cleanup(struct geni_i2c_dev *gi2c,
 {
 	gi2c->cur_rd = 0;
 	if (gi2c->dma_buf) {
-		if (gi2c->err)
+		if (gi2c->err && gi2c->err != gi2c_log[ADDR_NACK].err)
 			geni_i2c_rx_fsm_rst(gi2c);
 		geni_se_rx_dma_unprep(&gi2c->se, gi2c->dma_addr, gi2c->xfer_len);
 		i2c_put_dma_safe_msg_buf(gi2c->dma_buf, cur, !gi2c->err);
@@ -455,7 +466,7 @@ static void geni_i2c_tx_msg_cleanup(struct geni_i2c_dev *gi2c,
 {
 	gi2c->cur_wr = 0;
 	if (gi2c->dma_buf) {
-		if (gi2c->err)
+		if (gi2c->err && gi2c->err != gi2c_log[ADDR_NACK].err)
 			geni_i2c_tx_fsm_rst(gi2c);
 		geni_se_tx_dma_unprep(&gi2c->se, gi2c->dma_addr, gi2c->xfer_len);
 		i2c_put_dma_safe_msg_buf(gi2c->dma_buf, cur, !gi2c->err);
@@ -493,7 +504,7 @@ static int geni_i2c_rx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
 
 	cur = gi2c->cur;
 	time_left = wait_for_completion_timeout(&gi2c->done, XFER_TIMEOUT);
-	if (!time_left)
+	if (!time_left || (gi2c->err && gi2c->err != gi2c_log[ADDR_NACK].err))
 		geni_i2c_cancel_xfer(gi2c);
 
 	geni_i2c_rx_msg_cleanup(gi2c, cur);
@@ -535,7 +546,7 @@ static int geni_i2c_tx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
 
 	cur = gi2c->cur;
 	time_left = wait_for_completion_timeout(&gi2c->done, XFER_TIMEOUT);
-	if (!time_left)
+	if (!time_left || (gi2c->err && gi2c->err != gi2c_log[ADDR_NACK].err))
 		geni_i2c_cancel_xfer(gi2c);
 
 	geni_i2c_tx_msg_cleanup(gi2c, cur);

-- 
2.34.1

