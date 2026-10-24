Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792817304;
	b=QbbaJnPRtMjTKV3qI2/M4iyMkSnf0NsWnj17+Hgdj+YbVgu336Vv2elHb0Ug9F5mnkvo
	 u7liaB19KWsFwlBiBeXsJsdjuTi1yUeu62NuYkTP56t1SQBThioalE/CwtMVLd7D5z/uA
	 DY56+cfa8fsBi2Oy7F9HNG8AXAm9o1NoU5dtmplqBZr5qex+DCBgb7xyKjA1hfJiFnp+c
	 yhYI+0xZRo06NtkDwUpALeD/zkY2YCboTElu4/9k1iJ9sI1mtJNKbyWORvp9H5efwkQm8
	 uo6OBhSrnk4cyJedqSvgSW2PRq7daAzziFdE3+17NG26WBLLivMI9LyIgRtuXcSDkaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792817304;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FlEdQ2pqn8bP1dGq/hfVSoYb/UyZVHkJ6Hz5iIABDeg=;
	b=35TxmSq+kK9IpSiOUybj98O/VPaYJIUIsUtlI/Md/RZm0sptbWlJ2waFD4sDReHZjrBp
	 fiZza3ad6OhFrOdfkvO/DGCdGeIbtzhm/RabMc+/gkui8oLtQQLaYcvumznB2UBfPeTX2
	 B9zsqm31SjhhEYFxPWAEqcvyHZqLrnlC2z2yVRURKAbY3ib4KvZhMKQY4GwECcegrwkNd
	 ufXiLOFSM5Y/ybv0sisExYBFm+gFMoDH5EoL+1YtbV6/nqoek8bTPK+/6yJVAvNqhX/KG
	 lvC6wyYByppQHkBfULmAYaw1KVTbX+agzd9nAd1inup9KBeH14Vn7E6T2WH/2bFn3Ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="fazH6vL/";
	arc=none smtp.remote-ip=209.85.161.49
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D03F5606A322
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 04:48:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D03F5606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fazH6vL/
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-6f74f6b46abso763091eaf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 21:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792817303; x=1793422103; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FlEdQ2pqn8bP1dGq/hfVSoYb/UyZVHkJ6Hz5iIABDeg=;
        b=fazH6vL/+ECq6VlN9mVl4gcyoOhvrjunanP0XqxebYzUtWEyMHM7cdG8Kvzwp/AzV/
         ZQxp6HqzfWkpwT5AjhLjRfbYXACK+2HsssnLWqSFhZ4EMKGt12Tpp9ePwdZT6fnlB8G6
         xleERqRgwKIVmQVPH41xf08ivhd7R0HGH5KGnV7kkpr2PAIL+XzflAPWlF/2GMWPt3lf
         BRMbcZ16slHFYOOHVIJnYeBwmGS2Q9jqeeNw5q+kANkAUZO3seTHKh0yir5GvQHnhnFq
         FZypiSonTMCqc3dcDPO3/WqnUfb/ElFbsXmltMUgF5ljZ21NTSUwnB6pWegswTUI+aU8
         Td8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792817303; x=1793422103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FlEdQ2pqn8bP1dGq/hfVSoYb/UyZVHkJ6Hz5iIABDeg=;
        b=huYuEkaGtG9/eu5uztWdZFpMuG90woh4dcieykFFWzcmO39vW9Oc+Mv6gTsO97pZyc
         MMuLBhAn8VFGpQ8tj38gXyIobEX3d2R8DKZ3a/8dirhSIFH2qjagqosCapOQEw+EiPAM
         sEusWN+mSbokyF9zn4bNPml3RymZqT/fD8q1aqn9NvW1VECPWCqxnnk1pjpsk0jpZznn
         CA2oWCUZzYR2FXG4iIyLdAUXGLKbip9flT4xtA3WAqZDivwm6SDOQTue6903/UdQo1B3
         G3YDzZ+gKpbwbWrD8KWzrTm+wcRjxJr1zHUXOY7arZMDnscRjKTXPgcnUbZNyb6iPoBc
         DpzA==
X-Forwarded-Encrypted: i=1; AKwUvBxpuwRZJSesbuX59UkaTqR3SKXSb182DKOvDZXCeq+VxwIF+U7zTkfm/W63HMMlhQYtPV5dfC4yc/v64YLp@vger.kernel.org
X-Gm-Message-State: AFq9FYImYbmCs052RdDQZb9m/SffUIy4SfVfxeBRptaKy3FeZZZWeQhA
	sgKkiCJRJxHGk+Y/NHqkBjMS5ervFX7JnoDx6kLEr+4nsknVr75pvezZ
X-Gm-Gg: AYBFou2qz9J8rr4IDuf05uOR6KADDd2QhU63iNvLiJ0+NW/Ajzkp/sgpSKuHviQZnFu
	r2+G3ItykHUH02QGmBX74KXP+rtkvv8mVUaEJwsipkDx86jDZ1pa170orco+FTiX572TBMUNr7l
	7/yeKXo2vrlM59d0T6Nr1GUOoGm/1/F1GSjs1VONFXKW8tXFswEOAljeyyJpDH/OtG+tPEEHYOe
	KivzuOaG5kYSq2r/vOFUtZW3mVfFAghXV9MyaiWZslQHABH/QWXqjLHhOEtgA0nyHgHbqB8D3Dg
	qikDsa0oNvh2jxqHEkrFQPIixv3KYWxCRx/MrZS9s6KSlWr7I7Z0fwQxp0E+gAWxKkKPpPpm1bI
	uU3u/PJx81pgJ7Rszs+5qDPhRQGehKMX08Ekyq6SzzNFQHBPaho9D4cO1fMhwpmhlNi4Islew7G
	IIR44zkoppNJycm+uR8trbduBhUIAhlEOyuREmHog2Y0rdKqyk4BUhBkEQu+4j4EEj0BfH47tFD
	8WdLd9sXjhyHsibcBWltBCljXbfucahz1nqSyIt2Oq7G9cDeW4a3cUVQwohdFNc4GK+6YVMP3wP
	oliR
X-Received: by 2002:a05:6820:4a1a:b0:6cd:3ffc:ad01 with SMTP id 006d021491bc7-70ba0ff073bmr381935eaf.81.1792817302835;
        Fri, 23 Oct 2026 21:48:22 -0700 (PDT)
Received: from jeffmr (63-152-17-145.cdrr.qwest.net. [63.152.17.145])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-850fb0749dcsm1331577a34.11.2026.10.23.21.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 21:48:22 -0700 (PDT)
From: Jeff Roach <jeff.roach0@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: arm: qcom: Add HP OmniBook X 16-cp1
Date: Fri, 23 Oct 2026 23:46:49 -0500
Message-ID: <20261024044650.9936-2-jeff.roach0@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261024044650.9936-1-jeff.roach0@gmail.com>
References: <20261024044650.9936-1-jeff.roach0@gmail.com>
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

Document the HP OmniBook X 16-cp1 laptop, based on the Qualcomm Mahua
(Snapdragon X2 Elite, 12 cores) SoC.

Assisted-by: Claude Opus 5.5
Signed-off-by: Jeff Roach <jeff.roach0@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557ce..4dd57e8663 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -191,6 +191,7 @@ properties:
 
       - items:
           - enum:
+              - hp,omnibook-x16-cp1
               - qcom,mahua-crd
           - const: qcom,mahua
 
-- 
2.55.0

