Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8532347668F
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Aug 2026 13:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785938011; cv=none; b=LE+10I1RJekAIMYwGpHpBjWReLyO/v8DNRUlsX8MWcNBUqZxMhIan504yToD8dxjGeBvnUTd+7kpHwlPNX59uZ2S0HAPmf4behUsZ/3IoiyyOy4qbmf6XPlAG21YwSgB7JDOxl/xv7EKaC3nIO44BWuXPBH+JOuxzRLp2c+od/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785938011; c=relaxed/simple;
	bh=zqWW9GqLxAuICtzSU1LCZ2LuTRVM2uyQw6HFZppsKLA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Hdaa9O0atsq0O6LA5KzhrL9qsrOhCX49SD3bQMQWAvNSs+hZnSDW2x7skvfhuQWYefx9a5atBeySE6IZdphm9uj/zsC/7SzwCMMOhrOhsjAB8X4A+W5ikUn39VmKb5NKSv5X9Iu/wEHkPx16YjrmLeYfRQiF+Wjue9xF5Gf3fws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W7/MkG6k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f2xHlM25; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W7/MkG6k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f2xHlM25"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 675BvOtJ2823478
	for <linux-arm-msm@vger.kernel.org>; Wed, 5 Aug 2026 13:53:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DHDj9TXQt02YxQEnRTeluEmHbttgGScQD7kszwd7H0k=; b=W7/MkG6k5UsOh7ek
	7+SSXXYUmQNFbCVzzXSKPlG9dQ5shyQcbHAgrOg/WAG0jB3R1RqVL7xhYtndF7QA
	27DIenOEhF6awF4PD6DA3zcfpwkM5Vtd0+AUoEivnlkTTg4unq90Zl1hMeRDcu2z
	ScBpZfbYMO8qhdGd2cnOlgW6RD8RuBQjYL5CF4NhJrn5ZFBsJDnTXr740Pa9AP1A
	lPFCojZePVTPXb8T9Zhg2w36tMQ0oDwzubAvZfzTnGCA3kfPwQvpEzgoyiIHHBtU
	JSqkq4JPxlDyRx6dtaXjROGOMTn+87eH9T98211PNKnuGAMOpTKHH5sexVrAuALb
	wHgTNQ==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv2c093vj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 05 Aug 2026 13:53:27 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-81e6ae12b42so14160937b3.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Aug 2026 06:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785938007; x=1786542807; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DHDj9TXQt02YxQEnRTeluEmHbttgGScQD7kszwd7H0k=;
        b=f2xHlM25+S/90haighO0ecvK/sI5y7sNb7/p8hcbB/9nBqC0roNQQD/9TOsT6yqpqD
         FLF+TrXWNkljZCP8+Zmxx/2b9ghPqdAhnNTkKBT4QKZJaJzzIulRqN+cOgWjHUi0unEg
         xVx5+cnM0NWCiLb4IxvR4xixzrmiGRWdI9+E+inDamHSmrM6t76bsRe6nGWW8xwKO5hh
         4otDDKSd9eeoaPRv0r2saB0FEsv0JNES+g8LiSgSMWWmQAVCaCIq7Idu/AltJAKVEUPe
         baceBvkaKwHvq8b9vSjRxbFQnPVBwwA6ulpyEfR/e/PBwwluy4K0/0UeqJX2eWACGbx1
         z9Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785938007; x=1786542807;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DHDj9TXQt02YxQEnRTeluEmHbttgGScQD7kszwd7H0k=;
        b=LfthXfrbiazB1CmpalbPJIfXnckIB86O8STXDIhhfGalwxO36tCgVK30YGcB+rukkN
         5A7uO2u/yGBLtjvfcKZa8hC1a+aqsS2X/4gARtjTwKpq1HqVjneDap2Xts+nWSKDLeqv
         hm5uAWiTJnoDx9R1QMTVvPXjMptS53ac604o5g8BgMo2LHVyuNwcmfAU3AIQ0nerkLCO
         hKEtdMNa/AssQiVrzxJDMbpt3t4r2x9VLtXVxAseBHhjDyf2FFGYQf57iUS10TUuuDQH
         YyRLAAwfP8b9WNMbhyaf+S1sbtiUtXNpcsTwqEoKDZbSyV/MlNDCMCM2be7BSLpFrFuf
         W0ng==
X-Gm-Message-State: AOJu0YzcDxWeuhWrVgoexks3UFcmzXB8kwRErCNkHWSDLuX/Ue+qM5F0
	Xug7AboC6Mncri4kBzEzUaB/HCeblGqDUk+NMkLcj6/w8MZCbJNb62a8QoD73gXQWSD+GOHFbHq
	3uRSVfqMrUFwOLlIcE1YHOTAji+n9Cn5ufpfy3Yi4UqF1pU4QyX01EwVA7H/TRoPa6j7o
X-Gm-Gg: AR+sD110yQ6pXX3WDJVyX0xHG/boOp9EKIAAXwfsuFcXhZVA/nS+zo6lbPZ7QUxOwWH
	rgxqjStbxhY69I6xtavsk1gUgwY1g5Td4sOwpC6tQPNDTESTrXAuflRgmrtNzaMBpeCrrqJqUct
	QTivlBchAFFLwoZ2oglTH+C91EEJriXl2/CY7+GSFhXhuqHAQltBib9eGt5huM5C5OTZvk00gcZ
	LKNqI9ZeCrntk6GG9bbIh6CO/QfT7jjpLpfna+9Cv53nR/+3LraEopcjRERxFW1M+h97EsVhG7t
	ydcDImp6Rz80iKiwDH4PFPfz3PRdfBMf/r+Z+LyyaJscy9/buGPP2oI/83h9Oi8C49d5x5LcRU2
	fe+b3gMgLQ0F59diqoR+0t/WqZWMhTSU=
X-Received: by 2002:a05:690c:4b86:b0:7db:a109:f12f with SMTP id 00721157ae682-8201bc73833mr37282557b3.1.1785938007001;
        Wed, 05 Aug 2026 06:53:27 -0700 (PDT)
X-Received: by 2002:a05:690c:4b86:b0:7db:a109:f12f with SMTP id 00721157ae682-8201bc73833mr37282077b3.1.1785938006455;
        Wed, 05 Aug 2026 06:53:26 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8201320ec71sm20892517b3.12.2026.08.05.06.53.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 06:53:26 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Wed, 05 Aug 2026 19:22:48 +0530
Subject: [PATCH RESEND v6 3/5] arm64: dts: qcom: shikra: Add pin
 configuration for mclks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-shikra-camss-review-v6-3-a8dbc66f0d87@oss.qualcomm.com>
References: <20260805-shikra-camss-review-v6-0-a8dbc66f0d87@oss.qualcomm.com>
In-Reply-To: <20260805-shikra-camss-review-v6-0-a8dbc66f0d87@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785937970; l=1547;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=zqWW9GqLxAuICtzSU1LCZ2LuTRVM2uyQw6HFZppsKLA=;
 b=sPuLgU939muF7lwZr37xaWm5GG4BsPu9vMW9m34ozfu+Pq6sMHMdoRAxVeqnsYL+ofo7mtjLA
 8q1T7zV8HxTDVId9Gns+28i2uGBlQRNdE1/TRBXtuXIsyXP+kmGawY0
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-ORIG-GUID: WC2Dso1sw1OVIKZJvZJ5uzj1Xp2UJvIw
X-Authority-Analysis: v=2.4 cv=aOfAb79m c=1 sm=1 tr=0 ts=6a734057 cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=PMLJDkNcKfHmOO-cHakA:9 a=QEXdDO2ut3YA:10
 a=MFSWADHSvvjO3QEy5MdX:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDExMiBTYWx0ZWRfX03y5dxuijmHF
 VKsxQx5vpNcVv2yjBbSfcDKvqfWyy5Quf+UJvNzGMnOQIQTQdwtKSoxJZNmY285zPOjX+OACKcn
 ExvmOY/S+y6y8ZM84JrD826H0hyQ/dQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDExMiBTYWx0ZWRfX6Vy/JVKh8DNR
 n+IUxdUryYUh3XQmA7zczgusQWPfEO2qatemF71S7X1J1TqHpEIh52DgZTwsOhHkiL8FFng9JJN
 xEl2zRqftROK5oSGnceQA4WHlhEb+MnUksepoYW/DuaJ3qOqx76VPrrOZl6w5KN1hU65Op3oXSA
 sxEbAIPlTl6ZALJJFfzGA5+XsMS0U21ng0qm0z551s2yd4J+IqM09xNJweMU5FU7zj/BQuB/yBF
 0I3+j+yJQW+8k3KsfN/XXokX80c/sZVCY4Xp4eYaRPI9jevW0MOh3gmCS+Kd2J9GrKFp4GbeRTn
 VQY4Ko+Jt03uE/afOS4qmwuzPfGqwEchp51jFiS1TuBMM8FfirUzzJbrrNCxrSimfTLztuSRx7+
 MUti86mykZmnZS2bBMTLFKtGMosivul0uqh+tyUBXSs1WVN4gIw+ypkx+8pxkUveHQdJlH3lOek
 klf6QH3ewnMk1HeVzag==
X-Proofpoint-GUID: WC2Dso1sw1OVIKZJvZJ5uzj1Xp2UJvIw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_04,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 clxscore=1015 phishscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050112

Add pinctrl configuration for the four available camera master clocks.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index ddfcfb137bb29439ce20ba6ebf3a76693792b56c..c6839aa2349f397b041f3201b8a33fa90e36c77f 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -387,6 +387,34 @@ cci_i2c1_sleep: cci-i2c1-sleep-state {
 				bias-pull-down;
 			};
 
+			cam_mclk0_default: cam-mclk0-default-state {
+				pins = "gpio34";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk1_default: cam-mclk1-default-state {
+				pins = "gpio35";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk2_default: cam-mclk2-default-state {
+				pins = "gpio96";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk3_default: cam-mclk3-default-state {
+				pins = "gpio98";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			sdc1_state_on: sdc1-on-state {
 				clk-pins {
 					pins = "sdc1_clk";

-- 
2.34.1

