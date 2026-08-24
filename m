Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA9636BCED
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 15:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787583800; cv=none; b=cZyS+ptku6vkkoCQN86NnTdBB2ZjTqYwOS9n/E7tWIRJitH/iPM5D5zD8uDnc22RxbU4KRjVKJ3McnXMej73iy86T2pW5nrnMZZ0CrmsCVqZzO3SfjrmToBObWSEFW+4giy4jv1nKM+Lv++McQLLlHmdo4bDJFZWd7Ou1lS1FQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787583800; c=relaxed/simple;
	bh=KyU8fbc7e+jGln1gvgBbCQwRZ+9nqq3IhPL/wCHuXiU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U8oZS+eMviVSc/5S1Zxgk+lwuwZSn90WnY5uVbC0g68qi42qbJp5iQq+AJRjXNiJjeQITJ36+UvpBVGfN6KBuHH5Zx7l3X+G6DHtyYle7k3sbtoWNfx16DJxugtP2KhalyhqAnPu1fYeq7z5/R5EqO8HyuuF3KBoLTCsOUhqae0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E34Rp+wl; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E34Rp+wl"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38e041ea211so2986287a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 08:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787583796; x=1788188596; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VWJvev8rwDkHrWVtePCBv0HB68OwkWKr1ifArwWeRlE=;
        b=E34Rp+wl0yz1IPG8cRmGYQ5QFdSCKhFZETCgIoT8ZRD8dvKXKrOXRM6kUm0KvrJh93
         8WTVJbbzrEW/tqqWeOxrGYBlx/rlBI9ez3Vsy44dfBMdUaoeuByTzAqSgToIsvjUvN8B
         2Pp4A39Gk4M5AlLi3Lj1MPhZOwdrsILoNRkWBuIOPxvrMGmqHCou7YAQ+GUnBfFAnkcT
         AywKo2tBDbUNcJouBD9b3jHVjAFSdmXLt/c2/pkAyCyNY8oQx41SB6glK360uE6oowHf
         i2gRTSxZ2fDKUe0UcWuOn0dmDfHXE/CxYDXS8svEYodY2npO2ys6WDptZsFrgsyr3odL
         SoLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787583796; x=1788188596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VWJvev8rwDkHrWVtePCBv0HB68OwkWKr1ifArwWeRlE=;
        b=HLr0fErlKHQyOlCRNJqvxzrwkOZVG5HJxPfGpbIj+RY8MYgxYcZGLEceCRDjNhxmE7
         YQw03TOaCUQm7X8UoMUUCd1qk9yYJ7Bcv+kPKbQ+FnrcfWeWqBtceeb7dYMkv2UmnumT
         Hwh8gkectrbXVX7jqnwhueXfWe/Q9titeiS2Pv7DnKXVYaZtLuOGAW8iGh37mSaLF2Pz
         ncFhr+a81N+vbvxNyhAmTk+PpbCpPFuxOdclX9x6+STbKGJmXUGeqEe9PZlazOWJtZEa
         mlRz/jS72yWgUg6F7TJplrMfTpFcu2qoBFcOUH8n1T3nVkH5tytmAkD6FjuO08Br2fhg
         jrog==
X-Forwarded-Encrypted: i=1; AHgh+RrMtrAJ2Cnb+WrgSrv5xDVKFJxfo93dV+W/VfNhzjOLD3JQDF+2UTpAB+meicZciIJGi++wx8D/zsW/S0tB@vger.kernel.org
X-Gm-Message-State: AFuF++kccM9Vf41npKZmT2FbaBqlTNvQN03icrPcBeD4VkvPVplrxPkI
	hOCuuZ2Utxxb+DVH15eHXqpBwlvcYczojVEIaSfNQNVrBLz87aeixwwSu3tGDtgp
X-Gm-Gg: AR+sD13/bVlQh0jZmTCXLJCIWgxMrVsgWhXAQXpjLTfvlpS+5J+CekJgD0pDz7gCstZ
	7uLHP330CTSWc/HlWfl7EO3oD1vUlzXOoddvpcS4y6G3Jv5tqg74ObErFImXAjzeTceDnaqdqeu
	DHnLuo3lHnZPkL0MLYoOw2SNp4vOHsc9o0AYL+MT0yRBUPAAXx+F/Z6GAd2JPpVi8/jBREtQQ02
	flqGi+0CkwR7h8/8gyZ6wDmYyLSAAFqsYn2nDSIJvQFNVau7rSPLUzgB0qMJVr890x4qlFzKJIF
	f0yFzE9ZRFVSi47aU7oSyEV36t6CmiT/jJlkkhOR5j3LsLHba22Q9a/2vznEs9F/HIK00G9HCPn
	fC9nVkRmSfwtfBFG+UWhEHrzIZkF+Z0ek5NiqYiThOzZGDfrbkah6tWknHnzFEXBYK2IoWp8/Pm
	aBfZKROwnaHUO6FPtdJH3ZrK+GXO4FUjbrxw2LPRddP/2rpsSIunmLQVOMXeAfB9eWEL7s1U+CA
	8ShITBImnZQ
X-Received: by 2002:a17:90b:5646:b0:38d:f5bb:e0f4 with SMTP id 98e67ed59e1d1-395c33367ebmr51192671a91.1.1787583795944;
        Mon, 24 Aug 2026 08:03:15 -0700 (PDT)
Received: from localhost.localdomain ([152.59.223.115])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f91d381csm30035247eec.19.2026.08.24.08.03.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 08:03:14 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	rafael@kernel.org,
	viresh.kumar@linaro.org,
	konradybcio@kernel.org,
	tglx@kernel.org,
	ulfh@kernel.org
Cc: bmasney@redhat.com,
	radu@rendec.net,
	abel.vesa@oss.qualcomm.com,
	lpieralisi@kernel.org,
	taniya.das@oss.qualcomm.com,
	danila@mainlining.org,
	davidwronek@gmail.com,
	mani@kernel.org,
	robimarko@gmail.com,
	linux@gurudas.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v6 05/13] dt-bindings: clock: qcom,rpmhcc: Document RPMHCC compatible for SM7250
Date: Mon, 24 Aug 2026 15:01:48 +0000
Message-ID: <20260824150156.1310-6-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260824150156.1310-1-sreeshankar0910@gmail.com>
References: <20260824150156.1310-1-sreeshankar0910@gmail.com>
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
index d344b3386..df9e37f90 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -38,6 +38,7 @@ properties:
       - qcom,sdx75-rpmh-clk
       - qcom,sm4450-rpmh-clk
       - qcom,sm6350-rpmh-clk
+      - qcom,sm7250-rpmh-clk
       - qcom,sm8150-rpmh-clk
       - qcom,sm8250-rpmh-clk
       - qcom,sm8350-rpmh-clk
-- 
2.43.0

