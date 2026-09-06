Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23BF43F089
	for <linux-arm-msm@vger.kernel.org>; Sun,  6 Sep 2026 14:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788704478; cv=none; b=Zz2g+LA0IwoGxwXgmo20dDLCPuS49wPNLXRkE6TOQy0I1j8cvnjoQ8OpzPzq1OD31hR7Ds7Xydcv7aTtd/xN0GXT1+pDaPyUL273ocBx3UMNsO6e7xnCpPGXlma89uePHARL5GZ6S6m2zdD01aaa+kAwaAze0X4a4xN8R8JiD7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788704478; c=relaxed/simple;
	bh=J15wYkkaPvz3mj4SZiySkrYCu6ZA/yLyqk4CWooobME=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Rr/bK6UoDhe0Ei2GCG3iH9tPQj5pP1o7oxMcqQ6MqkZO3f3s1cZi7rKbpjKFSSDubu0r/zUKedcXWAQwbNJc/kyxGEmD9GxU/7XxnGJX62yHo8fswzVVSltRIqGCO4YRhIh5iJSpvSssGYYdSlDDm8MtlnWYBqlTOKCKKpDrv/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yLW/9z4a; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yLW/9z4a"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso1779151f8f.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Sep 2026 07:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788704464; x=1789309264; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eFtpIogOJLD8BDVMTcndjqzTghhPJgSIoBnISPNLIM8=;
        b=yLW/9z4a80jIrP9Yp/Sc6YizP/Bw7KboVly1g1SnC3Jvn703QCKEfF01+PHWN4+dKi
         CLct8ieS/vDr1f6asje3HqRajPF836zm6gqPWv5PIXKkKI//qZwkhZekTZeWrHhftRXM
         YKp7WGDEBBt6kySlVHnIubIY4bLmv0Y9bTdmC6x/10uXgYbOEz5acFNuku7t0HV81k/D
         YiFusqPMoo5Y54TdKtQ7+7Qm5NmIybOX6hdmgmrh7GXCwBqCCxDaycFx/8ZsiSCwTxX+
         xkyxTSBbIsa3q1paGrrSNEb/RpP6PnxRQLqos56C8mME5XeRTVsJoR7ZaaLYgjb8kXuz
         KhmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788704464; x=1789309264;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eFtpIogOJLD8BDVMTcndjqzTghhPJgSIoBnISPNLIM8=;
        b=qktqOC4lk0hBbrQdQoUhnB7hYKcCvCAS/LT9ly24cqzXeFWdTWXO76OtjbvWuHNhT1
         ff3O9Z2tUTfKbusFx/viS0PlRI7zqcG5e+QOyMq3RUzHh/e/9SpmCLeX/c8q2CsWcKVz
         0xeTqAkA5JyV6Ipe5Www9veZ0OnGTpNYVdAYDKaoNutkc7vRMZ7k38icmTfmHg28PLYb
         /CppkLiICgOpwkfH4XQh46lEtRSMPl1tgwo8S5EuN693RayMzq2OtGygBu9DIjPE8jQ2
         okOUFbO5EngobWoBZL2Lpj/qLhuMy6axgEEC+rbkXMOJ45HPTkcgqSWeSPxmEF/WGj44
         qVsA==
X-Gm-Message-State: AFuF++myF/VmKCn7LHN0RgFPjlZAT/pXzfXH03DbKbdS0rDLyyJMMRsU
	IDPnBAEG6GqjUjrmJL+NNdipoGXEq3vH1m9HInZIQb/9jQNlFGR3zQIEdXYoI2Cbunvfk6twfDO
	8cbkONjo=
X-Gm-Gg: AYBFou2DOypLzDgE6a5BA4y8jowJWeTLh49MbAKrJqlgAxYp9HBPcv2nBfrMa+AG+Me
	65Snu0E7V+K2NFAKusgCEQkUSvzYO5naFWdke3ywp60kvI5NepzbNa/ADvSnNPMYpnbnsRXn9IV
	T4Oq5EgZQRDuwwXyGVvj4rY5sIMAy7YCaYUcwr7StWF2dTKmoIVGb46h+7sEfgPpAXRM9MV0P1F
	b7jF7oke9jqn4CUoY4R5sbaWq2paZmJ11FcQ2HqtwDfbd84UFoOWy+I40qPak7WkubqIiYoauND
	1firbZW0K0gspoK97dsznRr0pttSfWvlLsioV1Obdf1XDDUr/kEEDz7mSbi1QHncP9CHIWBAjZo
	zOXVRK4e/5VKhTuDBxJJZWezjJk2P3vhLl/ZZhu9CFN7snbh6pb9tbUxVrIIbK9EduzzMrwEght
	1hZNcDJT4Ot5FG+sGU67DvIris+6Sc7xMr/5fXagL4eyah8tgbBo/gJJZRDpPzxIdDEDFV2+DsR
	Q==
X-Received: by 2002:a5d:5290:0:b0:485:d61:65b1 with SMTP id ffacd0b85a97d-485872dbbdamr16682244f8f.19.1788704463913;
        Sun, 06 Sep 2026 07:21:03 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.250.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883953cfsm18065125f8f.13.2026.09.06.07.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 07:21:03 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Sun, 06 Sep 2026 15:20:53 +0100
Subject: [PATCH v6 08/13] arm64: dts: qcom: x1e80100-t14s: Add pm8010
 camera PMIC with voltage levels for IR and RGB camera
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-x1e-camss-csi2-phy-dtsi-v6-8-067f2ecc4630@linaro.org>
References: <20260906-x1e-camss-csi2-phy-dtsi-v6-0-067f2ecc4630@linaro.org>
In-Reply-To: <20260906-x1e-camss-csi2-phy-dtsi-v6-0-067f2ecc4630@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 linux-media@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2810;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=J15wYkkaPvz3mj4SZiySkrYCu6ZA/yLyqk4CWooobME=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqnXbCx2FI7Z5jVz7Tu899Hnjn5+/CP5ulcAvzZ
 P7gBDpXST6JAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCap12wgAKCRAicTuzoY3I
 OkWsD/0faERWpCvkXQsRGwxRnuPskYd6jFZ65QIGWy1bzzgFH21MSWw4IRhs62YD8z3ABypm0q1
 Hh2PGMEmOMg5zV+G9ptxSDL2trxI0M3scTS4nUafOJ5/4qf7dLGKsaq/OI7mvI/WffJ73FwbfQQ
 GcXcV7kSGNEX7LTbfJqlhYvDBct4VQdgTJ66I/jU3UqkaLR4NL+P+NqdyRqEdjaDD6a17JVQnqL
 KH8sw96NPOL74aIUSALOPYBqvwT2Hl5uRjdGdHlj2l1j3Q0kSw43XxW5H6waBH3D7Dju97/AI6f
 KBnUByXlVMFU9tkWgTceULLRyvuS4uYfgnWtNKFJiuG+qNh8Qv9ZG3N9Be99As2D60vi3s9TBpp
 YK5a52OnL9zmALzbjPjPxfx/ureiauAA2BD9y4thIF96Mt1Q13ckX/dMu/cH5SuJ0RiQNW7soFw
 T5P5AQ41iB+PYYU8aGpUol8Y8G1QZL9POIJ8xZVKB646jD0w/F3qmZE5pxWJUk3F9BmStx87R2u
 eMZFz6zaggGO2YplMYeYiMbGWDcYSoJqkNXyTjSqqOPyQ/98bpUWyvvKiMn9uonG4SIkd6hec4d
 SNgZiazYWjQUdVo+Xu/7EW4jmLKLjwcEnsoer+vgBrZ284znSxfrnKgdYeZfzNavzU/R5S9ZLZC
 ZpXPRrR9FqQY/iA==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Add the PM8010 PMIC providing the following voltage rails:

vreg_l1m_r @ 1v2 IR sensor
vreg_l2m_r @ 1v2 RGB sensor
vreg_l3m_r @ 1v8 IR sensor
vreg_l4m_r @ 1v8 RGB sensor
vreg_l5m_r @ 2v8 IR sensor
vreg_l7m_r @ 2v8 RGB sensor

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi    | 59 ++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
index 5d49df41be02a..70e50ccf67677 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
@@ -562,6 +562,13 @@ vreg_l6b_1p8: ldo6 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
+		vreg_l7b_2p8: ldo7 {
+			regulator-name = "vreg_l7b_2p8";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <2800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
 		vreg_l8b_3p0: ldo8 {
 			regulator-name = "vreg_l8b_3p0";
 			regulator-min-microvolt = <3072000>;
@@ -805,6 +812,58 @@ vreg_l3j_0p8: ldo3 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 	};
+
+	regulators-8 {
+		compatible = "qcom,pm8010-rpmh-regulators";
+		qcom,pmic-id = "m";
+
+		vdd-l1-l2-supply = <&vreg_s5j_1p2>;
+		vdd-l3-l4-supply = <&vreg_s4c_1p8>;
+		vdd-l7-supply = <&vreg_bob1>;
+
+		vreg_l1m_1p2: ldo1 {
+			regulator-name = "vreg_l1m_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1260000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2m_1p2: ldo2 {
+			regulator-name = "vreg_l2m_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1260000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3m_1p8: ldo3 {
+			regulator-name = "vreg_l3m_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1900000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4m_1p8: ldo4 {
+			regulator-name = "vreg_l4m_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1900000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l5m_2p8: ldo5 {
+			regulator-name = "vreg_l5m_2p8";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <3072000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7m_2p8: ldo7 {
+			regulator-name = "vreg_l7m_2p8";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <3072000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
 };
 
 &gpu {

-- 
2.55.0

