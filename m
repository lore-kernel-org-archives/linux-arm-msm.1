Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CDAC378D94
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2026 17:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788974689; cv=none; b=KbP2rCi+Btlfj93gO+UpweNRxQ9+C4gVwiOUgIc7g+y0xqrXkVsMFgWq+0VfW5PyHrcW76IrMHUilEatJGz9dIHV6Raky4dHs1yTC8weNL+aYTnFxmyrOSfPfUDNgDLTGg6O3cUQbHrdV1mcllzCYiNr/6etnD4GAHD0DThZW+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788974689; c=relaxed/simple;
	bh=KcdkskPZc+id3U9zkCYQWYCGpi5lTG9LAShHAZoo/Y0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t0YlpVXjeVrMe4GrerrtEcWM1gP9RIqnsgUW9TFOzQ5c1ojY7LuzlMM3DiEGDUeRuoVQXfdJKSaR49MXzugGyYldfOQJ2JDLCaMbZF7ciPipxV/m5hLMthGQQHc/z90FVN4A2RLuNZLpEG0SblYsgqKYk+CqD0T+sw5djDt586Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GSg/tEIP; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GSg/tEIP"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485b1d2874aso447524f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 10:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788974686; x=1789579486; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/Bekkl4qhHUf311IFcNmMeQeQNaNKK+Rl4rP+OQD2u0=;
        b=GSg/tEIPcHNuJw3iTN7FBb/EKk3i/MDXtijd00PFP48SxYsLlnVJ8MVDW3OWpH2qAQ
         NSee93xdsu8HaSXNrptstRrgaFprXpsZ2+GMQYDmAIB8WAnyvBtjRI0HxSSMnNvBWOaG
         +kjeNMU8vrUPtX9YKrIBcubDBQE8kuekv8Ops4bclqKPha4MWpAy+u0LDMd3Rs4cu/qA
         gzk5bIJosrSC5/XknaYcbTClDeDbz8fbNGZrYAWwQbWQczVKIwKiD4Ir8zSPInJhVxKz
         XB/ZGwnz8vJBh8eqGxUZxe5IfWvJeWJuZ9ocx2xNrCBta2wfB3Dvx9pJPgs0BYr7Uqyz
         1m/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788974686; x=1789579486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/Bekkl4qhHUf311IFcNmMeQeQNaNKK+Rl4rP+OQD2u0=;
        b=bxtOTzmUMz6Db4tFbWC2j94wZjeuK07OEUCu1AEC5t93QAIde7gwDWLbgfElTpltqF
         MVE+llQJYIqeyvKRCQn4/0Y7X6a1APaEj7iboSIIStR7cZDpBtin3vaQJmYmoY7lAbcK
         zf5g7HRfwWN2eXGpuCTWV6lTHW1H9Jb/4yZh1qpIQklj9zNQXvfmti26K1wf64VxfZBt
         BuJN1lyDUFryfpcFiv5ZAYBqc/ydjEMa2EG+CC+4XudJX3/WLtIp8u0Fm3Sj1rZuJMOH
         W2yMlIanbWNdGXZ5aaBjDP07kXPUHGfGA3LHdou+CD1T1P+wJw2wdrFwg3StNZuG6MI+
         sLKg==
X-Forwarded-Encrypted: i=1; AKwUvBw0mqa/LkvzdGcgO0i7D2pZNsHBwfeC10+GBQRis2ap73/p5SXtVEwT30o7SVO65u4YBIJkmvscl2liSNVf@vger.kernel.org
X-Gm-Message-State: AFuF++nYflP8SoZksIdisGQK7dEk3epF02TZYIqwfBuPF9lGTkDf1VHJ
	LKl1CCJKOT9SM5MywvFY9bhFrXRDpvXlvATcqttzy1aqU2GJNEjkdrJn
X-Gm-Gg: AYBFou2HNH8f0M5XbO2e31c1k80mvCXsbI8TtUCCpCJZDiKaTlaarIIEg778bgM0pdL
	5xBQb0F8gKkuu1iR+12Q8/lZsoiLdgtf6FMlhJcDZOMlEnZ0m3E3RxtxCmKOoTtfCbA6YrKJaos
	kTdyejLbApDpLl2u93hMijMU5lspvEg/O1zIFlJ4Xqnpxib99l+CmhzehSxkzBtCxkuvCTvYcD0
	5TSSqo3MjVkHcWiClFAzmxpvetKwp/BGNoWwRlR2b7wzTadtOL5jOix1UOOBqS5BTTq2Qt+shQa
	5Z+VqyKTKlitzYu60TT4HFbe2z6XciPz8vKHmjQM49Lg6D2HgnVl3t+HSlcg9qThrxZXOF32rgg
	E0wFlCII755GOm2Bz5wNU9F0sqk/Zx6BuGdXX4xW5U7LIYvVHDws/FfGmnZSQhdCDWEqmL+FulH
	t4ABrw8kHxh+SdGyFWSLY7+JyG79Du7YlDIao4Km83Aq0DnHntw5OdBn/dvOW6SpRDJqbImxaTy
	JYWtZCHK0SzxvhCrVJKKez3b2/RBR59146rbFo6iWRFvgCl0dfEaityeviOOI3yRT/+
X-Received: by 2002:a05:6000:22c5:b0:485:847f:fd9b with SMTP id ffacd0b85a97d-485ba5ac3f3mr4734806f8f.6.1788974685634;
        Wed, 09 Sep 2026 10:24:45 -0700 (PDT)
Received: from archlinux.ht.home (89-74-4-99.dynamic.play.pl. [89.74.4.99])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48591eb3d3bsm30311792f8f.0.2026.09.09.10.24.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 10:24:45 -0700 (PDT)
From: Jan Paszkowski <jan.m.paszkowski@gmail.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: marijn.suijten@somainline.org,
	Jan Paszkowski <jan.m.paszkowski@gmail.com>
Subject: [PATCH 1/1] arm64: dts: qcom: sm8350-sony-xperia-sagami: enable UFS
Date: Wed,  9 Sep 2026 19:13:12 +0200
Message-ID: <20260909172421.33593-2-jan.m.paszkowski@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909172421.33593-1-jan.m.paszkowski@gmail.com>
References: <20260909172421.33593-1-jan.m.paszkowski@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The UFS bug that haunted the Sony devices seems to be gone this
generation. This patch enables it for the ability to use internal
storage.

Signed-off-by: Jan Paszkowski <jan.m.paszkowski@gmail.com>
---
 .../dts/qcom/sm8350-sony-xperia-sagami.dtsi     | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi b/arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi
index 4b62ee50da7b..969c8cb31df9 100644
--- a/arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi
@@ -893,9 +893,20 @@ sdc2_card_det_sleep: sd-card-det-sleep-state {
 	};
 };
 
-/* BIG WARNING! DO NOT TOUCH UFS, YOUR DEVICE WILL DIE! */
-&ufs_mem_hc { status = "disabled"; };
-&ufs_mem_phy { status = "disabled"; };
+&ufs_mem_hc {
+	status = "okay";
+	reset-gpios = <&tlmm 203 GPIO_ACTIVE_LOW>;
+	vcc-supply = <&pm8350_l7>;
+	vcc-max-microamp = <800000>;
+	vccq-supply = <&pm8350_l9>;
+	vcc-max-microamp = <900000>;
+};
+
+&ufs_mem_phy {
+	status = "okay";
+	vdda-phy-supply = <&pm8350_l5>;
+	vdda-pll-supply = <&pm8350_l6>;
+};
 
 &usb_1 {
 	status = "okay";
-- 
2.55.0

