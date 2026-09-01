Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0FBF4779B0
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 09:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788254765; cv=none; b=rNfKLTeccrZyeggChoTe/nFQQIoeU44xaJk5GS/KSauJH6x5NNkOauEA8arnkir5zh7/RNSAg7sY5QO/bKyuuh/Cpb/LxeQkRCrKy1M5VQOR+YBKBtpuKZVe2dLRBq8XKy9gFlJ1qdiVCUuQKrJJmJXtMka3hrl1t7oG64pCItc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788254765; c=relaxed/simple;
	bh=ifqmFvQHebUZje8XaAAuBMN9RaGf9xFULb+csDNh1fU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SD/RqAb1Y8QYfn9iodopElEHypwBYxovRSPe/m4HFN9nt9jcNNvH9ZO8eOVqhpHC17LBtJ1nywlMUOZYkaDdPdDvUPX2G4Suj3IOaXvkekNuhgajujBqdKvDJsPoclAgA3/BBNUpSKzM7jzzU8lh/I4u+TCb6OjG5QEmXeLN0wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CMLsWaeQ; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CMLsWaeQ"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3964e76d0f4so4862083a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 02:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788254763; x=1788859563; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5HJ3g3vUMid02qe6Hj9lnKY1TCRNcUH2lx/tar8eb9o=;
        b=CMLsWaeQA7Ovsk5/0r6jauDTjg73/UCnuUp3U6lOKmQJwg4v4l/BDzjVX8S+7IM1iM
         buRLKTzkDKxQD2ZKNGlmqMOBsdSKepPTqI9oFrGWw1Z06ojZSoZq9gRMpNjTHJg4+T45
         Nu/cK1j/h/VhS6PT5mtjyvurr0t5UMq0vLp36TTpWeJsXjRM5qXdwHR+pezyB2ORxuUe
         LLyqSj0U3MORNZjeep1Tdki2rPdg8DUJssleUD0Fh6ots5tR50phqxaHEgd9IYLAm/9T
         N/COlweGxUJS4kk9uGXvGD+t22nvj3J4aBXT/BRuxcWa80V6dxVhgZjFnqaw/aBAS6+a
         gbrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788254763; x=1788859563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5HJ3g3vUMid02qe6Hj9lnKY1TCRNcUH2lx/tar8eb9o=;
        b=XwMsH9YqdeNBi1yIykp2lshu/iSoyJQn5us04p+H+caTJzNWxVKKqjlOLU13LFGyN8
         2riDkG5YS/uVyK1+FOJplc21jcz9OucMCtxEQI5WcAxc90zPkpDATMBhdjt1gazjR+Hp
         KXR2x4bxqzuNgDYLBN/Rf72gcDdFzxYOGwxEq+FTKfVPBCAriI2SWqXJSIlpCFvnpUOM
         KKxiH46geE5FrBut4FD49VmrCz3wbwafEeQep1n2zRwDS5OYAA1byYqmqygWsEwlxCDQ
         TN1ZwAcl7liGaOe0DqwoBHwtWX+bPqR19z75cZ4wBWWl6ZuEP9D+RAyCIiVE76Breiyx
         +GbA==
X-Forwarded-Encrypted: i=1; AKwUvByFhBj2L9h30DijUi8uHo/9S1czUvgJ+xv4jsYxqwH35mnG0U3T496ZgVzbbiVtqmMM6gjLxUUqgfHj7KcN@vger.kernel.org
X-Gm-Message-State: AFuF++kNC0tqAj/P6DmDWqpY5wXwmRFx889bYQEzZNwc70ufhb6GE1aL
	Ulb2dNEVJVDDdDrWHtc3XYb7Yzh4jGXIoGg7KntTcZsOq27ApYVknRoa
X-Gm-Gg: AYBFou02aQHSvOP9CAYT9wnaZysozpBlFnCc2dBQoQiNXuKc3Z8gpM9kUOILyZv/YFZ
	HnpyA8uTNM3s1iPMpgT5U4ObKtc4LPt11MSAibn7GWOsAHmKWI0Oz95tsFC0temnyoF29fV8xa6
	dEIV8IZagi3TlSkHa8Dh5VfCKEDeihkeHZuu3s2O1O74pkoigJryPcVAH7FmNQGu9j8arDSiFXu
	lCJ28GgS8n9jTL5tDsiGUwXHj+Rs6eoTf+BOTWQmGuaNRnjrxHR2SL4jVouVysJfrgHwAUKcHiz
	qRqETSBGnwrlLVrCQ/GiBp+9dRbD0O+Pwa5aFidPJ3eithgc7v4FyL166LWf7hotquvHnfd6Q9H
	WvkFN0ksQK382PvaaUytS6a/z3KBR727VNOqlPHOvmAtkpgLGv/Kt5xye4wnr7FAJ+7Bo60eiM7
	jjZomWYOHRDuRuSm6QyAt6EbSQLrXOtFAQxJA2gfz+He/Kiu/uMAnwGDeyBfJCrTguqf7G7cHGP
	ApnJbdGVf7X
X-Received: by 2002:a17:90b:538c:b0:398:d6e6:4671 with SMTP id 98e67ed59e1d1-398d6e68870mr24005130a91.25.1788254762915;
        Tue, 01 Sep 2026 02:26:02 -0700 (PDT)
Received: from localhost.localdomain ([157.51.207.128])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32b28ab0571sm30004560eec.4.2026.09.01.02.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 02:26:02 -0700 (PDT)
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
Subject: [PATCH v9 05/12] dt-bindings: clock: qcom,rpmhcc: Document RPMHCC compatible for SM7250
Date: Tue,  1 Sep 2026 09:24:40 +0000
Message-ID: <20260901092447.3028-6-sreeshankar0910@gmail.com>
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

