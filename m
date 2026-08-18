Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC6E3A8FE1
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 15:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787065846; cv=none; b=PNAZai26m6HVBoXV+jH2hO7F6kZg/4bJVD9gd7GtVXwUWGA7lrQYRZd7PwkkihygahWNOdQcgLSkW/28tLfKRSVN2Y080QQ1yL12JsDeCRpgsy3Aa652q4/yaNgd2svYNd/3co8OcgyU9EiUzs/unuevg6TLtvZnEOHL/L0OOmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787065846; c=relaxed/simple;
	bh=cf/KrJDQFnyQUw3xrqnSSlrwVm4zz4YP+q6euR/XWT0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u4dhcjp6E9mUqBbD638LCFpyL48B81jOzFVGw0d0CLy+lI199BPgYyHxqWLhVTwlSfHUVUeJQU1o4qEDkD+dhime6pnnBm+anjZH6gjbGljF91gVVFtXGMHtgR4uc11sPISJz7i+NvgwSbWb2aYm5wtJKBrajmf5BBgd9+7DfOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=chzL5fPy; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="chzL5fPy"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c20363107f4so509249966b.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 08:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787065843; x=1787670643; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gryQvCiECfAOb+HVvqPSFwmSjJ6dIN7CDf1WMgNH1XI=;
        b=chzL5fPynn5ln1dXh7xfn6dyCiwXWGcHkfab3+DGrO0X1sLv3GshmIllJoK7zN+exh
         uPuWqM3R+1tYm24AUaABQOmtFT1SQ6lyc6LOfCRi3Br47nRs1/DJ1c1R4IOFpW7900BO
         VuBmWoU4C01XpsZ2lI4VhJVx+zpJR+d1Crp2QPh2Hlyen/Ujm/woWFEYuD55LyAWXXmn
         M/YWOUYS2rYg1woMGxpkEwTqbBYYJo1y13cf8TZ817CgU34lsgFT7YGbLr0Kzmv1+8ke
         6NiCaKEnlqkH6roZtKbGs++HNAspfLxMcP1TubOR+yrx/qihgHEqiewp5LyXjyYMTMkz
         OlTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787065843; x=1787670643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gryQvCiECfAOb+HVvqPSFwmSjJ6dIN7CDf1WMgNH1XI=;
        b=jnlQc+scQnYax9nbVy5fhndE1zBV/Z5OcONXCw1FlY0Y8+r5qioNuUmAOrS+z/Qpq/
         rNhTK2H/Z41X+qq44qUiQsRCFQTa7e096DU264rPDhyBo2b1OT24c0/vSxctaLVQdjBE
         0sx2p7nFz8FSPl3HdZrPP2SPeydX+Z9vc16ggEBFZaQ3sygFJBGB4sKZcfIpvSIWpcJx
         axxi1RC5W6wkT9lGORUfcs9UvRwcWdIs3kHWnaksLIExxCEyC6VAHVPzzPwAJW/riWcZ
         yoV5gpdFq53DMxGWYWMObFZmPEY7xDwNbaG8EMkiFfJge90q9Qu7+2qRVZpPDZiOaBCF
         2feQ==
X-Gm-Message-State: AOJu0YyanwDkCpMeC4IvAWL39yXBVl4bquACatvr3l+7LfVMQzzt0But
	zEWsehe6pIEv+Ir5Dtk/F3KKFt8Yj04l6KNcGRhq5Ye+0cP2aMG+F+YwjJSQVgJo
X-Gm-Gg: AR+sD13wf5R745SFSmITuPpVgtm3NBsROUKdOIfvyN2mRjPJycDsH4tuK8mIGintNga
	ryslXwsgPNnv8sZdDDjEilOAtSfp57exvLijAJM252cSsuVGXVHfHBU3mu9P2XeIVIVjLxTn1i1
	D3X52eASrn0xiSNu0mqU6jO08dyqL+TI7YOK7og1ujOTRt7DI/414JLY105xwgrEif9a40YASkf
	WdkfducuB6o8dR01hv8O8IDL59o/X1xEFYneCqyyhZGXHOwgUQFQDxRN9oJoOuzoc3lZhFc/17P
	RhI5Uoo/G8B4y3joU6HkJsn0qkXwgro22A6bMyO4ah8ogPX0WcAvVP6J389YQrMl0dHDyfnQiPW
	d3x9kjbusvRu+WW75sU8o/yg5xRr/3TqFyNys83E4qzp1J7aS5NNeO1o54PehYefunfR+2T+wcT
	KnQOHo3UvcNv69B3m49ZEWnRZSTPNUFPCk4gKWYpw55Owy78hDzCCyMsLhT9ejerEs0kLXA0cIb
	QGdOdZEIKH0q9z7cFCtsA==
X-Received: by 2002:a17:907:934b:b0:c16:5cf0:3aff with SMTP id a640c23a62f3a-c2188a7ff97mr581814966b.18.1787065842648;
        Tue, 18 Aug 2026 08:10:42 -0700 (PDT)
Received: from workstation (161-53-210-87.ftth.glasoperator.nl. [87.210.53.161])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c217fe69cf4sm205772266b.3.2026.08.18.08.10.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 08:10:42 -0700 (PDT)
From: "user.email" <zstaseg@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sebastian Reichel <sre@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Stanislav Zaikin <zstaseg@gmail.com>
Subject: [PATCH v2 1/3] dt-bindings: soc: qcom: add xiaomi,taoyao-pmic-glink compatible
Date: Tue, 18 Aug 2026 17:10:37 +0200
Message-ID: <20260818151039.409767-2-zstaseg@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260818151039.409767-1-zstaseg@gmail.com>
References: <20260818151039.409767-1-zstaseg@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stanislav Zaikin <zstaseg@gmail.com>

Add the compatible string used by Xiaomi 12 Lite 5G (taoyao) so its
battery manager can be matched to a device-specific variant in
qcom_battmgr.

Signed-off-by: Stanislav Zaikin <zstaseg@gmail.com>
---
 .../devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml        | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
index 16ad4f5698fc..3a74b5e51e9d 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
@@ -43,6 +43,11 @@ properties:
               - qcom,sm7325-pmic-glink
           - const: qcom,qcm6490-pmic-glink
           - const: qcom,pmic-glink
+      - items:
+          - const: xiaomi,taoyao-pmic-glink
+          - const: qcom,sm7325-pmic-glink
+          - const: qcom,qcm6490-pmic-glink
+          - const: qcom,pmic-glink
       - items:
           - enum:
               - qcom,eliza-pmic-glink
-- 
2.53.0

