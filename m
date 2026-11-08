Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794117271;
	b=AFZHAjsrxqv7gBNDtNyZIGXL0lqxLQZvBWzznjaxVJV0RFBZqc5HgvqEFix5o0d+yocX
	 OIcA8HCYYTQIZas9aUjhH9Zsa9mKkPLE/kSULS2YVhZvFbPhEfIBynVwQK0vGWmAVXaui
	 wzZJjxQJf5eWXElkpGvxMmjtUyqtbwKlI9kOOAedrmPJn/jpDBSR2CZiYWPKjX5ik9tg7
	 tBwYMQPOgh9iaV6U0CUxr8o4aIFZQkz48Z6I426pmnrZoFNdRcoT60XF/v7V83ljEQqqS
	 y90fpgcFLlzTZYWKh29vo9SprSJbHWKx+ZEc6d5rJjDBuNYBwMVNNzOosOq+iftmKew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794117271;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=jxepNjKduOAr/tzD0TlDbq34lA7HazSTmfh7A7+dM1Q=;
	b=oG9jQmjsq3xfQiTV5o5xOh5TG3sUa0ZUkJ+Up5nzUE6LBvtaxxAWX/SrJCXoYJFQD1rv
	 s1180nSJjemkQoIVZ7e37/p6pE2ywVltLI5G7G9gIWTckMzJvdOT+0mM55zaQLx2KK0cb
	 mnpjKN0H5YVXCy6eUcbqEUtiknhm8h7UZlBN16cpiIinh3CSPcWMKrKd3I1TNeFatA3la
	 6RUu6WkWeIf9cJnwvUsW9Y1DWoqAHnQslY85nkGnc9dxdW9CtQGyTSYQ7gGfJbxtn6XDt
	 EwtJEwgjtncA05uMPBZNSOX44OMdJJs9cjOheXS1WljzHXbzLYq8lR1V5pYZ7pfu6lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mFHfTGb7;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009F0606D816
	for <linux-arm-msm@vger.kernel.org>; Sun,  8 Nov 2026 05:54:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 009F0606D816
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mFHfTGb7
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so2611695e9.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Nov 2026 21:54:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794117269; x=1794722069; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jxepNjKduOAr/tzD0TlDbq34lA7HazSTmfh7A7+dM1Q=;
        b=mFHfTGb7HXk/JHsOJQVhXi9ghEA/0p6EkUqyOE3cY6g9T7eEIKQCTY6J1daG7aFbyJ
         +HWDYm2EYJcJbLAawvVxpd6toIJom1Szstw6eHBDQiFftCxy2kBcgfDTtPp8qkL/E4rx
         FKuPHde8PxcSoQ4JTtL0dR7++LsDmyE2lh/hyBklmx801WcfDEIjGhx3DBQv7hED3nHN
         f9bly/rrNexbf+LLiq5nTSZlW7d8PFkwaGsGfYy9+9NP6buj5zaXaRpE+dblaW2nSwj/
         5yH/iHLcpdj21i1fO2q4pOrblSM/upxAeYofTQzPyRObPVOtsix35xdWVGLX4UR4snGB
         3hZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794117269; x=1794722069;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jxepNjKduOAr/tzD0TlDbq34lA7HazSTmfh7A7+dM1Q=;
        b=Faxc/74KdlszzGxMjh2K5ymqsjXHhU2sRCO2eaz5dEEVRnI6Q4O2TLPc7LYe62zkeI
         Ijql8oQHWbgjqnSNTokHth8nBFvsfa0vt9jgMBaJz2AnkxobCUToZYKZ+mXMzP8HFGHb
         5tA1ON8RtZ12wfg7sBS4NqPsnjqdeBs1OHjStEdV7Ydp2NAKQmNA8dkDfc8CLWRAsQ/r
         J/OS04iGeINnu9tiWVBil96clpI3UrIJjLx7K6iZsXYTviwziYd1s0tHVaV84jlCfIO9
         VoFjfLfI697MbmFeRWoTjtItJcmSx39zMnPb/Hq2MYrjDi3CwcA7fLGa2LydejYuO+9p
         hxPA==
X-Gm-Message-State: APuU4Z+z90HCeCHlSlyot1584/3GMD2mBBgydid+LWjaS4fkPPIiy+UL
	HX6wSpCstmH231GcznGsiv04GW/dFSGaFdgjxyhM+ZsTs45Q39QbPxEd
X-Gm-Gg: AYBFou16rwCV/7e6Jh3JizIZJnawWaJ5VLnolDlMY6jwNcclxTckTwixtV5gD5lTXZk
	EnoyjdEt24IYP9fU6/aquSaNYyGzEnvVD9opNNZPcYcueOlLxNLDwyX8VZKYOvzRIsnrQClSIOP
	2lCqT+RrS8OQAr+qkKaYpGdHgTvD8U7D7OKz6Tjn5kW9R+fpqajfD5oEs+oyk62FW82pH939W9B
	/dJZ/jZCnrvSHly0THYw/3nodnQFBeLeaH0o19Pmp6i8eVVP3aT17kAl3kajqlvPuQAOo0fwZxh
	5Np3qm9vTydewWWlCmEMQCAujmvVYWYYu4yO/o9qBkFJvlYUqMjIhOHxZdwr9atKhcU0RhkWInV
	i4KDJH37bNH3APixj87ngx41fxe2SR3r8ymrSxIUOdvBgxTowDMReoytJNOQsTMv/vt9uBeJhqp
	aONCTpJeGTuaGhAwz0Do460iwiU0XRNT5XySmS6YqZMHfgUoBscMQDLyjUo5MbuELRqVH4VGeqg
	b/JICPCWHfqFEAAgKKj4x6gfrNlp/Vg5HYS6ruXcRB8AHz6JPMecf55XN5fMvtLidCPLwAxSxY2
	mlIe71N/n0njsmrAm2xSrZx3tSR2bt1nWoRnjMx5
X-Received: by 2002:a05:600c:19cc:b0:4a3:5d64:df91 with SMTP id 5b1f17b1804b1-4b962395b3dmr11692205e9.18.1794117269227;
        Sat, 07 Nov 2026 21:54:29 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4959783fd04sm2113363f8f.47.2026.11.07.21.54.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 21:54:28 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Sun, 08 Nov 2026 05:54:04 +0000
Subject: [PATCH 1/2] dt-bindings: arm: qcom,ids: Add SoC ID for SXR2250P
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
Message-Id: <20261108-sxr2250p-socinfo-v1-1-06244862f5c6@gmail.com>
References: <20261108-sxr2250p-socinfo-v1-0-06244862f5c6@gmail.com>
In-Reply-To: <20261108-sxr2250p-socinfo-v1-0-06244862f5c6@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Stanislav Aleksandrov <lightofmysoul@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794117264; l=685;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=XKUQeh5gIrN4psn3sFGa9/2nrQGmqfi6P81kjp5bAio=;
 b=sJFig5KQLc5oUud0DuW743w/MiO2pHlaJz6/e4NsWJ6WYGo2akIfCeWI9sEH9K8hhZW8NfFDF
 bhcK5nHedXtAVyt3BOHEToyq69vKWd6y8cysrdNLUxXcxQhNPFc9qSN
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Add the ID for the Qualcomm SXR2250P (Snapdragon XR2+ Gen 2) SoC.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 include/dt-bindings/arm/qcom,ids.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/arm/qcom,ids.h b/include/dt-bindings/arm/qcom,ids.h
index 135297027580..cbcab632e01c 100644
--- a/include/dt-bindings/arm/qcom,ids.h
+++ b/include/dt-bindings/arm/qcom,ids.h
@@ -288,6 +288,7 @@
 #define QCOM_ID_SM7635			636
 #define QCOM_ID_SM6650			640
 #define QCOM_ID_SM6650P			641
+#define QCOM_ID_SXR2250P		649
 #define QCOM_ID_IPQ5321			650
 #define QCOM_ID_IPQ5424			651
 #define QCOM_ID_QCM6690			657

-- 
2.55.0

