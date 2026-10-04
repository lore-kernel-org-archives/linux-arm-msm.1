Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4BC6497B98
	for <linux-arm-msm@vger.kernel.org>; Sun,  4 Oct 2026 19:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791141005; cv=none; b=nRRb4vWIaWfV1eQemRLka4ou9latao38G+BJWPki7EP3Ad5BuAKxpVRKvxM742YnAS74YdE5oU/Bo5k5fSnOIuWMbI2sk1THhfXAFVj9LaI00KDWWrwzpEE+3+ZcTXZuEHxpikuynMG2vXD5LxGD0jvJnVdAn1Aq9QdC92Jmti4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791141005; c=relaxed/simple;
	bh=cFeblvwPftksG2AVCzV/tkFe9/LaOzyZoKiDxNG3L8A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tlZ0OoQhGsZ8fb8j8mUiy4kawmq4tbrdkWsJ+DZeLzvWAN9MMhAuOvfULvNGSxtYNDXO1azy9UK//sDeEF6diM6v6XTTi0h+KiowMuMF8m85Czc+oVul0BRTtzuhUHQbuzScvujNuxMqeUM/wtX/SnPJA9tQiu+pQVaZdTnBGjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GMvvBnmd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dfmd9uZx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GMvvBnmd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dfmd9uZx"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 694IJDNb3675121
	for <linux-arm-msm@vger.kernel.org>; Sun, 4 Oct 2026 19:10:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DxsrjknzXZqK4ShoWL6zLdXOirQvks0hlKrZuyPXacM=; b=GMvvBnmd1YE+QLYs
	aa8mxne/fCGQgm8w7ehn0qW9NW8ObmV1Gh7/xQDcF6M9wPWW7nBg+fXTXm9MOazg
	XAKkEYdaFMk8TQMjRl+Rf5Op7uFHMkgWA+tSBzAoKyXCW03c9VYA4A5c+mWl3AA5
	SHg2XMRNZxG+3s22Enu23JtCx/XK/79GgByca4adkOTd/t8NpOSrx0X1E+5TdDNv
	Bl00F6OtaABnkJDHqtZaHvjH2SDh71ITfTmQFZBW+XVIREjHIaqH7MdTQ6xm6P5u
	UxvJIejGMLM3zYkylCj+o5ULWVeCgrvcA+PA2CCPbnA/AIp/Cft+FEIpqbnMt4Jn
	Tjm7lQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2t06ukw0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 04 Oct 2026 19:10:00 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93ca9b53afaso284889785a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 Oct 2026 12:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791141000; x=1791745800; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DxsrjknzXZqK4ShoWL6zLdXOirQvks0hlKrZuyPXacM=;
        b=dfmd9uZxlc0DxHcIkMUtFRiF0vYmhpkuwkYp6NKMP7EHNrUWiyx2VIn+n6cKbdVQSl
         982h5S1VR8LjmEgHBt1aykdRfx4dzsKegp1RXvgKutun4hyAqCThArZyPCDFQ2IVz3cc
         V63PGku/5o4JE57UYZLygdSfT6Wna4+FjxPz0Mc/4jA/Z7y4ryKAq4CL4eJT4PAuDW07
         lhHkzw+NG6qGox1Pblh3kMV1poHegkjs80jQ5ccSfwNResXZJJ2KGeI27PpM646ujyJT
         tSavnJW35UQcxqWUrSalogFrLgQlDwfgDO336BqPHi+UuzSJMTCwGNApsX14MS9qbQuU
         MMLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791141000; x=1791745800;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DxsrjknzXZqK4ShoWL6zLdXOirQvks0hlKrZuyPXacM=;
        b=F6L+F/NAIediLhf4GaR3KLZ0sAPR7zelwKr67IbCOgaj/01YWxT+3q0vB8ES8q2xk6
         TpN+MIZFEFi7hAo/yaiZcN7oSBf4QKD9NHXIz1eHwG4OUNvXGrMGilzAULYBF36WMSb8
         o16ovtiZCrapUn4dHtjkeh/yQuEcXu8o1eeQDR25ET+I6tXWmEr4706W/8zNXtHFZFMK
         JDbnAdxtT+8COJJfbBhstFDnG6p/gxk/RNrcZT3K/Whbm8CsMhQu8sN5pCikUbZwkOqW
         UY4TDw7BFdrlpg0zD9uZrdUOqrwz2HP9asnHGSjE6uRdNOlaXB2jN6U/b9VkgFSiPjbU
         h4kA==
X-Forwarded-Encrypted: i=1; AKwUvByQTBqiFb7kMJZ8IwC4PX1S09mu99vfB+KchgLf7wJxS8GDTu1x7NHQ1hof8hltP2eVW8ETuSL7ZUHMT8ah@vger.kernel.org
X-Gm-Message-State: AFuF++n4BteLv2732mQFpgTEUa0y727Ls3QngetLEA0ETr6+lpU64cZu
	A3aZyNarIiWZnDxYRHudZjMV4ZtbYgbuc6HkLg5DM99MrN+FZmFEe4XvuvvFc3XQi3447HPmI1O
	4C7K2ROL92cL3adWcFkCjIHFyYIhjnSVmdcKZo4ab3LLdROF9B754HqOu/71VrSW3oofn
X-Gm-Gg: AYBFou2AOUbLTBj0GERfo8HM7ydeilCBKGFFS1QeT7MoazbbiSmBRcp6YIw+S03NCZw
	jL+ybfofLd6+M+fYzQdfA4m8lSdLvXZqGxQ/JbPpf9G2PCCsJ+HpCYiNjOkQVZ20EW4yul8tfo5
	h39pzs5dUmpJCaCtyJJLuGiZEpQIYrwNnMCxS/OQFyU/Gfg534Wu4c6KJA1Q5vooPiZeU0v5I4B
	vhfBtNqTy1JsHei5HwXAcwzbEaNYX8Cg0/0pftZ92kDRD7FqC2bZAZnw0DClc4IDebdkf1WZZMC
	oVBW/Lu0fkyLm0ELaWOh3X/JthDTU8jBH7+zxhqrNxQB0tqbCGHSS3Ilc4ObUlVH7Z0lGsqwWIR
	4ShH0iWvv7wIlhjkPC5AOneG67nHbd0elPtSGsgw4jY6UpwNgBnknJPUYLS1xVCAsH2GJdfKD28
	RRGsKpouyemuHSsyA8cyXY/62xePgWrDcWux0J1fqmznGYyCmtug==
X-Received: by 2002:a05:620a:2626:b0:93c:6fa0:9813 with SMTP id af79cd13be357-93cf19d9244mr1564864285a.43.1791140999847;
        Sun, 04 Oct 2026 12:09:59 -0700 (PDT)
X-Received: by 2002:a05:620a:2626:b0:93c:6fa0:9813 with SMTP id af79cd13be357-93cf19d9244mr1564861385a.43.1791140999409;
        Sun, 04 Oct 2026 12:09:59 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([37.169.59.74])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0394ca0f0sm176318385e9.1.2026.10.04.12.09.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 12:09:58 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Sun, 04 Oct 2026 21:09:48 +0200
Subject: [PATCH 2/5] i2c: qcom-cci: Handle and report queue
 overflow/underflow interrupts
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261004-cci-imp-v1-2-227d12cb4829@oss.qualcomm.com>
References: <20261004-cci-imp-v1-0-227d12cb4829@oss.qualcomm.com>
In-Reply-To: <20261004-cci-imp-v1-0-227d12cb4829@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=cf5HPXDM c=1 sm=1 tr=0 ts=6ac2a488 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=1Gfya9YG+27Uq/30OuQ23A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Dn-INlxkzmUqY9OSjTIA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: liJe1KYoMQBrlWL9222TzaPUkZTz42JZ
X-Proofpoint-GUID: liJe1KYoMQBrlWL9222TzaPUkZTz42JZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA0MDA3NiBTYWx0ZWRfX0pVKjrTvwBVn
 GEE+wRpAgTlOmwmxzvdk7c1LRf7B1J3X/smufaWCJDeLE6Wphx5cORgIFJqnwttKeL2g4T45gOF
 n6xaHkPlX4+PAx4APtZ96nc8lON58Cgifm5oiv286+FRpmg+41zK7BX+nAH+sn0fOJIsRSs3X/v
 9kB1jMQj0qzX9jRz8tKzIXaGhNNEzfWvUI8AO0SlAStOIPQ0xRQ8PpwbMujquaQRbw38n5weZoJ
 XaExB0iujiKkDTaesx173jnghNiNoxnYeobcWUsHakTyPes8AgTzYYwPpDmfgcVIgtWUBBrQLZX
 O9rqvGF7GQF7xNavbNSyj1zQVeZbNW4aaE/iZgWmEPLj02xiHeq59kMNgSq62Yf0nxIXmzrOWFN
 lY4+8M32l27/rxhjaycIb33g/kunCXKP9XI0l/CPgC9rPnh2RB4kdCcVikm5JkjNX3dMLC+S7Gx
 zGPxQP+VOtmmvC8qfRQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA0MDA3NiBTYWx0ZWRfX1lmnvQ7R4iuE
 XI9+5Y6JzCWGWS31BSQoQIyMXt0EffXsohYISXFaYaNssqt3i1m+NwjU8JIkFff/Lsk8sQQf5qY
 4LEHIRTfErcfc4f0h3FkHI9BQfK1yX8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-04_05,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 adultscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610040076

CCI_IRQ_STATUS_0_I2C_Mx_ERROR aggregates the per-queue overflow and
underflow bits together with NACK_ERR, and all of them were
handled the same way: report -EIO and halt the queue. There was no
way to tell a NACK apart from a FIFO overflow/underflow in the logs.

Decode the individual overflow/underflow bits for each queue and
report them with dev_warn_ratelimited() as such errors are not
expected in normal operation.

While at it, change the HALT_ACK branches to OR into 'reset' instead
of overwriting it, so a halt request for one master isn't dropped
when the other master's HALT_ACK is handled in the same interrupt.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-qcom-cci.c | 38 ++++++++++++++++++++++++++++++++------
 1 file changed, 32 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
index c4bb97868c54de636be756328ca7ee4e46e6b400..099da0069251681cc52e351fb656bd73e78a96c9 100644
--- a/drivers/i2c/busses/i2c-qcom-cci.c
+++ b/drivers/i2c/busses/i2c-qcom-cci.c
@@ -54,10 +54,18 @@
 #define CCI_IRQ_STATUS_0			0xc0c
 #define CCI_IRQ_STATUS_0_I2C_M0_RD_DONE		BIT(0)
 #define CCI_IRQ_STATUS_0_I2C_M0_Q0_REPORT	BIT(4)
+#define CCI_IRQ_STATUS_0_I2C_M0_Q0_UNDERFLOW	BIT(5)
+#define CCI_IRQ_STATUS_0_I2C_M0_Q0_OVERFLOW	BIT(6)
 #define CCI_IRQ_STATUS_0_I2C_M0_Q1_REPORT	BIT(8)
+#define CCI_IRQ_STATUS_0_I2C_M0_Q1_UNDERFLOW	BIT(9)
+#define CCI_IRQ_STATUS_0_I2C_M0_Q1_OVERFLOW	BIT(10)
 #define CCI_IRQ_STATUS_0_I2C_M1_RD_DONE		BIT(12)
 #define CCI_IRQ_STATUS_0_I2C_M1_Q0_REPORT	BIT(16)
+#define CCI_IRQ_STATUS_0_I2C_M1_Q0_UNDERFLOW	BIT(17)
+#define CCI_IRQ_STATUS_0_I2C_M1_Q0_OVERFLOW	BIT(18)
 #define CCI_IRQ_STATUS_0_I2C_M1_Q1_REPORT	BIT(20)
+#define CCI_IRQ_STATUS_0_I2C_M1_Q1_UNDERFLOW	BIT(21)
+#define CCI_IRQ_STATUS_0_I2C_M1_Q1_OVERFLOW	BIT(22)
 #define CCI_IRQ_STATUS_0_RST_DONE_ACK		BIT(24)
 #define CCI_IRQ_STATUS_0_I2C_M0_Q0Q1_HALT_ACK	BIT(25)
 #define CCI_IRQ_STATUS_0_I2C_M1_Q0Q1_HALT_ACK	BIT(26)
@@ -177,12 +185,12 @@ static irqreturn_t cci_isr(int irq, void *dev)
 	}
 
 	if (unlikely(val & CCI_IRQ_STATUS_0_I2C_M0_Q0Q1_HALT_ACK)) {
-		reset = CCI_RESET_CMD_M0_MASK;
+		reset |= CCI_RESET_CMD_M0_MASK;
 		ret = IRQ_HANDLED;
 	}
 
 	if (unlikely(val & CCI_IRQ_STATUS_0_I2C_M1_Q0Q1_HALT_ACK)) {
-		reset = CCI_RESET_CMD_M1_MASK;
+		reset |= CCI_RESET_CMD_M1_MASK;
 		ret = IRQ_HANDLED;
 	}
 
@@ -190,22 +198,40 @@ static irqreturn_t cci_isr(int irq, void *dev)
 		writel(reset, cci->base + CCI_RESET_CMD);
 
 	if (unlikely(val & CCI_IRQ_STATUS_0_I2C_M0_ERROR)) {
+		cci->master[0].status = -EIO;
+
 		if (val & CCI_IRQ_STATUS_0_I2C_M0_Q0_NACK_ERR ||
 			val & CCI_IRQ_STATUS_0_I2C_M0_Q1_NACK_ERR)
 			cci->master[0].status = -ENXIO;
-		else
-			cci->master[0].status = -EIO;
+
+		if (val & CCI_IRQ_STATUS_0_I2C_M0_Q0_OVERFLOW)
+			dev_warn_ratelimited(cci->dev, "master 0 queue 0 overflow\n");
+		if (val & CCI_IRQ_STATUS_0_I2C_M0_Q0_UNDERFLOW)
+			dev_warn_ratelimited(cci->dev, "master 0 queue 0 underflow\n");
+		if (val & CCI_IRQ_STATUS_0_I2C_M0_Q1_OVERFLOW)
+			dev_warn_ratelimited(cci->dev, "master 0 queue 1 overflow\n");
+		if (val & CCI_IRQ_STATUS_0_I2C_M0_Q1_UNDERFLOW)
+			dev_warn_ratelimited(cci->dev, "master 0 queue 1 underflow\n");
 
 		writel(CCI_HALT_REQ_I2C_M0_Q0Q1, cci->base + CCI_HALT_REQ);
 		ret = IRQ_HANDLED;
 	}
 
 	if (unlikely(val & CCI_IRQ_STATUS_0_I2C_M1_ERROR)) {
+		cci->master[1].status = -EIO;
+
 		if (val & CCI_IRQ_STATUS_0_I2C_M1_Q0_NACK_ERR ||
 			val & CCI_IRQ_STATUS_0_I2C_M1_Q1_NACK_ERR)
 			cci->master[1].status = -ENXIO;
-		else
-			cci->master[1].status = -EIO;
+
+		if (val & CCI_IRQ_STATUS_0_I2C_M1_Q0_OVERFLOW)
+			dev_warn_ratelimited(cci->dev, "master 1 queue 0 overflow\n");
+		if (val & CCI_IRQ_STATUS_0_I2C_M1_Q0_UNDERFLOW)
+			dev_warn_ratelimited(cci->dev, "master 1 queue 0 underflow\n");
+		if (val & CCI_IRQ_STATUS_0_I2C_M1_Q1_OVERFLOW)
+			dev_warn_ratelimited(cci->dev, "master 1 queue 1 overflow\n");
+		if (val & CCI_IRQ_STATUS_0_I2C_M1_Q1_UNDERFLOW)
+			dev_warn_ratelimited(cci->dev, "master 1 queue 1 underflow\n");
 
 		writel(CCI_HALT_REQ_I2C_M1_Q0Q1, cci->base + CCI_HALT_REQ);
 		ret = IRQ_HANDLED;

-- 
2.34.1

