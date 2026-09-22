Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C91B49B5D1
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 18:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790102710; cv=none; b=CoOh9o9AO04OCs+HnRkuOqta8jNeBDT9P8kidm79dNxJgTCi7O82KCBFwV4xim7mGNkE8rBp2mTo5csn6wUVPh7oZh4QNNl60xrowpcSPw+nEdEhGhZ7IAyq6dwxaOZtRPzw0Qmxz0G+wvoX0Cald4h4ZUunfy9MUu89gynNvKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790102710; c=relaxed/simple;
	bh=1Q4uvfDk4TliYmTHYv2Ve5KSV0agU3eXHSIiw7O5VGE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eZ8g8DuQdZPcYq7G/Y7/f/xA7xguR/Z6mNdYNJJuKPEFPy4dcCDRA015B/YAnbIAG1s5+IktniNpU1CTL1GLfwbbqqTpIA0SAr05VGcGTASJGpt0RYzbfFCWPrWZ3Vc9a4cfK+4UpDzobJ9HAsEuz2Rq44gw2uYiJjpz882H8gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HC7Cx9nc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AfMrm9un; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HC7Cx9nc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AfMrm9un"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI6wdn178728
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 18:45:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=bre1XGDEQBs
	b9HHiSPNRvoWE3fMANV820bNftGvNCDo=; b=HC7Cx9ncz0mEjr1+9IbG8KM9sv4
	+L9JiNKuJMq4rC0/o1fyRIvvoFPoN/74WUdOp+Yoe+kqTa2E7z12cF8NVAJUt+ZS
	rgxbggAjXvvnQh3q1s6iJaJ8/N9PJVV5R2ee97ozLLx5ttBfsNWKFMlvwaBABsf1
	DUNHwzzbmkV+CPXKkenukCIZElY3ZaRkFsme/HQ9LIRof6rR74VLzWkoukMs6pR3
	gLt+Ei7nZb+Di/09F5EyQTQtA8RXji7XAb7b1wAivhZZuLsfC11SDSnbtZN6nVu+
	5mw4bg/9Dtk9wQOIWHI18HTfX8NIq5xu1eJs5bOUo4nz1XSWvCyNqmxTYsg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guuec1cre-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 18:45:03 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c83124d530so199811e0c.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 11:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790102702; x=1790707502; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bre1XGDEQBsb9HHiSPNRvoWE3fMANV820bNftGvNCDo=;
        b=AfMrm9unS/yVCCbqVdOjJ+ZT94laTMIFmVa/GbiAAlXTruWUXK8RCL+rsxCJ0PLF9K
         sZtgOjWiSsSsOdL2k7ZNl+Ft1ebYxWfN2kfmoEtl6FUu+P8yk+FR3IlwffArah/wA4/Y
         fVvQMriGDLLlT4m12kpTKEUZFkKsViLF+ukKBVPGzbNEPNN1acByLeM0It1vy+juukLv
         gi1K/U88wUB0IZVcXQ5whZX3Y+T1VTuVHmkixd5w+o82kjLedNJAONT4fa5A8/t5fp5r
         VmAQqvfGxp1nfTcuc80eiMm9BfgVeYfoAh8ptY5Sn48fIQ2i9XMPSYzVqw5EpS1SWMrM
         VpHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790102702; x=1790707502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bre1XGDEQBsb9HHiSPNRvoWE3fMANV820bNftGvNCDo=;
        b=n7WskulQZDz/ds7TVLFvYAKm4rM+NKeCVDAD3SlWHjsVfzcdbBrWHh2P3Tm1kg1dDU
         o0o+GgQmZ+MMpjw6R7h986n364CcYbfaOAhA19IJFMdYek85tUQs5YXW63wtTdY89yBX
         UT/A3211d0LZvrmobwoRLHyMcnM9cBZypmmoc0nElTjoILE3X1akIJsMla3fLVrC75Pa
         gpnGzaOwc/QC2lr1JahOm+LZJcF4dz9/CNczw54gzsEeZemSrOW63o6ehlXiMcVh+Buh
         OHYKjHMJhXcdX928MS8tK2+S3DvZ9RlRImAVdhA2PSIG6Tfp1D46FIi8zYoyc3sN1WNn
         TaAw==
X-Forwarded-Encrypted: i=1; AKwUvBzHVpZYFCzafkzJBJadO20xs2VFJlWUyoDMICY5p+KIp/+Ym+IX3VfFqNdBZ/z3KnQMuQtMZ7Qg+qj4y401@vger.kernel.org
X-Gm-Message-State: AFuF++nE28I1N3bdjNqM5RWt3XGFAqmWxox0DyFCrbRa55Ye5D22K0dv
	GI1M67BspEu7XYJbY3V708PSOae62T72mlN4lvfB7S1+hivrf3kZiztqp0GUEBt8fFr3tw1PCgn
	zLlsscsb7uS2NHqJwG/cAAPX5Kv2y0C7orxqLMju3b8IKolekh1houYBtDgYCKsAAYUtj
X-Gm-Gg: AYBFou2XHEYFIgt3Oyd0J2JTvjISrRMTmGOrbIAuN62MEV7QYzhVH/whF4q1dPwbOpR
	WQxGP8+ciCK4cIBIHVFUV1zvctGIRWJGOUI4p20DkBvfgGbjdgtMnszWKQMnj1HD/hTkoetHNE8
	BOthu6Wv+eFd2FAv8ndUVR6gx9VlUaNWQi+EJTn3QNj9552FiK8EAr79CQLpEEzM8Paq/TPnGK3
	5KbZFr5YY6fnXeQfZZ4JjMCLWOCTEP0GNmLW1sZrbvPftlqTlyLQy9C5qmz5guVF8cGIjHKMNBY
	HBJq1ECC4PkPMdOyLq3gGRkPa51hxesuGILmia8Fc9PzM9agbeDC0YijOtU+XHHj8JJW++fS2PN
	0MEeXGDgU9GDDJhqpc6JJ5Jqxx3XaomzSw1OzuvaEJE9po3O27IavJqhM/erisaVs
X-Received: by 2002:a05:6122:ca8:b0:5c8:2852:36cf with SMTP id 71dfb90a1353d-5c9f159af31mr774613e0c.4.1790102702592;
        Tue, 22 Sep 2026 11:45:02 -0700 (PDT)
X-Received: by 2002:a05:6122:ca8:b0:5c8:2852:36cf with SMTP id 71dfb90a1353d-5c9f159af31mr774584e0c.4.1790102702146;
        Tue, 22 Sep 2026 11:45:02 -0700 (PDT)
Received: from debian (cust-west-par-46-193-35-178.cust.wifirst.net. [46.193.35.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886876c500sm374681f8f.19.2026.09.22.11.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 11:45:01 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 4/4] clk: qcom: Add lpass clock controller driver for Glymur
Date: Tue, 22 Sep 2026 19:44:25 +0100
Message-ID: <20260922184425.56114-5-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260922184425.56114-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260922184425.56114-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI3NSBTYWx0ZWRfX9l7jccwzVGNY
 hadYLqi/zLq8tPSHtPTLD6sKKLzADWFnIUUNXQ1K05rbl0638ngnswI5hZxm0jGzyfLxIWCJOtp
 q8ugN3KPTuNg9Iyaq42YxYv+EaPURS75JtPkx+b1UGJFl+oPt+0lwBWHam4gLRP0qE0awkYr0C8
 KcfrLAMjVOGXWPz/qbBUjXX2qwsihDeD1KmtKaGcjuAh1qjn82Mc08B3jHCr25YjQBNLaWYsIbv
 lXG9xicuZkAnwCIxO8kPz2N3kidCcBXyd2mMZCHLLO4jXJe27QzQHsUjax92gkfTJM30ltjxs0K
 x04l2c3V8EJIiV1Ldqt+p7YKE/6V3Z+qPhW5M8rFvqhwdfqlrcuqgTGvGG41Wfn2jXt9W2bTBMB
 aVFGbxvxLGP/3miyyRgZunb5X6St/egu3HvVb7IwA5YH4a7D/Dp6+hgxd5lq9BxRztf5yo9MxsV
 D4zzO4p2euoK34pD5Vg==
X-Authority-Analysis: v=2.4 cv=VKdIDNPX c=1 sm=1 tr=0 ts=6ab2ccaf cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=Hji71o54RgNgZYqDgtlrhw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=9d4qlcpUcIswrQQTxZ8A:9 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-GUID: 1i9SI77RBCjdXLGu40LM4wTQCDDwI-XY
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI3NSBTYWx0ZWRfX/x11t/fPxjpn
 5ljF3tOIhuSOMybEqEaBEOyfVJYnnErw0GDRp6DqjyUTB2QmQg8n7cs3mWDPfeZPCq2nCZ5cX0X
 TMEJKhhtCUmM/erXytHt++yJPpcwIRE=
X-Proofpoint-ORIG-GUID: 1i9SI77RBCjdXLGu40LM4wTQCDDwI-XY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220275

Add support for the lpass clock controller found on Glymur based devices.
This would allow lpass peripheral loader drivers to control the clocks and
bring the subsystems out of reset.

Currently this patch only supports resets as the Q6DSP is in control of
LPASS IP which manages most of the clocks via Q6PRM service on GPR rpmsg
channel.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 drivers/clk/qcom/lpasscc-glymur.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/clk/qcom/lpasscc-glymur.c b/drivers/clk/qcom/lpasscc-glymur.c
index 97fc099983b6..782183012d97 100644
--- a/drivers/clk/qcom/lpasscc-glymur.c
+++ b/drivers/clk/qcom/lpasscc-glymur.c
@@ -39,10 +39,31 @@ static const struct qcom_cc_desc lpass_audiocc_glymur_reset_desc = {
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

