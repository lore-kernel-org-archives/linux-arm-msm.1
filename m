Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F7353B359
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 11:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790076524; cv=none; b=EqvOZS3H6B5F6ER8fEBdRLQMn5qzIoc03TI4LFXX+TKEx5dtUzkVLYv+0rnTu6SWCrenNm0E3uTSIgN8jrpz+eaoVGP/rlqyOZOcDQREk7lgri0En6fOaWVLKryZWHXR9S3WBZB9GiSAjqnUx0xJ2/VKBF2qb7Wv94xvmBgIP6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790076524; c=relaxed/simple;
	bh=DRDBx8uJu/gmNOt8neF/NrrQZ8Y1qYuByeAf3Z74Z9c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pBxqQDj09MSvYPur814KaewUo1Pawtxza8nyKBAk4PBa5TIBMUHv8yUkdeT/XYtVWCyYnHsF9mR0mgdeo6Jy3Wf2j9/w6NXPDeu0E9n2aLzBtoN3biODgOR0VvJALcZp9Y3/WWLZnnDIzLS7rlU0m8cjY/Q+YnQ7dbEmWjhaBiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rbU6YrFG; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rbU6YrFG"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccead2aecso19640345e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 04:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790076519; x=1790681319; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CZcSVYTseMvcfqltwTfiGnUkc5ciw/nLJHbubGeUkOo=;
        b=rbU6YrFGbcjNEkfvefVv1fNf2f+5oRulBJQeyLfjyYn/IP/MoyEPatuwdGg8mfJgWO
         QoW0creJTfScZfE5h2WIETa5yMjxHFaicQ2S6Fdo3sc6atTLJqtLxZerl/3DzherM6Zl
         +OW4HbWQuWQPPS897xntWgGGg+sbh7DrYSmlEC2UKGzb57eLFBt84lvhYIzlxIKxFV9k
         MqQKxpCZg+ttyOO87H4hkk6K+Ti/kTzm1EVOdbGQu/XIqUeyHEJtIeyzAI1HAvW7QOJi
         x+wC9EatA3rII2FiEMZ45c+kw2BoaNuwFJ+L+F+7l7VCkHmUQpvU5tDGUZAC4tYEvWz8
         CHiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790076519; x=1790681319;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CZcSVYTseMvcfqltwTfiGnUkc5ciw/nLJHbubGeUkOo=;
        b=CJredOiZjO9njFss69eTf34gcq1Snw/Lql539dYnmAYUb7ArmeiixwLMHLfNHKYtVl
         I8SasMPFR9umyKRLkuIQvRRiAyc2yNqcjU6s36ywyLkSw4+XD5YYDFRPxN43KX9L8kLX
         jWawE2f4c0pz5WEuIZ8AlEIffTYKX4L0FZHj0L1K1DlDYy9yc421tYDDDKmSs+vz8xgs
         xzhoGR9+BYXcbMcrD2LNP/02lhPapZxIh4I6pccGoAJfd7oj9Za3ifYaGEYxzrlHnhFz
         2EUsYl2/s3go0d9Hne0dKlghOouVz0V1lxp4wAVYDPG6o38s1LG1OhSwM1h97wHhim98
         QJQw==
X-Gm-Message-State: AFuF++kPQTZyW3sBXASS2UCS6mHAzJHm0Zi+7NMwcQCaQWrSY/jwLEHT
	aCnDHnaMJMsE3+AN66gQ1TzBzG45p1XxVXre1KUpcQtoG4SXWS4j1fsGfLck2brfAeo=
X-Gm-Gg: AYBFou2ocFYrrLFMqIc2X5qzdKwmGcL52m4yCJsXyiXi6rQTiMM7zgpQmqDtrhfCQpP
	HuqJtHhuh1t8srmhDrbgdX2k1ouyPGStmE+NVmsxEjvcJWD6eKBu5mn12uTZVFOU2YBJtU/LI7W
	fcTPwVIiA5RreAuGXD5JKzysGC4ipzfQNo6yl+K1DQd+01DqkMY5V9Tdcj3RrOfE6j8eu1kqR6q
	J9RuaAUcmJy0ttoYU/5H9/8kviU/LRac3SGH/IxZUVMIUqG+0cxH3msL7KZkC9Mxuu+APQRZB6F
	pGUiBPylFzwk+elNbi6RVH7yebF+x1J8YPKQGre5MnT2paa2JkqFAOFYCAKzhiULllkQPWuV2Vn
	NXXrQCwUt1LSHqhz0A7h3WYUZqjlqO2nId6LtWwKEI1P57dW8g2xaRxG/sCPBe5CRUZaA1IqAUT
	ybFHNsUrUnZGkK+73CeS2z6b7XSaiQut5gT7nVV8GHMrw+kqWzhfKk9T8oLKrX0GorT9qk/4T4Q
	M8liZefZ4wOoMlgqBs=
X-Received: by 2002:a05:600c:3584:b0:49d:286:83d5 with SMTP id 5b1f17b1804b1-49fc5722755mr248984825e9.13.1790076519490;
        Tue, 22 Sep 2026 04:28:39 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fdab0e46fsm6687485e9.3.2026.09.22.04.28.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 04:28:39 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 22 Sep 2026 13:28:35 +0200
Subject: [PATCH 1/2] dt-bindings: arm: qcom: document the Valve Deckard
 headset
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-topic-sm8650-deckard-initial-dt-v1-1-c25e7759d04a@linaro.org>
References: <20260922-topic-sm8650-deckard-initial-dt-v1-0-c25e7759d04a@linaro.org>
In-Reply-To: <20260922-topic-sm8650-deckard-initial-dt-v1-0-c25e7759d04a@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=811;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=DRDBx8uJu/gmNOt8neF/NrrQZ8Y1qYuByeAf3Z74Z9c=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqsmZlyJKDWoV2ssgh24kWwz2H/hQYohfE8pwcdwwS
 59II9b+JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCarJmZQAKCRB33NvayMhJ0fIlEA
 CsJCKN3Knnm5FXJGJ8YaA84ahFOOo1s8QDCQqFythWfxOblnDtLd7HvZyGyRotxb50HCXZDUIz3Got
 ebTqZs+D9jzUERH5lYO5eDq226etSqv4wQNJxqCAqfue5tdeYXhr2yyeJe29yhDejz0vHfSdYCWdcN
 GiG5qvhVzUYksSEutSnDFW/elIpBkOhTrQfJoA3VbGWgi5kiQmEyJ1aGFSTFBnvqXqOZgYJYraawGi
 nYHwLz3+kD9LtG4Pa4MZ5qw/fVVSvlSSraSfHZhhv46xMiEY25rOr1Wmi9Z7yR+s5aisZ7o1Dg6M7i
 MR9d0R+JjoKMSvThMLr2XR9oY3ivgOwpUgfZAA7B3VejWp4g8kVo7i9cOzUjV6YrQNx6vwMSMOcEXV
 7DNDifKRNG9gxXR/zWgHa4Jjs3Rz9b7jFJ1retp3veE9UJXmzu/LFZSrU1iaHG1nMWE2hQuvRmfw4d
 hKZTuiGxMI+9UKe/oTzMtrsgFmEYjdNxGREEharOs+I14umUUvjZljz7pI7IzjEoWEXTAI4Szb2+Kj
 GGp3Y+wQEMueCRzpwWhOkrWPKpnYac8EyvkfGiWAB7SJ+VVMDjHehmACF8M/Bp58f3pore44M1ITO7
 +900hzU6EZX4+Qi678Wng/Lti9pGUKyyiLW+H/EorD+YpavsBJNfK6WN/89g==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Document the Valve "Steam Frame" codename Deckard.
The Steam Frame is a virtual reality headset based on the
Qualcomm Snapdragon 8 Gen 3 SoC (SM8650).

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index ff8a35df7862..0130bf93987c 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1164,6 +1164,7 @@ properties:
               - qcom,sm8650-hdk
               - qcom,sm8650-mtp
               - qcom,sm8650-qrd
+              - valve,deckard
           - const: qcom,sm8650
 
       - items:

-- 
2.34.1

