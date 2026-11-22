Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795329978;
	b=qX6lVTZZdtT9Iut97+oP3uWmeafJgr+qClnTKz09NALv2vx20yhz+wXgpqAkIpCDQ0Cb
	 B4yGl60V4gZ/G/O2Yd02T7p+lNo8bLiQM0wkQzNLy1TH6LdC/Z+ShlshKOBL7Q3/Py/qM
	 v2XCAh/HI+84K/bZpNfzmj9niFSOcP5Nw7oPsqlPnxPFu3LNDDjIBNdcJ9oefz1hkKOCJ
	 x9vVQeAx9IPtIEyfOgJb9x+GSLpwSD4SE/xoGIU+quq0Px1V749IcgarBrxZc/7C5KCTO
	 xJFrJQyPd/XNQl57hHoA+g9CvJGqiBtFmvgF9/m8WjQyIXBBGxdXr2I9E+nWE/OYMHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795329978;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=BU1KJppj+EFVZ6bNvS7g2mTTKyI1Mqe3Kr0MuJ8/KAA=;
	b=x+wLcq+ehyCRw3+8z+TuNbS1bjEx0hXb9dSdI+zRyXJNp+5tbwyCdeM+K5B2nFcG43G2
	 2OJUMegDiLRilYKdsqNB6SMsUbbW4iO2toJT1CN6OFBx8vpbbo/nVyETMV5VwNW6ckE4Z
	 lQ2dk2WywXKb4P5GnMVVNiu9lukeht9qGGeqNTKL1DDezIYNYML4XpPryL235QSM1VJ/1
	 K+jPgE7/vLjUK4skAA3jP1Psn/hglU4+tDEvJNbrNCL+6pBFDgcBtrtFUZ0tk+kxA3Oac
	 rDyIixZYlWRMLEUR+emAOlvjJ/K2Ukvuojv8fD/6EgXmC44Nk7NxqzOr+rS/c3MCksQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SWACsV7q;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IWc0QVXn;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA527606A332
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 06:46:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA527606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SWACsV7q;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IWc0QVXn
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AM3kiCZ2085257
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 06:46:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BU1KJppj+EFVZ6bNvS7g2mTTKyI1Mqe3Kr0MuJ8/KAA=; b=SWACsV7qf/n5Xnww
	P84lp5jrNi/GbgHq/1teqN7WHATXVlbKhtPCSLMXE1pR20jhPjWcZUFODyy2EapY
	G6ArThlczpNOx/EYHpLvgBMwc0ecjhPWOSzUxEh+5HJdPnb83XNM7zmkEFrJD0UM
	CXBjweTwbt03aDPt9BvDdc1fJczUCBitHK76Qp3wuHOBBxOISuV48m9bUQr7d0R6
	MJL7sVT6lSztHVsRWd0Y+KFFMy3gRq7/x/T9DmG8aHgCSpHvSvL/C/igf6HCxw7y
	Mfx0XplrOyBF9Z43l39BplMHmg5uzN8524o7rvGeHXDuS56CYR0d96BVVOJk0Zrb
	tlUyMA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j32mgaxh4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 06:46:16 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-386a0f79047so1240701eec.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Nov 2026 22:46:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795329976; x=1795934776; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BU1KJppj+EFVZ6bNvS7g2mTTKyI1Mqe3Kr0MuJ8/KAA=;
        b=IWc0QVXn6ZnwawKBU9LwEXwElrX8kIpw7baWynhovZgmWbX6xr99n0qMrrZUXoxSyb
         Tu3V55siyAnjvanaVJrltvVCaYcWLrUq4qEnavTtKTVG8sIUtQZ+ThRmseNPAMfa8pYq
         WlF/1y+WaPXgzxPUhczouyjX9CKAEMgjNoCRbFqougdyuDL5BtkvbtwvSjAv+tQDiL2S
         baV96G5AeY7LHXXX/l81Z4ScqkOQ60/teISXKrRdPRqOgLsC9OJNMaGX50lRPJbkGJbf
         xsgSMHV9RyEbVkca8Yg3bfnAeJ6QGvISiLNi6w8NwuHG8cpaOftE7PdNfIbwDrz/E1tC
         2mgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795329976; x=1795934776;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BU1KJppj+EFVZ6bNvS7g2mTTKyI1Mqe3Kr0MuJ8/KAA=;
        b=Ow8fK/MlTgU/LyqZLyHLg5Z66zbXRtlZ9Cf6ZXQZ9NLiWUBQcZq/ePmZRgW45r9E/h
         huqJiVvV0DTmryA32bdxiww+czDAtjwRYRcRDl4qzaKB4kE9nduLJfCvgK9weZnAQGLN
         Lv0j5sXxxKGIerOHgj8hZeSa+5tWRax0VHJo4CyxcDTTdqSKv6XXrhReBOE2LhedSd7j
         RAXMW4VM4NpM+VABmgS8rj1B+S8E2b2RRYz5+JLT/pUoaXUA6Q7jfetXYu19ho0aLyrg
         V8pIJxCccBjfVmAn1uPPYQEXIFTsLvcqqsYUSD1bwSgXHGiBLTxrUNaMIecLQEyIvyqu
         AdQA==
X-Forwarded-Encrypted: i=1; AL+hErF2rvhQOlg3H6irz01F5vYi+bcwbEgt0BFCTYquC6xrNqjEO/9OWvU8ne0+IXXy2RKxv6aUpDuqbmriaS4h@vger.kernel.org
X-Gm-Message-State: APuU4Z/Fi+upU09woN3LCQJrESMp8+IXr9uujrOZt8hKOvh8nUWcDZ64
	SxYtzbX8xU/x2wi+OeuMyDYluKrW2UANDNRNHZO8/JNVD8FS6gdx0ZfTBG7t+OeC1VY0Jtnzd3k
	ueHTbxntREImySQGYaQIpj68o0SBH3xmn79OP9YmH2qRqccg8KRmNglKqkq7+3DN2W58t
X-Gm-Gg: AZFdTZemG2fm9cOoL7WuhQTHhbqJs4Lni2/RVC4gdBKxw1WkAQA0gTTAiMJtirQEMKe
	eSntuRY2H4QyMgdwpsyu/tsa7c9IuqdMyGGA9oiNmppdLEf0i3DQ467qpecn/JmYGk4lpDK1+yK
	eXF1DWpBH00dGle2eq1ZrPHzHE20VUnB2gdyuXl4glRXm2JGq4msGu8hoRxH9vqltXhLcihQXRG
	tLUr+FpzSSKfdTjIZOgRr7awsLV6tcQzs6iMPEfAMXjjghtICZ2DHCVZIEd1+rt88J4NZG12YbT
	r9tiusY4OryHRsIe6d2tS+5Jhd+zC/mw3ZCvAhdlVI5y9bsyQmxbItvtPy1TzFUsCMOUfcaxJ9f
	LICi7ue0eubMAQvK7myABnUCJ1eKSUp98R7LLJ2kfmZYrOlD6y0+VOpn5rx5ral+IVff0HHCf1i
	Zj+XPGDQEZ
X-Received: by 2002:a05:7300:1c95:b0:385:8851:fa4a with SMTP id 5a478bee46e88-385885211c2mr8048090eec.6.1795329975658;
        Sat, 21 Nov 2026 22:46:15 -0800 (PST)
X-Received: by 2002:a05:7300:1c95:b0:385:8851:fa4a with SMTP id 5a478bee46e88-385885211c2mr8048074eec.6.1795329975209;
        Sat, 21 Nov 2026 22:46:15 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd40c5sm27598615eec.10.2026.11.21.22.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 22:46:14 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Sun, 22 Nov 2026 12:15:53 +0530
Subject: [PATCH v2 3/4] arm64: dts: qcom: glymur-crd: Describe the PCIe M.2
 Key B connector
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
Message-Id: <20261122-pcie6_fix-v2-3-2e0fe615d90b@oss.qualcomm.com>
References: <20261122-pcie6_fix-v2-0-2e0fe615d90b@oss.qualcomm.com>
In-Reply-To: <20261122-pcie6_fix-v2-0-2e0fe615d90b@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, alchark@flipper.net,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795329955; l=1688;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=oq8zhKS9moEyY2HIBaNOt8Yw7IX2tNA31iC0e7kAduY=;
 b=6wZ35/tRdGHjnolfMROOPzdthaL4bnmCxAVAPH5KXtRoRWFfo7Mcz6FgTU/YtTRrjGO3/yi/+
 /Nn1XxCSGp/CEfyu93Nc7FqD98YaAAdFCfW4DADs29yQk03MJmnWHC6
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDAyNiBTYWx0ZWRfX7NzhAsUz/cfW
 YKrb19DyGLbSHFvUVkPaaNLpxhjUWhufespFB//qClHtFw9+jxPPtFelGFFs1rPWL8c+IQxHHUZ
 lDjk0//F03/KqginWy2a4CW2YVXeQn2YxAIOyxSJQtjCFfDtZUNLz7hw2+Y7Jk6wF1tMfsJSuTM
 wN55vSdSBwW8UVEoSgnaWCVtOpFrd+iM+n1M+K2bzVmKnHIpLJXCP4l5cEQNCrM772ZTOyL/dYa
 rITAMK7Jxw8vTzS5+F3tdGIbqwi/do4TukyW5HfioNUZvd3zc4QBpqIeLmndfzDWbbqQW/IhG+M
 I22oa6WPCtTRGXxE4kPBYqbjVD+66RUD0AnPqEHDdkUi/CHKY0MdpWIdGaPg4f6r8+jYREAvuJG
 7yuv5ci5AIVenXy6CW4m5DwIOo3IpCLc6HqKoIsTrRHh+nQ6TvhSe0NFvYIxbBlLPZibzuX7OBt
 oWeWa4pdqTJLwAWsPWQ==
X-Authority-Analysis: v=2.4 cv=OM+yTiaB c=1 sm=1 tr=0 ts=6b028fb8 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=_k9ig2nQFDp-gxZIyLcA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDAyNiBTYWx0ZWRfX6w9Ku2GW1uga
 +02OkbcPfmEKA6Fsy+XemANY2094sjuT5EeURXpaZz9O+ZZGdugL3XuscJh5nGwJDN5IxAbreYf
 oZn05/5HOp837UuNRiS7IqGv3soV5DI=
X-Proofpoint-GUID: zeyTGQH_qYBSQQTD8aW77lPbE-7Vlynm
X-Proofpoint-ORIG-GUID: zeyTGQH_qYBSQQTD8aW77lPbE-7Vlynm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_01,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611220026

The Glymur CRD has a WWAN M.2 slot connected to PCIe6, whose vreg_wwan
supply is described on the PCIe6 Root Port. Describe the slot as a PCIe
M.2 Mechanical Key B connector that owns the supply, so that the slot
power is controlled through the pwrseq-pcie-m2 driver and the PCI
pwrctrl framework, like the other M.2 connectors on this platform.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 29 +++++++++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index 3a9cd5f3ec2b..a66ba8c0ac8c 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -230,6 +230,27 @@ vreg_wwan: regulator-wwan {
 		pinctrl-names = "default";
 	};
 
+	wwan-connector {
+		compatible = "pcie-m2-b-connector";
+		vpcie3v3-supply = <&vreg_wwan>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				wwan_m2_pcie_ep: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&pcie6_port0_ep>;
+				};
+			};
+		};
+	};
+
 	sound {
 		compatible = "qcom,glymur-sndcard";
 		model = "GLYMUR-CRD";
@@ -654,10 +675,14 @@ &pcie6_phy {
 };
 
 &pcie6_port0 {
-	vpcie3v3-supply = <&vreg_wwan>;
-
 	reset-gpios = <&tlmm 149 GPIO_ACTIVE_LOW>;
 	wake-gpios = <&tlmm 151 GPIO_ACTIVE_LOW>;
+
+	port {
+		pcie6_port0_ep: endpoint {
+			remote-endpoint = <&wwan_m2_pcie_ep>;
+		};
+	};
 };
 
 &pmh0110_f_e1_gpios {

-- 
2.34.1

