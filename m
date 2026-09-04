Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6493649B1F4
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Sep 2026 10:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788519420; cv=none; b=WIyREQ2/bK7KzuCA5H+7bzK402peF2vJBiBqELdGQXzHiozd069MGeVIFviy/ovRIyITEXjeVpCTjuX13NHTcyAEbdKxiRmZmQ4QHBJDIO0CYhCflp7q9bnrID+ZNhatF8gVBzQoIcebgSXPdD+ujr8qU24eoXWXAfaVh0P1J1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788519420; c=relaxed/simple;
	bh=J15wYkkaPvz3mj4SZiySkrYCu6ZA/yLyqk4CWooobME=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ci+HFgXVngRw9hKkII4tamg9685TSyOfSllhhclwlAlE0y5y0LPSaTxPKAxpTu4hAsYCqPWWss3M1lcayeEmBgXWnZXMgdZ9LSkzhBtBRsp5rzBs6G/NzHsWKCB6fE6JZSTihTbhw780j/wmtjAwuo2oL9nOiwaJ+ynzWxDpFMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ea89stJv; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ea89stJv"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4956869750eso6583795e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Sep 2026 03:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788519414; x=1789124214; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eFtpIogOJLD8BDVMTcndjqzTghhPJgSIoBnISPNLIM8=;
        b=Ea89stJvTKxAKh0ZxNJ5anNeqPCNyOqqAPU/m4x21K+c6Rq+GHx71BUvN9+VAnabzm
         du/ltpxXWEfEqgBx7Y9MA+KG/Pj+B6uesRLSz1c9WkrKodj+UnmzeUV/5jVLFMT4yb+1
         AvtDBEQZobiABfV2sRFIWnX9C8Wku3upEUTr/jcR32ifaGl4ue+p9KthnbQbBTxY17ab
         H42sBZ+DfW5rDOtGH70OKLXwoa6zy1RrE0xq5IXHv9WYxaO9xPEmz/dneQ0fZacmKH3G
         ZTRaD1sRRJxnOCKMv1Sb28JNJWO2LoQcjEpiRPeau0to/QiA43Mo3xEHYzHZgu55Lq1b
         g49Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788519414; x=1789124214;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eFtpIogOJLD8BDVMTcndjqzTghhPJgSIoBnISPNLIM8=;
        b=pO6HRT+SctEIoxhpNOOsxSuvyXZoBc4PEYDAvZRqv4uDkjMyfVPFX2liFynGDwhA/q
         QkslP7GXvz+cCTQBP0ZHCFE7RqFmvdxKXoFoOirdkXYq12JKx0EFM+tRf36KPgIEa+pD
         5ZXZNgJ9mtVCiNwDSUSKsCixKch16uHjLT45s6bW8tNFhPAMW59HrpVdHN4R8TYF/tZH
         pmyIrpYaaVBY0ND9F7YVZ9L7MQkRQTF4hk0kfG2NJrUQmESTVO17EhCygViow7QxdgSZ
         I3fFZd9x300Ghcj1f0nlHPFnPxYVHqQs0xmiWl9WbNW6Jda7vvdM1Io7jzhd0qoEAc+7
         IjSA==
X-Gm-Message-State: AFuF++kNhScSofZ8J0UzckqLGagkEdmiLD6dK5ncXghTmg5uXwbDQ+pm
	EUcr4ZBJDCgE+fNWybiSdmzr8YoEFBaJ3E25dg2QiMTE8hsw7qxy2TkbiQCTN/0EERk=
X-Gm-Gg: AYBFou3Hphb5Oo/vl5N1rqkiM3ba2WMS7iWxVICuHbYwvvP1xFynjgQ53YlK82aosEC
	m/NbPIOo4SSVLCnX/qyH5mx3dXl/yLvyoc+GGlxkS9njA2fjmmgc/ZNHiN/miCWLM5sS1UH/Q+1
	l9txO5/6ZzKoM00XV9nbvAUGs+a/CAOsoVpD7c++k+gYI2nXHzoqN+iGkZzqAwN0XJiSSrfK9SL
	t5uPbwRwW1ffR0acpYu9IbQb9cJEav3+jhWZ9JkiRdUvlo3JwTra4pm5YISg2tKyhMNypokBr8P
	38u4hOnAPvaafk7kA92XrZ7NYjQWme2SsfvwTNr6pYJg14x624lI7/XTX0/ITqDv42RwuWeq4XC
	m3XN5UMdJDNNMjUDeho0iOu9OcFdly4ph5W4nZ9iK6C9iRZIjOYlGJYiGKkEIli9BOT44rPRmsw
	OU5zJulYmKKLzocgdmXXGQf8stbmS5ibIjrovLbFOHLg7Sx1KsB2CAsDuQvMgADliPDPon7penz
	P7t+tnKKRA=
X-Received: by 2002:a05:600d:8649:10b0:49c:fa20:cc0a with SMTP id 5b1f17b1804b1-49cfa20cd58mr23313905e9.33.1788519414400;
        Fri, 04 Sep 2026 03:56:54 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.237.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce46696e8sm132110525e9.0.2026.09.04.03.56.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 03:56:53 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Fri, 04 Sep 2026 11:56:40 +0100
Subject: [PATCH v5 08/13] arm64: dts: qcom: x1e80100-t14s: Add pm8010
 camera PMIC with voltage levels for IR and RGB camera
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-x1e-camss-csi2-phy-dtsi-v5-8-dc81d85b599d@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2810;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=J15wYkkaPvz3mj4SZiySkrYCu6ZA/yLyqk4CWooobME=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqmqPn3B/7abYAemVyp+lAV6hGp+kx0oMZ7gkBf
 3uTBRJwgH+JAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCapqj5wAKCRAicTuzoY3I
 Oic8EACXd3wVUdOGzKCeRDI+btSwNbpr7yUNdStyVSzNxu2NmpKIrmWOYeBkFnx/U22cEnZcZVL
 GY64A+sCoIQy2VaOL085Xl53h+4vPsb1fKilIHfAxFU8byCe/fByysCZPasmJPwpUphNQV4RYX+
 Tu4nzHQWgFEGTB5YPGRp8Cl0X99ngErNV9gKODrArIutgx610Zn2H/6jcWT0d8A/Jb33Cs38DSv
 1rvVu1Bh98hq4OFUjTUN5wq67MOiXZurLbUGFWaMi3W8tMa4yHAePfU54K/Pnqs1QZRy7twR6gS
 9AuNDkZWa2y7T3lgbCtNvQSMMwjegnb40sqvryqHcWTxHGppYQ8i6ecUVa0ca7vmAsCzWzG99EK
 32iK8Dlqq5VlGB/TKWUIqc3E7ANuHNBxV09ds4+nDfo9ddy29lWis5klImfjE5mNwxf3fK1ma5x
 w6CLyxGav8hTKmj0lvEmEBu1gsbjzlv/zPPgmwMp7ZA91nu0fgq3QUaWwl+RrdM7+3o8QZPNhrM
 FroBDDNGaeVJ+awpKaBthhZloHj0uRh5X2x8uCYg6uX7r8jri5xeC15Ln0wThYnyyfVGD6QvRCf
 fEZGSFHs6gD5b7O7/epGhLCgS9SZ0FCctDPl5VCi1r0MWCOJDM52TEnlEYJGx7MMgyoWaWy+6Hh
 cnYc1Ic8fq4ylpg==
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

