Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F704582CA
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 08:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789459882; cv=none; b=BQB5EX9SJJZ46sHWxWCxGgZGFJVPgcLV4SuVZDnnij8wjBm2qp1jW68thHAA2k/ASKvb2n+u/jUpy/lnhdVK4QB/pOZGztciHKTkrWrIlfW9Jfa0Go930FeiVf2IxUBR5xQvOJSVskQ+IS7r/ZXzaUhjQAn84C4R5EtsGhCTIF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789459882; c=relaxed/simple;
	bh=HmeR1l9JD8JvYgGsyzO5QvZGodxO5bhsmjCW69cOhmI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ahoLJNIyjeYAWuh4XbReuM8a76rCrW7jxt4ima22gaPzMdOUN+Csf6KnQsBlI2/Zi81fcOrm4/Pnv45u8akeB7Zkd41JKNXqjSF2BJ/XbkbJOuA/ugBbVDHYaYkxHROVMqkKWPycqYwmZe5dcFprqD45cxI7h8bq1R5r7wD09Mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aIi36j+s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GiOxeSKb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aIi36j+s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GiOxeSKb"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F6ZBMl2249697
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 08:11:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vjzv0biNUKG1BiKaowTeTkIFJcvCjq/9OvYidNdvtc8=; b=aIi36j+st9gZVvrb
	ErRGyNU2eK7VVNcvwRmJfRH3OVuvPJBZSAkW0D6VKkHd/VLe4cVXZ62PoK5j+qQi
	p6jIe82LCC4eXs9e8GHxFwrW6RMos5MaQPCst/4Jy3grSoV84Ha9rgWrr1Llk5a/
	Eoq1ckVcKvoXat70WJNoOYz5EbUUg8hVDKMP/baeeCeI3R5hksYOIf8jg7xmfTPj
	+KcjWcetp2ZJKR3lOe6d52h0V4mE6S1f89AI25CWOgYqViIjBxm47zuXztapeQ84
	S0iqQth2ogLPEimVfGHNZi8jJkyzwfjbRQauEC5eLOJ4p8PeMdilgYRnpLa244pX
	lbm7Ig==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpye70qvm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 08:11:18 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a3f673221so6308285a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 01:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789459878; x=1790064678; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vjzv0biNUKG1BiKaowTeTkIFJcvCjq/9OvYidNdvtc8=;
        b=GiOxeSKbpiAkbTZw5QLwKb95ImXSD55kWeWjqydT4ck2KPt91QmgxSM3FZyeeeBe+E
         TmaXLDdOVAjLLcUzk24C9+QqnR4L0Lhh8iFIEHHV2b+VqSWyQA6U8rvmlKNH1yfg0XB7
         n6d6LfeI7K5AXhG7xNTnzr2Mpj1CxSz47BT1xHSuF1l0hsq2WrzvNXYZ8+JOyYhu/JXe
         RuKZu+JbfGle7XwxysLai34X/6BSs6fl/xh5HYc/5gnUD7W4jCfKzkU2DLsOJ6nCi+NG
         haGWmeQ0cZLk9UYkZPUuS1J5IL+epPmBnQFlIFD8k/fb8AwgusD7O1xmgUdDOWIks983
         VrnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789459878; x=1790064678;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vjzv0biNUKG1BiKaowTeTkIFJcvCjq/9OvYidNdvtc8=;
        b=oOddav+6Zy75cnUhNOACDbsI9T6w1NmcEPbT/i5wTgctHRSLf0X8c1re7sLCnUejU9
         5jIvyrUBU39CQWubcvfg9Pm6y6PrdCishkIi69s3Y/3ka+oO2VFtTmd+rcW0HihOITrG
         7D9bNKzO99s4caJ3vKlv+xM8DzBJGbDMSdS0xcdvGrjwwDuRH/TEC3F1/2hDwULdvsoN
         xwZ9WUQMS88kVL/NzFy8o6ZbHCzwrYYnw4jtEffyi04xCO8STrdeV0HkMT4wuJPQNJUm
         W/YsH3+SoZMgGaM90yRJ9hp2m1BRvfI7qdiCpkJFdTXd/0JS6a0Jzmze9cDMK8alF12A
         nO3Q==
X-Forwarded-Encrypted: i=1; AKwUvBwYPl1BGYaJyqFYRg9xzXvLU0cWMBavhyR+FzhyxXSmdj+7euWIgPGNdNTX2gn6VZ+TSYc8qK34nbJcV1iZ@vger.kernel.org
X-Gm-Message-State: AFuF++kYjntuvNN/dcTvU6eXZ2xUz5OopmShEgp2YyZ0yd3/omCreoAQ
	EZqGCvyn7Il+StL8HApM0g+i5XryAc+R8pOjSbqv6GXGUpv8T53xdoMSIsLV7oxM66rkvSKfpiI
	7aD0GVQ4SGnopHfaDRjHUFsdpYDKRBKrNpKcVw5KRxuJXO3YKH5a7zK7xybNGUvh70nVe
X-Gm-Gg: AYBFou3pdFv8U0a2+lYr/Xfl/rfVtpab7SULZ1t0iJ+IeEIQNqzZVNHgiEVsgvMe0ak
	3QY9ur5HHcIOoGiqtQZ88eXkwv1uPVn6WM6wJPsotrMTqu1Kb19jZT4tBLy+axgYuVWoMuH9HWa
	HzMCIa8vbe1oVDleSmtO3Qvqr9QObmP+gkixWW/sLEAn2zUa4a2u8naxeF+wsNWcdVp3b03P3tQ
	RBlzkTi0W8fK3yS2BGtvImNMn/AQ84oqio8bpCIO4ZoVpOZPk8ezf++JERtIkeKhcTPC1R+GxiV
	6rQ5QS9PhuqgDX1vWohUwNt4s4/7a8CMRNP3HG6FLSmivqTFoo/HbtggXgVbrtTSe6Fb+CrcnzI
	uymaf1TvcvHauXOe7czpwsBsYA4uQhDzZMCAR4fa7bODdg4aXGSUtXc4o1GeF35dLLuGkfVJpqU
	FVo1GfM+tzerKLpW9dWhK2DQwg6ZbOMiDa7kfPk9Pp6bzAfKpTZ3U=
X-Received: by 2002:a05:620a:31a8:b0:939:e650:c80 with SMTP id af79cd13be357-93a29a9483emr898345885a.39.1789459877704;
        Tue, 15 Sep 2026 01:11:17 -0700 (PDT)
X-Received: by 2002:a05:620a:31a8:b0:939:e650:c80 with SMTP id af79cd13be357-93a29a9483emr898340385a.39.1789459877157;
        Tue, 15 Sep 2026 01:11:17 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:7034:b557:872c:5602])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d292d3csm48847885e9.4.2026.09.15.01.11.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:11:16 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 10:11:10 +0200
Subject: [PATCH v7 7/9] arm64: dts: qcom: agatti: Add OPE node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-camss-isp-ope-v7-7-77b13d131d3d@oss.qualcomm.com>
References: <20260915-camss-isp-ope-v7-0-77b13d131d3d@oss.qualcomm.com>
In-Reply-To: <20260915-camss-isp-ope-v7-0-77b13d131d3d@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDExNiBTYWx0ZWRfXz+sEPBDJ41kq
 LvYCBMjoS4MbQ+Y2RFTS8pWNUTuXWilxBlsSPJkablQ+Z3JzNN83kIRc/yoV5YLrIVbNBly6CPj
 Easc4vjgt51DJ9CdRoNgsr31PNiT8i+OEnTc6+Ld0HNRhW8G4bhhUCQC08HY2MJBo3pshxhCvFU
 kOxeoCJ0WZ1GFYVmDSkZ9HWvXM1Epj+quhIUqhuD2bqPSfRl93fVQsLDvG8A+VQ+Dgt2W1PukP7
 KU8JRAbLgQTFLHf+uXXgMyIsv/OhrIVADgIdUt//XZrKc5cPmv98Mwg1Lxr4KTqVDbB09taB/tV
 6p0tcPdwPc4w+cdLtVH4zbzssjHPD9XmMMzaTMl2F3GJecV5xinYvG1YqHYdUJ3J5ohCrj67KNc
 zD0IywqEe5Cd++/RNKUINetJfcJs96qsVyT7LzqGtp3ofm4sleIYiWi06/RVEiP3JeCJRlbqpTK
 +upFBDmGw3UPtnV+Gzw==
X-Proofpoint-GUID: uRmPGgqiGW__nEzN8cP3AntMQ76N8b_s
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDExNiBTYWx0ZWRfX3duLe9fL32cB
 jcKv7m7tDI88cVz5RtXRCY/LJ7/X47wjM1LjHpasvTsWw4A0e5a96tmeKwDcQSZ/IWU6ZPVm16J
 oBoyFFJwkkJkdIyurwsB/MQm62FVlTc=
X-Authority-Analysis: v=2.4 cv=fck4WEQF c=1 sm=1 tr=0 ts=6aa8fda6 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=1BEw5LmG3YzgyHxDt7YA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: uRmPGgqiGW__nEzN8cP3AntMQ76N8b_s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 malwarescore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150116

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
index 397d61a8a27c2505833466bd349acc27ef4ffe0c..7746c58b5b1cb25206e72b888b7559cfe27553b9 100644
--- a/arch/arm64/boot/dts/qcom/agatti.dtsi
+++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
@@ -2020,6 +2020,83 @@ port@1 {
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

