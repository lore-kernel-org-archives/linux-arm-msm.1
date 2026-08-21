Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F35346C4B3
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 12:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787315237; cv=none; b=cDqelQ4qe1vdZzy4oOsVjcVPkZdDZTky2v70a9OfTctggVB75FvAjpfX3koAFBtC2B/Cc3MCz1/nKqlVOHB5TWlBniXXWd0a73fzUcZ1PWmbkpm8R89yBRuy4k0jce3ydHiXxB8soJl1HEI9vb6tPGCiZUJICu3ZToEOxd0sbDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787315237; c=relaxed/simple;
	bh=GtU3BwmWr5r04fdNMr2P/dLekVQQQO6qKHal+CTJ5SU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qa6DGQbqxgBxhrd24Be6BgeJe0s5M08ft88csdzrkjP0EDYg6Nus4/BkSl7inGUl/yD2kfgIXGDSVOXcQEVlw2vKLP888MBVygrhPv2oii2ynb+wVS2C+KjsSmg3UBQCPs9BKkhmcI2rf+6F/q0ZFqE8RiWj+Hsoxb5mFVvR0uI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gh44Q8F/; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gh44Q8F/"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-69c600f76ccso1730524a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 05:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787315230; x=1787920030; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fqnhzBAbwr00r53ZE/i4Zlj1u/RNPOU76CLxr9WNMu0=;
        b=Gh44Q8F/aGr9Z+qNKKT5qVgGD7vofHTsL0luUcJEQxfd0SxSbnmPd/9uD7XtjOEfor
         2cP44z+/tdmRsGP7Mi45z8ii/F5Nbd3WkzBuIpY9UkuZ6lFmQUxCEQfeF8jF2mq52xqO
         MGrHFWTSX78Tj5Tq3jSJAItDVdA9RjAfvb6O0rxm3wPrQgNAt+JluWHq88zs6BhJ4/pw
         4yhXxt9Zirm025L0OvNJaTUGJ+9mpIU0eZjWjzPA41fcs7f8AvtNP8tVzjg3hYiaBmR9
         7092eNoDT9MDxQIKeOMT2IdnQKO1Jb1vKh71lvJSHnLbQ+RYsAJtILquZd3XV1LkpXx8
         vw+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787315230; x=1787920030;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fqnhzBAbwr00r53ZE/i4Zlj1u/RNPOU76CLxr9WNMu0=;
        b=iy4iQcFrKPAgYiuWD8Q4g7UK7RUn0/TS+Y+kszG2A7eocpSYsVN2bDE9XNl9u46MP+
         qBMFdiLmARW3mapC5LY+RPAJIvOj35HCZnK10LU/XR2dnIj9iz+4cgzktwkLPJr8UHsG
         EfPTbdFrRLj+/PNvzgliuylv1JnE5J2HVo2WaAiSHT8xmuLf4RUZqP6ps19NqWoLGCW3
         Xlp60Y9ZPTTU9IN7qv+CtJqQUAuYA5EesuPV7/KG4ZABz1siM3a9pwCA80Sr4lU0K6pj
         5S3jUXOmgkkwIAaaraP3PWj7BgCeezk0UUwZsjouOINYmAg3ahf+/8mgi+7qGSzBifL+
         HhGg==
X-Gm-Message-State: AFuF++lLtKCXkM20R1se22XWeOg3D7QnoGnQXOWjK28wS0ePm91rPWi+
	ZP4akazF4fIzPIJcbzIQgqeWjFEPdhPWBgDkEY2YLBhy2ms4xiSpT09m
X-Gm-Gg: AR+sD10EQfb7nyw+0wC7xXLZQbL+n3aJCau9FybHFKtCMXPYGEZY46grICkuupPJTS6
	wS7ikvdLCZg7OhPO58+SbRGEeerw0CmYtm8l4N/gQv34vyLyR+e+owTOxn5fjsqveW0v4GzXtd1
	5JUeF7jftrrdgVMj/+Dj0+re2nGPnLsV1b2JbIX/Tjgqyfa8nF5bUIunzxz4vzVA0VX0ij/UWlO
	xsVKJHzGOFcLT0v/p9V1h094mjdanONgKHB7ShJP6LmqKQykkElgUeJzVnbZHDjWWIA4kJ/MmKG
	V+InElWvgZP9jZwleKG0gojJwg+dAwZKWHnwG3s29eLhBRFrXTWAobcIpQfvW8Uwm1SDKq+s+rY
	NmcHI0wCn/ofqBHb9XgyrAEZAfgiIrAD8Y4t1ATDdWOqHBBYcKvboJjozY/JsZnsF2Rf0SKuMXe
	nF4jMRI11d2UNwNIaxUyCr8RlFr5d/NQzeDgXUBeX/7Q3uwTdDEA0ROwfXr2/0gkaNbxY0SK6q1
	ymuxyhuGxvUwZdhzDKYU7rWhSWkD40qbkqKSg==
X-Received: by 2002:a05:6402:5042:b0:6a3:eb58:dcfb with SMTP id 4fb4d7f45d1cf-6a42f1ddad2mr6350361a12.10.1787315230209;
        Fri, 21 Aug 2026 05:27:10 -0700 (PDT)
Received: from [127.0.1.1] (83.24.178.112.ipv4.supernova.orange.pl. [83.24.178.112])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3ff0c315dsm6220262a12.9.2026.08.21.05.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 05:27:09 -0700 (PDT)
From: Adam Skladowski <a39.skl@gmail.com>
Date: Fri, 21 Aug 2026 14:27:01 +0200
Subject: [PATCH v5 2/7] dt-bindings: arm: qcom: Document Motorola Moto One
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-next-patches-v5-2-ec81cee63e09@gmail.com>
References: <20260821-next-patches-v5-0-ec81cee63e09@gmail.com>
In-Reply-To: <20260821-next-patches-v5-0-ec81cee63e09@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 Adam Skladowski <a39.skl@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2

Add compatible for Motorola Moto One(deen) based on Snapdragon 625 SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index ff8a35df7862..289a3de1d24b 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -292,6 +292,7 @@ properties:
       - items:
           - enum:
               - flipkart,rimob
+              - motorola,deen
               - motorola,potter
               - xiaomi,daisy
               - xiaomi,mido

-- 
2.55.0

