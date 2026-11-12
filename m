Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794495756;
	b=2Xg/G36Nnf4b6W2G0x2PGnbe94/nhJ/SjWy7KZpYaXLC+rp/Np/ZaGUzk6z9PKwckFMy
	 ZjZOG65dV5/IgHA0dls3i8/vL+m7/3SLndxIGKkB0rOmFKn8gkrAdfa4ESEAv0bEKDtAg
	 e1kYJkeZl001NEAh8Mb89I5MX1uMkrl5lne5PkFvl87qxepi+HI6txUpTvSfQZHUUBKQ7
	 Zc4wY+sEQ7BffvukQuQcqWU6QV0LK1dYL+5VqOVN3G9jLjc+xUtzsT5vjzifyodpZw2/+
	 7yUgQVz9N+rS8sNjDkrraMxtKGpd9RFYkY+2LF8evRhr01KAjAnICGmPSAIr41sG6WQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794495756;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=T9jAmjlpPJzKEesHQGiR1/l1Z0EuOSLOuEzosz2QsKs=;
	b=b1Z6BmFll19tSfY6ZtJ1/HcTevTnohMcp+5snFuJeQnoOsYUPwUZuDYm7DSYxBRLo/4U
	 dTeqGtXp9ib/xPfj3FD4U5W6O+Uk2MauYn79GJhkKG5vpdOARPPBy6FjXNH9H2VAtTHQS
	 0biMNlreR+z6AEphGb/R8/XDCADsui0tnEeBKWt6GnEkQ8Lubtvo0bHoh/sKvFSTrW1IU
	 GTlAC62liGrzWzpbdtTJmTYqGv1C0dAiFsN9QQ2Sl6BSxksE2AYG/96Q0PqlQW5nQsTP5
	 6trA3CVlq5gAR1XP/KJJROFo7UyBoYGqW09BiR2IHXsDdchK1ojLwSU/XY8HBksz/FQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZfflmosK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ja92lCdl;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D170F606A32D
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 15:02:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D170F606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZfflmosK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ja92lCdl
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACAmkfM2555413
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 15:02:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T9jAmjlpPJzKEesHQGiR1/l1Z0EuOSLOuEzosz2QsKs=; b=ZfflmosKG2Xs7tFf
	pJMyx5GvhcxNkwfpWvgSZP4Bd2uL9DJRO6NfdatdYCiSxL3NaguJN617x1ymuD3H
	4fXWZQi6HLKnI8teXiYWQpQ+IxwrA2mWfiBFgt72wRQ6BjsvSP6m8Hn72FKrfq0F
	zFTjLTuJrnTEhKRhIEGHJB8ducqa3QdUDkKoUfFET85fkdVqcvyHHDeVyZLc+O3c
	QNa/JHDhDN9c53ZHPLJTMJEKL118pnsWhRaDMjB3xlUTdgwz67ljCKfjFo+ReLCI
	HWl2MxDBvntgJtA+mzOxNuYZf4PnrHdN82teZNfPK2lokWaIp+UjAhyzjnhwXXSr
	TaIF9g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwc1j0vpj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 15:02:34 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-537548d4bc0so103105401cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 07:02:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794495754; x=1795100554; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T9jAmjlpPJzKEesHQGiR1/l1Z0EuOSLOuEzosz2QsKs=;
        b=ja92lCdlHPop7oAN0N0riR/IFX5uypzzUI9fmNfx8/3PVf08e+hFQlQoAS2eHtLiuA
         WeFljNKNVtmEGD9CG0Qto2Ii7W/8gTeohP01L5ISmB9ZeP2vcR0RLnJCDrQtHxzKN0/I
         mZxoWPuTgzzaxJUcRFzBklAdsVXCceppF1cKc6StZCWQmECilmFBuAbbe71GXBB2NyRk
         JXGKsmZqIsgZzpy6AgBRl6qeUnsph4zf9/GR5hoN3LhsTwqXG2NnFkFHm5wtDWnkofSV
         p5iaqUf1ipog3cda6tQBOGf3kJWKJGzPOTWI03eSYV0qhX5c9p8eihnVrysV/rh0qsAJ
         dagw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794495754; x=1795100554;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T9jAmjlpPJzKEesHQGiR1/l1Z0EuOSLOuEzosz2QsKs=;
        b=grCBf+lfxng/tvKiuxSxnQrqFjwdogJ2WbRkFkflmSr6AhkC48WFDnCsj8HYpnUHG1
         TL3QVkaaSwl+DlxNoMSanD91or3mf00fYwG8QDYDmyCnsax85vc0FxOdIARpXLHb1xOJ
         24x2dJhYcVIhSFVhJ3qk4ph+aTrSnUZs9uk1jrv/icaUm3L/NISNDklZ/ojEo3xG6KLn
         M+TqRLBD5IAdueoMQScEN6Or3ikG5K9bUk7V0CY5D5Tw9d4mp1CZaX09b0vZp2dFOgKe
         bsYmqIxIZR5Dz6zMpAFcoR2uFUiU3dKiNkKgpnKuW1nFjNRomlsBqlqTlVkUF1uHkdOh
         lMWQ==
X-Gm-Message-State: APuU4Z8XRzDbEgQB5AhdOolPCD4zx+dUBNOnDf78cVjTau2HaRLOKAjr
	C7mzU26xZXnmdzmcE9RRer+x0pz5zX58zGYGBZJFwVejskxLwjKi3qGXiGdjU4lvCvrgCx9Q21v
	8A7kksw12M5IA0HHVW51N4orOGz6Vx2if1El1HMbE3jWBx7LhFT6ewUHkDbuAFnk+lmRp0VkjhQ
	vB
X-Gm-Gg: AYBFou2I/FfFxCZo0Ea2jYb8FfJEpEHWXbWWVad1BdILew+I+zhwJvITpmiVroXha8b
	k70Z34Y3sWAfK8v7ZuewVFJSvmtNoFd/FGI/3NbsgF9/vUuFUKdwTvj+saEOsnSIe2T07X5lI7f
	X8YjwsPY6RGvJRNRPMKVQuagFiMrZY4u8z9dbjA5jXZonvQq8GFdekSL7h6GVa6AEdLMBKSMmP+
	Q9CzEAKVQzAFw2x+ldltEM3Orv7tngSktbi85PySGnUaVvbaU3CS3YLttKdjEGyU8VtwNHyLvoS
	xYbVUWI7xAw9RD4IBRXgYFaWGmfBUcUqrGDg6B7YGEUH1dXW3IFk9lFap3idbRfW51r1xMGpc5N
	pugHkqjnf0nBaoSULzPk/uLo142iGinLM8uZ8bg0SM0Lw2x0d3vDu23XacW1Ry30GMdSQ5A==
X-Received: by 2002:ac8:5e13:0:b0:535:a5f8:a5c1 with SMTP id d75a77b69052e-556c17719a5mr101142001cf.65.1794495753936;
        Thu, 12 Nov 2026 07:02:33 -0800 (PST)
X-Received: by 2002:a05:6122:4d86:b0:5ec:d5e1:ee2b with SMTP id 71dfb90a1353d-5ee1c4bb798mr2491992e0c.23.1794495741371;
        Thu, 12 Nov 2026 07:02:21 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba08e354b0sm106758475e9.1.2026.11.12.07.02.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 07:02:20 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 16:02:03 +0100
Subject: [PATCH v3 2/3] arm64: dts: qcom: msm8996-oneplus: Disable
 disconnected DSI
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
Message-Id: <20261112-display-msm-of-graph-v3-2-7fd0c06ec6df@oss.qualcomm.com>
References: <20261112-display-msm-of-graph-v3-0-7fd0c06ec6df@oss.qualcomm.com>
In-Reply-To: <20261112-display-msm-of-graph-v3-0-7fd0c06ec6df@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Del Regno <angelogioacchino.delregno@somainline.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Mahadevan <quic_mahap@quicinc.com>,
        Richard Acayan <mailingradian@gmail.com>,
        Danila Tikhonov <danila@mainlining.org>,
        Robert Foss <rfoss@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1033;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=GCFRCKJTBF0tDduwhG+AEpuoFlapsyUUwKoJTS/2B/I=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq9dTw/N/EMo0/73D9HuBKXPhSALwVSdxATrsmZ
 oewOiIsNX2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCavXU8AAKCRDBN2bmhouD
 18UKD/4woiD/Ev4qypVFuqNMNuCXZI3SbvQm8sS+F7CsHrUisNE6AZhRIMiocqt/yfQk/Nn/dR1
 tCdQWwuZujVtx3NiSUczQKSVReKIAz/t1UomCrIvzO5o80YD5OYawjUF5d08u/ofOHOyEYaKavd
 5M7af9hvn/PnVzs1wQjrAw2ZmjQmZu7HFW069FaRPwm7bc5+GMMHRP/tIqdhMnSRunCywgkILLI
 BZ+sfDa/6ViK0ERYBB3+UqLrlFu6bQT2fHMmwmGcg/e347wUOefYaH4NGNgPvvD6MqrsM3UHeiE
 czB/RIqnkqPRTEKTB8lV2Kl4UaepC3biqwLLr+Yvl31sv70NNUzWzqR8+Vrg94vDAqa6Jyz+tR1
 AZSWWEI2WW0h/9VJKRTDhTa18+Fobtx2Ge26+eAH0eBO16H/Krh37iquAq05kl0Bt34XSVBRxq+
 cj3wsb4brSj/+95kezwUR6wGW94e5s36oX9k7eGDSOBePFTXDGwLgRGBBInRUuSXre96KZxs+HT
 vLDuzJ8hJSsSqjgKwKXbbSw0bbO/oza4PGLS1UpNYVpyVGWeYfh+lEKBhDl4xndtjKhtQpBW+zy
 5FEBS+UsVh2s84doqXzZZjrrCdVA3AK/mNHmyr7jcK5X48KVjOjG4bT6LtNSIZtSBHSM8RXNYsG
 lKvDey+8vtsG+RA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA1OSBTYWx0ZWRfX2Wje9g8BTc7x
 4rYfvJIM5V1KnCOyp54Mct8XExrQ3fyk/lVyd933FQ6b5Sx/fIxpiRgDjkSlZ2Vk6nr8acEQj0x
 2blcU/QA4j917rot8gnvqUnRjn1Mi9U=
X-Proofpoint-ORIG-GUID: 8PS4RHSCQ5szLBg_XKLFrYfUY7PL-0U0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA1OSBTYWx0ZWRfX731oa47of6R4
 agZUD/crkjZ4+qPznefBEqF43k5PjIUhNipWEcCekweIbG/s7HR04b7BAKM6HL5ikaTHk6ZcxKW
 3Dr9QylaXS+f0T35uxbC+Ki2bcWDvOhxMSYpmMIzcGN1Ei4G6/I8sCbggxEqz9+qEC7Gv/fsOQb
 BkJy4kKN4GgCy9BcVYN9N0AIWbu863XOTzbyFyph7Vbj8oIMLal1+FJWMJGhy3qRQeqNtKs/OyK
 fPWhrQvetI4r6msjcbY0WpfeT24M7sYWPQYtGCXWF6jCXQ1He4Hy/DhyHr32lGP9SythyjvHHuj
 TL1MhGS9oXFvPbxCTKoK51J+A0Y/a14Y4mvlTSfs2ktZzhleXp+Vs5KwwuVsIXlZ8xCyDKj+C6/
 TnpdcyphD3zWv9lMwVERENa13GcwFbhdGZ0VyW8iPbLqf2mMnKq+g1b6L4keWlwNOfRMjQhoe16
 26fRsqiqHQ7ADOR98pQ==
X-Proofpoint-GUID: 8PS4RHSCQ5szLBg_XKLFrYfUY7PL-0U0
X-Authority-Analysis: v=2.4 cv=Vqe2kO2n c=1 sm=1 tr=0 ts=6af5d50a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=eMlgcxtRJz0w_Lr9rQYA:9 a=4tUkUnfIpJ8A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120059

MDSS DSI and DSI PHY are useless, when nothing is attached (no panel
description in DTS), thus should be disabled in DTS: no bridge will be
registered and no component device will be bound.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi
index 7a3f8afae22d..9c2cef11e7a9 100644
--- a/arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi
@@ -189,7 +189,6 @@ &mdss {
 &mdss_dsi0 {
 	vdda-supply = <&vreg_l2a_1p25>;
 	vcca-supply = <&vreg_l22a_3p0>;
-	status = "okay";
 };
 
 &mdss_dsi0_out {
@@ -198,7 +197,6 @@ &mdss_dsi0_out {
 
 &mdss_dsi0_phy {
 	vcca-supply = <&vreg_l28a_0p925>;
-	status = "okay";
 };
 
 &mmcc {

-- 
2.53.0

