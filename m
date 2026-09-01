Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2825471D1A
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 08:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788253145; cv=none; b=K4cavX6Xue1/cbtyIYRVAZSOVaQcLSaHFQosdQB8bKhfkohmT+MZpTjEU8UkVyEuKTBLsd+YcityFGI4c7rpx2gmsv1BgfSv32yZZYst9t803ZXVOF9i8bbX6ybCP+ugPZCjNpw96wWnLMjmBV2aSrVQwxR+nWP5vLJcwwB12Fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788253145; c=relaxed/simple;
	bh=pMEbDuBRkVjTzutAX6WB4Uye9UNziOebWD94UCX5+eM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q1aV2L2HILmOHZHkWjs9lJc6pNCK97avXZjvop3EsP+DD1p0yVZndp/IJyAQf2Z4t/2AygULnvTIDiqS5qAMbvx2gyKJOjRizBP7HtBIfNct/qq3QROZx9PkPeB1mAZlsdqt+QksxbYfZaz6SUKEYT5Iu+mkykdwkfTdIxAWM0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=qkYkGnc6; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="qkYkGnc6"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c1670dad7a8so107046366b.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 01:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1788253141; x=1788857941; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GOwg1HZyXLTOiSDtndwH6Webw2VVu0gCNVdDiokm96s=;
        b=qkYkGnc6RFOlbPN157AKjXuhGGXSD4QaWrBqPOmGY471JMGRGxwU60hogJnYMTmsJL
         E/XKDGNZEEHsZs7e92eMZuvPUDOnjmLoAv7VVWxuhRWUaGcZ4R+vL6Q2WCpopD0tgQin
         Gz6G7f3L/wjgnE2Oyvzv17zINVb/Do2gVPiSUqnImG7pmozgsq6Elc0m2z7yHmbJQStS
         0UQE03EszSLRi59cqgbuzY/IWemCDw+KL5VrgtN7ybMxogJjyU031g+P1XXDyHgZpWiR
         uImipb8Gs0tsWl+Rdz45iOLg+h4H0lTQXPvCowgpcUfRRL3hNaEPdTH9wfY63+s+0buI
         c/mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788253141; x=1788857941;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GOwg1HZyXLTOiSDtndwH6Webw2VVu0gCNVdDiokm96s=;
        b=Plldn2iwL3G8e9DwgwTZSQn+OYwavXzDfhKGC8nid6jxiVJmzhut9vs9laADqIEeWv
         nOV+Wlgvk9V5K1O2/Sfa+Q0dDv94qZ/AdKUIX1ACiO7ab1InhMOeMG/hVXIl3h2FHYm0
         0Wnvqx/7/c5JFGyFk80e8Ak2d81njSPgIY58dkeYN0MqtMzTvHyrUB733L8qE9eaclcW
         TAo2CvYaVwBxrlQGxFQxLX1LZ2sEH/wz4NIeZ1KvuXjXZ4kbntFgc77nBO8FtRylELCu
         R9cIrx0fpXNyHrxN451++VOd6ax1AI77KzYaj0eRJc61soCKaHp5OMdcDbd0EnTbWjba
         R+Pw==
X-Forwarded-Encrypted: i=1; AHgh+RoUuEvi0lo6EMxIfrwZag93tGpgpGfJI1/9+LPiuG2QBBUueLtlk/I2ZUjEmU7dOCosjCEc6lnRMMDIr5a9@vger.kernel.org
X-Gm-Message-State: AFuF++lHNC3gKMxjLBFpy2A2Pl78mY2YCVi5H35DbkRaU6/HdBjyaaUA
	Tk1siaKNVjSKlx/tAW+lHW7zaxAcDjDoUg9d8DXkwVnGIJ4qnyJc8lCUX3dPaEwJbgQ=
X-Gm-Gg: AR+sD11LFtJL7W2scl66XNKyFaqMAhGyFURJzmrLGji7+paxmdy3MTXl1EwQJZMwdu2
	+JgX0Arvn6nk3dnahL6wPtAJjFgwFfO361ew7MydeoEamzFvfuI0EoMRtc6BGxhoGpDHN4iPyLl
	4mIXYkFOTT5ptO9h0GGM+sMNaejv7L5CpdgrVyPf06N2S6O98kkrOo/hIVnJdSzKxmp+8+vEa4m
	dPqnRJhsBuwlfxJKmP6Kro+BXOQpXenx+JBpd624Rw5Bw9WlG5DMkZ5rC6M7H21/d2cmcRu6pAA
	wAIEqEwWS3EePswVAYl6Hbba+V1VsTFBPL7kPLCn3KfZtDndjsVvtZnOi8SHuT/eLx0uEGwn0Rv
	cdTSNkMR/V+qVOlSBqrnL2arYiCfXrk5BKS7XqVstSldERoHdOq3W/6UOX4PhQBT8Zp4fT+oiUD
	kh6Aww2gOPS7BhMckIQnIgf0Z85uLiWn39FuugHc8xHsHIm9bLeicfTVtRGIu+kVEyCHAy/5vUo
	Zc54BUsbCqc+XpyuJXuu0DS3ZXaaQMxzwpmQ8xasKA=
X-Received: by 2002:a17:907:1c09:b0:c21:6f8c:2335 with SMTP id a640c23a62f3a-c2557465a51mr2059911166b.16.1788253141098;
        Tue, 01 Sep 2026 01:59:01 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2564e314a1sm511942566b.42.2026.09.01.01.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 01:59:00 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Tue, 01 Sep 2026 10:58:56 +0200
Subject: [PATCH 1/4] regulator: dt-bindings: qcom,rpmh: Add supply names
 for PM6350
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-fp4-regulator-supply-v1-1-68288ab70aee@fairphone.com>
References: <20260901-fp4-regulator-supply-v1-0-68288ab70aee@fairphone.com>
In-Reply-To: <20260901-fp4-regulator-supply-v1-0-68288ab70aee@fairphone.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788253139; l=1244;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=pMEbDuBRkVjTzutAX6WB4Uye9UNziOebWD94UCX5+eM=;
 b=b+VJg5THX2bwt/KVwFapq/kFH+wKEmslAws6Lc8BPKglYjojvJ9XS5dXePXyG19KNzlNs4P0i
 imNTyWOu/KzA08qNyb6QtFe5NCQqwpGUnDJ1ALyDd3zp7Q9XphBFPbb
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

The supply names for the PM6350 regulators were skipped during initial
bringup. Document them now.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 .../bindings/regulator/qcom,rpmh-regulator.yaml          | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
index eed2ce7fa861..9115885e7985 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
@@ -187,6 +187,22 @@ allOf:
       patternProperties:
         "^vdd-s[1-8]-supply$": true
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,pm6350-rpmh-regulators
+    then:
+      properties:
+        vdd-l2-l5-l7-supply: true
+        vdd-l3-l6-l8-l9-l10-supply: true
+        vdd-l12-l14-supply: true
+        vdd-l15-l19-l22-supply: true
+        vdd-l18-l20-l21-supply: true
+      patternProperties:
+        "^vdd-l([14]|1[1367])-supply$": true
+        "^vdd-s[1-6]-supply$": true
+
   - if:
       properties:
         compatible:

-- 
2.55.0

