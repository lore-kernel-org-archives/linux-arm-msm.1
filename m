Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793973350;
	b=WlLHKtzK7bOaVulZQkrIvs4ryVI+wqJdPKl8Z7Z29MaSJMIs43A7TnNqv3qJ/NxbFCuX
	 uVB/uRuQYX3tJSbPIPgNB+EtSdrQR4i6XmJqhrWTeI2EkKYcdiwtkIvo5bvLOaGbr3UTO
	 1QTbPGFk5iFswAsXi0sMLZiu6b7b04nKE/IKHjVI0WARpdQsHe6L7+d1rWRmIdhpA4UZ/
	 TyFt6E5VAjjhybMN8Bzo0SYxAQY5KaYPpdWIdTvERNZV8J54jKf8GYrs7pdyeE7nQt1mI
	 ruX0GyviNe0ht7QQbujIvIIEbHccCFn1l3OyDTtl0siKlepNqXjsLQRj+TGv+NEoXqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793973350;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=2Yqb8w77911HPId3dxP6CpINfJB91u8DEDhhhf4QlPo=;
	b=S6rA0ZJ9G59OvxNpyfrwXmR5xX5ooTwUEcEotztKR1smmLxNG79Xo03EhaPCr7/V7SK5
	 3m7MIc7kl/2y9LbYF5OriVhBzGe1m4Y3B14hHjkNNO6G9MWRTqlSvAfTlTyF4D3mxeWt0
	 o5AQQteBKWVRyKOuKZCb8Gzye6BjrQdlqAI8p4A8v+ZKJof3/QcnHRH+ISaQUnyeDUFkk
	 8V4OtpV/Jv8UPSab2Tqln3DxSnJ0fxvrymvGAeHpP1bLTLpdeZo26LYHLWBgJu/zbMsd2
	 AcTXSW/nsh9gNJr/6vYaDyttzrjNns7oIcCakKDL5HJZS7Cm0ubXfSNz259Th11+gfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jxn+JniY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gV0rs5ID;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 953F4606EE85
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 13:55:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 953F4606EE85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jxn+JniY;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gV0rs5ID
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6Do8ok971121
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Nov 2026 13:55:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2Yqb8w77911HPId3dxP6CpINfJB91u8DEDhhhf4QlPo=; b=jxn+JniYsCFj/stj
	xvpwoWFejI+khyaQAgnagsSgozbS5/h+auWYJnowJ+fdG6dAiTBwal1ofcS2T2GY
	jS0dimesCc4n4jd9/FaiknhQHNPTVkxiB2yN0iCdIgzBrCj9/AqO90VntzO6yzaz
	LaIdPMmDdBTrCQCFIRq5EStU0xISBiQXSCZTGGKMA7NR+akVt4ceP5zaosWEJb1u
	+tpR4xz2r52PeUATkkvI98LyP8kYifR4eWVU9KhN85EKiQzvIyY0IXjlqljttF1u
	zMZUtGSFzqN6rW2PzcVgtZUGtdXUHcGltgDDqhV/+SQ5fLtHcRWHwGlgYdOIl8/6
	P6CXCA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9u127-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 13:55:48 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-999a240f2e1so33281241.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 05:55:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793973348; x=1794578148; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2Yqb8w77911HPId3dxP6CpINfJB91u8DEDhhhf4QlPo=;
        b=gV0rs5IDq01G2Doh5Xat4k5dbAE3lDAi/ifbWFOSAY89u1OJk5kPb+iMYkzPncisl7
         grAQIfuDZpScOYqmzTfkRLfci1dc1kYRtfkHFMmEVUkIgGOs9gD3iiaSiTTGchnv3DIA
         ZwTrntWognJ6O17mJBNaw7RFO8CGUrf/WwL+L7chqwAroutnGoHOkd5wghXBFarz7ahe
         FjNJtHipXLuE1qewmKvXvx742lH/80baixYNX+iufaRz/+NOU/H4sqPXVkLHVVGeOR5u
         gzjhu3vy5Q4sq3L3FBKTjS/bYAH5y/nT+VG0Xv20hyZpBZWgDZLLQ+gKta9/oxATP3s2
         0GIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793973348; x=1794578148;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2Yqb8w77911HPId3dxP6CpINfJB91u8DEDhhhf4QlPo=;
        b=PSiIjDUy4YXkUbrBl/dbFEuog/NZyP2Ct/BvyevzwalGxvMAzCp7+ZHR7tHR4T0kIp
         8oCcv/izrZdjCIvs4EeeJmBbxn8n3mqRtZcFNHZfxixyMsUCltbcCDEBVz2BX0Fqgq+h
         OMWFRFXr/VDioQIyVdfT/u4JMEMpWGQTha6S4qFx8NCYmFPsFQfHV1an3QPWTiy5ECGP
         Yz9Aa4rkXpikJnKDWedpuE++jrdCx3vu08vVXFrt4c+NXuOzAPjO0dtKbc+F+VnuwIsE
         rBPDf5BfuwR2Xm5HYiHLZT9n4/9FDKwzAX67AxDT2R+LxUp/l5kLoJDsoPRCU5lqAjxu
         b2mQ==
X-Forwarded-Encrypted: i=1; AKwUvBzXWMbRDt2juO9a58OOZKsm9ChVwGfmTPDEGjHwHvYhByMPTpYeAXpavIBEfi1sIZETZEI6cQHU5o6iw6X/@vger.kernel.org
X-Gm-Message-State: APuU4Z9ffUq+BkyhnmbxGJ6FNbc2XGImNlXAzjAPjLhMo4dXKhFtPw6f
	Dc4izvlQhCS8t47SgUeiij3bVewRBP/zDzKTMdw8fIb8KsD6IEFsMATzV7KyZUcheID8+wEU0dt
	ihAgH7UJy7od8okPnktjmD7n/MykQcoLko9xJnuUY2DsrboMczzyZRzx6xP2skKzx4vCm
X-Gm-Gg: AYBFou0wYKr7c+uvLJHxYx191Dq+NKhw0x3jz7drats8ZZuVFmoQmasviOgEwJ4Tbop
	Rf0mF5brsERxmuRaLJG1+x4Y3J/bJoh9EVU8HAvOxVyd6YW2PmO5Pg5lgnDYmojYdycjb7zmLwC
	1fxInualpwULEBOBmicamgXef9/7DRXZlQvUfDiwrw2rn/4TseaprO7rBrMKT8lK4okRe5P0L6d
	bX2KqW3rR6hWoTOych0p4Fb/8cHKX1LAtH1ptSjqZhP/tCohAq1AC7jcGQW+KJLRdoJLYncrPSR
	liQLNqehvYF4lCUEC5IfO/q+lr6dGRR1Gaobpql1K4tXZb1ieTQXvDtxNvCH3ABci+Jv0HGHR1b
	o+P53G7trsqtQeiqH26yRYvdQRavq2bW79UOGcjVAE4s7OP6cQ4pOe66bcEPndkiAtDZ3ErwN7g
	CCxpM7W/bhxz5sFJz1oya6yFt7fsIvRlxR3CBTeQKmOMfWNVj7sLhU2B94Khw2A/NB1Yvy2v4Je
	z+SXrCR4590bmeN3qPz691eVs9P
X-Received: by 2002:a05:6102:3346:b0:7c4:a0e4:1a79 with SMTP id ada2fe7eead31-7d2a15c63d5mr1179470137.19.1793973347676;
        Fri, 06 Nov 2026 05:55:47 -0800 (PST)
X-Received: by 2002:a05:6102:3346:b0:7c4:a0e4:1a79 with SMTP id ada2fe7eead31-7d2a15c63d5mr1179438137.19.1793973347028;
        Fri, 06 Nov 2026 05:55:47 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:f048:3e89:c517:10cd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d809df2dsm3963256f8f.51.2026.11.06.05.55.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 05:55:45 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 14:55:23 +0100
Subject: [PATCH v14 7/9] arm64: dts: qcom: agatti: Add OPE node
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
Message-Id: <20261106-camss-isp-ope-v14-7-49c426cd2715@oss.qualcomm.com>
References: <20261106-camss-isp-ope-v14-0-49c426cd2715@oss.qualcomm.com>
In-Reply-To: <20261106-camss-isp-ope-v14-0-49c426cd2715@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA1NSBTYWx0ZWRfXw7pQ7v8vnXcc
 df9CQaXf3hlFf/wf8plIXHovFTghUBWBwDKcPGPy9oeiipGnxJ2/aN8y3ci1A9bavA1MC42h/wc
 YYpe4HrfIwjB/33dhgaYRqcyc2Uy+mM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA1NSBTYWx0ZWRfX+nVwEqzekNwM
 kq5GstFWz1g4O7EUQlX9xl9i+Ll2jVKv0rhmfp/h3ydHF2+j3/yBxMctzTgTcjHjiwDoJPeseNP
 t87qDw4Eb7HAeOPFNkv9LBCQHt4CFh81Cry6caZ6Xtf/XJWk1TRcwjJnGm4mJYnkOCppS/UrU5C
 jbNkzJ0Qz5CwECNBYsjVf3mbBsgaFGFljc3p/bzFdhJqxrbxU7oAxZhl3ukbfLAScWG/j0EMXkH
 inNBJWNvSg6OFO4UMpYqnboG6RNLwW4O9adup6+a1wuUNTTUW+Ahim7hbrJSVwBCjbAxI1gAPd7
 t+NEnjsFV5MzUcA96gKOFIOKqHZPRuPwj1DxN7T+oDy8gHYkVIYv1SJtVSy5jsuqdC/Gr23+1Sp
 GUR/ZlpWxkQa+5SYrdPpAh/W293lk7LpofdeasAkmB7osOS4intG/IbLqpHSpwhUI4M1HvlwD0k
 ixJ9cReZdFIBQIkSKKQ==
X-Proofpoint-ORIG-GUID: JYYcwgt8Ivq3atW7DO8PtdQyq34R5JY1
X-Authority-Analysis: v=2.4 cv=f6Pdl+yM c=1 sm=1 tr=0 ts=6aeddc64 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=1BEw5LmG3YzgyHxDt7YA:9 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: JYYcwgt8Ivq3atW7DO8PtdQyq34R5JY1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0
 adultscore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060055

Add the Offline Processing Engine (OPE) device tree node for the
Agatti platform (QCM2290). The node describes the six register
regions (cdm, top, qos, pipeline, bus_read, bus_write), clocks,
interrupt, interconnects, IOMMU mappings, and OPP table.

OPE is a memory-to-memory block with no board-level dependencies, so
the node is left enabled for all Agatti boards.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/agatti.dtsi | 77 ++++++++++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
index 32d185d0526ffe109d83fe92d9c54f21bedbbcfd..dacb551fef530b73ca5265eb6aca39b807e82382 100644
--- a/arch/arm64/boot/dts/qcom/agatti.dtsi
+++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
@@ -2026,6 +2026,83 @@ port@1 {
 			};
 		};
 
+		isp_ope: isp@5c42000 {
+			compatible = "qcom,qcm2290-camss-ope";
+
+			reg = <0x0 0x5c42000 0x0 0x400>,
+			      <0x0 0x5c42400 0x0 0x200>,
+			      <0x0 0x5c42600 0x0 0x200>,
+			      <0x0 0x5c42800 0x0 0x4400>,
+			      <0x0 0x5c46c00 0x0 0x190>,
+			      <0x0 0x5c46d90 0x0 0xa00>;
+			reg-names = "cdm",
+				    "top",
+				    "qos",
+				    "pipeline",
+				    "bus_read",
+				    "bus_write";
+
+			clocks = <&gcc GCC_CAMSS_AXI_CLK>,
+				 <&gcc GCC_CAMSS_OPE_CLK>,
+				 <&gcc GCC_CAMSS_OPE_AHB_CLK>,
+				 <&gcc GCC_CAMSS_NRT_AXI_CLK>,
+				 <&gcc GCC_CAMSS_TOP_AHB_CLK>;
+			clock-names = "axi",
+				      "core",
+				      "iface",
+				      "nrt",
+				      "top";
+
+			interrupts = <GIC_SPI 209 IRQ_TYPE_EDGE_RISING>;
+
+			interconnects = <&bimc MASTER_APPSS_PROC RPM_ACTIVE_TAG
+					 &config_noc SLAVE_CAMERA_CFG RPM_ACTIVE_TAG>,
+					<&mmnrt_virt MASTER_CAMNOC_SF RPM_ALWAYS_TAG
+					 &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>;
+			interconnect-names = "config",
+					     "data";
+
+			iommus = <&apps_smmu 0x800 0x0>,
+				 <&apps_smmu 0x820 0x0>,
+				 <&apps_smmu 0x840 0x0>;
+
+			operating-points-v2 = <&ope_opp_table>;
+			power-domains = <&gcc GCC_CAMSS_TOP_GDSC>,
+					<&rpmpd QCM2290_VDDCX>;
+			power-domain-names = "camss",
+					     "cx";
+
+			ope_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-19200000 {
+					opp-hz = /bits/ 64 <19200000>;
+					required-opps = <&rpmpd_opp_min_svs>;
+				};
+
+				opp-200000000 {
+					opp-hz = /bits/ 64 <200000000>;
+					required-opps = <&rpmpd_opp_svs>;
+				};
+
+				opp-266600000 {
+					opp-hz = /bits/ 64 <266600000>;
+					required-opps = <&rpmpd_opp_svs_plus>;
+				};
+
+				opp-465000000 {
+					opp-hz = /bits/ 64 <465000000>;
+					required-opps = <&rpmpd_opp_nom>;
+				};
+
+				opp-580000000 {
+					opp-hz = /bits/ 64 <580000000>;
+					required-opps = <&rpmpd_opp_turbo>;
+					turbo-mode;
+				};
+			};
+		};
+
 		mdss: display-subsystem@5e00000 {
 			compatible = "qcom,qcm2290-mdss";
 			reg = <0x0 0x05e00000 0x0 0x1000>;

-- 
2.34.1

