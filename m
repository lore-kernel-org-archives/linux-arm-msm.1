Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD1E44605D
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 17:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785433457; cv=none; b=uDzE4tiat36BC8OMg6rDDqYI8We2OOF7+KHecIOei1cOZ03cKRQNPhbftz3QtRg98ppXuzqSahNZN0mQ98bFEfeMr3uypnstNCD3aJuC0LdmIbxsJe+V9WXRyIlQM4ht5OS9n870KFpTmHTzoD2RfGCCAXgTz2iv0AYdfI9EeaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785433457; c=relaxed/simple;
	bh=0SNVcD2ismw260/fCs9UP7KNTkcK5iz1vXhTrUZeJXY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a6ijmWIkSkJzjNbZsUI/EviUTHuhSJLvLLMWmNAcDPtc/rikU1l7ltwa+Kb9YPKT2uQVZEOuik51Lm0oaodV9feu4BnNcDCU6URpEC6K8GTwAHJc19WXGQf4TSPGQNruRBSmx2GTiOdA8AtTK3Hr36aE6Am9cbpXfue+VC4cUpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mN5sCL/m; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mN5sCL/m"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-51c2149571dso293561cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 10:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785433453; x=1786038253; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mke9aMgFoX8mi0/LEKnGWho0tCyc+eXDPVUKaIIH15E=;
        b=mN5sCL/mhztkXQ9/LIDMH1Bi2dWxYeExnkMxgsojYwnSxzHQgoSefCH6/1wQ1LFlsG
         Rc+Z/s4DGWVKeiBMawvxM7l/KXRmlbakNDsExxKHGWGR5wO5az4QLtRnmoNPh32OIju1
         gRiR2nLoFX7GzcgTVTB+nckxCM4wT/y15hL9PHAywyArIdiMY65tStoUFJz9RR5Y8LcK
         Ft0+6+kyHaA4fGDZ1WEhrxXcxyvQUfl7JDPN5/BXi2JdY450EQH93fq+9899esXhFcvZ
         T3pVgI2UrPjU3WleoAtOqQK5XcrkscAvCBjgZxCFJ9hod9KWBbtCTrbcmnf59l5TEAcd
         vw8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785433453; x=1786038253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mke9aMgFoX8mi0/LEKnGWho0tCyc+eXDPVUKaIIH15E=;
        b=aWVDmB+upbnyuc2T4ulAWhM9PhhAEuEW6oz5k36Q99Fkbd7deeAAykCJbeBIqeUSRL
         89R+WcD16/+vig1/bbcG0hXo4/L7kVE/MJ3WPkvG/n6RTb583uqYVfG+JiQisDnssh5x
         4fQcnBT3m4C9NTnq1T9girffNpZJOs3kCWjrfbo4Kz3yDztwD7fQABAyxFts4YW9E5XS
         hnPgjNY/+seiUO+TcMKQ3zkMhIajNtyLGEG2yu57JDLdP/Hg+HPMufaDnkAb9jMJ5QIB
         3UQXCXudEKzaCMjW68MSiOnuULv2z9GuIMhvZ3eHK3QER6iGlSCQ2BoCZSMoU7nMBKQQ
         nPcw==
X-Forwarded-Encrypted: i=1; AHgh+RrY1ktMzQFoozXGHlm/o6srTqeB89kgJTzSL048HuHb9ldfuZeWhMrcUadZosMjqRxSMev9hQXo2W719+7R@vger.kernel.org
X-Gm-Message-State: AOJu0YzZzwP4wINzt87JqhemXk3w3ca/WaTwcZ+C0a39btHGtqpuVrGg
	gKUeRuPNj7t084UKdZhieNpFY27uGsXz8T1brDsO+BxqntaxgckYjYfo
X-Gm-Gg: AR+sD10iWZduaN5qIL9EbE64zNR7BOSfTVRCOE2i1Ejw5t1KpzKkq7jwtJNUUVHYPxW
	b1uXZAueN++ooFI8NAGI7LDo+2EZBDN6nS4xTzCH5s2Vl53Fo6YpmElzsvrR0A0oaZnJfcPhg/0
	cc1FOAXK5dM7P2aEYUZnY5geHWtg8fvIL3xb7McszDuGGBrPeX3bT0td3r58PeDh8Nlyf07k5bQ
	KVloZpM6GV7fW50VApX4WzbI+rXHNCfYYYIUCyXK7MFIzJkY8HUhj+q6f3TXwW7OVXv9GgETbtN
	9mI5OCGvCwzU7D06Oj4H2BW2D80CCy5SB3BC6yATVClylAqKFQCIUEBy5Xa+p+wsEWL6HkRghDX
	01+4OThoCokbrOgbWwrKggWDZdQx3iP1kU9EtyI6WihmqmOC9iXM0sTCDOc+DO9UypfmtnXpdIF
	WfQ7QF+D5qxPE+QsXHzkHdl9T5oZEmfHa5OwDKFA2823zfTj65qkeyHyLH9VyEQTVArr+KnA==
X-Received: by 2002:a05:620a:b8f:b0:932:f1d8:b0da with SMTP id af79cd13be357-93486157c96mr295847585a.57.1785433453529;
        Thu, 30 Jul 2026 10:44:13 -0700 (PDT)
Received: from localhost ([70.54.57.80])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-933e733d933sm473505785a.35.2026.07.30.10.44.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 10:44:12 -0700 (PDT)
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
Subject: [PATCH v6 04/15] ASoC: dt-bindings: pm8916-analog-codec: Add PM660L compatible
Date: Thu, 30 Jul 2026 13:43:42 -0400
Message-ID: <20260730174353.108023-5-mailingradian@gmail.com>
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

The PM8953 (cajon 2.0) revision of the PM8916 analog codec is also found
on PM660L, typically connected to the SDM660 internal sound card via the
digital codec. Provide a space for specific compatibles and add the
compatible for PM660L.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../sound/qcom,pm8916-wcd-analog-codec.yaml        | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,pm8916-wcd-analog-codec.yaml b/Documentation/devicetree/bindings/sound/qcom,pm8916-wcd-analog-codec.yaml
index 15389645a3e8..be47dbdb2e92 100644
--- a/Documentation/devicetree/bindings/sound/qcom,pm8916-wcd-analog-codec.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,pm8916-wcd-analog-codec.yaml
@@ -14,10 +14,16 @@ description:
 
 properties:
   compatible:
-    enum:
-      - qcom,pm8916-wcd-analog-codec
-      - qcom,pm8950-wcd-analog-codec
-      - qcom,pm8953-wcd-analog-codec
+    oneOf:
+      - items:
+          - enum:
+              - qcom,pm660l-wcd-analog-codec
+          - const: qcom,pm8953-wcd-analog-codec
+
+      - enum:
+          - qcom,pm8916-wcd-analog-codec
+          - qcom,pm8950-wcd-analog-codec
+          - qcom,pm8953-wcd-analog-codec
 
   reg:
     maxItems: 1
-- 
2.55.0

