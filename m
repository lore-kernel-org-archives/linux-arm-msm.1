Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795454214;
	b=OOnix8heCFrBqJ3APAJ2ETPx5bhRCOYPyuI6xv0Y9nTCLt8LumEwM2z88VelJWNrnv+b
	 1ePPGHdRaIi6pxnmlA+blaoLNRSCnrNX6ND6V6+ln+Elxh3chRZzJt2kugD+p/L1plDw8
	 g4Prb9GsL33fq0rDfv+pCbQW/sm6Fsa/0vvfw0Akip725TEPuci5Iza3i9DLtgvu4cUFy
	 XDf00lzhYtiSVBCKaiVokAGkDHoPdUzGzf6TwfCXaU8geElOM5siVXFo7Bh37QzpnBHCx
	 K4fi2wC6U5J1ALRhegQdACAuCuObWFOJFFRdX1ZWHuPWyToWaWwXWxqP5+PzLs5xiCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795454214;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=p/NZY3qsHwd8iMIG9HWG8Np1DQxfQyFmtLuR8iyOMu8=;
	b=4Eg2LDHUcF2VecoYwgNjRtpcGPg7w9EAK64r7+CIDz2IuyyAnkx7R2ZRqy4E5gp1f2Ua
	 tQezQvA6haHND/wFpGZAU4twO0uSjBdYuA9N+X4NTWc6QdEQFkRcGhJeQ8EEPS0tOL9fs
	 9F+CFTvgCGLhG6lw8CWMJzTJse3ncWTbtzOJfWiTeuvg9HsMNJRBZXpRvQRGLrNiT6cl5
	 MpAu8Q+hpppOkgdAIletwf68ADSnslqXR8p9BhwmCqL9khRF3TGf9LKzz67QjK+KLtWWz
	 PgR4qbCJd+WIm8IMNtjE2wjF3H+H6jhatDQzsOjCh58pGxkmIi1cMgGHB4bkuNlfGfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NQiyde2k;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ajeys6La;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48ED8606A687
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 17:16:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48ED8606A687
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NQiyde2k;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ajeys6La
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGs3s846538
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 17:16:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p/NZY3qsHwd8iMIG9HWG8Np1DQxfQyFmtLuR8iyOMu8=; b=NQiyde2kCDEtNgHB
	7+/wVFhO5O/nlMet77e7dUX8xXXcitJ3ZaCrVGoYs/3V0LxbLMY06s6ozdwvmFxf
	ZvNV+4Yo/FjA+COStUU3/Dyy/AIUJdI/B/0W37cyPcqPuOP0P62ur4QCqgw0Z+CM
	q7Gy0CQWEloJjx+Fv1Kt0JcJcd9Qc3NjwVkdfINqH0cm/+tu8t+3+uohSsNJu2YO
	OjFTC79M7BvrwQLHWyuZtmsuLTK37NZdRzabPGg6bNSKqnxBS9aea5lXByyXDR3F
	wXWRYIwvBVKFXPE6VDzFTjJXdJdkcGlOHLVlJLym4QwwEBgILtBHFZ/nTvDAK+5U
	5teSdQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g742j5d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 17:16:53 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5eac42e83e0so649788e0c.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 09:16:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795454212; x=1796059012; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p/NZY3qsHwd8iMIG9HWG8Np1DQxfQyFmtLuR8iyOMu8=;
        b=ajeys6LaofPgiIJqi5J3kYR3J3gvu1hAbEVXeFZk4pTzxam5STjYhdWmgzp92rYpf8
         ubQiPIaNTwc5l4UXnk3W1wqNU+I/m4bgkyrgSkrxruyIyCeem02BFG3qAvmQ0PhHSUR8
         Ms3OYzp4wi4TNfCMBjySrffnL22xlyCnA43fZSaHskxZ3SkXTp4SOFDVcyJCP6449gFh
         Ut3ALWLh7uj/X5CmC+Ff814wFhSzkB7pTgWHCJicjOQtpl3sMmQ3fMHwq9Ck1qVyBW6/
         09+EwR6Isxtlj/TxZtML3LY+/z8d30w9vMOUMgdR3gs7R6JqZxWxF2dE697S9iBWojh6
         oUeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795454212; x=1796059012;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p/NZY3qsHwd8iMIG9HWG8Np1DQxfQyFmtLuR8iyOMu8=;
        b=mrKsTHU3dUNRMckyJ+FT/V3enQ4YZvZXydLiEx51ks41LijW9GXhOKNONdSQOnHknQ
         xY2/xd4lXlGYj46AjJiBvllA04mtCPdEuIAPhsqa6ecw7ZwN1kOZTnFMALyUmoUG3p0y
         OF4t5xy9GfZP812L+7AwVxOXFtHiGRbE9SaOEKgOLfE+Hesv8mkTVkhOZcz9K3VNATqW
         tGG6adNcaglLOT1JJp/fkr8IXRZ8mybOMHRyEh7fJ9l5rg4bNkSvcObU27cUZ3beEGzN
         bj747E3Ah9MunydpAXsMBdhZ9B190/WmAl7H9boFkoiF1StCZk+iepcvDFaTSJBcSmEy
         6v7A==
X-Forwarded-Encrypted: i=1; AL+hErG9xRq4ij2l57pfFP2f+cclTIQRplfUa7pakW05IJE2+sKbMJoPUOfLt8iPKtkz+XQmFzOrkYPuH7g3CCsK@vger.kernel.org
X-Gm-Message-State: APuU4Z/e/W/DsUSj7BgV+ICLeanXN2qvbvIiF2yBaqGA9a2tEOKLewNj
	4IL0OGqwxF6HlenRJLKUpEWt2S01G65brbgq1uaT7DU9jJGpHxaguWyboKjl8Ot5EAC+ORfnZAU
	e52Hth547lNU0osNO0jQ0kvpixDO69Z41OjvGL1YPiKj2BxhsgD11Z8H4bYhMV/OdWzCU
X-Gm-Gg: AZFdTZc5sXsSOeaIlv2MVGkq4JT0vzbuMPreB3uvyEF2qYxiiI+C1QalInIreqa1fsx
	TKjrNJgaxk0TZAgwlERZ7gagi6hVfTL+Kfyutmqh13eRvHPUadOxeYnwZYxkV98t2Fm78EPxtTg
	QdBfaBYf1E7ZBaaQOZ+MkfSVcnmpRQRZAf1sSN47I4XNJ5YQCtPQwH6d+mnRl0/CInTkJ1Ry68s
	GVFGa8tlLYErjlFW40pBxX1wxZ8L22/MPQszDOEar2zRqPImAhXXWRtzFI4Qb+LNJUeTxHDbejO
	3nsa8/71eieNGdG3/DWanpKpKPkxUd6XHpL6zI7bWIODiOfKzmgw8b4x4ct+RGjIrAV8B4BMIAu
	fnAC7ZBfBHSwecehxqRhkEoMbXVJzesBRJHOpFa0Yk9o0xu4twskFuZpG1sN3RcTEnpaKo1+DsB
	LLWHS9aGipMCtuIrjDEPGR5WFJlq6yt6SGdIooZ+L1+c2kv1X/f/2w16XDdDBC/dq6pmgV3EyzP
	kHBvpgVAysasT4Je1pkSMn+uTqE
X-Received: by 2002:a05:6122:1350:b0:5d4:a734:fb80 with SMTP id 71dfb90a1353d-5ee8adf6a05mr5575948e0c.3.1795454212402;
        Mon, 23 Nov 2026 09:16:52 -0800 (PST)
X-Received: by 2002:a05:6122:1350:b0:5d4:a734:fb80 with SMTP id 71dfb90a1353d-5ee8adf6a05mr5575892e0c.3.1795454211924;
        Mon, 23 Nov 2026 09:16:51 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:6c6b:1e5a:79dd:a527])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9066e34esm205168235e9.3.2026.11.23.09.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 09:16:51 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 18:16:48 +0100
Subject: [PATCH 2/6] media: qcom: camss: csid: Pass the SOF time to
 csid_sof_event()
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
Message-Id: <20261123-camss-hw-ts-v1-2-7b62dda6d7a9@oss.qualcomm.com>
References: <20261123-camss-hw-ts-v1-0-7b62dda6d7a9@oss.qualcomm.com>
In-Reply-To: <20261123-camss-hw-ts-v1-0-7b62dda6d7a9@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: 3Mh0FEIV_DIW7TUfShyiGyKqdQxvejy8
X-Proofpoint-ORIG-GUID: 3Mh0FEIV_DIW7TUfShyiGyKqdQxvejy8
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2OCBTYWx0ZWRfX74Ov1YoP+ake
 uF+kdRb3/fFRJobcAoDLt5X3ttCaB1orcYstDb0d03HrjwO/L/wIXHA4+rCHHGO6ngQmxQCN26x
 RSBO6vPi0busKoTCUPrRK5e6FZqFPg4=
X-Authority-Analysis: v=2.4 cv=T/cZ3PKQ c=1 sm=1 tr=0 ts=6b047505 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=doqduI5V5cNHhblwjzwA:9 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2OCBTYWx0ZWRfXzFlevv5MMTbv
 4ANU90Pf0aeojl0gDjTLBVuw3Rkt0rBHDV5b4ZaL9zPnVJjgfrNdNS8L/7wZWP+gY+siinkJ5ok
 FV6LeNu74cgktGSmltLYurOV1ztPcPrO/QbTFg5IazjQkapxddk/Ba5t32sUhaep7zaZETM0zlL
 +GAKSGuemLm592lUTqGTrSPhiGMQXeS7ZepLlqklsQh6WkV0BjrKpfisXsUukPsq0SspZIPrmaS
 XBTmRBZDujvFFd1dPb2uwJFv3znDo+UbLmeiq0CyG9qYi20R8AR6WvpItTT8KaChzfqPqNcuVMf
 oZWCBdY3ZTdhRVnp4ob/nOJwKzFdWX8wEPSABifH2apytA56GAujL0OwPsnYCeEqD+nWGEoS1nU
 tmTwOGh5ZM7BeqSPeYXqcd2w7RIn/0HoxKDxJr3Cq6sqvJMzm35GisFvoQ+zvL9rG82hPcQdIjZ
 bpWksy3P2AnJDWl0htA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230068

csid_sof_event() queues the frame sync event with no notion of when the
start-of-frame it reports actually happened, leaving the V4L2 core to
timestamp it at the moment the event is queued. Some CSID revisions latch
that time in hardware and can do considerably better, so take it as a
parameter and let it reach the event.

Every caller passes 0 for now, which keeps the existing behaviour of
timestamping at queue time.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-csid-340.c  | 2 +-
 drivers/media/platform/qcom/camss/camss-csid-680.c  | 2 +-
 drivers/media/platform/qcom/camss/camss-csid-gen2.c | 2 +-
 drivers/media/platform/qcom/camss/camss-csid-gen3.c | 2 +-
 drivers/media/platform/qcom/camss/camss-csid.c      | 5 ++++-
 drivers/media/platform/qcom/camss/camss-csid.h      | 4 +++-
 6 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-340.c b/drivers/media/platform/qcom/camss/camss-csid-340.c
index 42ff629ce410d33f21930ee56d714f41911cc077..5eef5f8846fbfec5afa1152f73a098fecd717fdf 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-340.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-340.c
@@ -207,7 +207,7 @@ static irqreturn_t csid_isr(int irq, void *dev)
 		iface_val |= status;
 
 		if (status & CSID_IFACE_IRQ_INFO_INPUT_SOF)
-			csid_sof_event(csid, i);
+			csid_sof_event(csid, i, 0);
 	}
 
 	writel_relaxed(CSID_IRQ_CMD_CLEAR, csid->base + CSID_IRQ_CMD);
diff --git a/drivers/media/platform/qcom/camss/camss-csid-680.c b/drivers/media/platform/qcom/camss/camss-csid-680.c
index 452640e72f6d5f5e2271945d97764c62b630da6c..8ac83d469dc39d45a37c9be815d41bbab12909b0 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-680.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-680.c
@@ -411,7 +411,7 @@ static irqreturn_t csid_isr(int irq, void *dev)
 			writel(val, csid->base + CSID_CSI2_RDIN_IRQ_CLEAR(i));
 
 		if (val & CSID_CSI2_RDIN_INFO_INPUT_SOF)
-			csid_sof_event(csid, i);
+			csid_sof_event(csid, i, 0);
 
 		if (val & CSID_CSI2_RDIN_RUP_DONE)
 			csid_rup_complete(csid, i);
diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen2.c b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
index a351ac4b91728b981fe80e030fcb5ebfdab138b2..72f329c2bb1ddeec96f33c21198104157c14a73c 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-gen2.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
@@ -387,7 +387,7 @@ static irqreturn_t csid_isr(int irq, void *dev)
 			val = readl_relaxed(csid->base + CSID_CSI2_RDIN_IRQ_STATUS(i));
 			writel_relaxed(val, csid->base + CSID_CSI2_RDIN_IRQ_CLEAR(i));
 			if (val & RDIN_IRQ_INFO_INPUT_SOF)
-				csid_sof_event(csid, i);
+				csid_sof_event(csid, i, 0);
 		}
 
 	val = 1 << IRQ_CMD_CLEAR;
diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen3.c b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
index 6a538d825f78be5cf64691c351149b0a8fa68c3d..fa9af117f3e68237f1dd27a48bfc339152c63f94 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-gen3.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
@@ -304,7 +304,7 @@ static irqreturn_t csid_isr(int irq, void *dev)
 			writel(val, csid->base + CSID_CSI2_RDIN_IRQ_CLEAR(i));
 
 			if (val & INFO_INPUT_SOF_IRQ)
-				csid_sof_event(csid, i);
+				csid_sof_event(csid, i, 0);
 
 			if (val & RUP_DONE_IRQ_STATUS)
 				/* clear the reg update bit */
diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index 588122beec854ae5b78de9997b68c7a81d4207e1..bb89fe26ec2342487c3ba6357d37b6f188476d1e 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -1370,12 +1370,15 @@ atomic_t *csid_get_sof_seq(struct media_pad *pad)
 	return &csid->sof_seq[pad->index - MSM_CSID_PAD_FIRST_SRC];
 }
 
-void csid_sof_event(struct csid_device *csid, unsigned int id)
+void csid_sof_event(struct csid_device *csid, unsigned int id, u64 ts)
 {
+	struct timespec64 sof = ns_to_timespec64(ts);
 	struct v4l2_event event = {
 		.type = V4L2_EVENT_FRAME_SYNC,
 		.u.frame_sync.frame_sequence =
 			atomic_inc_return(&csid->sof_seq[id]),
+		.timestamp.tv_sec = sof.tv_sec,
+		.timestamp.tv_nsec = sof.tv_nsec,
 	};
 
 	if (atomic_read(&csid->frame_sync_users))
diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
index ccafdbf3a9fe0c282da68ccdd04661b3fab81ff5..1fde67d16867a24be2a4f8940ed2d2a60f523ee6 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.h
+++ b/drivers/media/platform/qcom/camss/camss-csid.h
@@ -265,10 +265,12 @@ u32 csid_src_pad_code(struct csid_device *csid, u32 sink_code,
  * csid_sof_event - Track SOF generate V4L2_EVENT_FRAME_SYNC
  * @csid: CSID device
  * @id: CSID src-stream ID
+ * @ts: CLOCK_MONOTONIC time of the SOF in nanoseconds, 0 if unknown, in which
+ *	case the time the event is queued is used instead
  *
  *  Called from the CSID interrupt handler on SOF of the path driving the event.
  */
-void csid_sof_event(struct csid_device *csid, unsigned int id);
+void csid_sof_event(struct csid_device *csid, unsigned int id, u64 ts);
 
 /*
  * csid_get_sof_seq - Get a pointer to the SOF frame sequence variable.

-- 
2.34.1

