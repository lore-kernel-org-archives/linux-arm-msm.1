Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E04446BF1
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 17:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785433462; cv=none; b=rt4SpSb7sXBYS+ee1CpshyMIEnCsmKSi/6+5ciakM/Cp+45FEvNWQQHdTUpgpNwJ2/uF5nxsXeJQts9xZapJptBgXfJD5JQx1SjEWx3KzsbO2k2Zr7TDWaCDbAeoDbCFg74Uc8Ss3D8EfxnZuByP9w6JgsG+2K8LrCNCz82pZrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785433462; c=relaxed/simple;
	bh=7kIt3VDOmhqDwU+Vb6EyEntTuqJB8bsltDHuVoseCHU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fDQ3Q3cvES2+yLisRhAxrA76wTOCxBKXiBv6vGKAsoXmxa8rV1XDqaX6w7je1lhX74OL/Txc45/X14tOlWxhV+9kHAXgcDGeaqcUGI1Js7NVAz2n+OKDpNDjdqPtPZaEx3Wm6snLN94E0Wmu3klZSWbVxEv7qWjacT+z3fETR70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b7lRthR3; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b7lRthR3"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-92edb12cdf2so8508185a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 10:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785433457; x=1786038257; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a6pr9y+eV6Wrb9MmFfo+z0pmIGyd9l991e5f78BS73g=;
        b=b7lRthR3Fa8uiXh3uKwNdWGnR47yN8/K9YJyzM2IpSYIqHAHcchyERCWAmr0sC8Q2z
         qt6IsW6I48jVUCKIozmx4YXVUcncDPUpIMnv07kougsXYJZyXb5p316dlLHXhW2wDLgf
         TgWLZA2BIraw9EWeGOuWd8e2VWrvCVulkv5JNOlBc/UBkO+sDXHNPS2wK9U20Yj4SW9E
         vI0fmu8NRVXyoA8IkfJTrGAKW81GVGKp5Z8GQt/lbcFXzapS9WZtQXbjPb2Lvmhrr9Dq
         57Ss8u/DH6TL7ftpjV/9l3jlnWpLtgQVjx1LH5RIK2/s1MatiUITlN2XiBdPfW2yYZjC
         TUVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785433457; x=1786038257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a6pr9y+eV6Wrb9MmFfo+z0pmIGyd9l991e5f78BS73g=;
        b=Ux5zBjtBTw90kgC3rkCJOoQy0exvGkbiIfzBNeBEVjS6TahoUAY8JPQeQadQYVjlvX
         AUh5lsGNd7fNH2xj0ha/615wcfJNt0fQr8h2P2F/0sBefS5zTpvsjlG3P8W5T3P5oEj4
         vs60H8QpgTw2J7K57NSA/GFdKcoTAWkEwhHFZbNDOaGPuyPsz42r0jgE3IKVvOWXI14j
         CKA9p5X8SSVaP0MmeHIkn/8OG+fPjnm3kZqAk7kMQ+YjNdGDPJ85btVoO924KEG7pK1l
         7lkVD3oYPYk56r7P3mKFdtnIY9t09ZppN61QnoKHMvgkPNs3koHv93G4sGRyK4udLfP/
         tY+A==
X-Forwarded-Encrypted: i=1; AHgh+RoX0ctkY1YjogckVBxGU/87QTSK2plE5+a/SmQHXR8cS9zNFVeCSPj8mQJq3V/L5K22bcuH95SGsgTIG3hB@vger.kernel.org
X-Gm-Message-State: AOJu0Yzo0ikuW6+r/YYZbqmfOiExuJAqE+xVBnkW6Vy1odm5WWIJ5fc6
	K7x40Aqs5yZBVqe5TTXD9JCJMjQvGeWKCjbtPocM1A/l0QVUgmSKLm43
X-Gm-Gg: AR+sD11cy5i+fwU4IVDr7zmda/Ee8p/S9uXOKYyCLOUJwBIH03NOUShAYvxqPF2X6Tg
	VDOoNJTd7XPSCnsQFOe5kz/PtZeR8QMwJB6Td0iyuMgEVek02+ucMXI9GYkHxyy9x3LaWBWzsnV
	r9kfdMm83I+Nac4eEg835/qMQiXmfMiRABcG481Yw+Yt+1M+S+M6xMYJsjhrmt8v6Jao1gTWFBq
	EDve+S5CfuoE5GNWm8gon/2Vr7A8Haa1pzuKvNOlzhYrCIE/o/lB/4RYQxtoLiOaQ1Qf6vRAsiw
	NZeS/HONrv37lFh/YHT0BfFR4FIGzeI6NNVQ/Ogn+d+FlTvGjKkTgiu4hGzkYYY31czqBsJPxk8
	wO+Oi5XyhPvCsWfVSegQ2Bvc0F83TfKBWllZ85yvDRW1FtGDyR7qx0SdNGVKrl7GukyNbI3WeHm
	g6+GX5ZsUPuVb6QBQ1dzPDez1hvbA1RelFmtgTxRObHUxyjke5QvTCdafMzLs=
X-Received: by 2002:a05:620a:a2d5:10b0:92f:bed:e252 with SMTP id af79cd13be357-93486af7b4bmr303925785a.48.1785433457373;
        Thu, 30 Jul 2026 10:44:17 -0700 (PDT)
Received: from localhost ([70.54.57.80])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-933d325a17fsm460156685a.13.2026.07.30.10.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 10:44:16 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Nickolay Goppen <setotau@mainlining.org>,
	Adam Skladowski <a39.skl@gmail.com>,
	Vladimir Lypak <vladimir.lypak@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
	Johan Hovold <johan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v6 05/15] ASoC: dt-bindings: msm8916-digital-codec: Add SDM660 compatible
Date: Thu, 30 Jul 2026 13:43:43 -0400
Message-ID: <20260730174353.108023-6-mailingradian@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260730174353.108023-1-mailingradian@gmail.com>
References: <20260730174353.108023-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MSM8916 digital codec is also found on SDM660, typically connected to
the SDM660 internal sound card. Provide a space
for specific compatibles and add the compatible for SDM660.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/sound/qcom,msm8916-wcd-digital-codec.yaml    | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,msm8916-wcd-digital-codec.yaml b/Documentation/devicetree/bindings/sound/qcom,msm8916-wcd-digital-codec.yaml
index a899c4e7c1c9..33bc23b6176a 100644
--- a/Documentation/devicetree/bindings/sound/qcom,msm8916-wcd-digital-codec.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,msm8916-wcd-digital-codec.yaml
@@ -14,7 +14,13 @@ description:
 
 properties:
   compatible:
-    const: qcom,msm8916-wcd-digital-codec
+    oneOf:
+      - items:
+          - enum:
+              - qcom,sdm660-wcd-digital-codec
+          - const: qcom,msm8916-wcd-digital-codec
+
+      - const: qcom,msm8916-wcd-digital-codec
 
   reg:
     maxItems: 1
-- 
2.55.0

