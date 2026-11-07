Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794018319;
	b=um45O9buViwueJppgEmO6iatNOr5FWS0ceyE9rVDWdCxSjWWzigR/djqZRO7uitxrdWt
	 Zy5jkjOSzferzQgml6TB1I9N9aQnSk1C6akC4FavlphtC4GQwMCDoKRok+h7Q7+74y7nB
	 mbIUME3LyhLOkfxVfHOC9CXiA5cJdKu6V4H4V0KPuSYsv/VHWk6boGzxCYSuI9ck02fER
	 MZy27fsL8m+0BqvNw2qR/LY8qhskww5ZaKU+xNCUtrtN+o4+W0t5MgFYuMyR31/0h70sT
	 1u8/hyilsrJcRLLvQs//gD4zNVUMkTzGmmxbaNwKDWtyFtUh8M8btNGk5wV1uOzHzWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794018319;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6go1USvOBSIXKpmuAnNG1AZzXz6zYvVdjETf+wNZy/I=;
	b=XJrdQKFAmY5HyhEBXdBLyZNakhY8cD8hgvzWz8XFY3Jc6jwlA4lJISbM4pob821Kgrrk
	 nMO1AhoiDa8GUeLRRA/eAwisaGiD4UI/vmEjAgGX9+z2hgcV0lGIBLZ+JhPCTlLPH258h
	 jx45lRktj+71JdSH+/yfvCGpknM94u0GyGH0yBPwe1vfBkSIuQqj1BXvUzrpG+bVtoFOe
	 HsXfBzbcCer4mrHmjYrMl5mKSAjjHu0ire8nCUmZdVXT2APHl98QCubAf+i7ZUuBKXz+7
	 uXEJgIkUDOPzXxU+Fv2FKA3Q4hxlyR+ozbdwUwf6FCip3WxMvVyhgoqJT0seA7j162Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KwycBg3c;
	arc=none smtp.remote-ip=209.85.221.169
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7FDD606A326
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Nov 2026 02:25:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7FDD606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KwycBg3c
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5ec3561b07dso200560e0c.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 18:25:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794018318; x=1794623118; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6go1USvOBSIXKpmuAnNG1AZzXz6zYvVdjETf+wNZy/I=;
        b=KwycBg3cH1HqVRW6kJ7+USn537IV3Da5g66Atl2Gquu0xboormo2pgUjXPRdJlb04C
         4YKWvr3kM08HShpURq3K4VuvPSVt0YCavDKlYhTYWcOB4DH6I/uJ1h9cKa1W3i9HVR7P
         AGSVhlFcXjBI4+sHhECBNAmCTpY9Uwg0gJrQhNVBUQBL4WjAl6X7tlU8Evl2Jc+zT2UP
         3bHl5WlJX8OAweqjEVhLsfN8dNjZ6xcLCdFWe/AqdeqF9bfTbVurtxzve8zV9ZuY6Cm3
         3CELI7dLRTJCuv+u1+F7KdpZh8PEuitufe9gAVbFk+YUSVlU6dFoEpMKPkByf142hStz
         rdvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794018318; x=1794623118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6go1USvOBSIXKpmuAnNG1AZzXz6zYvVdjETf+wNZy/I=;
        b=VhWuJuFtmCqWmtXtA9qqFuOd3QU6wdBoyTxFhlQi2CYsqkM6J/w7RG3agK39wxUuAc
         4PAAIB3gF2EkiBCR7TrYN4DBe90c+nPlxU6TcDmejxafkmr2xDjk4WxiJaDteIKMXSeM
         rhjLd0jDoHuDBl0bRqPxTc9+ovfc97g5/wnVXI+Yy0LOZal9x/svnOYOkspXIpaEogkS
         9U7z07VPcZZf56BDM2Yfv9/rpdS3PwloSk0KGg+IzxUhEz6nqGLRxmjVyyn5cncqmEnu
         j7tNQSnrh5sFSi077d0ykgny2Wn5ug/OeADCOJzTvcvmWCuuIOcPqcu2mBMuJXm+GlFR
         PSVQ==
X-Forwarded-Encrypted: i=1; AL+hErHHkbj89qhOlO1EsUCQMwDO2a1Eaqs3jQPZTIZPHPIu/OHK71UKLBn26m/mWq5R8VGU46SmcwmIyGemtRrg@vger.kernel.org
X-Gm-Message-State: APuU4Z/EbdAxNgmFRcZREN/n3ZFrgZatpcCC5bP63WLy/NjLb69htbZ1
	S5qWMt8EUoxJjuG/2rv/7GAowsqs9dFXW+Ln8A7DjgCn3ECTnkrOMpPe
X-Gm-Gg: AYBFou1+Vw58jsjWTa+f7crLORUExcgsJxKXOBzhiKhd0Lxi7bqCyiNF+9NkUcwX+lV
	l5tBPFhLHt9D6EbrDe6B0OXy7RuSZZstRMq5cIim7naW9j9a0bmsnxEA4joJpv5goGLH8xvjp3E
	keicDiMkxmJZ7eIhi5EgFm7E5aQnTisRACJ6ZNpJZ1DhteFBDmUoQsRjYxBo3SafZk7m2roKMLm
	cG47FUpM81+QyQq/WR0QhMu2Rbmhts8w+zksNs+YREHaZq9dreem0hgwwDqfKSWsNm9oJ1LljOV
	v9L7BPVjq72pJ+x11YIckX6oo6pTP2E++fuXbh77EeykEmDQYAozD7nxujjJm5Vc/yq6W2Ov4gM
	08hYKO5qhwe0qUSKb3/opUgQrNN4WZGP/7UqJa4NsPCXWGDrFr8UiULVudUFsgn41EnZKUjGZWT
	s3+LVse0PqcO5DW/BrkS5Ee6JJ0abxZVkWeTe+aVlNRiGCUf5dZd6jSw2olR+ykSnF3KIbLRXT2
	/YOuzQsakVsV0ZTqDp6Khm03bX9q7vV4y+pEg/QluiggqPkGggJGdby6DsQ2pIqikW04859/o/X
	FJXuYT4/1ASolW/SgMaPdCLosNS8
X-Received: by 2002:a05:6122:1dac:b0:5ea:aedd:6077 with SMTP id 71dfb90a1353d-5ecd1b5db23mr209349e0c.5.1794018317800;
        Fri, 06 Nov 2026 18:25:17 -0800 (PST)
Received: from localhost ([174.93.36.89])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ecc64ce125sm2548910e0c.8.2026.11.06.18.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 18:25:17 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Andy Gross <agross@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v3 1/9] dt-bindings: soc: qcom,smp2p: add sleepstate support
Date: Fri,  6 Nov 2026 21:24:45 -0500
Message-ID: <20261107022453.159341-2-mailingradian@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261107022453.159341-1-mailingradian@gmail.com>
References: <20261107022453.159341-1-mailingradian@gmail.com>
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

The sleepstate entry is used by Qualcomm sensor DSPs to control
suspend/resume operations. Even though there is no full support for
sleep states, initialization of the entry is still necessary for some
DSPs, notably the sensors-bearing ADSP on the Pixel 3a (SDM670 SoC).
Allow sleepstates to be declared in the device tree so they can be
initialized.

Link: https://android.googlesource.com/kernel/msm/+/91edfe5385f2640a338e2ad230d0fc03c73b77f8/drivers/soc/qcom/smp2p_sleepstate.c
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,smp2p.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,smp2p.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,smp2p.yaml
index f91276822858..7862d68c9678 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,smp2p.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,smp2p.yaml
@@ -60,7 +60,7 @@ properties:
       Two identifiers of the inbound and outbound smem items used for this edge.
 
 patternProperties:
-  "^master-kernel|slave-kernel|ipa-ap-to-modem|ipa-modem-to-ap|wlan-ap-to-wpss|wlan-wpss-to-ap$":
+  "^master-kernel|slave-kernel|ipa-ap-to-modem|ipa-modem-to-ap|sleepstate|wlan-ap-to-wpss|wlan-wpss-to-ap$":
     type: object
     description:
       Each SMP2P pair contain a set of inbound and outbound entries, these are
-- 
2.56.0

