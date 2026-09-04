Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8503A493644
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Sep 2026 10:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788519423; cv=none; b=aUIZy7FO2veLTZUr0ba2G2PGDMDP1stGtCyQTxSoF/TbNtO+ANVcjVkSh0+89tdxxX/lLM3RDaRyw6fFSQbMJJMqcAJD+FQXKrJDjE1ryyQj58cezVYRwsxKiY9c0G5KuAWrMCn+wTn/edAF5gjY3VQJTWC0jCDLT76cFFlaSWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788519423; c=relaxed/simple;
	bh=Gr7Ug/iGIddFaJ022pOfuUZWZKw24+dtw5PShhZ/DTQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JBydfW+DneHS+qH25Ayb0kzgWbSdWDGMi4PjEPaMSanIJbP9SVLO3XzC6pa02YWtlJnHG6BN0LseGCKCr3WrOnTqqNh/9VGWGa5A0h2lf+EZaRfqnYaUb5qLBa8g+xwvMsSGhMW5XEAZZ5c/HgF7RGtJhKzSeqBTEfbtfhdHBiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N/lZK1q9; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N/lZK1q9"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49b0d8bc2aaso10027055e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Sep 2026 03:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788519417; x=1789124217; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uP/7+Kg0xCu41jRaTz/LYcoi/DaO3p7TigTWjK9hj9Y=;
        b=N/lZK1q9OmHfa4ysEryrl4/y5mHoYS9EUzKic05YuaIm0AIP9dWS1+bnVppuq+ynK3
         Q3mHX1eTzmK71RB1/QKD3MsZdJCuAilMlRaXexIfdgQ4FYeXSi7vbDEQ+yrfDTpIpY9p
         KqSRH7IdoJ161VM+l+i3WybH9ahKxjyOOVs8K3QO0uzyfp4cNmrVBD9elXXOsDf2XbVu
         tHc91k0NLEKKKwltXH25UXGHawElQAo7M3w/sGndsf0RiKi3VuPIFyqWJPw4Gpv7MUQa
         odiUG3tdW4D0E7H6vUHTr2hcvPPFH+YP2RTdYy9P/9lSPeWdJvVz6oYtZvLDmaplx7IS
         mw7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788519417; x=1789124217;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uP/7+Kg0xCu41jRaTz/LYcoi/DaO3p7TigTWjK9hj9Y=;
        b=Rdjhgzj3zGAN1ttHqVG95EVXNOSVsk84VpEz/UJYrcWSqYb9CTFozqUljvkhQP404i
         S0CWojnLRyZlzk4RvAScbgLqYh1gemmkNRulWOHVJEqtfTEXYnN/oK+86BQFPUZ57NKx
         KaQ/j00WFdKPh6vcqkRa6uH5OSgGVEqKEZNsNF9uK5vG6Y3La+nem/kSt/V+unncks4L
         jeHN0fhX6hMAVWRwifPoD1GXkExqdY01XoS5kKzyR6uyNzdMPxIoE7paiL4FqW7b7h3K
         pJmJyZQbjNNJIV05+k7MLys1oV0sbXk7vN2Bich2+I1wnFUMbtCmrHW8ACGKivU24PYj
         Wmog==
X-Gm-Message-State: AFuF++kxViGXZDp/HvKUaD30uEceX+uvcrJeNxU/HRX9RhHzTsAQ7BjL
	VypEM6cxItF8nKDm9Chbak5DONuu3O1m76kSeioWHillU4N2LCxYarVDG62P1lmM5CY=
X-Gm-Gg: AYBFou0+MZSmzz4p52WF+tJNoNCCfWhXz3O22d/WcGMChFKBADWTtXGYjEWjUk9aBGh
	2Lp4F6HyPdSMWi2EJId1nZSEe+lYxhESgeFSU06B5sJvUYJfh5ISMJcU+rq+Fvn5qGHoc/D7nr4
	kvu0BOF+Y2lnNt7sJY9xuHE9feJ/Av5d/g1pev5lD+QQYhgMN6HocEHl3DxxIoReoIAXFEL7++f
	Zlwa4sxp8+6Hmev4v8kHAt6UMEEH17H6+7JoXBPAB3A0AgGox8ENZGfLYpRuJZc1SOEW4tCWHRH
	y3/sWt3uCtBYfY0gxbTzW6OOHxAkm4II6m19j2X5J2VG5LJ7mmM+ZSYifA525nvephzx8dtc6tB
	MVyzjPFYDLcZNKs7At9yhEfb2iBj92g/Ed9hzDjyrrsNBh5LQ4G1i+UxkwPefKCgPigDNpqcneH
	JsEiAbGKmmfbAFB/CUPRhVwhEgsL0hN3E14jFjuw02fMup42UQflgTBOuW4AxwGznE819B2820Y
	F6tBQs7Tl1n
X-Received: by 2002:a05:600c:4684:b0:49c:fc6c:be14 with SMTP id 5b1f17b1804b1-49cfc6cc10bmr25372025e9.26.1788519416721;
        Fri, 04 Sep 2026 03:56:56 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.237.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce46696e8sm132110525e9.0.2026.09.04.03.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 03:56:56 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Fri, 04 Sep 2026 11:56:42 +0100
Subject: [PATCH v5 10/13] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x:
 Add pm8010 camera PMIC with voltage levels for IR and RGB camera
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-x1e-camss-csi2-phy-dtsi-v5-10-dc81d85b599d@linaro.org>
References: <20260904-x1e-camss-csi2-phy-dtsi-v5-0-dc81d85b599d@linaro.org>
In-Reply-To: <20260904-x1e-camss-csi2-phy-dtsi-v5-0-dc81d85b599d@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2225;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=Gr7Ug/iGIddFaJ022pOfuUZWZKw24+dtw5PShhZ/DTQ=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqmqPoE0cE6p4BORYtCha5bWjNpzCh602M1AANR
 XWWidVA7gSJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCapqj6AAKCRAicTuzoY3I
 Og9kD/sEKrMOzjbBGk0bxfQR1ULKiY8KrueX0zUCGI60Ilk2fqKuPDpVdylZ1T6ydGqKCUpCDvH
 vQBs23R2fSnjKUWH1+KHOskbbUMjI6Qn5w2ONXKt6kRfMrQu0YlW4L8yM8v7radDI509mQ+5AmU
 iM0+zXbiKwB/jogHRMjZTvJZIfr4v89I2ESLeWhdz3NJdyW8ETYiNR7o1avtSgJmltyJWoSj3ES
 d1CRI5WJk0vUxUhZlVmveAglBosVnhpt65a4v8zzp6/zo5J0HO4qsZb+ENZbD2la+Lxge87rt7M
 MtKkqiTn20lmvzv+SgOakx5tZmSqwoqQVUEGNMi64y2sdYjMTRK3BkMyoGB7EuRzPVde7k9bQ+G
 rfaUaArMXTsn/4ja9trKG8HKU0r55a6LV2Z1mKBXH6hAX5j1dDxVorV8QjimFHihxW5sZwIyUau
 yVbOHjJQNKNUb3A24apgdFjymY8028CwBButnamq7qq92+yyro/wf5eLlDskZC3P0qBI6OYTVcc
 6nE0mF8LK5ZW+gQjkuchoLkJVr9c32FfL4e5JbYCkFw8xunMk5Ij40FYxNlr5ZboJbCwu+X+BXy
 EKn1antPCYdRxPD5ParmZdOFSU+igtTHdEFjren4G306juU9QznqITLNk4qMy6DWAye+2LyEg7n
 Y9edR0yBWf6xziw==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Add voltage regulators-8 for Camera on slim7x including:

- vreg_l1m_1p2
- vreg_l3m_1p8

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  | 51 ++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
index beb1475d7fa0c..0a8275d501f85 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
@@ -795,6 +795,57 @@ vreg_l3j_0p8: ldo3 {
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
 };
 
 &gpu {

-- 
2.55.0

