Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B934E346A1D
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 06:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784183949; cv=none; b=clumELScdmz5CcckFhhCo1puIliquvqQpgc2BJvCHJ/cMyaw8A0LrFOIVsLPVgFwtnU3zyErZr6Hgd7qqQtMj9DQC6U1d/hNLi+sUuxTYWhA8tFEOVC2kaRP0q3qi0/0IK/Hw6AP1D7fNEwmIwOwUq7LFCAns5DqZi1BWB+wOQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784183949; c=relaxed/simple;
	bh=JTNdrvBVz+uhkV8v3RVfjPFxWgkdz2CZEuNPO45ffy4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P4vvvBC48vGESK/3hbxOyOYSEVDvqFsFA8DED/v8TwYCtixAqHFCwCX8xUIL08wB5UoZHqOyaXyb5vwL9MKc6Dd9siEiWCfiLKQA8OBqWJE+qM3Z3vLYDWckZDsWwQQIdxqO1XIKuYDUdqs/mJXWvIyuf7p2IkzjXpEpnVP/dko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Uz7iNAuD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D2NZPFX1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Uz7iNAuD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D2NZPFX1"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G3wRiC1412214
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 06:39:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NBWA4To0HeSiFVTDDmoZvlT6DKfi11p5Dhw5I+W7aZc=; b=Uz7iNAuDAGSgqAvp
	mZ7F0xIWgMB9lMnNCjX7wrZJlTmeqcmEtQDaB51Fp93/sVbkoO6Q9kcvcdc3WDhq
	Q3fRVfnANdOAW/JYigXkupQnuL7kn5fjxRZmktKUDuSzts8XdsseCMxAVojIkdex
	Ge9LrryRGEy57enD/bZ9PHm1VeEdlUof1RfUnG7YWkg1vOGYtztAGMrd+kYPV/qt
	q0DVk6mTBSyRoxAykktRyq6S0lGt1RXfZR0EH5yHtQT9XtxRtd3ngnCqTZf0w4r3
	KeVwjLxF47IXbh/RgFKeCfwgKE/e4LLL6HHtoUhsYi5xT92yjBLP8aoUhRoGdF9+
	k/OuiA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe7kacghu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 06:39:05 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cab3e9cd922so2530899a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 23:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784183945; x=1784788745; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NBWA4To0HeSiFVTDDmoZvlT6DKfi11p5Dhw5I+W7aZc=;
        b=D2NZPFX1f0oQsXOMHjD/jsOO9jl+ZMFDsnu8vmWN7TOnT/+uLnyC4IYIE81ODOhWDE
         +Fv4mHYAYrYuO9do1SbNjrNGDdL3JSSt08wtf6M/ljUoyzuK56rqUavSumohU8fdh9oZ
         HnHn9AC/1Bt32MTT6qvZ5ZLxRt0CU1eBE+J5TG54swhJMH/hmPez+OXbMBd5zyZGGIIe
         kuRd2cOJnfGnF/hwqi692kfy6uTMYj/L0aUBy/03/VtbQbBL+HY0ewF6Bun63OklE+NB
         J2sr+jIl5u/ew5ZWAQQNbqnfYSx6fjuqqnwFFX1JKdHlm6xNm8zs34eippucTuNH+g1p
         coIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784183945; x=1784788745;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NBWA4To0HeSiFVTDDmoZvlT6DKfi11p5Dhw5I+W7aZc=;
        b=Iyd17gSeG+3l+TXPKjoaVS5AvEaEPuBP/82vENszMoY2lYNNWiiBlHxGD/jsaIu/PX
         y/k+JYgqutI1r3Q9fk4IXEFaQLQJqKQPr3cdnZ7G/LSy0qdhzblJ8BdQvFCas19f8HeW
         Kz2LvlSoXazrqXNZsmquVRYTCNRi14T5FuaMQiUy+i9eaPI3zu0RLZifxXpeMT+GfN6w
         /xZzaT3kPXx0jdNU69fJDTMoWYQ4hV8JKUFugGvS96P02nwa/oUqbnZuBjnfg9MFDTx9
         K++TsrtZKTED6Wm6hC7vngX16S71QM+OCRJIC7j5sUb/lL2lwBpdf2t6jIOel92wP3x4
         ZMjA==
X-Gm-Message-State: AOJu0YzzkthXp537urdDObp86QbMrtf5N2hg/HvSpmtutihU/4FxnZtg
	p2dSq8/VjTPNF+oyFmEATtZOX7f9D/s5W7YFMSlDxo2+9DoG0eAyZ0ltcErKwTi0ffaJKmwFMDI
	kQ/Z0uEIiG/+FvcydKcxYNdW+bwBTEFXRGTMdsr49PDk8UvRrOiDJ4WVpQsBJZff+xmru
X-Gm-Gg: AfdE7cliVHwXVYpg/lm+6s5IUus4BpEJZl2BrD23HJLOLmmzYnYlf51fHh639OksbnI
	zQG0h+Ch5Vn2ozVjxMZdYDaH+WMSL1iNG/U9f/e/8EbjRTIKIff5sDfni7lyPN0TwdluXcUUWkn
	ibRYG8hGL8wQ+VrhgupcrAkmZWlcjZf7B1Ypcq4L7LN1NR0rizQzJ/Nm37Np4PuQ7D0pkBcKJEz
	M4lHUfTJBvTWWrVwv8+m2Ry8yLxbgTHrqMtmuu/sKKmWNULkOt8c9WkSQs+6yfjkIh1SqqNYYtd
	X0Ctl36G825xNDd3VMvU3UYJumOfN2fVEVOy2BixDnb4qx8o0aQSNQ4gedFfOZgwjwO9Tnw0J/L
	zsfkgyE/NyKqPKDm6uTEcxUPIGu3hp8o+xw==
X-Received: by 2002:a05:6a21:9d48:b0:398:840d:39aa with SMTP id adf61e73a8af0-3c110641880mr21827210637.29.1784183945250;
        Wed, 15 Jul 2026 23:39:05 -0700 (PDT)
X-Received: by 2002:a05:6a21:9d48:b0:398:840d:39aa with SMTP id adf61e73a8af0-3c110641880mr21827183637.29.1784183944623;
        Wed, 15 Jul 2026 23:39:04 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cb258eb82desm1320870a12.2.2026.07.15.23.39.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 23:39:04 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 12:08:44 +0530
Subject: [PATCH v3 2/3] i2c: qcom-geni: use dedicated completions for abort
 and reset events
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260716-fix_cancel_sequence_on_failure_for_i2c-v3-2-9091315a33a0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784183935; l=6064;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=JTNdrvBVz+uhkV8v3RVfjPFxWgkdz2CZEuNPO45ffy4=;
 b=4c6rkF3EL/t04JO7nW3fi5lpPl2ahmeyeEtu4+wksBDN1agumA/shYv+eZvSZJexxB4U7RuMG
 OB3MQiI6u0rCMkBIRLTd/8hZtfqiA76dY9N0Y6r1yLl1oTZLG4yJjr7
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Authority-Analysis: v=2.4 cv=TMF1jVla c=1 sm=1 tr=0 ts=6a587c89 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=KPPVM4V1oce58VYRkwwA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: HaZlSuHuGuLsXLjr2x58-E49mTnQZ5MJ
X-Proofpoint-ORIG-GUID: HaZlSuHuGuLsXLjr2x58-E49mTnQZ5MJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDA2NyBTYWx0ZWRfX/vKl0xB3RGfb
 BRoQG0PEeOpMUlDfgQoUy1CtnGm3Vdiz1LTYo7421zE2YAkDaITy6S5uBrO2HWyYm8Bil3YFu90
 CcvzeT46wCbKvm+3Da6ynf8CVashdiY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDA2NyBTYWx0ZWRfXwtaxk+0IUXZB
 6lvORNdEVl1PIrOdKkYLT/4sVwK/w6XL5sR8WGDIRdDRBYJghWXNYCdeI1BAE/idtjWeaJv3wFw
 kOE1AvtMlN9nqCMIqknWaD/e/y5fA1EaNOjcXg4Zc0DsqrPSWdbV282EXpB9wlFXbl7sy+y4kVP
 lgG8lnQP+tun3cykHQJOWd1bVgCYfYw60KXD7JV5MiENu5X9Cl+m5/JMhUAnvUrsK5GI2A3D+M+
 3p2L4fBJ1s6WPxVaMsh6Rj1oiXjk3h3+EM5R7oQ/iL0JBVEkzngbw8qYC+95U2Wpej9zMFAEQhT
 gBJef4Zwc3ko0r+S598v5muNOxgRV+txGofqdRmiBHotrK7CrV9kX5q1GkqjU3UnEmSSAKLHHm2
 rz13M5B0bo52TKDh5MefSqdCuLdfuUzitBYe9uI+u3vIORMtyJPffG7RtfX+UciNatAp0GGmahG
 +B1RGXgOS6NQbXNI/2A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160067

The driver uses a common completion event for transfer, abort and DMA
reset operations.  This allows unrelated completion events to
prematurely wake abort and reset waiters, leading to incorrect
synchronization.

Introduce dedicated completions for abort, TX reset, and RX reset
operations, and signal them only from their respective interrupt
events.  This removes the dependency on shared completion state and
eliminates the abort_done flag-based synchronization.

Co-developed-by: Naresh Maramaina <naresh.maramaina@oss.qualcomm.com>
Signed-off-by: Naresh Maramaina <naresh.maramaina@oss.qualcomm.com>
Reviewed-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 54 +++++++++++++++++++-------------------
 1 file changed, 27 insertions(+), 27 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 15403edb355a..9490aee4928c 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -113,7 +113,10 @@ struct geni_i2c_dev {
 	int err;
 	struct i2c_adapter adap;
 	struct completion done;
+	struct completion abort_done;
 	struct completion cancel_done;
+	struct completion tx_reset_done;
+	struct completion rx_reset_done;
 	struct i2c_msg *cur;
 	int cur_wr;
 	int cur_rd;
@@ -127,7 +130,6 @@ struct geni_i2c_dev {
 	struct dma_chan *rx_c;
 	bool no_dma;
 	bool gpi_mode;
-	bool abort_done;
 	bool is_tx_multi_desc_xfer;
 	u32 num_msgs;
 	struct geni_i2c_gpi_multi_desc_xfer i2c_multi_desc_config;
@@ -256,8 +258,6 @@ static void geni_i2c_err(struct geni_i2c_dev *gi2c, int err)
 
 	switch (err) {
 	case GENI_ABORT_DONE:
-		gi2c->abort_done = true;
-		break;
 	case NACK:
 	case GENI_TIMEOUT:
 		dev_dbg(gi2c->se.dev, "%s\n", gi2c_log[err].msg);
@@ -359,12 +359,18 @@ static irqreturn_t geni_i2c_irq(int irq, void *dev)
 		writel_relaxed(dm_rx_st, base + SE_DMA_RX_IRQ_CLR);
 
 	/* if this is err with done-bit not set, handle that through timeout. */
-	if (m_stat & M_CMD_DONE_EN || m_stat & M_CMD_ABORT_EN ||
-	    dm_tx_st & TX_DMA_DONE || dm_tx_st & TX_RESET_DONE ||
-	    dm_rx_st & RX_DMA_DONE || dm_rx_st & RX_RESET_DONE)
+	if (m_stat & M_CMD_DONE_EN ||
+	    dm_tx_st & TX_DMA_DONE ||
+	    dm_rx_st & RX_DMA_DONE)
 		complete(&gi2c->done);
 	if (m_stat & M_CMD_CANCEL_EN)
 		complete(&gi2c->cancel_done);
+	if (m_stat & M_CMD_ABORT_EN)
+		complete(&gi2c->abort_done);
+	if (dm_tx_st & TX_RESET_DONE)
+		complete(&gi2c->tx_reset_done);
+	if (dm_rx_st & RX_RESET_DONE)
+		complete(&gi2c->rx_reset_done);
 
 	spin_unlock(&gi2c->lock);
 
@@ -376,17 +382,13 @@ static void geni_i2c_abort_xfer(struct geni_i2c_dev *gi2c)
 	unsigned long time_left = ABORT_TIMEOUT;
 	unsigned long flags;
 
+	reinit_completion(&gi2c->abort_done);
+
 	spin_lock_irqsave(&gi2c->lock, flags);
-	geni_i2c_err(gi2c, GENI_TIMEOUT);
-	gi2c->cur = NULL;
-	gi2c->abort_done = false;
 	geni_se_abort_m_cmd(&gi2c->se);
 	spin_unlock_irqrestore(&gi2c->lock, flags);
 
-	do {
-		time_left = wait_for_completion_timeout(&gi2c->done, time_left);
-	} while (!gi2c->abort_done && time_left);
-
+	time_left = wait_for_completion_timeout(&gi2c->abort_done, time_left);
 	if (!time_left)
 		dev_err(gi2c->se.dev, "Timeout abort_m_cmd\n");
 }
@@ -414,31 +416,25 @@ static void geni_i2c_cancel_xfer(struct geni_i2c_dev *gi2c)
 
 static void geni_i2c_rx_fsm_rst(struct geni_i2c_dev *gi2c)
 {
-	u32 val;
 	unsigned long time_left = RST_TIMEOUT;
 
+	reinit_completion(&gi2c->rx_reset_done);
 	writel_relaxed(1, gi2c->se.base + SE_DMA_RX_FSM_RST);
-	do {
-		time_left = wait_for_completion_timeout(&gi2c->done, time_left);
-		val = readl_relaxed(gi2c->se.base + SE_DMA_RX_IRQ_STAT);
-	} while (!(val & RX_RESET_DONE) && time_left);
 
-	if (!(val & RX_RESET_DONE))
+	time_left = wait_for_completion_timeout(&gi2c->rx_reset_done, time_left);
+	if (!time_left)
 		dev_err(gi2c->se.dev, "Timeout resetting RX_FSM\n");
 }
 
 static void geni_i2c_tx_fsm_rst(struct geni_i2c_dev *gi2c)
 {
-	u32 val;
 	unsigned long time_left = RST_TIMEOUT;
 
+	reinit_completion(&gi2c->tx_reset_done);
 	writel_relaxed(1, gi2c->se.base + SE_DMA_TX_FSM_RST);
-	do {
-		time_left = wait_for_completion_timeout(&gi2c->done, time_left);
-		val = readl_relaxed(gi2c->se.base + SE_DMA_TX_IRQ_STAT);
-	} while (!(val & TX_RESET_DONE) && time_left);
 
-	if (!(val & TX_RESET_DONE))
+	time_left = wait_for_completion_timeout(&gi2c->tx_reset_done, time_left);
+	if (!time_left)
 		dev_err(gi2c->se.dev, "Timeout resetting TX_FSM\n");
 }
 
@@ -851,6 +847,7 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
 	for (i = 0; i < num; i++) {
 		gi2c->cur = &msgs[i];
 		gi2c->err = 0;
+		reinit_completion(&gi2c->done);
 		dev_dbg(gi2c->se.dev, "msg[%d].len:%d\n", i, gi2c->cur->len);
 
 		peripheral.stretch = 0;
@@ -920,6 +917,8 @@ static int geni_i2c_fifo_xfer(struct geni_i2c_dev *gi2c,
 		m_param |= ((msgs[i].addr << SLV_ADDR_SHFT) & SLV_ADDR_MSK);
 
 		gi2c->cur = &msgs[i];
+		gi2c->err = 0;
+		reinit_completion(&gi2c->done);
 		if (msgs[i].flags & I2C_M_RD)
 			ret = geni_i2c_rx_one_msg(gi2c, &msgs[i], m_param);
 		else
@@ -939,8 +938,6 @@ static int geni_i2c_xfer(struct i2c_adapter *adap,
 	struct geni_i2c_dev *gi2c = i2c_get_adapdata(adap);
 	int ret;
 
-	gi2c->err = 0;
-	reinit_completion(&gi2c->done);
 	ret = pm_runtime_get_sync(gi2c->se.dev);
 	if (ret < 0) {
 		dev_err(gi2c->se.dev, "error turning SE resources:%d\n", ret);
@@ -1132,7 +1129,10 @@ static int geni_i2c_probe(struct platform_device *pdev)
 
 	gi2c->adap.algo = &geni_i2c_algo;
 	init_completion(&gi2c->done);
+	init_completion(&gi2c->abort_done);
 	init_completion(&gi2c->cancel_done);
+	init_completion(&gi2c->tx_reset_done);
+	init_completion(&gi2c->rx_reset_done);
 	spin_lock_init(&gi2c->lock);
 	platform_set_drvdata(pdev, gi2c);
 

-- 
2.34.1

