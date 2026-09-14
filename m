Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7283A3B2FE4
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789370416; cv=none; b=dFSk22IZ9ePVaV+67OBofGbktqZVq/ASG0ORoJxuSvC+anQmkmcpC+/CiHQPLYCRBllHmz29CIwmzrpYNQx9+iWnUBy7FA5nvaEAnR1zXIa4J1sv8vrNqSGByphnA2Z//0WUjDpnyR31q8V42DCH5SXjO6VIPXS9J+e9DaI2abM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789370416; c=relaxed/simple;
	bh=0Dlj55dN3ldy8GK2h2cIof9VUS9RrJVjegi6K0eLVDw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AqDnrzwQ7pR2eJHlXEVdkOpUrEew1AITIuDT1uJki1UUNWHpoyZxpW2QaQ3OM21psWlMZ9OnL7d01HOCwx6KTC4xWxDC7O76GjKUmk0o0sVo6rqXYiYuMX58F0Nr0NyfK4YGlZOf3gPkSSlETbBlbmhEEWYjcrVpMfd+DKQlqy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JgGTO1EM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FwV0ke7O; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JgGTO1EM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FwV0ke7O"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5ii8k3368886
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:20:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=1wyaSbPziNm
	UY9eFlBEbV2JMTIhaQ9KS7++vm1XlY0Q=; b=JgGTO1EMCNQeg78mFKCP+1IZomu
	WLP62YhVCgUUC9tEsDYUZS0zb0JheJ0enlWBVHsqhcMepkmdfGTxH7oRD4+cosZR
	i18KCSlJ5ScO703mdQhx8XWZh9umTxO4/tp0CCmHXI9pHYqEgcBmAHxSxfC0DAwJ
	LqBxnSotzAIiTY4WUDupDEpJVqlOQGb+vazmIOfAXH3HViJRlVqAl5AY7aLl/l6p
	scyfDDUC+5d3E7mAnvskuQYHot/W+cccLaHXb8a4R7aQZSfk7p6EV1X8rCt1TDgA
	WaxpEMaLB4+FtqVqum6EJkl0pkZhlN0N5TQ/bJTknzjhOhtFWM7ICpRK0SQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmygd5gkw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:20:14 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d932ef41c4so50700505ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 00:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789370414; x=1789975214; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1wyaSbPziNmUY9eFlBEbV2JMTIhaQ9KS7++vm1XlY0Q=;
        b=FwV0ke7OfmvpAQLP9sPFYR2J9acYSivVlT69U0g+0sFB6owbb+M5CryhV0LKO8Roa1
         fWrKnR/Aal9bNWaOWphlkwgz0H8D/GedttFhgwUz/Vtm/7WGXpS+t3CIClFslyOQ11uw
         GWg3MDQ+A4teacbfb3XyWM8lkERIta4x8nDXTaPnrabt7UHnRcYfsHU9gTHEJK82urrQ
         DdsPmqrovClYNcMSn7ozmhfxgqkf0oP80TQCK3srAgJsq2ehSSG+L4KBQ96u5fNMkf4u
         aiBthhmZEOoLMqVBt8wMpcUFUVK9rMlwcaAzphO59veSOT2SfLEN9YtE6gQozXsYn4dU
         ROcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789370414; x=1789975214;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1wyaSbPziNmUY9eFlBEbV2JMTIhaQ9KS7++vm1XlY0Q=;
        b=bg96BpAObB2JOon9JEY/AXX2fJYDbAPK1AM54BAOHXcvaveq6BBSXBk2XmZqnUzYQw
         8ZTy4m//7E6TlyZ6ZEJhOIPKGhaXhQCVXRIw/rrn49icks56EBQZ9+J8I4yyjtvy4a/E
         +dEb92QA6Ijv+AnknXFlOl7MbCbhXuo5UoDj7wJg9Azg1LqAf6ds/xB9ghxTdGnh8b0U
         NZUmmLsVnqGF3bz1nzkYbE/KUrsHV5KFAKRb4nH34kZdpNs8zvlrwLplJXCymSYyGUGo
         N7tcdI6qf0EffOucE0V6PY3u7l2d6ucIIAtTSsAujTadkuCIrrHZiPFJSXGhLi9OdJ9I
         Ua+Q==
X-Forwarded-Encrypted: i=1; AKwUvBxAv922MUhkItyO4iBOH/Y21SqwEMmC/76P/CtsSV2awb5TrQ9+j9rpNadWriCp96UHUsA6SSrgFextPzXO@vger.kernel.org
X-Gm-Message-State: AFuF++kX+gvAF/zQ9s3OxwHI1N5IvXx0KT/xuVY1UoVWl+jD4Lo2YHZA
	7YDBiBMqRlwfAXimePQdF+6WHEEc8Gx/Pk9eFijvbYO7uP3fmzL9H1RXEOo+d1W+LvFI9DRyjtf
	Y1BlDHvcVIaX7OdNPlRLsmvCGUZQH3fo7ZAO3vXWI191LZ1eA0mRNpF8VhT4b1YfgG9Wa
X-Gm-Gg: AYBFou0xH8egoXVd12TMPDfjGFoU7Ou58fx8Ps2w6IudiRE3ZnokqKIc4yfo+Mhq70x
	ZJeURMIvrQPzM6h2Foi83k4u17YMH7FgOENJXlU6RLZTSIFSm2drg5zCba/XYpCdLYyOaiHHA3O
	CzyhA/HMO44kDCq3W65Xav1NnKGvCRULBwZWWKDd/fvhJT7bCF0ZrlAthgyzS0BO2PNBiOO9owH
	GEvAw/fAz1rlhvoB8lrOBSIo9O1/HL22Lpf7Jzl/5c2cFg75r0+qdvcmSP5NsblgXUypGGcACoB
	jlfA3JIEIJo5tosTvZnLRNaXQYk4jqM6C+ovRLVZYmXOiDsBSBKXuZAILAx9Ijk35SPMw5Ky9OD
	ukB1mn1i0u/ntduKQDy5rK0uHuboy6NIAZ/37jeuyBjGqQpglwGxtk9LZGn2P
X-Received: by 2002:a17:903:380e:b0:2d8:d4d2:d135 with SMTP id d9443c01a7336-2dd5f1940f2mr62466525ad.17.1789370413923;
        Mon, 14 Sep 2026 00:20:13 -0700 (PDT)
X-Received: by 2002:a17:903:380e:b0:2d8:d4d2:d135 with SMTP id d9443c01a7336-2dd5f1940f2mr62465175ad.17.1789370412517;
        Mon, 14 Sep 2026 00:20:12 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bc03778c7sm14782238eec.9.2026.09.14.00.20.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:20:12 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 5/5] arm64: dts: qcom: nord-rrd: Add WCN7850 WLAN support
Date: Mon, 14 Sep 2026 15:19:44 +0800
Message-ID: <20260914071944.164217-6-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914071944.164217-1-shengchao.guo@oss.qualcomm.com>
References: <20260914071944.164217-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RY0FmFtv c=1 sm=1 tr=0 ts=6aa7a02e cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=3uEAWm1Q5IaYrG0nJHIA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEwMyBTYWx0ZWRfXzzVsnrRVmKE9
 J55oIV52rH9bON3U6EAcJZ44xFL7dhv5eVXUvRQYzPzVsbLrWWh2Kns6bl/kzmf3LbOWb52Yx4h
 QJKMDOPuxS0Zpg8BQ2e2u8gmHHP5bPA/8HInefnaIqhHvStyNWfnN5x+YOAUuf1m5JXfpfX3AHY
 rgS93VYpC+wl0j8IZ2lt7J73isOtu9kiHMoCFlkhnhCrlW/oRPYTHZLh8AGzUFOOeZthvDH7oJf
 0Qq//ccFGBJrAbPNj9pdFtx1Pvwu/xXVx4qacqqmJy6Pz1QsmOKdjdrAVbevxkKyaLoDPU/g4Cc
 VOr+axP8gWLu16GcXWptwGO3yaIzkffAgGasnTi0xLqpoucYXL0GHiPeyuKmlWT1U4mXdtsyFQQ
 ynUNN6uya9Ju/6f7LKAZTjEc90C9hW0qMr0+YYyZdGFq3igGOv8g/iDOBSkgNlHCrXUmiMkzVyx
 N93RL69Hi+gwj/ZwDMA==
X-Proofpoint-ORIG-GUID: 5Jc63bNBsskNiOMee44joXgjW151-Pn7
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEwMyBTYWx0ZWRfX8q2oARqMhgoO
 KpaOXAHBRh/a5lBx5BR69oxq8djN/XWldRTWI7IE7dwPrzIac8j5f1c76HNhE19B6NxCFjA9ulx
 axYG+Y/LBAWv6tS1PZr0lo0AURf+Byg=
X-Proofpoint-GUID: 5Jc63bNBsskNiOMee44joXgjW151-Pn7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140103

The IQ10 Robotics Reference Design carries a Hamilton (WCN7850) module on
a board-to-board connector hanging off PCIe2, using two lanes.

Unlike the Ride Embedded board, the RRD generates the module supplies
itself rather than relying on the module DBUs: three discrete buck
converters produce VDD_CORE_VL, VDD_CORE_VM and VDD_CORE_VH (0.95 V,
1.35 V and 1.95 V), all gated by WLAN0_CORE_PWR_EN on pmau0102_e GPIO6,
while the 3.3 V and 1.8 V I/O rails are strapped to the always-on
peripheral rails.  WLAN0_EN on pmau0102_e GPIO10 releases the module
itself.

Describe those rails, the WCN7850 PMU that derives the chip supplies from
them, and the PCIe endpoint node consuming the PMU outputs.

Assisted-by: LLM
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-rrd.dts | 109 ++++++++++++++++++++++++++
 1 file changed, 109 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-rrd.dts b/arch/arm64/boot/dts/qcom/nord-rrd.dts
index 4c4d54d7aa90..c8a6df21fa87 100644
--- a/arch/arm64/boot/dts/qcom/nord-rrd.dts
+++ b/arch/arm64/boot/dts/qcom/nord-rrd.dts
@@ -53,6 +53,100 @@ bi_tcxo_ao_div2: bi-tcxo-ao-div2-clk {
 			clock-div = <2>;
 		};
 	};
+
+	vreg_wcn_3p3: regulator-wcn-3p3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_wcn_3p3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+
+	vreg_wcn_vddio_1p8: regulator-wcn-vddio-1p8 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_wcn_vddio_1p8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+	};
+
+	vreg_wcn_core_vl_0p95: regulator-wcn-core-vl-0p95 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_wcn_core_vl_0p95";
+		regulator-min-microvolt = <950000>;
+		regulator-max-microvolt = <950000>;
+		gpio = <&pmau0102_e_gpios 6 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	vreg_wcn_core_vm_1p35: regulator-wcn-core-vm-1p35 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_wcn_core_vm_1p35";
+		regulator-min-microvolt = <1350000>;
+		regulator-max-microvolt = <1350000>;
+		gpio = <&pmau0102_e_gpios 6 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	vreg_wcn_core_vh_1p95: regulator-wcn-core-vh-1p95 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_wcn_core_vh_1p95";
+		regulator-min-microvolt = <1950000>;
+		regulator-max-microvolt = <1950000>;
+		gpio = <&pmau0102_e_gpios 6 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	wcn7850-pmu {
+		compatible = "qcom,wcn7850-pmu";
+
+		wlan-enable-gpios = <&pmau0102_e_gpios 10 GPIO_ACTIVE_HIGH>;
+
+		vdd-supply = <&vreg_wcn_3p3>;
+		vddio-supply = <&vreg_wcn_vddio_1p8>;
+		vddaon-supply = <&vreg_wcn_core_vl_0p95>;
+		vdddig-supply = <&vreg_wcn_core_vl_0p95>;
+		vddrfa1p2-supply = <&vreg_wcn_core_vm_1p35>;
+		vddrfa1p8-supply = <&vreg_wcn_core_vh_1p95>;
+
+		regulators {
+			vreg_pmu_rfa_cmn: ldo0 {
+				regulator-name = "vreg_pmu_rfa_cmn";
+			};
+
+			vreg_pmu_aon_0p59: ldo1 {
+				regulator-name = "vreg_pmu_aon_0p59";
+			};
+
+			vreg_pmu_wlcx_0p8: ldo2 {
+				regulator-name = "vreg_pmu_wlcx_0p8";
+			};
+
+			vreg_pmu_wlmx_0p85: ldo3 {
+				regulator-name = "vreg_pmu_wlmx_0p85";
+			};
+
+			vreg_pmu_rfa_0p8: ldo5 {
+				regulator-name = "vreg_pmu_rfa_0p8";
+			};
+
+			vreg_pmu_rfa_1p2: ldo6 {
+				regulator-name = "vreg_pmu_rfa_1p2";
+			};
+
+			vreg_pmu_rfa_1p8: ldo7 {
+				regulator-name = "vreg_pmu_rfa_1p8";
+			};
+
+			vreg_pmu_pcie_0p9: ldo8 {
+				regulator-name = "vreg_pmu_pcie_0p9";
+			};
+
+			vreg_pmu_pcie_1p8: ldo9 {
+				regulator-name = "vreg_pmu_pcie_1p8";
+			};
+		};
+	};
 };
 
 &apps_rsc {
@@ -415,6 +509,21 @@ &pcie2 {
 &pcie2_port0 {
 	reset-gpios = <&tlmm 8 GPIO_ACTIVE_LOW>;
 	wake-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
+
+	wifi@0 {
+		compatible = "pci17cb,1107";
+		reg = <0x10000 0x0 0x0 0x0 0x0>;
+
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
+		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
+		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
+	};
 };
 
 &pcie3 {
-- 
2.43.0

