Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D543CF69F
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 08:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788164984; cv=none; b=BssfZ8YC1JzCMwOk0KYxtUi5VK7EaXj5x92kzhetGmm673Pz7cU8xJXWFNeTT6JuECdDKMppKRoUfOM+h148UvkXptcB3HDT3/2ba1qo1jn1vOlrz+BZjuK4KHBqXQraUPiLZ2tZdxvhVyUKrbPuD+8a/X+3+17VtxqAvolJ7eM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788164984; c=relaxed/simple;
	bh=ozrNkl+iaiGjnAq0+mFBUiCzT9/nd/DbKRrOCi9G+QY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Pwd/Tg8sfGrbSjURLOEPaJt7nc2svTO74ON4NfOdHVIrgpWObQ5q0NODlerWWA1eX9to2s/3ujepgIuHK0yJSaQjhGXP8h/6v/VsT77MIYARlRihHxVvwjk1a7n86UTfF1D50e9ayk5GS5IVQkqcnpuBn/lp1GePGG7/0XzBvIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IiB8m1zk; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IiB8m1zk"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so36360275e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 01:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788164981; x=1788769781; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BSKELzFPLYKgY41EV77McQToo0Y5Z7+ER0IxO0OLWAE=;
        b=IiB8m1zkogR9H/cjWwa/+fbAix9HKwTICfXitWbbaULMXzLiWOq+eWr1b1nglNv5LI
         5eOxlZl8VFmeTd+e9Ax1IqIlnqzHWXT4VdXJC40x0RSRdwd8ohQouTUn4Qil8Tp2zLv7
         X/tGjHxdw3fFp34tbdG8bH09A+iEGO+oa1GoYaS6oDA9ezAVmJp4CKzlcgWGeIfLVOzi
         ndy3c3EW8zoa5rllJdC70ArcGGmh4tHXreg89qgfofr5VGojV6TG2UElvHZhm6RGyINL
         cAX7lcyy/G1GGdE/Q3RLUemXoaiEUiVIlkk9A2hm7yuTivXt7/vxq8UWMX/XcFVoTute
         e8mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788164981; x=1788769781;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=BSKELzFPLYKgY41EV77McQToo0Y5Z7+ER0IxO0OLWAE=;
        b=h6wKtPMUbpSxIGN2p8mJqERlKFdsi3n60WJjzaZZcJx4aw2s+bcQWfmLuKHh8zd+FZ
         7ufH1XziYV2XLJq5EImXQ/u+E3KLY1XqnAitYFmRrOqPDSQ1qrV1Sa4fWrx50gPOj5/B
         +3QPp7TgX8WLx7Eyb9lrvMGryGhvhTUSd4mjvN9+UKWjZ4Nub1xlzV97YhsOvgL+EYsU
         PfR51EJ9zThhzsWOBluYBBSTTbLiM9MzLrARvIq1LXcNH/VCYK8OajbmpftF7AIHYY/d
         kbnfbuTrEoYxsR9qqphbxJRwF4n1AQBRbSxNruetuWii0yw3bhHv3fR2pmQygQIgwEKN
         Ok7Q==
X-Gm-Message-State: AFuF++l/ZnGzecvJqxeCJpKJgqXXlT+4Djx87eiis4xZ6/+1FrAkPRCc
	lMU3wGwrq2iAgP9WpsKB5N9UC/EE52a9VDIXVbNZo9e1lEWv3EnOxokPxeiAEU3MLR0=
X-Gm-Gg: AR+sD11/4u92PVm6CdbPNJYeRJtjTtPEweoeGVWEez8ICJWH/+tx0nj7e9e8+d5L0x1
	ZITeEmSP3eDN5dzi9XcxtIp7w16/adnDy3HEBnZSV61ByipbfNZJMyYewny/f+aXrij21QwRVjU
	yf7JrGAJ5C72BI9Jz+V8yr220cBnupk9I9+YXMU0T6uDocb27RMP1SAhSoYmALMIB1D3suXAMSZ
	tUBFPcInsCETIlysh/5/Y+D2Hvs66CxWz/OeClmpjw6Lbv9cIRQ4Vcy2ZPEi6PFDdjbU/T18kay
	1wdEhA52BnMwG+2TmPGHIbJWTE+CFxtTJfpcJt+Y+tvGG+ApfxeBxtEw1FZyzsxrC6QFK4zT2uk
	C20dSSm3kAHQSNIi9pSY2WmeoveLlqdS5Ud70rYyCUfn60uH6HMYtdUo81KRFbPJDvXeCWUaJEt
	74IENbhdb88EFpKNf6u3JJVKl27PfAO4Ihycjnl3XnzYJunmzfiv1J4FSAAdXRKONCromyzN33k
	Sw5J+VZNQ==
X-Received: by 2002:a05:600c:3549:b0:49b:5521:785d with SMTP id 5b1f17b1804b1-49b91c1e9d8mr350066605e9.4.1788164981010;
        Mon, 31 Aug 2026 01:29:41 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0e:1007:7be3:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ccd1e19desm227632525e9.1.2026.08.31.01.29.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 01:29:40 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 31 Aug 2026 10:29:37 +0200
Subject: [PATCH v2] arm64: dts: qcom: sm8650-ayaneo-pocket-s2: switch sound
 card to ayaneo,pocket-s2-sndcard
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-dt-v2-1-7a05c995ff2e@linaro.org>
X-B4-Tracking: v=1; b=H4sIAHA7lWoC/52OTQ6DIBSEr9Kw7msAo5Kueo/GBeJDX3/AALU1x
 rsX7Q26/DKT+WZhEQNhZOfDwgJOFMm7DPJ4YGbQrkegLjOTXFa8LgQkP5KB+FRVyUHP2qGH0Zs
 7JogS3lFLsPSBLkGNraq1kLZAw/LeGDAnu+va/Di+2huatAm2xkAx+TDvZyax9f7xTgIE8FIqa
 ytrsVCXBzkd/MmHnjXrun4BEAk5tfUAAAA=
X-Change-ID: 20260731-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-dt-7eb87a12f3ec
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1405;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=ozrNkl+iaiGjnAq0+mFBUiCzT9/nd/DbKRrOCi9G+QY=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqlTtyeYtUoKTxUs+Lf+LrkUeyT3mfYZjnRU2yyJMl
 7CTN4J6JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCapU7cgAKCRB33NvayMhJ0euaD/
 9Q1JgS8eEdt/JQwN3QshypAcQI6hPtK9kpbHf9uH4XTzaLEPUY2y1+7BGkKc1KyhK6ns6Cb3JZxPCc
 0LUhTU38/xhVQ7zR9VRBwZi3i1/GW1fxHtEO1sUUYXQGlzpVRbNgauCBmfxdJH3AEWLSQBZj1LADXD
 EcA0wy1NlhAhrcygTlTC621xI7cBSaI4HO7STWAecsVRI0Bo7Evg3n9gQXWC1cHUdDwe3VMiYkVZ+2
 N2pz6dP3ZrQKbDx1vft1LLcCAxzmwe73D++xbl2nnYG4jRmJU5fjAkpmjV3XcHXJUfa9fiW541Wwc0
 zXpPwiiqwCBcm4gvNDi6H+eNZSHRzbkRsb7oRxkYnn44AXru80ypeMuUBdRxbMN8ttwAu0U7qvTDmw
 DvF423qv41Mu1V1fGDV5VDfDSdEeEwKjM3BwLBdSP/He7fYuKqaJEkjI/j6Aj9b9lTeraq8rGDir6v
 RLGPVAwQfmYbcr6iqYeJjW9AFdWRy/jTgZ90HSRa0GU70tFdPqgWlxlPpPV4wIw8EQlwypR2m8ZN8A
 G5hCA/qSpuEa+BLLY4n+LKR/PbUEH18yTFZaBD9iP2itsLH1SXSsqQKrNZo3R97PZI1vhIjIXY4ytU
 HNB4eIwgKvC0ch1/fytWZbfYCr2CUIxfFEEkdllwpej1KV0SR9tKD/k3haCg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Switch to the ayaneo,pocket-s2-sndcard since the hardware connection
of the WSA speakers on the WSA2 port only makes it is incompatible
with the default SM8650 generic sound card.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v2:
- Rebase on v7.3-rc1
- Collect review
- Link to v1: https://patch.msgid.link/20260731-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-dt-v1-1-0528ff6ffe38@linaro.org
---
 arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts b/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
index 6ddf30ecabfe..c5d6732e73c6 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
@@ -221,7 +221,7 @@ upd720201_vdd33_reg: upd720201-vdd33-regulator {
 	};
 
 	sound {
-		compatible = "qcom,sm8650-sndcard", "qcom,sm8450-sndcard";
+		compatible = "ayaneo,pocket-s2-sndcard";
 		model = "SM8650-APS2";
 		audio-routing = "SpkrLeft IN", "WSA_SPK1 OUT",
 				"SpkrRight IN", "WSA_SPK2 OUT",

---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260731-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-dt-7eb87a12f3ec

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>

