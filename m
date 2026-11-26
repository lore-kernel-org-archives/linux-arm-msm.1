Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795674679;
	b=nblvJ3lWPdeXRxPU/ryv3+c7u9LFWlduqClh79T0T38CmIVbqyfnJTlFY4Dmpai9nFw1
	 RNBv8vRaqR6rsxDMx+0qTakmJAw35kvBY5bG+Fx49+1Y7tT7M/0DPTYJUE3PlXDO3hDD7
	 LK7BB2MQnzvGpiRuFEKPx9Zi/ek5NB1k44pNtnoNxkBgAHuLpqEvpVLZXCYxC2vqFhr1f
	 TR+CRrYmuPH4F/GqlL2xwbcx7x4Ko5CI/ByYFoHsAFWDav87jcuhAsrzryhXi+glX3+dm
	 t5V7Q2e36pHVAoFTFerlSDIVw+KmgiqKZPrHUcZqUqsnJbQw/15yposa8P87XklgYvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795674679;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+eLYgfBAkjmFmmcTVzRQujd4paseXj2/5uFjWz/lHZA=;
	b=U6ThT57HfJpLqEPkoxGuXyJSXvnupr4YeXEmGhXj92o4BNDBGUFvsI/waNkCcsjM7yWa
	 V6HF9RnNltqEK77dhGmve3Q+veiarHxT8EGKIJd+IjbifV1Eq/ZKtMCVZvc2duog1YZYq
	 h8yzbGYb56guL96xO2hoL49zz7Eq4r5QHAzI2fm4wDKtbqZpXASGP5j1c2sAUlbr7ixMF
	 FUsPF5FuKN0vEQCfmR4MlK9gpP8mXta4mKXEIYZQoM06sXcEUQgfcgWsTQnc7uUeO45g3
	 iSOeTisSGcusj6wJaXMc+gcofBsSusTKnKO1p+xrqx3gKP2gqaKm5JQ86+wOGahwrhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WxSq6isw;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B2D606A31C
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 06:31:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23B2D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WxSq6isw
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3b40a522c00so766210a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 22:31:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795674678; x=1796279478; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+eLYgfBAkjmFmmcTVzRQujd4paseXj2/5uFjWz/lHZA=;
        b=WxSq6iswh4gERHnq7KF3yzR1kEsSgP25oEG2Y52ZCyDkgFbEYivNnqmaGegP9AYgGV
         5/mEujXOjNv0LG0pskaseJsRoFtxoHRpuza1loGsgTEVyig9o3MFGPKycc86OSa1JjXp
         wMPLBwJELutmPtFnm7tR/QzdKrBes2tetHbsBpA5ZkSXwxdOjIMccbqdXszJdrZeh+ql
         TC5osXtML3kqt/a082hddVPQ3rLWg8S0qIA0MS9I4Q/zUluvnOLHgfsOhA3QbQYsxb9C
         T87TwheaZbpXQo2iS5s6CemobHuNDDDdY8Ws12aD92O1TCf+fZF7ZF3tfzBRAHjvH59E
         ieEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795674678; x=1796279478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+eLYgfBAkjmFmmcTVzRQujd4paseXj2/5uFjWz/lHZA=;
        b=Po/KOjAFgmrZmZLXmarDR06ng+UAt3tnGfvxFqZwyS0nTH6webP63qKVdJrBTl8+CW
         +NlAtfaTzV3TjWnwuGJ+PoamAzaHQxyt+bhtn2oP7EcVlaKoUrSSvy13Q2oiOKOc5YXr
         kRJyWrdrcW0S+zHrorFO8xVwxzEH971sA4VqsUItHEPYzBZLSFLvhmmMVBZyPinnExYH
         TYgkeo/fdAcCvvmicTKT/0hsRsy197eBvzTo7iRHiGbJsq2U7N3xSUdmPt5tUGKTEU6k
         q/N657+vj4s1oRSLYBRf05h/KyaVXVneHeRnSTdKm2skGOnxYFRJjEoemWYMLp3GH8m8
         Wfhg==
X-Forwarded-Encrypted: i=1; AL+hErFfIouzEAT8M8LF2j2zgxBODnBdAK0q2lY/Kq6vu0iiqvP+iocX015Ahco2MYsP4pljb2DQB7azRwnY86f8@vger.kernel.org
X-Gm-Message-State: APuU4Z+7tVealSXAJX5VoIhO0L2hJ0378+YCuDCKPtOH2EgRhCLLxiiw
	n4QGYKn7jd6C2yHQMl8bHfS7+X74wQ0CUSJzlL0F74CG5N6+K1qtvUFP
X-Gm-Gg: AZFdTZfVXjgUh+n1/CRaK/BEHPCTrdt9vYJX/J3uBFWIHsbDa2GZYegZYbQQZgDKVcB
	RLykw/ogpwqnHNauO78hhTNZZNUZOETx8nQrJiRpisBukuWrCp9RNyjOylZiBBfGXinWL6ZDZ6P
	5XoFrUbwnQOXP3t8HRKu4fPqR3tXFsc/YIhj7JzAQHsiipf+9Nug54t+ZY9yXwCUt0SyEwxQGU1
	L6m4VwcJhucjrUcLOxCBdK3SIv7GIppick71Yg/QqPctxVifMlEc8AHjKc2KuDg4fJYt+vMmqhI
	D+07dyv0Vgb4WKMvSLWgAQmNGS/j//P6EZl+FA8xfenjEkE4tgoxB45gqV0eVlyvZMFIuAYvfzO
	xMcp1xeaSi+E5nv/hDXDuvWclbB3YPWgj7kNZ8g6YBKcgi8dZW94g0vRRVxpNNKN75zWGmCVUOg
	tzqO8WeBU7RaIMDLlQ1/Q7tOhqpdN9bQEW2l0TNoUK9eT+xZv134GwGHMIEZEyY0atZ6gzqvJEl
	du6BYD6wfXm4skjHcFHXnjH8RU2Ytq3L+x6Ms6eVrkYZmrMxNNUXxJz+Z+oT5LWR/U690t0BnfT
	Hbrb2Q41ujCIQgsEm+Z6sE4KdbWmMnFI8E1ENSAnnOq5qke30QQHiw==
X-Received: by 2002:a17:90b:3d8d:b0:3ab:a188:b898 with SMTP id 98e67ed59e1d1-3b41c80b970mr31782071a91.2.1795674678516;
        Wed, 25 Nov 2026 22:31:18 -0800 (PST)
Received: from localhost.localdomain ([240e:36d:b08:5b40::a60])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde7f91c6f5sm7906328a12.27.2026.11.25.22.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:31:18 -0800 (PST)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: devicetree@vger.kernel.org
Cc: Jianfeng Liu <liujianfeng1994@gmail.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v1 2/2] arm64: dts: qcom: sm8250-elish: Distinguish display panel variants
Date: Thu, 26 Nov 2026 14:30:34 +0800
Message-ID: <20261126063056.2276703-3-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261126063056.2276703-1-liujianfeng1994@gmail.com>
References: <20261126063056.2276703-1-liujianfeng1994@gmail.com>
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

The BOE and CSOT variants of the Xiaomi Mi Pad 5 Pro have separate device
trees, but both advertise the same root compatible list. Firmware using
that list to select a DTB, such as Stubble, cannot distinguish them and
may select the device tree for the wrong panel.

Prepend a panel-specific board compatible to each variant's root node.
Retain xiaomi,elish and qcom,sm8250 as fallbacks for existing users of the
generic board and SoC compatibles.

Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>

---

 arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-boe.dts  | 2 +-
 arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-csot.dts | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-boe.dts b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-boe.dts
index de6101ddebe7d..4838f3950124c 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-boe.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-boe.dts
@@ -9,7 +9,7 @@
 
 / {
 	model = "Xiaomi Mi Pad 5 Pro (BOE)";
-	compatible = "xiaomi,elish", "qcom,sm8250";
+	compatible = "xiaomi,elish-boe", "xiaomi,elish", "qcom,sm8250";
 };
 
 &display_panel {
diff --git a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-csot.dts b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-csot.dts
index 4cffe9c703df8..0ad0a76ee9d04 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-csot.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-csot.dts
@@ -9,7 +9,7 @@
 
 / {
 	model = "Xiaomi Mi Pad 5 Pro (CSOT)";
-	compatible = "xiaomi,elish", "qcom,sm8250";
+	compatible = "xiaomi,elish-csot", "xiaomi,elish", "qcom,sm8250";
 };
 
 &display_panel {
-- 
2.47.3

