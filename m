Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 665CB3B7B9D
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 08:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784622328; cv=none; b=TsIlJFUCOqYh7N3DbnHJ3n3k2aqVfvLY7gkVa2I0Gck/XXKy2voEpz60UO6MwMHzI8m1KLMmoTmH0auX9X1Tvyt+LAs9xnIBos3iKtRCzGSLklzl3R1eUbx1QdLGmnBxjYJtg+M2MN7OK4zRD2rGK+s8IRFXf1iguVu07ShyY+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784622328; c=relaxed/simple;
	bh=jlCI3qAD/MX7cDwqgb8C/Gmpk3gT/3v3h+Z1gtu0iHc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M1s6gvSWmeEvGapd8YDWBwuMy3aND9nfcLpkAY4Mx6AFTTm9v/WBP5ebU7bm1odzfuYpG3FpzUK0+zM3KcGMy9o+TBK1wHeGrEAKIZ0xz2SpRxl7C9E36Tv4tOX/uN7dz5I+JPlkcIMMQQkluB2SA3ri5EqKvNGgfAxLhfZDiH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YZ2o+OEc; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YZ2o+OEc"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cbb7926836eso327377a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 01:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784622327; x=1785227127; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UPfN3W4quVbwR0KcDgvJuVWH+t0Lhic+v8Aswl3UymQ=;
        b=YZ2o+OEcoM40j/UeR/eeRSIUSKDz5e+qVFIJvU6BDxCQYsxtsH8xEZHGaAOxPVmmg5
         PmhiMXac0kHp+4mQgvvh/UPCOBX2ugqj63yocXAXKWw9yODyQPvgFuyBIi3+esII+FH7
         CMGr67dn1g7gON/wWsOghSBbA0ot9NfIHIZ+4plmobdz5tZMorw36BgnRTP9tnzKmWWu
         SxdVQwohZdoyM6lrcWyYVAq1EBzGy3KRDuWmOXLEYjVJRE+uDwLe5NADn6UHVWdlxDzo
         qHVvR63cqTzwky10NxAFgmOCEVsTBejtVdMmnZbfOMkEvaaESglUwv1wQ5UrMbi17p7c
         GxnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784622327; x=1785227127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UPfN3W4quVbwR0KcDgvJuVWH+t0Lhic+v8Aswl3UymQ=;
        b=bjCu6/ufl/Jk+xo7/xopMN4p5NJiGq5ZciPWKQGxhl7BR9/cPMA02G7NNqZgHPzmuv
         SRpX3uvAP0xzl2B+Uu2S8Fc5wtsz+r+kntWywvrGG2Mbvt0eCPvTNnJzIBTzHRq7p82d
         cMXKYwKUu/3CZ/po13L5hn+SyHFVhXfbnoP6qbqDaU2/svygtGzWO9njfyqBPpwGMSkq
         XSZ2Vt6vYFR6QLI2TjLqL8U7t13BYOtsUZ1VzP0DjuPbqfkLV9807jDQI/+9nxITHRfg
         fEJLmYLuigLn9J2p9T8pZ9hDNoqVz5UfzuAAKt8BE8RLbEIITrYhQA3MebFsskF8IUE7
         2Cyg==
X-Gm-Message-State: AOJu0YzXA/Uxq6SkGIF0HWwymsBFt2VGoI41mMvOy5UxbtHIo0tYRqMF
	MI84sGAWyWAtyZB65Q+mlnar8sq7h0arn1ZNyWRP4Z86D4xPQ2+32NvV
X-Gm-Gg: AR+sD12eP5VlKdW/SrERzhSehMHZDeol705CEbdFa7l4a2O0M//BnO/KMrr8PBMSotI
	RglGGT7wnJNaL4P55tECnumtFaHZD7o15NipIe8rJYeMmG4l08XhrCUkdAURdJxvXRaU0wSaxZK
	L5A2j751PZ/6+XnAZp32Q1tp9meVH4NcpwA+nOPUv4s0OWuebaDJqyl1ShJs42jsEUphjrXiQ+4
	8k1tsgID/2h///qtnmrFIL2tFfpOvTrKI1bzlE7EanHBub092sRlE5uFQqNm8jqFlwkVKIDdfGz
	hPiOf5e6U55ILE1XpK0pSYmVzwPtMJ7mNjxw4JibgsqCb4ZCzRyEk3tXOEo19gfRrjypLCjqLjL
	P8a7sNgQlV9xw6HMHjViMEg/O3onCNaQJob2aTOjOAFilU04EgU2LQOtus6PZzZMYpxyLhyyFLf
	7rThbU72e8
X-Received: by 2002:a05:6a00:ac3:b0:82f:38df:681c with SMTP id d2e1a72fcca58-84c293053b0mr17449634b3a.6.1784622326720;
        Tue, 21 Jul 2026 01:25:26 -0700 (PDT)
Received: from ada.lan (cwgw.codeweavers.com. [4.36.164.2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2ad88582sm6886600b3a.1.2026.07.21.01.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 01:25:25 -0700 (PDT)
From: Kaipeng Zeng <kaipeng94@gmail.com>
To: devicetree@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	konradybcio@kernel.org,
	andersson@kernel.org,
	Kaipeng Zeng <kaipeng94@gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: arm: qcom: Add Acer Swift Go Pro AI (SFA14-11)
Date: Tue, 21 Jul 2026 16:24:09 +0800
Message-ID: <20260721082410.18275-2-kaipeng94@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260721082410.18275-1-kaipeng94@gmail.com>
References: <20260721082410.18275-1-kaipeng94@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Acer Swift Go Pro AI (SFA14-11), a laptop based on the Snapdragon X
Elite (X1E78100) SoC.

Signed-off-by: Kaipeng Zeng <kaipeng94@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index c7c9a9279684..da653b787d4d 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1180,6 +1180,7 @@ properties:
 
       - items:
           - enum:
+              - acer,swift-go-sfa14-11
               - medion,sprchrgd14s1
               - tuxedo,elite14gen1
           - const: qcom,x1e78100
-- 
2.53.0

