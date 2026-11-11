Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794391271;
	b=DSiMx72DsFGhQFqrsMUuAzP56oGBtr9xQT8Di4iW61dxRp5OunbK4Z8GhC98GHguOvOK
	 c9F5X4x5T8uHp3iJXpY/3Qat58vrAk5m4Vf4mnT2xD84TgEmdm4NZauFdpFBdy+sG1o5k
	 J2D+DQX0Mj7BG7VAw8Ev3pJiqKGbiSMqBpYsEhHKg2Ywu1AvLh38NxgUS4NwWkbMpBqZg
	 R4+PaiPzL6ieD/rNZg7xMIvXk5ruLg0bLwmaDwB82IlYzF+lT6SnL/Zj/9rAAfNuCbxiX
	 cIS8EWIazY1et+ao9c73qjLmftsa6z5HEnvegTwwHQPak736ETZUwoQ4kQuVB6eAx3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794391271;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=HEpBBwY4m5scDgU0RA4B2noBF/zAsH0ctz5E1VEmcHc=;
	b=bnn/GENZeHlSLDRnigqoamW53d/WTj75w3a6weToMDNgMn3NSEbQ37sjs5a7YNrfnCS4
	 NxIgIjw2y3V3qbq6JIEMTQS/DleGDWXbdv09EKrgDlq0oQkJ9aXLQ55FhsyhNiGmSP2uk
	 VJ8RRkJrbN/3R+KxbY+JVWNQFp+JQ9iG8C/L8rUGYU8+JaXfWmenq000HCTkt9InjAwXy
	 yfEOHAFpLDz1GEbB4m+RDLcURFIrPkVzuvpuR3qW6QzvjQ1J8Yx7IGZEccZUhmFxsS6bB
	 2ZGCqsSIa/hU8I1/76oQHCQKVxC3Yjrqqie+Ijdu8IWsV8Lo6mBMUegeRWv3OokpsWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QCwbsGiL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kRJNyJJ8;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A81560A5BD4
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 10:01:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A81560A5BD4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QCwbsGiL;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kRJNyJJ8
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB5Kcte2017788
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 10:01:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HEpBBwY4m5scDgU0RA4B2noBF/zAsH0ctz5E1VEmcHc=; b=QCwbsGiL8deVshBN
	cKsOzIJQ73WyK29znFgl01Xga7/uvYUEIct+HpOK+0/5kHTK4MnBex1/1pI0OVHB
	b3mA00840N4d5bldQbmpq6bIpQ7kfD34OgtTDxuzMCz3UGIElEvQ464oqVZPi3x3
	mz/qUwxpTZpN1bnKMimTZr8DtNoXVQJzK7y4z8riN+BRA3x980sapxsOWy2Okjkw
	3jNTZtWfvuPmX3oEkGtYCP5lWJKopTF8cF6yfhcAdGoL7Zlu/yVHsEkq/76t8LVA
	+zpmnJ7I/DP9fhNTxQGR5Ajmb3lLGXtBB3P4XejoWrYygVzjMFxZcQzHxyk39kZR
	5Eze5w==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv97cb5ud-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 10:01:05 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-5641cd2cc13so3417447b6e.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 02:01:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794391265; x=1794996065; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HEpBBwY4m5scDgU0RA4B2noBF/zAsH0ctz5E1VEmcHc=;
        b=kRJNyJJ85biOA/kKJTj60e5iBiRXfByfWAFvSaolxQmJlXBxm04riDm4Z2EzvI0wKg
         6PQA4+MQ/yTHu6OC5Z6NFcCRUsgXR55nss+2gPAEb/j9UOzHWF+zDH7wVn6LBjJPRq00
         PA6a0hWfPHZfVc75pYBIcKMNZ9iiQg9MUtDVOT2rtqFtGjBfQ4Q2Gfc61RZmm0hvjwxA
         Um7RBArQbqdq3BxAH4nmLZlkfE4+D88OTchpT8Fg6VEp8mZjSYnFvz5QaZSQl83Hr+Tz
         dYqUJAdG2rSSuBY2vavkuMWmYGIEH3Ef0u9b393zsbUJUuEG4ritq2T/7sbzfCFbnqVB
         Q39Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794391265; x=1794996065;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HEpBBwY4m5scDgU0RA4B2noBF/zAsH0ctz5E1VEmcHc=;
        b=SagksUjUbujrSMtG37eZxaWS/6/4pgR5BUe4eigSHqCbEwoYRsM+HxI7Ig6PCOsxEm
         8OVZUMSZEWMcM/+7lJiprdlxK0no2RaQQWKbBq8FoO+uetDLM5YZ9iMKDZjsSLFhXIOs
         katm71vLveOQk1Jnp/jPvWYPtuWRrz52KfTQO/HQ7/e2Fefcyomex5WXpmlmdfh0qxgs
         wtlcRJCP+r0L6cjWH2HnVnfUFbbn8q5uQrn43AB/fXzUcfDqUlimeu0oKHW91crRE8Cq
         Ts27YZEcFun5i4+rh3MIig0Ub21UYxw2ItbotCTRWuDxatytyteilZ/J0jnnkEPrL3BI
         hnhA==
X-Gm-Message-State: APuU4Z9zfZTjZm6Y//GJd9qUhPPFtVZtcOQMOx/s8AQE4dLj6BuN1GwK
	kFhtxhAFlP/LRVIiru65QrKiPPV31sZGGcgxkxs+145+F87iQIXk+0x4rXIUp5Li+BwyPF2I32E
	fH8dxGFva+XhLLzztW+ak3tTYdMioVFVt+or/41FCCJ2Axai9epFmn567EcE8+8Si3/eu
X-Gm-Gg: AYBFou0lZ4TTQyjIX5WPKUguLZwKEq1Jj8EwICBCUTixc0uYaPH91RY9abM1h2vyuTE
	zcIJcTuD/7f0P7gprCix8WZIblNhdmgV+zVipA2TitO4ISrn6PMFawuFU2HI/zFc9RpbqXidDCc
	3hTfwIf+Qokuawzhd9xeHOM6IwBZyNV2R1KUvWsNo2t0lM4G3DLFskS91SSTZ0OzeA2GbOKdNGh
	4Md4uPgQmH7jvkO/1SN2uIEDIVDEOWFAGEeUV85u4X/iH8a4rfQ7/3HcClSgLhf62wDYCbhNvgI
	COcuuuL2EIbGY+0vZOrONr5+X5lNT/Mj+zXlcUZNY5Qs/UJ1Vc+Sa+62n814zcnuArReKqPWcf2
	iNwXjslj61w9SAv3GV8bS1qpXzmTsWnvJ368fXkYBE+EsZUbXG/1VnAZgA4P4YxvqfCm1YZ1Rbv
	HMjYr8hp7GxBL2jReK
X-Received: by 2002:a05:6808:1924:b0:4d6:92b3:5c8d with SMTP id 5614622812f47-56b98d27ee0mr1503249b6e.67.1794391264687;
        Wed, 11 Nov 2026 02:01:04 -0800 (PST)
X-Received: by 2002:a05:6808:1924:b0:4d6:92b3:5c8d with SMTP id 5614622812f47-56b98d27ee0mr1503211b6e.67.1794391264180;
        Wed, 11 Nov 2026 02:01:04 -0800 (PST)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504c276sm4686111b6e.4.2026.11.11.02.01.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 02:01:03 -0800 (PST)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 02:00:57 -0800
Subject: [PATCH v2 3/3] arm64: dts: qcom: ipq5210: Add NSS clock controller
 node
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
Message-Id: <20261111-qcom_ipq5210_nsscc-v2-3-7e2c1dda3ed2@oss.qualcomm.com>
References: <20261111-qcom_ipq5210_nsscc-v2-0-7e2c1dda3ed2@oss.qualcomm.com>
In-Reply-To: <20261111-qcom_ipq5210_nsscc-v2-0-7e2c1dda3ed2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Luo Jie <jie.luo@oss.qualcomm.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, netdev@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794391255; l=2069;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=V7tk6aEtOPhfOk+VPI7cIHGev2spKigLOSXp8SeaGFM=;
 b=FPdGwja/I0to/ZmRBr9rXIX0wX/bDKAU1xK3bC9dhG0h/+sBG00vXJCbM1eQXFpMhieJc78+d
 zQqoysUX1hbBKJPSNke8FUNppPMjsVdX2VfHSwBf+OW8jJwOM6o7cRU
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAzOSBTYWx0ZWRfX+koR2BzFgX2b
 Tuwr9jc8HxPv51dm72m/MrbK+Y9udhXAqjY+PIZny/K7l1+8NkF24fF/w7RjiIdXOe0Jy8qDX1c
 pxK65D6VfqR4vUt+Fq8XqHw4Ys9IYC4yrHotfIw0JdlOluU9Itz5Ds/uADU+UkzNApAbQtr0Aej
 nPUdfBRwLfP+7HyrBYp/QPspMeFvMbxnWBQ/4e1KKDGt64m5TEHPde1QDmuTiVEZ2zfsuRpiQSs
 MifVRtfBK00VRM9seKPSn1TQv0xuVr3y00lSfsXCeyrWCJBycDgY3fL1TEjTiMNE+s5ZZ0FtAEa
 scY0JvzspLKLUwLYLH6d8uA1aeNhHhumcSQCVJ3uEBBuTzpn+yCnMW8gwUXatbRiYs312KIhIhM
 mDECILUMCynD47Ww7jNQRn+tJ4oQFoTMf6yicWT+N5sHS7bylDB9iNXcGdnGKNQwJVelnjLV5JC
 lixWUrpm91WHgYDtOHQ==
X-Authority-Analysis: v=2.4 cv=cJl1IVeN c=1 sm=1 tr=0 ts=6af43ce1 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=6SnK136Pe_QpXSRpRBcA:9 a=QEXdDO2ut3YA:10
 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-GUID: gCnC3T6CHjFUlabLDnC1DQg9CEsf-JeY
X-Proofpoint-ORIG-GUID: gCnC3T6CHjFUlabLDnC1DQg9CEsf-JeY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAzOSBTYWx0ZWRfX8yW0hCTo+S3h
 SnHI2aJ0QTEKzVmAJkkeb06/P7jVnbBB3zIsHCHfQnZYNcUKP/FndUFrFAp/oeR7nJPDwvMSNZx
 rXTUGM+10j22cV3mRWHDHHml0txylKI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110039

NSS clock controller provides the clocks and resets to the networking
hardware blocks on the IPQ5210, such as PPE (Packet Process Engine) and
the integrated EPHY.

Note that the CMN PLL output clock names are reversed with respect to the
hardware block they actually feed: IPQ5210_PPE_CLK is wired to the NSS
hardware block, and IPQ5210_NSS_CLK is wired to the PPE hardware block.
Documentation is added in the DTS file to call this out and avoid
confusion.

Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210.dtsi | 40 +++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
index 0c1ede0f73b2..11915f8eb156 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -331,6 +331,46 @@ frame@b128000 {
 				status = "disabled";
 			};
 		};
+
+		nsscc: clock-controller@39b00000 {
+			compatible = "qcom,ipq5210-nsscc";
+			reg = <0x0 0x39b00000 0x0 0x100000>;
+			/*
+			 * Note: CMN PLL output clock names below are reversed relative
+			 * to the hardware block they feed - IPQ5210_PPE_CLK is wired to
+			 * the NSS hardware block ("nss") and IPQ5210_NSS_CLK is wired
+			 * to the PPE hardware block ("ppe").
+			 */
+			clocks = <&xo_board>,
+				 <&cmn_pll IPQ5210_PPE_CLK>,
+				 <&cmn_pll IPQ5210_NSS_CLK>,
+				 <&gcc GPLL0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <&gcc GCC_NSSCC_CLK>,
+				 <&cmn_pll IPQ5210_EPHY_RAW_CLK>,
+				 <&cmn_pll IPQ5210_EPHY_RAW_CLK>;
+			clock-names = "xo",
+				      "nss",
+				      "ppe",
+				      "gpll0_out",
+				      "uniphy0_rx",
+				      "uniphy0_tx",
+				      "uniphy1_rx",
+				      "uniphy1_tx",
+				      "uniphy2_rx",
+				      "uniphy2_tx",
+				      "bus",
+				      "ephy_rx",
+				      "ephy_tx";
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#interconnect-cells = <1>;
+		};
 	};
 
 	timer {

-- 
2.43.0

