Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793257431;
	b=zONlwQlpwm4kMNjXS6NDJivOE+FfqYNzKvsWtaDdqMk7SL+IxHo2tfJXcRBYJQ5huWga
	 X09kqQStcIHw2mTWOTtT5j4x7PXb06WnLyhi0xgGbgh8YSCVYkrBjdaP9ZOSQuUb0HIhr
	 3rzCFOHSKsh3vh3ax0j0bB9Le3JnELGWiu1fSPi0eS/kp10pEO4nF5X/QYp4ACODfUw4R
	 MkdkjvtNhTcogpiGCNW2rCemm34hN6Q+hYjW43k+05FiWTbCIJ6NmgK+2ToNCA+3Cv0NR
	 XK4TEGKFiZgGKsfoxKmfvqYhlO27QwuiGRMX+yDxCUNjRHwzdUwl+Lh3qLMFjKppI7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793257431;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=U4fFdtJNvcZ6y6D1x1v24LO+4CMQIoUBaMtD1ZPuCLk=;
	b=mZWAr2+rDMMrTVdntSmmQhsx7Dr5+3uwyUMNHCKMsq9Ni/VRgK8wfZ0Oxnu4pdJqMAF+
	 4gDyB6+FjXRHapdNi2eFjX0JwfqcdMQK4avl77niDLdN+LgmUFw5/epk6Y2yQ8h1HyJ+M
	 TWhUaqjhHnoHalkQloKkfFXwvoYa3pzfIZvcujoKmX89R4I2Ly9PJzkS9tLK0Bw2d/lba
	 iXN2gfDZmd8PJvpTJc7RfJRXzsmJOErFZvbk0typXHt+4yi4gZ7dRupZ3WqODs5E+ZDGl
	 vZZE5eqJ96uzAjFbYarY61Sl/10syrOoZbZ6sYa2NCKZ9L1pxadRUNX0NUO9UYynLAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F+pudE1W;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED136606A327
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 07:03:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED136606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F+pudE1W
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3514b90bb89so3356370eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 00:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793257430; x=1793862230; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U4fFdtJNvcZ6y6D1x1v24LO+4CMQIoUBaMtD1ZPuCLk=;
        b=F+pudE1Wz7CqOqPaimvu4Pl/+YNsvoQM/t+U/mEYukGErBeyHWCN272+UtDoWNvHMC
         vAbOVjw5jNDZKqVWvZIigAyIF/4ESJZJg24DbMqgqsPrjUo1VXoyaa84Qnoc6dpgsKow
         JnXYjABw0qcn7QpUtnBpbMfNOIp8jsS/bzIG1KqgA32WsNOOhrTRm0M8ilMrd+WFoIIj
         2Hu6CwA/ZyDT2GE4BajHITQmDKwrg38kvYBXwKRGjaijJByJT/VazKfta/CnxRw+8FlJ
         ut22x4oOCDQDYQeIdnZqr9s59cDhITvsT3mB0kPl54Nkafg1zi2Q1XTY7Hd5k28YU8XO
         lt4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793257430; x=1793862230;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U4fFdtJNvcZ6y6D1x1v24LO+4CMQIoUBaMtD1ZPuCLk=;
        b=syoL56Z9o0qUhehmfAXEptUeLTPcAizbkk7NulqXR5NOHvjB4ZAwp9tK4I57/joyYy
         KqZ5p0oaZqVkDIiGOgw68UetbzgWpm+XkS+3Zi0eeK0H68l2l+s9emwChh9k4isX4kGR
         WtCZcOBu1HYG34sO8Pxw90TRLuILq+8+1aAIUVeZJeI06igPETh5Bf707CKKmcicTbt/
         E0Of0FT+zAZjDLsCCs4kJiHEwwYf9OBHb/OSgAFaG+12qpPtN/nr+MaufiID8sRV4veO
         kuBWaG7b4AtJEMr1xVrbLC0hM6yrUX1FqjcrwDQegxTInegS+m1qNeju9rha4FJmsIxs
         TuGw==
X-Gm-Message-State: AFq9FYLBBxhrGVzbmN9/uglewFL1eKHlFAILW4Emv+EK9mqdPZ9braqe
	JmMD7AhqzSGgK2zqcJtTKN3Dg7HukBuLVSy2BuaO3h3Mw617JUkkOEKx
X-Gm-Gg: AYBFou2VquiLzy/qMXcxWITgKlTZk+EgXWvR6hOSfjClFpZEsq1R5PtgY15u6w4y9SF
	XnOdL0znMPBtze14ua6qS/N63FwsV03WOow6UvES5e3k1EKqeBIY7vV1Un8Pz7kEl8iS1iWobLd
	1UG7k5s7YoHQFe0pPJe9HhdosoGnM+3H1vgmihyK6X1lF1kyUa/wdwJI3rFaOTOHyXoJCkbBky7
	rRfVMpnX8hyJiR67b7rzje8uHosqEldJfymFOz7ztvLLFXuGqWGYZ2p014USep16+foHZXp3ziP
	Tgu42xtU8D99DF0ZG5NMQgOqS175TjsZ4eokhWZstJb6mQ3b+U6H4dKEhggYxsBl1GS0sfFm28m
	504wU+nTzEvYEZNMoXCOS3fm6ymybLcda8YYl+ev6Xz3Iy0aVtoYQokCaCJ0jZSlid/li+t0SJG
	xaQoCZBmwyCFGfj9C0aAoyLpaw3ASWBq3OQfI+3MjbSK5IV35uC5M0JxX6L4XREG5Y0i1V9uKzl
	IUWeXifi1lgqemSArgL6Z9DZj/jtwh1HXSCdgOoW6uwAJSHwlKS6vTcrhsh9xyxWLdlUkQ57bL1
	0nz8+yndjlcDWXp+atj83XX7kejaCi+sXSbMB+TgsgWKHDYrFgFkU33cg7JIQDVueiNMYXt6nSK
	2byeU92aoqVN+gSeFN0sl5z3CONEY
X-Received: by 2002:a05:7300:e11a:b0:353:7d17:9a86 with SMTP id 5a478bee46e88-36a200bea2cmr7029875eec.26.1793257429997;
        Thu, 29 Oct 2026 00:03:49 -0700 (PDT)
Received: from Sobhana.localdomain ([152.58.200.233])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a2398fa4csm16955443eec.24.2026.10.29.00.03.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 00:03:49 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Thu, 29 Oct 2026 07:03:00 +0000
Subject: [PATCH RESEND v11 3/5] dt-bindings: firmware: qcom,scm: Document
 SM7250 SCM
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
Message-Id: <20261029-master-v11-3-2c29e382162c@gmail.com>
References: <20261029-master-v11-0-2c29e382162c@gmail.com>
In-Reply-To: <20261029-master-v11-0-2c29e382162c@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Danila Tikhonov <danila@mainlining.org>, 
 David Wronek <davidwronek@gmail.com>, Abel Vesa <abelvesa@kernel.org>, 
 Robert Marko <robimarko@gmail.com>, Guru Das Srinagesh <linux@gurudas.dev>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, Sreeshankar K <sreeshankar0910@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793257394; l=838;
 i=sreeshankar0910@gmail.com; s=20261029; h=from:subject:message-id;
 bh=n/5l0LzNHQkrbMmziTZYOIF2FEcc8PMKPnj4oscjta0=;
 b=gjdaSkAxoqehvftK1W3o4GIVUIA72A6eMiGKTKK8PKFf4JbbGxuhscbbg/ywU6MqKNl0mpR9g
 xohlD0CPLyOAVuyH5IEDoVDWsgs3nVO3qP+to1jabBDFYp6pcoRN6tB
X-Developer-Key: i=sreeshankar0910@gmail.com; a=ed25519;
 pk=CGSHduvtn2hwLCNRXRc9s/fh6X8PH/zNdp08zC8hOuQ=

Document the SCM compatible for Qualcomm SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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

