Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7221937F31C
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 06:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788245125; cv=none; b=lfP5T2eLb2zAkLTIkn9xgo6YL2kacZIYqaAbc7ZfayNcebNcc+WBdRKlTd1iDFNyH8OAa35sQMXHzzlhO6VlNvWn+nNrzfQo1ei1NWopayr2TiZD1xC2TKn1DRWsuaN3+0fyGQXksf731TVTMCmLJhHq0cM/i1CTXwFaW6gGZgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788245125; c=relaxed/simple;
	bh=ifqmFvQHebUZje8XaAAuBMN9RaGf9xFULb+csDNh1fU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HFQU3f8IjOOsQzTkEbSGqicV7Skwx6JpWkigHHWdnUM+f9AnR1j8lNmtdCtbA/ynG8ikePRNf2KsM58kZomwwWXb9CZ8HYdidkEDljOzfOv+JtZ2DfiiIxQughOUijk4IGz53kLR8MBHM7C3LwxLrllkPfFRRTPMUMuYfArKAnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nl8Jfez5; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nl8Jfez5"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2d715f4a587so7384215ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 23:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788245117; x=1788849917; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5HJ3g3vUMid02qe6Hj9lnKY1TCRNcUH2lx/tar8eb9o=;
        b=nl8Jfez52HpMQ2lFe/hev2LPCs/unm64rKejuq3L0bJe2f0evWkbicv2kUzNEUXgYV
         t+vUf/+2JqgzxRXSiAhHiVQ/h1F6Ce71jfDhTqfAV6tMqsaa6ehm8JcD048FV9qoxaIR
         zr2QZPmYYIkaHpu1/6aBv36/0J/EsW60cOBKb08FrkK+d58VUNJ5z7/hBZeKUu/qmBsC
         jorOHhOaf7Mik5Hj+mBiddHgcZjq/0VLrSnKDdRAwsYahuxozxaqn5QV3+pNjpicxVmI
         aFPVYRPJCT9QzO1ZQEW+T9X2aAmUyX2SPYwY1qXu5sAQ5qNlZw8pNMdt2J+0hlqiHkdB
         1+vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788245117; x=1788849917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5HJ3g3vUMid02qe6Hj9lnKY1TCRNcUH2lx/tar8eb9o=;
        b=LOMXogUh3Waw0uxsQCdnZ6wyOSJdpfFWCUzsxe66r01V/RqIO0auDhkiugJD2TEKVe
         4OcgV1L6XhRRkg8vIb2z1nI8UEMBF5R2HPP1KR6vNFFewzHsTyZYa4lFYZrU1V8bI9ff
         yV0LxmCkZ9V7AKJZ3Bfi7xIyaALVpxtPatyrolk0ac1R9Cmz4bGjfjdFc+liM3PkZFjJ
         f6ZJs4mUk27kxJM0dYP7gx5AdiGB7Dt+Y9iHyyOTir8lBeOgAytBSwk7MghG3O++HotG
         /s5u5Ntca2AjO5rHDezf9uwzhBpJNpTabtcGMfap013fzcG5qsfA6vHenZIh52HSOlZ5
         ieiA==
X-Forwarded-Encrypted: i=1; AHgh+Rqg4oF2GuQtgVw0Wgg9bt0pr97iJjKT8epTFSTtfZuB1ORjdRSTVjh1XSAhDGiYF0F46tzTEo2JWauJjTdh@vger.kernel.org
X-Gm-Message-State: AFuF++kfWsDaHnnlHTKSfysqyGdMUuZhPFOe0q+lQB9xke2ZT/j6vmJ0
	gzzX9oEeluVA5SGsOtGvV3tc4b8IWv2IOVRwhXXWSDV+qXKzXqh7yTvR
X-Gm-Gg: AYBFou0XXil8+Alci5ExO9/kg1Ie3qQzgqemG9HoMGoii5iyhHomd2OCNC1TAWgDsa8
	inbM4f2ux0zt8jPUNiM+nOXS23lzgI08ggehwGQiLgofk35i9SsxfV4SYEF+hCIxfoZZhHyNKSu
	KPDP7qYQ2yRYJ7NBMfluAhuuLZMQ0W67wBTuyket3fcVo/JAcmhN8g13IXZ1L/JDrg8WFtSkNfJ
	SgYB2aTCWnl2u+20yqGoCidhTq6BSxKMXZSdaXxsh/Mddr9PRO0tM5n3mYjkHph263bD8uW/UAc
	YIqtwkw1pi7NWbwKfJMUE1Mt3Z6GNFdil30e8tSIgdxexsniP5d8pqOER5HjOZQ4K8ESqlE0J58
	T7LYkmf4HNSvUzw082evectS1bgtNq2Wm/S3FDSgR575YJ6tqurRLr13zdoeSF8a0MB3ajiDEIr
	LLUMDeUjfdV1cc3+cNrk41/6uZAr7rkiqbB8xJnRF7fAkrTahHmHS98d/19k1XHyKq550fnTFVi
	Ohk1VIHou2YKBib6eU0XsQ=
X-Received: by 2002:a17:903:1b44:b0:2d8:d4cc:5bb1 with SMTP id d9443c01a7336-2d8d4cc5db8mr338679535ad.17.1788245114494;
        Mon, 31 Aug 2026 23:45:14 -0700 (PDT)
Received: from localhost.localdomain ([157.51.207.128])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-328713b944bsm37019784eec.27.2026.08.31.23.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 23:45:13 -0700 (PDT)
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
Subject: [PATCH v7 05/12] dt-bindings: clock: qcom,rpmhcc: Document RPMHCC compatible for SM7250
Date: Tue,  1 Sep 2026 06:43:50 +0000
Message-ID: <20260901064357.20055-6-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901064357.20055-1-sreeshankar0910@gmail.com>
References: <20260901064357.20055-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document RPMHCC compatible for clock rpmh driver on Qualcomm SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index 2b446aca5..45d3cc861 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -39,6 +39,7 @@ properties:
           - qcom,sdx75-rpmh-clk
           - qcom,sm4450-rpmh-clk
           - qcom,sm6350-rpmh-clk
+          - qcom,sm7250-rpmh-clk
           - qcom,sm8150-rpmh-clk
           - qcom,sm8250-rpmh-clk
           - qcom,sm8350-rpmh-clk
-- 
2.43.0

