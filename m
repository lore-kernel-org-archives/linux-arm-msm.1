Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792568235;
	b=YmA9Cy5cNo/x5zt55WhsTVmCGSCsSASpbO/0S0YHj5zmu0M/VWsy2BRAy7nerbou9JWI
	 4J5F7eeFfKHB2XAr/NMRA1AuqXO6KHe9/zQu5eDcEuLW8rb7erCRLZLCPMSdqHgxnBVPp
	 G/MM17RcApNEkmiH4LOiPuNdGs3tgjDinJZv+fzl+IhifEd0IVrPIvR4CcRPiX4mmiORe
	 6BUFEs2Gm3L+41glvL0wNJUqhMGe3ruxP3G1TIJ3KmFUhu7F0qoTVdLo59utAcJ+ZBOSI
	 x/J3YAB66E+8RBXIZMO3BU3nmnJwLRPEJUTYwOyghtYVqQli6bskdRvu+TE1rh6MHYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792568235;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/AAvIITa6Qa3UKIWzhXU02F/rqH5oiz723Lh9UpDLKg=;
	b=laRYjIHX+C+Rix2YEIW+//EBbQ3w3OgKKzjpTs0LXcbm5g8OhHgT20S4vHLHGG2UQyQ1
	 Kvy5J8ryd4qWmALC4SsCBqHaBvr8hjny1aLCiPvckz0McrV28bRGUsTkPgaGe9H5k22/f
	 ZZaOB7IjZnVtci1nDe/n71K/1WqP1SpoHdE8VM0L3QdHrX6JWjYIjQXQLHan7Ifi9fS+A
	 nYJmx61OrKbBe5PGccBeJvXPPiWkekcI3RgrH7N4mSGiKOk70KcbggRFnc88dLRFM4BBm
	 LuPFtsRSTqF3i9bQlkb6pgG3K5qSSEedEt3iZ0t4sBKvrLRyBt3v2srANorULLkJIkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Fm1tG/RL";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a+GEyxiG;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308A0606A337
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 07:37:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 308A0606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Fm1tG/RL;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a+GEyxiG
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5jLmt2848643
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 07:37:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/AAvIITa6Qa
	3UKIWzhXU02F/rqH5oiz723Lh9UpDLKg=; b=Fm1tG/RLzuNknjAnqrm5Ekto+Gc
	Ne5yZAOmjL8v40L8NXC4aHHtgsuoPyAzEMvJycUYQRwVlA+F9wjVQma4RXMneTPF
	+CbFUIgYVadWCZIdQ0OxNJoZMH/asT2qCmL76STRndoRiLST8Pf+Tg3WxFNyP8ZV
	9rRotP91iDNEV5b3s45TlLy/QKyPsQy6XUCvW/Xy3zYHBXNr7fViDFMEYFMl/fhw
	yK+EkWfqPHrQRCjgrGd7ThdXRA0ThftYyhDqIZtd7ZvZB/coCVQVjpvgpKFuPdZL
	YeoDt+6/Snm9wZSCBbeoFkpwGJZbRtIQCZAh854pcCR4I7IVcjJ0aJQ7p/g==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heeb9acjb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 07:37:13 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1383723dfddso729533c88.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 00:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792568233; x=1793173033; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/AAvIITa6Qa3UKIWzhXU02F/rqH5oiz723Lh9UpDLKg=;
        b=a+GEyxiGomce1dU93ixgduwpFQvC7DrZB4u9vlmre8szNGFX6k0qLnQhV6ClCXxMsR
         FymOp//w/d0ZuD4Es+I23K0xIMtOykNJ6f5W1w39n+OCq+VKryAl/fQRuF3sEdQk2CO4
         GOj2gXaops05j50CwdkGYKcn9H1+ezUKiXVmSCq9ANkybQlYh87Jqg1AURX/xG8R9BEB
         Ayn8pTfPbcMBTGVN1U+gNhc/ZSJG/HsiRN+RapM4kw9T6Fd6OWOuzFD29EG5cc4cEwDs
         4ViIcvmBZF7+ouJM/NPTnDKBy9MjYXrfoKTKSvT58YoZAXVUK+C3mL34TSpmGsjnT66J
         LBQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792568233; x=1793173033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/AAvIITa6Qa3UKIWzhXU02F/rqH5oiz723Lh9UpDLKg=;
        b=F6Z5GmhCnep9RQFAQNffL3wkjlppFnJSnCCw4/hQfC5QVUbOYjOD3FeIZmam4Cd4xY
         Zfu2u0xnj04bGuD3cTGdzxqGi5tXjU6GozVo0fhfnM6pR860nqUcQuL48ZhGr+YwC3jd
         6D5kKuAwB0k+J7cIRz/l4p3aB9317iB4ZDXGU22uOuELuXUeG/qATOSFvR9rgkoyTO8V
         v/J33usRKa8PbkoWhjrVEmiY8umKqXiyv3BBR/UtManp8gw1Dfzj6yBRP85v83yHCrjK
         +UWJ2eVcimr6iLKc0X96v4M69Zjs+rhtoyM/zIgWx8IOWdgGG35WtDQ+zmiXy7EyIvNp
         2Q5Q==
X-Forwarded-Encrypted: i=1; AKwUvBxdrH0EesXBdrLL1+TEKH4pBDesy0lI2Dk7ALt2gjTgO/f0PTJGoudVQJ7TizhqK74ppS8mfF0Sfo/3L0US@vger.kernel.org
X-Gm-Message-State: AFq9FYIfL1x6sXnJY4fZO6u7CTCtfvgPfpyu1icCoFPFaI2WyVLzKtsL
	/c+jvpJCiANTk6V0ByyyZNTdZyVLw65G9SJAjgUkFXkY6VMDWxXr2wfVxOI/WTAcrfdO8O1MjJf
	KtsIn6msVOv5PXv0pZbzzg6KV0eJNynZkGng3jLqFpd9IVDtibFPBbDeVzAD6NP9yKKZnI+TojE
	Ussag=
X-Gm-Gg: AYBFou1cgYMMhL3qHt58lgthommJjvOWrIJXpKEWmR/uER1fT2C31+XGEvVuuoHNND/
	MPrLv2O2ThB0VkVr2OG0sPvkKJrQuAKdXzUJ7TIOxq3BE4Xr2ie4FfL0BCFhztEW5VV3xrbFUgD
	EjG5aE86io0ss3GkHq8Xr65Zl7ZZ9BrEAXZRXZC/9TgL4eys79cUAnUIsN0T/020A3VDYwef3x+
	TEe57O/xBRl8eoxmP8jNPkRntdvaq0mVknwgjVEdMSOPDLKAh2G+k9DjYgMWzzm0AbVz0N7cZK/
	zAUGwSG8CopwzD2pDsyuJbu/5ULOi7P30e5iVhEVcGq9Lz0c/ZLKttNI6fJE+JuskpnhdQM9pNs
	iw8RVCOM2LWavl5KABIgmvgZWUxpJZNXmagBNOh0i97AJe5n1Rr3/iK+p2Hw=
X-Received: by 2002:a05:701b:4550:10b0:150:1cea:31a8 with SMTP id a92af1059eb24-190a4ffa89dmr1772879c88.19.1792568232703;
        Wed, 21 Oct 2026 00:37:12 -0700 (PDT)
X-Received: by 2002:a05:701b:4550:10b0:150:1cea:31a8 with SMTP id a92af1059eb24-190a4ffa89dmr1772845c88.19.1792568232081;
        Wed, 21 Oct 2026 00:37:12 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903bf5d0a1sm4042471c88.14.2026.10.21.00.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 00:37:11 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH RFC v2 1/5] soc: qcom: pd-mapper: Add support for Nord
Date: Wed, 21 Oct 2026 15:36:29 +0800
Message-ID: <20261021073633.2163128-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021073633.2163128-1-shengchao.guo@oss.qualcomm.com>
References: <20261021073633.2163128-1-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzMCBTYWx0ZWRfX52LOo/BAAb1t
 9PFlD6vrtaO0aThEkMW/EoxW1PJwKGPLgFk44p03cggY0Gft2eDl9/TDXesHgDXPzxIlzofoRaS
 cfjXvG2Og+yep77SA3oGfB8GyKWArG8=
X-Proofpoint-GUID: NE3sAi1rWq9W-8xF2Zh_P1fsJDsVJFuB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzMCBTYWx0ZWRfX/2ohbDF8Yh0B
 UR22Lw6Bh1rrrbU57SpFbO9FNbsz4fwKWk7+aALaCpP7kRoKo46VFaKe67CpdMlUjRrvPVHGH1G
 8SviQzqZemog6m+2ZyyQdKJwxgnGfMKqBwaHdVEcs5TpRJzjouNbED8ZXBEvjE1gxv65wULKHeV
 ZecdRAZMo683hJmXYCIDMtK8HReusofIKk8tRpscYhhL4CZQ8RYjsbG1oGkEeidpZQUm8DA/RJj
 pdNVqftmXK1orgLAOsz8GCT/uVUEKR8NM6TW6mcoMdnNH28HsofEC44ynRxvkD5/kdsof/zwZQo
 srWc6IFcx5tDV4OFrLQEmCDM+cpYEmepvl1p3l3pydPobSTDw4VxRvJxDxj/7RlgSCyB0FPqdAh
 d74sIkHUf5MiYgl08tx/9A0q6Q1fuk+/hMUE/2bsyC3XA+XTTTbta5zkChoDsf1e2YOCLaoEkh8
 Ul0Nyl1yfWCdqhp3irA==
X-Authority-Analysis: v=2.4 cv=R42WitRX c=1 sm=1 tr=0 ts=6ad86ba9 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=cXETwVyMbT8LRi-F-08A:9 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-ORIG-GUID: NE3sAi1rWq9W-8xF2Zh_P1fsJDsVJFuB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210030

From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

Add support for the Qualcomm Nord SoC to the protection domain mapper.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/soc/qcom/qcom_pd_mapper.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/soc/qcom/qcom_pd_mapper.c b/drivers/soc/qcom/qcom_pd_mapper.c
index 64ca99d7fad9..6dace16a3b8c 100644
--- a/drivers/soc/qcom/qcom_pd_mapper.c
+++ b/drivers/soc/qcom/qcom_pd_mapper.c
@@ -277,6 +277,12 @@ static const struct qcom_pdm_domain_data adsp_root_pd = {
 	.services = { NULL },
 };
 
+static const struct qcom_pdm_domain_data adsp1_root_pd = {
+	.domain = "msm/adsp1/root_pd",
+	.instance_id = 123,
+	.services = { NULL },
+};
+
 static const struct qcom_pdm_domain_data adsp_root_pd_pdr = {
 	.domain = "msm/adsp/root_pd",
 	.instance_id = 74,
@@ -414,6 +420,13 @@ static const struct qcom_pdm_domain_data *msm8998_domains[] = {
 	NULL,
 };
 
+static const struct qcom_pdm_domain_data *nord_domains[] = {
+	&adsp_audio_pd,
+	&adsp_root_pd,
+	&adsp1_root_pd,
+	&cdsp_root_pd,
+};
+
 static const struct qcom_pdm_domain_data *qcm2290_domains[] = {
 	&adsp_audio_pd,
 	&adsp_root_pd,
@@ -634,6 +647,7 @@ static const struct of_device_id qcom_pdm_domains[] __maybe_unused = {
 	{ .compatible = "qcom,msm8974", .data = NULL, },
 	{ .compatible = "qcom,msm8996", .data = msm8996_domains, },
 	{ .compatible = "qcom,msm8998", .data = msm8998_domains, },
+	{ .compatible = "qcom,nord", .data = nord_domains, },
 	{ .compatible = "qcom,qcm2290", .data = qcm2290_domains, },
 	{ .compatible = "qcom,qcm6490", .data = sc7280_domains, },
 	{ .compatible = "qcom,qcs404", .data = qcs404_domains, },
-- 
2.43.0

