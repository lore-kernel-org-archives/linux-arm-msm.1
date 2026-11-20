Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795169464;
	b=UudGh+uIASTICNcMiqGjxx/D71u7/5jWt4oljVJl7li7KZzsGhFzKa3Ot9QFK7P7puMJ
	 4zvyBmbWarEWSi9O17bSa937ZraKcdhuJwiJganJ/+/u/PANykDwb3Ggb2GWjdBbH+YA1
	 RaD2W8pgKjik/y5eGxEQs8FHO8LgATvCEYzwWbGYB9Mc13RQZxb+KZajPLOnza/ElXYfZ
	 9Ee9w7RXrAWp7o6TucLjj6Z/W7l5XzzakZW5d7SKGXnOYHK0u+86kqgz/Jnv+Ul3rlE+9
	 VMk7x7JXnbBKLctlL/e2khR6bLBZhMtrj42/eHVWodsNWfRbBJMnYgbzhLO5OjjHi+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795169464;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=77Y6wCFIm5JVasGrpviwvOl6CLOgdvUjRnndLUz4fyY=;
	b=MyE6Z/iksuqauX2UDXpqySWa4A4sp5EA64qk964qa8QfNckMHAy688VADmTg83iDrt3w
	 PGmiicPBaoT312xcaGAJdAIGzp5bVoXzlWoU7tCmBZPvn7DGnglZiODklZIXt3QfGiSpb
	 p4fToQy8qY+amUVB0ZJH9K4zdYaAr3UHD0rWr0aWeWQVGGJj0r2Q9sW+q86D12B2qVYmh
	 h1BPUieJE6SGeQL06BJXKMOUhNRT37lqAX5lqazWk8SjGSbt+xTyoPrefAMZ5ssK0G1TM
	 SjL29UEZu63mNsEtf8avrvAwKNU9T2USe5M5ky3L5ksjfRrKm2caws4QC/BClcYZM7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=CO6t4NhI;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80386606A33A
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 10:11:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80386606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=CO6t4NhI
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-498f5fa5103so380911f8f.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 02:11:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795169462; x=1795774262; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=77Y6wCFIm5JVasGrpviwvOl6CLOgdvUjRnndLUz4fyY=;
        b=CO6t4NhI9pSu5IH5Odt57PBc2QqyJ2pJZfxyy0Dj6ZIGBONvEhsawyagR5JNL5Qv+Z
         pgTTvgn86mDaS2krR17lObi867gRkhZp3+JxZg8G/gUtDZzh9CgYFLpIyYAQiqhhGm3A
         tX1arzX7dAiy54GoZqE5abgP3lx/ISXC2wV1Y/7+tLmeashF+q6FjfXSr7G/QSr+fDGc
         DE7IQCOigASfAP1rnek2LXJesyU4YuWSBvSWyiLEb8f8L4jywW8NYjdkxgSOrXjTZe1m
         DYVkAQvKVix36mZ93xaJNmKrq1hmIN2HDqwd+rX4Ms7CoH5EJnTpe5R2JWwVZxVBI18v
         tO1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795169462; x=1795774262;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=77Y6wCFIm5JVasGrpviwvOl6CLOgdvUjRnndLUz4fyY=;
        b=QMQ2ljYPuPEjATv0ARPehAkcJ/ALLdczSym1Tvap/wljimE9lRhkhBCi4kQtJSl3Wq
         z0Hgq1GBTD2N5eizU3EIg4GxOhF64eq5l6O4ixwuOgIbfJne2sUntA9V7nYmoes00dAH
         Vjsd/3zKnryb1xHsXNLXoT+10f0zRi47TUaQc31VADg+rRPiavTavrWPBmJL/HpvU9Sk
         4hGz+u9kUtqhXrCdN9lTXDkJmB2K2YfvsxD0Mx+eCv4CZnHReGiFBBexb1fM6n1vdI3h
         5E3sr7ZdfBDHxtvMfy5ONaSpk6yzM1NWKBMurt8oWoKNr2eWibP3GCW89beWvjU4gQSO
         e34Q==
X-Gm-Message-State: APuU4Z+IURdJMYNNFEEY1LSNPwyhIviVS/vREVOEu9Dtk+pq2r8WBTgF
	pgZ9hDRsB3uV8lVr+joBpzV2pHnba1wrYkFVMnT8gjFBV74nx2n06yY+K/gvQSo3ab2FSN71nxy
	oxnCB3sA=
X-Gm-Gg: AZFdTZcfBGex5Vu5r5gf3xqxiOkpmo6AGW2bR71DL38pdGou0/e4d0R4wOqaJWPy3bx
	1ErDxjktEh9IrE25494O84FpJ/1vI/ciqF7MNH9JOvlOQNHSwjK26SJ1FjDb3eXLAuHgyjYNYax
	eeutD7ppPLJE3GFtoZ/fp7K/Vr0gHha9se0sj3CH6Qi3uOoGJWSpHxdpLPJaKgacu5Ik+qUYMfo
	xl3CympOl2LYt3aC9jBtCFTPEnCSw0SR2jxtaJpQkaxUTX4/CzQq+k+IHw80ivx0Iz0OUiWEuBC
	E0Y9nQmlvfoPqvVMMD6HUq59suzyr+18A5oDkBdkxEVvYsP4nVQaxfgwOWmvZ2smvaWivMcMEgT
	Acb17NRXls+fm1M39K+pfBQNZAHx70QybrwzCEDdjgMUkbwnZk5MGgmPfFMtlTTIadxfC+JLbjN
	SwDg7fQjsEHZfxMQO2E3af4ew8Gv0t511fG0ryRTiXMDT8ehC+/QRnDoWEK4VuIEU+8UNzrHA0G
	FjzjeF8DY0Quxyug8rlvCy+tz/8hLLZ9GFtrtw8OOy+adT2AE8jD05y7tbK4lU7gEGcxPD1rGVm
	puS3gVzgGtzWPJR3TjPe+T6Fs14i7v2t5m34nEMei7bvGgiiqs1CgPRCCEkc0lpgHaHdBUfX
X-Received: by 2002:a5d:5f91:0:b0:48d:f9dd:e3df with SMTP id ffacd0b85a97d-4abb386134bmr4515258f8f.18.1795169461730;
        Fri, 20 Nov 2026 02:11:01 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bc8ce06sm4674937f8f.47.2026.11.20.02.11.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:11:01 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 20 Nov 2026 11:10:58 +0100
Subject: [PATCH 1/2] dt-bindings: regulator: qcom,usb-vbus-regulator:
 document PM8550B
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
Message-Id: <20261120-topic-sm8x50-pm8550b-usb-vbus-v1-1-bbda7b708359@linaro.org>
References: <20261120-topic-sm8x50-pm8550b-usb-vbus-v1-0-bbda7b708359@linaro.org>
In-Reply-To: <20261120-topic-sm8x50-pm8550b-usb-vbus-v1-0-bbda7b708359@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1741;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=JIuEA4RHNSlujYvUz526d4e/oGx5qwBBNKR0d1bBZZw=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBrAByz3IOuTymsiScexI9P+xMpgJE6ntEMJA78rVsc
 5lWWP5+JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCawAcswAKCRB33NvayMhJ0UgND/
 41kAAhaX1hlyfG9/eeduUUh3qb4A8SWhkNQrEwNjo7V8grfF+VuGOIorZnwq1ddz/J4+boVt05xxdp
 UZL76HBgjqyZxvFYC63l2bK/LLrryrqoi53uKqSWNm4H8VK7s7sgj9pcG76iLHjUGaRT6G7f+DOsT4
 7LLvU3jCqmIp8smJ+qLmczo6zLj/aV/IKoZFgt6OF+hsrTe9mf0nZM1ah//Nlf5hSFbpG4d3Ilfy9H
 qyqRsWBItd7jux5Vm1agFrHE+kHl8Nixtlw6WHl7BbziWNMo1pxHXEaiVBA9heCr9yyyrmKNuIbFv6
 QqcMzKTqmnXQujCRkRh8Mo5RlYcfURdviuliA9Gkphc5YnXkb/S7MXoakHN7DVGyb/Lv7sSX4/EWkg
 /pKQeko0H2rndrTGdW3emGC/B6AW7cuW4eTQy7SfhW2fBqOPFN88vE8+hEQvb/J5ICVD1iwoVog/f9
 H3p2iZSxE8HUBNuL+6hxDQkJpxxbcYb9RtR+GTBxkllyC1/GpPYLssmTMAGo1JhdXj1aeT4wyzUD6b
 +gLjiFxOaAFGHHSes9jbW5fS9ZKfRv5G2OtuccIBBXeCrdQuGMBQ+zZFfp1YuaIb6Y/W3l14SlQnKK
 K6komWr1dAD2Bp5f6lfJH1slpE6Kb+me1cCEdz+rpUv2dneO561hTK6M76ww==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Document the PM8550B compatible, without fallback since the layout is not
compatible with PM8150B, with an OTG selector covering from 1 A to 3.5 A.

Assisted-by: LLM
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml      | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml
index 024b34d0eb1a..d3c706182873 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml
@@ -17,6 +17,10 @@ description: |
   The pm8150b variant uses an OTG current-limit selector, supporting limits
   of 500 mA, 1000 mA, 1500 mA, 2000 mA, 2500 mA and 3000 mA.
 
+  The pm8550b variant uses a different register layout with an OTG
+  current-limit selector supporting limits of 1000 mA, 1250 mA, 1500 mA,
+  1750 mA, 2000 mA, 2500 mA, 3000 mA and 3500 mA.
+
   The pm4125 variant uses a different register layout with a 2-bit VBOOST
   voltage selector supporting output voltages of 4.25 V, 4.5 V, 4.75 V
   and 5.0 V.
@@ -26,6 +30,7 @@ properties:
     oneOf:
       - enum:
           - qcom,pm8150b-vbus-reg
+          - qcom,pm8550b-vbus-reg
           - qcom,pm4125-vbus-reg
       - items:
           - enum:
@@ -46,6 +51,7 @@ allOf:
           contains:
             enum:
               - qcom,pm8150b-vbus-reg
+              - qcom,pm8550b-vbus-reg
               - qcom,pm6150-vbus-reg
               - qcom,pm7250b-vbus-reg
               - qcom,pmi632-vbus-reg

-- 
2.34.1

