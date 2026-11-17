Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919192;
	b=zRArs+FuG1Tj8zraSzoLmUTW89DeSdCZWN6Od8N8KO0kzs3H3aBlnNgMIxhYG+tkOn1p
	 si4nw1Q0FTN0fCBumHhRi+B3RB5D2FLtVDsQcKeEghrF4g8anmaMswm91HkkNMaX8W2vg
	 F8Ca3Skk+i4Id76qrahN6VgYAQ1lqBpzPCkDmPtpZ5h3A0p2NT1rY2gxWCSlvLHr/WZsp
	 zGmCZhFJEiltG1iDvhXV6T8mFDAZa9HwdI3tGP2Q62rxiDcwkc8UfRk0wDD8ATUusARk7
	 iDvf1BhHHrTqQlog6tTYmZctJaINnc6kjz5oyhIAuyqBzzsuDErWxuwXwzgLtGw3UYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919192;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rwJM/btZEuTlA5fjq2BpjxzgulZAXHvNDImvE1z8MG8=;
	b=Fw6pX2ucY9hEx6dCSDF2H6HoIHCMt7erup9Zo2pFNxn2GXTi5ODOGIe5Rka61/y9WgoA
	 dcU+9LG4b1em3baa2mNGEE24cRCtByMwIHDF+yv/aHxp3+juAwsypakbH2MehttoTOOq5
	 HKmwmVmPWqE4NZkNg51t4s8gYv9A031ZglfYdf32eR8M0y2mRJRphHyElCemVnchhr2ZB
	 HA+dwQ3IHm0cXRyKX//FGNLqivQAbOGzE/vlOAGRfyfepIGzvNJb8kojX8lAu7KXas4JI
	 Smpdx6TScLakd0mtAWUdAPjf7tYFru4a0Rl1FrQYiI+YtUu0opaemUCTsAxn05yaH8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p2QL0sBf;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC0F4606A88D
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 12:39:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC0F4606A88D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p2QL0sBf
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb55cda775so6325245e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 04:39:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794919190; x=1795523990; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rwJM/btZEuTlA5fjq2BpjxzgulZAXHvNDImvE1z8MG8=;
        b=p2QL0sBfCSrXZK7z69n/Xb5ZdxxmzCyFRVDFk9wG3bCxvJeWlHMSFo5kACNIcbQFgc
         AGUGL9NwLq2UbaN39WK9LRWGrJy9A9jWBfhVlV7JIIVmIyrjHqDqIYzWNpo9+doUSEE/
         b2op19hmatQWsUEaoBJuZk0hAotqj4jEHwBiDmVlsq4qOmZ49EdcctCVV8pQzjYeuD6+
         Ls3mkpF1ZAoJpETbTHVANgq7VQfCXs/Yv54qoOF3Z6ImNn88EGN7MDc1SU0RHRWLKE4q
         GVe86wbn+mRFXQQteW/6yy/qNXoWf0sHWfr//IuZMSJlc+K44K9rVevgEP2urq3qYHwf
         c8cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794919190; x=1795523990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rwJM/btZEuTlA5fjq2BpjxzgulZAXHvNDImvE1z8MG8=;
        b=bdQI37Oe7wmMSl0JIsnkXtWr5HWOUp7cUenPVuaRXZwiM63f13wv/3rSuR4yMx4/x6
         wsU/SHpSnJ2LR/ZwIQgyRa1KTU4ZwZXldXt2yC+YrL7exCeACf83mFiH8340n7beZZkR
         Co3JCBZGx8Gw7Fr6nVdFYZPUj/dCJt0e6PS5AQkLRl7H353DowMV2hp43RA5O7CoeOel
         L0mu2ewC4bnNTQ3MBAI2cbX+CIVRpGH0CI2raYhW6GjSC2KB6yoXi7ncflOFxh2H+yWi
         yROtSFuPsXskDAdyJGDCc8diYniN93URyBUPYn+bNno80bQhhNECYtfyLcJVRljIBYu/
         Q/xQ==
X-Gm-Message-State: APuU4Z+oDrQDWRs0I9+PuJMmbJlX5F3/OGMOaP3Z1eQSjEobehWfkbx1
	SQSLtgILR513b6D7w5O/HUiIRMT0UMVGfc1G3q1k98Btxz8yWn8HuKdzODApit3qguNAsQ==
X-Gm-Gg: AYBFou0yUk4fQyGLOjTxsU2Ps9klxUnW7iT1zjiu4pkhXo1Z0vF5o4v4BlPBLhcTelz
	dTAa+1C0AyjirsgrIDwFaeodBAmFlH7lXA1yOXPMCa0qJ3f+BRbuNiJvlXmn+oxOUoX328oLErC
	OyXiitO/S7ihr7h0nQa94C/0f2q9Un0EkJSpMlKrFtUx+IHXd7E9cy4gyIrpF6vVo0YNSlLlCrv
	j1LDkvL29GqxQzr22fhjwH7p4SJBtsYguRk5ZUQAbcKTlaU72JaC01x3uZgRIbvEoHd6z/11L6J
	fZUeTLl4UwXIJ26cte8IwhDk5fOvkvcPgnwVDaT1MyRr6tEbzbn31wdQPf8/WmCQ/JzdCePF5a+
	Ier9trQowPEc/Pb2D5Yl6qFBevVX3xYyywjifQEjTMcr1LhHCtfdW2dZ3LMGp7OBq4jDrpIgreH
	uLniPKOHBvtZVt4k1rQgzs272iJIBtAHlhu5VRD3s5E774FzHjvb1vyhPd+YnGPO2AmoHy2g5fh
	GG4H8HhKrksA0R1D95F2a6xqNy6OpaWQlp4CKT7S4y+GNxEul2nT9lcvdfc1rz5uiDASkgE1NUr
	fyhEgG9PdfJafharQO1S4Hq3M+uZ6lLZ9H1PEJF6Ccz52USIsRBkRNUN/vHcYD0t2EM8pvlwPQT
	5obtgDLlfaJxCGog=
X-Received: by 2002:a05:600c:4513:b0:4bb:687c:4fbe with SMTP id 5b1f17b1804b1-4bb7837c4e5mr56003575e9.8.1794919189862;
        Tue, 17 Nov 2026 04:39:49 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (94-21-223-203.pool.digikabel.hu. [94.21.223.203])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783f8154sm71474905e9.4.2026.11.17.04.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:39:49 -0800 (PST)
From: rofikkerneldev <rofikcoga@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	rofikkerneldev <rofikcoga@gmail.com>
Subject: [PATCH v1 01/11] dt-bindings: arm: qcom: add LG V60 ThinQ 5G (timelm)
Date: Tue, 17 Nov 2026 13:39:36 +0100
Message-Id: <20261117123946.668557-2-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261117123946.668557-1-rofikcoga@gmail.com>
References: <20261117123946.668557-1-rofikcoga@gmail.com>
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

Document the compatible for the LG V60 ThinQ 5G (timelm), based on
SM8250, and register the LG Electronics vendor prefix.

Signed-off-by: rofikkerneldev <rofikcoga@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml        | 1 +
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557ce1ef..f8b34109171d0 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1139,6 +1139,7 @@ properties:
 
       - items:
           - enum:
+              - lge,timelm
               - qcom,qrb5165-rb5
               - qcom,sm8250-hdk
               - qcom,sm8250-mtp
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 5471a06f93f10..fa50a81880f0b 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -971,6 +971,8 @@ patternProperties:
     description: Lenovo Group Ltd.
   "^lg,.*":
     description: LG Corporation
+  "^lge,.*":
+    description: LG Electronics
   "^lgphilips,.*":
     description: LG Display
   "^libretech,.*":
-- 
2.39.5

