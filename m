Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD19E3CF217
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 01:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789437433; cv=none; b=qsYkKbqt+QNgQ8QwjrfpPJR9cwl4ftW0aUvZy3AQW3rfVuaQtmq2BwkzrwvbAyXmvnBlhhMEVVBqv8glXjrLs0TukvzAGTSimNjQE87/ne3d7zqMfSBS4lVEWiz6qg+Ugr/Vyy/pHvR2/Jb97AD7alSv6udeHxHNTXsLeWg4cZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789437433; c=relaxed/simple;
	bh=OJ40yRLpfN6efrCKANy7vVAzWiOETYEWE6ByPCnhNNY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k/pQE2Wg84g2X9ae485KHpE67gIPU2C3JclhDy0+AmNZOHUZ5xKDdX4e5/WA6x9GC0n0o0tQMhWUXg+RhTOVr9Sm9nErILWMB18jQwdzVywNDw9x4/SnH7nNXpJbL0X7fectST4HA7q2beQWl6hz7wp4Yo1pZDtrZ8M9ma86sFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HO9GDxxx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VqRDzuyd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HO9GDxxx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VqRDzuyd"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EMxlVd2826253
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 01:57:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=qcTwtDodqRr
	FQV7lFtyB0bOkPWW/W3IrcbCXYpAuuVk=; b=HO9GDxxxUet6JNKp1ZuHTqiCzxE
	PEKaKYTRZmpRAxqTHuBc0sU7vbBKUry8upkoUmI1Se/O4bs5wQPENpnN4iBpElfl
	m8bzidH1AJ/bVU9TYhNyTAG0owObntmv5VH89qVtetwN1O1Q8MDjhsn0/YyBMiR1
	/beFJOB2iA5DXI0fmWf0/1tUJkzJ9vW99mCFF7TXyQaD0gKo0NA6rgNrfCo9g/Y7
	5eYmTefu0uQXn7vqjmGm82xEQdDaT7GTLs0fgKn+3bGma0tgO3NNfqoQjyQD7Sp2
	ToO7MaOjvXfCdan8qsIam5aCU4LjJLNCsztFPceneux+WaaMatoQRAVO/Xg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpn41snmh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 01:57:10 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-855f662439aso7769238b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 18:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789437430; x=1790042230; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qcTwtDodqRrFQV7lFtyB0bOkPWW/W3IrcbCXYpAuuVk=;
        b=VqRDzuyde3lr7mNHJnmBkTSvOWS2XkzQbQjDj2pSv4rZ809R0FzbLwf8LP6brptaHv
         lpSPy/fim1gvTifT0OonBWcy29zcKhDqCiz7YGJpyqKf+8kGGd0dUiv2jY79pjr/hEmJ
         Z8qsCzqGt/AXwkPUiTp7VvQ7Z0Z6+4A23plcFAdCF8J7y5qeoHyhsJ+9p8XirrMSnCRh
         C+mjJj4qBP6i8qLBH3nnMlPKqPC/cciAROH9Wvk96q2HFe8Y7W5+n9mqPYlDIWIsRdlf
         22Hjo3B+PPsgw7XluieETLFW5sjk1GpLag2EgSLu5QwiJwNUF9Ug/rofD6mtes8abz2e
         n7Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789437430; x=1790042230;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qcTwtDodqRrFQV7lFtyB0bOkPWW/W3IrcbCXYpAuuVk=;
        b=Pu2hTd/HXC5G6fvOYeAQfGX4Elrhut46fOJUF1j8iguFHlmMjr+GjpARiTVSxBKmGz
         ZFhcSvSZX6hOfsgozbF5qqhGm9eHcUlp0R7T7+x1M3bYWj/829uLmUl6zTg5gAAq/ioc
         triW7SGoEztSFAL7cgTmqS0szxbxldh1zeFIc/VCxVq7cuczTJpDJvtNyqRFaZtpXfH6
         prRCAL478B8zl40W36HDYeISp9Ix4Z9Jh/e+fAhc0Zo8RJhD6LIL7qSVrdv+VaLA9Z5A
         M7axGOr9sq/7mwBsexZoBdzox2OfjweTnnO8m967jWipKMX+gnCDeUM3Sgv41T2AG2+R
         qsNg==
X-Forwarded-Encrypted: i=1; AKwUvBw1l/+4go/pf2kqIZ5uq1pfgfnfDnF9fmCarG8Z4ss0nQ4h2/RFXIXnqpzLQbIYL+pcTyaBFx/Y3DpLN6fr@vger.kernel.org
X-Gm-Message-State: AFuF++nBpdCX3hX/T6do6cyF3t1FQDpB1NFhGVz74aIOdLtRhvDrKUAd
	wXmcpnC4ffp4a5zkv98IC7AMFvVmoj1NViE3nykO2j+rCn4YqotqMI2t3ilAvSkHg+c99GWZZb9
	KK90XBBr3+eXcCZRW5OWvVCbNaWI27JDPIooQENp6ZBHGdvxkBbMkFbq9RBRhVETEZZJE
X-Gm-Gg: AYBFou1J0oSMC0Yk13Dw16krL8xrDpE+wptoc97NEsCnFz3g8fm/o+CHVn4ZYyUB0pW
	vMjv5dfPA2qgUwKBt11NMuLOZXneLgSc8QSf7bFgWFEcJT5PFHEPc4xFafEGuO7fFYn3TPluaOF
	/QYtUWrKIkiKskvAqsVuMLe5hXN9gh3m5xhbsp8MnZgzjDsgaqC35VIJoQt5mzHpyauBlp6sAmo
	egB9NsmrSp+mQIbs1YEdWqaHcGU90QO05bsWK9fPZyNGfpKtQa4ganZxLYebv4G9mEGCKW35Fxf
	AgNhudoiaYxAuAGjZ8XBxRMYb7ph4fuE8x/gWDY66uaPCzXs8z8oFMUnYcMkUW/BT4p5t3njfBi
	MPJfSfF7V8Ff4n+HsOBaV22H3bM82AD0PEpSzbynfJJV+QI/6WgV2WT+bvwVq
X-Received: by 2002:a05:6a20:6a08:b0:3cc:ebeb:3efe with SMTP id adf61e73a8af0-3db404efb80mr11282634637.9.1789437430378;
        Mon, 14 Sep 2026 18:57:10 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a08:b0:3cc:ebeb:3efe with SMTP id adf61e73a8af0-3db404efb80mr11282591637.9.1789437429984;
        Mon, 14 Sep 2026 18:57:09 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4fa50e3sm31115791eec.29.2026.09.14.18.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 18:57:09 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 4/5] arm64: dts: qcom: nord-ride-embedded: Add WCN7850 WLAN support
Date: Tue, 15 Sep 2026 09:56:31 +0800
Message-ID: <20260915015632.283642-5-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDAyNCBTYWx0ZWRfXyECQSTCdZkQ/
 RUimB0HNeiXa6H1Z5aX+8/KimayV34UhVlWZko+j3Zhq9uSajTZJ7Zv0hmumop/9XpGPAYAL0fe
 TcUTWmqkXflGrLZ8ikqCq/0BEnZlnCut5Y4thP5/gjZhrGLkn+26PEkBanTDsM5muZxuoDvr3qv
 6Mro8a6VE4KEdAlBYvm6v6haazU9vjVhMGqcTDw8oPI4mBUrIFzWFrRO7qXAaD9bCSV09oIfQa7
 xG5ozQIvr7iwp9mQFA0YuXtYbB+OqWP1aMPqR0SU5N91a140MqmIgvA7wVFG+EBJtG39ffXkGNo
 TDr9KPZHzPdKhjD62b+MTmI+ZZU3pAL/RIUEZRwpU8Z5gkAuf+bbiRtl9NnWYDMNEbXBhQeU0Zg
 eYlJEzygG7107OU1FDiTxo5iaOzNALqcSwDpcZiBCHfhbt0CK85guDfZVDoskyafOkEBF3zRYOP
 KUj7XFjJo6x2YWf6Hcg==
X-Proofpoint-GUID: Ce45hJHcGE62eIpFZdzpiZExlyVnUpnV
X-Authority-Analysis: v=2.4 cv=cqQOAF4i c=1 sm=1 tr=0 ts=6aa8a5f7 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=btXJogeg36QJwmQpmpwA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: Ce45hJHcGE62eIpFZdzpiZExlyVnUpnV
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDAyNCBTYWx0ZWRfX5v66MbQgN/Hm
 YC2rA4DURPWO4QiGhaUAZ0F+EFyQ6BgWVA6vdss+5+6YU9pvQZGa3EvhzCO7b7snOzoIWHelT7Z
 JRBPaZvTWbmA63ZIrWZ8ORWN4warBrI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_05,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150024

From: "Yu Zhang(Yuriy)" <yu.zhang@oss.qualcomm.com>

The Nord Ride Embedded board carries a QCA6797AQ (WCN7850) LGA module on
a connectivity adapter card hanging off PCIe2.  Two PMIC GPIOs gate the
module supplies: PWR_CORE (pmau0102_e GPIO6) enables the DBU_CORE_VL,
DBU_CORE_VM and DBU_CORE_VH regulators feeding VDD_CORE_VL/VM/VH, and
PWR_CTRL1 (pmau0102_e GPIO8) enables DBU4, which produces the 3.3 V rail.
PWR_CTRL2 drives DBU3, which is not populated, so it is left alone.

Describe those rails, the WCN7850 PMU that derives the chip supplies from
them, and the PCIe endpoint node consuming the PMU outputs.

Signed-off-by: Yu Zhang (Yuriy) <yu.zhang@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 .../boot/dts/qcom/nord-ride-embedded.dts      | 102 ++++++++++++++++++
 1 file changed, 102 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
index 0b230551a49f..38d50f040c4d 100644
--- a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
+++ b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
@@ -53,6 +53,93 @@ bi_tcxo_ao_div2: bi-tcxo-ao-div2-clk {
 			clock-div = <2>;
 		};
 	};
+
+	vreg_wcn_3p3: regulator-wcn-3p3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_wcn_3p3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&pmau0102_e_gpios 8 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
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
+		vddio-supply = <&vreg_s3a_1p8>;
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
@@ -404,6 +491,21 @@ &pcie2 {
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

