Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 187BA42E8CC
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 16:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786380974; cv=none; b=tTa7XiOEulWAN6my7KbdaZuh1tGw/oWjxAw4n4eQNC9HFfcgIH67KVE/P1mBTGc9FUgVXSSQtuutXgGHdLCG55DSIRv3WBM9/9wEiATQ8NhP6hUeJw2gXVcmquHpc1EH3bMKVQympmlszH4eyCyfbpRmqquzGSQ1HX5bUCAG8fY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786380974; c=relaxed/simple;
	bh=1SYlMirSvskMxjieAuqurmagvIfN1UzuJsj9AZoY2tA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lnifktF6UQq2qkRCWwSZiDTpFliINmEWLrtKGqGj65Ie/hRwfFzgX8pb2018OMg5utfObHcbRbmLTIa7fKrH/7KxvEasiJNnqcYM/GA99bx5q1hhDiyeD087BsxT4gvVvAYmFhuINWAsEn3D1sXGP/3+7FVYFC0N6goWKGe8cI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AAhrPJon; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AAhrPJon"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49553515a8bso32971115e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 09:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786380971; x=1786985771; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2oiq43xN/9r6N67wuOQuSc1w14BdYaHpgY6CuLp6gzE=;
        b=AAhrPJonA7OVSdn0eK3UyMAR0ckYyc+zpEnXuBx2l8/JqHgUrFbmH9cMqCok7/kd8h
         KFNj7n9Vi6cMoga2HmJDx7H3tOt+8VEn5pVEv8lLqzl+E0Cn1ovvAeuKCGrPrPTgcDgk
         VAeMjkhaHLzZ1b6a+sIK2486nkc/z4QlKcrx4XJI6zx4jn+BxkY9uyh5b4Y+Qsj1aYCs
         HVizKuViAEt80c4LFAPRktuFRi/xvI/5xZDxzISChzErFpvvezlMkxyy16SXOz7N3PZb
         B/ZW2R3/ISq2+3HuBIY/VKBnUIZYUFpSVyBLcu08UjQiFOA3Oie82FIXl0/MhOajG0ON
         Cg9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786380971; x=1786985771;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2oiq43xN/9r6N67wuOQuSc1w14BdYaHpgY6CuLp6gzE=;
        b=kKWX+6iYPfh+jJ+tzCLhrAngJPo41sOUBYo4NTLHpPGVfTLQPXMO1qgPvvjXJXu6TV
         L6tTSL/1gNM/2TfpdtiAcL68xGolcGTBaomBnPIrdMTv+2oZdo/cyDp2wJ3F4+W8EZIC
         UiYabUl2SWzsnoJxpt1hQXLOHHI62fR7ttGNvZbUMzRwb/tbDXYh9pQLFZG7KrmfTTw4
         21atSg0btgSb3jmJYohlpRPuuHlX3RqvpaMvEvFA4MZx94AqMuAZgfBAQg5P3R5ViDP7
         PA4mlPKtu5p8aj4XEagQ2s79HDri5KfL3s9iHKx37o6ryDYc1FIXtw74MAN4322/kDV5
         iPMw==
X-Gm-Message-State: AOJu0YzsgfjNevkfBFuNNxhMQeTpmt/6ouzbAZKmd5+6DwKoxbBxyR5j
	j62eQ1mjyxnQDR62ZsQT951tJFqFBSLDEQPm+UwaMyzOzLxi6D/TDGiJ
X-Gm-Gg: AR+sD11RYP2FIgAuIUVV2O22JWjEu34uLVOPvyg6zSWg4z/V6ZAaxDX7LBdhcwIW7oe
	6a8QnE1Dl3LoWAWJ+udggB+4MAaWzpI39+HD+uuP7uGg3wsS+PB6hlZlUdgCXqpYOEVMZlDsBSh
	QmYq6XWjZUhgEiJnLZHeo9Qvt7P4QwH+TfMN3AlBhcd6rzftuRWdaSmMcf6q4H1uE1R6h7RN9Jo
	/Cq3CJgvMTdIiQv7XZqHYbCfAELmlN0J9VVA4nmidFCjTJWlhKO9lv5dVc19mHKV+f1S8Kc3/kf
	BJjhlxzkXzyy1J7R3aKmp7aQll87hZA/TWFVy2FxnfTk6Debi5qHdgvfuNPXNV48oP/Y0gw5mS4
	RlvUK7AYxq4n57DMFHKsLr1eGYvLgUyeIAtFwOJzs4mH4EytB+cgn5NBofdXKld9LTBu6cSTF7J
	1Qs9rWUAFk2XO9uYInqYUCWJ+ddI03NhC6OCiWuPGRY9ak9DvwCDCiYgw8Rk6OzzO4sXRJ5v89d
	2J/pyaICR/mKipGnJfVuftm
X-Received: by 2002:a05:600c:3b04:b0:490:c6c2:52 with SMTP id 5b1f17b1804b1-49959e016f2mr415589885e9.3.1786380971109;
        Mon, 10 Aug 2026 09:56:11 -0700 (PDT)
Received: from [127.0.1.1] (83.31.73.193.ipv4.supernova.orange.pl. [83.31.73.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995c69c8ffsm238472635e9.2.2026.08.10.09.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 09:56:10 -0700 (PDT)
From: Adam Skladowski <a39.skl@gmail.com>
Date: Mon, 10 Aug 2026 18:55:39 +0200
Subject: [PATCH 6/7] dt-bindings: arm: qcom: Document Xiaomi Redmi 9T
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-next-patches-v1-6-79a779d76173@gmail.com>
References: <20260810-next-patches-v1-0-79a779d76173@gmail.com>
In-Reply-To: <20260810-next-patches-v1-0-79a779d76173@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 Adam Skladowski <a39.skl@gmail.com>
X-Mailer: b4 0.15.2

Add compatible for Xiaomi Redmi 9T NFC codename lemon which is one
of variants of Xiaomi Citrus lineup based on Snapdragon 662 SoC.

Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 68542f76df30..5363efadd4ee 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1035,6 +1035,7 @@ properties:
       - items:
           - enum:
               - fxtec,pro1x
+              - xiaomi,lemon
           - const: qcom,sm6115
 
       - items:

-- 
2.55.0

