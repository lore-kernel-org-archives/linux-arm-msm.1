Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC5436E46E
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 06:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789971620; cv=none; b=ONVFiGJLZOC0c9qpTtaNO0R/5mhMsR/cF5/3E9xGz2yvejuTzSSrsWtO36iAM57LZlEZaXwu8XJV3ghlqkRRlSstSAgOSfsyX0xtmnXErRFF+MCSX4jRj5jQqRxl0QNps8WGnMpjp4hB0LbcsDGA5P+qETCs+jF/U5dszUKyPO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789971620; c=relaxed/simple;
	bh=yQBFMi0V1Q/34XT7l2xkr/OPRTO8ErCo82SZzAZN8PU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V1Ivg9ttorjX/A/HW95g+E7LZgto5iUsIMadMYis/zYRhIsL4dcpQqs01NNs+uXaRAKWw8qbf0GsA/dVFtuThZOeeTv6DD/POJTMPZeTA/E4r81c1sk3FHxEwk30IOZ6jScRKKXwp11wpXJo5dJSuBaJ5fgSYI66Wu4e2wlVkxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JFBULBpD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TxbVDTzA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JFBULBpD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TxbVDTzA"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L3ZSu03551332
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 06:20:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3TMnVyIqj4oCOoXs32jIk9PhLPoRy53h9I9OmzdXVzE=; b=JFBULBpDRvWijOZu
	nK5Ju9lbxSXz/Oyo+REGLyqeKRSpKZYiCdg88TLy1wsg+wY6+FSeD/84976D7owH
	Yu8o54Vl2TtHtiAZ3h3DqrJCgEtZxb8951653I/TLSNFZirvz0IVXcO4yLVzDbEM
	iaphkMCFg4o9K4ROlFPaZH8XJzxGVf1y5/gdOVrZ9mf/N3E6D7quOf0IDfe19MCK
	6bvQbP3mzBCTq5jzhml/u67n5KOmZmm+9OdfjVrHA5z/Oa00UiVvFh/O4s8IOTeI
	Mo9W7dyyQeEesPcya5lSE18R3oPHBdPrCKnuZ+hh20UScrbVeBk/jIRsYVj6acmw
	vC6UQQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gsjs84xg6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 06:20:16 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2dd1631d291so33038895ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 23:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789971615; x=1790576415; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3TMnVyIqj4oCOoXs32jIk9PhLPoRy53h9I9OmzdXVzE=;
        b=TxbVDTzAXUU3N0vprDEv6wpbyRHmH45ma6SWMMpVAPg7FCIe9oyjcrm8TV88YdutLS
         O9OOUnE3VgB2wp2rv69i3eBjtyq1tt4iT77vBf3095G2YeiCEQApCka1rPeGFBFMrPdw
         n5BB4QcyxcF+lkv1+WO2tiUBgsDYz3uUoZeTwLgaiEFaa264KjGXRNedGmWWsyPF2Z0G
         TbOvz4M5cdk0+ywTE34Q2Q+kQgDtJmNXRzn0gOIZw1L8qFBKT9WsHw5DTEjT5tKzV0wE
         gw8nuvOqIi8BjCOOkZs+6R4KHGeOJCVZpQ7POk5RsrgjIDB13MNtqdcsHaFrKuUeKPKv
         sMHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789971615; x=1790576415;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3TMnVyIqj4oCOoXs32jIk9PhLPoRy53h9I9OmzdXVzE=;
        b=Oc7aapYHYIFNx4351Y5J75bS3uvn63yAiH44mFul8EtjORiGWHJh6PMciCa2zaDYC+
         n/LtihfVje4tOwPAvwqgWXid0C5bcHsGOhTtR7D6/gqR46So3MDC4RDlA4aeUc1TENOx
         kuYhZxmsJV/DoQ7wkEq7w37IOmW6MHLLzOllCRQuEt3miDMKCdCGf3vOElbw1qHpn7VF
         OOqFHGUdYCw9nHz7+9GdSNviLJXqeg0kZWpapdETccMvT5jqO/pjP4NZbZUxzqhiN5Uj
         jkmruMMB+Ocw0PVSDdy4Gx34Tvtr4fxx9rBKbKQ60KTmpsYhbHHiMWp/2HHAfMsYSjDI
         ZOuw==
X-Gm-Message-State: AFuF++mulxCuXIP/Yq3CDUC4fexiEHDMWQGvqD2uzjU06ZwNgzja9GyZ
	BVbpLiBItN8kIIKSeNRqJ3A4EIl0e8l05EJo84ZTpulzgKRrdODgFK3Ium0fQMMdEurxm3YicJT
	00EciOnHfv8DtVQFrNLsHPgRFVyMbxvjosOAn6NMaa53B++fuRXPZxJgjPjwQWvaegIqo
X-Gm-Gg: AYBFou1E3427zYm4hJVzYzSvfIGNPkz7Fb6RnqI3sM27Q8vuHQk4eY4bWgs7xc70rRU
	C+p9gxI6R6XAQF8aDofDcJU2eLvWDE31wpScjwqihu9CSjOEOZjPQtkudv4c+bpgxqPvFt6FB7b
	1+zFKRIzxkfaSeenLwlYGBiSOnkICXZiN85+EImT4gl6RMgJIqThb2l03FmU74YVLHhQpMDQsdh
	5TYgMug4hXkQS9pObqMjkYy6ipVwn0xFbn5c1f3CzyjHw1lKaLavcbO7nDVN34cBTn7+F9CCBYS
	e4f1n8vDXphM4IlVOxNWD5d0CiXfK82eQ2WjzvbyYpY7s5k4UVQdfLy2MfqmWEY+eTAyLQ0rf1T
	8eeipfRi6sY4aJCZCM1rFuUhw465ePwNO6o1O+HXIhVHTH6Pz3qXxyHnjG165X4cNIIFmHa1zCU
	sDcK7iGL394FyervCYY9Lz3Xgnru9kkfNOCQ==
X-Received: by 2002:a17:903:19f0:b0:2dd:7593:8634 with SMTP id d9443c01a7336-2ddb1b0f7efmr138780515ad.13.1789971615501;
        Sun, 20 Sep 2026 23:20:15 -0700 (PDT)
X-Received: by 2002:a17:903:19f0:b0:2dd:7593:8634 with SMTP id d9443c01a7336-2ddb1b0f7efmr138780115ad.13.1789971615035;
        Sun, 20 Sep 2026 23:20:15 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c331d3f2csm14091444eec.28.2026.09.20.23.20.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 23:20:14 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 11:49:37 +0530
Subject: [PATCH 04/11] arm64: dts: qcom: ipq9574: Wire up USB3 PHY PIPE
 clock to GCC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-ipq_clk_changes-v1-4-d242e3d49648@oss.qualcomm.com>
References: <20260921-ipq_clk_changes-v1-0-d242e3d49648@oss.qualcomm.com>
In-Reply-To: <20260921-ipq_clk_changes-v1-0-d242e3d49648@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        Kathiravan T <quic_kathirav@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        stable@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: T3xLOpPGlj83DzocJk2spk3HAiD2cCm1
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDA4OSBTYWx0ZWRfX3ZQ0kwWp1mw+
 gXUe2MfqoxfaUEBFQRqBOFjFSHKEgTXoNZVX1nPB2kgj5IOyQt6B41s6HdwpwK9KRL3SwvOgEoI
 rcXjN/y4uYlDcpjzCqijPEiktTotMVw=
X-Authority-Analysis: v=2.4 cv=YqWa1IYX c=1 sm=1 tr=0 ts=6ab0cca0 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=3OI4E87EZh46DsEagTIA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDA4OSBTYWx0ZWRfX7VJhcEMLr8tc
 +DGL1iqlF4ldWU4oE8YcmyvxeFC//CgxigBN7TIVhTSWNihbUI/iO3iIPAVyjWV1s6VtTwj2gG4
 CdO7bKqQU6q1ewQK4UL/g5t0dh0erbR60hBz0QS2U43KSHemjpFFxsOtmXc9u0W7AhRr7korONO
 XEb4VKwEuPDK7GSYP+KB7SW8lUUmlAjU3ohMHRXjZ0sJFlZ1GlNNKgrih4yoa19KlTSJf2Mqq1N
 n0/fJ5hPxEtCnEhPfci3ytrNUdmh54vmeT9VCopxVbSUM3pTY+2eLSBslY0wziUEjvnra0bo7GW
 6Cjgg1GKzHwE3odL0OsZyZylpHJWWdr+qzs2i0TWtPFd59axp5fR7kc++TQXqzIRi9DXLLcOSSl
 6oc3F3fggvEI2xs5+wyw2sCnf7deOYww7L6fyu+gKLt24YXGEBJB3+CbB17PrlYZSOdZvQv3abf
 8t/Bmep2/l5RwGduOnw==
X-Proofpoint-GUID: T3xLOpPGlj83DzocJk2spk3HAiD2cCm1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210089

Connect the QMP PHY USB3 output to GCC so the USB3 PHY pipe clock can
propagate to the USB controller.

Cc: stable@vger.kernel.org
Fixes: a98bfb31f676 ("arm64: dts: qcom: ipq9574: Add USB related nodes")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq9574.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
index 5a5bda5f21a1..dd1dcd955c95 100644
--- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
@@ -428,7 +428,7 @@ gcc: clock-controller@1800000 {
 				 <&pcie1_phy>,
 				 <&pcie2_phy>,
 				 <&pcie3_phy>,
-				 <0>;
+				 <&usb_0_qmpphy>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#interconnect-cells = <1>;

-- 
2.34.1

