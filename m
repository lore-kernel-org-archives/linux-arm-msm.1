Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D16924DD17
	for <linux-arm-msm@vger.kernel.org>; Sun, 26 Jul 2026 14:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785076366; cv=none; b=mjSf8PCxF2PleeqDX942QFUK2Pgt5ltnF1wu3N6x09znkxzGGPoFLbvafxK+dWvZ451CL9sFvvkjVT7/M+Eel3CJZZAu8cB64YHgmjTlHfcInjMOyf0BiZk6yPDjYQk3Np5LcDNP17lGe19htLP5zB1Jvpj8rDmBCkNxqpZK88E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785076366; c=relaxed/simple;
	bh=w8I/ynV6luVHydxZ79/TrblhuO0axrFStkUa/CnfZYM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mkfcjgpx4JxS5Nywf8Q5b12+VG70XkG1Hs2FkW/+mG+jdGmesIlvuYKw5fcJbXSs/L/JF19NS7DmVR0+EB/EToTRy4B8rRzSo7qotSBKdEyaxLgJ+3Cn5SlY7PxEz55FHx0JiFdvd/OQxvaCEQn5HFHedTiOUSzrTPVvQo94xNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N5qz0Skz; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N5qz0Skz"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2cacf197759so27929435ad.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Jul 2026 07:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785076364; x=1785681164; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y35EXSfY0DBUnzkAvo1WoZwdbha7iwU4qIty1wkq7EA=;
        b=N5qz0SkzCHfqfUZdxRMs+SvzU0p84yVqzcRQ6r3pikD+z0Dflxa+JYCqBidbrPHI41
         s/p3rTBo0/ILeUAPhRCE9YCAyAjy5i/qhDtmIN79vMLNoWv2lV9ZY5sCaIUjHu0m44dX
         T25wRHPeqvj5cfvPudcuFbVpFq2u6xh94sIj5pfKHisPLPV+N64tORw3wly7vf+oQbSd
         tE2TlAmDdcID7URPZ2RkdXYgCMThL5UOHC7Yj6gz4GJyrawuKDOOCqxW5tD8PxeCiFaK
         VEVhg2v7A8IwUEwwHnMkUnc5PTVdiiq07oVIwUVoiXu6rA+Uj2YAkPvi9rRKeOLwKzQ8
         OcEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785076364; x=1785681164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y35EXSfY0DBUnzkAvo1WoZwdbha7iwU4qIty1wkq7EA=;
        b=TXGa8hLUp+ym2EEFVo8MOX/XCkKjPNxnn2P2jVCl/R0Ks/7y3MJKV7A56zgGRTj7Zf
         8ihQ648YURxTGf2Aeh99kTFsWhkE7sJ22kVATX4Ox2X9jx+g5gGtZyvwR7G7c5OLii2G
         XfYVc4o7maUQE86dpJ6sTAOD55SuFkbsQlIQKY08Rpq7DFIVDBdqskxgtFUEroYeyXoY
         Q8me/OtgVv4oR8PIDtjOVGAQRXTp3dJimagjme4nob0R2GLl+Eg5scKyuWNzXedJDFye
         pArnbSsdy/n7ieqeN0pv3tNynPdCgfwSEi9aUfVUEB5lwdIXDZsEUiDBR9pbGgpkDB1+
         px3g==
X-Gm-Message-State: AOJu0YxW3h93gsYzgoYXDLFFUB30pXM3FKa8eUfWRwNaMf1Vlz16fe17
	Qq8w/d1XChGsfCLzPCBWhWsflhtf8kcEinBUSp2+gBlKyTQlMnJpsO+u
X-Gm-Gg: AR+sD13WYRye+mN8kywjdncBznNC+CxdIIwSReOvMGaBAauUKlO85UC8rA6UbMaamsN
	FLTaNcbZVgcQer3vSUMWmw3zmMkXZHEgYw8B/48WAAZdz8W4PNNA5GJJsMDHlVfLrIquY1Kkxf8
	u1qd+FS9s90qxfgmJBn6tCkdoWz9YaWVzIrpV/pJbuMV3BT7FhUK0fHLqEOEfJsOCFVOCKBhx8k
	Xbk9Dy5u/J+B2xm+hQ2y8nWxA6wGpzCKY+vPYB/Zgz/Y0EfninHbI5+5FO4FiQYZpSxLjZd9OrB
	kUUcIHYPsadDObPQdvkYA8DyEtiaf9QDhUf6xwM+D0PytBXkmq4vMwkeGOKEYZK0+fpYzMg6koZ
	UIUluqm+qBsWnrP7rOh1gEgiWAZvoDvRozh+CTYu0+94TCQpy2LJY+/2q12frVzTPNOLNiDqKBC
	CXLJNCHfXmZiYHiDcReJixl7N0WoJMyxWGBA==
X-Received: by 2002:a17:903:1acb:b0:2cc:77f3:a934 with SMTP id d9443c01a7336-2cfde89bea6mr45593085ad.46.1785076364456;
        Sun, 26 Jul 2026 07:32:44 -0700 (PDT)
Received: from nuvole ([2408:8456:3213:88d5:c960:d4eb:e951:e287])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde7f8e73sm20552015ad.72.2026.07.26.07.32.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 07:32:44 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 1/2] dt-bindings: arm: qcom: Document Lenovo Legion Y700 Gen4
Date: Sun, 26 Jul 2026 22:30:47 +0800
Message-ID: <20260726143048.130116-2-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260726143048.130116-1-mitltlatltl@gmail.com>
References: <20260726143048.130116-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add compatible for the SM8750-based Lenovo Legion Y700 Gen4, using its
codename, elden.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
Changes in v2:
- Collect tag.
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index c7c9a9279684..e1ade271e712 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1160,6 +1160,7 @@ properties:
 
       - items:
           - enum:
+              - lenovo,elden
               - qcom,sm8750-mtp
               - qcom,sm8750-qrd
           - const: qcom,sm8750
-- 
2.54.0

