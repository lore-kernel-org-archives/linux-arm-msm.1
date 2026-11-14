Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794678901;
	b=Ltjgba/pgWIAJCGHl/vuwbv+iwORKyaqy+2lazY1w4ISZIFgYmgvUvvZrfwzOIEz2Tzl
	 CRdKR3hzJsBY7YG6paLR67wp8ta5E1fTat1ylTSKBCK8o+rd6owGWEtcOQmKo8RH8o0Uw
	 DQLCdtMTmIw3fhhFLBqkuPdaIrvm7ME69VA2HWe/N9VMz5xoG8T2iEndB+VYqbxMXjzol
	 +noxz/SM+PLwsDMXyNPnkCq5/+5rt8jrr0u72seV71BO0eniNHiQu/jGdMKCts+wd17Pb
	 KHRGYiZD23l9BQbAm1BRkbHsem7m1nU+Xo/dy20Hy6n79N/UNRGjp/fskL+HorpNYoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794678901;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=SWPuKJ/V2DaQHllZzOMnN6QFel9q0m/5M9pFHMBY898=;
	b=HWOfschGGTYoeoUZF2yy3Z88f9MIOq5CJ1sT2O0LNztIvYEDTKEWX8QewU/73uwy6cs9
	 FR5xk2trDRBlANjavVPKJBr8PqHW9Iphrb+vquXDlCI9DSSK+UsXHGJGwZ3b5ndA1dCON
	 b0Zrrg+WuH9exUG/Ou8imFNAXTcb893HP0u8cjBy3GJk6oov6Ejl4NaTGdakvnrqhoRK6
	 WrpV+UaXL2OawwqygL47LFn0S91bh0K6vP+GJbPMWZi4ubXgFH3FUaKhW2qoJLcvNd69s
	 lOMUCkI4zNlafSLSbpbEBE9qO8Z/0gQfPX8GcVbMfI0qPKn4JE+jU+8kw4btlA6Hn2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m9BOlHNI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ESLBgVka;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AFDD606A8AD
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 17:55:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AFDD606A8AD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m9BOlHNI;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ESLBgVka
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AEHpQ33426721
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 17:54:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SWPuKJ/V2DaQHllZzOMnN6QFel9q0m/5M9pFHMBY898=; b=m9BOlHNIqLAo1BZK
	6OuVEt8QYlY6rUtJOAJ8jJaNRaffF37q004zZkVKHyEKHQKfYkod1Ozvsx6G1Prb
	g1+6ZGHsR4YcpyeotoK2oGK3AtuZKUz9nZR4/AFivYrRkLuk7yL5755gX6J6vMdg
	8zYFDChPoAk5jBKCbHrQxL40nFm6K/MLGZ+BlzeE9+d5xRm9+ybUVTf7p1dmwkGC
	FhxdFxiDtHu6tcrhTTX9sLEAOZHrTSv1WoOiyHFPuPe3M3Pr3EfPCGdggLdiE6vN
	xUp3k0pRZ0oWB/LZegj39KbOgcdteIlVX6JKIor/R025kuByI4McSI+GfhY07gqy
	Cx7ZQw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhhjsewf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 17:54:59 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f5844cb60so419569585a.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 09:54:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794678899; x=1795283699; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SWPuKJ/V2DaQHllZzOMnN6QFel9q0m/5M9pFHMBY898=;
        b=ESLBgVkaRBGAzGxByioeXJ2ie99bqLotTvvTnfBBAEE8ZKZk8rMIZZqP0py8qnTZe7
         rPPYtFeFpDTmb35WQEFDTLz68o+uw/FU80mg+T/n9MnbfULkthKf9IcohbIZpQQpYA5E
         /CFGbu9BOripM3p87AcCG2SHcv99zhKSHCYrAglgdNFoZo8uBmXlD9R/n//vTijisdhB
         pxbIUMaSeYENQyojt+4+4BYvC9rLhTPnsYJi0iZ925VSFdpewosRmed6bsed7L6cL0Ml
         HvIRoUhn3Hx2ucHuZmOA/CJfwaTdsD/+fjaoKw+s5r7eQpwnTPBz/XEXJPgYw2AmSUIk
         MqeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794678899; x=1795283699;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SWPuKJ/V2DaQHllZzOMnN6QFel9q0m/5M9pFHMBY898=;
        b=HKNqbtmWaHPArDFSMoT3aR0j4X5iGkws5BHJqJlm0jvO6MyIEFiMS2dg8c4Z2zohl+
         GOIYNiyWxTROG4OpIcCsWqkkkOMcDSs3aX2fUZLpmoVFDA0XHKPaA3oP4ek0jjr8/hOu
         nG6Q6+xZWWhXi9lae0bT4NeFSUndiVcA9uG65xPk5/i37uk7LKRaQPV87HsNcYYlyFu9
         D9B8EOe7/0zhc4JbM4QXWgBNiEpJW0Cp9sQVX6FWqvpnHqVWpY7KV5R3YE/fFp7P1O7Q
         ItBSKn9DimL7vGj/HeYUSMLZesL5pGzSkRFE2EAe7iyTFmzT9rRZ4pd7lqTQ6lzoEA+D
         4X1Q==
X-Gm-Message-State: APuU4Z9d0jOtHidiDE7MlKJW2bJeYMiWL1z9tgLPYb6lFLVtpJN0p3V+
	vpwvp84Wq9TBgWI9Otk3Iks53qz7+rKNoylV/z5bku30K0XqHlF1cR+djFQb+csyNdruBeuG3Pv
	t1Z+KORB0OKqt+jhRObJPWl7UZi1ja0Q8d16W7EK4oGw5Yo3jkV7F95bbT8qGtUYQ8+2R
X-Gm-Gg: AYBFou1rId4YllcXKc/3W8kSjYaJFNnLv3bkvbGg9o6wrPjl5I4RRC4fpi/E2TFlIB7
	GmbL9a0bkO94/lx3ym+Jg63B9iDoz0J7MMoX04ldvVF9NaqYcEvC3ZwU2I9c3eRENOWrEi4DiY5
	TxaYmpG+YK3HJOCJ1Z6i2XIkkuWRHnyh3rUrvnp/3SjlWPRBkLX+UFVbsdJ1l8PHYwJWjlacdGU
	I/4lzVp2hOZBjsfynrwqT8ZHXF7lzBgEwoctFFvj7Em6raoiU+5URP4Y6bnZ6nrez1bm+0OcIpP
	G1Xg5aXNssQzS63W4F7ZZfXppwgVowRqTTBPd72i+d7N7G+vwpNvxCkhJHzOKpyB/oFOXzUKF/i
	xHfE0iuB6C2eAcYMBWgbYGUgnuOmjYPjIKXPMjzJOngfYQLsBOmhTH/mGRb7cWBfePh0TNQ==
X-Received: by 2002:a05:620a:1727:b0:949:6e10:b8dc with SMTP id af79cd13be357-9496e10bae6mr196351685a.13.1794678898575;
        Sat, 14 Nov 2026 09:54:58 -0800 (PST)
X-Received: by 2002:a05:620a:1727:b0:949:6e10:b8dc with SMTP id af79cd13be357-9496e10bae6mr196347485a.13.1794678898148;
        Sat, 14 Nov 2026 09:54:58 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c888b90d4sm11060292f8f.9.2026.11.14.09.54.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 09:54:57 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 18:54:38 +0100
Subject: [PATCH v4 3/4] arm64: dts: qcom: msm8996pro-scorpio: Disable
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
Message-Id: <20261114-display-msm-of-graph-v4-3-b8de044c6c1b@oss.qualcomm.com>
References: <20261114-display-msm-of-graph-v4-0-b8de044c6c1b@oss.qualcomm.com>
In-Reply-To: <20261114-display-msm-of-graph-v4-0-b8de044c6c1b@oss.qualcomm.com>
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1022;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=VAmAuSw5Qrz1Gz52ayox0A7+zqwBb2WXC/d4EpaIHcI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq+KBj/U1se/9pEQcrSLEYidME6fGqzdtTKxEP5
 iEtUNZ/oN2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCavigYwAKCRDBN2bmhouD
 1zcaEACaJZx/cwNuCU2I2yLeRQN/WGPPfc4u8o0xMi6NoozUyadyvLWur+AT63rJg7Xw8u8cuui
 AoYR0BBQFOdWpcr1x2hX0ac8pV7dUwYmXY47jM8jAOsLSoSvN5UGfgVOqOteZYasSVljSl08Ybj
 0yIsNi8N8ymmL7UcLsTMhtXl6huA6FilsIK4R3BLnmjLRl/0ZmfIHoMvvuITVpNDYeMXoQt/3BM
 oOmF2X6JpFlvl1uKgwcDTgFoXWvsjheno1mUfGfA6qsaNpjvE1DffppmOOrTvq3eqhmI9Kzs0G8
 eQ74Jx/iF71PNPFclYYe+HZIZgOTHOYV0ChKNMrxITNKIYFXX7kJt2QzZsSD9AqhTPd3wOF7YRE
 THGN4sIQd+2FuY2dmljTugwUit2WwLrkNhkjfpXdh3I81TZ8FNCbWGbBhv/I3+cXoE4/iA076ie
 1snmX0yGZhbs0w5zSR80fUMPHpXJE6kkNoV+31jzps/06/7os/JDVbDMKrLn8+WaUeweqRtF8uV
 Dz2CALqkARo4wW0tbU49Tgw4AfxNstsO3kE/o/8bkI/sqK6VmPcPs+KLF9siaI0z2cAGtBInhJ7
 vWmSEOp4jngAmQUo6IFVKcZqwt2zJhwu3kHTlz2MdoP13I+fpv4JbGcUKDCqCfmvIpwDI5bgt2i
 69WvE6DuXNryRow==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA3MSBTYWx0ZWRfXxXx/q6GZrQZ5
 hgFN/J1/uzebdKokpw27oBn9iW9ekN47gKhuNnaoBhScj8q9+wQU2qKfP2oHrDoog3ORMQYOaoY
 1HZyXoLtAa0i6bprH8y3UrgsuiwEehkMk0dVqwycFWbGNvDWkO41b4bcfcws77CFWyRgYR1aSXr
 0wvnQ9uNnOGlI+D6yihvXtBK6+a9g+EOpjiiMiGvII3fX/8/5pG/qOrlkCPIwFRNPLHsgFfOOqR
 ViqRXn5jLMyCkexsTVTy8hMv0mi8gIaJ2vvCPiqBZSK01P1CgMl8zeaW3674kBvaL2y6lerx63g
 Y+4QAcn3RFymwztOSbDu/0fSHfGM1QOm41KEY21snvTQEHbvBUEKppZnRpV/IRYcOlxryocdYij
 OMkM+hOdFdX3rzyFQVT6/fyFLvc/UbF+rfVinqjkFT8LeLj9Yml2f4qJ1aXRwoBxHNiRnzqfCXN
 4ABjN7Z4I1Z57QJv5BQ==
X-Proofpoint-ORIG-GUID: 2viFENhw7Y13XUH0a7kRBtnzYHegG8Is
X-Proofpoint-GUID: 2viFENhw7Y13XUH0a7kRBtnzYHegG8Is
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA3MSBTYWx0ZWRfX2GhxIkyM5Abr
 QRbd7ufzdMrFi28TdngtjW0wqLkvitBXuZW0K3FcudjL6/VhUjloelL11zj6JR99VdaxFDbj/is
 M1LN06ym/e2I4MpGmrww2SaW8WJtJVs=
X-Authority-Analysis: v=2.4 cv=X9rHu2Te c=1 sm=1 tr=0 ts=6af8a073 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=F6vqezskldl5T9wOwfQA:9 a=4tUkUnfIpJ8A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140071

MDSS DSI and DSI PHY are useless, when nothing is attached (no panel
description in DTS) and MDSS being disabled as well, thus should be
disabled in DTS: no bridge will be registered and no component device
will be bound.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v4:
1. New patch
---
 arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dts b/arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dts
index 1cc33c3123a4..85c542328d96 100644
--- a/arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dts
+++ b/arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dts
@@ -111,6 +111,14 @@ &mdss {
 	status = "disabled";
 };
 
+&mdss_dsi0 {
+	status = "disabled";
+};
+
+&mdss_dsi0_phy {
+	status = "disabled";
+};
+
 &mss_pil {
 	firmware-name = "qcom/msm8996/scorpio/mba.mbn",
 			"qcom/msm8996/scorpio/modem.mbn";

-- 
2.53.0

