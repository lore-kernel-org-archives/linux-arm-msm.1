Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794198548;
	b=KLKGmcTsNyiypYK33wgT6NLuTaX/c1ivPSoGjgvZ+SBky/IMAAQNeKP8h/9T+sHOZMBY
	 wU4dZI3oAOCwLydJV+5lBTvHTdGB2T815o5fE0nLiz/ioGCKxTXX3cHVKMAV3fxuikazP
	 Dy8f6DS/jFlKMXYGna2We7Z6xjFzVirb4X422W92e9jeNB+AOE0gpXMu8wtIpVioTsMQM
	 cnWsY9PGqM4hu/0PRVF2ncJT8k6nmenRIO/YsVRxkvnuCS2E8VAi6KessxkGB8U5lz80E
	 VcsgQ7BKljPPZfR7eAzHVOvmyLP5HLFwPKOc/FkTBw2opg8Bp5cgM5//pK14OC6utJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794198548;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=YM0f3m2/C2F8/tCj/qbgeO+duG5wNt4qmYcp5dYQS9k=;
	b=nHLDS6dSjTQSR0auM//J779ISomaDa5skD/cHe+xCtspAl+fMb7ljBB7AIHMdgoRDE39
	 tR0ajpCXOXzyLr3V+uKB0RSZsQGmt8rkHKqcG12VjpcoR5UiB2c7DFsXQbv8ggHbhaE+w
	 Lfc3H9rMQvAxiwE89ZqYxxvwcC6RlpeQKbhCR7fpNZ00UgAGaswjpj6OnYwoMXsBMsE1v
	 NLX6gdYt4ic7RZU+xBEfUcJmAOIY+RBknm+Dq8QxYPSNaUZWoJtH02bZviB/aac/K+wBr
	 QsfXoBEGn/rzu+GBdMd8R6xLyIv6ULg8TPfwL9H5fwbc/kl4MkDLNItlX6vkuWMnLgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F7qrLUDI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=icXJW+De;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B105606A334
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 04:29:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B105606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F7qrLUDI;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=icXJW+De
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A93KMXr2310077
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Nov 2026 04:29:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YM0f3m2/C2F8/tCj/qbgeO+duG5wNt4qmYcp5dYQS9k=; b=F7qrLUDI5b0CLn9R
	axG4KYaWlKoNMbhWyudCb5UXbYBxY71xwya0z1sjPdvz0TjnCIc5IzJAXTQmxJ6S
	KJsbYHRh6SfbDu839V3wBgTrrOhFPky+0AgsewOWmYZztwgPfEC5qKCnZE1veTts
	1JDF2NAyeMSha28AoqRWrnPba5P45cIJJhvQ2xc7Aq/Pts9TRbkfxD965h2CnFoj
	qZUC9ZVSDqM5wsl0PWRg7jWMrlifm1HsK2FBxVMv5WzYfOBeryIbaROu5xXrgm/M
	zz3OuiNkvmFcg3IKN3Aw1mSGftND5hoU8xN9UX1Xn7rwUt/w8JOEaOdK9nho5hA4
	Fxp47A==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsw99metn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 04:29:07 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1b25dc2aa8bso1314247c88.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Nov 2026 20:29:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794198547; x=1794803347; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YM0f3m2/C2F8/tCj/qbgeO+duG5wNt4qmYcp5dYQS9k=;
        b=icXJW+De8FStbek36SUrOt7btTnQiiwWg1h3mEKOROxt7N/PvHYmKFyGwp55YkLWw0
         mZcnbQ1wuHKPxo7cQasGJU6eZVnV2TDKB+GNgZS1ANN7bfjen5EDllo/tWMH1b2b3qQ5
         HQ5mxo6dlmtgKoB6nAKtLsLaRwGwoDb5bQGCLnG/2prItlJvNEOktLEA51WlqQS1cONJ
         rZe3E2+lHxg0k4jmdTL0UvFWq8UqdkzCx1fxzleeGKuVvaPpvMEJbNQVg6QBQ6w6V7Yr
         POu9td2gMypVqSKe/Qupm96e8jjz/d39JnRaYd7sPqfEfVpYuflLqHRJpXk++PDJVaHK
         uZrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794198547; x=1794803347;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YM0f3m2/C2F8/tCj/qbgeO+duG5wNt4qmYcp5dYQS9k=;
        b=pqc0y2cqPfRQYSTu8cP+Wcm3CJjaafkTLOChxPwbvX81lCXIMVgnK1ZSvZvAl/8uUU
         zDdTE3WbZAVreCU4Eq3quQQ7do/057WyIHIKv8yc6OdUUPlCWH5z6wkwfCna33ZRF/eQ
         I3qymTknpH3MsNWk5W1U13mFM3ERLjg2PCDKOd8d55jI8E5NSKRHnJFRLDlZrzxi8z+Q
         EjKBBOtwBxTs7Er6hb/QhUJXdeNlu5rtJeotEfTPtIoFy1se2p3mCqfxcsozCNumimzE
         xB6pII/FaU4H0VbIZRQmnt6Bd8FAxMDc5awQp2fBzOszIejP1bcTCJRU4Ip6aNPPmddn
         O6Pw==
X-Forwarded-Encrypted: i=1; AL+hErFTfU2YEI2mBGWuv4Nqg54k9Jnl/PdU6FlYkC7s3Lzkro882HA7mXwcex4ID67j2lIsfxRXbyhNrN0A3Shj@vger.kernel.org
X-Gm-Message-State: APuU4Z/b7/0IMcpz31FuKPRkyBYl0zkClxYtdJGd+LzFsbAS4irkiszs
	EVGobqRaaT1k9cquUT8i56cIWl5S6KzMGEZU+PyVyaI/SYqgA5+Wv36+wvmX/QHnS8V8LrmwUjH
	HJtn5E7Fl3nzzeaAiB2QyprlbxLiU+hnG9M+8xRfFLuorHoQw9WPJHRhhgqVLOxw1L82Z
X-Gm-Gg: AYBFou2yr8POQTAUEOxFeTJJ9AeQb3+p7AWPc8sE5Ye/bJmVV/Pognb3G+ggx2MB/w4
	bQZJZbf952jyR6Ryd2WILiAyq1q94uY5nATETlns3x24bJBFZSuFaXhjPOw3CdlCVKK9P20KixN
	U9ZbKrXDmPrRrI6Rz4DFwHvoMsmSlB10UfIr6LmgA26F0Q9u99921iD35W2Km0eWQIDJdVMQ8jY
	NwzvqeFAh4EIJUB6Djq/NxnTZmh3nij1hizCdwrJT7cw8Cz9QXnX5kB5kqbxQquQa4Fl8j/XpEL
	NpC0j86gfhmO/7pWV348t7MjPMQNabPc5YtP5nD1GUUZ58QW6PpwZRa/85ig8ZedsnkWdVkH6i+
	ZDd3FIbwWb0aDTlpFCvzqZx8VryiIUzEXa+lzKHGdO+spLw9znLAFs7J2KB9+h1q3H8vqLR0Mzh
	ctzB/SUg==
X-Received: by 2002:a05:701b:260d:b0:1a7:99b9:2eb9 with SMTP id a92af1059eb24-1b39feb35dcmr4138786c88.27.1794198546956;
        Sun, 08 Nov 2026 20:29:06 -0800 (PST)
X-Received: by 2002:a05:701b:260d:b0:1a7:99b9:2eb9 with SMTP id a92af1059eb24-1b39feb35dcmr4138734c88.27.1794198546196;
        Sun, 08 Nov 2026 20:29:06 -0800 (PST)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3773ea50asm8995525c88.23.2026.11.08.20.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 20:29:05 -0800 (PST)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Mon, 09 Nov 2026 09:58:50 +0530
Subject: [PATCH v4 2/2] dmaengine: qcom: gpi: Convert dev_dbg() calls to
 tracepoints
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
Message-Id: <20261109-add-trace-support-gpio-v4-2-85ed08134917@oss.qualcomm.com>
References: <20261109-add-trace-support-gpio-v4-0-85ed08134917@oss.qualcomm.com>
In-Reply-To: <20261109-add-trace-support-gpio-v4-0-85ed08134917@oss.qualcomm.com>
To: konrad.dybcio@oss.qualcomm.com, Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: chandana.chiluveru@oss.qualcomm.com, mukesh.savaliya@oss.qualcomm.com,
        linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794198532; l=7514;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=4wRZCXtigt26zNHBmDO+ShfDnkW+Xn6ElfCDWCX1llk=;
 b=0brtse2DK4o1h/dcHoVfwictwc1C7r6umyuEOVWqqfm3sg0BjNJEml+h9P5gxeO0oMLjdNDrM
 GrGgTgO9vT1C3bvUFPRbVa32acfLE1MkCl+RQHqBD5VXpJxzsU9ehYm
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-ORIG-GUID: jkbAPat_0TBipUQq9URHb63X0MQy0X0m
X-Proofpoint-GUID: jkbAPat_0TBipUQq9URHb63X0MQy0X0m
X-Authority-Analysis: v=2.4 cv=CMq/zhrD c=1 sm=1 tr=0 ts=6af14c13 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=aSNI5RSwOxee8bqK_isA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAxNyBTYWx0ZWRfX++l9hCsTdJeC
 ZwWB+2X+wAJNmUiRCgp1Me3rPWX6FmXqGhHsqDIbH38sd4Ov2cmYrqQDatpOG0kKmucy/TbZEWE
 ogA8FkTZAsJM+ATEEadeOka0yqmaKy2T3kTdwGyNUpAr6gM2FaZhwcduFW/jhPu0Y8zTFe+172w
 zHgcKU9YylFjLR9mzFTPDmqvIkWZwTohfQzEfBooTQ8TDl0jRhMEsb6pAqJSexE9k92NeIzf5Xj
 3fqLEKMqHMEBBoJncCajJxAw19zbvcMAWwCIutQ/c+iEh8ISLmuWk3G04ptO/VSVdXk3AGbiW33
 H/IFSvlNbhvtF0l9OxKF89VPNAonXYWKPf4MccywZ7RHHKyPFgSvxvNTgCcv2T+8Qtoa8QsfDAB
 Ujs9mpWYBR2JLCCRN5O5xJ++c6BxbtiUReNGA5bNJqynt2CGWZvrEfc0MTkYaY76Pw4JrrwQUsw
 YqP1p3eBstJ63bmjDkA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAxNyBTYWx0ZWRfXzH3rpTx4pZKK
 PQiXj9qzgZEYShSZyUNb0790h72i9d7ZOE7xiMmf3aiJSfiMc6T5o/Y9+EVTPyzB6uCJG/mZhYv
 8zoLdQTYheCsNhzFMj0dqbzPa2ui2UA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 adultscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090017

Replace the remaining dev_dbg() based debug logging in the GPI DMA
driver with the qcom_gpi tracepoints, providing structured runtime
visibility into GPI DMA behavior without requiring invasive debug
patches. dev_err() calls are left untouched.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/dma/qcom/gpi.c | 59 +++++++++++++++-----------------------------------
 1 file changed, 17 insertions(+), 42 deletions(-)

diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
index fafe6ac848d9..8f9e55e52c61 100644
--- a/drivers/dma/qcom/gpi.c
+++ b/drivers/dma/qcom/gpi.c
@@ -684,8 +684,6 @@ static int gpi_send_cmd(struct gpii *gpii, struct gchan *gchan,
 	if (IS_CHAN_CMD(gpi_cmd))
 		chid = gchan->chid;
 
-	dev_dbg(gpii->gpi_dev->dev,
-		"sending cmd: %s:%u\n", TO_GPI_CMD_STR(gpi_cmd), chid);
 	trace_gpi_send_cmd(gpii->gpi_dev->dev, chid, gpi_cmd, TO_GPI_CMD_STR(gpi_cmd));
 
 	/* send opcode and wait for completion */
@@ -797,7 +795,7 @@ static void gpi_process_gen_err_irq(struct gpii *gpii)
 	u32 irq_stts = gpi_read_reg(gpii, gpii->regs + offset);
 
 	/* clear the status */
-	dev_dbg(gpii->gpi_dev->dev, "irq_stts:0x%x\n", irq_stts);
+	trace_gpi_gen_err_irq(gpii->gpi_dev->dev, gpii_id, irq_stts);
 
 	/* Clear the register */
 	offset = GPII_n_CNTXT_GPII_IRQ_CLR_OFFS(gpii_id);
@@ -866,8 +864,6 @@ static irqreturn_t gpi_handle_irq(int irq, void *data)
 			u32 ev_state;
 			u32 ev_ch_irq;
 
-			dev_dbg(gpii->gpi_dev->dev,
-				"processing EV CTRL interrupt\n");
 			offset = GPII_n_CNTXT_SRC_EV_CH_IRQ_OFFS(gpii_id);
 			ev_ch_irq = gpi_read_reg(gpii, gpii->regs + offset);
 
@@ -887,15 +883,15 @@ static irqreturn_t gpi_handle_irq(int irq, void *data)
 				ev_state = DEFAULT_EV_CH_STATE;
 
 			gpii->ev_state = ev_state;
-			dev_dbg(gpii->gpi_dev->dev, "setting EV state to %s\n",
-				TO_GPI_EV_STATE_STR(gpii->ev_state));
+			trace_gpi_ev_ctrl_irq(gpii->gpi_dev->dev, gpii_id, ev_ch_irq,
+					      gpii->ev_state,
+					      TO_GPI_EV_STATE_STR(gpii->ev_state));
 			complete_all(&gpii->cmd_completion);
 			type &= ~(GPII_n_CNTXT_TYPE_IRQ_MSK_EV_CTRL);
 		}
 
 		/* channel control irq */
 		if (type & GPII_n_CNTXT_TYPE_IRQ_MSK_CH_CTRL) {
-			dev_dbg(gpii->gpi_dev->dev, "process CH CTRL interrupts\n");
 			gpi_process_ch_ctrl_irq(gpii);
 			type &= ~(GPII_n_CNTXT_TYPE_IRQ_MSK_CH_CTRL);
 		}
@@ -945,17 +941,10 @@ static void gpi_process_imed_data_event(struct gchan *gchan,
 		struct gpi_tre *gpi_tre;
 
 		spin_unlock_irqrestore(&gchan->vc.lock, flags);
-		dev_dbg(gpii->gpi_dev->dev, "event without a pending descriptor!\n");
 		gpi_ere = (struct gpi_ere *)imed_event;
-		dev_dbg(gpii->gpi_dev->dev,
-			"Event: %08x %08x %08x %08x\n",
-			gpi_ere->dword[0], gpi_ere->dword[1],
-			gpi_ere->dword[2], gpi_ere->dword[3]);
 		gpi_tre = tre;
-		dev_dbg(gpii->gpi_dev->dev,
-			"Pending TRE: %08x %08x %08x %08x\n",
-			gpi_tre->dword[0], gpi_tre->dword[1],
-			gpi_tre->dword[2], gpi_tre->dword[3]);
+		trace_gpi_ev_no_desc(gpii->gpi_dev->dev, imed_event->chid,
+				     gpi_ere->dword, gpi_tre->dword);
 		return;
 	}
 	gpi_desc = to_gpi_desc(vd);
@@ -1064,11 +1053,10 @@ static void gpi_process_xfer_compl_event(struct gchan *gchan,
 		dev_err(gpii->gpi_dev->dev, "Error in Transaction\n");
 		result.result = DMA_TRANS_ABORTED;
 	} else {
-		dev_dbg(gpii->gpi_dev->dev, "Transaction Success\n");
 		result.result = DMA_TRANS_NOERROR;
 	}
 	result.residue = gpi_desc->len - compl_event->length;
-	dev_dbg(gpii->gpi_dev->dev, "Residue %d\n", result.residue);
+	trace_gpi_xfer_result(gpii->gpi_dev->dev, chid, result.result, result.residue);
 
 	dma_cookie_complete(&vd->tx);
 	dmaengine_desc_get_callback_invoke(&vd->tx, &result);
@@ -1100,11 +1088,8 @@ static void gpi_process_events(struct gpii *gpii)
 			chid = gpi_event->xfer_compl_event.chid;
 			type = gpi_event->xfer_compl_event.type;
 
-			dev_dbg(gpii->gpi_dev->dev,
-				"Event: CHID:%u, type:%x %08x %08x %08x %08x\n",
-				chid, type, gpi_event->gpi_ere.dword[0],
-				gpi_event->gpi_ere.dword[1], gpi_event->gpi_ere.dword[2],
-				gpi_event->gpi_ere.dword[3]);
+			trace_gpi_process_event(gpii->gpi_dev->dev, chid, type,
+						gpi_event->gpi_ere.dword);
 
 			switch (type) {
 			case XFER_COMPLETE_EV_TYPE:
@@ -1113,7 +1098,6 @@ static void gpi_process_events(struct gpii *gpii)
 							     &gpi_event->xfer_compl_event);
 				break;
 			case STALE_EV_TYPE:
-				dev_dbg(gpii->gpi_dev->dev, "stale event, not processing\n");
 				break;
 			case IMMEDIATE_DATA_EV_TYPE:
 				gchan = &gpii->gchan[chid];
@@ -1121,11 +1105,8 @@ static void gpi_process_events(struct gpii *gpii)
 							    &gpi_event->immediate_data_event);
 				break;
 			case QUP_NOTIF_EV_TYPE:
-				dev_dbg(gpii->gpi_dev->dev, "QUP_NOTIF_EV_TYPE\n");
 				break;
 			default:
-				dev_dbg(gpii->gpi_dev->dev,
-					"not supported event type:0x%x\n", type);
 			}
 			gpi_ring_recycle_ev_element(ev_ring);
 		}
@@ -1409,10 +1390,8 @@ static int gpi_alloc_ring(struct gpi_ring *ring, u32 elements,
 		bit++;
 	len = 1 << bit;
 	ring->alloc_size = (len + (len - 1));
-	dev_dbg(gpii->gpi_dev->dev,
-		"#el:%u el_size:%u len:%u actual_len:%llu alloc_size:%zu\n",
-		  elements, el_size, (elements * el_size), len,
-		  ring->alloc_size);
+	trace_gpi_alloc_ring(gpii->gpi_dev->dev, elements, el_size,
+			     (elements * el_size), len, ring->alloc_size);
 
 	ring->pre_aligned = dma_alloc_coherent(gpii->gpi_dev->dev,
 					       ring->alloc_size,
@@ -1437,10 +1416,8 @@ static int gpi_alloc_ring(struct gpi_ring *ring, u32 elements,
 	/* update to other cores */
 	smp_wmb();
 
-	dev_dbg(gpii->gpi_dev->dev,
-		"phy_pre:%pad phy_alig:%pa len:%u el_size:%u elements:%u\n",
-		&ring->dma_handle, &ring->phys_addr, ring->len,
-		ring->el_size, ring->elements);
+	trace_gpi_ring_info(gpii->gpi_dev->dev, ring->dma_handle, ring->phys_addr,
+			    ring->len, ring->el_size, ring->elements);
 
 	return 0;
 }
@@ -1542,7 +1519,7 @@ static int gpi_pause(struct dma_chan *chan)
 	 * client needs to call pause only once
 	 */
 	if (gpii->pm_state == PAUSE_STATE) {
-		dev_dbg(gpii->gpi_dev->dev, "channel is already paused\n");
+		trace_gpi_already_state(gpii->gpi_dev->dev, gpii->gpii_id, gpii->pm_state);
 		mutex_unlock(&gpii->ctrl_lock);
 		return 0;
 	}
@@ -1578,7 +1555,7 @@ static int gpi_resume(struct dma_chan *chan)
 
 	mutex_lock(&gpii->ctrl_lock);
 	if (gpii->pm_state == ACTIVE_STATE) {
-		dev_dbg(gpii->gpi_dev->dev, "channel is already active\n");
+		trace_gpi_already_state(gpii->gpi_dev->dev, gpii->gpii_id, gpii->pm_state);
 		mutex_unlock(&gpii->ctrl_lock);
 		return 0;
 	}
@@ -1703,8 +1680,7 @@ static int gpi_create_i2c_tre(struct gchan *chan, struct gpi_desc *desc,
 	}
 
 	for (i = 0; i < tre_idx; i++)
-		dev_dbg(dev, "TRE:%d %x:%x:%x:%x\n", i, desc->tre[i].dword[0],
-			desc->tre[i].dword[1], desc->tre[i].dword[2], desc->tre[i].dword[3]);
+		trace_gpi_tre(dev, chan->chid, i, desc->tre[i].dword);
 
 	return tre_idx;
 }
@@ -1797,8 +1773,7 @@ static int gpi_create_spi_tre(struct gchan *chan, struct gpi_desc *desc,
 					 TRE_FLAGS_IEOT);
 
 	for (i = 0; i < tre_idx; i++)
-		dev_dbg(dev, "TRE:%d %x:%x:%x:%x\n", i, desc->tre[i].dword[0],
-			desc->tre[i].dword[1], desc->tre[i].dword[2], desc->tre[i].dword[3]);
+		trace_gpi_tre(dev, chan->chid, i, desc->tre[i].dword);
 
 	return tre_idx;
 }

-- 
2.34.1

