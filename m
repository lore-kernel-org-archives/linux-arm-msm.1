Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793629711;
	b=CEGAyf3t+VDX3Zqak+0oIEsyH/9Hl62GUenhZ7BADw47cuwWGW0WSNcNErQF/qNuKbkQ
	 kSBah0iBL7ztCTv2f7Er0Q81tl1uy3XutjoV+Km6HWFLZGSrUjGUcGhutzMM++IB43pnw
	 oVTo/6OyQ1S7VywaPSudiLXeh+vlsoUfvZJvFiK5UtLmgfQ5+NyW1Df0toVPSxvHaqKt7
	 x0Tx6PH4wE45LhC/3bJygOyOpz8OIye5ucuDNMqySGwnCtlhOwXuEwmtZV6nQTP3OqntB
	 1LVj70EECcaZDc0WD+vWHEedJYZvs6itbUR7JhHH03d6d/5sOTGWdC/u5TKsyw01Gpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793629711;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=sIINajvqYe7V5t/tRiFthvALg2gMWiPdTmYACRy8vkM=;
	b=zAuoRT7edo1KAiP34X2b68h628SGi7PAVBPrrUeY+4mIaiotamImygq6u1CKkMDqVbc4
	 Euwbu8MqFykwMFnEsU9dN4bbRoNdiYs8btAIXjnbeTdgH8Vv6pCjlBa8sjFu52eZ/G9db
	 SzNEpFL7th0sN4WpZ6CZacw2yfImISyxqBbJou/czpzGwjzqmJxz+j0e6UguMVHZ1Cbwc
	 TY0kjygtyC0WrmZ+9p91egJ4cAaVIQU+YMP5GiXhBu/AHztWxsaZKqgR3xSA2Ej89eYTF
	 wTfWTdXh6XZtCFLZLdzYPu9ozKNnIfVxH4Zj/KGv9Enh2VJAR7Ua9cEOnHA7otnEIwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IaJdH8oJ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NOjvf2ye;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7AFD60A3555
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 14:28:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7AFD60A3555
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IaJdH8oJ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NOjvf2ye
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2Dpnwf453261
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 14:28:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=sIINajvqYe7V5t/tRiFthv
	ALg2gMWiPdTmYACRy8vkM=; b=IaJdH8oJ20nz5orfJN3GvO+K2E3PG/dusVY5si
	+VYiM2CZtS3gmduNpE86WUpFgZHuScLvTiYf3tBHsOdWzAa+MlWVS1VAKGGrlvl2
	mURmga18RS1Nosut268iPqVotQvIcMPq4CmPizrYM913gFhSP7flGIQ4b0efv7I5
	lxVv5epn/gNRwHOEIFKrlre3MUWZWcKh95S4TpVZS8bEPJK44jyyhcEF/Mirqjvb
	/Ofpv2w/qWqglu0Klt5QzW3cFnLcNujniyH4Ac10P72hcmGcoo3iUwEhac7+GHpp
	pzBSykIsAnz5O+bAKco1Onwfw32rJjanjI2cpZNNAMUs8oJw==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpsa6rq16-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 14:28:29 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-8b0bf2140b7so49448987b3.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 06:28:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793629709; x=1794234509; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sIINajvqYe7V5t/tRiFthvALg2gMWiPdTmYACRy8vkM=;
        b=NOjvf2yebATNf18CFef9XziyGaVju9ZgNRADhBCj+YuvrE1wkuTSMzSenBywuKaCx8
         Lwzj9fJaZkrpU1gHc8eoHavV+up8bAyUXBvDChu74+mKtwJ9EyIPWe7/Vxh4WCBLTOsN
         4dTzwzAcrzfxRMpFYUxTSLvv8kyGja2cjWP1sQSYZGlckQUdoatzKMf/mE7sJlZ/ZM9l
         JdCzhXV+xZFjF3ygFHiSV+ccUSBgl7h8r2bthVUIgiZ6Al9Ae7OhsqYucklwByjmMSic
         uV/FchUqZlrfuLDeHsairP4n/VucXBxZWnV0ea6ANKtLQ9tEoBT44u1OKy3WUuxQC70z
         aaOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793629709; x=1794234509;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sIINajvqYe7V5t/tRiFthvALg2gMWiPdTmYACRy8vkM=;
        b=DhsstApJoy2PE30lCrEeDn4Tn/25Otcz8bSOqSc9+QVKFWwygwP9MZOyBrGzmNCMDD
         IbkQ7S+XiWAJC9VqUpfFu5vgR0kLvlmvuCHaEXrd1gRMSlfpmL8hYg+xZJa34uqDNmoj
         l4kzajyCQkvf+h1Pn2yRzHT6M/2fHgMUdqQLg79vpmKTG+iYTlq5yWee5CZlde82kagc
         W2RHYTyYbhm2pKSCVDKX+jZraCMC00D5QPSWJZS8OzbU/z8YU/+BqbNP3b2TBLbwUcMn
         o3PXoQjuSpDnXFzCB8LPV4Bz7my7Zj6yYRIkLgvG36tHdselfUp9PzW5Crdxy1VP962p
         1aKg==
X-Forwarded-Encrypted: i=1; AKwUvBw58JtEb4txjMlwuWK9KQk6dE5MLRe0F4MrzEXUBgoKPhH5lcXFSt56XjZxaqGO/6umcUUaLh4bUjraRScW@vger.kernel.org
X-Gm-Message-State: APuU4Z+lqDWZUJN3mO2mLPBKT8BAb6TFUngyKkp84KUSO6teyjawPsat
	DzjL3eIFgftB0FBIa+go3q3TlXiODcYPzzlAABW5IQ6KBpVG5zGmOIThMJJsvTU1GQfbKzRVL+2
	Iocc207+2D7Xo1RcT//0FszDgEXf081OCnrb1jFYmBK9pQYk72QtOQqhz47JIzEQWQ/XBEtcwUT
	w60GA=
X-Gm-Gg: AYBFou36pCX9zMCOIlyIG4QPjAi9yzondLLtDo+lExmgbd1XRZdazq8uDX3GQi8Tj+9
	u1/2rAQU+1unpD0zxsGwm3KFDioAJC2YZCWzGLO0fry8DF3DZT75x4kxhqxqWSduC17GFA+NGL9
	FWfwIe9QZQ7w6Dp1EGJWmzWKKUTlQW78f923QTHcAMxcI/Ek4QKY+nArpjrfTRFdwCeuGF96J5H
	nG3wfu7iCu0ZBdqyzBzZ3+k5VMbxvzXZpXCAah3IyvOntJh5yP9Dvi/whs5Dpl6jU05fqxfLuKp
	EQSyTBdQH8HknsnecSuZUXd/QQ9jNg/NqVDBYPxzklwabhLq4Vs9SezfGmDHLJvxPDSVxw3qtkO
	MDWShYkdx1DebNH03dW2e0+6A2vSeigYZi0dhivJ+vqBTSTVemRoqARhnyFsv7Cn72Q+yUIy2
X-Received: by 2002:a05:690e:11c9:b0:677:c78b:f5c1 with SMTP id 956f58d0204a3-67ba4c80ea3mr8660235d50.4.1793629708857;
        Mon, 02 Nov 2026 06:28:28 -0800 (PST)
X-Received: by 2002:a05:690e:11c9:b0:677:c78b:f5c1 with SMTP id 956f58d0204a3-67ba4c80ea3mr8660209d50.4.1793629708148;
        Mon, 02 Nov 2026 06:28:28 -0800 (PST)
Received: from t14s.fritz.box ([2a0d:3344:53ef:7b00:ab30:5358:f91e:42cf])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67baf27263csm5188775d50.4.2026.11.02.06.28.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 06:28:27 -0800 (PST)
From: =?UTF-8?q?Lukas=20M=C3=A4rdian?= <lukas.maerdian@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org
Cc: abelvesa@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, srinivas.kandagatla@oss.qualcomm.com,
        akhilpo@oss.qualcomm.com, jie.zhang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        =?UTF-8?q?Lukas=20M=C3=A4rdian?= <lukas.maerdian@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: qcom: mahua-t14s: Enable GPU and GMU
Date: Mon,  2 Nov 2026 15:28:12 +0100
Message-ID: <20261102142812.1353199-1-lukas.maerdian@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1NyBTYWx0ZWRfX7COEJ5oyUdlM
 Wg4w2i9UXfsxn86I5T0upt/D8p15oQy/MaprKll91AzCWrjxtZH4E87XZoS1QVoGQj/2bdJk8Uy
 IM49Cns75aplRfpgTaBecWOSyu0HvKvEZubvg6MYhndjWA5U/Hq+iJWFojit97Ozsth/sWf4Dn2
 J294qubektxeempExtyRWO/L9KEL8lJ+S8Y2Q6arXMHjklxGadrrIzmk10Rmn9/x+4k37UtryEF
 HFtYU/Y+Jabe14tRsvkHbe0gnJRTVmQv32JlR+R9iBZZtoBqNFdgrxGHXy/oSJ9e120U/3iZP+6
 /9klPNoVO9394Xfs9BlUQjAd/80tqL+wS+vbYcmEptS6ftl8WtJb1y6D9jgfjvtq0n9svIBLT27
 2fQKwmAyrcnX6hoj4Ht0SKjP46RVaUmkIF/GLv//3elisWtn/CpokdSSar7Shz00KnNJLqFQ98p
 8YpJugqSYcHPTFbLZ7w==
X-Proofpoint-GUID: cYVCJNLEiWNhuuN_6Qapdx4lJ7kLbjS2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1NyBTYWx0ZWRfXyWNsWYAk4IW9
 lGjPPTNEUcBitw/IGxoM45jiOqn8OHx744YdUGlT9GGXb6EJBG5e7Wqb4anjpJxnZjKXQwm1CCV
 N1fBUsyeCFoGev+2WZw1khyU9331N84=
X-Proofpoint-ORIG-GUID: cYVCJNLEiWNhuuN_6Qapdx4lJ7kLbjS2
X-Authority-Analysis: v=2.4 cv=I9fw19gg c=1 sm=1 tr=0 ts=6ae89e0d cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=DMYfw5cCtgNNA2bR9BoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020057

The GPU and GMU were disabled when the ThinkPad T14s Gen 7 device tree
was introduced, as the Adreno X2-85 found in the Mahua SoC was not
supported yet. Until then, mahua.dtsi inherited the GPU and GMU nodes
from glymur.dtsi unchanged, describing them as Glymur's larger Adreno
X2-90, which is not what the Mahua hardware is.

Mahua's own GPU is now described: mahua.dtsi overrides the compatibles
with "qcom,adreno-44060000" and "qcom,adreno-gmu-x285.0", and the msm
driver carries a matching Adreno X2-85 entry. With that, the nodes
work as-is on this laptop, so drop the board-level overrides and let
them inherit the default enabled status.

Tested on a ThinkPad T14s Gen 7 (LCD): the GPU and GMU bind, the
gen80100 SQE/AQE/GMU firmware loads (GMU firmware v5.2.38), and Mesa
26.3.0-rc2 reports "Adreno (TM) X2-85" for both OpenGL 4.6 (freedreno)
and Vulkan (turnip).

Assisted-by: LLM
Signed-off-by: Lukas Märdian <lukas.maerdian@oss.qualcomm.com>
---
This depends on the Mahua GPU support series, specifically
"drm/msm/a8xx: Add Mahua GPU support" and "arm64: dts: qcom: mahua:
Support GPU and GMU", which are not merged yet:
https://lore.kernel.org/all/20260925-mahua-gpu-v1-0-0fa0bfd8d315@oss.qualcomm.com/

 .../dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts     | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
index 255857cda9b..189dc3fe542 100644
--- a/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
+++ b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
@@ -693,15 +693,6 @@ vreg_l4h_e0_1p2: ldo4 {
 	};
 };
 
-/* GPU/GMU not fully functional yet on this platform. */
-&gmu {
-	status = "disabled";
-};
-
-&gpu {
-	status = "disabled";
-};
-
 &i2c0 {
 	clock-frequency = <400000>;
 
-- 
2.53.0

