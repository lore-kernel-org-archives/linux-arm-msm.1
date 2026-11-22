Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795368949;
	b=t0AjZngnF4dVpkZYR0asFJr1zAhLO3APxa89w9eDJUdOradKPM7QrEUdVx9YxQvVmQ6+
	 Z88wo2FdaecJN4xcvblUjjHIW+vqLRP6tLMzSxo46jqL7ifQ3un6ZP7U605Lpmnqd2CCC
	 lQOs753jHm/wODEWbkGtyjCa0CDk+j1gaEyhoBhk9Pu6nH66X2yUDkHx2u1NOOYkm/efx
	 hemIYCynejOcWZyekcaJTT/npaN7BYvwzy6qQYQZfLu/li2pcfABgdnUd4zqdIK9SBe0U
	 3GsTQnvb6aDYoi1LI9zqLELEYj2EywgXOILLjSqJbW0RQKnrSlosc288twbiG2GEsYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795368949;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=akBEH5Mu5RKcJOqX+P3AWfnGfbksoU5XtkoXP6m3PJU=;
	b=tNb2DXxoRjahLDfPEp0kbAKiCpOCXtos2xnWjH80fzm6Oaj8yFfXn0yV6cRKT+UszG0R
	 BA3NaDgJKYpT9V6RngmaEtLsevTvLrAb9o/D9CknHyybltu5uVLMU/t4XPXkkk033ZFXm
	 PQPyNr1QJPTXVCdBmgKZ+JkbJ3HP72aSEeT78y+KV18wDSeJQwmkG002VoNB0AT0NiISu
	 qOQsyDlmMPMlB/OHBRHWBtgNgnWoaejX3Cm9CcAetJtBKpjEMuzAgwR2QJ19doEXdQ5c7
	 vCet4pnOcJlGvN7aDgNcWtaiUJGMlwhFl9CTJnh+2G4f4vlmfjB4ltfRcHj6R6Pq1bA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RUAGvOS4;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A15606A320
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 17:35:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5A15606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RUAGvOS4
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-15dd124bbe7so415381c88.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 09:35:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795368948; x=1795973748; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=akBEH5Mu5RKcJOqX+P3AWfnGfbksoU5XtkoXP6m3PJU=;
        b=RUAGvOS424fngzXVXGnBDW25yR6ASDwqNP4nBG6P0RkE9ctSrz2XI5dWkla9yQdNRU
         8bc+GZlnNJmIL+GnPOD5i/FJh16cvhqcLYZIkG5s/IkqkrVNbUlWzbaclMWsw5QGc6Qd
         yT2/i3zW+d70nhhLwUMIP11m73mOojUYl0aXoDYXwtqEmJhKXxzb7ppUZSOP1TCZoMUa
         zFpsiJE8TN7BQ5GCwoYiz1+ILN3lGf1t4zBTybBd0aFdLHXrkrS6miH8A9n+WXnX9q1t
         tx+eDUcBs7EJU9tDABYma36Kjm9TPSCLgU1cAeRSx/G9t3CuwamMijnomdFYbGBUmUWH
         H6+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795368948; x=1795973748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=akBEH5Mu5RKcJOqX+P3AWfnGfbksoU5XtkoXP6m3PJU=;
        b=R3JIGj5xWkI08ZbeURaw++9NThxVwanrPyE814sDAm/1fTqNsrjm+bvyEhnqaPkifJ
         J7BYXEHpptk9cA2rnBST8lkjXr8VdRDOsucPSBNslJ4bc7vLVHYsZR7AoW9oM8tdaU5e
         FgSr7Vm+/arnaMEtm57SvCragZKTrLrakQ8jqzd3hSWqHiF9/LQWcgcw0foDzOwPD4in
         4EhXB1psFQ6+wnNqKARa9+I15R3gTB2aaSRQSWA/Q6XCvc6F9hUnxnhxzcO8+LTwzcDU
         BXgPkNtMoMTjoZ1IuUu9YBLB23xgu97U/EiMVjXSWYwxBrUMrXdcNGBxboW6kYCUh73a
         U5Hw==
X-Forwarded-Encrypted: i=1; AL+hErF7+Pqo20hwn9JA0U84GebeVXz6MPM7boFOwbLTVIFDhD4dvv13vCGcyCw10eZkzhnx5ElSpf33KFhKAjld@vger.kernel.org
X-Gm-Message-State: APuU4Z8H1Sfeg5cDA/6Q/ahcihkWiDSgZma9R0hgjSoYOQS9VGvj6vz5
	CFYe2hRHW6e56749XyA2hTDdYtrygSIQO5aX8lwaryGGfqjLXNKUpK84
X-Gm-Gg: AZFdTZdm2RidbhWvAFMLFJkmUgAkuuEDFJlrHd3sGZLA3PJ89hHgjQevJ23F3RsV7UT
	4bKQvAeTqvUT0+LoK6iTyBcNNbEB/1sriBWtV4qF7v/1J1INoxbCVKOJPN/eTYwJGbr9q0zNSU7
	rf+2gJ4g5vMlawQwS2oT34iG4NNh24ubrY6P0ZcLqXzqHfctJ4afgNuuKC4NqkvM0TPCvbmcxEe
	hhoNWUfKDQFXGRQG4HLTQKDLiAf+yB9aYQJIInoTkwUbcQZGlKznxMokiqoQKZKQRes+TjC0xGw
	E2jf5Nt/dL7etUWc1lbRTM610+QwszxUup52ZWPKKgN4qz8PfyiXYFc9aoV7ZoK51KT9TEqX2tB
	3qHnh7pkjhT7JNDv6vYWLmcfpgme1UOWD9pZz0BJQulA/J4UPocoyeaVs2tdjG6Qs1cRZd66UNF
	ZjUeohMkEbkWlYlECuASdqcrrzmmck3YtnV1uoCMb3qngzFVbd37xIj2nGRtesdcsiDFj0Se953
	rfY86f5bok+XC+lwrF1U2kD0pvIy0Kg0PNyOfpoLn0cuWynWmbLr17EJ5zrY6QjZqnC4MyMNQJd
	aoVBMwFT2iaGWJtn78skRozskHliG/4F/nX2BLi2GxYmWXP5ejgsI8Eq7RU2iWQcixU9hoX9EDz
	GX21q7k6thY1GM8auOqQGrjNOA7ho5k/bI2H3Zo68XjgX8vcXOZ8FPczqmNN8qbhjNliR9L3thD
	9X6FXSXEWHEzl5oc5ImwDDY5Fu2A==
X-Received: by 2002:a05:7022:ed02:b0:167:d73a:e994 with SMTP id a92af1059eb24-1b5568f335cmr9548851c88.24.1795368948100;
        Sun, 22 Nov 2026 09:35:48 -0800 (PST)
Received: from suraj-HP-Laptop-15s-fq2xxx.tailee6f87.ts.net ([2402:a00:163:3509:b842:8324:ef7c:136d])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b56ef9fd16sm6419485c88.4.2026.11.22.09.35.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 09:35:47 -0800 (PST)
From: Suraj Sonawane <surajsonawane0215@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Suraj Sonawane <surajsonawane0215@gmail.com>
Subject: [PATCH v3 1/2] dt-bindings: pinctrl: qcom,sc7280-lpass-lpi: add ext_mclk1_c
Date: Sun, 22 Nov 2026 23:04:49 +0530
Message-Id: <20261122173449.21009-2-surajsonawane0215@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261122173449.21009-1-surajsonawane0215@gmail.com>
References: <20261122173449.21009-1-surajsonawane0215@gmail.com>
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

LPASS LPI gpio5 can mux EXT_MCLK1_C. Allow function = "ext_mclk1_c"
in the SC7280 LPASS LPI pinctrl binding so DT can select that mux
once the driver exposes it.

Signed-off-by: Suraj Sonawane <surajsonawane0215@gmail.com>
---
 .../bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml
index bc7b8dda8..5f7870fa6 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml
@@ -64,7 +64,7 @@ $defs:
                 qua_mi2s_data, swr_rx_clk, swr_rx_data, dmic1_clk, i2s1_clk,
                 dmic1_data, i2s1_ws, dmic2_clk, dmic2_data, i2s1_data,
                 i2s2_clk, wsa_swr_clk, i2s2_ws, wsa_swr_data, dmic3_clk,
-                dmic3_data, i2s2_data ]
+                dmic3_data, i2s2_data, ext_mclk1_c ]
         description:
           Specify the alternative function to be configured for the specified
           pins.
-- 
2.34.1

