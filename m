Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1346C368D78
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 12:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787144033; cv=none; b=QThdFoRSzgZ++fB9iaYIZodbkWMsg54xP8HfCsbxiPkAqtfZpplZ2t18am16iqBGOp38M2ZCv6M4aeu2JkvS6xCmF19oX8U3SYWDW6yyqqjhxhH8RUXypDlB7cuDrnZPJRo4W+j60atGNPATlwWAAvaTzo5+kaAUPnj3NGqx8k0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787144033; c=relaxed/simple;
	bh=lRo3ALU80eN8NLOuV0UOQeuSVv9zf1v4drYuyPGYgDk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tP6hjmDNdKj3qvLQbYBEat6qzyws055uwM93FdiZISF9adtYygDW8/MUeR+MVhbd/47Vk6JXW1JAdqtccCfx7lgpaW7g9ihPGEPj3mzJlxRPh+zdW1oQM1NzT9RCw/CTtRVlJZrgxtS8G10LerpYoj2YRqWdE3hvA47ZSY74IsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XFJEnTZd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C7alH4rj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XFJEnTZd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C7alH4rj"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JClxp14084632
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 12:53:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zSKwl5LDXICbGwUAIJuk+Vh/EggkwaR0tn1iVebnnkU=; b=XFJEnTZdYpMu2VIZ
	j6hg5IoHaxF5SklFUr4hi0qTCz3Y/Y+R9WHB8cHgEpZI92VVsrhazwiyQfecRlq3
	q2XfDbj1OwaQS5H3ipDtg1YiR6iVIV5+VHCmnONGNSi0IjmZ1O4KtP96OPLnyx86
	YolCeCNZkumz92sSN5aIdMF+CIu4n05asoEZA1OSBq6bfbbUHLdewaC0vq5MusRE
	juc+m5EWaqYLaYZEYhLYQFM2TLcfKCCRr1pjm4IK9UfkP4Tl6ErtsswdiPbdONav
	26gkwIPIvgDVSHlpz1d412zRcsTAohzVo2NGvzcEnHGgb8CgzBrnT9mqujDZTaE2
	j2s02w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfmb8kx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 12:53:51 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-936d067836eso122498685a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 05:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787144030; x=1787748830; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zSKwl5LDXICbGwUAIJuk+Vh/EggkwaR0tn1iVebnnkU=;
        b=C7alH4rjdVJNbB5Qt4HADTINv/79GSe18BNjodBujhgpacgYwD8NHvdmYHyhl+SZwQ
         ap1VtgGh8S44dz4jAV18U/+W+J/NJXXU68Vox5t0acNvNxR4oWxP8MctOwSWbikjq6s6
         BhI6luh2N7rhLW11e9i4ofxXoPI+rKFU8w5DbeHVZgMqOpq6TqS978W8zc50HUQzaoXR
         6xIUpfLJWepeQQ0CfOdMmSzmQMERghR5J1roypNc0U+GvUHgT0phi0tc6KGScIfbiASb
         R92KairbzzeaMXfAUP25sOO64BddbcTZD4tz6l3eQwz66K/zeShRQu1D0toDB3ZYwczO
         Vs1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787144030; x=1787748830;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zSKwl5LDXICbGwUAIJuk+Vh/EggkwaR0tn1iVebnnkU=;
        b=sVmKbKU58ynJPgwqHIak72UXwZWDhoztA6WOpbPPIlIoOhV1WMXWqufMDdhISMeY2U
         SLnZVxqlPYavrM+G1EQiIOedgBbAW4G4SIh0n2OJa2uiW2m6Ac1HTotPkq+vIqMiaLbq
         nLRx8aHn5FQIfqp3iUysKjii82cHTn6psEgsJ2XC93PJ2w5iABp8Y7xnTim0ZKMcAU5c
         /6Ni+qzPBRtp7WVRVh8w+3dy3py/KcqB8X+eSkHDL1KT+w0bHmtea3/QZN2MWKmYWTEU
         PHFwmzkfNLvlyVZZxk3fMOAy65HAf6MEOtmTAXCscTumwRMomtKwfxCv1RXeEANMZTQk
         zTzQ==
X-Gm-Message-State: AOJu0Yw0oy6O8ZOc8xrOMo00+5c+4Ljne4sqvdGWqrnUR/XF/KNUmkqb
	WXeFQ7FVAzSfpz+wm/5IkO14OndIZ/Etg/bIroiIhM2rVjUJXPtih8ewIFZ6+3/M1+7hmlRoasQ
	7lTLRxrrPL8qKEVrsFEK536qjLbTn/oIqsUpsoJlrKcU7T+cKoo5TJk6bgpcmqiAva0ic
X-Gm-Gg: AR+sD10MybVolKdR+14rC94elxN2BmhXQMWsJ6vQ0ysKs4gs1Lyf3pBP3e/TU6cGIFQ
	J2UbnloKpxv5LlXmlHDnA6JWKo/0Ho+CMED7D2IkMjj9YsU1LTivqrZmPxvGkwhks9IjMJH3nIR
	h25X/3YYV2R9GIaDhcDfKmVGVzOzoxdZlVnBL9zDi0iyH4IyzW/EdVchl3UQ89G8zYC7p0m6eJR
	GQ3+4TZxoGrgFAbiTJlJb3hufA3QjC89AP5KeUXR5k/0bmkmFFmHJtJ/s+NExkgnQGEcpAOH+LM
	i0NCQ+q1TjYmtHl8QvmSqzpUl4vS/XITSSgOpJzDbQXQgtQLAhgSvRSTpjRLy9YJaEI15nGzxWc
	dYhU752Ru
X-Received: by 2002:a05:620a:414a:b0:92e:5fe2:fd35 with SMTP id af79cd13be357-9371e678dafmr348878885a.32.1787144030191;
        Wed, 19 Aug 2026 05:53:50 -0700 (PDT)
X-Received: by 2002:a05:620a:414a:b0:92e:5fe2:fd35 with SMTP id af79cd13be357-9371e678dafmr348872985a.32.1787144029511;
        Wed, 19 Aug 2026 05:53:49 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa0d6721sm77954795e9.11.2026.08.19.05.53.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 05:53:48 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 15:52:00 +0300
Subject: [PATCH 15/16] arm64: dts: qcom: kaanapali: Add GCC CX power domain
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260819-qcom-tie-cx-to-gcc-v1-15-840034124e73@oss.qualcomm.com>
References: <20260819-qcom-tie-cx-to-gcc-v1-0-840034124e73@oss.qualcomm.com>
In-Reply-To: <20260819-qcom-tie-cx-to-gcc-v1-0-840034124e73@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1012;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=lRo3ALU80eN8NLOuV0UOQeuSVv9zf1v4drYuyPGYgDk=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqhacuJl5k/5gtHuqN3D8RE8paN6hliA07HJq6r
 8euavzM5EWJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaoWnLgAKCRAbX0TJAJUV
 VoLaD/4nuGMbWI7OW63djbaG6+v/BmDy/5cdHu4K3Swt9y/UfsIF+OnfoK6t841HLXlvbclaiq+
 rDBnacaHNa1MHwICcGxj+13QVOSHBQVEJ7dZMATxTHEMCieN0Hl7Hj1QpwWRE364B5ByZfaGWRQ
 4brGQOi+zC7SeYZFukakIBxDBZqzmhhzRCVuQkPa70O6qVw5cH+FOvtsdfGwklhGJzPlAyKT8xt
 4K3qE8EpY0aT+QpTbq3nLM304xBf15T80ptXU4wIsa+r7bObkAhrF5Ub5yumDAZZc7VtuoFygpF
 X0WUW3mPKXWfKGq7a/eOD1os9cbyuxHgh/gRnr6AQQaqYvX+8RhgaoSKWtE+jqiW2uUKvWMgwKK
 YqBzIOiwkYdIvQ+dw9DJwtv2YywJCPQbB6zW2YYb5n4n3hUAp/1crT5gITjYiNIoyix1hj8y4uA
 HKcG/RiRjuTrIWa1pOi1r/geqLapIhjS1Sm8VdNmpMtpwYB6ry0Teb5XdVGbGKCUbTZpZusHaAc
 RTxep/GQWZYr2L9/PvsKosYnsffgfYb/+7tlOjMkPWHeclNdLevTFCnpNi9nL+HuSzy6tRneUgz
 YCqcJlrC3gx6T/JV4yLjWXMZ8NCK+MWexwEMY20bswTd/Ho7ckTSrzLnxAohDGshhuDDse3hf7a
 VrZDidkXVcilACA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEwMCBTYWx0ZWRfX6yihyCyLsCur
 cGQLPCI4bbC27sPm9yRa+tFtiBhqfARXhVo9K48l54uptDth9Gv/OVjmByqJD07+nf4ca6eHgCw
 ZGPnRGNZ+Qs9vA4UDtV2t0Se3s25Sxs5wnfLMl9/Vo+reVUyBvHJ5/NFDoyr8jqssL1pLCH7hV6
 R1/JaoEYr3KvaIHtOPbDxBTBpmOt4y3SVqJCDoSNPm1b61PEygi2f5H2LALSd7gDNR7iKO0VXKV
 3noS4SOt4cy3emlCHXh18H0dW/Tz76bYJ6Hh6+jDCPqnb594q7NB+Z9kn77hfDC4E1FzMmPy+jW
 spDZsACMDErRTSwlhB6E2aR23Px3MfYpK+F868g5nxmgkKtdl/Ox20+B/vuES5EzcLekwRElaB3
 wDItVS2U630hoh8q67yWOyQd9JcY38b6KAK3DnU6DGBHYKgVRbo6G9nDj9zSMeG1yT2dMI+6U2j
 iAaoNyFtOp6dGMmtfnw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEwMCBTYWx0ZWRfX5KJiXVIVddq2
 faWml3+RH7F5Ne8iOTj4xFUsiZ+Vl9A+zuT1Ei8ODYi8FHDHomdTPKfW28OyRaRMYOSH4xVyrjj
 hqDKi/5G9SpxjsJ3DnmvAkM5uVj8ZIE=
X-Proofpoint-GUID: iKarzktyXNRRB8vgx-BHS1qwydUJq5S6
X-Proofpoint-ORIG-GUID: iKarzktyXNRRB8vgx-BHS1qwydUJq5S6
X-Authority-Analysis: v=2.4 cv=J+SaKgnS c=1 sm=1 tr=0 ts=6a85a75f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=dUfsX-4dSnU6X-0t-lkA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190100

The GCC GDSCs on Kaanapali are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Fixes: 2eeb5767d53f ("arm64: dts: qcom: Introduce Kaanapali SoC")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 131fd2a16c54..c1528cc8b7b3 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -552,6 +552,8 @@ gcc: clock-controller@100000 {
 				 <&ufs_mem_phy 2>,
 				 <0>;
 
+			power-domains = <&rpmhpd RPMHPD_CX>;
+
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;

-- 
2.54.0

