Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E3E7379EE7
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 16:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787328566; cv=none; b=pRRb9UU7az7dqaiY23JXo61MZX2u6kFLyK+mxOJRL4yQmhTbhTaQQlIIbbEIwBEvVoyAMfNCWuzXyvQsPEcVCliaaQcOOI8C/4wAp/Gax2IlNNjRqzqufFKb0eUO/qB2xTlsYHwJr99zCcLK7iWcLnrspGIsVZuNdJjwObIKLRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787328566; c=relaxed/simple;
	bh=gHxGYWhnicYORaElGwhsc1d3PMvje3as8cNJCACI2hM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XhcBjkApsqrIhr6R3xOrg0xYcms6bTjzksRXQuj2Pq+1fnADqYEDRXCHmGqlKRg0SAxcV26M7O5MFwYTCeaHA/gCVa9jWyh8jMvh5cdldMbZSTiZdGKOfv2ZJhz6inY5WS9T1rRtjJJQRX/NqP2jNgDr0S8oRn3lJ0r9mftFfas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NYWY0oMx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=anwZT0cX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NYWY0oMx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="anwZT0cX"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67LFnLs21642961
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 16:09:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Sx6lBFvEGNhy/q5sHRGfQDQiM//S9qhbvL0j8qSm5v4=; b=NYWY0oMxw+QLdiJo
	szf4Io4ug8e3+O/mIiPbVMM5c/2BPdee8O1E5qJAnkta2E2HgzBMhKX6jPFcd0lV
	lGm3udZmOC0tefQvPJFyRxvdhq1knlg1reSDMqL0N0vs19pQT7AMMyd8N4XGSeAH
	J+DgvQ3/3Q1sfUYPvpzvCvtI/dtxRjVXq65/Ufyj50g2bGE24zS5PQD61Bxlvd4s
	E09nXbAhQRfHaTirqbfKfoDMjyChElU1Yu6ftq8Q4eEXpjYU3hKzMUKExIXMqukr
	9Z5uLF6/I1ipqHOPrJWKaOhSQkqnMuUqMAW5Fx41FwZPJqxFzvgFjBblZypiEs7P
	+ECtBg==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6ebutthu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 16:09:21 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4ab7bb257bbso1727715b6e.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 09:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787328561; x=1787933361; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sx6lBFvEGNhy/q5sHRGfQDQiM//S9qhbvL0j8qSm5v4=;
        b=anwZT0cX4MNvJJ1LhVASj+H19+8iSF2FKYZ0G7QW4dF6XGhMftGZjig5TqJh8M34/p
         zxVthY10v13COb1kcowm8wFcytw9OfLEkU31llDgOQuZi/LqypkvjrvjizfiSNxR9IOD
         hJpZYdl+RISstZMAFcpp0Vpby9QE+0jS4zljP6UV9JLLef0bG+AMKDVYq7dGXubRPW6O
         GwFwGWJHGF4duIFn2IvHSFcs/rGWoKfo/i1Kkk6UVRQP4wX3SMLaVUT0T1fmqG5ukYGh
         sYKzGcTMGEyEHvCvEuJkVO9NfluDdrb2Z/dTpRECbWkKC9NuKNKjs9yF5Xl0ZUbroJ0k
         JBaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787328561; x=1787933361;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sx6lBFvEGNhy/q5sHRGfQDQiM//S9qhbvL0j8qSm5v4=;
        b=U2My+qlpUx3LcG66JSIvgSg37CYKpZ/U4gSlajqm1R1QZuKOhiw4oOivgUZoHv9cUf
         5M6Ha+1JwdBP+CFnPcNWtloLy8aC78BSJkvpV75Y/qFCnDmWQCRoyRnjJP+2XkQkl9DC
         asWZe57f76+8TbWOtA/P4U4vdIGZFbicPkHaJDLvsvCKFRtGQXescvNv5rqZPwGEqG8S
         Ktj/cbVm6cnT4licxNAG3BtpwimXfAczPw581VnFIcVpacj9JcZZQYJDrsssRy6cFXL0
         QgSlC5Crl2Rw9oIqmJ9sPjLGBY/Z5cxsVXGizG3l49E0/jj7+d/LeTfSgSbynJr1nngX
         EzBw==
X-Gm-Message-State: AOJu0YxZfZM7BvSMjIv+hw7UB6O/6XilUDE606EWC4JZ+YTzkgyXKfid
	Pq3jItNPVMXxhkTKLYss9Jp521s2vCxNmRIA+JVPClZJhSSnEBygj6nKbGOdHJ9g1ryXpCLhsTc
	jOEhMkblCoefQMwJUAEf2oZ1ORE8yrevaWBys9y/ZpamFG3j8ZHDBHgJcJqWbXaPFAtVb
X-Gm-Gg: AR+sD11Bmn7oVA2k/W0gUs6UQLl/xYaxD8q6aaxyjtCWxuT0NC9CPM85bkY3D5QaM5a
	pEXr3pMguwsU4GuQA2UPretu+Y4MblJZITA9ZHH5jfuUOlhCjwUkUXIWrnjBsv2Z1FbuRrnzy+0
	MoQw/AnWouWloxm6FMcFstMPLuJRKojEp/JCajaO1iynMJsD950djLuryJBxmAi6mYKvG9MtJp+
	IQwOYDRmoavsPdGIeyKO0QW5LU4Y+7+eL9OndzAfuaBf+QVlski5ck0qfR896nwZQoqa07HcAEb
	bKtd/0LB7WjtL6NcSZ1P037OjCXZZLWRqx8Yn3eLkLR2vzyxi5CwjcwCQHNpveHI3boyz8a5itF
	CYOI295oCMOQbIPtDNLr71uYYvBa4F1z1ecH3muSU1CbYYhWEKuEAnCcAtMPNsYWepocXo1xv24
	OV9PIx74fbIeZKMTgB9RFNDbE=
X-Received: by 2002:a05:6808:1394:b0:4a4:866:c395 with SMTP id 5614622812f47-4b2ef3079d1mr9004994b6e.13.1787328560673;
        Fri, 21 Aug 2026 09:09:20 -0700 (PDT)
X-Received: by 2002:a05:6808:1394:b0:4a4:866:c395 with SMTP id 5614622812f47-4b2ef3079d1mr9004887b6e.13.1787328560203;
        Fri, 21 Aug 2026 09:09:20 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b2d6d34c8esm4804321b6e.13.2026.08.21.09.09.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 09:09:19 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Fri, 21 Aug 2026 21:38:54 +0530
Subject: [PATCH v3 01/15] soc: qcom: geni-se: allow selection on 32-bit ARM
 Qualcomm SoCs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-kuno-soc-support-v3-1-196e2b306368@oss.qualcomm.com>
References: <20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com>
In-Reply-To: <20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787328540; l=973;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=gHxGYWhnicYORaElGwhsc1d3PMvje3as8cNJCACI2hM=;
 b=4s47+ystpTmuQ1rGl9zmtQ2TkeJgm/KBhTGCUovSPNHKV9O35WPS3bN4aQd0VIeR1yIiv559R
 UNXDB+NH73zAksFBSuiERuQP6ZxsPQORcPPodjzf0EqvrTjR6vodKD3
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-GUID: BeY2TnBaztmLxRKbn7ptH0-2v89qcOzN
X-Proofpoint-ORIG-GUID: BeY2TnBaztmLxRKbn7ptH0-2v89qcOzN
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDEyNiBTYWx0ZWRfX5ndM35oKIj28
 jhAzywDo/1DPh0/kf+qOnOvCp9YyCpk+bEY4JuwB6hPMANeEc30UhxJhmWY/OPTH/j7eWJlV8kS
 KqzUTQBHxpUclFOIAj/X+B67v9hXowM=
X-Authority-Analysis: v=2.4 cv=QJlYgALL c=1 sm=1 tr=0 ts=6a887831 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=6t05LGSwh5SlIrDCal4A:9 a=QEXdDO2ut3YA:10
 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDEyNiBTYWx0ZWRfX6dXT9pXzfhkf
 C1kg1q/O1VMVradhTz6RYnS2AzwHnEIHe7xkytL/lS+a84+3VQeNyCMU20KA7CmawVGQD5SM7l2
 lZrKjETb4woshfByvE9a4BegG95jEtH3ga3BryamP2oT1Bsz7pRZKSUrSqW4gCcSTDQoa7n02q0
 mP2Jcmu8tOhD6Ps/GZo/DupXjVP0S6rBH+LXEcFS172Vfg8S0iocCqw8dI6rPaRim4feFQXbzTG
 w//xMrcArjbz7nQ4pEypFbOH9lIpl/VKPQS0hLWdT04xw+o9XRjX6IQJkVFFr/WHHWVbgtmtmHQ
 vdroPKA6EqXuogKyw11G/CL84AyzYMRfuDBkGMMn2yL96udAYsIWstwS9zu8WGHpdX5sd5nGG0E
 YKajJv9YrNXRA2qjGprdHfMjDYLQ4SK8aFnJxgUlKUHjotUMzpYaD3rzQJ6L0OAbEVm5L24G5l/
 k1jR9VgFPIL0QeYv54w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_05,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210126

Kuno, a 32-bit ARM Cortex-A7 Qualcomm SoC, uses the GENI-based QUP
wrapper for its debug UART. Drop the explicit ARM64 dependency so the
driver can be selected on 32-bit ARM as well; QCOM_GENI_SE already sits
under the QCOM_SOC menuconfig, which is gated by ARCH_QCOM ||
COMPILE_TEST, so no replacement dependency is needed.

Acked-by: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 drivers/soc/qcom/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index fd4d4ecd2df0..5b3c9d31fd7f 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -39,7 +39,6 @@ config QCOM_COMMAND_DB
 
 config QCOM_GENI_SE
 	tristate "Qualcomm GENI Serial Engine Driver"
-	depends on ARM64 || COMPILE_TEST
 	default ARCH_QCOM
 	help
 	  This driver is used to manage Generic Interface (GENI) firmware based

-- 
2.43.0

