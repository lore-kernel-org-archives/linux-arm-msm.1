Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794655969;
	b=n81bidMeRF0txro/zxsFxGhz6BMSK/CagbJoi9BXPBFYt4gV/9Et5jw3WWzLStOTJBqo
	 wlg/7PY1dLRwqfI9OrP2GcBrcdq45QUilE4cNav2Qvnxh/oH8QDqkiVdFK2pzwfTs3aJ5
	 vV/5gaSd96KIBPgDNX9dH1jKFKsNNflWvZUVz6h85i6uqJ4gc2JcuyEJFgUWn3XYuBusN
	 OrjfIMFibGSkLh9sivarbyc4Su3X2zst/rXTCskFfINj5Ye2UpM0xyoL+ATVUVNfraRWT
	 5b4c+79tPm4xlNqSKmMLxW/I9hdQPqCiKk1/W8xASl0bNZm3Pd6cskjcY1PU1xNGnkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794655969;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=v1U7sBZaKqbNbwJInAu56We/z6Ce1sNVBbGtf7uj2O0=;
	b=werKd7001M6ddjh2uIUIASNlYXHPdS5aBCbMoGw20HptSzFSv9hTpdWX1d79t/yKRwh3
	 F0KGClpQuLdSrEO8fuPCGhGJxuE0jPswJzzPtQYfgLdERt2i3RfpTrze9abLpeeseCEyD
	 fHPUdMhj8qMISkBjWziKPKlqJBY9pDVEd1ChWIr5uN54gQez480CMAt90UiDh55/LOwwN
	 osXc0jMZrqa24pZDRpRY07JLoW078DKocaZ4AjT25L3YqHNPBN2f/p5U9p8I5xDfpEB1g
	 0RrJq5rhdUaYEev59bNd5Ga07UY0RVQHK3RNCfjz6suQEd9I0UJ8et8Aeb8D3UHVSNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N6DCdMVu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aMXNe5KA;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E1CB606A332
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 11:32:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E1CB606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N6DCdMVu;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aMXNe5KA
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE9wCpI3379129
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 11:32:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v1U7sBZaKqbNbwJInAu56We/z6Ce1sNVBbGtf7uj2O0=; b=N6DCdMVuKhJqR+KQ
	hRhkHqPOgGzkEe592gkZnkrri0I1fAkmDRhdfsCsydRfefDHUq2zFvcYXqpnBNHT
	QbOUgukGZJYfM/eRcQ7G3Ny2DPnLcGsLsq6H9otfsmAq6+/b1jdgu9cUOh659CP8
	MViEJDsKlve7mPmtw2+Q45ydS6XVvv8klrYJTNP4aeZ07zGq8S6lyQVGw08LMSJA
	Zn1AKZSCjZqiLAXm3BU6wtiHd3jGKYNzK206gZpCdCiknYp2xrkM98o4e8y1tM4c
	aibWVe0QkhWfhveqWvKiiyIaEGScl11CTmhhpoyui82buFOYyjSQkt5nIdT2KTK8
	5zSKjw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhnx0n9d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 11:32:47 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91ea39a2f8eso42524906d6.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 03:32:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794655967; x=1795260767; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v1U7sBZaKqbNbwJInAu56We/z6Ce1sNVBbGtf7uj2O0=;
        b=aMXNe5KAL0DQR07u8eBk6KXUBP7NGQUOPkLMCG6uSH1pWiirUHKdGejIC1jL/8QhhJ
         uDY+E4h4CQB11usKW3eA8jbESbwVpzNoe+y+PQ/N8eSA4GPtvpLOfvYuiI47ENIbd0st
         /RZhx0TrQiBCzsze2ypzyqCBKOxCs6+UKPm1swGBV1LvRf4asVvMxwubbAYiL49k9V9y
         SJXPd7mM9Yv+wWCf1o8SkNLKRUbNzYh0wOA0chK4Zvs2Qk0tB9La8fuRIPqot5I67LLF
         WIMJdeP6hLUNEjbVCpDMufon4QfGvuYrTm1i/uG03J8aWkjiMkySlyRvZLsgGwpy4rEk
         0Euw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794655967; x=1795260767;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v1U7sBZaKqbNbwJInAu56We/z6Ce1sNVBbGtf7uj2O0=;
        b=mNQhUOG2YPWz4qIDVe4DqNy1jfQ2zaQpwFewXA3d6pToxiA7P1sIm7xP52/rWMyTsC
         ge/tyAJlcUmiu8l7zW+brwWFHFJoj0i+Qk512Q9SA3kEhu31tvTuxnz7DtxRY477Zu5b
         +77mRyUH0wXgp4QSbDv0rQbpeAKhIxImeHdpNkrJiDjYX71MYgJ2aVdQrvDhGlWbL8N1
         WMmVpNTz9vAvhLgEQMWN2/+tAATdRJ4flzOoe2hjARXHej1pLBaey4FZXv20ALZ1KpNz
         +VDjB8ZwaumJA+PHwiccMTT8IeGWzlmFsVDOb6CUYa2xavWn8u0+o+xWKTVIRQgXnSVw
         hFCA==
X-Forwarded-Encrypted: i=1; AL+hErEhmaRnnAt2u43Lt2L7BHKRldfs5fxPbfL4UIIbji+D0ed75PIHrBzWy00zt5oHe1Qqj+jsJ9Hkhyb0XuhH@vger.kernel.org
X-Gm-Message-State: APuU4Z+XvEiLPmBbQZmEA9TCEXgONF60LPIXQy+DbGGR9gK3v/o3abAv
	tFad0h7hUjgud3G7iNI05fC2TiZMl27PuhTSI5DTb9GAHKm6bXjbzW3y+JWntwMVtwtX1qZ+4Y9
	9gisYJ1k706iZLG0icIPOC39h+jSdAA+2Cfur2mZM4qmCisTZYcIjYZRg4jFLQZCn4sR6
X-Gm-Gg: AYBFou3NdTjpiPJf9OG0oCC7YqE3yQp0fh4/K4LRIkvBg5wN6xoTPuod4vQBf1P6QWU
	Yp8wMuvOrCbEyL2NazqkRuah3lsijZD0SQhN5MiyzvjgjxB3sfSAMgx1Jp5Q2pvY8YYrDku5o41
	oIIMKKKDvWtUqqBdRp1WCJqnZooGyymB6/Wp7Ag/J/aHmS7wGJYSX1N7wziMWNMai4k8rIjco42
	kZ2hM/Ey9XYLrFTIQb50F6j0qyVPJ4FmaWzGokB+wjpvbDhGAqmkcvbWhbT2UzUBwC6ZuCPSegD
	tl1bWZVIS1Z1sG0lSyi8uBp0Xx/OLydhXy2o9YWOHzhWJyAY6yyLnmOgyVDfnEVpnHyxpRe9bzQ
	kbqR8a5dBiHlSVDVJ5Wl6v5nHUoV4/ROkdYi2D2fLEccEahnHlp0AG4+Oi9x9VlFYcePC804y6j
	RohGDFxHY8WmT/rk56mYCGnv7fCQ==
X-Received: by 2002:a05:6214:1301:b0:91f:136b:d44a with SMTP id 6a1803df08f44-91f24166bf4mr85261296d6.33.1794655966639;
        Sat, 14 Nov 2026 03:32:46 -0800 (PST)
X-Received: by 2002:a05:6214:1301:b0:91f:136b:d44a with SMTP id 6a1803df08f44-91f24166bf4mr85260946d6.33.1794655966199;
        Sat, 14 Nov 2026 03:32:46 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d7ba48sm41389746d6.28.2026.11.14.03.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 03:32:45 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 19:29:37 +0800
Subject: [PATCH v7 20/23] arm64: dts: qcom: eliza: Add camera MCLK pinctrl
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
Message-Id: <20261114-add-support-for-camss-on-sm8750-v7-20-8ff2a11835f6@oss.qualcomm.com>
References: <20261114-add-support-for-camss-on-sm8750-v7-0-8ff2a11835f6@oss.qualcomm.com>
In-Reply-To: <20261114-add-support-for-camss-on-sm8750-v7-0-8ff2a11835f6@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Frank Li <Frank.Li@nxp.com>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794655774; l=1457;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=rB8pkz2FCaAP+r/pTb8lDqYixAV3o/wVSCv9gP1ibjc=;
 b=bO4rJz1QmC84EY6U3r1bkmZ4PXhLhKxM0HlCwJLVHdnT6+kWWrVPCxX06MNssdNUzjoYI8idQ
 feMeZ8f/G3FDr2iRw3wvf0PMTlcgmsQHkIIzvI8R7g2ylrMX85Hh2zA
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA0NSBTYWx0ZWRfX3y7ztoKw8aeS
 exQDgevkYJSnJxq+eNtZYNJBs/y7SawpAFqPrUN63AGUorm7QT9LpF9RVpbioz72sRsLAtVkSBU
 oew3KwfuFxn2VC+P/HeXDMLbCO6/AST1ZkUApPZ8bODFlYcMGtOM+ddw6y4DRxt5nliz0ymh8xa
 b4VfGRodcccn4lowYeeYQqSYfz4N9GGPqDFTLqWGRcRzWBGpE3PZFBbUW2ktb+4cKjQ0JrLdMdA
 Slxo+is1JGE6NrRiPXtC2p6rfzfNQbRClhQC+58n4o/QctAm5rPKo/dP2qM997LjXUWvBm3Qttp
 MGY0tpgsA/rMK+VAEbCU9yVdg457bEgaY7u8Kurrs6uYLbJzj1dmNgUlB0v94tqCqB8221I1OXP
 fC9+esnPoO0FCGszog6sFedwTP7CG821w9mVorDjlNhyD/L9IzJp7Yq97H0MltoMj3MVepyBN9X
 KhI5VrW3czDl/1vPINQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA0NSBTYWx0ZWRfXz+MxFiMauxBr
 MhUheWsdZPLY7Bu2h7DwAvnJaxh5X4rU0wIeDc9GW9+UZwzQIUqeTPhV8F1NlUBPmdPWxe1tcW0
 gQou+R8CZULS/cL4fDMC2uosRLIxLms=
X-Proofpoint-ORIG-GUID: O3hLf5eb6orwYIKvZSJ0VEQOpf_fM2l8
X-Proofpoint-GUID: O3hLf5eb6orwYIKvZSJ0VEQOpf_fM2l8
X-Authority-Analysis: v=2.4 cv=Jr5kP84C c=1 sm=1 tr=0 ts=6af846df cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=wPaziBaVlFKsotjdNj0A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140045

Add TLMM pinctrl states for the camera master clocks MCLK0 to MCLK3 on
Eliza so camera sensor nodes can select the MCLK pin functions when
enabled.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index 0b759bf5b91e412743c12982b79ab4506b9a50b9..f22a8b031e7c56e4ae7311c34ee6ca48359ce8fe 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -4013,6 +4013,34 @@ tlmm: pinctrl@f100000 {
 			gpio-ranges = <&tlmm 0 0 186>;
 			wakeup-parent = <&pdc>;
 
+			cam_mclk0_default: cam-mclk0-default-state {
+				pins = "gpio65";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk1_default: cam-mclk1-default-state {
+				pins = "gpio66";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk2_default: cam-mclk2-default-state {
+				pins = "gpio67";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk3_default: cam-mclk3-default-state {
+				pins = "gpio68";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			cci0_0_default: cci0-0-default-state {
 				sda-pins {
 					pins = "gpio70";

-- 
2.34.1

