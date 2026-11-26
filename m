Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795690655;
	b=vP7HkPXZK1vNZtW2YJQ3sg/20LoGx6ArEES0Kq6o5+kAP5NMKQSDy1PwgeGyVOBdeqES
	 F/J1vqQqggcmtHql6sSsbJoHxI0Ekk2cjeowvOas+wPzIpNOli8RomvqySSCa8RL5UUyF
	 kuHJ5UNzJKDu7/onTPqyYKutyHs+UeejnIVSAqB6XTt+2j970UlTtAKSHexe/VgOObONV
	 RDMCxHJjd69c65k+NhFevA79xuC4yuyfqI1tY3UyaxGbKZrFAWpFTtB9qPb8rVntwnuL6
	 jDHN50CYo78fHIJp3zmLciTaqC+zzsiHOfif32rcKpwKmF3fMjw1+iiY+FfII2njJPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795690655;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=fvn3lBMX5MydD9DJQOAImoBkowZi5lJ9awFgwMmdHps=;
	b=rMQrAmj+GFElPhQtwGp4PtPJXgw1rmLe3G7GUDpBNmIrxYgmQFlrdJUc9sU09YlUVfiL
	 RGOK0qSqc9dsAzc/PVkW9XwJSWS/dMzQkNw2kgP8ueqEGEdE+R8K5rW2/5Xm94I8FmfaN
	 zRxEE5INAqFTgf798LHsT6S4x42rpaR7KYz6/ZQY6UJVYGYSfjm7/cvdJBa7ZwAhPzNAL
	 TyPncoJQbVABT/nWICySJPBB4xPDGijLMyLKzoSoGMOk8RWRmRv9OQwgi++TwBS0R/UTU
	 m/gvfSapqg8LTLUHAugwkjUvLL0SYct/cqKRG5tsySiJvM87Qn/tzM43wIxXdQ3eaYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ILWTfFbN;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81847606A31E
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 10:57:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81847606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ILWTfFbN
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4a358881793so3592908f8f.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 02:57:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795690654; x=1796295454; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fvn3lBMX5MydD9DJQOAImoBkowZi5lJ9awFgwMmdHps=;
        b=ILWTfFbNDkkw8+O1yE1aopgD+0hagvJeY+OjE/0gfhxb6kFaB65jSDFoqIhxxCQB4E
         2Wbz3SQSIo8ULJmYiAwyM5M5j79qsgYpJMnmGTTLsZtSuYqJgBFBOJz9LKVjtxgqioTv
         KtWkCchbaXA5abyZbWzbm9ZJyywMGjMlo4e04g65DcO7T3Hn3pkT7JTC3VLq3crW4A/G
         otrk7nakCXceynOyhAGmCyDJ2Hs3h12K4VjRSmzF/1GOqSZKHU4lH1X7CYZ0RXiSQdBv
         LMQz8YsR8auxX0I0p7O1uLcxqJMxVmvzHMvwaDs46P9jkxzY4UCgzcJJJAkqQQ2llJbP
         70/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795690654; x=1796295454;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fvn3lBMX5MydD9DJQOAImoBkowZi5lJ9awFgwMmdHps=;
        b=013DQzHZHM4FMojbw2ePxTrIPArLZq46dotFA9r52e3oYU08PhUDdwSElupoDwlU9I
         yegcOEUbFn9u+pDrQalLn9wnM2nBNY96f4ZrS+oBD7b4GzKUvA3sTmuZ82BYL4qUu+Oe
         Frdf21w9ynjR7egRAM+HEv7k+ZHsLeMzlzI4XWPnFPhNh+z8QV2Y09PcazTeztXJK455
         gr6caLSJZh8E0UXrgFb2OkvWBDNUeF+diE/kIRZadV4Wge59J1YG4B/K9OEBv6WkmkqL
         OuDQcuDmtkA9XPbL/vOR8l9weLOHQsIOtI4arilWvPjlcbkoKTZwkqxzM7B/5rttnmeF
         6WDA==
X-Forwarded-Encrypted: i=1; AL+hErG7K+Jdy3Ii8H7nbzAQuC4gMfKiPLz1F4mznQ8HP4YRnB3UfPEtKCMl3DWAm+d2bLDYv/rPVSc6w6OW+SoJ@vger.kernel.org
X-Gm-Message-State: APuU4Z+3Ry78h10YxUhMl9iuGrddv0oXzt56rBwvUcbr/RVHOsV7V3CC
	ykjZRIKN0nGrwH7vZ23bfJNck3ty53g6x57aNxPl+CSV0CRHujvhZrCZ
X-Gm-Gg: AZFdTZcRxj+mz4pe5Raz2qlO0GE+tSMSOEcloK0UEPTMFpTV/FH9OtHIWA9TIM88PWT
	GEO5sUpnaDAeJAYQG0Wb4wNZMPTFSJvXInVFkTjYNumkU7u07tl2q4PA4SJodIlFbmarRCKzCrG
	jkSNkiwtY0Ujfv6m524A25hMqp9D4nJEtKo+dM/0UEXYXm5F8q4lJ4MDq2QSoq4ETeEsTPVUgvt
	Va1fg/syC6ElDZeaPtPOE3spUd4mjBgrXrdf4j5J56TQfsvogdDVi+eNiAOBykIRkOmdLRv0wJ3
	P8ligoQTaMtBACPnXyBei0R0M4HRmG3h9aGjmvkH/W+EdvNqeaEzd3Khys+ntRu3hF4zsArJxLD
	tQGzpcHnlc0WFRjbL3wfdFAyeM2gQ/j+6FGgz1sOPjTcC62i2Ib9khjAI4gp+uGwgRuVdxD9L+F
	IJDdIHChAZuJ5+YcE0xkUQmzlB436qFBoyePlPZdGd6HSJMMFD0LJQB1bWn1j1vIbiQ4DcZVfbT
	EIUvENalQbcF2dIEZMnWo3vXes1zqJdsC9K2d0kNVgJxl2xZfYymHQCcyQatp0T3jIhzfCH4Im0
	UpzUV+4YT9nvJ3WY3m5E5y85IEp1Jwv2wlAWB/T1d+uC1SccOUjoQxUmZq/kRl4wlMuMezcVnRe
	4yRxHOmQLt9JFciyP5oUmIG+EQj6wPgnAxAB9+DokhlQSs4CTcTUach3KgmzJQoB9y6RL18hzzj
	PNepRWGd0Z0EfKalSq2g==
X-Received: by 2002:a05:6000:288e:b0:49e:4ba2:a775 with SMTP id ffacd0b85a97d-4abb86e50eamr40097978f8f.56.1795690653563;
        Thu, 26 Nov 2026 02:57:33 -0800 (PST)
Received: from threadripper-fedora-workstation (d-zg1-148.globalnet.hr. [213.149.36.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b9add26sm40336850f8f.44.2026.11.26.02.57.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 02:57:33 -0800 (PST)
From: Robert Marko <robimarko@gmail.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	abelvesa@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	agross@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Robert Marko <robimarko@gmail.com>
Subject: [PATCH 1/3] dt-bindings: soc: qcom: smp2p: document WCSS restart kick
Date: Thu, 26 Nov 2026 11:56:50 +0100
Message-ID: <20261126105722.188103-1-robimarko@gmail.com>
X-Mailer: git-send-email 2.56.1
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

On IPQ8074 and IPQ6018, WCSS firmware waits for a new outbound
doorbell after its inbound SMP2P entry returns to zero during a
remoteproc restart. Without it, WCSS does not raise the ready
indication on the next boot.

Document qcom,wcss-restart-kick for SMP2P links that require this
additional doorbell.

Signed-off-by: Robert Marko <robimarko@gmail.com>
---
 .../devicetree/bindings/soc/qcom/qcom,smp2p.yaml          | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,smp2p.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,smp2p.yaml
index 7862d68c9678..5c90d9db8f73 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,smp2p.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,smp2p.yaml
@@ -59,6 +59,14 @@ properties:
     description:
       Two identifiers of the inbound and outbound smem items used for this edge.
 
+  qcom,wcss-restart-kick:
+    type: boolean
+    description:
+      IPQ8074 and IPQ6018 WCSS firmware need another outgoing doorbell when
+      the inbound entry returns to zero during a remote processor restart.
+      Without this kick, WCSS does not raise the ready indication for the
+      next boot.
+
 patternProperties:
   "^master-kernel|slave-kernel|ipa-ap-to-modem|ipa-modem-to-ap|sleepstate|wlan-ap-to-wpss|wlan-wpss-to-ap$":
     type: object
-- 
2.56.1

