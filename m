Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF75383C92
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Sep 2026 06:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788848649; cv=none; b=EohyLuHC7o1O4YmC2AqD/GtkjQ0mMas6ZEFoC3jJPDuQaCVFZasSsi5CaIcKuteVy6uP7iW8hrGx16DnXS54aDCh5Yq3XoMLakG/mElhMNqhhsz3nWGlhysOBumZgWiT1OVM4LSLzn9iL2P6FYsdk3znOD6im5JiEcCX0hb4O2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788848649; c=relaxed/simple;
	bh=/GuuipV5ZjIiafj0VbQ5D4TqDt1Bb+9GgJneHFtZyeY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W58fYN937rgw4aSfTveUNd0uejGB9D5F2eVgzgN4pkIM9n842R8NefbAYrfzTgeWiLT/TLf6ei2CGy21WKxM/pALqE7l7q7ocErrU1lAMTzUxrMVc57ky4C3DaT+oqeikQ91npSPo3oDxb60fomd8zZPnsh77aLd7bbuPM+jHG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UrxW20v1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R+H7+Gme; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UrxW20v1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R+H7+Gme"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886Lj8Z2172616
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Sep 2026 06:24:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	92WfmraFgzjIJBF4u5643LYqw/A6RaaeXEKXfqpkMVE=; b=UrxW20v1T93CuZbG
	tXOZX3uiZN08UGyRutI9aaQQsG9VdTvT5VoE7XZf0UqS3WUucB0k/LYOGxr94wEp
	1ORaIytr+IVQpXaZNVvjS6bey6aunQSFT9o49U7mlqtPRXjKFceAlI5RvxHyj8D8
	rJVBjetvGYuslDasBx9Z5+VoqV1Nqh6JVcxYwV7zTGmCIKZSCe9+ZjOqqnB5d0O2
	4fLgHjqem+Weu/htvK7xkNL8w1h4L/hT7QxXvR9nRJ+ZatqMEGhXhjG+X7jfhxG+
	4AxVHHGJjQ3OJVV96KOiNQjKTFo8B9cAqzVynTd1lNnMoK7n5NCY6popsrafoZSX
	9yY3cw==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gj1rrhyq7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 06:24:07 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7f4e52682f0so6149066a34.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 23:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788848647; x=1789453447; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=92WfmraFgzjIJBF4u5643LYqw/A6RaaeXEKXfqpkMVE=;
        b=R+H7+GmeImU9MF4POq2llYoYxqyoUX/mxq8o19509QlVLwHfcEcyiEKIKKObc21XCe
         Fi+2PUQcGU/FQBYrR+tJAnFcMNhRrIN5m0EQq6YdhPtQSaNd4kqK+GCR3FGYW68UmnSg
         GfHpFAMESmDjonbBWKZb7C/u/WolPsLXnbzbX2eBHfGZlWYmxShzJaMvRGYR8mHctZf6
         m0fxU+szPNHTW7XV6Zq9XRizrDPL5W08Fu7KLP9neRM7P2OpKmFbaRBbplqzgTdZHXoV
         fU5zHfmH+f1fKj0aiWSbnazAbV5pXYhf8V6r2OzKslO0x4VjGIz7YFgsfYg8utw8O1H6
         P4Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788848647; x=1789453447;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=92WfmraFgzjIJBF4u5643LYqw/A6RaaeXEKXfqpkMVE=;
        b=YCAeFliX3n9PDIqR17J9NrhLz5KMGlpQTzkUH0ycMUATJwYTvZRDP5uRz5PYLnU/OY
         zP+OiAWtRLPyhdTI/f86usES/JT/uqPOpG+eaOpHy8RjYJlUwQwQ7lmp63KgkpzNHuxL
         tM8fBfANy3554JQcnkB1PoisnbZyfhXCc70+PQ89gsM9SzoTCb4ZJU5HkP52ZCamoc/g
         uY0wQkLRNWQ97NhJKeZxjor+1JDHAkHnRwI6yWiXud7YlEiY6sEGzQ3+MON+wGzqULKr
         Dsi0bgTUXcxBG4L34kEd1l5rF7Na7RDkoRNtfVatvgS0SGXePsgaSx3CjMmJlbhgBzHP
         lN9Q==
X-Forwarded-Encrypted: i=1; AKwUvBwXyg5NsRkYKF9TwZFRY+7OUmZPWoetEMhWWm5e8XZt6/fA3OZm9tK2QLYG7O3HyHuVNEoGPaHEv5O8UtWZ@vger.kernel.org
X-Gm-Message-State: AFuF++m2+Cbc6c3Ceh9DgESHPu+eXavQzYcYwoJWqexuXUP51guHIgJe
	RSCXmB+8G3btEGMnv9SScL6skUgElY0JUmQyR6dghCKRYQkG7f4GPPIKp37l7tkxVV+8qt6ct7b
	lfTSYi77+7HOxYTSC8woLujo2QJVSvMGEfLXs4kgb8f9i+bKGDZksjyFUoq5B4CFsdf1O
X-Gm-Gg: AYBFou2+mtHhdKvb89ttggZR/GJtJS8kxM1WIcuEokEc1UuvoNcqupjNcRKzR5i9d69
	Eh+mjsIXeGEV/yFDKHaEUbgbXm+l+6H+40uo3WcaNl8nTj6mFglyByJ2OMpaCpmY0IqJKEEebBr
	J8C+OPL/7lxF+aPlMGEeRjHUSQO/cqwcoDolGYIO2hnpU5pJu64F0QLJVyjHJuwaQCS5re8GhU8
	j0SpfiUTgdB/vunwER4wahIHOyiybUZJw2To178g4gSOCDSLzYVjGEmUSY4l2+pkQEer7QKDF6B
	FCiY1liOGFTHgca8Olx1cmrSw9gLicIMNoSA6LBlDh5qiJFkxdkSTvmjDVyjtvKkBfu8ne+pcV/
	DkuDEuneBlaqYy2U8sK+05cXR0zBkXQ==
X-Received: by 2002:a05:6820:f004:b0:6b0:5233:f69a with SMTP id 006d021491bc7-6b6fdbca26emr16108782eaf.30.1788848646868;
        Mon, 07 Sep 2026 23:24:06 -0700 (PDT)
X-Received: by 2002:a05:6820:f004:b0:6b0:5233:f69a with SMTP id 006d021491bc7-6b6fdbca26emr16108729eaf.30.1788848645547;
        Mon, 07 Sep 2026 23:24:05 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14332405e92sm26266297c88.8.2026.09.07.23.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 23:24:05 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Tue, 08 Sep 2026 11:53:33 +0530
Subject: [PATCH PRELIMINARY 4/5] arm64: dts: qcom: shikra-cqs-evk: enable
 the first Ethernet port
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-shikra_ethernet_dts-v1-4-69c0c5c7c124@oss.qualcomm.com>
References: <20260908-shikra_ethernet_dts-v1-0-69c0c5c7c124@oss.qualcomm.com>
In-Reply-To: <20260908-shikra_ethernet_dts-v1-0-69c0c5c7c124@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Anurag Pateriya <apateriy@qti.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788848616; l=1888;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=/GuuipV5ZjIiafj0VbQ5D4TqDt1Bb+9GgJneHFtZyeY=;
 b=NrHQqFlLLixabJfOk4HMei4evExRyJitvdtHpEl0Q1CLXvpmd4Qhf7hQym6cIY5TP1h8j5ICy
 yWPt1Zz2HXbDzuFM5VOMsoNGmnWDPBs45tgD0S+tCVZsyXgeJakM5AT
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA2OCBTYWx0ZWRfX63zgQzjc6v38
 zRNHdwtKpnH+9R7Fs+PoQHcLMVipUKDeGKT9ZqBp/YNb7iwiYMLtsI9YnRdDu/ZrbEWA87+Jh/J
 36wvz6HZCVSL+UqD/QF5Ey+scx12iwk=
X-Proofpoint-GUID: vdbn6RfNQ0l-6WdAZ4TpUdDBQmK2EJnL
X-Authority-Analysis: v=2.4 cv=NsjhtcdJ c=1 sm=1 tr=0 ts=6a9faa07 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=O40WLhOeGaaPd3mYGW4A:9 a=QEXdDO2ut3YA:10
 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA2OCBTYWx0ZWRfX8Pdh6DQQmoN1
 6glbNFgSpnBtOqSRg7U0/lOfKuSTeDQKWjU7QbCgomU7JSZiKPA+Jpxqf0LiRltlUYRX4zwqdcW
 Pdse1hRGrOhXTS3q3X9zWwc3owm6qh0fVM5U3pMP3ev3As9y1N3Y1uHy1BxG8zy0TMntrDEu4GP
 asFu85u73oYCnw8P+NupgTjGVgGtDWg61L7bk//MVpfgtAvpnYopwWx44IgOBtVRP4GddnSZ4lR
 XJbxgknmXSVCHqcK6RUpcCO/Yj48zlsXsxEOV/bEpcWwLbmNJ7OI5cXY0nJllJ9dOKjGf+Rq3pQ
 7v0w6sePSAP8c6qP1NbaAFhhrG2j3KwmoqHMUmRlsPGlPPYptgC5+Yo5S1lJonK/2Fiz2kZ2emH
 jvpCVfo3geh5xXz09IKnuWFQoP2RIBFXbK4G6ZGgcmNrisWs2rI+cGHTAm92FaLmrv4Y1SKBP0/
 Bb4KLlvf2mxhcx0oqig==
X-Proofpoint-ORIG-GUID: vdbn6RfNQ0l-6WdAZ4TpUdDBQmK2EJnL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080068

Enable ethernet0 for the Shikra CQS EVK board with its DP83867 RGMII
PHY. The PHY is powered on using a GPIO-controlled 2.5V regulator.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 46 +++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
index e62ba5aef71ff5b15e55810ae3d80a81e15e44e8..7b30c67c68e8c7161bfdd25168fe882b394b5558 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
@@ -21,6 +21,42 @@ aliases {
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	rgmii_phy_supply: regulator-rgmii-phy {
+		compatible = "regulator-fixed";
+		regulator-name = "rgmii-phy-pwr";
+		regulator-min-microvolt = <2500000>;
+		regulator-max-microvolt = <2500000>;
+		gpio = <&tlmm 149 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		pinctrl-0 = <&rgmii_phy_pwr_default>;
+		pinctrl-names = "default";
+	};
+};
+
+&ethernet0 {
+	phy-handle = <&rgmii_phy>;
+	phy-mode = "rgmii-id";
+
+	pinctrl-0 = <&ethernet0_default>;
+	pinctrl-names = "default";
+
+	status = "okay";
+
+	mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		rgmii_phy: ethernet-phy@7 {
+			compatible = "ethernet-phy-id2000.a231";
+			reg = <0x7>;
+			reset-gpios = <&tlmm 135 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <10000>;
+			reset-deassert-us = <50000>;
+			vdda-2p5-supply = <&rgmii_phy_supply>;
+		};
+	};
 };
 
 &remoteproc_cdsp {
@@ -57,3 +93,13 @@ &sdhc_1 {
 
 	status = "okay";
 };
+
+&tlmm {
+	rgmii_phy_pwr_default: rgmii-phy-pwr-default-state {
+		pins = "gpio149";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+		output-low;
+	};
+};

-- 
2.34.1

