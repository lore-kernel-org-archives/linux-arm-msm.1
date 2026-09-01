Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 805EC41A55F
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 07:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788246551; cv=none; b=iit5gx5fCA7GltHUzVHMlEidCNeZ3dEDUsJzcHvhSNOCr2CZGHmLWe4U8Q7TSvonvemNW3FlC5gnweAKUt/kDCqfojkvp26JTcPD0YYK/PINJH3P8wrYoGh3IKXXAnQ5lBA9bnVp7csYsdf2P9c3IPSgrRLWxa+PxYa86kOJZY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788246551; c=relaxed/simple;
	bh=gKbqr+JbhugVzrK4haKucfxH1GbAmaJ/63Ra+8PimmQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JphD+r4ln4mAKqRHVdOh+Xg4KrbCDe9OgtI90/yn49HGlYXsJ8CdCAwuPgDqIOUSs0/HMeK3h5oynvjhxUL2obGEijuaypyRyxEKeNAQo40Z1xWGxRII7tGNJ7NUhR8+jrqBDiXFK8d82nkSevECCzqFUuxUuqXt9g8t1tdWW1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Phe2JqIW; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Phe2JqIW"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2d8f265cbe6so4930325ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 00:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788246543; x=1788851343; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rRyq9W1nPrd5M7AXluKRAa4K58WRzpGWnzgIJ9MVQJI=;
        b=Phe2JqIWVhkcmHMVwV4x2jf2mFz8ddFaX6MdeHWdvR/6x5yIqugoX1/+4DNNjJSft2
         X/SeOAojkzak60UQ4rU5+7jkXN3iHR3Syt+yxmHap99/P6Xy/oS9OVIdxqPPldnh4K/v
         GloILvN2f/iUIKDlNJ1SZipjw1grWQcNMbXC4uZy3W4TfytoHk/NxbYbrq8t6a/nbURt
         3mGjVpq1tJVR1ptSQGyzJPD18OoUvExs5LKZMp2Y9ugzSXVcqzU5mTXJtIjT4qJrb8VM
         SKAUd/t7s2ZGvoHsAKfZWuCzgdIC8fwrxw8G2LeysDcKCEu+K16wWO64xZkqPbZhXGP0
         MCEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788246543; x=1788851343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rRyq9W1nPrd5M7AXluKRAa4K58WRzpGWnzgIJ9MVQJI=;
        b=PiLJx/fTM4W3vbKs+n0yvvinAcuvqbZ03mFFfNj0+6C8xr5u5HzsmiLndRjXg3XCQR
         kW8oafRiu+z44SOuNJ75VjknfaFCk6LAZB59wxDy3DwywOnGKJMplGB5Dml0KmWz558g
         3xOuYWMHZGyrPwqwW+Gqg4ldHYstsDXL7FPriJvQ1hVndEW3kvjrF2joxDwwBqavrKwh
         Kv5hwxAbf7ywT1y/J4VAhq5F9n9hLn6G2sieFozIePyJRqTUv/no+fb0e7KbT3ncF8mx
         rdg0/PObnBZ1X/lmwNtu86M2Lvpnvh64tOjinLMeAXHx8VZqlqAeypMhn3jC1wRynxCh
         JgVg==
X-Forwarded-Encrypted: i=1; AKwUvBz0wBqFRwbAgHStoNqVxhirXbZsruCjZEzrV8ar/BlZ+j24oOuc595gF+2gLgvikaXfxRwR97oIHgEmzP5n@vger.kernel.org
X-Gm-Message-State: AFuF++nVtIRTX79zpgoEuCJQWLjK64AuS3vq7ehp298h1HlkHpJGtaaL
	VQiDFHgOP3z1uIkif8nD4GGmfw4DOmgjf0PH69DvWorSpaW99rkbULN9
X-Gm-Gg: AYBFou283waHLVM89MT6bzwfOhy4Kb8i8/uXcBnWtFTYgUNgabfHh3bS4CTvIp6il5K
	CgcEHjQaOk3E2KQooGLmNw44x0r0vPlN81x5mHZV1ZUrDfkWQDir592Gy9ZA4z62fhjk6L/FcZM
	fvCAK9R8DYDHiuJ24hKSrNS2gT3EHdXjSm7Be/AJkYiVn+vXp9yPTKn6exrm6MeymvN+EOdlBVu
	C0Q/jY1CDIpccz6Xhgp7Pz8FA+LihujMtK9FdRP9RXMr78nDOen+TqCTb1g1FVh5yYV7YP2A93X
	UDSDdEq/vPV7EbR1g0/QtEW/3V6xnoBSPvwGiPbarTgUosffu9ZySYZu7/WcBKY8Cg7oEpWRmv0
	PDg+Fd9kK/u1H2ksvY2uBpunPyIkT5yO3ABa9WuYtAjDTEIwTsbbPOlohkM4p27JxkYerZWqUgm
	3ZHTQPkhksVg2AtZseWaXzt0pRx1/ubr1LFvssYNEuc4FIGLCgxTRhV2bWnoWTCLxLZQJulEUU5
	aocYpdz5iA3Sg==
X-Received: by 2002:a17:903:3803:b0:2c8:2808:3ec9 with SMTP id d9443c01a7336-2d74df0328amr524510515ad.12.1788246542738;
        Tue, 01 Sep 2026 00:09:02 -0700 (PDT)
Received: from localhost.localdomain ([157.51.207.128])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32bdfd03e71sm18274680eec.1.2026.09.01.00.08.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:09:01 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: andersson@kernel.org,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	rafael@kernel.org,
	viresh.kumar@linaro.org,
	konradybcio@kernel.org,
	tglx@kernel.org,
	ulfh@kernel.org
Cc: radu@rendec.net,
	abel.vesa@oss.qualcomm.com,
	taniya.das@oss.qualcomm.com,
	danila@mainlining.org,
	davidwronek@gmail.com,
	mani@kernel.org,
	robimarko@gmail.com,
	linux@gurudas.dev,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v8 09/12] dt-bindings: firmware: qcom,scm: Document SM7250 SCM
Date: Tue,  1 Sep 2026 07:07:14 +0000
Message-ID: <20260901070717.20513-10-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901070717.20513-1-sreeshankar0910@gmail.com>
References: <20260901070717.20513-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the SCM compatible for Qualcomm SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index 037d4ad8f..0cbdb3b2f 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -74,6 +74,7 @@ properties:
           - qcom,scm-sm6350
           - qcom,scm-sm6375
           - qcom,scm-sm7150
+          - qcom,scm-sm7250
           - qcom,scm-sm8150
           - qcom,scm-sm8250
           - qcom,scm-sm8350
-- 
2.43.0

