Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84925BA34
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 12:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787314757; cv=none; b=PTOP0monQFPWDRHr4PmUddboTCFIpyj4TdQJY7kK0KKRcPj5kDIjE2nRAoez4wbzoZl+b+aWFeN7QB8HkWdlgvfTcd8Q5OLOZO906o96gaTmnAsVXu+uHBB0Xz0BlSw1K+8E/sgfUYuMrPpCcY5IbB5HeRYa/M0QrUhXFJYxFg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787314757; c=relaxed/simple;
	bh=GtU3BwmWr5r04fdNMr2P/dLekVQQQO6qKHal+CTJ5SU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b99kQchaPQKOujeJgZqQP3xaQT/6KW9QYROrz5M4QrtOiz7mpGYAlAeE7U+04yVDImb3Rts+PfRs1wZ0eQllTajVcJZX6+opnfQ4m/7fSEi9PvBd6kpnA7na7TzMuZBK3eb9z6BP4t47ca0yZkozE2rENr0nwXbWXZrsJu/4xmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YNwhZezR; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YNwhZezR"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c197e7e4e94so178787466b.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 05:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787314747; x=1787919547; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fqnhzBAbwr00r53ZE/i4Zlj1u/RNPOU76CLxr9WNMu0=;
        b=YNwhZezR8ocwMwWJaHMAFQodJ2N4L9yebtBvagvqG0eDA+HSiuCDN2FXKYgy/AYHOz
         5bp4eLJG/H1TODcwJd0fsKy6Ck7ZtUhymvlZz8T4S2kwUCDTyUzLS4rtioqrfvhIBwVd
         rzks+c60J+uE7DFjwbslhDmelPCLTJX3/JbYINE9/8nfgymYNkM1fnbZbRCJh5pQE0Id
         UbzI+0p6E5fBbNwIQ5061YSWlRsdXVuXFf0Pkl08bVra2aQfusdYp4uq8HpiIC5smzmS
         ZM72vCU05Ui4NvP6hdmg8+4a9xH8i2cd1KKksbWaM00icF1iIXNgWWMhwbtdfcUNA2Mo
         MKBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787314747; x=1787919547;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fqnhzBAbwr00r53ZE/i4Zlj1u/RNPOU76CLxr9WNMu0=;
        b=cKFi548y7B2gYgnTap6R1gDFh9HxFO5uMYb+y2tctIou1KWTswJntMXwB10P4bNZ8t
         AkHF5aLcQKzjZBJAk8ypqDZY4KetcQ5hXLepCpZvKw15cJ9/LqbVA2dCg7yuFSpefsHW
         pLWPsV43coVK3XbO3uT0xOTgzS7UGwZiOjAJ04vvzgO0vXCjGfn2dpj2TE6zbdd0vkh/
         zbTXYAZMpCMXalEmRdY2RrHbeaNzpiQM/Ybgr5dam3Q/hf2k2o03Tl1XXP/acp6wYyJZ
         snKoIXBvhzqgK2IDMv9nAB0DYxDheT0obIufzEq97HjjTUn0UVT9gVty1NebKJTXqbKJ
         u2Jw==
X-Gm-Message-State: AFuF++noiuhuPCBtmXcjXVCEE57/SBaP+Yads3qiNxYetzwgc4DbuAn+
	Wzy3KTM4SXSuLuLvT/UI5vuiQIvDB3Z6tcYWTzgNNF9Kfus+drGcMmb5
X-Gm-Gg: AR+sD12DtiUZbFhoTKdXBGIWu5rkfHH8FjiL9rZ4FFZsrZQoNcxFKPbPzJudoMu0DS9
	3EAB9H7/zb8RLK3ZRQV6hMqxxRkpUqOghEH5GLZjenbMZJQqMkFrd8bFJVaKDrvkjZerrcWt7ou
	8ZgKcbVKglxvdBetJ12jn6ATdwcqfsNTMJES1EnT3bmVpsQZWFg8Np90+IV8VCRydqNKp0keVF5
	HOFtf/RYbvStRky0wFoOhZpSdIzUJBNXVK90mqPyAbQ/j1QGnIeIylkw8evM8i9uRAKMG9vHHR+
	LFMjhIpi+dP2IMG88uZL7B5GwIy3mxf312sdNNpthz4Na2njhQw5bJh2Wn/iXpCrw1ZqqgZhIis
	dZFxgH3uXwk2f3n/4fCUrmEpZ5YL9t14zvaHTSzjlMqZEFuyeUy+010b1HeYwxETEg+xNwoJBzy
	vTboryFVkLh7Wx05+uM30OG2kZK1voU/q7q0El80XDY4mHWjg5QB1I5d8VCzCyOh2N08zxFM+cQ
	YNtFi2v+7v3cAaUlNXMl3Z7x18=
X-Received: by 2002:a17:906:b849:b0:c12:6d25:2c7a with SMTP id a640c23a62f3a-c246a627988mr481735066b.17.1787314747295;
        Fri, 21 Aug 2026 05:19:07 -0700 (PDT)
Received: from [127.0.1.1] (83.24.178.112.ipv4.supernova.orange.pl. [83.24.178.112])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24589d9df9sm447823866b.1.2026.08.21.05.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 05:19:07 -0700 (PDT)
From: Adam Skladowski <a39.skl@gmail.com>
Date: Fri, 21 Aug 2026 14:19:01 +0200
Subject: [PATCH v4 2/7] dt-bindings: arm: qcom: Document Motorola Moto One
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-next-patches-v4-2-7ab02c0d4eb9@gmail.com>
References: <20260821-next-patches-v4-0-7ab02c0d4eb9@gmail.com>
In-Reply-To: <20260821-next-patches-v4-0-7ab02c0d4eb9@gmail.com>
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

