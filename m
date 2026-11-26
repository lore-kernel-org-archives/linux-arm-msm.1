Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795674676;
	b=H7AQMjkSeNTxxwHCH3qR0KAmpz6/6nEK56ovotpA+T3ArJASwxprWwOTAqDJePtFJQzO
	 3TkvMPHY19A1SiySfOsARibhMFATCRG/4+aU0KmqDQ/Q9hjsR0T7UVSYUGbR1RH90CtIR
	 LrFYJMNzmftbT8fOZAp1aqKKdaPTy4RvBjNCM9y+MFBc6rtL9P6lAa3DQAtnX5atxafIa
	 mRYtDX8Qpww1sq97FmJBnZc4sroej2uoS3TI30USNkV0IVmdN33mUbB4mfxsW0YC+13/K
	 lLoaD5Ul3iipIGzJunWYSZhFrqecxMBQboAU28+1XnFTFvRinzDm0gKW/LPYl0SA1AA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795674676;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0rpAfURq6UOsPiwQ4FgTkXmy2v7jkBq3d/kmCK91TF4=;
	b=mVwkn4PjJVhcNynAuT2rhpiB9zHEjnLIc9bRw8aV4sE9tz/sIsMVvOb0Ln4uJcB24WFl
	 RKzQ9CdfegmEClhtKQNtcZWhRnSoUhaLT9mHDWnEofV6GeUf/zQe2ruMyykhA8dlojDDR
	 mIEhHQWZDuMBUnaxTOyRsBChEtJizQ0ubJprF+BXLIQ01/1BLBFp1bVSQt0T5KCDG2fW8
	 1deUObaOrWKl2kBFOL2WowzrAYQoGnvb5Ljpyr2hX3/EuGg9k3GOgrjv+yo14oBBm23wP
	 rxeYsOEI80G0oOpBUuDxD6/Wpmt9q7ndldiOKVoUsiTDucYNIiAj1nliRD/MH8BZE0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SJrfEagZ;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65372606A31C
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 06:31:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65372606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SJrfEagZ
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3b4200f59e1so716698a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 22:31:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795674675; x=1796279475; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0rpAfURq6UOsPiwQ4FgTkXmy2v7jkBq3d/kmCK91TF4=;
        b=SJrfEagZnkHwRnLOHyJaCSiMBCa59J4gj0xoer+A4ZL1BnihskxU6ZIu6ZMczmMStX
         +MeLM1KP+eWScUwxegYatJ5MnoOtBMgEFjUQGji775loTtLPSlb9RXDegNEEED9dFKmn
         cBSY2YL0tDDJ0msJIA6IKXIxoSZB9LP99leLHpzD6GRuGSKuD32L6H1UWm2bYpBTcI4/
         HcQJqliFm0BtU8uXy5upFCBuFQOVoOi/Xyh57/FLIJMFiqXrDeLsaTBydXss7Qc+2iFJ
         nKlDdHBXSyzgLLfBBGN8EQgHZuCnHGOjhzV25J1mR8+isQuzvuA7cnZ8hDL+PUeQsgKp
         CKWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795674675; x=1796279475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0rpAfURq6UOsPiwQ4FgTkXmy2v7jkBq3d/kmCK91TF4=;
        b=vp3jOnHhfKmwDU41rsTA2E4Z5w5/Bf+QiACmAt93WRDB4s+ZxWAPAZVfB+lSchi8Yf
         C0GEORh/2OOn94krxtT0fH2h+c5Cj8tiSDAndogYpdrR/vxbtu4t8S5Rsc6nVBwI1ajc
         FqrB889AoW7J5ADtN7IG3VgwhyBVF4LgzZyIbUBmaPYjqvphEd0DbU1H3qauku8Bx+uO
         BLQRwAZS3Awe20eEcrYV0sjNrW/1tvXHUDnzP1H2x6ocG+q0aQh/fEX+ZFY4AeiQCimo
         i0haPo+ZkESVImnZ6Y0ycB8lZYGHFlowSQZ46Q6V02pR9Mw+8EU3KHayG3kULjZJ8Aft
         gViQ==
X-Forwarded-Encrypted: i=1; AL+hErFIHjHRKLfBCzmvdjwIDxJvlaA16eK+AkHTka5i//CE3aJl2jD68nZ9qdhkifmbTkTVftgDlYbVppFNuwzP@vger.kernel.org
X-Gm-Message-State: APuU4Z/Fq8+NcFx6d426jyf0PDGZuqTrOjq8YTzsP5SetTuNipOWtXO0
	3YNJvjE91bbVgktar0HD8AB/nRQaeUKFZyGmaJBY+DQttCPEMy0ky7vO
X-Gm-Gg: AZFdTZfdQhy53f9KHNTZ+G1b/JsVHeaeZtSPKsJyj1XhzTXYjlgExBvRXYctLHjKMCv
	5SCfXYm+lYqmJsK1T6hmjgsUiTlXFuKAysRXMm6/+rk8qKa1sxni5zv4pXdUtWz5V9rbqqiZBEp
	Rci/HKuyOUMjqH6cHI+CvnMrU00dPTIU4N/88X4/v+X2GeZnT33K8Pc16sfIQ3+GM7gK/+I9pvT
	Cm5SkTfkZtDX7/r9u7snIWAKPHl7kPx4ymgnl2SLiBd3MNkLBVl19SIt5T/+Z53XDHdDpZjJCLZ
	HcR0X54EWUIvq/NNPOSIRJtm9QaA4g8e7sIro/8kMbzqgTNVcRbewPrsiMo01Td+8pXq4cM6Q3p
	s6qorD1vWo82InSk1rdey+JGAsrG1RqRf8iv7ZZBDnvyt3stCS44L15YovKTUCPdOb/a2HFkvhE
	rt6IRclDN4M6Mtx9JZIZMiG1SPiEQv3NOvjX/HeS+mmxDQO/QX6zSh/XQw3SaPbiDA0IQ5NV9VN
	2zXWUGu4N+xU/Cxa6lz9LHixMZM6eiyEvR8vdMVqXsOCvUDTQ+rkytqOVQisNrb4OQrL7x4reNh
	tkx8Whlq8ltrRzfZOcSucxkvVgmaMSq3
X-Received: by 2002:a17:90b:5346:b0:3b3:c107:8458 with SMTP id 98e67ed59e1d1-3b41c961ee4mr30654785a91.5.1795674674808;
        Wed, 25 Nov 2026 22:31:14 -0800 (PST)
Received: from localhost.localdomain ([240e:36d:b08:5b40::a60])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde7f91c6f5sm7906328a12.27.2026.11.25.22.31.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:31:14 -0800 (PST)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: devicetree@vger.kernel.org
Cc: Jianfeng Liu <liujianfeng1994@gmail.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v1 1/2] dt-bindings: arm: qcom: Document Xiaomi elish panel variants
Date: Thu, 26 Nov 2026 14:30:33 +0800
Message-ID: <20261126063056.2276703-2-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261126063056.2276703-1-liujianfeng1994@gmail.com>
References: <20261126063056.2276703-1-liujianfeng1994@gmail.com>
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

The Xiaomi Mi Pad 5 Pro (elish) is available with either a BOE or a CSOT
display panel. Document a board compatible for each variant so firmware
can distinguish the corresponding device trees.

Keep xiaomi,elish as a fallback and continue to allow the existing
two-string compatible for older device trees.

Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>
---

 Documentation/devicetree/bindings/arm/qcom.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index a7157795870cd..84ae2d991d628 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1192,6 +1192,13 @@ properties:
               - xiaomi,pipa
           - const: qcom,sm8250
 
+      - items:
+          - enum:
+              - xiaomi,elish-boe
+              - xiaomi,elish-csot
+          - const: xiaomi,elish
+          - const: qcom,sm8250
+
       - items:
           - enum:
               - microsoft,surface-duo2
-- 
2.47.3

