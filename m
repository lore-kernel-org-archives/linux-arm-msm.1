Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794018331;
	b=hr+b/i6QtQJbjfVI2UX86yXEMHKGdSmoV4Db9I52nm+HsMRglOtz4n/66EmCQdYnIKCi
	 SWg/SoY0SSZV33305587vM3wCu7ShZBnUT4QsGxWnq4RaFuVrXpt6ELOQvwfIIkl6PoZH
	 8jWTAW42CVYVqK5jL0T/ut/5HtkPOOJPCm6PGyD/mxK/dgxWXLcSzO9UJ1UdN86XRWTBM
	 UXeHQIDiUpy/GMv7NzRiokJhha3MMYENPUD2cMdeX9INRn2N0TU7Vq/c3nYm9Mda5dYfv
	 KYRvZy5it19hXi7Vzt6f/Bly+LCT3XhmpqGhqvQC9QfyBMWq+eaIoFO7uG5plFuBg+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794018331;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=PRtH9+Dr1O28KhdhtyeoAvx+v54Z/fQlp9sOxD2ElWE=;
	b=A2I1STg1V+/cczaVtOyQNZklno1FiUxBb11Pt3iOQLqNspLg0ABpWrFrH6yVqkp0h6F2
	 UzGA6rWLUqlkNEV1slQBnaaDhqTdF3rKrZaSxlwDjJNQcc2MUgQPGhpa1AreUQkXn6QFX
	 PRMc65edrHwMzOoze1RzSw+TosX75GCvNFLT7bKlb60V1Rwevw73eP5K2HFigXQiN+AKa
	 gAl9d/PIVATacxavG/8d7ewkldb6BnViGS1TH2X9l6eMpc4XqswpVvGNSE6twxva3i3oG
	 Wpk3uQJ7o3qcT5kxoxH7jzut6UgONPSsf2Gn+BzOnMq5SX2KE+s+a/7eGWDoqE97rMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Oc4WZjrX;
	arc=none smtp.remote-ip=209.85.222.41
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E83C606A32D
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Nov 2026 02:25:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E83C606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Oc4WZjrX
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-998749fe872so707008241.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 18:25:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794018330; x=1794623130; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PRtH9+Dr1O28KhdhtyeoAvx+v54Z/fQlp9sOxD2ElWE=;
        b=Oc4WZjrXevsZ4OTMfIbbyREOaA5y75WYe0/yqmZCTkQey/yR7vtBVeaPl8GxR1UyIi
         iJpHqhmI5aEStHLhYKg1qdE+XYRcR9gCBlx8ZK12Q21r/xhqMwNPUkHVas8ykMJXgA4p
         T88e7YXb1lKhV35J7diCLhvOic5PzFVmXBeB2jwie02oSr429h7R6Uq6nZTG6kcYUTRY
         zjSl/cq41vFYP+VNnZrzgdaF4neWIOFOJAV2PlEtp4wIfvhw7snMOAk55z6PIcwa2siO
         QI9aRrgg4svcH/B5udGBftoTLj6s9lAJeh5CHpXdmxWQqtnk91M9VMpWN6I6PoSd82Rr
         R4WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794018330; x=1794623130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PRtH9+Dr1O28KhdhtyeoAvx+v54Z/fQlp9sOxD2ElWE=;
        b=SrfejaaImMorzdtp4U7sAqWggqTPvZb91yTDU1J2/yLKn5ZaiuBu8S/OYtsOxRnT3a
         p4dpcV1v8VwR+izRZYRcU2Jj9QF51MFjC2+hdfX57BGokk9gNJuaYpbuY30XxTTfcu2z
         s/ri7akIY77dT+F3MWf7ritCJG7B/XIqyP1w962XiFh2SB+G0HdGqaCX0uHQiTlXOgMC
         wzdeuQy0j++tRmDgRxI5W8MhDUspVAGDH9vY6bZaagzFeJlEfl2pLBU1adjyK2xjcsOW
         31GFK/UBV2MdLd2rWBHDV/IgEvHH3TnnHk40KJ9uI3cvDzBRpgtwMQJi8M0nDfPctGQL
         PImw==
X-Forwarded-Encrypted: i=1; AL+hErFZv1G5E6m3Yp4CuUuQ8z48+155ObXYeFFrLR7DQa1AHxZoPaXmO4soAekXxB/qmIC8TgSlNmXOkgWOy8Pc@vger.kernel.org
X-Gm-Message-State: APuU4Z/6K8MpIRXQc9v+mXSE8zJgNUG5ySjWcoj5L6gZvjsW7fozCEwh
	kBVMtw+zNLx9h3H+7aWPj7V7DCMo8R37Dm67q53uy1oD2e4LgVLxainQ
X-Gm-Gg: AYBFou2mHbMhETaAQl8MIlCJbr0HAKc4t77xKJbgOHcI4PjX15lJDYZ8wyljZCEhewx
	xmxl/ASA9jJZPBZn6vAy9tuLnh+XKNgtiDH7/Makxi8Z7pOyHa7DZ8s7cwoh3KNMs+shXwGYEsg
	QUo1byFWRPrYTkwKDfCnOExhN4qftZ1kNISJ8gFAdWug3ipvuvdMmFCZ0a4ZiYF4Yq05VAngKdo
	ayzKlFFq5toq9acggQqY1RnBWhhEc92cZzfLMNn7WDc9k16PRJMDmkYjNPIelbRGP0PkVM6XavR
	WACsD+zorc3ERjFgMNSn33ANXjRXLuq6kJyslY2CmLn9CqB9bbg9KCGLc/R7i/vFuISU10EipYX
	QGMR0aeTjZ93U34x6XGdJGtILp0laD7/xmKuIUUe0zaERgRgMDr8iRGaZlQwzY6oMGJvnd67iJ+
	LS8/KqPSI4mLDIPhyedcmG+w2jlyEWysFT+26rVN056u9uwLwbORjW0Xkt0Vw5NceLp/U/98fVy
	0u1fc9RuAp7NroUsB2HBUEun2VwCcGD4M48DtYpXazg1XyxO9zhDdhl2WmvA0+QbYvIVoDBmMaR
	Q4FPxVe0gxYjg0+iQgqU8LGUYOIQ
X-Received: by 2002:a05:6102:e0a:b0:7cb:bc5e:7d9f with SMTP id ada2fe7eead31-7d2a153ee73mr2430046137.11.1794018330516;
        Fri, 06 Nov 2026 18:25:30 -0800 (PST)
Received: from localhost ([174.93.36.89])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d2a89412besm2642472137.3.2026.11.06.18.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 18:25:29 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Andy Gross <agross@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v3 2/9] dt-bindings: soc: qcom: aoss: Add compatible for SDM670
Date: Fri,  6 Nov 2026 21:24:46 -0500
Message-ID: <20261107022453.159341-3-mailingradian@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261107022453.159341-1-mailingradian@gmail.com>
References: <20261107022453.159341-1-mailingradian@gmail.com>
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

Document the compatible for SDM670.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
index e94c4fd34177..6a817a1cd395 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
@@ -43,6 +43,7 @@ properties:
           - qcom,sc8180x-aoss-qmp
           - qcom,sc8280xp-aoss-qmp
           - qcom,sdx75-aoss-qmp
+          - qcom,sdm670-aoss-qmp
           - qcom,sdm845-aoss-qmp
           - qcom,sm6350-aoss-qmp
           - qcom,sm7150-aoss-qmp
-- 
2.56.0

