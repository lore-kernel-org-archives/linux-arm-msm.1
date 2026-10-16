Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A135C448BA7
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 08:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792137619; cv=none; b=rF4mZY66A6erl+UVvc6lzAY2zm4y9DFzZ/qkybkZmUw5M61eFpr0JPER5EF238bNyqPQTPao2ae7e4XfwSM3LGmK1TfMhabBlkrVgfTyNX+P95A4DIrol3+13LOhvcg0zVUBk4ELN2Ef3BbsZyYthRVysSnSOlSqI9AH7QtAGkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792137619; c=relaxed/simple;
	bh=W9j2KZdjKaeyag3XjecHiDdE7lkCbXf4pdsC5aFa4zE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MyHJRr+1ZH6FRT8gMH1txNVeRUdKjf8VbXt6eLx/Mz60cPhHerqUJn59MHmOdDvVBn0GiXY3klqp43STvVdtllcyI9Dy/tGtTLvgXkjGztbMZGZK6wtSJ4qkbk7JTrHMwgdeM2vqiWoB6pvW3U7EnzT4FIrmL0vXjQoS3eRVLhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mh7hDXQr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cK9b97mo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mh7hDXQr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cK9b97mo"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G7OlSC1635320
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 08:00:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QUmAqm3vXdqYAolFk/P0Rkan80/YYQAPrUcDWiq33Rc=; b=mh7hDXQrsuHOF0nm
	lSiPZq9Sf57XZaNMxySgyWydWn1qYu2d0JrFqsi8zUSxkEgBv1AxVXzIa1gOgEGb
	3f50HH5k9HTHhXvs65qRrEn1MqVQjLpwQCtD+OjOQaC444vwH3xWgS+K/uRHjHdy
	ZzYdMe142XbfybpIax6risXqFhJItHZMll7i53bU9VDvKB2wiQd5GCdZBZu/9kKS
	xeWQ3im8KHjKj3SgqT0qvKehG9GVZ4kC0giF1r7jJRo6aTgTtMqOlJ7pchDLqIPM
	dHm9i0Bsy0rAGT+28SF5WCdgIdPPO5Pn34N7/ZrFDPQTrq6mdBFJ/U6bwqsVN5MH
	BjkY9A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb8r11hxu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 08:00:16 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb71b1443so1318689885a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 01:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792137616; x=1792742416; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QUmAqm3vXdqYAolFk/P0Rkan80/YYQAPrUcDWiq33Rc=;
        b=cK9b97moZCiDcQJ5SlQ98B0uBbAXpvoNrWlN72BKFoDJyKxoiY12YdY42OE+gCZkGB
         fz6y8BgZEPNY/anCc3IiTXqeLRRdTZTZr4eTjRrP7MoQPynQYYmT/Z4Cb/aCBx2ydraM
         /4bOMepVAh87OoHhr9mupuRoMx3DazGb48Oxumq1JZNRHP1uOCBoNqKPmKY3MnP3YhlC
         bRGaMHUwqfys+/OesF4xbL1D2n+SOAwtKGMSIrl4+Som8Hj3fWtXiZsi5/CYjS+kDZEs
         3ZnBV/emZa4LZ3kX/JwyQB5znUxhUyEFnU3LCkO8OM/sgY+ySZ9vYDqdJKd8NKv7PotW
         pwOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792137616; x=1792742416;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QUmAqm3vXdqYAolFk/P0Rkan80/YYQAPrUcDWiq33Rc=;
        b=ynIVExImvEhHZKeYUcPPR8c3N8ZDHc3qjmHVqvm2PkoyDYR3/ZWpBAmdcE7ITXWQ3l
         ViiiG/zJ8I63kIep81e3LQ9fbk+lcw7z+OLBZAEWONC16ckgO2bIc+tewvOHHcw0AC+H
         QFb/R+vcF9ozdN7Qh7QGRvKh7A4whkUkahIj0sPd7Qwzh2be6bRuniMYWHWv72qVHwvb
         oP2sSujpLPfZFyMTdpgCC337EtV8YSYYeAzP1V8J5CPRtAPi6t6TeV8KT2JZ3qQSLNL3
         GVypxDKcCy1de5NIeIkFL2Br4sH+goF0/+036USaCoEDGHdQ5U9D/6hPoUx5Ld+FY4Vg
         DibA==
X-Forwarded-Encrypted: i=1; AKwUvByLPLRUfxMK5d3nMWMXI3r3aYpI09iGOFG9ehDSxNRGkixGNtOB9TURoOofzxOiNzPwQHD48/KARhDNHH+Y@vger.kernel.org
X-Gm-Message-State: AFq9FYLt2lCS1jk6qKdHMJ8NG1ovaF5cTVUdWAsawUwpaFBB2U5hZFEl
	ttyFmbDLPSL3OdwXnYOsPSEuQ3cUPRVsZrH/tNMMYmxz/IBW6qQlvNBI3kj+vHjzqD+Igpc9mF4
	X3gjTa3i/rCGtCHCtrEBTRqvDklWEDxxxn83l3/Vdm8nwks1X1kpLonGjauo48+DMJMGCpHQ3T3
	4Ef09daA==
X-Gm-Gg: AYBFou1ZbtYdSgUhls4UJHEmPrPEU1FXla1CkmVSmy9kqb9wc/IDNuDLmcxfoAt6zlu
	73R9NePUWA9erGZJS1purfA4D/bpj2zYtr6GMWLmkTuYAJMBrhV4Egr9hsqSHOSQJKHnA0rixqJ
	m1/2K4iDYdk3QIQp1/aiYTfE2gGiGn4ij83dajUB/iazeDbvhYAO91dTlTMkDv5dJRHP4A3Z9gW
	qn7VhMOrKe8dupe/U32GXcvUkMU5cdqtumiSkpHx2VOmkJKBjmI3AGh/uOAsWDso33E8C0U2Mgg
	LwRKabn5cuZazRyKxTuGxX7pnj42MkEONdvy54pVWrqERQ56syizKIYHr5aIqa4zjmXH5jIBLpq
	Lj1aAEtF8PpcIcFb/EEZReDajOl7s89mAk2ZvcsMngdMfMVsFRUBZ3+psNdRzykMAAOYfykuOtI
	cffUbD3gzfb+5AFYfmgcUkwgc1pVUZ5EiQuwWoCNZNUuerv8hEcoI=
X-Received: by 2002:a05:620a:6844:b0:93c:6963:ff3b with SMTP id af79cd13be357-93ebd2634c9mr3364276985a.42.1792137615542;
        Fri, 16 Oct 2026 01:00:15 -0700 (PDT)
X-Received: by 2002:a05:620a:6844:b0:93c:6963:ff3b with SMTP id af79cd13be357-93ebd2634c9mr3364272185a.42.1792137614897;
        Fri, 16 Oct 2026 01:00:14 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:5402:5e0b:9ef0:9b5b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4c5942sm5471446f8f.16.2026.10.16.01.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 01:00:13 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 10:00:10 +0200
Subject: [PATCH v3 2/7] i2c: qcom-cci: Handle and report queue
 overflow/underflow interrupts
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-cci-imp-v3-2-5ee7ec1ea1a1@oss.qualcomm.com>
References: <20261016-cci-imp-v3-0-5ee7ec1ea1a1@oss.qualcomm.com>
In-Reply-To: <20261016-cci-imp-v3-0-5ee7ec1ea1a1@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: aZY_aEVaEoDEjM8deu_-C25vF6DEAImV
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzMSBTYWx0ZWRfX5jGHbywKLSRP
 IWNVvaAX5y9e5qZrfswlOGKepfEZrI7K72fBOaZKCuVAfDJ6sJwxBh1JH4gnHPJs3efXCD1ss2q
 Mzk74thnYqNzGBIAIrjaFTItXvQUoVA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzMSBTYWx0ZWRfX3bw1iR1MnQj+
 6PvfqD1L0FxnNnZfmFLskEUvVjuiKl2jOpJ+XcU79rVxbWp1aKQLCGcIegdu349tPjJGoU7O0JO
 AIzQUxqYS8YOAghHxd66YSvC+ee4wAFjP0J2K26SpaI2QRadcnHhcKu+px+sQ8t0EeYW1VdeiUd
 06HHIkOSC+tLFxSkkzVM+bopBAfAS60gWdrsuggah43buoAp8C2OR/H9WIbWKZCq+lcf5sFXACI
 ravANGhUu2flPEma5wv1+vWJTq2ZOb3Hayr+orJqIFBZaKj6W7oKkcXBgrDNSig7REK7I74dl3R
 m4kgb2BZgY0Jsdgj2d5+Nd++h4o2G2JcGSi7jjbHq65RDHkETtV7XJKQFCIt78A9Sh64cdr8tYl
 l5vPN4QDSivmSx+Xq9mMySLGFqJjoVQQtgIYjCCLyezLMtFTMG02S64A5IU+Oi6VIfOzKQc2Iiv
 upOC7KpYp5P9nM/0fBw==
X-Proofpoint-GUID: aZY_aEVaEoDEjM8deu_-C25vF6DEAImV
X-Authority-Analysis: v=2.4 cv=L/CI0OT8 c=1 sm=1 tr=0 ts=6ad1d990 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=L19FZshse16xndK5FkAA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160031

CCI_IRQ_STATUS_0_I2C_Mx_ERROR aggregates the per-queue overflow and
underflow bits together with NACK_ERR, and all of them were
handled the same way: report -EIO and halt the queue. There was no
way to tell a NACK apart from a FIFO overflow/underflow in the logs.

Decode the individual overflow/underflow bits for each queue and
report them with dev_warn_ratelimited() as such errors are not
expected in normal operation.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/i2c/busses/i2c-qcom-cci.c | 34 ++++++++++++++++++++++++++++++----
 1 file changed, 30 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
index 5bec317c15deddc01d3f3a6418af4164c0d56fd9..897502f55e42ddd6ea591ec756606ac07044dc0e 100644
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

