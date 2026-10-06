Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2228A3B9D9E
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Oct 2026 08:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791276955; cv=none; b=L4yBZ3Sn9+lIXZ3wpoLYjZeMCeSDOJrWwLM4wiEP6S7FjsdTIwoQ+lxGueWFRAo2DuAFSWLta0n0JFhLYoW6PliTG2phxpu/HyeLIEghHFnBWDUvlcJsOHELtdoPmIKgKg8DOGyAVVytBXr80M5LryP17XS7LrtTZA30XagEpUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791276955; c=relaxed/simple;
	bh=DU5hZk2w72UN7XPPKKC0Ei9MPQopHgndGyHLU8P+5b8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OfZQbSLkqGz4ADDMf84HoMSppmAdgONEXIcPa6Z2V6+tSXrdbHrLCVY1rzSnKrIsJc0IzL+erIRndBJkCMv9EoPvq75h3Tdp6ZRSkWIfEutVcAczjj7pmh5ntKUulztyiFMzqJQdHGAfeY511Svf7LgsjFsgmhaVi4RTfQq128A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IJ1yTe+X; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IJ1yTe+X"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-34ceab2900eso415730eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Oct 2026 01:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791276953; x=1791881753; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3aZILo0UhPf6mB0ZTQXoidi3QecrcEcdbBPeLfd20Is=;
        b=IJ1yTe+XBfoTj2Qjdipzow+M1xr7GmTj7jOnr5W5KTtk2NI3a53bwN+S5CGKplGAfq
         9nxYUniBzyH+e1bxP+GOzTVYtEllNyNwho4iabc6ZOvS4V6LlQjQkJXtRgm6NvWE4gph
         skcYkvRociO7C+mwVPlnVVUQO5fSsMN4KFvlu+I/i9V237BUdwRDUfwIX7iFWdJ0GEn+
         N2AV1CyEygvmEZA6EwLzgS8DcCPDAVP2I/WrF1Jk/U5QrMv8niGDAc14NXmKoKPxbzuv
         GmntGbnMQrqiGGN4ngPVYjeUOGCw5nddx/oSgzwmtrqmBymPH20IyCEwB+ZNUwrln//+
         VgMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791276953; x=1791881753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3aZILo0UhPf6mB0ZTQXoidi3QecrcEcdbBPeLfd20Is=;
        b=GWiruW7BlGTFyzgtMzmZavObxLVH0EJ2ZMyBZtJvZOfU2E5jcsRKBXvw5lgG3Nf5Ut
         SP92gmdx4vIBK5NkL3Df8ZW5nCPQJ+vMRcNlMIPqIqp1o/G7olcj61BIlfY24CgHogwN
         DGMZVbmLvSFu6A3MTR/07OASa32RAlyMBN1D97Ax+gVUgaXbR1GK8IARcWwJ0906AZcK
         8R4jJMYZWXyxepNYn1ejCYUHVcZH+mVmvUvpYWnNN1xvC3+y9rf6dGu8cscUZin0e28G
         +dQmbnIL6nx0wzH6AJdjF9ND/SaaXuOznsPDYcJEvgQOvqG9P6bloxwsZsDrSx7hVweO
         5Mnw==
X-Gm-Message-State: AFq9FYJCGQc/uiQQgeTcpi2hzidGOCp5ToY8WCs9LJUvAbh5VKn53oqU
	ejsiNCVKcQyMUfjlMOZzL4auLQB/5ZFCqhyBS23XL45FE+2Y/z5ENJic
X-Gm-Gg: AYBFou3R3a9guJNcdDpAJoXNhpFC+A3tq9ejH6oNz1+fLvagnO6s2FkwBhc+dpWhBYb
	jXPbncASOfisGKnB1PJdGvGsint5ymMtmKRz2h0cD/98Api9K/qzvegbW1Uo8sEnhnSAvS2xzhD
	uIOG0Kn5cJCmMQlFcO6Ja8gSRmA0LlQ5JFRjYPhxfR/TQMbrCzByM8ZyrJURU8aMdhQs6TcfESk
	8PkBBIrwFk5ama5aDveufHRLu9poVaI0Slao86j1vJX4Ct3oexPndFTn5PIBscpN0Dgf41QhVSm
	Lk4TP9G1IqZ49E5d8BbKN/l+hd8YTzaYAYs1xym2JkAp56X7/4JCQRL5+n+CJ1+eD6f5t+u8U6L
	S74NJw1itS/pkdiWrPVUgk6NQqNLopYZfty7mnS0RopsB9f9vEq1PmXy9QLTa4PabmWRRKFUXnw
	Ihz1l546RaU6GfCaW/wjFD3MXEHm7PEfEWVKZb4qmfnv2FzebkrLGE7IKxLI1CY3OaA1Oyz5UCh
	kLsIg==
X-Received: by 2002:a05:7301:53c2:b0:34b:f279:2c16 with SMTP id 5a478bee46e88-3514dcad9e2mr873245eec.5.1791276953239;
        Tue, 06 Oct 2026 01:55:53 -0700 (PDT)
Received: from ada.lan (cwgw.codeweavers.com. [4.36.164.2])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-351469f6dccsm7008620eec.7.2026.10.06.01.55.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 01:55:52 -0700 (PDT)
From: Kaipeng Zeng <kaipeng94@gmail.com>
To: devicetree@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	konradybcio@kernel.org,
	andersson@kernel.org,
	Kaipeng Zeng <kaipeng94@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 1/2] dt-bindings: arm: qcom: Add Acer Swift Go Pro AI (SFA14-11)
Date: Tue,  6 Oct 2026 16:54:24 +0800
Message-ID: <20261006085425.40450-2-kaipeng94@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261006085425.40450-1-kaipeng94@gmail.com>
References: <20261006085425.40450-1-kaipeng94@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Acer Swift Go Pro AI (SFA14-11), a laptop based on the Snapdragon X
Elite (X1E78100) SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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

