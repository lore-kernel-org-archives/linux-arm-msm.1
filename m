Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.117
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793775942;
	b=1Su35URL05SZcXR7qyRxsZGC8dwXcseuvErocDGw7JrT0JtqBiQPV/x39OQXqUpdlO/R
	 i7EYzUHj65F3poGWDTqNuN8j1OEUVFk4SiP8uEGxn/LOBHIqs1ZDswtflvAO+PZmYemLh
	 YDXLgHMhlvL+FeRuk1jH4wgV41iGbIc8gDLmn26uCQpowX5mFwizgtGUMSOu2EBp95+60
	 9nECjVIpJ1YTWLToWC764QPkSYcPQaMEL/JbG9bVzhZpMZxjyxGqBXYBK9t5HwP+y2Pnw
	 Bwn4aK0HS8A/w+9bmTCB+QqmfkPMOH7DLp841iGo0Of4ajvmJNWWd7fvocPsrgD2tvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793775942;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=TSHjcxig4GCJ+eyUpX3mG1pllJqSeO5g9EMqXYGm8kg=;
	b=k2PWi5pFlWw9CZPzS2EQbjouZqB3xaumyXKG3l7Jx3VGbCfmMvT3ZzRHRau0RitjHGU/
	 EocG7B4UK82HwNs/ak2t1NSZpuHBByVENUwr30st8lqTBRYuhn58JZ4cjwOymV7Lod6AK
	 z72MRbPzAYv+lHxM3AZvg3zXrYVNnXFIU7Ljr+/3B9WTMflnFXSvLJbEgU78aHufG7wyG
	 r/QeyyNEW1DwSnyUXmkqD6q+e8X2c1UEGHsa3qgwisYTv7fKXYHAHYQDvU6AfFfI/FPO3
	 p7Qes874N9BtPwbei6naPcrytmgffZsSi814gfM3dkJrarM0TRoRjJXfq+j37GAG/aA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=packett.cool;
	spf=pass smtp.mailfrom=packett.cool;
	dkim=pass header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=RKF+Nqtd;
	arc=none smtp.remote-ip=91.218.175.117
Received: from mta0.migadu.com (out-117.mta0.migadu.com [91.218.175.117])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556CF606A328
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2026 07:05:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 556CF606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=RKF+Nqtd
X-Envelope-To: linux-arm-msm@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=IgT4JYBbhdbw6rEV18MXTfEHZdeSfvl8xMkh2kFPu5Y=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793775939; v=1; x=1794380739;
 b=RKF+Nqtd996VmRSJydke/grq8zlI2r3pydttmfRHHtJ+oTAmYISKd/OZAiJN5ohFt98VJa54
 LYMoXwgkTrLh721dFzPkLsPWxzaqvdvddR4jJVZWoNIa7ryGCJ2ruFoftEvYYrbdp9FVXY0YJSK
 vEBdfLAZUn2JNzZ5WwBwkoLoy93K45w0OCOa/dB0eocYwGVZIJxHqNyXysqSydlF2NNn2tn0v+9
 LQJ+UDjh16STdMnLWcGVut+7qh4n7K48tRPP0Zw75HmaA+9h+3Ze/hsYBZsskLtJKBjP00Ok/IC
 InHfVBPqHfJtBLjrBQ1InKQEaSFSedoe1A93kB1tJ1rPA==
X-Envelope-To: linux-arm-msm@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id e9035ecd79925aa1;
	Wed, 04 Nov 2026 07:05:24 +0000
X-Mizu-Trace-ID: e9035ecd79925aa1
X-Migadu-Flow: FLOW_OUT
From: Val Packett <val@packett.cool>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Val Packett <val@packett.cool>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org
Subject: [PATCH 1/5] dt-bindings: arm: qcom: Document Microsoft Surface Pro X
Date: Wed,  4 Nov 2026 04:04:32 -0300
Message-ID: <20261104070441.74127-2-val@packett.cool>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104070441.74127-1-val@packett.cool>
References: <20261104070441.74127-1-val@packett.cool>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Surface Pro X tablet was listed as a single generic compatible in
dt-bindings, but a device tree using it has not landed upstream.

Replace it with three model-specific compatibles:
* microsoft,cambria for the orginal SQ1 model (with cellular)
* microsoft,carina for the Wi-Fi-only (SQ1) model
* microsoft,carina for the SQ2 refresh

Signed-off-by: Val Packett <val@packett.cool>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557ce1e..74f46697a363 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -925,7 +925,9 @@ properties:
       - items:
           - enum:
               - lenovo,flex-5g
-              - microsoft,surface-prox
+              - microsoft,cambria
+              - microsoft,carina
+              - microsoft,caspar
               - qcom,sc8180x-primus
           - const: qcom,sc8180x
 
-- 
2.56.0

