Received: from mail-qk2-f40.google.com (mail-qk2-f40.google.com [74.125.230.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65EFD480327
	for <linux-arm-msm@vger.kernel.org>; Sat,  3 Oct 2026 17:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791050245; cv=none; b=n6iFk7UBpCqzoZwIT164V764xwiOEcy8nFWcNhNVG2WtNG0R/v8Jd/WydhaRKHZOHH9ulMkT5PlAiYeGNTXpiuj2iBdbCLF3Oq5UOZX/EEnezCG2iE5Ul/jTG04hmUS8+89REpj21tL1m3OF5a8NIeGKMpyvpKnyFr5G6T4Y+H8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791050245; c=relaxed/simple;
	bh=xHotjqAGKY0BfEaoc5/VHSKIpt7goITnesNH+tjV+xM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=efR32AmobtJEqLPgP9YfoZB8W4WDi/5Mw5lQZrDH3sfEoSuU6DQ1w9722YgRz6nDbRZv97NNE+EaX/tKXp/wEhZbxBcM3QK5FaqTxBpQTn3Gd3iUzM3Tr9BXFmLFhaG1g8syYYdLTalQFn+I6camQwttU/akul/Pf+bC/IZpuE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hj2u4bxw; arc=none smtp.client-ip=74.125.230.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hj2u4bxw"
Received: by mail-qk2-f40.google.com with SMTP id af79cd13be357-93cc48a2aeaso40364685a.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 03 Oct 2026 10:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791050242; x=1791655042; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p6QjYAswNnM/54XR4wboKDCX2rmH70bPtkOCGiylTQc=;
        b=hj2u4bxwbyxdqlWjlhh+nPwS6Et2Ih7tsJA5B7OuwKzP6Z4M0ydBJx5X9YFHiB+HT2
         p1A4wCN5+UfMYUt56n5DrWMSeAqvd3BzNP4dSOwekYcr4kRwiuz32H2hjxTSp+hVD+0H
         6hH1zDtnvTbwCCbMZglIot/nsawXNrESh+gDPo7ybl4cNpLzgrgQYr4dEhaVIPiLj6Mk
         1Q8KBielWVn6WvtD4Wn45AyiL8I6nU8ZcHuCqeqhJ2dIKB/ntaXLITaeJAkHpKyX5A2z
         C0aUZYMKOO25GW6C7iqhUWE4lnH6GZExCAof1wbPAj0M9j3Hgosn+ZcCsebO1c793bM5
         hJdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791050242; x=1791655042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p6QjYAswNnM/54XR4wboKDCX2rmH70bPtkOCGiylTQc=;
        b=dsb7Cvv8ZW8eJtFXBYL4hk0DPICU6kkMaVPpLvMm3pfEXdhe9iW6IFK6wu1Ztisemt
         2k7zN+jCsA6+v8L27u/KQY1v6zQUm5oBq/On4t97HbFkK3ijKtAp375+Wzvfn//MWBX9
         29MsbUCzCt5C5Hefkt+JJcmr7Dz2Ue+ndxHi9Yrffj6zguBMjEgAzjXmhu5eQikgpcyE
         s/0GDBxGCb2tQs7pX7jpj16nMWiAfakJZeaCA/64mQ44RMAXLG8FbcElEVMYIiJbHpFh
         x4F1IkJZywhZOosWT8iuWlgJ9Sv97W4ZfzG7dWSc/pHthVGrZaF6sav6HKlJSq+Etnzn
         W1tg==
X-Forwarded-Encrypted: i=1; AKwUvBwZvlw1W7ZTWc/+Tsu+OzzF+dF00ly7YRyNB9stpR12Lx6IfQju7OJ5YPZkCwbcgumwdf2CcCRQWVwQRgRT@vger.kernel.org
X-Gm-Message-State: AFuF++kL2tN+ab6hITXOCtFT6LNydCAt7CGe8wyQi2dlBFIwcFlhZlmz
	C1znCtW275f9g/TqinpeZ5YWGCjebWCFv+hSK4MPC9yD17gN8UzJaDs+
X-Gm-Gg: AYBFou10dWYyqXs81E2YkpyjmOn50KS5Zx0SEJ9Fsv/BNY3vMEy++Ym41FCHpc+7z0O
	xIwfoKVOBIqF+6Xr75pQtilZpySOEYFANvIMMw98q4ujOXNnDFpMMRPPIzWRXn9i3WYzF95TPIW
	hLiSFo1VaCRb/iw6qaRDfwP5cwzP4IeCWHFsbfUQ3WoUb4ZD2aDYfoNpTm8Hwdjxn8uana/X8Xc
	fA1zYYhqzwjNLp29EvrD99zFDGjOSF1W8ReF3PV3TIYIjGQIsF0gg8Kdd+6z65+ApkEv9ofy3qn
	VTbczvqlpZl0nilsyCZa2kVwt8KdC9hu7qFzQiDhayFa90R5dOlo7Cba84yPtGy9HzZTfmrGMEb
	ST6gQW1c5pHXF5NVNxbqOdo3aBEi4aQLF5ANJ2hf7oXDeqgwL8XW+7z1xcXyVbLjzGDo2q3wL7k
	z+9lbdI5BW6df43EYK6aNDC89H1nbdIFfTu+6eFEbdP+U9aidG0/sqg2VfMvp9W837NexOp0BRf
	Q==
X-Received: by 2002:a05:620a:a0db:20b0:93c:c90d:a116 with SMTP id af79cd13be357-93cf174b109mr820351485a.37.1791050241827;
        Sat, 03 Oct 2026 10:57:21 -0700 (PDT)
Received: from localhost ([142.181.121.230])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93e4e54eb2asm283924085a.28.2026.10.03.10.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 10:57:21 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Jassi Brar <jassisinghbrar@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Andy Gross <agross@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-sound@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v2 10/11] arm64: dts: qcom: sdm670: add digital audio codec
Date: Sat,  3 Oct 2026 13:56:58 -0400
Message-ID: <20261003175659.23536-11-mailingradian@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261003175659.23536-1-mailingradian@gmail.com>
References: <20261003175659.23536-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the digital WCD audio codec to the SDM670 device tree.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 arch/arm64/boot/dts/qcom/sdm670.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
index 038ef0f73ea9..91188acd16b1 100644
--- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
@@ -21,6 +21,7 @@
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/soc/qcom,apr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
+#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
 
 / {
 	interrupt-parent = <&intc>;
@@ -2541,5 +2542,19 @@ data2-pins {
 				};
 			};
 		};
+
+		lpass_codec: audio-codec@62ec0000 {
+			compatible = "qcom,sdm670-wcd-digital-codec",
+				     "qcom,msm8916-wcd-digital-codec";
+			reg = <0 0x62ec0000 0 0x400>;
+
+			clocks = <&q6afecc LPASS_CLK_ID_INT_MCLK_0 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+			clock-names = "mclk";
+
+			sound-name-prefix = "Digital";
+			#sound-dai-cells = <1>;
+
+			status = "disabled";
+		};
 	};
 };
-- 
2.56.0

