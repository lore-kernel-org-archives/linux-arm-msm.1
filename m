Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793978215;
	b=cI3okujKSa30upsaOBu9p3lYpsPu9QoIHhNfb4F9fU3nbbbjAu4Qhznh+FUYFaQrwe+j
	 g0i8N5IvpSxhlZ9wFmK70Y4f6vlBJHtCVMggtvkIeEPZTA0hIcVE2eD2V1hZBpF1MYFEO
	 oYbl9iJ/FV9me9ZlmZ2e5HTJYDc/V5gptxqdGK//fW/GMCceLgXabihC36+MydGiLu/40
	 2G4oMj9KHVKIjgsON7A6w4B6fxqKyUw6/MwATkd6vmcS6AC2pMfthDBIOnYTrBHy6tTSk
	 JakVw5JaiCbWO35mfHUPeN23dk2HM/JPvEqS/qqi5sCuXmya215uYTwbvU2lB/KpDKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793978215;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=qOERypWJhWIh0EMLri6y7PTlFgXfpVg7COFVnAl5d1M=;
	b=LDCldVIYhiwGV5MdmHywAvLnfQDKGWfJ+yig7rwu6RcDHKbu5ks4BPwrJJ4m9VaEEPTx
	 Kpls7LKKvy0dHTymw+9qaSJhxKzGCKBWqz6fhWqbAzhN/sjeqQGp3sRO6FEUTqtxVMOqQ
	 XxNSqee2daUQuXiSwatjGWmcPv1MLxwxsXvJtDu/13eM3S7VMNRntO/wIUZGErmjqwiwd
	 R5bhrn1eMr9uBPSpy5WhRE/8WzPz4n0ft5Gh0MPiJ0s1a4SyK2ZsXJqwEPIIoWYaWUmPB
	 bwf+2V22P+Aevsd8H7KHQluX8+WG7w0CYe6PnbWGzd/WZIQckJiJjKxRShOqt9EyPwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UJ2mv+wU;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B295C606A339
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 15:16:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B295C606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UJ2mv+wU
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-36cad25b8b0so1216389eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 07:16:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793978214; x=1794583014; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qOERypWJhWIh0EMLri6y7PTlFgXfpVg7COFVnAl5d1M=;
        b=UJ2mv+wUuXXO8u7SnP18fog6WaoiWwvWKnKvySMt7qV+3dlB2tt7iqeGvpAW1lrpi1
         z26GL514JQI4LJBgGjfHjRWMXWdE+euTdx0gAVgfRRsDDwK4O/3wCVVkVMr2atlDb6Sm
         fFLUzM0NZ1RvVn+om0BPvHoP4E4az7uFs5K9W7DWpegBIKSJZ7wMWJj7cAeQQAyrVeld
         cBfu7mHCX2BfrtH2PNu/Zr+UkPcmxPKP94S3Qp5JGnA83bfvm59addxBC5XCsj24ItmS
         bV6qYppWswv+1CAuZ9YWG7jer6QcEHI3i+6GZCmzAbLANmEVqn2zxFIhiDDaBvwgrXU9
         oi9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793978214; x=1794583014;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qOERypWJhWIh0EMLri6y7PTlFgXfpVg7COFVnAl5d1M=;
        b=afn1AJeYYe7Bl4ubjPeZ0CgHyabTCnZE2c+x0pc1wmYlrPnMq8UxG+Dte53ADHyw5Q
         9tB0LEYuEqRqq6mw02JRn4Ct32isZjind1CnKHaEIoD6/EH9umV5pqouhvnUhaK7vgRO
         xfjEM6CPv/DwIPV482VRiUCJE9pOUj0F+Xe4i8baQhbIbppuRBNu3tqt8LTxjTBOMHuT
         WH1DTOyj97KY7T6fwMlasPoTm95ota89dszGU7kAaETkDpWegYoqw9MgG/7DSh4MDQHJ
         YUOrY1m0EXO7MDzVwQuciK+JmCoMtHqQhmvlZ7LPdN2d/iqf+KY505lm1u9JdWeQlq7o
         iiXg==
X-Gm-Message-State: APuU4Z8jYqT8+GvngQr9+OiwRxVTihSGA+96CgIf7Kt4W15Hzc82dsti
	KTub+rgM/ZZ2PtH/BpTnEabN7pj1ZZpcszpOZBd74NaJ9+DoLWbVvKU7
X-Gm-Gg: AYBFou1xiKW1oNwsenZr7x112CnsRXnI/W53JZbUqqbu5KwESS3H+T7go8S6LLGhSZ3
	Xrgy5MKVSVPQf37JdY2exAntfqlutox8HInScCTnriCHk4kqlfyGrm1zOO3d+kTHejRKxsQZ4di
	ZOr0ocf86MMry0IngXOO8PmM7sercsGrUIS8EhTeGOGk5uztuNz0fM4n+5FEiFFnS7P8RwzI05D
	fcJLdqNcOVlPzRvquBCS8j7yjj0ZbMiilARxePwgiNJ4fKT/olBxXqyRYMD0VuWKPhlspYJ7Brv
	VZR2rY2oAtX7RleMQQ6T0DDtSZMGnN3+xTZ7vvY3ACyXEDo0f32AU3GEa4FhSm3wEp023i1Lf4C
	nt7msIkexnBAZTYlVx6Df2W5huYuH6wsiJruSvTXPklBIyzwwr6zwZPYteRENB5tIDFCRb+4I6l
	MwdbECphA4pxC19IICmUvHq+BMyQkcOH0TK2ET87mKz6J0D7PjjHJCv4ccsWgQu6njiqggNuMjC
	hhZ9I8nINrynVIpJI9zUI2Fm/UDOIYYuj2AOPPNOcQkUrB1Z+gYoIThi3+zx3vYUeN3WDuN0GN0
	gSPXXR9wag76ja2jBQYY5FRApLqydZ180tsSfOuaLoHotm5GE5pVPU1l2KE6Q7jGVHkw0SO+seF
	TWerPOHY=
X-Received: by 2002:a05:7301:190b:b0:369:faa2:1fb2 with SMTP id 5a478bee46e88-36f75441608mr3747167eec.8.1793978213641;
        Fri, 06 Nov 2026 07:16:53 -0800 (PST)
Received: from Sobhana.localdomain ([157.51.221.122])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9ed126csm7581500eec.18.2026.11.06.07.16.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 07:16:53 -0800 (PST)
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Fri, 06 Nov 2026 15:15:41 +0000
Subject: [PATCH v14 6/8] dt-bindings: firmware: qcom,scm: Document SM7250
 SCM
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-sm7250-v14-6-7d167e993f9c@gmail.com>
References: <20261106-sm7250-v14-0-7d167e993f9c@gmail.com>
In-Reply-To: <20261106-sm7250-v14-0-7d167e993f9c@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, 
 Sreeshankar K <sreeshankar0910@gmail.com>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
 Robert Marko <robimarko@gmail.com>, Guru Das Srinagesh <linux@gurudas.dev>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793978147; l=838;
 i=sreeshankar0910@gmail.com; s=20261029; h=from:subject:message-id;
 bh=rejlxjgmjiSGoOQieemcJFRPRnZEl4/NvRv6It0RMUo=;
 b=OJ/c3M3Wj0MaC02qVOKVTq5RLwsCER55eDtOI+BRvMbrJSwx6IJqxbkHqxxEctBHahiXCn3E/
 t4J9wrrf/FLD651S4+JcGBDdZwjERY/JULmn2DDTAIq5nBSrcU7QL5V
X-Developer-Key: i=sreeshankar0910@gmail.com; a=ed25519;
 pk=CGSHduvtn2hwLCNRXRc9s/fh6X8PH/zNdp08zC8hOuQ=

Document the SCM compatible for Qualcomm SM7250 SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index 40a267c54..ee02a9c20 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -76,6 +76,7 @@ properties:
           - qcom,scm-sm6350
           - qcom,scm-sm6375
           - qcom,scm-sm7150
+          - qcom,scm-sm7250
           - qcom,scm-sm8150
           - qcom,scm-sm8250
           - qcom,scm-sm8350

-- 
2.43.0

