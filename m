Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A45F13C09F3
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 18:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784830710; cv=none; b=qizpTEe4otypSXV4QqRqFS7p2jq06gSXGQNkX4zCw8SAP+yuIPBe1fpNA86+F1U7jDRN3hQDKqFaE+4Wqn7OXYarHhw5R4polK+17423gRSqG6HR0aWNs7DaAkliLDoM9Oe8/57MWBPwfK0UMwMoU2aRkp+0YUej2bZ1CGu5Ysk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784830710; c=relaxed/simple;
	bh=tIw9zr3DgrUmtNErS5jNsuDMDrjSRZ4e3BOEK+Q8q24=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IDmAjJl38Snco+YpsnYJqPx1lr80/yr1nDjXcXFJnNiFGWmTHvfEUUAgTN5/1JfdC9/IhgRnGJLZtn1/0WM3Ke60kM/yhuIKTBnqwHuW+fj71S9SegdKc2I9i4LPovlIP7yVq0btQLfMYuWjBvdU/Ki15xQg0bUVb63h7c8T3lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com; spf=pass smtp.mailfrom=imd-tec.com; dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b=MmcxsCE4; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b="MmcxsCE4"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4954df200ddso6010205e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 11:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=imd-tec.com; s=google; t=1784830699; x=1785435499; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dP8n1OaciOijCFOKjM4GmgL9zKf81HjLuCyQPvzXFjA=;
        b=MmcxsCE4cZZt4cXvznxWjpgBWpo5QwCnJvhSqBYBTGxqJy0tniRjvAgo6KGIspC0ek
         z2gSPKpXo0vydjVpoHNJ+Yv/XWnhQuynWmEl3nH8DASyHUyP+WWpHF1IhApNyCxhmiWf
         qv/G1iaT/gPe3Qv+Am7mTRBTdcuM/gjanhoIKGadkfmkCgNG3ORPuTSXQe2zr5fYPOmz
         39Cnci7y2rfV7dtprAekgK55KvOFqGnGm98AcbgzkAM8Qoka9FipmzTGQ8O9qJfVeCyw
         lo06+Tf+0TVTzPIRNhvVASwGixOewYkE6yl8NFEoFVifhvjf6d0xFIR4RotBOF7hiawO
         6COQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784830699; x=1785435499;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dP8n1OaciOijCFOKjM4GmgL9zKf81HjLuCyQPvzXFjA=;
        b=XKvQVS7ytLXCOMdJ+GbH4HnOdnZcId8u5x414GNkfWgPYyX9Xymn3zfpuDgdO1v12e
         +VuqauLqWmcvq6TpRoiWFMdzoyyIt4M5bg9DK85GLYLnJQkVun+2q6M7ceDQOLRoz2Pq
         3m58rGoKrQ03fMmNQhzmcVE5Qd3Ei6ICW2m26L9yS+JZkt6yBywpVPKsJ0PEg/O7UCnX
         YrE8Csx9Ih72VKPNZdY9TSJmlmQHjACgaGbMWl4F8Yr44pxxxtdgLzLg7h5fKtK3kBbf
         e3nxEQii/TJ4E1qrN6A9DEAHHHqaX79Sle93axn5I+Fj/E7WM0WUN95P1M8vvB5UrL7O
         hsjg==
X-Forwarded-Encrypted: i=1; AHgh+RoGPYjnul7FMvpKT3D/6yMfBZpFdifgd1Dq6YtaUSuuBvOUSYByiRXDSu92lIEtKI3hDm3M5hPPKOucj5/w@vger.kernel.org
X-Gm-Message-State: AOJu0YwWH8iEyNesonD0GRaSb/ArewWZv2eB8pkB/nVKHgfdructHB8Q
	tOL5YX/ehAbO/hF1LpLoQAm42fvM7uqln0d3THq/zcJiRM4U6Z2skIxORNkTIv05Pv0=
X-Gm-Gg: AR+sD11VvBUuW64i+HocP/gC+m4wz51zUdJPpPZ50yHPiw86HTbMV6tOufYtLqc76Vp
	sk896lC4T7rdUB1r9d5+xU3aP/iUeCq+gUmoFKur9KLSuG4/X3IzYdD8W/V67JAhnXmF0c7EGyo
	Qt6eABAFOAYwFLyqdrgTDnG2+5mbPDh7bQeH8jOIBFuxVWk7CDCeoWdbjmx3aEk6MM1SzZF0cho
	r6v6GcfT0T5CuIjrKGOBiWnfherZ5E9vZmJTClCxnvCuorSpblhmfOjL5EULXXIs+yga7aNmHfF
	GyLuk+FS8hZFsLYSRn9gEv2tOvFkB36Uh5H2sFHqwYbsF9jv5FpVi3QqZZZ26JjqOfb5gzsLHUA
	jNMoUqykRyFpIyWGB9rYGRwcdfjb89SK13I+EBXjFFBPKx8MLClNLmU39TdItE+dGWwa9Auu4JX
	iSrvWZwyaiDakBQQGwHqBSI3HX5RvM7zH7iWDWheEK78WEZey5ePmhscwZAktkDzJsT4x9GJ+GG
	9IMuJ/SsFqYAXYm7plG77ySxW2qiets3QtF97Z8xKEoPwq/sW6n1A==
X-Received: by 2002:a7b:c044:0:b0:495:6134:6d61 with SMTP id 5b1f17b1804b1-49573cff7bdmr34879055e9.19.1784830698859;
        Thu, 23 Jul 2026 11:18:18 -0700 (PDT)
Received: from [127.0.1.1] (host86-157-235-39.range86-157.btcentralplus.com. [86.157.235.39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957af914a9sm10799055e9.15.2026.07.23.11.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 11:18:18 -0700 (PDT)
From: William Bright <william.bright@imd-tec.com>
Date: Thu, 23 Jul 2026 19:18:09 +0100
Subject: [PATCH v5 3/4] arm64: dts: qcom: Add IMDT QCS8550 SoM
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-imdt-qcs8550-sbc-rfc-v5-3-2fb988854623@imd-tec.com>
References: <20260723-imdt-qcs8550-sbc-rfc-v5-0-2fb988854623@imd-tec.com>
In-Reply-To: <20260723-imdt-qcs8550-sbc-rfc-v5-0-2fb988854623@imd-tec.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, William Bright <william.bright@imd-tec.com>
X-Mailer: b4 0.15.2

The IMDT QCS8550 SoM is a System-on-Module from IMD Technologies Ltd
built around the Qualcomm QCS8550 SoC. It is intended to be soldered
onto a carrier board that supplies VPH_PWR and exposes the off-module
peripherals.

Add qcs8550-imdt-som.dtsi describing the SoM's PMICs (PM8550, PM8550VE,
PM8550VS, PMK8550) and the apps_rsc PMIC outputs. Compared to other
SM8550/QCS8550 boards, this SoM excludes the PM8550B charger PMIC.

Assisted-by: Claude:claude-opus-4.7
Signed-off-by: William Bright <william.bright@imd-tec.com>
---
 arch/arm64/boot/dts/qcom/qcs8550-imdt-som.dtsi | 315 +++++++++++++++++++++++++
 1 file changed, 315 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs8550-imdt-som.dtsi b/arch/arm64/boot/dts/qcom/qcs8550-imdt-som.dtsi
new file mode 100644
index 000000000000..3202632eef04
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/qcs8550-imdt-som.dtsi
@@ -0,0 +1,315 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2026 IMD Technologies Ltd
+ */
+
+#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include "qcs8550.dtsi"
+#include "pm8550.dtsi"
+#define PMK8550VE_SID 5
+#include "pm8550ve.dtsi"
+#include "pm8550vs.dtsi"
+#include "pmk8550.dtsi"
+
+&apps_rsc {
+	pm8550_rpmh_regulators: regulators-0 {
+		compatible = "qcom,pm8550-rpmh-regulators";
+		qcom,pmic-id = "b";
+
+		vdd-l1-l4-l10-supply = <&vreg_s6g_1p86>;
+		vdd-l2-l13-l14-supply = <&vreg_bob1>;
+		vdd-l3-supply = <&vreg_s4g_1p25>;
+		vdd-l5-l16-supply = <&vreg_bob1>;
+		vdd-l6-l7-supply = <&vreg_bob1>;
+		vdd-l8-l9-supply = <&vreg_bob1>;
+		vdd-l11-supply = <&vreg_s4g_1p25>;
+		vdd-l12-supply = <&vreg_s6g_1p86>;
+		vdd-l15-supply = <&vreg_s6g_1p86>;
+		vdd-l17-supply = <&vreg_bob2>;
+
+		/*
+		 * PMIC outputs whose testpoints lack capacitors are
+		 * omitted to prevent accidental use:
+		 *	L1B_1P8, L4B_1P8, L6B_1P8, L7B_1P8, L8B_1P8,
+		 *	L13B_3P0, L14B_3P2.
+		 * Other outputs are unused.
+		 */
+		vreg_bob1: bob1 {
+			regulator-name = "vreg_bob1";
+			regulator-min-microvolt = <3296000>;
+			regulator-max-microvolt = <3960000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_bob2: bob2 {
+			regulator-name = "vreg_bob2";
+			regulator-min-microvolt = <2720000>;
+			regulator-max-microvolt = <3960000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l5b_3p1: ldo5 {
+			regulator-name = "vreg_l5b_3p1";
+			regulator-min-microvolt = <3104000>;
+			regulator-max-microvolt = <3104000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l15b_1p8: ldo15 {
+			regulator-name = "vreg_l15b_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l17b_2p5: ldo17 {
+			regulator-name = "vreg_l17b_2p5";
+			regulator-min-microvolt = <2504000>;
+			regulator-max-microvolt = <2504000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	pm8550vs_c_rpmh_regulators: regulators-1 {
+		compatible = "qcom,pm8550vs-rpmh-regulators";
+		qcom,pmic-id = "c";
+
+		vdd-l1-supply = <&vreg_s4g_1p25>;
+		vdd-l2-supply = <&vreg_s4e_0p95>;
+		vdd-l3-supply = <&vreg_s4e_0p95>;
+
+		vreg_l3c_0p9: ldo3 {
+			regulator-name = "vreg_l3c_0p9";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	pm8550vs_d_rpmh_regulators: regulators-2 {
+		compatible = "qcom,pm8550vs-rpmh-regulators";
+		qcom,pmic-id = "d";
+
+		vdd-l1-supply = <&vreg_s4e_0p95>;
+		vdd-l2-supply = <&vreg_s4e_0p95>;
+		vdd-l3-supply = <&vreg_s4e_0p95>;
+
+		vreg_l1d_0p88: ldo1 {
+			regulator-name = "vreg_l1d_0p88";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <920000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		/* ldo2 supplies SM8550 VDD_LPI_MX */
+	};
+
+	pm8550vs_e_rpmh_regulators: regulators-3 {
+		compatible = "qcom,pm8550vs-rpmh-regulators";
+		qcom,pmic-id = "e";
+
+		vdd-l1-supply = <&vreg_s4e_0p95>;
+		vdd-l2-supply = <&vreg_s4e_0p95>;
+		vdd-l3-supply = <&vreg_s4g_1p25>;
+
+		vreg_s4e_0p95: smps4 {
+			regulator-name = "vreg_s4e_0p95";
+			regulator-min-microvolt = <904000>;
+			regulator-max-microvolt = <984000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s5e_1p08: smps5 {
+			regulator-name = "vreg_s5e_1p08";
+			regulator-min-microvolt = <1080000>;
+			regulator-max-microvolt = <1120000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l1e_0p88: ldo1 {
+			regulator-name = "vreg_l1e_0p88";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <880000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2e_0p9: ldo2 {
+			regulator-name = "vreg_l2e_0p9";
+			regulator-min-microvolt = <904000>;
+			regulator-max-microvolt = <970000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3e_1p2: ldo3 {
+			regulator-name = "vreg_l3e_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	pm8550ve_rpmh_regulators: regulators-4 {
+		compatible = "qcom,pm8550ve-rpmh-regulators";
+		qcom,pmic-id = "f";
+
+		vdd-l1-supply = <&vreg_s4e_0p95>;
+		vdd-l2-supply = <&vreg_s4e_0p95>;
+		vdd-l3-supply = <&vreg_s4e_0p95>;
+
+		vreg_s4f_0p5: smps4 {
+			regulator-name = "vreg_s4f_0p5";
+			regulator-min-microvolt = <500000>;
+			regulator-max-microvolt = <700000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l1f_0p9: ldo1 {
+			regulator-name = "vreg_l1f_0p9";
+			regulator-min-microvolt = <912000>;
+			regulator-max-microvolt = <912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2f_0p88: ldo2 {
+			regulator-name = "vreg_l2f_0p88";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3f_0p88: ldo3 {
+			regulator-name = "vreg_l3f_0p88";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	pm8550vs_g_rpmh_regulators: regulators-5 {
+		compatible = "qcom,pm8550vs-rpmh-regulators";
+		qcom,pmic-id = "g";
+
+		vdd-l1-supply = <&vreg_s4g_1p25>;
+		vdd-l2-supply = <&vreg_s4g_1p25>;
+		vdd-l3-supply = <&vreg_s4g_1p25>;
+
+		vreg_s1g_1p25: smps1 {
+			regulator-name = "vreg_s1g_1p25";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1300000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s2g_0p85: smps2 {
+			regulator-name = "vreg_s2g_0p85";
+			regulator-min-microvolt = <800000>;
+			regulator-max-microvolt = <1000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s3g_0p8: smps3 {
+			regulator-name = "vreg_s3g_0p8";
+			regulator-min-microvolt = <300000>;
+			regulator-max-microvolt = <1004000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s4g_1p25: smps4 {
+			regulator-name = "vreg_s4g_1p25";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1352000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s5g_0p85: smps5 {
+			regulator-name = "vreg_s5g_0p85";
+			regulator-min-microvolt = <500000>;
+			regulator-max-microvolt = <1004000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s6g_1p86: smps6 {
+			regulator-name = "vreg_s6g_1p86";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l1g_1p2: ldo1 {
+			regulator-name = "vreg_l1g_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3g_1p2: ldo3 {
+			regulator-name = "vreg_l3g_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+};
+
+&pm8550vs_c {
+	status = "okay";
+};
+
+&pm8550vs_d {
+	status = "okay";
+};
+
+&pm8550vs_e {
+	status = "okay";
+};
+
+&pm8550vs_g {
+	status = "okay";
+};
+
+&sleep_clk {
+	clock-frequency = <32764>;
+};
+
+&xo_board {
+	clock-frequency = <76800000>;
+};

-- 
2.43.0

