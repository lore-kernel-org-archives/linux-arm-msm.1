Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795485442;
	b=GRn/EazyWu/IW5Z8fAzzBro60lqvNDR7xqFXBJf6lch6EGYz3kkOZdelcW7C/7sqPlKh
	 UB6wpZfMUQj4zylzsn+VtkHH34r4qa2JviOIe3AWOP2ELJb1uqY2kNKn7Lu0ESCsAI/27
	 vi3uCCUx+eH4aDtqlawsQbvRqUVZMa+uQ6UcxMa7zf/KqkFG12Gl0PQV5//m+pJesBSWQ
	 Ze+WDABYPCpVwwEuhKDSijgFhAv7eA5i+rb+V1elUuAoXUNhu/W8NYKdrdnDIdZU4q5Pi
	 ldhximiUAP5bEub8KbGPrkkHMWWV2ZE9EOisQB0NATeBtAQan3Mja1ZJpPJQnOwzkXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795485442;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=2tHqukXkgmKVS7Cb+5H41Ptle1JnEwhRrnl1VEjcEgQ=;
	b=2GNIWOgw44UNO9Kz6J4De22Ih4Ebff5Ih3FMLWUx4dZvMTV6kSlOLdduh4Dja/6DhnFj
	 LikRgNLpxuDeYtwIM/jrZHaTH7Oq7ao7RTIJUJORqFU1HyfZkNIGJn6CNlSsP9Ka2cIrz
	 DNLbsrwnXyih2CWGIkpcVQAwhWZ+lXCGJl+yZfXEp6DoJIw3U7csHrLFtkvaZe2wXreJz
	 tDG1/neWWDseKlcwTjqsgTZtENU4hsv16mt83l208PDkZ665G4t6CjKmRGnVX0h2sNfBe
	 nE4i5FmeGE+o70EnuFpoSBv3RLYGvlNWq9hQRAB1lnz46Pdr/ZwvtBgZoNzghTiljmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pI0HP7LA;
	arc=none smtp.remote-ip=209.85.160.172
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB74606A338
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 01:57:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BB74606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pI0HP7LA
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-5365d725440so37727871cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 17:57:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795485441; x=1796090241; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2tHqukXkgmKVS7Cb+5H41Ptle1JnEwhRrnl1VEjcEgQ=;
        b=pI0HP7LAUqSmIRHM1dqj9ex013KBAbfdOBRaJmYsB1gCAzOdQnUAtctNuhRTkQBGym
         1PYFqPtXVtWorcNn36WYS5OheMk2gemtrL3Pwd77GGrWYNAanwvByi9V9BR2wKcNykjx
         Hnek4vS1VvykppQQ6gAbi8wnQGhAmHHWrsDxo50c8Y9TQs20sQzxqMSbax5TxlenwoLD
         IhBxvQWus/thOm4FNJG9HD8WtHm4d7x2vU/QQUhOTeNCHbvRYTnV9HoXLaiKkUuFbN0K
         sqFnZmeQYmSisfVupAARY075Bpef9Hxi8VjPjtqM/iRds62TcJQJbYGdndUgtk4DwxwJ
         ILjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795485441; x=1796090241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2tHqukXkgmKVS7Cb+5H41Ptle1JnEwhRrnl1VEjcEgQ=;
        b=bEHrVN/gQx9UYvfHgsWABZ7ZaNrplACYsMBubWAC0mEq5tOgWr+QM2bcKLe4DiifiI
         MRQkoWflKxQzQLU9XZVEDy1ij8RhQJwztK4XSG6U8gm5V2/RdATdi20jvKNi/y/MdtvJ
         pgosc2eu2dhTToPmkTnRBpwmji2S8gXnHGc1lsjzW7D12gDjuK4qCwjzM0ZdM8JMP5Tp
         cp8XgjuwK7MnIXM8p3ad9rvoh10NJS2Owu8WSMkxLDCOKLHV8/3rXyRs4JlCXGYA2fWM
         dOBSeMS5VILvqhrFTLLjMyjNojn19G70ooVefF5bD82xwH19ghKeiN1/xZxGlyDW3Q5r
         FOqA==
X-Forwarded-Encrypted: i=1; AL+hErGCZlTi7Za69BxDNtUIwQWLaIazX4YqBvmS4i0ZuecCX76MRZX8ffKu8jlxtcKCg7Ky38y9Dnowle9YEvvv@vger.kernel.org
X-Gm-Message-State: APuU4Z8CPEXs1ee8OcNy6mCZL7XKUU9fakOrkZYj4y01T8JbBKnV5Eky
	IJ03Chky8hx6A9s295Oi1vaWx0/nlINDYpSfpU+Ji4oKcLq8SsTDD1jOgJ1b9g==
X-Gm-Gg: AZFdTZfRpYUNzwy3GhrOOtyo6f2DG44V8rXS5VBq42QS140JqUwugGj5CZM6YDK9jY2
	VchUcZZxepOzMmkLurzNKj7IViG6OW8DpkPgSn0MSJQouiHct0QM0HS27LV0erspAaO+1QdYrM8
	81uYZdCDqgQnWiHJIfXCJQXmWUTwCCjdpcN/47k8rNKoWPdC+2BRkVvfNbOSUkz/jxJmVTC/WGK
	AXUHl9Lh9BGHxnR14eI60W8eEmoGEuNGpaD7xqdL6RlNqL1XcVfsKvyhX8NtOzjsrJssyn4iMN9
	FG+W7iVeG2f34PEcI5/jpCrbzpqx3glccrzyB8ShI2QFe32DbtZn8PZhyZZpgj0Dh7HiRM6dNCo
	JDltH5cOJ2LxFk3VQi482rQ192y9DmI/B/QexMZnx+R/SRG/mUmtWo7eIoT+Pu2dXEU7e9iE4e+
	5QMk48msDNT7QkuOMzYXVHHmMUzrrFml1ZgjPVoIK9tfCM9LzChn0gr4v6kCXM88xLRIHmspET7
	5HxsaU8881BYLaw/Mipve6XTIACXrhe80RWr1whgmCAwN6UWT7x7rhXx53ms7tRNyhpQrHriOwm
	RgN6ESIahORqUMwQ036aNh2446+E
X-Received: by 2002:a05:622a:178f:b0:531:172f:79e7 with SMTP id d75a77b69052e-55d76a6595bmr246641221cf.39.1795485441396;
        Mon, 23 Nov 2026 17:57:21 -0800 (PST)
Received: from localhost ([174.93.36.89])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349b253csm122810176d6.15.2026.11.23.17.57.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 17:57:20 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: phone-devel@vger.kernel.org,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v4 5/5] arm64: dts: qcom: sdm670-google: add sound card
Date: Mon, 23 Nov 2026 20:56:11 -0500
Message-ID: <20261124015611.187024-6-mailingradian@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261124015611.187024-1-mailingradian@gmail.com>
References: <20261124015611.187024-1-mailingradian@gmail.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Pixel 3a has a sound card for built-in audio (RT5514 and CS35L36
codecs) and for the headphone jack (WCD codec). Add the sound card,
q6asm frontends, and WCD codec for headset audio.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 .../boot/dts/qcom/sdm670-google-common.dtsi   | 133 ++++++++++++++++++
 1 file changed, 133 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi b/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
index 2044593c22f3..9c89fb79ce74 100644
--- a/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
@@ -12,6 +12,7 @@
 #include <dt-bindings/media/video-interface-devices.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
+#include <dt-bindings/sound/qcom,q6asm.h>
 #include "sdm670.dtsi"
 #include "pm660.dtsi"
 #include "pm660l.dtsi"
@@ -130,6 +131,84 @@ debug_info_mem: debug-info@a1800000 {
 		};
 	};
 
+	sound {
+		compatible = "qcom,sdm660-sndcard";
+		model = "Google Pixel 3a";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&cdc_pdm_default>,
+			    <&cdc_dmic_default>;
+
+		audio-routing = "LPASS_PDM_TX", "PDM_TX",
+				"AMIC2", "MIC BIAS External2";
+
+		mm1-dai-link {
+			link-name = "MultiMedia1";
+
+			cpu {
+				sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA1>;
+			};
+		};
+
+		mm2-dai-link {
+			link-name = "MultiMedia2";
+
+			cpu {
+				sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA2>;
+			};
+		};
+
+		mm3-dai-link {
+			link-name = "MultiMedia3";
+
+			cpu {
+				sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA3>;
+			};
+		};
+
+		mm4-dai-link {
+			link-name = "MultiMedia4";
+
+			cpu {
+				sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA4>;
+			};
+		};
+
+		lpi-mi2s-rx-dai-link {
+			link-name = "LPI MI2S Playback";
+
+			codec {
+				sound-dai = <&pm660l_codec 0>,
+					    <&lpass_codec 0>;
+			};
+
+			cpu {
+				sound-dai = <&q6afedai LPI_MI2S_RX_0>;
+			};
+
+			platform {
+				sound-dai = <&q6routing>;
+			};
+		};
+
+		lpi-mi2s-tx-dai-link {
+			link-name = "LPI MI2S Capture";
+
+			codec {
+				sound-dai = <&pm660l_codec 1>,
+					    <&lpass_codec 1>;
+			};
+
+			cpu {
+				sound-dai = <&q6afedai LPI_MI2S_TX_3>;
+			};
+
+			platform {
+				sound-dai = <&q6routing>;
+			};
+		};
+	};
+
 	/*
 	 * The touchscreen regulator seems to be controlled somehow by a gpio.
 	 * Model it as a fixed regulator and keep it on. Without schematics we
@@ -550,6 +629,13 @@ rmi4_f12: rmi4-f12@12 {
 	};
 };
 
+&lpass_codec {
+	assigned-clocks = <&q6afecc LPASS_CLK_ID_INT_MCLK_0 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+	assigned-clock-rates = <9600000>;
+
+	status = "okay";
+};
+
 &lpi_tlmm {
 	/* sensor gpios are protected */
 	gpio-reserved-ranges = <0 8>, <12 6>;
@@ -613,6 +699,23 @@ &pm660_rradc {
 	status = "okay";
 };
 
+&pm660l_codec {
+	vdd-cdc-io-supply = <&vreg_l10a_1p8>;
+	vdd-cdc-tx-rx-cx-supply = <&vreg_l1b_0p925>;
+	vdd-micbias-supply = <&vreg_l7b_3p125>;
+
+	qcom,mbhc-vthreshold-low = <75 150 237 437 437>;
+	qcom,mbhc-vthreshold-high = <75 150 237 437 437>;
+
+	qcom,micbias-lvl = <2500>;
+
+	qcom,hphl-jack-type-normally-open;
+	qcom,gnd-jack-type-normally-open;
+	qcom,micbias2-ext-cap;
+
+	status = "okay";
+};
+
 &pm660l_flash {
 	status = "okay";
 
@@ -655,6 +758,36 @@ &qupv3_id_1 {
 	status = "okay";
 };
 
+&q6afedai {
+	dai@89 {
+		reg = <LPI_MI2S_RX_0>;
+		qcom,sd-lines = <0 1>;
+	};
+
+	dai@90 {
+		reg = <LPI_MI2S_TX_3>;
+		qcom,sd-lines = <0 1>;
+	};
+};
+
+&q6asmdai {
+	dai@0 {
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA1>;
+	};
+
+	dai@1 {
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA2>;
+	};
+
+	dai@2 {
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA3>;
+	};
+
+	dai@3 {
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA4>;
+	};
+};
+
 &sdhc_1 {
 	supports-cqe;
 	mmc-hs200-1_8v;
-- 
2.56.1

