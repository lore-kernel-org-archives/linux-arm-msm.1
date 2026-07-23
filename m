Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE82B191F94
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 01:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784771194; cv=none; b=RZBI8wbD8H5NpyLQ6Ntx34pTE/weYdwNAYXegHen+nwg8wjQXW+KRZaw3bN5qFqKdGoGws/yIE6Kyy5d89HAa+uIvnpkgiG5F2EO24kveFT1lbjdv8qzOkarzLJuemKvcG8DysmqbpMAtQ5+0Uw3LPkUbU14J+YAQreefR5Kuto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784771194; c=relaxed/simple;
	bh=JiTUnp6GkB6B+bmJP65I25onDMOLDPZ/wDqK0J06aA4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hIz/B5jpiyWzAGYpbziMDLtZ+57H5eyDFt4gZ5xOUyBmiEcrD9o/YXyktRTaB9FCwrXntZmU1urHdyvqtgShMr5ubvN84AlLZuj+FERnm15Vbdh5P4Wa7fgevpKmv5ezgvazp/A56QVaBzofqCcKLv2WM1Y5RjiZnglq8hp9GBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TRo32JZl; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TRo32JZl"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-7dbcb505578so1291007b3.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 18:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784771192; x=1785375992; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kyx8fnMYpU13qyrRjwi9Ec2VpF+qFTk63QV3HyVJPgE=;
        b=TRo32JZlPBZV1yp0FU4HkdjtSusiiGpweMfVWdRgc48yHxyLJwt8W5iBg96Bed5dUw
         Nwjg10q2FlvNBauBZRt6X4HUARFDpVWvENJ5fNIc7GdDGfFA4ZeXORNLfMPoTBLXNKjV
         RzUYitrzUXnHGrdBJI6FCWB0MM8W4ELynBKw32ppwoeQXzZVbSaY6NxmNjfqwaeT7+Tr
         O9G9AEHVZcfD/NQf17boourJEMUw2P19PaMzQt2VH3y0nFOaJXy6nH6JxTvRzVbbtf6z
         EMeMoV0f9+9rOzYH16SSdO9kXJY8kV0Q2BNSk4YnrGbGEnxD+KaGbQ/xut0UE8gwn7kG
         Mefw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784771192; x=1785375992;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kyx8fnMYpU13qyrRjwi9Ec2VpF+qFTk63QV3HyVJPgE=;
        b=XiRp2EZWjloWPeRTfl3DUTNm7dP+/xe3rcrpJu/8pDsug+S5+3ZE31+DFbyLDw5498
         1Mmp6T5Ijw8Uv2GfiQM6CjTSOS4zSEqJ+vkOfcCEONkqrdp3Ag/mVxB3yeJLq2u29tdj
         bn98iH3epBVyTBUvjip8l5Z5cCp6P9L2iH0Boi5gZkzfAHF64cV7M9tFnFdU+FJSjIZI
         hnc0cYuS7f0DWiHB6nzZzdGQbzodngSEZOp6/hwk4Unb4qrQTjWniKgFFe89odWDX1EI
         AdrQB87rMnlXHtFDsHy+SsLQ+dV5MNaJ9wP4qFwHhQFfqbRPOgawnn5CKm+UyPhhc2bY
         0pSQ==
X-Forwarded-Encrypted: i=1; AHgh+RrHPT3H0B2DEqI760oWn2tYyI8Mp1kTnAtoc7tSn2UWqTxN4DDtMzPVAthppmLb9iJzPLqICSLmDul1RUBb@vger.kernel.org
X-Gm-Message-State: AOJu0YzAffgwmYUkA5D9lZqEZ/XHCgwodjVGQRhFaZ0CH3spRm2HA0oL
	+xRQAVdbn6I79a47GbL7sgxaLTX8WXkopLxJVNA9o5ivBSiKGcpeUIxQ
X-Gm-Gg: AR+sD11Gwn1UNtc+CQ6gLre5bXAEFU06Zi3iGT9WqOALnpTDM5nlLgDDIgCbORaDRb0
	BveN29XzIFYAJN/QNZrh/dSoXxMlSzQIL/gBQp1e4NSuH0R8Uw6E3WS1icsoMpzhikmO83BBxX+
	abiBRam/tKhoZJwEdprg5nilkC/imzuj7lBYUuqZkRlUMrjbyldJnXRXDIKFRXMRD9iVppUHsnp
	Cc/4N+PWVHoYUYmasN8PnDuuqI5JEwmV30iLiSb7pAQjvqFuxJDbK7uQDpp2fqty3hOwfT7XY1j
	WS30SKq87M+Cw0QEiEe9hUg3+RMLIRyu9Ywn3bXshoutyxYhMEdl5y4Le6auph4cqcNPjpjg60h
	IMVmndNUWwfRy0MDfYH7Fr8p5t8hHPA/yRPsqEBdY7Y3LgxaW84G9WHQ8t99Ed0qB9gtRxTmLTW
	s5R7sleX9kBkJ7MFAO7O73qvLD546f
X-Received: by 2002:a05:690c:ed0:b0:812:996f:176f with SMTP id 00721157ae682-81f4c140ba3mr3175837b3.11.1784771191941;
        Wed, 22 Jul 2026 18:46:31 -0700 (PDT)
Received: from karli.attlocal.net ([2600:1700:7270:4eb0::19])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81f33bf2e50sm22038487b3.10.2026.07.22.18.46.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 18:46:31 -0700 (PDT)
From: Aneesh Pradhan <aneeshpradhan2004@gmail.com>
X-Google-Original-From: Aneesh Pradhan <aneeshpradhan@acm.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Catherine Frederick <serenity@floorchan.org>,
	linux-clk@vger.kernel.org,
	Aneesh Pradhan <aneeshpradhan@acm.org>
Subject: [PATCH v2 1/3] dt-bindings: arm: qcom: add MSM8920 and Motorola Moto E4 (perry)
Date: Wed, 22 Jul 2026 18:46:25 -0700
Message-ID: <20260723014627.63310-2-aneeshpradhan@acm.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260723014627.63310-1-aneeshpradhan@acm.org>
References: <20260723012431.48499-1-aneeshpradhan@acm.org>
 <20260723014627.63310-1-aneeshpradhan@acm.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Catherine Frederick (coolguy)" <serenity@floorchan.org>

Document the Motorola Moto E4 (perry) board compatible for MSM8917 and
MSM8920, and add qcom,msm8920 to the SoC compatible list.

Signed-off-by: Catherine Frederick (coolguy) <serenity@floorchan.org>
[aneesh: split bindings into their own patch; add msm8920 SoC enum]
Signed-off-by: Aneesh Pradhan <aneeshpradhan@acm.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index f8c37096df46..5556f81c0af5 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -261,11 +261,17 @@ properties:
 
       - items:
           - enum:
+              - motorola,perry
               - xiaomi,riva
               - xiaomi,rolex
               - xiaomi,tiare
           - const: qcom,msm8917
 
+      - items:
+          - enum:
+              - motorola,perry
+          - const: qcom,msm8920
+
       - items:
           - enum:
               - wingtech,wt82918hd
@@ -1323,6 +1329,7 @@ allOf:
               - qcom,apq8094
               - qcom,apq8096
               - qcom,msm8917
+              - qcom,msm8920
               - qcom,msm8937
               - qcom,msm8939
               - qcom,msm8953
-- 
2.53.0

