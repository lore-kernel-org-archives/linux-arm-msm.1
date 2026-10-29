Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793281035;
	b=xsRPx8IBiQOeCFnyZo7/M0D0lO8g0JJKNdJYP4ZyFKQ2QwocR+e+Pj2DZYn3KxMqUfxB
	 kZ3TR3dspoU0RU1GP7vqmjUD/f7ry3qzGB1SLLAWcliKwanOBLYnxacjxLg9hKJF2lb86
	 MF1YepX6FTvAS0thwWFd05dQ1oRmLJ5wZdRIVuCfRuW3MqH2KXvp50bTyP+qIej0u4RBR
	 l3zpyvHdAMMkhuKHA31MJaThkaLt6g6JQVObjwC33GIoBS801DNjZ17nPWw8IQ/iINhwH
	 1V4gwJ45IGUIrW3P9F0XMsnDyUI1Q5zrSQwFN0Xh4ERKWBL1p0EJugRKsTAWGcsLmWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793281035;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=swEU0gDnT+Ur08Y/4gcNOqhZccm16g7AYsEas7N5VRQ=;
	b=ixEJ1XsPbPKcjA+ijDWgICS5A+zfqxAy2DGcNmucmFm6n8HxSmBn/KWcEIkwmFRPc1Cw
	 92DM6AiU0iNMZy1gMxwCVAiGqIED0AO2FXHw6meUIKosIrCBYmtZx4lp09g3K8wp/UGkt
	 qYHkM8vtK0Dxbe7DBIOX1ojeQoZSH6yNjad4ljcy3ZTv1o93USnP7ebVm3PxwZH1BMUok
	 e4QQYIYMWvT9WbOFPkNfT3qP2VvcMG+D3PqhhidwqtFOa5mi2YTXsCQitvTbIC3Sr51gg
	 LRvqc2K7ACFUT1H19TtqMOF2UhCwq5slIUEfI0oMBHuM9lTO/A1bhZxRZF8n0T4PPoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r5oLrkws;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D42606DA65
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 13:37:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7D42606DA65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r5oLrkws
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1846bc43c28so2450958c88.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 06:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793281034; x=1793885834; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=swEU0gDnT+Ur08Y/4gcNOqhZccm16g7AYsEas7N5VRQ=;
        b=r5oLrkwsBBfgVRu+clc7J/4z+MzrJ+IO3jDMn/HO5S6EwD3wkPMG2SDgQH4U/jpQU0
         MGteoPtDNjn6z5q49UiYyeo82qS79WTzHiaStkgmEnF1EOhWDKSIGGeo0BuiXaCiCis3
         ntp3PBm2XOVBv8wx+nnYD5QV/LjugGnnFEt0/NKtrKCYn2pe8Hvp5osnT8MbCzslJS/8
         Cy0qJ6gOhFCltfdAw/Z/E1IYuRnWE47+F2FM5c5+cB8iK5ws7caX6PJe7dinSZKIpxYx
         4ie18HD27IEwrPQOfyMm9RrSKX/ZHto/QLjyH89t7q4OmRpQGtTw8sCRGCdPYbgs4+FQ
         bnFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793281034; x=1793885834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=swEU0gDnT+Ur08Y/4gcNOqhZccm16g7AYsEas7N5VRQ=;
        b=xQ8BUA5ro56Rs5hEkCynIi+kcgot6Uoh6nigHRZMrVcRlVDu83pKtsrR79nUTqvjtT
         Dg17tD/2NPrsfPE9ymrDtkhE8+0O4dwWJ3vwKMJjq+AkP37NPVwNjEXelK02uooSY9RD
         NkXNMrFDPEDzAQgAoJe8VXEpSUf8gIN+qY3pfY+anlXP/WVJqwXY/IdkGVfU4EtN3Lpx
         X3i4H+HqrTOjeZoEKPtUOgRUY77LlUFPzUv2ycKCFl9SLl1GpDNKbs8VYB/hdY2y9GEh
         0yOkOI4ytJGMoRfxfltBhxm6N0niWqEc/XdfmyIleW7sLmxz5jUHR+3NWMo142rFnOU2
         D1uA==
X-Forwarded-Encrypted: i=1; AKwUvBwCfML8Bn3yGAEjvNotqFY3bPWIvM1lgXfyRwa0LB6cOrwARWhlRE0m7cJqTBPS9emFEgmz6LI04HCa0Upc@vger.kernel.org
X-Gm-Message-State: AFq9FYIgCwS1yXp6gyvGt3IWqC6tbrwqhKkyxtU1vI/VOTV/To3CVXLX
	BySJ1mtK5u6nkgUq81/Xq1J3QNrnZRwT4eyrc9sh5xT/JGQHp7ZXPbK5cas12g==
X-Gm-Gg: AYBFou1WP/DuEaIk4a2J/kTmsw7itQMoAT4xYSSVaK/E6MK2oni1WRS+GRXCCX4XpJU
	xpgAi4aH7DPK5ame1IYHoZI0lQ2piNbnVpSAOEdEDEHdYev+wg8MWCnZ3mHF3lSMhQu6fXMeQk2
	0bYgl6/2KNdHDK1dlHdaZZNG77+dbOEiccmTNbtuF7T6JD3mtx7Ku0LSPvoIXwK21CtZOmSJn/O
	ygdTyse6zc3X8VziBSOsnSXdI6fgLiVbu/I1NkpE744TOF7moTYUzhbL2VCPu9W+ry8peGLiSJP
	XZltGdiS4pMkETX57+zP/yFS0CbKcbJdZipyrHsJ+umT6diIguGRe+gL15G1TRWi1MAT10F6eG1
	zYpn8P/FXI5a0IHTI5apoaM0rU+xYo4aPUQHjVVosUWjWY/CMy1hegqlPOG9K3gq8zzg2iUqsAr
	2ha6XMbLXPqHHNaDjF5ErTTawNbcUkuwihnvhmhmK8ikA4S7Rcgf79ExIaZIdwjmHzsv14Pki0b
	7jrf1R7uaVZdrnn8qdOyPqqD1oZh00tPDUXQuqMBtZ4VK6FOGhJCGFmMZYFIymD/ofvPk7Z+JF7
	eJQi5/ZUDlk5g6kgubwKJtNzGOekjVcq9wGkXR5l2Jw/bWKbK7a7QQ==
X-Received: by 2002:a05:7022:c43:b0:188:e51:e86a with SMTP id a92af1059eb24-1a6c7d2be09mr5492426c88.2.1793281033511;
        Thu, 29 Oct 2026 06:37:13 -0700 (PDT)
Received: from 192.168.1.130 ([2402:a00:163:2ce9:cd0f:5122:d067:9a24])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75f51bdebsm17046239c88.17.2026.10.29.06.37.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 06:37:12 -0700 (PDT)
From: Ajit Singh <blfizzyy@gmail.com>
To: andersson@kernel.org
Cc: konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ajit Singh <blfizzyy@gmail.com>
Subject: [PATCH v1 1/2] dt-bindings: arm: qcom: Add Vicharak Axon Pro
Date: Thu, 29 Oct 2026 19:06:53 +0530
Message-ID: <20261029133654.6585-2-blfizzyy@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261029133654.6585-1-blfizzyy@gmail.com>
References: <20261029133654.6585-1-blfizzyy@gmail.com>
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

Add the compatible string for the Vicharak Axon Pro SBC based on
the Qualcomm QCS9075 platform.

Signed-off-by: Ajit Singh <blfizzyy@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index ff8a35df7862..02c0ebc3668e 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -472,6 +472,7 @@ properties:
               - qcom,lemans-evk
               - qcom,qcs9100-ride
               - qcom,qcs9100-ride-r3
+              - vicharak,axon-pro
           - const: qcom,qcs9100
           - const: qcom,sa8775p
 
-- 
2.50.1 (Apple Git-155)

