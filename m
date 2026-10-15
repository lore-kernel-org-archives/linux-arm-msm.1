Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B744EFFB4
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 08:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792054750; cv=none; b=DN1g4/dzLQ5c4c+pMK2C8poVLzTZXK8oKkjhpHowFbqHd2X7KZsL9f+lInCQbgX8a645B6eOQhu8oLfKQbVfC76fUWwgD9IeYTF/vDkGOwZATJCeYIneILSql3ismZjWxrekvwiVeQ+W72XgDH5yrUuI/aSC2D5+RqBBKpYcJuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792054750; c=relaxed/simple;
	bh=orEEB4Di9IciHmU5vNoXEI2s2xHdwt+cDps+MGXhqNE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RSRaRyxdV9GgomKzjNXil182BBsbmngKSHozq5xb5Phn6y5EWVMJu/xcsLbYHY+RvCUs9yHi/o6aB+gkeD6WM3EemUTnX4lT3m1odURX0kAsnGlcVlcjye5Q/QBkIV9AxEIeBkPCNGnTX0dSBtMPP02KTR+5rC9JXgHVbg2iZDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RtWaKqVI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jY7xiHeo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RtWaKqVI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jY7xiHeo"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F3we4K1889570
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 08:59:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xu2033LaBmqkzJxlbTL1PZOWfNlBEA8awrj2KAxUyVQ=; b=RtWaKqVIjcDIizuw
	TX1vXJvc5rRosGwFQ92VouUUmdyixXJQw0Ga7e5Apn5K02TIwwAwl+SBg5O2LTXa
	G9CYty/nlw8Itaho49agNiT24IatQZnPzPAu3kxWgrqnlQ0I2ExWobrBDxtMikbK
	Lb4h7ido9NJthtwZqnFvKDgorUbXlExAld6kqliIPQ7aoS9eIjvF1yYXpVsct+Ap
	jW6voNqnWgxJXfz6BpCER+Qhlnn9nzuUkDVSy1SaKC0J7wUBMm/JQzywqwwEb3QZ
	XW0eRQy+fV6Gg2RRE5pAIRAGWz+7JDmAjqMRm2aiBONYlIY+iVGhr+OlgkqTZDdM
	GNUxdA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haqda14y9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 08:59:03 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cb98809caso858547485a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 01:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792054743; x=1792659543; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xu2033LaBmqkzJxlbTL1PZOWfNlBEA8awrj2KAxUyVQ=;
        b=jY7xiHeokbmiG/Uq7GgRHnXmLq++uodoU7sgtBSItS0klkMjyvus4AvkIqhUkLfjUH
         2h3SfLKkRrDVa408gUghwkYzsMgk/Z1F/+92rRdQkrhI2eOVO5Qg9ij3YDc/RsuEuGhF
         f5NbXtJsq8HRAt0y6Gb8SOCMThXrDkHTKIiYJh9m5lrbSkRkwiLJHBw9uoozbGsQGBpX
         IdOEU1urdjk+IELbKr17vU8vy7aAdH+fsKhCOgSFadNdYkgjecJbFe4P8I8jmQ8zwjMs
         TfeXMOm3CjSPktT2CV+06GRPcQuPiVgfA1zdiDoZl5WK2TPr3keC38hm2OZjIMaS87rL
         eJNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792054743; x=1792659543;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xu2033LaBmqkzJxlbTL1PZOWfNlBEA8awrj2KAxUyVQ=;
        b=1qDU88IQ1oRW+4/DTWhFJocRD2FOhpqAGIO31Zqoao6lbKNCpc0Zmpo1vYa9Jy2gvv
         Q7RHClWnpP9EuKC6xDxqOsjsXEBDKQEDxPNFH6x8xpoWEeeukNPAb+bn70rcBkTs26Ok
         jN42CVf82+Kz71bDdTpGIyTrsdomloP4V1T6+gWJyN7xpWgepdj/ZCPvXzgkw8yJSAH2
         ovNdHwjGJ7zT31kPm0DasAMen69i+BSv6HQXg76K1oXA0rFUquHy3KoWnqBihwAdxUm/
         dZk4xgnPpZolJcvM3dfmaT3T3T5HRm9/x61nCkhQ5LtC/9w30A99oRnNfREA6ZZx127u
         q/vw==
X-Gm-Message-State: AFq9FYIlUuM3AGRYcJl+o330bfRiewYFOGaabE97H1dEQBYt8Cky56tM
	5RfDl2sM4mOG7z7mzYmZOnJoE5tsO7gtz/CI/ziGz8Adpzqdu9gFJz138SyOnCFt6+BcUPb4NwW
	b0NCOfPKFLlaH5CrYS3KeGxyud0eeyo/8v+ECUbqzo8eSInksw20kJXs5L25wRXQnpReU
X-Gm-Gg: AYBFou2iMWw+RF9TyS842ZmMSqi7JM3nUfpvsScQVZH17EgQF37qi8hI7PI3IqRZ5eL
	vCZqXab33mNGEE5wctYgCYTaMf0jvkgRC2A6VUx24pvTlOC6DeODhsJdqtAb5c4qdNKE7z7VX7I
	ARGZ0FoIUPSaOlPVNFtXHhA12aB7e5Qf+4H8IrQ7Uz6i8hNS019UCyrXTzw6w+41X6bY7dmRyYS
	n27aDbDmgNE5yqY3J4LTES70blu7emkwYX94I9yyNwcNWu8zxLLydmcc+iAd/Io/BMuxWEo8sMH
	zuRR32IBKUV8kvqFJsvr5EO0yQXncBZB4PhAPh8i7VvEwTBxjbmZiglrYDnxBUYww4oyEfRRv6j
	hwFSdcGsgMLBsGPAZzKVyC1xdQSJX1AoyoPMiEgpyWZ1j+Vm4ZcTiNIrR23J/qKFXRP42bjaepj
	lQzr+v3H47s32S
X-Received: by 2002:a05:620a:2694:b0:93b:d8bc:a864 with SMTP id af79cd13be357-93ebd4ae9b2mr2761952685a.65.1792054742692;
        Thu, 15 Oct 2026 01:59:02 -0700 (PDT)
X-Received: by 2002:a05:620a:2694:b0:93b:d8bc:a864 with SMTP id af79cd13be357-93ebd4ae9b2mr2761949085a.65.1792054742207;
        Thu, 15 Oct 2026 01:59:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be3b51fd1dsm371590e87.58.2026.10.15.01.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 01:59:01 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 11:58:43 +0300
Subject: [PATCH 6/9] arm64: dts: qcom: pm8150l: add LCDB regulators
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-sm8150-display-card-v1-6-5c14928cef29@oss.qualcomm.com>
References: <20261015-sm8150-display-card-v1-0-5c14928cef29@oss.qualcomm.com>
In-Reply-To: <20261015-sm8150-display-card-v1-0-5c14928cef29@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
        Kiran Gunda <quic_kgunda@quicinc.com>,
        Subbaraman Narayanamurthy <quic_subbaram@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1019;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=orEEB4Di9IciHmU5vNoXEI2s2xHdwt+cDps+MGXhqNE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq0JXG675dHOR6qOefRBRinkgWZvvzBOrjTwkER
 Gq/zlW3+1WJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatCVxgAKCRCLPIo+Aiko
 1VPQB/4haNfclZ26D1btqgVLcMyS+X0wynAuPTZZKRJ3MDQwxT9M8opJMeRxGfwqfL+pIi6VZKK
 TSx9SNLEuCxeEN4t1Vc3J4dL37ax6LfCBeWV8wId7riR/JOidcpe7PMaiAcMrxF2NCjOUi++pk8
 Fap6rxAo6Z/YViVlrM1MVLuFCOv0KRa3Ky8EPALffvPF/l5a3gCLlZ/+D8ek2JJPmLPW79vWNbK
 pXjSnFFUDXJ8yCOMFvyjnYtM2QVMhcgnzoOsPWjpLi1pGi4DJf99DzdZ9kZzHONBWGO+/fTx1S/
 dr7/AGG7nRthWyNGQ+pLZ/w26Vdshyd+aNbk8bzPTWTpK8Yc
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzNSBTYWx0ZWRfX/ZtNLmuXqzbo
 Iuqh+nvpMhle4dcHfa9VCgKwMHNTccU20Mysta4EwpkyhlD6wIqtoU9mRVP1jM0jZqA7THxLz9q
 YmEE8L+1QHVwmzn1xbfdeNdvSfr5KC4=
X-Authority-Analysis: v=2.4 cv=K9u3jCWI c=1 sm=1 tr=0 ts=6ad095d7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=7QMEsOvxxwx5wcZNC-0A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: _0RdLUvkJ0K96LBGW28EqPhJPdtHpqJw
X-Proofpoint-ORIG-GUID: _0RdLUvkJ0K96LBGW28EqPhJPdtHpqJw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzNSBTYWx0ZWRfX8Xq8yhkLvb3h
 6tOp9a+DPLhQKLWtG2eLj6IM4e0pYE86R/a2J2eLdmRgmRh36u7vV4yc8Bo3bXJ0v+iM99IHtGc
 LyslvO7Injo34LHdiPhLw8g/kiazO1XQut6LnEVE4CbMO2Uh5k9oVkbeLFrRk9Z3lQoO6jaIug5
 WHp+oIReQ/2VzcxhkvmrY6w121CebQeSJedlL6wlML4onDtjCUjuVF9V1p1IwJmBH8yfY9RweJ3
 lZgmBocPXol5hC+MzJSXTeGWTo6NU4iDFZJH0xK2B20fqtolbqlxUZ85nvUn+SCChBHOANsvVrg
 IZtdNXYkMEEO2D5wxFu1LomC5WhYRRy+fzxSOxV23bNDXh5cP6JZkBPUW3f/JOyf2Ixb184HRd1
 4Vg02y840xcrO4lH2bTljsGF09u/dEwHdmA4m6U38+vZdYGTBPd1C7eNfhuZpRp0QATjVsDaL75
 9tUcXD5HpOJrhzjLnaA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 phishscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150035

Describe the LCDB block providing the LCD bias rails.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pm8150l.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm8150l.dtsi b/arch/arm64/boot/dts/qcom/pm8150l.dtsi
index 3911d6d0d2e2..f54ddb6f7946 100644
--- a/arch/arm64/boot/dts/qcom/pm8150l.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8150l.dtsi
@@ -141,5 +141,23 @@ pm8150l_wled: leds@d800 {
 
 			status = "disabled";
 		};
+
+		pm8150l_lcdb: lcdb@ec00 {
+			compatible = "qcom,pm8150l-lcdb";
+			reg = <0xec00>;
+			interrupts = <0x5 0xec 0x1 IRQ_TYPE_EDGE_RISING>;
+
+			status = "disabled";
+
+			pm8150l_lcdb_ldo: ldo {
+				regulator-min-microvolt = <4000000>;
+				regulator-max-microvolt = <6000000>;
+			};
+
+			pm8150l_lcdb_ncp: ncp {
+				regulator-min-microvolt = <4000000>;
+				regulator-max-microvolt = <6000000>;
+			};
+		};
 	};
 };

-- 
2.47.3

