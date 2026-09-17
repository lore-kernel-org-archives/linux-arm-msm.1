Received: from mail-ej2-f23.google.com (mail-ej2-f23.google.com [74.125.228.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA091525A8D
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 13:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789651249; cv=none; b=S2jku3qiE4s2wH2k8f8lWj2gryYOTX6GG7Z6oRPySn3slrGlAYnYFCr55aCwPAiglHzDM8ScA4nhH9QqSbx/JZRRHh7mCzn3ufsjO5sb+mGi1QVsFCyZT+M2kVS0STHYbYXdnxqkT8og6eCrPNEWuSsWpQG0NxhJA8lQJ4qfnYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789651249; c=relaxed/simple;
	bh=EaeknwqSJhuh1ncseWxkANLMYsY0YJYe+HBwoQ1P3A8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cv4eshDEgSTKsZPA4+Iwmt5oHiPiYHAc43lBoSGLK4SdB5QtU/9vNYNTrIp/OB0g83BZzdUTw6cCKeyh8+NtYn654iiMvEDVq020d1SlsKeLuznfiqm/zSYCXCjr9vXdW3+khvU/ApkSAg+a1lKy+ZtvikEipRiuRY8liJhH4VY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kBjTblRc; arc=none smtp.client-ip=74.125.228.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kBjTblRc"
Received: by mail-ej2-f23.google.com with SMTP id a640c23a62f3a-c25ef7a3ce9so118623866b.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 06:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789651243; x=1790256043; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SZ8zec54lAcmTqd3fR74Xxo9z2Y+95uZvCv8H7D0K3k=;
        b=kBjTblRcjk0q50MCu3M+UxfGTX6Z5Lpa9Pj6lLpzPj8uHHnXAxkYsi3JePXzZ3zaAS
         e2zPeZhfjHlS4MtgEukbjD1EfsapdgjpDmJLpt7ARBBNzvC9o+Nqa6ZjBZr/m3R4io/M
         PoUPqBrzHSWSIIfkS20LS1aFTw5w48rKEhf0NXMOEiZD7XrziS9pUbaDP47RmhCHfBec
         VhoedRRJwBsdhUe1cyn14ye8ViBsTXmjm04UUM+duMlxIDT3wsvRd3WYmNv3BwegE+Wm
         WkMwgOQ+/XL7Zn+HTWWaHzBGkMRK1jg7e0fK+gJuHR3aD2a9tUZzoPn4hc05v5bgNcWs
         j5ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789651243; x=1790256043;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SZ8zec54lAcmTqd3fR74Xxo9z2Y+95uZvCv8H7D0K3k=;
        b=stvJB6juwxdxCo4Y670GR+FX/vL7M9RbLDcCI1mBf10zPNdbxvrX3qexYNBBqm7LFM
         s64WRjbxCz8J56ehQEZG9OwHBLkEr2T4bjDPmqR6vSoZFRS841/C4niAAH+tXYXzto3Z
         +tkwVt22HAEl48/u8zDrjecSF7FNuzSNpUO3QAHZy6uJ9nfp4vwQBfOe+1VoqwxflqzT
         vxPIazsmSWY+CW8s/B/616ztO/8aJtY/e0xXjGyAAFZrgwirJLEGrq7cQCvMYkNFItUc
         MCDnVB0OlU/dcipsw2IfpmNoOdeQUbj3Ds1mx17YZO4CgKNeX2XNttuz1m5fhs+nOPhz
         E+hw==
X-Gm-Message-State: AFuF++nEwMtc5m500Uo3blInAIuguXhe1yjjQkRtXLlvjk5M6LhoedYD
	W1Z1HzBSrlg7jBXOWelthv+UHA0c+TKrbEt6OjmjTHj2IAO/8oGgA0Th9nG+jMIDjIl1zrt3RZv
	6flXwQ/k=
X-Gm-Gg: AYBFou1+znlAKQEusIUXKwOrV+BWYwtIPVopZ/2Mp/JNVB3qMjkPbuYpdyRKlzdob+P
	5SE2lNu2PWsmxWi+pdeQ6CScKbmiktnIGhtZsx+lPaSiicO9lo7CzEedJYo0V4iT2p9WywcMgcR
	7OAwAtmYtK/IEVile2HAgPafzc8LFXyJ2z1H9vYb1x0yfTE2yi4QHh5VaCVSUhTj1FFdlGqdUE7
	8FlIEdragpl7ysgmPDNMrW/mJyWNI+TbDbGqdhAXogeljQHR9Uk4DDTOBVrAhdYIeYjwqLS7WCZ
	PDgX+riJ8hRr660KNuNh+opWWwDZBD/GCFU/V0/ftQdvJMu14zM+omwfDktFXxx/di6i+YbW6Jw
	eL9NWX24j1wiWD7lzysR7p1Ja4FbKZpLlQxFqJIpxIS4CrX9qhKWq1e3Eh+shaIfa8TQi2lvnAT
	ydb9ZaT6s5yr39lFZiuRsEfCT9opKbfteX7/nwoizvR/1ZzSS51xs1rpYvxaXvRKwnE2xR6bwKs
	5I/jDQxEg==
X-Received: by 2002:a17:907:944b:b0:c26:1649:47ad with SMTP id a640c23a62f3a-c29e5308620mr488832866b.35.1789651242537;
        Thu, 17 Sep 2026 06:20:42 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.29.130])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de5e4ca9sm279681166b.42.2026.09.17.06.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 06:20:42 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 17 Sep 2026 14:20:30 +0100
Subject: [PATCH v7 05/12] arm64: dts: qcom: x1e80100-crd: Add pm8010 CRD
 pmic,id=m regulators
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-x1e-camss-csi2-phy-dtsi-v7-5-1a63eb35838b@linaro.org>
References: <20260917-x1e-camss-csi2-phy-dtsi-v7-0-1a63eb35838b@linaro.org>
In-Reply-To: <20260917-x1e-camss-csi2-phy-dtsi-v7-0-1a63eb35838b@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 linux-media@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Daniel J Blueman <daniel@quora.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1683;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=EaeknwqSJhuh1ncseWxkANLMYsY0YJYe+HBwoQ1P3A8=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqq+kgyvLmNKx/7a8E0vvMENeQluzSy5ElXO88D
 YVSHcEH1X+JAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaqvpIAAKCRAicTuzoY3I
 Ok6hD/4oSo8jEOwDcFtrvQXpDZuBZe4hnl8wzFzYSayiWr3r06H+ZnTQkVBgNE9AYjam80XbybF
 3u2VRuNYMcK/rIO8JpNKr+z1tjOT8rOkUtzXSYTsAt4eZzgzBqarZxo8ouWNYur5kK3Yof3xPv8
 WWHIQCz3sIaC47t0l92cSD3Fmk16CTXGF8nwbGGM/tSKN5jL7KPSI2xFmmR58B+Z+iHyTkM6v/q
 GDDMjeB1Jk5j1/RCA1Pjgd8LDgtH6vPd/KJNqwXlQhQL2bUmK8l+SM1tmuh4Ka9oKmJjJDxf9VM
 qyZ+4rTvApmVYubnIji/FCPCraQMKb7T22UYVzwI21QAagG2jt/79R9FIgEXoQl3iwtqRnBgt8H
 jeoh2H3fBrBN9ecRtR2l625H2mEZPcKc5XkNTmjpittrcpqgKsKhuT8irTi6oB/am/HoORPzwdN
 YBbNiYx3vFST0eCs+eA9td6ly8hFfQTLJ+BG0i3jtHKmExKhltidVTMYV0OfnfuuPKdC6APQfkk
 73o1uWuz4VkUCstXH8bxSe+JAxUqkW/7DDc/O3KYIYNUDGO2ojEeG056yeRbxn2YoEaywEKNtNc
 FttYa65i7IlbHyjb2lOybrOaZS3zhMTp/n6m9HmJQJNWhpIyzOIC0sTlNdV7Ch5NBoqit8RXEjr
 5dwI5nO0pkvP1hg==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Add pmic,id = m rpmh to regulator definitions. This regulator set provides
vreg_l3m_1p8 the regulator for the ov08x40 RGB sensor on the CRD.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Daniel J Blueman <daniel@quora.org> # Lenovo Slim 7x X1E80100
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1-crd.dtsi | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1-crd.dtsi b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
index 60db83b8985fe..47cfda908c515 100644
--- a/arch/arm64/boot/dts/qcom/x1-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
@@ -897,6 +897,36 @@ vreg_l3j_0p8: ldo3 {
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
+		vreg_l3m_1p8: ldo3 {
+			regulator-name = "vreg_l3m_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1808000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4m_1p8: ldo4 {
+			regulator-name = "vreg_l4m_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1808000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7m_2p9: ldo7 {
+			regulator-name = "vreg_l7m_2p9";
+			regulator-min-microvolt = <2912000>;
+			regulator-max-microvolt = <2912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
 };
 
 &gpu {

-- 
2.55.0

