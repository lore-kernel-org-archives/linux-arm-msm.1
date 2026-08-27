Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C289F448CE9
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 12:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787833689; cv=none; b=nGRon77qpT+SzkaHwz04WzpfZDtCUz65jSMLyDeWgM6W0aYAUnoz3r2HZdroM3Mt1MIaMKOjApA8JgIubMAcWqeCnnc0AKBklxoaLbeiAfK4Sxnq2bgZBWy16fXQ97er8e0tsFijOpQtF+mzm2/sRZ5eQTxiYArhOZCmiF4AzyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787833689; c=relaxed/simple;
	bh=ZeptbrLh2OAqJST6zmSGFm03zkKujLOAAacfUDgoLFY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pxa9pwgsnbBpFcKaJs7obmDecEDgI3UR0vup3U1jbBl+Gr9DBfOyHJ/609+WzKoxE+oy139jcTTXP3uJn31DnFGEe9HjY06T8ZVzRH4h/2ehIJRE1miVx/hLDOGX+/iZyi9RfW9/BljRUrfq1fxkKkwP+zParpjMdboP0F++Lvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UWu+isjq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TEHM0By6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UWu+isjq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TEHM0By6"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RCCYtK3803776
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 12:28:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1Z1YXiYze4iuUm3nc80GrxGrzMdPVj6ylSouQ8wpXYM=; b=UWu+isjq0r3IJa/i
	2lJm9/uDXti5yQp25nAZsQwAschWsAd63j3uVO1CXaD/oMJK4yVfysbpOXv37kKm
	Dyfsamaq5o9AiBUwqnEAj3EUfqvoevWXSt1bQrvoovPhAj5HNLRifwLl8q5RKYUN
	3hbKogaLTymE29ZnEVnMF9Tj1VAJjIEDQ46jkDacO9PFSrKvKkBlT7ivucwUbvU9
	tO2n8K0tlJbBDyuDttqwo5LhFszXVZzVJR4eK47klLp03dtreukilbJfjfywDWCO
	WCngNJDBN6xs9FpoAgh0a5e95f3pY5MdkhR2DVSDaN9vumg+75bUN7wngCQ+09zE
	Oyfxqw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gak560fbu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 12:28:06 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e22137fb3so1262682a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 05:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787833686; x=1788438486; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Z1YXiYze4iuUm3nc80GrxGrzMdPVj6ylSouQ8wpXYM=;
        b=TEHM0By6sgPpknR7hS1YiH/3cNLd16s4bod+2Gw5EMSOg7xZMO6aieiz6kJtfmjRAC
         6I4FdKw9niy1UAsbluY4iAO2pxS79R+yVY5q6U6DYRRXdsLgmHANCX1HvhHQeu6ffdmq
         S+iCHltx1CK2I5urxkvGUEB6LXZ3LOovQdqLhfInq4Jl0tRa7EmME+BSXvSNe0+Kt/jf
         TkWDu+5Wxvcaao6wVua19S4Tij1okSNYUYZIC/RwUg0pk3UNQOFMhYEFM5YJzjm7XK/z
         oVBY6JwZCUZrgJX4Hy5JDIKQeiImtZeMspOkRnSa2ITcncb2cn2qFttkATNSFYtvtB3D
         GOtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787833686; x=1788438486;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1Z1YXiYze4iuUm3nc80GrxGrzMdPVj6ylSouQ8wpXYM=;
        b=ghoV030rqz2bZ0aR6Nj0QyJhy5nUI3IphQak9IzFd6z1tPJRroABapcR0PGNrx2f/G
         abfQTwpaFq75L+8HdUqnBvGbcjEHnQjm+FHniL7TZHzyLbBcazCYr4+T1+ouYIJ+GjBZ
         QyWRkuXNkQa9VQa8lda2DoucyrDhUO74heaq5p28pueSaw03NE5hQCN0Nvgfn/gzh4+O
         oRcnkJDdNsXZeHmQTZNKOgXssLQAQ73j+FopHt8QX8hyyrdl7oUipVuP8BmGVh/dyzAj
         DgTqI27BXqo9TGmnNezLVdnqehKzmdSnXRSxzWEY7zl8guuBqouuU7/3H2rk//GaO7ug
         0P/w==
X-Forwarded-Encrypted: i=1; AHgh+RoamOjzsd646NlTfBGv6Q32dM92xj9xWWt9qCEtbKtRursqfbxfCPbc23+PE6sWWdK7ErNDpWHp54g4u6n7@vger.kernel.org
X-Gm-Message-State: AFuF++lBbzS8VIkjy3KJfaaCua20xxep4ccT2Xa+7cDV/J8CUyHUFHP8
	up4bq1fFxTBp+N7D7kC7vVnwlK80jn13ewBxgDMZb36U3tbbK/3YdnE6bytgoTcvHld7gfjGRig
	WpTaEj+MxaijpfHMs+bl4krXNs2Rls9iHt1T4sP+tiIItZ+ebsYgejEo2r4itrog2DRP4
X-Gm-Gg: AR+sD12DsuPResl5bYibfOadoSbIp09BW+CLcc8ibucl0j5b+LD16AP2078vmD8pqp6
	IHgihgcDCjlPXYqC1nBV6ViF96ESo47kWad+T3MdDY22p03XoYIqtq6vNLL6Q6k2xvdOE2DVT/H
	fuABn/licCRwc0ZJh1hn8ZB6WHIDy1RXw6gNnUsMw2DzCOUEFnapiBqJww2RMHP2DbDrBTBgatL
	M91rR/YwnfgKiTJZSP5MqKAIls48TwtE66Qjm/Nz6KiccrceiUB8uQA60B1rCFdaNXzO00hIYNt
	wyc4bCtlZFLxyYrOhK0noArgrya/kQjNWIBXNQeSUBh0cG6ZaIqAtzpBy4F/bKe+dyDt0yjBJiO
	LgOdQuB2BRpITRDmJY+3zIG3nS/JFJqTp+Mk=
X-Received: by 2002:a17:90a:d2ce:b0:393:1d92:db5 with SMTP id 98e67ed59e1d1-3966d3dc5ecmr31793506a91.10.1787833685415;
        Thu, 27 Aug 2026 05:28:05 -0700 (PDT)
X-Received: by 2002:a17:90a:d2ce:b0:393:1d92:db5 with SMTP id 98e67ed59e1d1-3966d3dc5ecmr31793376a91.10.1787833684918;
        Thu, 27 Aug 2026 05:28:04 -0700 (PDT)
Received: from hu-arandive-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b0fcfa3asm2707690a91.6.2026.08.27.05.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 05:28:04 -0700 (PDT)
From: Aniket Randive <aniket.randive@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 17:57:51 +0530
Subject: [PATCH v8 2/2] i2c: qcom-geni: Add dynamic transfer timeout based
 on transfer length and frequency
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-master-v8-2-596bc81c5cf9@oss.qualcomm.com>
References: <20260827-master-v8-0-596bc81c5cf9@oss.qualcomm.com>
In-Reply-To: <20260827-master-v8-0-596bc81c5cf9@oss.qualcomm.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Dmitry Guzman <Dmitry.Guzman@mobileye.com>
Cc: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Aniket Randive <aniket.randive@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787833673; l=5805;
 i=aniket.randive@oss.qualcomm.com; s=20260325; h=from:subject:message-id;
 bh=ZeptbrLh2OAqJST6zmSGFm03zkKujLOAAacfUDgoLFY=;
 b=cun3mFMSgdZ9V4Zeqxn7Jif5Dm2wuXhB8pTyKVDbrK/2FCEGUctvr7pKC+4mTurIt9PErFxta
 71yXrJrYb1pB4bWcWcrsVmzGVrwC28NVDklcd7QbclbyKsV+9k8dXGE
X-Developer-Key: i=aniket.randive@oss.qualcomm.com; a=ed25519;
 pk=4o37X1ZqGbCO/T2SR8kq/HnWvq0yb1RUlFuNukovbQk=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDEwNCBTYWx0ZWRfXyG2fl3p4C6hg
 vUDzafZAgwKClPJxalSVDWBDRdKW+wCHsRJfu5kWgkKAzHMhlEAxmQBplUXrwe6P85I1/BD80zy
 uHjkwIUIkun2VlwUMjpuD152JOExcSs=
X-Proofpoint-ORIG-GUID: kE9Cgoq2okKoIBIGv75vBhNa6yPctHFV
X-Proofpoint-GUID: kE9Cgoq2okKoIBIGv75vBhNa6yPctHFV
X-Authority-Analysis: v=2.4 cv=G+Ms1dk5 c=1 sm=1 tr=0 ts=6a902d56 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=ZP9fceawhsPimmF_JtQA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDEwNCBTYWx0ZWRfX2OfOBMvIPym6
 LQPvi0xGn85i2aMX2VVxAdk/ntQfmyJB04qlOUfoR+gncc4wpoR2KOYTWmPHf3JhAZq33RKE6/T
 O4CTz41B41va6ja8pqc5f4AZSajDzBNRmgeUfZ2jgm+jBACTSa9Y10EGfDhLW5EuoM3dn8ihIxY
 nwUBDkmud9J/Pgn0Q6QWEYjKNg7eQdSfpOoBTvq5ZxXzNENLw4vUmcI4T1M31XWZ8asPzB2GCBV
 styRxmK2mBk7+KVX2hT7l2dBPnV22xAUij5q41rWlwaqDFOPmnpxc90A0WJm2J7sBeIq/IDruLO
 yLLWnPbfPEv0sbmLuOQLysZ0OCnw8wCe+oFs95/IurIx29wU/PgnVmJirtDy/n9OCFs71z03+EU
 EcCSQ/vk4xCG68h5igETNm3clvXY02PRwNEm+GPy+OSnszzdUQXhGuihUjeiDolaZsgHOOF71a2
 CJ1P0wDAma50i9drx3A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_05,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015 bulkscore=0
 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270104

The driver uses a static XFER_TIMEOUT of HZ (1 second) for all transfers
regardless of message length or bus frequency, causing unnecessary
delays on error paths.

Use i2c_update_timeout() API to calculate transfer timeouts dynamically
based on message length and bus frequency. update the timeout per message
for FIFO, SE-DMA and GPI single descriptor transfers. For GPI multi
descriptor transfers, calculate the timeout from the combined length of
all messages, as completion is reported only after the entire batch has
finished.

A 10x safety margin over the theoretical wire time is applied, with a
300ms floor to account for I2C clock stretching and other situations where
a slave may keep SCL asserted for an extended period, including faulty
devices holding the bus.

Signed-off-by: Aniket Randive <aniket.randive@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 48 +++++++++++++++++++++++++++++++-------
 1 file changed, 39 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 658636c1ee0e..203f4d627ca1 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -79,9 +79,14 @@ enum geni_i2c_err_code {
 
 #define ABORT_TIMEOUT		HZ
 #define CANCEL_TIMEOUT		HZ
-#define XFER_TIMEOUT		HZ
 #define RST_TIMEOUT		HZ
 
+/* 9 bits per byte (8 data + 1 ACK), 10x safety margin */
+#define I2C_TIMEOUT_SAFETY_COEFFICIENT	10
+
+/* 300ms floor: budget for clock stretching; slave may hold SCL low indefinitely */
+#define I2C_TIMEOUT_MIN_USEC		300000
+
 struct geni_i2c_desc {
 	bool no_dma_support;
 	unsigned int tx_fifo_depth;
@@ -513,7 +518,10 @@ static int geni_i2c_rx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
 	}
 
 	cur = gi2c->cur;
-	time_left = wait_for_completion_timeout(&gi2c->done, XFER_TIMEOUT);
+	i2c_update_timeout(&gi2c->adap, gi2c->clk_freq_out, len,
+			   I2C_TIMEOUT_SAFETY_COEFFICIENT,
+			   I2C_TIMEOUT_MIN_USEC);
+	time_left = wait_for_completion_timeout(&gi2c->done, gi2c->adap.timeout);
 	if (!time_left || (gi2c->err && gi2c->err != gi2c_log[ADDR_NACK].err))
 		geni_i2c_cancel_xfer(gi2c);
 
@@ -555,7 +563,10 @@ static int geni_i2c_tx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
 		writel_relaxed(1, se->base + SE_GENI_TX_WATERMARK_REG);
 
 	cur = gi2c->cur;
-	time_left = wait_for_completion_timeout(&gi2c->done, XFER_TIMEOUT);
+	i2c_update_timeout(&gi2c->adap, gi2c->clk_freq_out, len,
+			   I2C_TIMEOUT_SAFETY_COEFFICIENT,
+			   I2C_TIMEOUT_MIN_USEC);
+	time_left = wait_for_completion_timeout(&gi2c->done, gi2c->adap.timeout);
 	if (!time_left || (gi2c->err && gi2c->err != gi2c_log[ADDR_NACK].err))
 		geni_i2c_cancel_xfer(gi2c);
 
@@ -633,7 +644,7 @@ static void geni_i2c_gpi_multi_desc_unmap(struct geni_i2c_dev *gi2c, struct i2c_
  * geni_i2c_gpi_multi_xfer_timeout_handler() - Handles multi message transfer timeout
  * @dev: Pointer to the corresponding dev node
  * @multi_xfer: Pointer to the geni_i2c_gpi_multi_desc_xfer
- * @transfer_timeout_msecs: Timeout value in milliseconds
+ * @timeout_jiffies: Per-message completion timeout in jiffies
  * @transfer_comp: Completion object of the transfer
  *
  * This function waits for the completion of each processed transfer messages
@@ -643,18 +654,18 @@ static void geni_i2c_gpi_multi_desc_unmap(struct geni_i2c_dev *gi2c, struct i2c_
  */
 static int geni_i2c_gpi_multi_xfer_timeout_handler(struct device *dev,
 						   struct geni_i2c_gpi_multi_desc_xfer *multi_xfer,
-						   u32 transfer_timeout_msecs,
+						   unsigned long timeout_jiffies,
 						   struct completion *transfer_comp)
 {
 	int i;
-	u32 time_left;
+	unsigned long time_left;
 
 	for (i = 0; i < multi_xfer->msg_idx_cnt - 1; i++) {
 		reinit_completion(transfer_comp);
 
 		if (multi_xfer->msg_idx_cnt != multi_xfer->irq_cnt) {
 			time_left = wait_for_completion_timeout(transfer_comp,
-								transfer_timeout_msecs);
+								timeout_jiffies);
 			if (!time_left) {
 				dev_err(dev, "%s: Transfer timeout\n", __func__);
 				return -ETIMEDOUT;
@@ -778,8 +789,24 @@ static int geni_i2c_gpi(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[],
 		dma_async_issue_pending(gi2c->tx_c);
 
 		if ((msg_idx == (gi2c->num_msgs - 1)) || flags & DMA_PREP_INTERRUPT) {
+			size_t total_len = 0;
+			int j;
+
+			/*
+			 * All TREs except the last carry the BEI bit, so a single
+			 * completion interrupt fires only after the entire batch has
+			 * drained on the wire. The timeout budget must therefore cover
+			 * the combined wire time of every message in the batch.
+			 */
+			for (j = 0; j < gi2c->num_msgs; j++)
+				total_len += msgs[j].len;
+
+			i2c_update_timeout(&gi2c->adap, gi2c->clk_freq_out, total_len,
+					   I2C_TIMEOUT_SAFETY_COEFFICIENT,
+					   I2C_TIMEOUT_MIN_USEC);
 			ret = geni_i2c_gpi_multi_xfer_timeout_handler(gi2c->se.dev, gi2c_gpi_xfer,
-								      XFER_TIMEOUT, &gi2c->done);
+								      gi2c->adap.timeout,
+								      &gi2c->done);
 			if (ret) {
 				dev_err(gi2c->se.dev,
 					"I2C multi write msg transfer timeout: %d\n",
@@ -899,7 +926,10 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
 
 		if (!gi2c->is_tx_multi_desc_xfer) {
 			dma_async_issue_pending(gi2c->tx_c);
-			time_left = wait_for_completion_timeout(&gi2c->done, XFER_TIMEOUT);
+			i2c_update_timeout(&gi2c->adap, gi2c->clk_freq_out, msgs[i].len,
+					   I2C_TIMEOUT_SAFETY_COEFFICIENT,
+					   I2C_TIMEOUT_MIN_USEC);
+			time_left = wait_for_completion_timeout(&gi2c->done, gi2c->adap.timeout);
 			if (!time_left) {
 				dev_err(gi2c->se.dev, "%s:I2C timeout\n", __func__);
 				gi2c->err = -ETIMEDOUT;

-- 
2.34.1

