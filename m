Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F7A637C910
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 13:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784295260; cv=none; b=UqAlx4LLRmwytMhiQ/2Vb6VtG5LHqW5ybSRxLFUoF7OW3oF6GWgzcQpvlGzqNj5504Uvx1fbcCQXzJkk70aUjCERmae9xy2PPAwfUJJXUCi6MkQl7DMxYdrdfZxN0G4dEOdY0rRVAUPhy2Ok1gSlSnhUTQExEpIW7NonjPNI2u8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784295260; c=relaxed/simple;
	bh=HFSTrk43zyzNsRY27xvVNkH801KFPO7/o86KOmtZ658=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A4lZtmagX1MtdZ8oRNunWJUxyBl8QZjKfPZ+lFDCMpw+ReJNaacOAC4lhn8nXSl6LZkR2uA+tIAmL6wQTDvCzlW4Nw1X0yXSqgXe3dko1g0r+dTfuEjAB/GQhkss01dsK8o5NDOdphJKdOfg/1TdU0mdL0aqcudweOrbtI4Ma24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=u1XAOXeu; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="u1XAOXeu"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4720f3bf164so843301f8f.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 06:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1784295256; x=1784900056; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uaEStTJIwB/dkXeiJZfpbyBGFPs+1/VB2GuZupuIQfc=;
        b=u1XAOXeu8ZemaSc/EZLGbVVnPhLts63CFqmQmf9M55vK8AdMJWqPnwJQPaiDebpQmM
         F4fvLLtnJBEPZGxNZpY6uC6uLTmyVdyMhBxZSwCjdh3tLi0W33S2NqA+bGL5OPkeWI99
         /gy/s4a9sXSC42IzZL/aRkNNacp4E59OlGNi1SzmZz/6xQ63bGMuK0mHd7PQOPFkpisP
         5KKyBxUTrczpu1yzOA4727wyT6FeZof+AbAcuaLJU/sUGdRr59yiiATtUH1Uwcc8x3+S
         AwLdV7zZ4vgid0pC1gq5tE7JwN/EWYd2yq0rW/8YNw8Jij57z62XCg9NuONtvFsC4SrO
         9UaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784295256; x=1784900056;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uaEStTJIwB/dkXeiJZfpbyBGFPs+1/VB2GuZupuIQfc=;
        b=mkT5nsKVxrsrRE9h8VwpSKxoF0tX5SVFafNoVy+4+lQORQjmQY4TgJrMOsUrQcnGA+
         PYLZZcTi5MBtshKX1gE1UJvZgvAGmUX7rcpj9PWI81IMnxNeUr/ZlZXkktcMIwEnPuR9
         rgN4iv4fchczBveT7SXWvyebMf3z6hkPml/lLZJXUsS6iDLY9kmrYn9QD2fZa+JeP5yY
         ZrmmNvt1+Wk3vI6IZ2yk8L/IzJL2LCShxb7Qm4kBaHkuYYR/ZZEiOtL8gTyIKKJWA604
         zeF6/ull5Xl5hQg/mOSWewLGfkxrs0rg5S2UrJ2d8bpLvKuI4GRR2cV1ZE3/uSnYWEj3
         tqqQ==
X-Forwarded-Encrypted: i=1; AHgh+RrKlBfK5ssbrx+Ir1lyQphc9L82FQQgS2r250tGPBxFfgr4yhCDqrKA45Z6NXIfZANRae0c5nsEecfUGc9H@vger.kernel.org
X-Gm-Message-State: AOJu0Ywq2el6hREQe3rDq9/8PDLpTf1CFVQdPOdsL168Bx3oxYUKOtpe
	PlTukBlnbgLK9La1o9143ChIzIJYJSpLE6plhYzc+XvdE2c+lFuSfMKtbh9kaI2V0PQ=
X-Gm-Gg: AfdE7ckLaTt+5CCU1V2gHpmo5B6HwcoLcuBbtGibtv8717v62YjGHZMq5znOjVs2P+i
	TqhCUnNl6qVpxRBaalqF5gY9ckImGPs4P/9/IblpNr9RNqeI5S+C1FX9563f8VGXidFeX9uxSwX
	dAsDwJiAHAU2Kp8P6n/JeVMIPwNn/+8GgHdKRmmdPlAwluZEN0eNa1vqcy//BCPxm1JmYWKZop8
	ZMp+Kt9PVqsjD2RzYj1aBX8ef1AQdMnst1Kamn3az++OPkn+y458TS4JGjVRxmfIgmlr0RGxotK
	3QEXx4YuCwD9xrZTx7iZnPmGpimTrGLWzBv7zz7DPFlPF5489z+YCFkOLCAqgzwdLFALxKAeAEj
	VTEBo2Rgw6mDB1mzSpxT3iHArub4uuO4wgiLT33pcMfKQLPCd+EbZ59/+XcS4qWggwgbwdqY38z
	/W9slRk0pklk7I0oY=
X-Received: by 2002:a05:6000:430b:b0:478:3df9:5d8c with SMTP id ffacd0b85a97d-47f5a4197e4mr9380422f8f.2.1784295256462;
        Fri, 17 Jul 2026 06:34:16 -0700 (PDT)
Received: from [172.18.170.139] ([185.104.138.147])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63e49ab8sm4361547f8f.5.2026.07.17.06.34.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 06:34:16 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 17 Jul 2026 15:33:03 +0200
Subject: [PATCH v2 1/2] dt-bindings: interconnect: OSM L3: Document Milos
 OSM L3 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-milos-cpu-opp-v2-1-428813fafd52@fairphone.com>
References: <20260717-milos-cpu-opp-v2-0-428813fafd52@fairphone.com>
In-Reply-To: <20260717-milos-cpu-opp-v2-0-428813fafd52@fairphone.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Alexander Koskovich <akoskovich@pm.me>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784295239; l=893;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=HFSTrk43zyzNsRY27xvVNkH801KFPO7/o86KOmtZ658=;
 b=/t1sZp8Zx+PC4pDijJkMxs119lQoymRHzjhpNhzRRiFpi0uwSLJpXkz/a+ta6tM0XuibepT7N
 MYF66BCUTRiD4et4OkbzF1uWI0FnWLHu1kL5k7/8Em3RM//kDbGCyr8
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the OSM L3 found in the Qualcomm Milos SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml b/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
index 41b9f758bf8b..17690ff34489 100644
--- a/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
+++ b/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
@@ -29,6 +29,7 @@ properties:
       - items:
           - enum:
               - qcom,eliza-epss-l3
+              - qcom,milos-epss-l3
               - qcom,sa8775p-epss-l3
               - qcom,sc7280-epss-l3
               - qcom,sc8280xp-epss-l3

-- 
2.55.0

