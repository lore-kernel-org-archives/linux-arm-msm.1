Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794419126;
	b=at3TZXBJDFvc8WK1mmpAXG70195psVbLRqpD4Y0i3pcAgQyk+8JL9i+QSN/5zyc8Nu34
	 AfqJduavMbliwjvC6N331Dn3u4RkxJG2OnOS/szKpUPhDwVyXmP/+gcRUGjQscIERRKon
	 SwCT7ttDHG+sSXnJ2FYWSvrxI/p0lxM9qH/49Hj6UIuX9uYXraJwfvpdhdghmMvV42tOj
	 IMcIK9wnp6ULHpGCmgfIey41xKjdjGPIykAjPYyf7ql9AVvw0hH6GR+O+N440NxXNCoGK
	 jzSQUC5//1gZxlO2FNaLDLlJkN3W4A9a7gsnXi/avTdAVraXY0WF/1OWdUVYIEh8u4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794419126;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=1kQSwLB+fzRuDQRMKlhVRp+UlWNsgysGW3ozsYvCnqM=;
	b=uvezU5SQWbSoOEEVezSQp9ZfbWPQOzFKzf0064EMbckuuikLdUgSV/PJWag1e9+6MpZ2
	 a+XvcPL+uALLUI8o9nipyEWEWorFwKqSxFpSWeBqjoGdnPiPdCpJdud1SLnk9PE4XKXig
	 e7/hW61zkachgLbhZooo8b6RAslvlQdq7jnrt7df0Oq3JcWUbx+GMggHo2TfJppKJXnY9
	 ubSBwjQNPoRZZif/pUP3z1A1Q5PRx/GA/AvV6y/W5Ge8289HT/9NVbCA+hzS49Kh9h0T8
	 zvNm411Kk9QSweAl3T3yxjIE7La+ZBvZHko7DrHwcSK4kO/9Uo7kI2Acsti0cgDfboQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=logbUPvC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Re7fFm/R";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0B2D606B4FF
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 17:45:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0B2D606B4FF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=logbUPvC;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Re7fFm/R
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABF0P4P1565806
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 17:45:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1kQSwLB+fzRuDQRMKlhVRp+UlWNsgysGW3ozsYvCnqM=; b=logbUPvChFd9rbdV
	udC1oXKBL6+PPIybAPu3+g/27IJUfg4liT4gQbgBOmNeadk8KFz1L2YQ+aVuU56X
	EkQU0XwP66kCC3poXhJSEWUiVX04TQgCEpi9emwSJfiRmBqg6PgkftJ2RCW/gqfX
	cPP1pjc+O8tPg9zbq3nXxE4QA7mMj9/BSmIKLSdhRXIyuE6scpYSIRGmLuwMTMtC
	8K6HzI0WZvq5y9XGowYOvR+sONo3t17E6sHeFWstMsLSlC8SWVDpccBAmKf+pDsE
	jrXKpdII/JCgjxnecHyP0LOBtIz4evNTWe07BlbPBZpHU69RAUz0VgiESrL9PhqG
	xnp83A==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvs4m176p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 17:45:24 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7d2c7428eb2so671098137.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 09:45:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794419124; x=1795023924; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1kQSwLB+fzRuDQRMKlhVRp+UlWNsgysGW3ozsYvCnqM=;
        b=Re7fFm/RSsLwLxAH70zgwgiSIIlHGNgnpQ6M7zhvBy4/MXXv63nE+Hs7rx7GErbWbX
         FpEtb0lAzLedkU17gIJDfj9BvwSYCkOnM3+M3ZFViO6qwVudAevg4oF38ND+d6P7uVA4
         9VeecZMkmu85rBLa17XChLlO6iBLUGQFqsrohgKH7Ks/RZp3EO2uT7AwFvHnuzQupMC3
         1nlZkZwtmIus0Gd3lV9q+maWiF0AMlRMLt+zaW0R4nOgD2JwSjdYQGqHobUpgIbih+RW
         Y/OatHS8poW1SzWUqJoZmoh5jbsXM/2DH8nn9jJJAFuXUXqpujWcbnRbiQ86nUoIw6N2
         7e8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794419124; x=1795023924;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1kQSwLB+fzRuDQRMKlhVRp+UlWNsgysGW3ozsYvCnqM=;
        b=pNLmNXa2xxWviXsLqpP6/YEH7lIxSAvqw0OYpQUwAGlbC+nd0Ul8UbfDM0JgEiiPAn
         Vh8N4ZzLo772anV24TNnEj+xg7d3MdDnsO20tX7CN6LrVb1N9sTYA0q5JPSHyXBIBdcl
         8l2nthBoXKVFGM/qzF3wMBOr/U3fBdnlZCguCsBNitQlThBqeYavT4yYN3ZkRydnUk+n
         KxbvVmaQ0bPsBoq/8wrjn6sPoLwGdfUbhcL+c2s6CR7VMILagcFkiZ84OMUREeSpf7KI
         hGNhwOlagccSwqGRTli75Fs81JY/oPntY9A2429xVKW9K+39GClR6EEmivGFaWodho0i
         nNDw==
X-Gm-Message-State: APuU4Z/2Fwkgf0XRAsGrqJFRnIB3YNu78/SrO7MR/VK6FStEI3a9H4a5
	Bl60Jki56aCsoqS+hd45VTZVjjtrxUQOvP8ts7+fQSmpothAxPEv24VyQ/HaliN1Uu1udIe/Ti5
	ViZ4eUicJWSmiqGQYW4x4dwo0dp6Ei2BXu9dzikQi8Ow/NdVWnD40UW309GILZkO/KxBg
X-Gm-Gg: AYBFou35FNERkYDqRruOtY96GqQd4PHIXgiww+Kng85NlCAZK2x6nwn+pp29aTSsY/H
	4V/Ds1OtbOWsb+c34MlWSFEFlqVK3HCahqiHB+H5azyuZkB/kZy5XuUKXfAGOYVbv1gqLxejFXC
	UE7PMjVHMhtcqvCEh2GtiSXJonAtjHN/oFqVvnSsRjaUwkOHnwuU1jKCh1MZ1IS7qaLH0yFxx2O
	J7lP86tU8aCRzi6Q9i3wUocNIADRkPx297Z6gUWXJLIbMKMGgT6BpMgeNdRuAB/JjaDaovp49AN
	chpXUTCt+uhRUVvO/1Z1lWRvRO2TiZGqs3lWWFeIKvw3bdFvOR3ScPVX0wTtAPpMeKeF51YbhIG
	K5trw2qwEZhZzBWQ/3bFndHI2jApQ3ucBJ+xAF9b+yP+c+rowibRpw5fgdbUV90SyXZuLjA==
X-Received: by 2002:a05:6102:c8f:b0:7c1:b55d:373c with SMTP id ada2fe7eead31-7d5061b81damr1261554137.31.1794419123977;
        Wed, 11 Nov 2026 09:45:23 -0800 (PST)
X-Received: by 2002:a05:6102:c8f:b0:7c1:b55d:373c with SMTP id ada2fe7eead31-7d5061b81damr1261538137.31.1794419123452;
        Wed, 11 Nov 2026 09:45:23 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e1f5810sm4846525e9.0.2026.11.11.09.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 09:45:22 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 18:45:01 +0100
Subject: [PATCH v2 2/3] arm64: dts: qcom: msm8996-oneplus: Disable
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
Message-Id: <20261111-display-msm-of-graph-v2-2-fdf8fd97f49d@oss.qualcomm.com>
References: <20261111-display-msm-of-graph-v2-0-fdf8fd97f49d@oss.qualcomm.com>
In-Reply-To: <20261111-display-msm-of-graph-v2-0-fdf8fd97f49d@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=947;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=hbrjZvH0hhYgCazLv6ThBvBfAtKM2TTDR8/XtS3ZJS4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq9KmmauDWI+Y9xULUnh8XyMtrW28AyyFTHiIhq
 VsF2A03zUaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCavSppgAKCRDBN2bmhouD
 1503D/9w7wx6Z2qEMiyq2ZWmcqISJSvP6uzy/1iMjmZg/gLuocm/cHe5ndH0sElMmXUH9EADj7T
 6zC+YJxOyZ4wpgephNA3DdIScwUhlNl+/2R90pdzOALEs68po5n/YKR+MN1Mp5cbMUPa4CjeILJ
 ZI/t5+xdb3ASSVooTc8rVGIOaFEcgbOLZ9rHazJPU7c7a0QFdhkx7vdBkAqSsvHOZvUJJad64Al
 hlaKFkW9lxsEFcxS74HAzichA60uKBNaO8FGMHiU6nc31y4/n2wr8FwzhgOS+t8casJ+J86r8Nx
 8Mi24/e9PejVLK3a2I+JGON1Zce/TelxtjV7HX73yYkSg6nlCUacae8Hyu3u/ssm9jbyotJbvmk
 gWrbFk8/hJvUvGajoftaEbH4FUXAt5Yti/AkgwCRpK0XKtCW+4Eu2t3dXPJMlGwS3Hhf9M+g+Jb
 q/j/nAKwzWzSAkIDp/G5mBBlpe2LJYhRgiNc+DVbxGHehtxmQ0eWjR/MIXHlsstHf2lJ0I0z2+5
 mk7PbzMGz/m2o886r8o+hdFYs7d/c6WdFAF5Uffk+mjNv8umaHWWBfL/Fud5nGo1uONmvnBQS9O
 aq19e+RktF/mYWUhfZS1k9j7jWCnwImgNdlLbC1m6Q4NaBr8LCvTga3U45QCmTe2jLLXdOyr5NB
 285bfqlU6UrVmLg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: q_Cj4dLDn7-z7pqqyx58FY8ght5yO1aN
X-Authority-Analysis: v=2.4 cv=OYANnRTY c=1 sm=1 tr=0 ts=6af4a9b4 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Jz4vbV5A2nIxJx3xYRsA:9 a=4tUkUnfIpJ8A:10 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: q_Cj4dLDn7-z7pqqyx58FY8ght5yO1aN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA3MCBTYWx0ZWRfX4RDpV10by4wS
 95G8G+z0ALMLwuPDRyVR9GYMOji/iPOk4AIpg2ezXvutqxWdW5swSA/bJNW1BfJTPH/bcY3aWIu
 rP2y4rfGnS6lQN6J/2EITEcH4FR6aVEMaL2Z324imAfZTwAmBidGmAZU3pbESI4dFd6rfUdaly+
 BApifiSSDMsDV8osl9/DRVikkdTCYq6NtvxYBueHzgyY0Xim5TRcXS76aHpFXqMzqEtwnry9d8y
 Ve7ivr4Pw5iVhpjnBDh1/X0ELIhOkm4fbEB6fYMmCsJFjtR0Fn3FnbWPujD767Wu/QIVP43JZg+
 VuctjVxWclEBO7DhIOGiDEquC1V5Uio9TeQ2n8wRbE5o0dJ3IKvhrM/0EIlzftpm4MEGxSwW2MP
 CejQRyuoL00WCULFtGKLl0f9pp7/JxsjM0P85TJirJVoLrtyEpGyFigNvB6Ut4BacGLWCyHTgEX
 4tNwSaXUtqXEPxMleUA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA3MCBTYWx0ZWRfX/umxa9pO0+iT
 YQZ8itamRwwpPTDvllek+9J+Hzcwr54IHQwuCyKOJ4KP5kiZ8nps/nAs7ebhbQv1WpY+eo1kvhy
 o/kS2OEllSVjiMTZ4d9YAwgxZCQ1ZfU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110070

MDSS DSI and DSI PHY are useless, when nothing is attached (no panel
description in DTS), thus should be disabled in DTS.  Linux MSM DRM
drivers will also fail the probe.

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

