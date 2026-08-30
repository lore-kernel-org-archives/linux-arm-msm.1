Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F7731D367
	for <linux-arm-msm@vger.kernel.org>; Sun, 30 Aug 2026 21:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788123745; cv=none; b=rG4SlTEddV32vFdMpSNd7X2lp+0MrTTtriEVE13HKIgwX6Awbw9wyMHvKAuxiLDvpkwCWN2FWesOe7tHazn7EAI19Pf2XY0RiGth8zPOjF5AvBYvOK6AJ67VoMdpJH8fxfbHF7JsXI2F53zdTetmGlNboQAJa77sVaTwxF43obE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788123745; c=relaxed/simple;
	bh=50CKG97HW6ukTJAn1Vbg9cu6CFplrbUkkI9w170RsGQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FPi+UxjYdiqjRWaoh/zCkK06mxlFkqTONluXRV6MeNhsD3Q45N42G9E8JT5sXqM2dd54p/dr+eXsI2mSrr1YsJ/kAkLTxhPlvJ5Aw3/IBo/lYxDTf0RWkOO1N3maIZON81FPIAyTwuZFjtX8RCBJ/bGFzmS9+7Qb4p+KCGmlnbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k4MjVYPy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MOhK639M; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k4MjVYPy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MOhK639M"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67UJK20I1552530
	for <linux-arm-msm@vger.kernel.org>; Sun, 30 Aug 2026 21:02:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cJYxDR3XE+AeLGY7hd78j2epCFifkxtdtY1uZSep924=; b=k4MjVYPyXeydBvHq
	at/bXQZ30oQmwlvcJs3EyjxFdaHuBsgH2jLPT6yInCITQxU9XW5NUnm+6eykwt7s
	VHiSY2CyKZPIlXHBjTQ3s1E/5q6AbZD7HOZ87XmdXCe9GokQRaWG6KMXB4VMjt8c
	BG632tRyqWWps+rYMHjtj0TmyeJMo1y5tt0XqLemDcuQebXROCM6MRZ/OuNni2HR
	cxnqnkjrLQ/ZoxaQFBF2mwTcW38wTAlNTx+HZPhYGSlBTFN0nusIGemtI0PcDpx7
	ZxK6V4GSkwoC/Z/Z9iEjJ/vxFqtoU9g+cL+Fn8+kqti16WGkv2THxsDRLzNZ9uxW
	ShElaQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqgykqav-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 30 Aug 2026 21:02:22 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3950b1371a7so4348991a91.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Aug 2026 14:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788123742; x=1788728542; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cJYxDR3XE+AeLGY7hd78j2epCFifkxtdtY1uZSep924=;
        b=MOhK639MzPRADb0reiQMyIrRgjgLAb63Ie1SZdOwcheIx7Ax4g0++cZP3DWRHoxfSN
         JWat9xLTX7gAqYn2JjmiS4I7GvRbUwNJCaqAwyLKzDPXn6TBC+orb4z94wxOrfClSQIj
         yuK+S+Gh+9otjPkdHlGKL0DpNz+eSvf1DhpfoXVmrssihJK7pOOi5BGqCYZy4tqmyYxQ
         d1H6nqoe753ws31MY0pEbcRY0Rjgw6dg9Nu7W2OrTz1Y64ELwPOZpIg8CUjx5h69QK7s
         BNUGwiEWSQqPwyLizkbbzw2rq7IJAUp131nFF1ztHZK1TEBvzIGPPT+VirLnnzKVbO7Z
         4+OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788123742; x=1788728542;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cJYxDR3XE+AeLGY7hd78j2epCFifkxtdtY1uZSep924=;
        b=oF1L0ZfK9CXKkbCQEGICeElg+PSXz8OMa3kM4CuF9A0C7RNQAgUj8BQ/ndBqShlr4L
         TzdtKO3VcmLg+Qghuo34jsYmhDmZ+OSuzpHDbbCR0bQ7fQQ7PXCvsrn31uWQwQZaQTol
         nbMJtKJjPpXT0KbW5nLGYV+3sdTMoHYOB7Rh8mYUi/OLV4QsyeTjqpNwjzkDyFiVUlT9
         8ntQWn+2rJL1NmvwVME6ugDAQ1xyIjhMeHNMlfkGLxJWeo9zJtsnFoeooyIrd6Q1PCOM
         Cal/c+XNm9zadykQL99VJOUZ0mewkYP8HN2JpOK/7A3QpibluTYPga83x8Z8zYdvEGdO
         aE8w==
X-Gm-Message-State: AFuF++l5BFT0obYF5OzCMMsZxmSNmvlJ8cw9hU3zub7+wCht1of4+6oP
	/wUmUevuT3ArP4qFqGih4hg9j2VNH5T4lfSl7JG6fGJvW8Knc1W+Z74ZAk9jbEluYQspjEx+Zxb
	DRimzRNZBRfSH5NbBArZjIUgNUG4+B2QRUcg8FXO7uFxtYQeGQNDbHfwGvdcAohyJZvDW
X-Gm-Gg: AYBFou1+nbnb31aQyGpOotrB6njOj8eKJ+0A3UgFcRhHymvmOR0LU+a3/u5KfUcZsaS
	66g9v8Aj9H7POl2KJnp+OB5mrgPn9w4kRLBU72htNghQgQyig4BF9Mk0neJERyOUiZQfzrhg17Q
	ekQPwbQRloin27PP315nUaHQvRhdRq8Vrv+zrwIdn9t6bUjXSS/ptqK5rzBrTFxfI/35hjV8RSX
	UF4Wh7JkdYEx/0Zth2uQEMjKUYjhBm49eYSXKUyGle2579zd84+9aPzB20+yqyvmYQAvk1oshvr
	CTcziGP45OQiZLgZSqzm4JOMeIsros2HF/7esJXLpNMzqtjLFG3we5kqnXNrkVxnCmjxhrQk2wj
	fEdUTxB8KUdKlL2dLKLdWw/Wly93VqEsBIeuZKFVMhA==
X-Received: by 2002:a17:90a:d887:b0:37f:ed7e:7e42 with SMTP id 98e67ed59e1d1-396d0ef8b54mr38328928a91.14.1788123741881;
        Sun, 30 Aug 2026 14:02:21 -0700 (PDT)
X-Received: by 2002:a17:90a:d887:b0:37f:ed7e:7e42 with SMTP id 98e67ed59e1d1-396d0ef8b54mr38328862a91.14.1788123741451;
        Sun, 30 Aug 2026 14:02:21 -0700 (PDT)
Received: from [169.254.0.13] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32b49c867f5sm10980013eec.2.2026.08.30.14.02.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 14:02:20 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Sun, 30 Aug 2026 21:02:02 +0000
Subject: [PATCH 1/3] arm64: dts: qcom: hamoa-pmics: Mark pmk8550_vadc
 thermal sensor provider
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260830-hamoa-sys-therm-v1-1-27108c40fba5@oss.qualcomm.com>
References: <20260830-hamoa-sys-therm-v1-0-27108c40fba5@oss.qualcomm.com>
In-Reply-To: <20260830-hamoa-sys-therm-v1-0-27108c40fba5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788123739; l=827;
 i=bjorn.andersson@oss.qualcomm.com; s=20230915; h=from:subject:message-id;
 bh=50CKG97HW6ukTJAn1Vbg9cu6CFplrbUkkI9w170RsGQ=;
 b=U+69n+LQnCt7imBiaFZ2MNif7fKQgpIEqliVeBgvOatCyXDPiiC+1oTORwRl2ComBwwi86p1/
 m/O3/6PGgJUBtzxf+8XWrff2Eta3awOJyDhiVKRn8TI2u2VA8pQBWIv
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=ed25519;
 pk=VkhObtljigy9k0ZUIE1Mvr0Y+E1dgBEH9WoLQnUtbIM=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMwMDE4NCBTYWx0ZWRfXxx18BByf2Q7K
 Z41SjmRbkbWrHMppoOSbRG5pewbJLw6JUIi3kYUIRKrm9uO0upjHNMVwUETh4KVEPC4jvWe+2Bv
 c9KrRklk1BUFz1MDH/wZCmxc7TTO1hw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMwMDE4NCBTYWx0ZWRfX5AHeKGa+Tt3u
 /j/qDAjiu5mksEl8nWm3zysrxUBI4r4f20RH1250MS6lE2wmgsJ+7G0l6e8YnWndsdpRtJrizKX
 WxbbD51CV1GJnxuMHiLKTJBryAd20ZOuTjHuL37mEwKR74GPbrRRkkn5o1PhGW4pVmUrGhHNy8R
 nDHTQheSpAfoNT7IhKpP+jOElS9MO7wcTAOuwtPL/D1p4Rh0CDwl/RI3mEpbPqvFZgJUZ6G8pMg
 WQT67baVCglPwsJ115tdSfeYuiSfpqwCoHdwezog3VdUk4jrugffkRZxYZt+FTUs47EKyIvUEl4
 M+z5NWp9Bm1/vy3KQYk4p/I++h94kh9iJswiMOsxMff5Bg4GWL2UY6TRy+lLp1AeChrtca/R2JC
 yBFQaUdViO2nmsSpBMhLkMI6VPMgK3HbdnccocQk7vrd5CwWFrKLsjWKxjP39etIBHpzQqTUNkH
 xmpzpqi1IqH7KWXd7dA==
X-Proofpoint-ORIG-GUID: pm85xukhBtj4JZ2EvqR06HPsfb7UVrfE
X-Authority-Analysis: v=2.4 cv=R5Ez39RX c=1 sm=1 tr=0 ts=6a949a5e cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=qs9X68h9gMtM_QVZDb0A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: pm85xukhBtj4JZ2EvqR06HPsfb7UVrfE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-30_06,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 impostorscore=0 spamscore=0
 bulkscore=0 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608300184

The PMK8550 VADC is typically providing thermal measurements based on
on-board thermistors, define #thermal-sensor-cells to allow referencing
it as such.

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi b/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi
index 17d754d57e18..7fad4a9b92fa 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi
@@ -288,6 +288,7 @@ pmk8550_vadc: adc@9000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			#io-channel-cells = <1>;
+			#thermal-sensor-cells = <1>;
 			pinctrl-0 = <&sys_therm_0_gpio3>, <&sys_therm_1_gpio4>;
 			pinctrl-names = "default";
 

-- 
2.55.0

