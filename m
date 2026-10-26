Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793029272;
	b=a8XpcA5S+J2bxtVqh6YSmv2Tic/tyxrYvVRFDFM5Gj277lWWYBZPuMh9kwbv1WkY4rNT
	 PqBjogE11ii1F8Ioe3AT9pfDHIFqM4huqPaHzweq/wTHwD3P8u/dh0qwX6IQZhfycI4jg
	 77oFGASlpI+28b2SpHigYuAxqp/XsQROuhtCKRSJ+A7V93qHaQNKV3CydRT5GT5NY/3rj
	 XqnY5S0JULbOX/A1s/CVG3LXRpIua0fz+esI73KZZoF/Lvj7X2Vkgn7354DkOpa6MbCiJ
	 2ez9asegXLiv694tGOQWaYqpjRvlcp8EDepfubzbDphskm8zCIDPzViSSyPJRKvvR8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793029272;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wa7jpdJ887MlxcgoqqazDZr2I8peh/arTuSgNh6Gg2Y=;
	b=bhr8BsXNTXAirabq+RpYY3y8NHmgG4m4+xWuk+4iD0PzKC2zSTioamRKUJwpPM9xhlJY
	 RuAk3/FepvuDl9kVE2iozoXz70d8pO3miCTGIQseC5bAfKFJLzKM3yIJnQudoFESLA0Os
	 /Vu7HQSEd3oC+3hxq2McGum4k9SbMPtabDyrt5JeraKEOR0OJXN/E7J2ZrtCpmoNTaF52
	 qjY60Q6nNEDU5dvA2cE8h3dQQ+vhSRPL3WXg+7PFtFqxqel8FLjH7aRfRmbhRTnGPcXDr
	 G3p/3bND40l13UYdxLCqgDpcvGDLxv5m7Wyb/gt+q732RFrdQnA5KM1xo61A3Uicz0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cHSv23ao;
	arc=none smtp.remote-ip=209.85.167.170
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22033606A31B
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 15:41:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22033606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cHSv23ao
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-4d7034a99a9so1881019b6e.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 08:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793029271; x=1793634071; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wa7jpdJ887MlxcgoqqazDZr2I8peh/arTuSgNh6Gg2Y=;
        b=cHSv23aoKBvmNZzrwMqxEQ8owFyPvY3MMf6al0nBxabp4LETXHemewHKhv7Q6xdcAl
         PP/BiYXMxGMdvPNh9Jm99FqfF1st2GyowVSbDLa2gaQrPEeClPc03oCijVPXssWs3ThN
         t5y8eV8XylNDdIX7Ar/4U3adMFLuWENGGr771idWkJx/FRH1q+DOcnKoCV/pnu+zyTrQ
         ZvnCif6tg1QJH8KlBjDJ1LCSWPqSquzsPzb02HFJbUYBJrCiWsKOnNVL6bgx8rtLrzvR
         utd60SPwNoJnG0zwcSxlX4PJ0H9zHCnCPPlVq5pZZ9yK4tr6dRnnOcnxAjEt3Yszd6X1
         9Duw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793029271; x=1793634071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wa7jpdJ887MlxcgoqqazDZr2I8peh/arTuSgNh6Gg2Y=;
        b=BW8plbDyk9he74ZwjKFDfkYDoZAaJyj67cQjft+n/9hhuPWF2wVGApPlkqu2fsGmjT
         Y/bj98nF8itPKXUqPLfx4IH8rJE3rYOwh3v3WPgnlGpho1tJVMlBUfvAKVuxt7oPVL50
         uGQx90NKPxnsTdJWuHJidbzEVZvHBdwOXY6Bx18SS3mUdPbIVnDbadsPhRhl7SYT3Zv9
         N/oJFnWkO3S/Z+Pwc8w8Qw6ojvXKeN4FC1MpYqGBApOiqVCWgIfh07WkcRtEE8ZaVXIo
         cSxC4KMmKAQA45ojV7q8YVd3kARtdEdJ8LpHSomFdP9svusYd/l+VyNUkvIOKyXw7j9F
         gI5Q==
X-Forwarded-Encrypted: i=1; AKwUvBzlLkLxzoLcjPVzzrEpV89/bzTQKp6VHyoDdWj4x5LPWiTVhKGo6fVHRQjUgtVeIq+bpfDEr3xqTUpGJPB0@vger.kernel.org
X-Gm-Message-State: AFq9FYKhfdWKasGBi63Opsz1017qSSFyswRJ9C4Wd/e4ngRViHLjOziX
	rC5bI6gNHnnOYj35M1z7Lktd+/66nYbmTHrYMNlGofVYGVEeEIdjIdI3
X-Gm-Gg: AYBFou32DD/Vd6o0+y2AeAsyLmaI9cYHcvYwy22wK9GwLXX6y02Q3HdYu3Wdvff5nzP
	kbTryjXZnalFPZwe8DEsi0OW5PWl+vQ7YwmmgjFRM5c9GCUoKjupqQiO+2gRbNtnU5YNIPtqgpg
	2CCJQyzn8HDRBeQw7VWPHk4S52zUaVjWDkf4qKcK6M/WH0ZHieM4oLepFtJxXIwy3oaaCPg8Kqw
	tV7DNIqgotKWlWpSWa5aJc2ppGq8xHqMh0bqlvEECPwR7NYLl8pMxxsF6j0h6ltOXpMR9xbeurt
	PdynYOVg8j5KhyWIfD6eELT8LSC2S1JN4J2eOErZdv9+n2qe9pdoBAJvi0yIbGoEsu+jTCQMonL
	RTagIBCuaz7CSGLg+/T4gEmBi1impOl6U9P6DKX+blDitxFp+ljUKMQaQfVcpqw7fjzhyEAS8bJ
	i1UCdTrKhAIxv56l+9ztyHUYGJzU86qB8XBE1ruKDZ7Kr1PURW/TudG8IKeP+oGpg/hbDSAQKfY
	eU6rP3u4ClZpBacY+XHxVnRcZH99Ko21j0fCphnIW3HhGSCvwTV+r6WhXJqSVrEly+qT2w0Mt7C
	MIFwjuCzQw==
X-Received: by 2002:a05:6808:1202:b0:4d6:90d3:e185 with SMTP id 5614622812f47-55c002f9613mr4694800b6e.46.1793029270943;
        Mon, 26 Oct 2026 08:41:10 -0700 (PDT)
Received: from jeffmr.mynetworksettings.com ([2600:1014:a112:1526:a95b:f8ab:d834:50c9])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a84315c0c9sm4746441fac.7.2026.10.26.08.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 08:41:10 -0700 (PDT)
From: Jeff Roach <jeff.roach0@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: arm: qcom: Add HP OmniBook X 16-cp1
Date: Mon, 26 Oct 2026 10:40:00 -0500
Message-ID: <20261026154001.9323-2-jeff.roach0@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261026154001.9323-1-jeff.roach0@gmail.com>
References: <20261026154001.9323-1-jeff.roach0@gmail.com>
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

Document the HP OmniBook X 16-cp1 laptop, based on the Qualcomm Mahua
(Snapdragon X2 Elite, 12 cores) SoC.

Signed-off-by: Jeff Roach <jeff.roach0@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557ce..4dd57e8663 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -191,6 +191,7 @@ properties:
 
       - items:
           - enum:
+              - hp,omnibook-x16-cp1
               - qcom,mahua-crd
           - const: qcom,mahua
 
-- 
2.55.0

