Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793134367;
	b=rFyR6Zppa8BZRNeSImPKtwQwcfwDA85zFEkbC6igZ2eZrPVCLMgk1sJnn/LY/iWc0/uB
	 IqAkLa+6RN5OI4tQBPpSiyEiXQJxAUDQGYzUpC+3oN2leaWwwWcXPM4Pu9FZQ5erYtpWs
	 uqT4p1dhcZMLW6nHUvO5Qq9syITaTvIQtm5Fy1teoDuGdGKn45FaugtzQMu/yjfysUb83
	 TRUEVytPTz5NB/nV0FtPPRjIJyLFUt0HH4kwEboZWhfc6h49POTIbdz9fBPiu9uC2kt2O
	 m9s7GM0uPa9nB0kd/grty+BZOWyAEoz9soNNNIlA4/WZsbUW5mdz6i7pN/tkzuc2qTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793134367;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ypEzL1gFHlTg5t/NkvImMIT1oSedLsVHIjJyUl+/edo=;
	b=gfJpV6q2j67WRd6srgQnC7wVjnA6a1u+pA9GVdpNiO6hVJPSRJyQuXtpGN3SqCAEL/zE
	 repZI9xcMlbFSePNOkQUt0HR6SXIgdBuz9vdLHm/7XsFmJj2er1q7cxFgnsmuJ2G8fyBH
	 0+8MutuksbR7lSNCYNRryeYNAmimUjn/RQoADKc3feplG70hnJlNPxU3caRBnS/E0Pyuv
	 hTA6+DOWdWvQwqgqcHvPkNBdXiUnJQKlnMQTVBO+QQ2l7UwzuPFFRNEsEx1S/dLobST28
	 viOMnLv7PxQtp6rkfMWF0Y9uaLH6R13NNnAhD88m4yOchXASWXVDWh/fGPOF5NyfBJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HlSdKImz;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 997C8606A31F
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 20:52:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 997C8606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HlSdKImz
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3ae2b7e1e17so188087a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 13:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793134366; x=1793739166; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ypEzL1gFHlTg5t/NkvImMIT1oSedLsVHIjJyUl+/edo=;
        b=HlSdKImzgk2WYlBDUrX54M9HeRYTZ1bWEqP3eecZml5jDi+o3r/1CVeSCrqOsN73cX
         uljc8zWNVW4z6CdvOkNgflBltbJ+Cj7ZZFWeoC1dl0U6pUat3okGPtO/K4CtLxHv78MT
         hCI05ESMJDIuZPaUx0FGRDs5ikhkt6rSUR0DsRVLwQgivSQGa02wzeoOxw/qQ3m8PFCf
         KrMkCNZscnGz3+4208YcWJ6ga63Fa30abhgnzrAaSXkPtzew3pROSDwpR0bk62jTEVZS
         JtvVNBeSGjF2xFiRKVU58Foa5xhJS8atjbLcaX229j3AQVrDeWLYYDSXC6RhjARsgE0D
         0t+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793134366; x=1793739166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ypEzL1gFHlTg5t/NkvImMIT1oSedLsVHIjJyUl+/edo=;
        b=iWSET2DI2vbnM4UTaBK2oN58kAZk/aZj0ngn7sJPZ4e8Itp8b1/3Wc6ZjlEqv5YBid
         QVLLjWFM/C160H+RKmUDntiZ2cEQWDSnB8peN9BXzkH6nvKEG5F0QbTuBAnvzQ+0+Db3
         suO+8qK9/3k4mIzmzQdNHF5hdSSDGZHnfThm1VeFymRy4q85lYnNIDKetY9GIQvA/eaZ
         o8i3VYw8WB4LLCWI1njlZ3N1cu8WOuEqwEqAeOFbxQFTsKEK755m0lG1QaixoIPiraa2
         e+QmEF4f1lWw57XHPrtC7ISLntyE+/yxbA2US6Xl4H+rEmOgWyD4eIh/stLdLZd/JCs/
         Cukg==
X-Forwarded-Encrypted: i=1; AKwUvBxDg1uYpIf5tO9w+QoG+83HYdS8wvSWNQ1wmtyJWYchzAANuNTvo8NuAbEL2DzSbSH7zsfyUFY3za34gfYR@vger.kernel.org
X-Gm-Message-State: AFq9FYJzNuZon+Bqx0F+XC2366PGGTOjxZLfkXGRnqUa5eQs/Nf2LYdt
	fogk7OhYwTdo3RCNEpAUSsU7RwMa7IjQW6x9h04XelBEqDWT5BTikXr+F+q64jn87K0=
X-Gm-Gg: AYBFou0D3V8Cy9P1HMXFIF8kKeTIS1MvPnSVkt3YHyRCPrqdXfR6zCDtuTCU/lg+XIV
	tH+ApKCf9j7bHCPV5WkWWkxp3Vc//tBYb5H/GpM6z6LuzumtFouH3em4eJRISJX4K2qF/2oOUoU
	8cY1Hu0WzbHa85WC48Pc+tm+NEF7I0c914Jif08mFACLVcZCUuTIoIRvvnVrMBxpkSZc5BvLdOl
	ugzFkvDopZ0F3pASqeI/vNbatykogx1BHkuSSpFQ0deq7sWtnIfYCbSSZLBBV0crx+UnHH4NEyz
	KdlbUWkYlJkaa3L2KLNceJhNmO4d5pczkMCTeJ6RmA2iO3mFExmcesV7rGYX/DPC1UlxYP6v7TK
	72E6hw1dAeZHoZ9F9i826PbVh8+1d0SEMuUoDseCHFmvmIC31R2f6ahMJPwjFLHadj20pzoBbp8
	PTp0wP2QvdFg61SA4xIxsoaFi7YsS+RpnjC0jF65EYqZkOcgSv1cBN5HT5A2YPpIAU38FBJhHXW
	1ThiZfZniTZGRZ2Vnt8uFOLhQkn/gyLi/5WUGDS0/BCKpz+WKsWjJtcSg9nWYx6RgrSfQ23qvxx
	skYbBJC3skNq03UYyTUV9j97a1SAagpdFiIvNgjUR6p6zZfKIA8Zig==
X-Received: by 2002:a17:90b:2543:b0:39d:84af:a0b3 with SMTP id 98e67ed59e1d1-3ae581b5095mr169710a91.18.1793134366005;
        Tue, 27 Oct 2026 13:52:46 -0700 (PDT)
Received: from debian.lan ([121.101.131.247])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae57bc67bbsm372192a91.3.2026.10.27.13.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 13:52:45 -0700 (PDT)
From: Amir Hanip <killdeath104@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Amir Hanip <killdeath104@gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: arm: qcom: Document Xiaomi Poco M3
Date: Wed, 28 Oct 2026 03:51:45 +0700
Message-ID: <20261027205146.16384-2-killdeath104@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027205146.16384-1-killdeath104@gmail.com>
References: <20261027205146.16384-1-killdeath104@gmail.com>
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

Add compatible for Xiaomi Poco M3 codename citrus, which is
based on Snapdragon 662 (SM6115) SoC.

Signed-off-by: Amir Hanip <killdeath104@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557c..8d2e4f0e3 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1068,6 +1068,7 @@ properties:
       - items:
           - enum:
               - fxtec,pro1x
+              - xiaomi,citrus
               - xiaomi,lemon
           - const: qcom,sm6115
 
-- 
2.47.3

