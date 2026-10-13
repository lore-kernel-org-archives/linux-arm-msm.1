Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B034D90D6
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 10:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791887443; cv=none; b=szsvM2UeSuQtDPKEGY+njVC6f6+/kpRoH4lH249+94iwHCea7lSzIc+ftywAXl0nXBGvw+BdYwUzIcFcQGeWwQDVfZ19WL12ByOFvfjlecRfGqpB6VTHDLqtMSfXUF1saaJMKZOcFkZYsLGubuKzHHHmDVbd/E629dh37CIXImM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791887443; c=relaxed/simple;
	bh=rlLDrbVxx7OktVNZZzwby0arcGlHr/lUer4SD6jeyv4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TQoQVv+vrdPiNcmUPPhdSkcNtSEAnyxVJlf+dSLmou5am0iuOoU6IHZthP+MmG9kUeXPssPqIh+K5WjPXx/fLGA5v/HsCdzCv8V+R34OF6oLep6Ig00YM+mzHu24E6NE6Y3KuJ1tyUxVr4hFOxmA37Qx4e3SmHVq5QNKD1dS5UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YklR1vkh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DZmzIPUt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YklR1vkh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DZmzIPUt"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D7OXYr015281
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 10:30:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S8NX9xiw5xX66h6BpN1qrXdTi4yOZiML317moCyPLXw=; b=YklR1vkh5yMY0LQH
	uw+mjIh8zg2VxD++c+5qNk/JTaQm7KTq5JfYLMxhSmJMLmvX54ZoBgFfgKLipwkL
	9bdWOaJ0k9pYFjm+b5QxbmmJnioX4I4KGr4WwWnd447sYwXttvUnJ+RElFQcH5/P
	JY1iTg9PCEly9ywPhfCHygS3uhOmF+1+ums829fWnJ+jaLxYBzwPDV3DVtD0m3wD
	4tdI/j/QmNUKO6v9rA+xW9807RZEI9WRgVxJU+LkeKAYUKLDCmMSoyfHr2/bDiP6
	1SJlB968t0DTqV7oVjlrA1Q/RECSGShZW9gCKURIbx9gOoyI8L3XquSEOIDFWa3O
	CZ9u2g==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9g7ugs7m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 10:30:40 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91b89614300so36841906d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 03:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791887440; x=1792492240; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S8NX9xiw5xX66h6BpN1qrXdTi4yOZiML317moCyPLXw=;
        b=DZmzIPUtgxMSJclrjLNhr2RUUKCBc3dhVFQYiHokFQ1q3q/zlCMKJ1voGNCRmLSPIP
         ipe/br8guo8647ge3oFMSla0fy+EWVUdXAMzoB82aA0nXiqhW4gjHCZq4pKba75B9xqJ
         XACCBOhpz3QL9E+5tfUSVmGm1NmSLosyGKlUZIhanalTkYrzlPtz7HjyJhp9AdPtD7Aa
         6BKpqiiDo9xM8QSzozfAwIFOOIJPpZaOIcMtPjWw3ucrVGQGCwimvzJG/adnoQUUK7fJ
         jMuIJ/em6zqM7QpPY/h4BOZYyJexrKVkQ1ZqZS8P1sQAws3Z5DjNLspY0/RvLCsBc93n
         Ms/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791887440; x=1792492240;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S8NX9xiw5xX66h6BpN1qrXdTi4yOZiML317moCyPLXw=;
        b=h23BIDtSOERaW7kTmIkIbKccldMCjVGpGmOWFp/0LC51eu1Vlee8W4pOXviGUH+6oS
         ZfmjFXaLcVJWaol6ICSnWQY7lH3jXgaQMfZTuPvp/DN9jgVJgGD6CqEm8iGsJTIxB77K
         m0sCvXlQdHs8rUtwZXzpfGBwJcEt/Wc6us6ACuxOVI9XWCikIkScolD8ydvfZ5PMzOEB
         s5mAxEY8YtR87CWNZJbFlJvBVNzSmD6r3JSJQ5mVJAcVtGaj4oPyrciFJnExUJPy1s6+
         5n2Eq60hM8COEFkWlf5dyNpQXQZ+IWX6KZLwcw4lL8sm/pVytk9hs6dBDld3q0Bd0q7U
         7Vpg==
X-Forwarded-Encrypted: i=1; AKwUvByFm5z9ptY5J0MzIwtLFIEms7WxYeZ2JDkB/YI9ASzTsF9l9zXEkJ15CUdN5epRWvXrKh8Uzj52zw+/Hxzm@vger.kernel.org
X-Gm-Message-State: AFq9FYLxC6t2EkYCIE4GsozqQSQb6Fql5GkNUcLMk7jMyEzrxdyudPmG
	2lOLBiY0aMsnNeao7O8rT5ZZuU9vx5MegwfcYWn1PDh3FhsEH4Dpxb6w63irLMB4uB6u68VEgiF
	xw4iSmZ/ZtdRt/QbOBYESlG4TdzJR5O0s/h+V1cflgLfBTbB+5QKbBPzKMCun+mCAKG9J
X-Gm-Gg: AYBFou3TwQWO+K+QRMMLL+hJmXWm3Ay5IRTs3vtPUggsiCiIIStZLIgrRxb20nZXjL/
	75X9KDm+eYutXdhIRF46+PIhCsw54ZTgYDfydzlYzj8DnRYBPpFxNovYrZ54B5dmPFs7GSZbyvR
	2YHDKzZnlpnXCVrZad/5pigFfGry2fFqll8tr5pVr1gNEBiIm1jHrkAIX8jTLR+sq9RfhSIj/+4
	/PCFzxXH7poFeWA380VYBu8R6NSHlvHoBFg9sSInyiymYcBbnSh5kA0vxOF35sA91XHq70rsZSW
	SpcOn18PLYVIIwxH1TBIAZlcQAizdgTQ5ZSxN8t0n/1mzLn1i10jFN5dVehmHHELifcNe53+tt+
	lUjnY74BTZI6ofTigYrtw+7UrmbHxU6j/CO8ZQEtQNTXsv0C2QHgPYa8jb1Z9SIva7WwnyGcdn7
	lJQH3BAPnt8Ulo01K1el5SNx7EHJsPKwmVjBDABoGlAg4b8no2Eoo=
X-Received: by 2002:a05:620a:460d:b0:93c:b766:2bfc with SMTP id af79cd13be357-93ebd22539fmr2129255985a.17.1791887439324;
        Tue, 13 Oct 2026 03:30:39 -0700 (PDT)
X-Received: by 2002:a05:620a:460d:b0:93c:b766:2bfc with SMTP id af79cd13be357-93ebd22539fmr2129249985a.17.1791887438710;
        Tue, 13 Oct 2026 03:30:38 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:d108:3895:812b:662a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18be964dfsm349955115e9.7.2026.10.13.03.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 03:30:37 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 12:30:30 +0200
Subject: [PATCH v2 6/6] i2c: qcom-cci: Add burst read support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-cci-imp-v2-6-6873326b44a3@oss.qualcomm.com>
References: <20261013-cci-imp-v2-0-6873326b44a3@oss.qualcomm.com>
In-Reply-To: <20261013-cci-imp-v2-0-6873326b44a3@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0MSBTYWx0ZWRfX5Z2HrO3fYhSy
 L/Rv5YsJDj23jo+LoQrey9y2xTeOeE5Wvs8AdeYRgVnU11/RfN2hcZzdFdRhIFGiPZY91+H999w
 ++mxW1NTecFH87HckOzPRFVrnRxgfv3+PUNGyNuiMlXdWL8BColkDsXemACahr/Gqej/TA6xest
 M5cSI9c15iKVVYyWCV1sWQR6leYCeVixD45/+1WTjZAN2/QQjm9HkIr8KnLjxnz63hQ395UI9rS
 m5OTc5rpxif4ovwT1bs5MSX9uPUq5Pi1fE5J3Fknp1iB62Vsq8+9q7tx2BlGPM3Rmf6NUIPHKGV
 1ljWSa+1WN2I6bxXY7NIgteK8JNuhLipRoQDmkuhBXGavfi4fc0Aj1WNfQCbCP3UPbOam3B0/55
 BE8+eW5LeCG8C1Llqa6d3RghDLRb0yJE3JLYS0oYy+vOr+9Cq3P5IBaGRUmnk+T739A1rM06bK9
 mjw4QPttX7dEYUOahqw==
X-Authority-Analysis: v=2.4 cv=Z495j3RA c=1 sm=1 tr=0 ts=6ace0850 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=lNqXhXyNEWYzk-AvLucA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: VQxbZ0axMufSnjydkn4khC7JHB0CUFZ9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0MSBTYWx0ZWRfX0PfrRv984BKE
 ONdPc1awOAPHA4c+k7AQqlRm+MhHaDS7sw01xN0OBBJM2dwKQRGjFPmwfECYB70WuMOpk2ySTPP
 +O/F83qovEH1egd37bPu0e9iQHLNGrw=
X-Proofpoint-GUID: VQxbZ0axMufSnjydkn4khC7JHB0CUFZ9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 phishscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130041

CCI_I2C_READ transfers are currently limited by max_read_len to the
amount of data that fits in the read FIFO, as the driver only drains
the FIFO once after receiving RD_DONE. On current hardware this limits
reads to at most 254 bytes.

CCI v1.7 and later support reads larger than the FIFO depth by
generating RD_THRESHOLD interrupts as the FIFO fills, allowing software
to drain data while the transfer is still in progress. When the FIFO
becomes full, the hardware can also apply backpressure by stretching
SCL and reports this condition through RD_PAUSE_IRQ.

Program CCI_I2C_Mm_RD_THRESHOLD to half the FIFO depth on hardware that
supports RD_THRESHOLD and update the read path to drain the FIFO on
each threshold interrupt until the final RD_DONE event is received.

Older hardware revisions do not support RD_THRESHOLD, keep their read
size limited to the FIFO depth and continue relying solely on RD_DONE
for completion.

Also emit a warning when RD_PAUSE_IRQ is observed, as FIFO backpressure
is unexpected under normal conditions and may indicate that software is
not draining the FIFO quickly enough.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-qcom-cci.c | 163 +++++++++++++++++++++++++++++++++-----
 1 file changed, 141 insertions(+), 22 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
index 9a8d201c890622d6c1f7b6b7aa2e0d7c075008ac..2ef4af603aa2b80614c6bff3a56424da6e4b0b5f 100644
--- a/drivers/i2c/busses/i2c-qcom-cci.c
+++ b/drivers/i2c/busses/i2c-qcom-cci.c
@@ -13,6 +13,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/pm_opp.h>
+#include <linux/spinlock.h>
 
 #define CCI_HW_VERSION				0x0
 #define CCI_HW_VERSION_MAJOR_MASK		GENMASK(31, 28)
@@ -36,6 +37,7 @@
 
 #define CCI_I2C_Mm_READ_DATA(m)			(0x118 + 0x100 * (m))
 #define CCI_I2C_Mm_READ_BUF_LEVEL(m)		(0x11c + 0x100 * (m))
+#define CCI_I2C_Mm_RD_THRESHOLD(m)		(0x120 + 0x100 * (m))
 #define CCI_I2C_Mm_Qn_EXEC_WORD_CNT(m, n)	(0x300 + 0x200 * (m) + 0x100 * (n))
 #define CCI_I2C_Mm_Qn_CUR_WORD_CNT(m, n)	(0x304 + 0x200 * (m) + 0x100 * (n))
 #define CCI_I2C_Mm_Qn_CUR_CMD(m, n)		(0x308 + 0x200 * (m) + 0x100 * (n))
@@ -58,6 +60,7 @@
 #define CCI_IRQ_CLEAR_0				0xc08
 #define CCI_IRQ_STATUS_0			0xc0c
 #define CCI_IRQ_STATUS_0_I2C_M0_RD_DONE		BIT(0)
+#define CCI_IRQ_STATUS_0_I2C_M0_RD_UNDERFLOW	BIT(1)
 #define CCI_IRQ_STATUS_0_I2C_M0_Q0_REPORT	BIT(4)
 #define CCI_IRQ_STATUS_0_I2C_M0_Q0_UNDERFLOW	BIT(5)
 #define CCI_IRQ_STATUS_0_I2C_M0_Q0_OVERFLOW	BIT(6)
@@ -65,6 +68,7 @@
 #define CCI_IRQ_STATUS_0_I2C_M0_Q1_UNDERFLOW	BIT(9)
 #define CCI_IRQ_STATUS_0_I2C_M0_Q1_OVERFLOW	BIT(10)
 #define CCI_IRQ_STATUS_0_I2C_M1_RD_DONE		BIT(12)
+#define CCI_IRQ_STATUS_0_I2C_M1_RD_UNDERFLOW	BIT(13)
 #define CCI_IRQ_STATUS_0_I2C_M1_Q0_REPORT	BIT(16)
 #define CCI_IRQ_STATUS_0_I2C_M1_Q0_UNDERFLOW	BIT(17)
 #define CCI_IRQ_STATUS_0_I2C_M1_Q0_OVERFLOW	BIT(18)
@@ -81,6 +85,18 @@
 #define CCI_IRQ_STATUS_0_I2C_M0_ERROR		0x18000ee6
 #define CCI_IRQ_STATUS_0_I2C_M1_ERROR		0x60ee6000
 
+#define CCI_IRQ_MASK_1				0xc10
+#define CCI_IRQ_MASK_1_I2C_M0_RD_THRESHOLD	BIT(16)
+#define CCI_IRQ_MASK_1_I2C_M0_RD_PAUSE		BIT(17)
+#define CCI_IRQ_MASK_1_I2C_M1_RD_THRESHOLD	BIT(20)
+#define CCI_IRQ_MASK_1_I2C_M1_RD_PAUSE		BIT(21)
+#define CCI_IRQ_CLEAR_1				0xc14
+#define CCI_IRQ_STATUS_1			0xc18
+#define CCI_IRQ_STATUS_1_I2C_M0_RD_THRESHOLD	BIT(16)
+#define CCI_IRQ_STATUS_1_I2C_M0_RD_PAUSE	BIT(17)
+#define CCI_IRQ_STATUS_1_I2C_M1_RD_THRESHOLD	BIT(20)
+#define CCI_IRQ_STATUS_1_I2C_M1_RD_PAUSE	BIT(21)
+
 #define CCI_TIMEOUT	(msecs_to_jiffies(100))
 #define NUM_MASTERS	2
 #define NUM_QUEUES	2
@@ -108,6 +124,9 @@
 /* The first and last bytes are reserved - not payload */
 #define CCI_I2C_READ_MAX_LEN(fsize) ((fsize) - 2)
 
+/* Unlimited read via threshold-irq support */
+#define CCI_I2C_READ_BURST_NOLIMIT 0
+
 enum {
 	I2C_MODE_STANDARD,
 	I2C_MODE_FAST,
@@ -169,16 +188,52 @@ struct cci {
 	int nclocks;
 	struct clk *cci_clk;
 	struct cci_master master[NUM_MASTERS];
+	/* Protects read-modify-write access to CCI_IRQ_MASK_1 */
+	spinlock_t threshold_lock;
 };
 
+static bool cci_has_threshold_irq(const struct cci *cci)
+{
+	return cci->data->quirks.max_read_len == CCI_I2C_READ_BURST_NOLIMIT;
+}
+
+static void cci_set_rd_threshold_irq(struct cci *cci, u16 master, bool enable)
+{
+	u32 bits, val;
+
+	if (!cci_has_threshold_irq(cci))
+		return;
+
+	guard(spinlock_irqsave)(&cci->threshold_lock);
+
+	bits = master ? CCI_IRQ_MASK_1_I2C_M1_RD_THRESHOLD :
+			CCI_IRQ_MASK_1_I2C_M0_RD_THRESHOLD;
+
+	writel(bits, cci->base + CCI_IRQ_CLEAR_1);
+
+	val = readl(cci->base + CCI_IRQ_MASK_1);
+	if (enable)
+		val |= bits;
+	else
+		val &= ~bits;
+
+	writel(val, cci->base + CCI_IRQ_MASK_1);
+}
+
 static irqreturn_t cci_isr(int irq, void *dev)
 {
 	struct cci *cci = dev;
-	u32 val, reset = 0;
+	u32 val, val1 = 0, reset = 0;
 	int ret = IRQ_NONE;
 
 	val = readl(cci->base + CCI_IRQ_STATUS_0);
 	writel(val, cci->base + CCI_IRQ_CLEAR_0);
+
+	if (cci_has_threshold_irq(cci)) {
+		val1 = readl(cci->base + CCI_IRQ_STATUS_1);
+		writel(val1, cci->base + CCI_IRQ_CLEAR_1);
+	}
+
 	writel(0x1, cci->base + CCI_IRQ_GLOBAL_CLEAR_CMD);
 
 	if (val & CCI_IRQ_STATUS_0_RST_DONE_ACK) {
@@ -204,6 +259,28 @@ static irqreturn_t cci_isr(int irq, void *dev)
 		ret = IRQ_HANDLED;
 	}
 
+	if (val1 & CCI_IRQ_STATUS_1_I2C_M0_RD_THRESHOLD) {
+		cci_set_rd_threshold_irq(cci, 0, false);
+		complete(&cci->master[0].irq_complete);
+		ret = IRQ_HANDLED;
+	}
+
+	if (val1 & CCI_IRQ_STATUS_1_I2C_M1_RD_THRESHOLD) {
+		cci_set_rd_threshold_irq(cci, 1, false);
+		complete(&cci->master[1].irq_complete);
+		ret = IRQ_HANDLED;
+	}
+
+	if (val1 & CCI_IRQ_STATUS_1_I2C_M0_RD_PAUSE) {
+		dev_warn_ratelimited(cci->dev, "master 0 read paused (fifo full)\n");
+		ret = IRQ_HANDLED;
+	}
+
+	if (val1 & CCI_IRQ_STATUS_1_I2C_M1_RD_PAUSE) {
+		dev_warn_ratelimited(cci->dev, "master 1 read paused (fifo full)\n");
+		ret = IRQ_HANDLED;
+	}
+
 	if (unlikely(val & CCI_IRQ_STATUS_0_I2C_M0_Q0Q1_HALT_ACK)) {
 		reset |= CCI_RESET_CMD_M0_MASK;
 		ret = IRQ_HANDLED;
@@ -232,6 +309,8 @@ static irqreturn_t cci_isr(int irq, void *dev)
 			dev_warn_ratelimited(cci->dev, "master 0 queue 1 overflow\n");
 		if (val & CCI_IRQ_STATUS_0_I2C_M0_Q1_UNDERFLOW)
 			dev_warn_ratelimited(cci->dev, "master 0 queue 1 underflow\n");
+		if (val & CCI_IRQ_STATUS_0_I2C_M0_RD_UNDERFLOW)
+			dev_warn_ratelimited(cci->dev, "master 0 FIFO read underflow\n");
 
 		writel(CCI_HALT_REQ_I2C_M0_Q0Q1, cci->base + CCI_HALT_REQ);
 		ret = IRQ_HANDLED;
@@ -252,6 +331,8 @@ static irqreturn_t cci_isr(int irq, void *dev)
 			dev_warn_ratelimited(cci->dev, "master 1 queue 1 overflow\n");
 		if (val & CCI_IRQ_STATUS_0_I2C_M1_Q1_UNDERFLOW)
 			dev_warn_ratelimited(cci->dev, "master 1 queue 1 underflow\n");
+		if (val & CCI_IRQ_STATUS_0_I2C_M1_RD_UNDERFLOW)
+			dev_warn_ratelimited(cci->dev, "master 1 FIFO read underflow\n");
 
 		writel(CCI_HALT_REQ_I2C_M1_Q0Q1, cci->base + CCI_HALT_REQ);
 		ret = IRQ_HANDLED;
@@ -389,6 +470,9 @@ static int cci_init(struct cci *cci)
 			CCI_IRQ_MASK_0_I2C_M1_ERROR;
 	int i;
 
+	if (cci_has_threshold_irq(cci))
+		val |= CCI_IRQ_MASK_1_I2C_M0_RD_PAUSE | CCI_IRQ_MASK_1_I2C_M1_RD_PAUSE;
+
 	writel(val, cci->base + CCI_IRQ_MASK_0);
 
 	for (i = 0; i < cci->num_masters; i++) {
@@ -419,6 +503,18 @@ static int cci_init(struct cci *cci)
 
 		val = hw->scl_stretch_en << 8 | hw->trdhld << 4 | hw->tsp;
 		writel(val, cci->base + CCI_I2C_Mm_MISC_CTL(i));
+
+		if (cci_has_threshold_irq(cci)) {
+			/* Hardware supporting the RD_THRESHOLD interrupt provides a minimum FIFO
+			 * depth of 64 words, with the threshold reset to the full FIFO size by
+			 * default. Configure the threshold to half the FIFO depth to allow burst
+			 * reads while maintaining sufficient headroom to drain the FIFO before it
+			 * fills up.
+			 */
+			val = readl(cci->base + CCI_I2C_Mm_RD_THRESHOLD(i));
+			val = max_t(u32, val, 64);
+			writel(val / 2, cci->base + CCI_I2C_Mm_RD_THRESHOLD(i));
+		}
 	}
 
 	return 0;
@@ -484,7 +580,7 @@ static int cci_validate_queue(struct cci *cci, u8 master, u8 queue)
 static int cci_i2c_read(struct cci *cci, u16 master,
 			u16 addr, u8 *buf, u16 len)
 {
-	u32 val, words_read, words_exp;
+	u32 val, words_read;
 	u8 queue = QUEUE_1;
 	int i, index = 0, ret;
 
@@ -502,27 +598,48 @@ static int cci_i2c_read(struct cci *cci, u16 master,
 	val = CCI_I2C_READ | len << 4;
 	writel(val, cci->base + CCI_I2C_Mm_Qn_LOAD_DATA(master, queue));
 
-	ret = cci_run_queue(cci, master, queue);
-	if (ret < 0)
-		return ret;
+	val = readl(cci->base + CCI_I2C_Mm_Qn_CUR_WORD_CNT(master, queue));
+	writel(val, cci->base + CCI_I2C_Mm_Qn_EXEC_WORD_CNT(master, queue));
 
-	words_read = readl(cci->base + CCI_I2C_Mm_READ_BUF_LEVEL(master));
-	words_exp = len / 4 + 1;
-	if (words_read != words_exp) {
-		dev_err(cci->dev, "words read = %d, words expected = %d\n",
-			words_read, words_exp);
-		return -EIO;
-	}
+	reinit_completion(&cci->master[master].irq_complete);
 
-	/* The first byte of the read is the slave ID echo, not payload */
-	val = readl_relaxed(cci->base + CCI_I2C_Mm_READ_DATA(master));
-	for (i = 1; i < 4 && index < len; i++)
-		buf[index++] = (val >> (i * 8)) & 0xff;
+	cci_set_rd_threshold_irq(cci, master, true);
 
-	while (--words_read) {
-		val = readl_relaxed(cci->base + CCI_I2C_Mm_READ_DATA(master));
-		for (i = 0; i < 4 && index < len; i++)
-			buf[index++] = (val >> (i * 8)) & 0xff;
+	val = BIT(master * 2 + queue);
+	writel(val, cci->base + CCI_QUEUE_START);
+
+	/*
+	 * Hardware supporting RD_THRESHOLD can handle reads larger than the FIFO size.
+	 * The FIFO is drained each time an RD_THRESHOLD interrupt is received, until
+	 * the final RD_DONE interrupt completes the transfer.
+	 * On hardware lacking RD_THRESHOLD support, reads are limited to the FIFO
+	 * size and only one completion (RD_DONE interrupt) is expected.
+	 */
+	while (index < len) {
+		if (!wait_for_completion_timeout(&cci->master[master].irq_complete,
+						  CCI_TIMEOUT)) {
+			dev_err(cci->dev, "master %d queue %d read timeout\n",
+				master, queue);
+			cci_reset(cci);
+			return -ETIMEDOUT;
+		}
+
+		if (cci->master[master].status)
+			return cci->master[master].status;
+
+		words_read = readl(cci->base + CCI_I2C_Mm_READ_BUF_LEVEL(master));
+
+		while (words_read--) {
+			val = readl_relaxed(cci->base + CCI_I2C_Mm_READ_DATA(master));
+			/* The first byte of the read is the slave ID echo, not payload */
+			for (i = (index == 0) ? 1 : 0; i < 4 && index < len; i++)
+				buf[index++] = (val >> (i * 8)) & 0xff;
+		}
+
+		if (index < len) {
+			reinit_completion(&cci->master[master].irq_complete);
+			cci_set_rd_threshold_irq(cci, master, true);
+		}
 	}
 
 	return 0;
@@ -755,7 +872,7 @@ static const struct cci_data cci_hw_catalog[] = {
 		.queue_size = { 128, 32 },
 		.quirks = {
 			.max_write_len = CCI_I2C_BURST_MAX_LEN(128),
-			.max_read_len = CCI_I2C_READ_MAX_LEN(256),
+			.max_read_len = CCI_I2C_READ_BURST_NOLIMIT,
 		},
 	},
 	{
@@ -764,7 +881,7 @@ static const struct cci_data cci_hw_catalog[] = {
 		.queue_size = { 1024, 32 },
 		.quirks = {
 			.max_write_len = CCI_I2C_BURST_MAX_LEN(1024),
-			.max_read_len = CCI_I2C_READ_MAX_LEN(256),
+			.max_read_len = CCI_I2C_READ_BURST_NOLIMIT,
 		},
 	},
 };
@@ -811,6 +928,8 @@ static int cci_probe(struct platform_device *pdev)
 	cci->dev = dev;
 	platform_set_drvdata(pdev, cci);
 
+	spin_lock_init(&cci->threshold_lock);
+
 	for_each_available_child_of_node(dev->of_node, child) {
 		struct cci_master *master;
 		u32 idx;

-- 
2.34.1

