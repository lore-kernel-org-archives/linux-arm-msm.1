Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795607653;
	b=yBYlXFVACZxDI77tOkKTL1TK9WAUzSInpxiK38iNfqPJm2IMd3FEb5bxAzU4EMLBNfjh
	 BXCzE27YJzJAWx4vajp3bVKtxM2HM26gjPluZUx4Byffy1K4o7gnmY0L+lw0dOrpB0BzF
	 9wBzJb4DsYBEz8HPiNEJ3pLdc4sm4JDN+gwxqMpvEkZQAMyo1mbSF3ElIjlrh4XPwdUgX
	 k27lbr2QZW6oGjX6hvRw2ehHUCKOtsMH+kgQfu9x4e9McDgdsFXGKCZx3EUrK5G6fob/m
	 hd3uLtZmmEon04XCTR/+Cxajp7UFSEA9CUE0xdI+2ihY5PrfXGid9vRfUL7i8B+0pww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795607653;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=AA+CTBIe0i1VFM66iKXDbZe0rv66Bxd6BrC2gPVTOMM=;
	b=xroCKIcUZ2DzQpuDrmmD3CjVLFZ3qRYbKBzzqtwc3UJJiPAijPN5OhbvFee8/U0L9wd8
	 9H/9eLiS0Y4SG8cldDFO0GJksYm1lzikWUFgYYM7CRINQorYzuF2FgCUfqoDDTJZDt7aH
	 TTV+OYhsf6xWiqV60ODu8fZxkb4kziUi3YES3Wv5yUqIVxdCBiJtqTKCB0gvaAWR2/NTF
	 tumRdoLhj8PxnLThIGEEgT7eZbzvElhVMy778Y8PTz58HTUM1zfznJWs0Fxbs1ZUT5d47
	 UAHaooeuqdrRNaRR71IFhDncLJLzlISmAi0fVY39icDspNDt5fdy/IhoXCaoTN0Lqlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=NBh8ovAt;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC49606A334
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 11:54:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BC49606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=NBh8ovAt
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb6adaf0f1so49624945e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 03:54:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795607651; x=1796212451; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AA+CTBIe0i1VFM66iKXDbZe0rv66Bxd6BrC2gPVTOMM=;
        b=NBh8ovAtlaeZCi0uX0ZwCSQj0L+54DbjuHuci6PUcaZoCr9MhLyDswTNJkvCr5goDo
         pvxwJmt0xo4YHkEq/FppG419UgoGEUaVUWrpWbgjPpNtdqXRfUIwLza7YAOPRpiuMK0O
         a9m9I2bIMaVUAQvnrBpcvW4Gj+0Ty6JlX/hjQJhqa+LWtVBBxSwL51gQ5KIWQl/e2Cl8
         AR70LRS/goffh6Z8yajrC5pNr4uYU31406nfsBhMf7aRLe2Ig1Q7jtlghYhMXuz6WRuQ
         NSZ0jVT54G4D3FgvhPjL5ZpWxDpnBXOU1enanMsYBD8evhEcyjNEq7j6kMLHaC/NWLbm
         qGuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795607651; x=1796212451;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AA+CTBIe0i1VFM66iKXDbZe0rv66Bxd6BrC2gPVTOMM=;
        b=t6qNRGi1qKjVA/OcY0T5rheDIWyyJYa+fCf+MUv1b+I4Fa7ccIF9OE+/AmgfjWPz11
         qSU/FTLxprlfE/sSSM7AYytSIcJb/M3cFmA747fRF/SbSjIu6vke+j303sjVNcPgd/Gi
         ZeolK330v3hZQLs6DY1hScb3hT4QdF9WYRnqaePjD3c1eJc5P5wjG9tMZPLN1SeClf4g
         0HQYWvAG78AdY0N73xPH31ZiXTlQUN+bzEtDTQirprwCQvOxnalYp0DUImX+FCH6YGbA
         +K09u9cIa7+NnLvqoqc6NgMQxcZlr2WO9n64pi45a9g+AzMWkvHPcVm22LK+0XHKn9j5
         N8dg==
X-Gm-Message-State: APuU4Z+1yfwvV0YLxM3dEJZ3rtLWJ4sZS6FyMUExh3f2mG1mWhzs3z9B
	Rkl94yt5aEEPotVLKZv9ex8eeUVs3JA70VezlMbPkRLN2o+B+KfVZtBIkAIIampvqQf4ZfYjy32
	JwYyZRt6Cgw==
X-Gm-Gg: AZFdTZfFQUaXYDp8V/0eGX6biytLJsVlSq7pyNe/1RXhZxocnRe1fVs4Go7EfTy3MPQ
	ivRh43AV69J/vAiw0r12V6VqiN6It1Q4JE6kUbbXyN3YVbe8So8h5ixKX5boVWUBU1cC9FeZZP0
	b3roYtaYwTkx6yRU0Oa+yN9npnYsSuPBkkm/rTJ8JmtyV/6QufHLUskfxyoKWmnHIYcSC712vEf
	poj1NEemCtZIJqWDvLgqO4P8LcaSSFJEzPEr1pn01m6r8Azj0Iiqax9cfPebaFusNvrTnNI9R1r
	XFlcMWe9oq8Dy1nlLFcuFMZdCzG/xo5U3OYy4t2+RT9TxzptnKf6ZqMH52OiasZWWE1Ahvs1Mht
	2mRrTSYkGTwxfWs7Rvx37RBK0GBcZm8VZnvbVgSI577QZSarljijnUQdGYqDz490A4h9SwAmssR
	27EHAsdNAZM+sLUxZulm92c/lDGmTjuIisa8vAwc0176HFlJcnS4U1Meum1FqUD6qOqkv7+iaX8
	z94PnueZjA6QSUxbHnAU4fA2jsql8oFcwDR8SLneb9NMydn6+hRmRKl5MXPD0vfkw6v9sU8ot0R
	Q0Ach9b3UHEXZOmbNYCOovhCr3UbfAbVVXIOajD4hY6xsecvhA==
X-Received: by 2002:a05:600c:1d0a:b0:4a2:59:f568 with SMTP id 5b1f17b1804b1-4bb8880ef6amr382305285e9.14.1795607650791;
        Wed, 25 Nov 2026 03:54:10 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88f643adsm234073615e9.1.2026.11.25.03.54.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:54:10 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 25 Nov 2026 12:54:07 +0100
Subject: [PATCH 2/3] arm64: dts: qcom: sm8650-valve-deckard: set BOB2 as
 always-on
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
Message-Id: <20261125-topic-sm8650-deckard-tcpm-v1-2-4af33e89ea9e@linaro.org>
References: <20261125-topic-sm8650-deckard-tcpm-v1-0-4af33e89ea9e@linaro.org>
In-Reply-To: <20261125-topic-sm8650-deckard-tcpm-v1-0-4af33e89ea9e@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=877;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=FPVkmrAWHJoCO846ejNKhvk2pv0JLVFiozgtm5MAmUQ=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBrBsxfSKo/4v64Oxh5LAQOQwSP1TNftDoK6Vetaxgy
 u5/6w2mJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCawbMXwAKCRB33NvayMhJ0ThfD/
 47sDEULk3AKuE4oRk8RvE4kioKOChwyDlCbs7g8dslDT40wkk1WHTPwNshrpT2t6WHR8qwiZKQi3ZK
 VwXmqzq9IjJ04eKuiW1dT9BJImZEwrmI0bXD7VoaPL16wOfeRz6+woydp7pg6wRXsSilW6+VPaaBo0
 +9MSFnsvPE2SMdaU8IFvOKU4/HU7NpmkXRpYrTxs5mEXVcyqw9WUvApzfpsCFTOC87SPwJo51UojLH
 5tKjoyJMJDHN46bsxgf5cmrthsJ3As+U246zBbTBEWI3PI7cHD7uMpkcseA2vNPc3hn2O+GCLAF/ut
 ojp5PLNdDJu6NvE9OC7CtyaGVd8ZTq9W/ckiW0Cqf7zlIZEIKokSs2qIXIkLN/Wf42ux46jFfWPlxn
 egCNFUcRmJT255DTCRGYK3s+Fd5Q9cFKKH5rfcqYEwZy07YiSJl9dF7B+ZO7zs8c81e+hUfkEvZH0s
 55uLMT3p7TKETI2+X9YKqiV/Cz/Ph/N1H9eY6OxGsGwof394aYBaATVrWhVDJ44hgL8RPqcaREpIQ8
 +Q8mKW4qF6BOVtRIxspQgp5NYxOHUzdCNJsCQVrroAeRFPQCY8bx0S+YycH3yl6SfCj6UML0TpYYIY
 Z0zQyDVZ7n8zxPiCvOlxmW4qi75yvtlXT6GfB6vDl5lDTA/92h0vILhlf9GQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The BOB2 regulator powers some always-on USB components, keep
it always-on and expect it to be enabled on boot.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts b/arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts
index 6e7a8606d179..74bc0728ae7d 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts
@@ -333,6 +333,10 @@ vreg_bob2: bob2 {
 			regulator-min-microvolt = <2720000>;
 			regulator-max-microvolt = <3008000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+
+			/* Drives passive USB protection MUX */
+			regulator-always-on;
+			regulator-boot-on;
 		};
 
 		vreg_l1b_1p8: ldo1 {

-- 
2.34.1

