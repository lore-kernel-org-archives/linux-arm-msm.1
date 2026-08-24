Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D290F43C05E
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 15:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787583844; cv=none; b=TOmrCpvf+xeGqRODEMp0D6aCMwnpgWclbJlVJvFfVq6Nusg8B97Iw/Ii6NyhrNDmE6LPUSPQ3aCrlrvOS/Q3PkzqRIUTmyVnop0a8lJl51iGT+gcePuxrO1rHxjI11diHwePFvWVHX9WhYnTDxyYIhMWuTU/o48VDN7s3xeb5Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787583844; c=relaxed/simple;
	bh=Unl00eAfFi9To3aFPzg9GlTfdXTVfm9Q5VowGJ6jvsU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bFQ7V/C6ATmHTcUYf8kN341ATi3RXflGS8RF3ypY7uRmPyDrOyUImuta5fQapkF4m9Xh9ZUIR7TnDcr7jWpthcxZl/KC6a6oggFiOk9gbCg190fPv6pndWe22S++IENMDAjsA+Ok6Yr5b5dPL4odwKrTsnYxlKECKZX90TUxfM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rYUqAMCG; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rYUqAMCG"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7f432ac553fso3388826a34.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 08:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787583839; x=1788188639; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iR99/HU1Sv6a6aJcZCVFplbKZQ+GSq64X/oQnCgwbZk=;
        b=rYUqAMCGDlpuVipgjLf9BSE5JLWUWa7BwQ3aooNiZiy/l8pi1s5wR3z5A5vb2bCMig
         0cb+LQAS9i2ZP9X6mPmSoojy7gUKWElDzyK42+UFPgVcZdMZIKVRrOREjtqmeYF5kESR
         8z9/ILOJ8c0t5pJQO9TOM8BMeCxNVCjAJNZ3eNHr1D8ikfasFEn9D7Yiggk08xYNr4cT
         G4D5T4whUXOXy7kBe9dXKYDju7hodgdC9b1T9KKjjNsZGOsUMaI/mZXEqsaLyBpc1WU/
         Lf/m2wRH6p5GX5OXqhARRQIeOW6HvcWADIEjWquGr2DsZ45ghLGVbobMoxGqGCqivvcW
         n+2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787583839; x=1788188639;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iR99/HU1Sv6a6aJcZCVFplbKZQ+GSq64X/oQnCgwbZk=;
        b=BlCb5DDh4eHLqQBr+VASyDmZDtVcqeN9/ajFFOG58cXSdugnozI622bpsbpRbqDJbe
         +4XMH4O4MkGSZgdGyYmrQxMt5nhgMqIS+dCngSW8JNnHgo8VwjjeKw/jUknWuYAO/n85
         MN6nYOpDtzNzlNfMCzSCXKHDtErajc+UGYiXbVcZRZKVxU83E2a5u9luWhF4ifYLYJq7
         ctYYGdrTRn7kB/WWTUo4yiHI1+e+vp7gTDepR4pxnkdIDm+4wBXD8gYu0jCkn9ofRH/n
         YCG2Y7XhsjSE6W3qeUdxWuKAM5m7UIHVarCOUnlrhGwEr9BlFkmiR0/tozHCjcPYJxiH
         w0TA==
X-Forwarded-Encrypted: i=1; AHgh+RpLwHUoOpsTMw5SnOq68KbRmsQ6+5NwsIwys9IfGOOpg7qhG66ohEgfuEO+HjLSTkP10P4LEkdylIJaD7Ip@vger.kernel.org
X-Gm-Message-State: AFuF++nK2h9LCKQ+LqsuhuasOPJwyViIgvhRt7+IiwwWdZKWrdfiERZt
	zt2T9N6Bi1DeGMgmB5zRry7l44XUGkOv2Z2V0SOaLFz9Xao5I1LqksQS
X-Gm-Gg: AR+sD11P6s8TELCdibQ8IAvcu7r9+phXqNamI9Ck6dsVrz/bYqadYDN6HzpnUjhpr37
	50y6J0r9f734j0Cba5DkHXBzasppwtwnJUr9oEhbDcNYKZGAFtTd00US09SL0V7PwgiWXTjdzQ8
	/B2D7rZxmw9wlIk9s+pTtkcxviwK1cztDraIM1w1kh9wV7y2F4qazt1v/PUcc+QzYUHvFJgWEmj
	jbpvJvD/8qhqIDJ6D2yjNWT5ffMZheFxjlm1IIr1wCrdwmQDEqNBA43BdOSeV2WjPTf8Q6LMYhw
	W+IId0uyvDK26jP3Vxou5IyBMTIch8uN307JVrwqE8p4pqAC0grEGfO46m9XhAYhgV1r6lDrRjc
	xq4Z7AdxJ54jBPRk/TGXPll9JXbujgAJj5ivBqGTnC8qg5r6CFsrfah1gWQvEciFMt4kL61058u
	PlchtqXCTBlzDF9rMyrUGWLCW5DRyhwoqZqEUt51/CFL4vlCXJmczBvG5Pq4b78sUpmC9l4MZK1
	WeWK19Jt07O
X-Received: by 2002:a05:6820:83c4:20b0:6b1:4b64:13f4 with SMTP id 006d021491bc7-6b159284d3amr19040221eaf.15.1787583839499;
        Mon, 24 Aug 2026 08:03:59 -0700 (PDT)
Received: from localhost.localdomain ([152.59.223.115])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f91d381csm30035247eec.19.2026.08.24.08.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 08:03:58 -0700 (PDT)
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
	Sreeshankar K <sreeshankar0910@gmail.com>
Subject: [PATCH v6 09/13] dt-bindings: arm: cpus: Document Kryo 475 CPUs
Date: Mon, 24 Aug 2026 15:01:52 +0000
Message-ID: <20260824150156.1310-10-sreeshankar0910@gmail.com>
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

Document Kryo 475 CPUs found in Qualcomm SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 Documentation/devicetree/bindings/arm/cpus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index 5be89c584..2a90af67c 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -212,6 +212,7 @@ properties:
           - qcom,kryo465
           - qcom,kryo468
           - qcom,kryo470
+          - qcom,kryo475
           - qcom,kryo485
           - qcom,kryo560
           - qcom,kryo570
-- 
2.43.0

