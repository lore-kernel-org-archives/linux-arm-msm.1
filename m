Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0CE14C33DE
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 10:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791887437; cv=none; b=j1LjhxLNNOZYQTe30cfChcMdAwHZ1QH8suEWuCGZzbN0vdo4t23Nv/6+mvSV/ep1SHcrq3JjNI5fHJDavDAnvMrHYARjTGLTEPk0UgXrHf0KF04CTfTu0CJVbQutE320u79L6Mxbo1KOLj8tgVS+QKJs3NkqCp8zh4fCE5AqTxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791887437; c=relaxed/simple;
	bh=vfE6OmYRp/eyHIg3fq4n77FSKItN33OklybpiIvREks=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bcF9gvtrDVL8UPVLVQM7c0lLXKd6zSSQvPG9oSrvdcIOPPbSOLQsiKZ+eDQfQjx3tUP6jeMgFni5W8odLTTu6W6HvWxZANaFX6Yu+E8+VKxCgcR5uZ95JO2kMo16C3DCiDI8EGEMxnbf/x/XVhrrAsgXSfTQbJef7YBC4SNB6gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=knuYwcmN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EFs6tQLQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="knuYwcmN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EFs6tQLQ"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8HCid3908182
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 10:30:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gWdIPEJCACXXkjJjb8PQxL0SVTjR4Vn5uqqJdivVJIs=; b=knuYwcmNJlZpeD6T
	tnChmTxyDpiKpv6fuWw6NbVWize4q0qGS/2Qj9dDfN+GX7BaXAJhibHjfEx+j3R3
	Uc95hNbliSAZZymsvOwCf0+LEQfS/pmWAmGQpgsl+Vd+0YU5ghMth5BeVgK+AVQy
	SVhTpsG/HDc+UrWMtz+QnOottQHAAKAwoxUBubC4fEZTZ24IM1/nzq7lVQ0GXO7q
	UR93Yj2g9zY/nD3KWzTsIU+kYDTCL32WQBxdA64UuOtf6h3jZth2RknCXkJWXf0z
	0Yjc7vBHlbqwyyIPONmWq/8xry4i54LWbGC21MWfnPnZ/hVOMs6471cmMpFYsdpc
	4TVGkA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h95xqu2c7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 10:30:34 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93ca9b53afaso780086285a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 03:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791887434; x=1792492234; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gWdIPEJCACXXkjJjb8PQxL0SVTjR4Vn5uqqJdivVJIs=;
        b=EFs6tQLQsNWvsJ0KHk8DDJ6A0B3MBVpfjmOYZi1TdsClwY0Q649mYziUCulFelWuoG
         c+vaHLCe87wa12c7sIoDD0PZdyE5V070uFf7fxM2qhjmH2aAqfTtyTzaQDnXCo2HkcLn
         OWeU/fWabZTNev74qD3LlGgpnVdFbEGtt0sjEL/t2y/Sk7nv6vw1vJwfobdpDGRBJbKv
         BitzuK8qXli51bNHeOFvg6lrAHywOxdEta2YBVl4FZxTz1wu6svYbVBiJGVIHeEX7KOr
         oPgYusms6T6jQaT0XA1tBgjzBa8sj+2AouK3nmAIQwmkR3fFMyXF0h9E9lXInZteVgCK
         Vz+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791887434; x=1792492234;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gWdIPEJCACXXkjJjb8PQxL0SVTjR4Vn5uqqJdivVJIs=;
        b=JnWuhRVq1YstvDvo/Cm8WgRD70byuxxPIz1ASMibFgOrVflAKvgfjWKkWd4ZUXd1LL
         nDH6jMj1itsXxcTGjYz64uk7m4Q0wtNcAhE7hAzHvis58SRCplpxtWZPSzTs9iW0fR9E
         HYfIZLYPU0u7K6HmqParWbPVXIqsiSqD1X0kWoiPeVMRiH8jLt1GM93PribmjvU9KrPg
         Bomw5CGyuLCvXQ3UY/VTFoHvCtzixiHKD1OoEtLPZwxaCUVFFq3AXwNAuE5xDinvvhgO
         arasbnoIWt83RmBgUdTqpHuuOLmxTNZMKCYIfM6h/qQWCdCU3pL/rK13h1IHOdPhuIMG
         fImw==
X-Forwarded-Encrypted: i=1; AKwUvBwXvoXV6M9UzjyyFnlM4+In5FxuJHfZqry4r39NEXBJqoFuyc49ClARytfzCTzCLfodTtiehAQc06HSl+AN@vger.kernel.org
X-Gm-Message-State: AFq9FYIuaehZWnQNaXM/zhWlHEurjQGN52FOLIcOy7iAKRks6lfKSkVu
	YxSCA/LEkH2kGora7vcF0nOoOrTzhdyZ6z/0H2Q0B6Q285DYAAxzqqlEPn364wJG5YvZaBMFRgU
	uN6DgI/PFg458ncLzcptq6hxH8ir8T1oCvLYXcU0UmT5qR0DPT/eA7jFam/ylFofY1A4c
X-Gm-Gg: AYBFou1AG58XjYQVh1wAYAJydslYdJro2RSACwkqK56zrVDnHQ1fMj5f2/tqvr1VwIN
	aMkzjHUcRRvZ29XwzfRLofS4H+gvTqNgw8Ha7D/MXU7MddBsXpU7u5Bd3oAFL0wfPkh1xktcswy
	3P1013d0xQYb62ytz4B952nkiCzsv7aALoyxc/9aiR7U7J5G5nNE/7iAsQzItxwA9PSvF2etPbV
	bTdjx/RIldwuNCEfT2H4Gtv014m8dw8t7CIpBkkUpIduXRwisuW9pEwdChyQ1yHz7KA1qFEJVZ5
	87//i3AsUmm58yEEpEgAdru/+67pNgpuCJcN9jtTaeyY6Mh5qbFkOwUyz7TUvzY6oBMWRLS6UBe
	GMuXlSO2BOceLmuSEaKK0yb6UikbR3ERGgGQwOXfJK+EaogwmKOHC64qfpY+8D0RFazXCcthyUi
	yE0Ffu7EC9hFi8vdvzGNYUkh5ivX/qOMDVcFOzQEaUfTIgQs3lJ/U=
X-Received: by 2002:a05:620a:4689:b0:93e:5312:3c96 with SMTP id af79cd13be357-93ebd20e0c1mr2147145785a.26.1791887432820;
        Tue, 13 Oct 2026 03:30:32 -0700 (PDT)
X-Received: by 2002:a05:620a:4689:b0:93e:5312:3c96 with SMTP id af79cd13be357-93ebd20e0c1mr2147140185a.26.1791887432174;
        Tue, 13 Oct 2026 03:30:32 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:d108:3895:812b:662a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18be964dfsm349955115e9.7.2026.10.13.03.30.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 03:30:30 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 12:30:26 +0200
Subject: [PATCH v2 2/6] i2c: qcom-cci: Handle and report queue
 overflow/underflow interrupts
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-cci-imp-v2-2-6873326b44a3@oss.qualcomm.com>
References: <20261013-cci-imp-v2-0-6873326b44a3@oss.qualcomm.com>
In-Reply-To: <20261013-cci-imp-v2-0-6873326b44a3@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0MSBTYWx0ZWRfX87YcqR+JIdyi
 SMQGCtY2+Sl8BaZtDMyfS/AIxyqX3mA7lsOQ7i7uqpCZT1SzVwAfvL6JApPAs/bXaCu/U2Duk4T
 n3pwqlsVkDgVLK3Pa7kVgCHofpWkKfw3425UzUfjz+rmFPAXZADUQJ3sGprfG23SMdcKb95k+3q
 qr+UOWkusWwYraIPlpEGLc5s1HQVj5rn5rTdgXq08nfj+xpx7rjeeqcjcBq2PFzL7xYhgZjaTTt
 PUJIJTD7truMIGJ0CXSt2ZoiFetdTACUwbmDDYZzfdJx/EXeyn8rkujilDRLBI/nkDhugLUK/hZ
 g9gBcrZR1Jq/lFk358xLPkRaExnrLf/1j35LkQd7BQwSXL5AzZI1TmWKzpyjzbVFgvKIuarb4zs
 IFYF1FbP+6g7wE9ViEvgD5XAmMLU74Aaq7rJSbHGpbxomYhgl6eIU8yjsiVDizeycWS17GAOHfA
 dNU3aaMxlr8p3LceKJA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0MSBTYWx0ZWRfX5aXH/6lu8XDY
 1Y6f57P0A2ZhaOgZ7Nh5nPEnMJiIXEIHnlSUGi5ThfLGfupjtbIK5w9Ij78AiLsIH2kKXXuk3p5
 5g4PNODdH4rOedhy1mE6Tod4O0L4tO0=
X-Proofpoint-ORIG-GUID: 3E2pHiAq7VSaZ3MOIj0zrou_oyJEO38W
X-Authority-Analysis: v=2.4 cv=EP+TQFZC c=1 sm=1 tr=0 ts=6ace084a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=L19FZshse16xndK5FkAA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 3E2pHiAq7VSaZ3MOIj0zrou_oyJEO38W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130041

CCI_IRQ_STATUS_0_I2C_Mx_ERROR aggregates the per-queue overflow and
underflow bits together with NACK_ERR, and all of them were
handled the same way: report -EIO and halt the queue. There was no
way to tell a NACK apart from a FIFO overflow/underflow in the logs.

Decode the individual overflow/underflow bits for each queue and
report them with dev_warn_ratelimited() as such errors are not
expected in normal operation.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-qcom-cci.c | 34 ++++++++++++++++++++++++++++++----
 1 file changed, 30 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
index 3304760411082b72e10e529a2bd66361e100fa06..099da0069251681cc52e351fb656bd73e78a96c9 100644
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

