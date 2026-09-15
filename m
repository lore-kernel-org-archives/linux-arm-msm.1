Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484A03CFF5E
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 01:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789437438; cv=none; b=YmORZM1257rL2EnlEin9h1syfyfoS8HPrCAhZul9b0Qzmw9uNUv/Hojbp5Zl+H/VKSejkuRSJXLr9ckqQrDN/3oadtCMsBN8AkmDwTP09falQGiflNsdvFYz/cZHYkE98XlF/gKKMDjilMMmNHbOM7TZwA3cd0iDJgA0GB2rbpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789437438; c=relaxed/simple;
	bh=3/BEcntwn3GlfM9tafrFcFrN/R+nv6mJHhnVw6uPjO0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OZDvvgfIyA9HsEwfsS6dOCr8V0gDBPmjUnJ09vAZqrSpm43BVCXJe31uZl/1VqVnn38wiQ+u5Z+5dZKM+62xzAckZtDOrCPsNB0iiknbO9lkGDq2ooBwEQOxDIxlaMy4LhGeEY6CgwlaQ0GB69RbQ61CzNxDtPV3qru5OLxSMBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WazIbOy3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JHz4wYDj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WazIbOy3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JHz4wYDj"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EMxsN3688260
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 01:57:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=txZkqH7gEzK
	SCeP8HzTcZdq7R2+c/bBlxvGh8Aflyxs=; b=WazIbOy3eaMK0JEPasDKTAQMqlx
	r7aOM+ISiK3FoSNSEStqN3/v7bIM+baxxgK8EaWrrqGP59S4BuctRV8PWpsxaswQ
	OEf1siXMPomBfRqqc+eTNjZNl8SF/AJsO8rAxgD3SX2rbSTFD8pJ+TKL8rj3icMN
	cO5l/Fb+VcAv236+bxFjfhr2N7g47Ou6XFPZuvluJHsklG2ynBLhU2yWACdeaYLY
	WVz39vDsFZaYGWENV70f4YzL4FW55qv6IX+1/VOEdLr0INi0f/d0bkZxYJp+EOgf
	7v0hIpQO0yx+e9KrVepg0LmH5/Gk783E7pDFFGamZ+OC8NkAYVGZFFkDAjA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpergbdd7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 01:57:15 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39b77130a7fso7200473a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 18:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789437435; x=1790042235; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=txZkqH7gEzKSCeP8HzTcZdq7R2+c/bBlxvGh8Aflyxs=;
        b=JHz4wYDjoLottlEehypJQUmvKH33J5f2Bocv0Cig7RK3qr26u/WJDTw5ndV1wBFDa6
         VQthiDlZ0x+9QwaGMQGLDchnFshysyVZfl1IzB3SsdVmDLocAZ9+gMInVOaOlbKaWXKp
         Lkr9g7S32QS4bs1RFT5gczybtwIqJFpj2UZLemquKkJ/SjwhMYRnTg59ZRFNbTB5KDDn
         VzMAHiOwtd08f5CbAv0uWkiwXYH6tfW2d8yWvT+S7OvmXLdzCzrxLdpBDpSJdZdmRKGk
         4AKPWsOq4x1pvVoA6kBPE+yybtV/rM0JwLtaaz2yn9wmzvIDKPvmskMdDSYukxxCw8nk
         q66g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789437435; x=1790042235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=txZkqH7gEzKSCeP8HzTcZdq7R2+c/bBlxvGh8Aflyxs=;
        b=UVN1pGJKJCokG+bDndR0AzRlApYZzwctb/BXnDCnZi/j2pXgvyAIFBFThvYtmgBM/L
         8z+YJXXZJ7TFPlsFAZp7JIOlSP+4ypRf/tz7UQf9V2KqPmHJyrg6XWo1zrPLuq62qMLy
         iA36409VgRgQbbD0notr8kuSarj1mWsWqdU0+onPCHzqQCCrJd/YceOYA4sRYiKBxpZC
         jLYshC5GkciJp8vweEp6txw+cHrshNa4ID3w5KZjTxmspWDjQR0sgSFt06EougM+/HGm
         Y+PTU0NIBiJHJLt0bZCAs/Pp0ynjR/RuQxGJB2OV/6mKLc4MjIs0vMcP7eS1zllnqIRN
         MWUg==
X-Forwarded-Encrypted: i=1; AKwUvBw+xecV6E/CED+QMW/oWShRh6vGmhsAwktKPcLMnhugkgGjCz0r+9SbvCjuJk49ryTTcXr36oJlY94RcqGO@vger.kernel.org
X-Gm-Message-State: AFuF++nMScpiN0JMTzCbVCP6ysr+Xb26h0AWIWhoDpTaVmUOW7bw4MnN
	ZwTt/r3XgFYyokrsnE6a75v9p1NZjOliMkuItEXRo6KJryD9AgcgoBDyuv5mz2xLxb9pYrVNe/4
	oz2YG8ndxkXHk9+lL5oTVkNr5AbmhVBg+1mtdZBtvGz0DyfKhnDzVXr2kdkKHv6Wzw2VcpXZsVa
	ra
X-Gm-Gg: AYBFou3eBmntsZYCLFA64C7J0/aot+XUcCIW1V6vFkXM/oX8uEj6TmIoe8ZklMH2jib
	PrYJyqFW8LufbINGWk1oQuk+kwSloU15dAMOLjHrqSCf4JQcbTAL2+9++wPUia+y124yz1HcgQW
	srewIRvVcFQKxZEM2i1/+pVT0OtB7wjiEuOIq/MCDjC1mEMccDHYG5Ze3N0JBtjAEL/a2Zbd/WR
	+SWsN7h1W3xs8/Mi9R3EwstbFFj5h15webR/XBWPVYHzdjT4v4owgIRHWR8QAzpy7FuLpYd0JKL
	DExWN7qsOnpOKzMKUtIt6ubvBuuwdDXQQlbrP9h54AUReiy1vdQAoHTUCnfN6mnmidMEna2CRa9
	Dl35nEAFZ9WnFETtmwE6LfIGP5qqzbktXg9QhARZYTLf6KqhIIDw7c2H7qvVu
X-Received: by 2002:a17:90a:dfc7:b0:39d:f5ef:b1d5 with SMTP id 98e67ed59e1d1-39df5efb222mr7911277a91.7.1789437434775;
        Mon, 14 Sep 2026 18:57:14 -0700 (PDT)
X-Received: by 2002:a17:90a:dfc7:b0:39d:f5ef:b1d5 with SMTP id 98e67ed59e1d1-39df5efb222mr7911234a91.7.1789437434293;
        Mon, 14 Sep 2026 18:57:14 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4fa50e3sm31115791eec.29.2026.09.14.18.57.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 18:57:14 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v2 5/5] arm64: dts: qcom: nord-rrd: Add WCN7850 WLAN support
Date: Tue, 15 Sep 2026 09:56:32 +0800
Message-ID: <20260915015632.283642-6-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915015632.283642-1-shengchao.guo@oss.qualcomm.com>
References: <20260915015632.283642-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=QK/91QLL c=1 sm=1 tr=0 ts=6aa8a5fb cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=3uEAWm1Q5IaYrG0nJHIA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: pC-ABBwcqonaMVlUMVWm5EuELddlN3Mo
X-Proofpoint-ORIG-GUID: pC-ABBwcqonaMVlUMVWm5EuELddlN3Mo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDAyNCBTYWx0ZWRfX/zoNRBUN7gsp
 OnuFCiSrEjF0dJCf8FCMV1jo+9n+on5t6cYU3Js5/78RTRgAhSo4XyyYnwyYIacBN9RZFDxn/o7
 Yy0/NeLPvlHflo16NBeYd8XcOTIli5I7M1pOL+lMDE22Rk3mdd9wPwvcENmHblWhMkjnButKzNE
 34hreWKN2zgwE+9pWxtbX1h5i8N4P1MpCJP33erlfTX9+HJmArjVzaxs6XaP9Q8HmNF+T2Z4o/p
 y5wjw3z1676/ksVzYJqqgKIR8HYF+zRLup6OzFSLjUFlEdHn0/PfcwujEwB5mb1tclY79kfYxwE
 sHr1nOnoyiDzq2+XtvtjCmNNPrUfFap5MvXJa1nYc/3eshLtXPUWcBtkPPYWQqY1fNiRUczcax8
 D/xVH1WVgZ1xlGux6rIvVYiPL1Gn8actZDKx7oi6SSD2R7P9L+L2rcOHdRLOB+WvqOgA28KIXaD
 2dYoE9ee7GPtQRz4v2Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDAyNCBTYWx0ZWRfX0ED+D+zKbWuR
 DWeUN7WY47SRM2++vOJnxp3FYE6KL0Yj3/2GuglAdGsIVBKaVWWVKNvqujTlHQTlejJbs7DD6xn
 x2WiQSAXN+Wk6vO2+BIq+KshIF8mcdE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_05,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150024

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
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
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

