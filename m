Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795631026;
	b=bwMTOcImE80SJCTpFyRWCWUOASNvLIr95d8a3YHmwOiaFU2S7IsYSOYDgloCG4ONC2KC
	 +dYB3AbQu0ac9KhquLoMZBmbiTnXsQh8UsfoLmuMi7FxmiUj5rqtz5DwZMJshgKn8u5Sq
	 L2eOe1rLY39t9bHH2awKChnu+dFTCAXbkJgjqbAvE8bF8Fw8BdEtPJaM5ql87WlD5fsYe
	 hVYbMVSfaYBiXM08uh6Foy5eq/vFAGJBqaBpwlxhliGyON94AU4XSw6q5cbj1HXxu/0id
	 peMHgiMqp7lwDtmcIzHmyeTwFaoub5HR8jQAHwubM7b6eX9QS1Uo5BOyUhHr6CRt+ZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795631026;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=zcxcyO7W33ZSQAndGKlwVO1qNMckslR3XsjorsVb4MM=;
	b=XKFWvaQaTHcF+7geOny+DBqwT94zcMjOIS0DPVkXUrTo9Ry1R7XdGz8GFu+DDzkIoXj7
	 Iz7JAJA5ATHgGTj6Y9d4TnfWb4Wr0OosmEx1UFm3w0pBo61bs8sRv7U1TwPVhhZhdAu3f
	 R3jae3fConPd3X6rIYhPzrgqLWhbriVbbrfLLtJLxVEIxe5ae1ubxnylI4wtgYSd1mHPC
	 6tOzHbXvNHMp0sD8Kzjw1ddZO5szIW6e50P9uwf9MYoR5oDBysB7foavU6ASxRgTZONW/
	 X6/5o5cUSPxA4qz4kkrgD7XVEyQGZPI7DohRmxhACiV3oB+brXg0Wsvc0fpo1t8nDeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k0aY4Vg1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RL5MmXub;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C7F606A32D
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 18:23:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93C7F606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k0aY4Vg1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RL5MmXub
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APGQLl9454192
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 18:23:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=zcxcyO7W33Z
	SQAndGKlwVO1qNMckslR3XsjorsVb4MM=; b=k0aY4Vg1HwiQ/gbBgycxg6aYJHC
	uJrIkohCP+S0UTSPQbOMfkZVWBYaGloG5MtsEutJLNnN76WpHsSfC+9MYAReECkz
	wKz9KA+36gbZNgs2QlLav5WXS8x5jourGZTuK1nbMDmO8AjtZwBaKdVfFaoNmWd7
	zGvBRFnRS0WojSJqv419BthJqv7TerKPzcpbX9KArrBb0ft5roQvkGuanxaTUL7E
	VaiYn/B2hfqEuIJPVgfZ9HG9X0p55fPHZulb4H4wTBOWchFijLZQ9NAxCJJaTGB0
	7oUXNroA/olP0DyvZGLvLjsC4EuCkp0J9u1+3IRjnStCUtaacaU7mY5liTg==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vv2t7ex-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 18:23:44 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-8b4d1cfe3cdso12199087b3.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 10:23:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795631024; x=1796235824; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zcxcyO7W33ZSQAndGKlwVO1qNMckslR3XsjorsVb4MM=;
        b=RL5MmXubXji0BboE4jl/XScGiRIYKaRltxwmv9e6sCZQzSGCCM0N9gVGSuBk3O/e7m
         IhHExs6Z8fbbvXHf4kPer0r/6urg2wKYUanTSgqI1MI/QMdRCHHtQcFMyQHkUp7XXWQM
         eiC4KbRlZS4WB+1l/WPrKIgaI+oLWC0GMzGE76r4TRscVbcqD0TJJK2glj5W2TfuuWz2
         ybDy5DQwpXhW99FV3+EubPBNdkqXqUxM1E6kPAO5A7+qvREy6dHobdTeqMSiTEkXp0tp
         oF8wwQ8rKXCv4xs8IcicIYPNgx1NnAxHiBGeZ2xlzNOodXPm6pi0MmRDGPyX+7wR6wJL
         uFEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795631024; x=1796235824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zcxcyO7W33ZSQAndGKlwVO1qNMckslR3XsjorsVb4MM=;
        b=WJteYSyVKC8yab4gNHqYi/KLJjJhYueFIoRQ+o+qANuJl/w/Wk7wadybtT63v9LvSp
         9GojjhXMPAOWQtZjPyExlkzQc6sbH/On2iVZK6GDlznoOvv5dBPEoLBJ2TMIFSEFt+YT
         7nNRqM6TeXb+A5UizqhliiXBhuU9KlJpLvy0ufi/64r1RUrn+Xf2W0ZdYYWrmnjXSZT6
         6fPb+bzVL19jC2+zTA13gNI2EBQ//ozJVx9Wq+agu/mhhwbV821sa7JSMImP6sOY8tEk
         OxgLQrmvLXfWXu71eFBKrEFtcU6sfFB1kSugzLAcQMm2S6qjbxlzrQBwQdilrWrKgScb
         7ohQ==
X-Forwarded-Encrypted: i=1; AL+hErF6KOQyLc6gASEXUDjCDHT7PPn0qq/Zsl0g1seewZCdBiMhFg30lQVX4zRLl4sxyXC5bZ7feOjzaPwryrzd@vger.kernel.org
X-Gm-Message-State: APuU4Z8xau66THibkQHMFy+rcT8LuLms10Gblb6MeiA+LBbItP0sI4n9
	uo/OBEGzfCAAcDGjPtTs+LHBS72PpxVundRBXzZy/uHxrenB0b2gN310dGX7m02+SQnPuh8QXkt
	OzJ6rArFpyeUd0JLSCsqLT7P20s64WvYLt36s0AIIEeknY6hK9xAciD0RwBYnr6Z3ba1+/DswNZ
	jsaPA=
X-Gm-Gg: AZFdTZcmlN7DAdJPpdycvZ1B7rHUeHyL2gQKT91Sh6u6j4rvdSaowmEQne5P69aVXwB
	+W4+ML/3qSySnIVMo/+wajP3XvFKhip+8S/qyWCglRo8ZNZ9ZoYshKFkPmiuNRIxaIoroGC1HNz
	tz/bAij9qDsNTlN+C7nNMuqL5DHB2sBm4arqmRIHdHnOycoZOo9dWpzS8Hzw0PSGRr1T2ZRwp8j
	krrd1kxskmo36rJUgZ7Z1a39vfYtqfhaq5eCsBufhcST7kQV3qb5VW2PaYa+mq2Er4LfF+mORCj
	hCqSs8ep5MteXyDp7qNGdl7SDNeUj3nPrHTRflT/SOJJ97AI6Ma/aRLJeY+xqApS+SkEgYPxSsy
	JbF8UTArUS3FeSYFAwuKfPDguoZnNfE01HlKv/ihXYjl/wf1zS0TEZgyZDdCFzrDf0Rb81MS0LV
	cOqVFM
X-Received: by 2002:a05:690c:6307:b0:8b3:22c:b40c with SMTP id 00721157ae682-8b520329badmr85103757b3.7.1795631023948;
        Wed, 25 Nov 2026 10:23:43 -0800 (PST)
X-Received: by 2002:a05:690c:6307:b0:8b3:22c:b40c with SMTP id 00721157ae682-8b520329badmr85103667b3.7.1795631023298;
        Wed, 25 Nov 2026 10:23:43 -0800 (PST)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab65cb42absm37185609f8f.1.2026.11.25.10.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:23:42 -0800 (PST)
From: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, Hitesh Patel <hitesh@ebytelogic.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
Subject: [PATCH RESEND v2 01/12] media: qcom: camss: csid_gen3: Fix multi-VC buf-done IRQ mask
Date: Wed, 25 Nov 2026 20:23:15 +0200
Message-Id: <20261125182326.2767771-2-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125182326.2767771-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261125182326.2767771-1-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA3MyBTYWx0ZWRfX2dAqjZESapKF
 kNepE8WM2g2zSkBAW8lBwxtx4B7udmsHsOkZmcHFAZh7Vzrx1xmyHr0VeU91gqH/6Qch+NnDqi+
 6mN1CnsVeW2T4cSNeGgTQRwFieZdbk0=
X-Proofpoint-GUID: r7wxI64LPe_LAFn30LgPBH61EV1ToXGJ
X-Proofpoint-ORIG-GUID: r7wxI64LPe_LAFn30LgPBH61EV1ToXGJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA3MyBTYWx0ZWRfX537LhVswGMhl
 tU3o75A8UsfvhXTtwYJPiWE9zgaDwqFQ1ZLopfTPdeTqm01smCuXgmaFQTXYr1rCjUQL/s/H+du
 v8CncA0FHNHl+6WOsS3Pcwk6uZPA8k6oQMEz/8HsBueWT/iFlxhlHI2j9fw4AY8i+HQ4cdYLMOP
 Tkr17ULdK2PvUQVkoGL8Cy7LopSOwumcEkK42BqeaYDLAfn9ZR5bo8jPz8W3hXZ87HaHCkjAV8Y
 4EwAA0tc2Dc8ZzcBNklZW/O0EWQKr6sZAPAdc8rmk8kOlzeA/tRNQfsTdBXyULV6ezSL+cJzfV9
 K0QOkILpH2imZRCXTrDasH4D7gWx0TQqmDlDed1rTV3zu/wXKXyQforVwbgopD2wYrWd02e4Edt
 5n0NDrRqfp9/zvNnCxx7S8TVZIkek8RBsTbkNPwktZ/DGHxGvPwruhm+hHpTzXbDqdyBxWZCbMt
 hDXPBgpnKiBzaT3A71A==
X-Authority-Analysis: v=2.4 cv=A/z5rKWG c=1 sm=1 tr=0 ts=6b0727b0 cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=-miQo-2tu4ND6FEhOZYA:9 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_04,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611250073

Csid reset programs CSID_BUF_DONE_IRQ_MASK with a separate write
per enabled VC instead of accumulating the bits.
This change removes the not needed for cycle and write regs
in one pass.

Confirmed on RB8/SA8775P hardware during TPG multi-VC capture
testing.

Fixes: d96fe1808dcc ("media: qcom: camss: Add CSID 780 support")
Signed-off-by: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
---
 .../media/platform/qcom/camss/camss-csid-gen3.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen3.c b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
index 6a538d825f78..231b53d3e44e 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-gen3.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
@@ -339,7 +339,6 @@ static int csid_reset(struct csid_device *csid)
 {
 	unsigned long time;
 	u32 val;
-	int i;
 
 	reinit_completion(&csid->reset_complete);
 
@@ -347,14 +346,14 @@ static int csid_reset(struct csid_device *csid)
 	writel(1, csid->base + CSID_IRQ_CMD);
 	writel(1, csid->base + CSID_TOP_IRQ_MASK);
 
-	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
-		if (csid->phy.en_vc & BIT(i)) {
-			writel(BIT(BUF_DONE_IRQ_STATUS_RDI_OFFSET + i),
-			       csid->base + CSID_BUF_DONE_IRQ_CLEAR);
-			writel(IRQ_CMD_CLEAR, csid->base + CSID_IRQ_CMD);
-			writel(BIT(BUF_DONE_IRQ_STATUS_RDI_OFFSET + i),
-			       csid->base + CSID_BUF_DONE_IRQ_MASK);
-		}
+	if (csid->phy.en_vc) {
+		u32 vc_mask = GENMASK(MSM_CSID_MAX_SRC_STREAMS - 1, 0);
+
+		val = (csid->phy.en_vc & vc_mask) << BUF_DONE_IRQ_STATUS_RDI_OFFSET;
+		writel(val, csid->base + CSID_BUF_DONE_IRQ_CLEAR);
+		writel(IRQ_CMD_CLEAR, csid->base + CSID_IRQ_CMD);
+		writel(val, csid->base + CSID_BUF_DONE_IRQ_MASK);
+	}
 
 	/* preserve registers */
 	val = RST_LOCATION | RST_MODE;
-- 
2.34.1

