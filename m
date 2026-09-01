Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1286F47A867
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 09:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788254807; cv=none; b=UXyLIYU6SE98WLaPJP6Sr4Hqy4oUhLt3D20OQEfggBozYyXPsV0r6wnh+frBtgKNwyncgvsK90LAGcdurxr/jKxF311AaXoPfwykxK20+o9I57mOdxozLklUDV6rV1qNhyiC6eAxQnoaR3zCY5TgoSeRWlW1ZxqJPzDvLkND6RI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788254807; c=relaxed/simple;
	bh=gKbqr+JbhugVzrK4haKucfxH1GbAmaJ/63Ra+8PimmQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YvxGdDizlqcOMIP8wAFOslXcfx0h1QVh5QYDzfHbvvj6lj5IM2CWsX2tUdpohDZk6KfjqOAdbaYBrpOqbBVKi13o0FvJrPLNVckDUOcDjEIh+6KyzHbMaG32csT7+8isYqB9vgR2gk23A+p8tEHNYx8XXaEqw+pgY22jdxY1BG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GzTeYvDB; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GzTeYvDB"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c96c92c0980so505733a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 02:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788254803; x=1788859603; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rRyq9W1nPrd5M7AXluKRAa4K58WRzpGWnzgIJ9MVQJI=;
        b=GzTeYvDBKgXDqnAI/yVJ+M3Wxav2Ar/x9LKCOas+qBwun97d7j0uMttwbnBTjcfqBU
         6r+CFazRkXovZ4xkohMOQ9bLhqLp8p6FLyXVX7ZhXDV7rPCvof/g6cTzuuzeu+mFJzxr
         ZZr5RO/qm+3GetnaQcTCcCJQ5AcgJr55rPFmBPUb7dKzcfI6KIPtmqbuIszBNV35GoTE
         RC4RcYpX0GFy3wr6tAjdZ2cuRJspNscgWvkelcN/ABlRXAS/R/AWIcYMoplcTXKNEiqL
         2uL7iSgmFshXFi4IJgyjSif0q6bRC+WLWCRLiFZdanL6vh7dj6IOUlLyUP3+Yd/02cDi
         pHiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788254803; x=1788859603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rRyq9W1nPrd5M7AXluKRAa4K58WRzpGWnzgIJ9MVQJI=;
        b=M8xOxzJxjQsCEpuBoSL6DgptF/crmu9SDDXELr9gx9j82zdMY7jpJQLQahEINMglOb
         usBjEF9GWYOIoREZXEs2qedHlKlYxAO6ZFZVUr+IqaHc60T37D72EwHKOdzJ0HegC+P9
         nTUgO0GBryxYj6sb5yrP50HlIeL6FQQemA/BB4jdLadsrymxVZiFxB/aEZt6zRBwZhfq
         t8UJLNlTJSWWyh3ThrpXuayf10UV+ZwencbWb1hudf5DpLkVEmHgTesrv8Azj0abrr4/
         ZEp3zw0iHZy/9gbjTcfE59pPb1/jGdVfTLTQtfQSAd2bfQtf23gGGMdkrUpQNgQTzgZ+
         opkg==
X-Forwarded-Encrypted: i=1; AKwUvBxe4U1r5VZhLGQNm2iY64i6sk5O360f1GDYAOjuFG1pYlglZFlXCWvJxpXuu6UJv8Z53C2S8kEHKmFVzsgD@vger.kernel.org
X-Gm-Message-State: AFuF++mlujw94Ecf3sN2cPI0ANlLK7GUQctAeMfl996lxEmLpWDijz2z
	l46vRYU2nufJuQEaeJm/8UvQ1Ti5QYW2ljHxXMXxuyDZqTOecqDD1RyK
X-Gm-Gg: AYBFou2rjkQMjGOjUkqhZoTHQRbzKceWJsGaP8revDfrDdnP+FLtVut9NLYdAXvMFz0
	EePilGHgeNsc3UbYCS2v9Ib7SafvTGhOUjL9C4q1s1NbCETwphYP1FsCDOteeMLAMsihCTTb7Sx
	zHtrBVhwYL0b+0PfXDPWb3gHdOrlMr5KdLtZgQEP3Wkl25+imzCwFQIhAuokhpxcKMlDAQ6WnGK
	jT6jI3Xtr0wHTQbjScyE8a7SVuip8csOJemyW3KTHdxPqaFXzMAWFts9VKgaytzZhjw7cBA8b/j
	mN2+n8mi9hSwiM6v1tIm/mUAYV4SnzqYzaPmm8XNgURoO09lDwXklX6LE2hfjCT424kfzmRzMx+
	NpMcjL+0uKZd0ToYT/4SjV3368cq9QVxVNhnITkhp/SgTmU2Yg2f/cehvZS9d+HhTHI7aDwZHcp
	knMSP9DDERkfth/tb2XCa7zneHH6E/xQabCEW55yVc1oFbfRtPpr9V/zQHKlofQv8Tdmz4Vqxo2
	LlbSx8DSyE7
X-Received: by 2002:a17:90b:380b:b0:380:f85c:94b4 with SMTP id 98e67ed59e1d1-396d0f2391cmr45758593a91.7.1788254802943;
        Tue, 01 Sep 2026 02:26:42 -0700 (PDT)
Received: from localhost.localdomain ([157.51.207.128])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32b28ab0571sm30004560eec.4.2026.09.01.02.26.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 02:26:42 -0700 (PDT)
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
Subject: [PATCH v9 09/12] dt-bindings: firmware: qcom,scm: Document SM7250 SCM
Date: Tue,  1 Sep 2026 09:24:44 +0000
Message-ID: <20260901092447.3028-10-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901092447.3028-1-sreeshankar0910@gmail.com>
References: <20260901092447.3028-1-sreeshankar0910@gmail.com>
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

