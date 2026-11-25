Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795612708;
	b=GUyVUAYupK296vEoDUeWaxhf9ydSQj5rKQ5Fp3GEB0gK4aGjcbmqUJRNvG9RFvKfiJMJ
	 xKObsQ4Qfn8q2CcovnHnfnFRHKUg9T96BlRjwyK31pHsumZrt9jwOlR49ewjJgW8R2o5a
	 guOkVCSdxGWPt4T20JJh0gdMlTuejckXFOM9DRbBi/uFU3Q5YFYad6BtU1BT1dDPHloy5
	 JAzd1txU1cRYNk7SBNmQzU9lIrWrxlqUKHfr+7M6GBa5oXyc7OTzAnirqeFO6yKhYmorC
	 fFBaHV7OKDHEu9gElJbimK9xxpfQtkRPbcMT3MpPKgtkYttJqh4QygccDP3ZO/lAItg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795612708;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ad9w3TgkoIlbacQPNgPrBSZDlkh+EQgbPxPRDo3ExTs=;
	b=SfHZJ8XaB5gf5iGeQdcfbNSIv9Jn75YOSD6mO23Y0Pq5cbP7aYWAJSBshiWe+EtUeydF
	 yD8Eia6aKELw/O7p+Ni0dqHMF2UGKu0DhEnxHYYF8aHrFmTBkDe/KRTLpT9+zDSNOCep4
	 0q1dRU4mjp7TspSutyJROtEfLgF1bEwexz4njiNVcXttp2cZB/Ezgz0XbF4lDUbCcutlb
	 Owxcua0GIas+yIE1CdSOgAYxznlRwjkNgKqY1S3qiiq2HRaFLbaeWeEW95hppTVv3/02t
	 76Muil+eU1vE37sJUtR/opkftDyyxh5aSCOU/reJodihN86sUObdTK7e/+2zWxAREJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AoISGQwM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VfHRnZqz;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49019606A31E
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 13:18:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49019606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AoISGQwM;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VfHRnZqz
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mPX1555546
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 13:18:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ad9w3TgkoIl
	bacQPNgPrBSZDlkh+EQgbPxPRDo3ExTs=; b=AoISGQwM+leo+9FKSlOQPI2mNhi
	Yi/0eM7RlEt+R0qAtHQrLrD9AOy2n3G+a+kecau2AuqYIsuMzovRISDAP2b/Lkwb
	ScuJjzOJzSY1rsN4Slx9Dtt3hQ+1iTdaTSxawyclV0gdWzAVwcregxt12u89lR/i
	DrQj/8XTVx2LpACft87JlrQNXVKihUWuoqMnCPNZLx+rQfIlE4C3PmduCNQ8WC/i
	O4pyxfrhHcHp+35c4YBv3CUrUb82OM058ix7Vr71TstYbDa+yojc5DvCit05IRFz
	C4H5+DuNVhkr27FVjpuidId0Hrz2snFyGSH4vJXMmnbubj8r5R3NQtmyl/A==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vvnry7k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 13:18:26 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-99e0b2d9ba4so4532053241.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 05:18:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795612706; x=1796217506; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ad9w3TgkoIlbacQPNgPrBSZDlkh+EQgbPxPRDo3ExTs=;
        b=VfHRnZqz4GT5hDSUTNEzDyYYB0PUaZeS+tmUCze4Zxx21c8YnKVCug2/8jYSqB7RWH
         qof9iinujf9Js688j+84VMqmmB0lxUzjPgLLfXkPreriSDod05TfYaAHP5dneD2jndGH
         R6yldT3Wr1XRyFzeYt5XOnBZ9BLznBqzNl7mG8vF7aM7ydWLlPNu8i1h7vqfGZppgPDV
         qx0lexmwsOKIy0265Df8E7ix5L4HCzuBfN2edocLQR4bQ0gq8JElDvEzhA4/+1ozebsY
         C617kx8PLEWBZ3sRK1QQf5Ef8H2jXejIw/2e6Qiz7OTrn5QNc7Dp1ZtVUufPoP6JWv+J
         D2OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795612706; x=1796217506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ad9w3TgkoIlbacQPNgPrBSZDlkh+EQgbPxPRDo3ExTs=;
        b=s5B9ifOsgoBOQeecIJYI/zEMi5NlQeFebjolm/WaSL06tNa9kqpi1Ty2OzykfVW8Ic
         Choskyx1DmwOQtvB1+4a79M5gp5GcFNua0gN00GTPq0/ZpPcMLua4PWTTLdv3wNliwb/
         T5FlQcRgKmbLstV64wFgm5ErJFuh3YjSx9JzFoeiqub500zLpnmR0KFkCIS2CjHAMtbU
         NwOBPK5WwR906UPPcp4lkEoxTgTPBW6HocBXzaDzOxzL80Gaz1Jju5cuMBKUdo2tjwpN
         nf6rCf7tycwi027Cr5TMxp24hE87DWuGChlcNVMx+gkCm0Q5jckDVtO5Hx3i0UPSinzS
         1wTA==
X-Forwarded-Encrypted: i=1; AL+hErEYbQ5546aceNi6xqPNtov22gVu/33a6Uk6e7nijZhCm8Wk7BrZPc2x5BwjaHL0RiGoQzLaxRz2fHxdmxqJ@vger.kernel.org
X-Gm-Message-State: APuU4Z8yYqcgBtCO0rYz5QUQi3A+V6lpSpTBO/ChLH8RuKKUMJhFKqLI
	Ki6Ko9arBCil6ktfsyaAmZPTgbjjXCPtQjnhSqU6Zxyu09fnW0ZECU1y3TWsEdQSv6FaC8aa3Nu
	ndN2xyEGEAPQYsg7IcrkgNsffJGzpVSeGoF+piRD8YjFjpb4E17QL7uosJep7aVYS/6U6
X-Gm-Gg: AZFdTZcRv7s0eQia/jNvuV5t6PWcdogLjugu51yAd1k4fkchL3hobLftThww8lTYtvl
	QoEgd0t5Tevby93mj+PhuX/eBJy7wQBUlH6I6bo0rF+yGwaOrHn7TKUUOOScw8QCS1sAVaVs5d+
	HalXDSun3ALGt8fjgC7gUorSaE2yKhyS3DFewgqmLyVsDIctYBQm5rG7hRMPx54U9KA99l+g8hL
	z4nQ6QZRWf63UOAu0/tOLss7uDoc637wJmKZNq6wwA5YRkkTiKouzJq8LoZzsNt39FdtHcw7/Qd
	E3qS2YnF9iMbq9KS4iVXz3dEyEQpU93XiCBIDx2P7zhJr8BW/dxljYjXty+2ir4Ky5iD1Uzm/Pj
	Zf0CX4CjX9RUSqq02T7HKhjNShzqbh64xnu/RmQaY/5x5wS75ToOngbjQ4DQZ53IW
X-Received: by 2002:a05:6122:e26d:b0:5ea:e175:b2f5 with SMTP id 71dfb90a1353d-5ee8adf330dmr10851456e0c.1.1795612705668;
        Wed, 25 Nov 2026 05:18:25 -0800 (PST)
X-Received: by 2002:a05:6122:e26d:b0:5ea:e175:b2f5 with SMTP id 71dfb90a1353d-5ee8adf330dmr10851392e0c.1.1795612705104;
        Wed, 25 Nov 2026 05:18:25 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88f148aasm205035365e9.0.2026.11.25.05.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 05:18:24 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, sboyd@kernel.org, bmasney+clk@redhat.com,
        jbrunet+clk@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: abel.vesa@oss.qualcomm.com, abelvesa@kernel.org,
        taniya.das@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v4 4/4] clk: qcom: Add lpass clock controller driver for Glymur
Date: Wed, 25 Nov 2026 13:17:57 +0000
Message-ID: <20261125131757.1163466-5-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125131757.1163466-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261125131757.1163466-1-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA1MiBTYWx0ZWRfX43alHVWdp0Jl
 RFKaT7sKJiA+TqYulH8g4kRqgfmUaQRAybaInAD1dZjVm9AuA5fPpj65XAgqfDRjJ1eozBXDt0o
 VOOxW5LxQIzHXBh2YjGqwFPSghl50HkYvS82V21gCHpu/oN7qir+AxB9X9BWdADZ93xkb5GXngd
 /GbW9/QhO7YxExbOVyWYnbq9mU/AQiQtQ8mC8Oa1f6J9CiCgJ2UF0biVqVnRpjvMoQJsfQfDIq+
 vXcjYdeD21APXhDhnYHNhO17+NHYH2j2VdbMJYGv4FDD7nHha9p05anbPRELXZ5kXfQ+a0Mhw6k
 loVnCv/ntMs8KrYVK6Y337bBUkWoSfBMuGJU2qlk2CWpUbFbYecG/XuIVPbsFRTeLvqxoKsYcEk
 ClFeg59VY4f+yVdAqaDVhudoIm+R0dkpTtEyL5NbwdoFW9jnWbliJPVrlBWF/Pu6cAl7WNJS21h
 MwSmEIT+CufbrWsGDUQ==
X-Proofpoint-ORIG-GUID: xIRSQfUOjxVPiA-QmcsNNs-qqAdG9Mwy
X-Proofpoint-GUID: xIRSQfUOjxVPiA-QmcsNNs-qqAdG9Mwy
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA1MiBTYWx0ZWRfX/wtZp2dNUG3D
 DT+61xklvaqxwQq0RD8nKEbMrz3dUS+tvxYp7u1qbLY7AkMmFzSoOZuiq6sa78f/kKcu/V96Yur
 WKYAXwVzCPDRzd7MUS3YfZXC4cyPtwY=
X-Authority-Analysis: v=2.4 cv=R4mWitRX c=1 sm=1 tr=0 ts=6b06e022 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=9d4qlcpUcIswrQQTxZ8A:9 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250052

Add support for the lpass clock controller found on Glymur based devices.
This would allow lpass peripheral loader drivers to control the clocks and
bring the subsystems out of reset.

Currently this patch only supports resets as the Q6DSP is in control of
LPASS IP which manages most of the clocks via Q6PRM service on GPR rpmsg
channel.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 drivers/clk/qcom/lpasscc-glymur.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/clk/qcom/lpasscc-glymur.c b/drivers/clk/qcom/lpasscc-glymur.c
index b7fdd76df2f5..742a88ed318a 100644
--- a/drivers/clk/qcom/lpasscc-glymur.c
+++ b/drivers/clk/qcom/lpasscc-glymur.c
@@ -37,10 +37,31 @@ static const struct qcom_cc_desc lpass_audiocc_glymur_reset_desc = {
 	.num_resets = ARRAY_SIZE(lpass_audiocc_glymur_resets),
 };
 
+static const struct qcom_reset_map lpasscc_glymur_resets[] = {
+	[LPASS_AUDIO_SWR_TX_CGCR] = { 0xa028, 1 },
+};
+
+static const struct regmap_config lpasscc_glymur_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.name = "lpass-tcsr",
+	.max_register = 0x12000,
+};
+
+static const struct qcom_cc_desc lpasscc_glymur_reset_desc = {
+	.config = &lpasscc_glymur_regmap_config,
+	.resets = lpasscc_glymur_resets,
+	.num_resets = ARRAY_SIZE(lpasscc_glymur_resets),
+};
+
 static const struct of_device_id lpasscc_glymur_match_table[] = {
 	{
 		.compatible = "qcom,glymur-lpassaudiocc",
 		.data = &lpass_audiocc_glymur_reset_desc,
+	}, {
+		.compatible = "qcom,glymur-lpasscc",
+		.data = &lpasscc_glymur_reset_desc,
 	},
 	{ }
 };
-- 
2.53.0

