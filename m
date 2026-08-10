Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4591A42F710
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 16:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786380968; cv=none; b=IFJ6AlLJaLrk7juPZGeLMrOB6TFwbGQjHZVelZUGKQ9dd0bt2xqOOauZddVUA1I9DKG43xhJWKObWCCxGAsCaYBFTdBsPEtr+bDHzPewndeVeNW/oEl4TTnBBmHXVohdPATjgCvniRtQpR5KWq3Z088DJ9zR2uDwxWolgtL90i8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786380968; c=relaxed/simple;
	bh=GvnbzUc8c9NU+oo1TqfezYXxZP2QutE76bVHLE6Elxs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lea9ASGYOS5JAr4evxICRtiPWX7FHOG6Ko6Zrw7A+5vjnMinpLlNjXWrcuPXWoPl7Us6+yjfl4insuiKdFGM62Xd9pUkmXdrvlUZvtZJaHRNSws3O0SiVGcC92jhZnupudSL5S8BHL8C7wGiazHAOQZD8cg46NKc3RHOc3hd5cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G3heZb5l; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G3heZb5l"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-495437bb891so676215e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 09:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786380965; x=1786985765; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/iCLTOXabaj4z0hqf20GvwqmNfb3co6JWnXenjDC6Bg=;
        b=G3heZb5lHuZFsxw3LyHqIqDCLEVaBl0V7La+p40ULfl/mL6BT5XmPyjlVrIk9ShCP+
         Pe5tvQighSX2/XPN7JbBuZQ4KaBOdScIW5PRnKDp0oI1AgNR3Yj2/hd+dVxxaLwYQU64
         BUl0IOB4E9biLkjNQgtblazMyog3Y1FRnWW6SH6t0HfCF3ndWnAIL7rIsYrm8HWk09km
         prdXAnM6IPPM71gnzXwl0umVg6t8n46HlesoaabW8dr1GgDwPetSPzKrUhhupqoq7595
         sMRfBdxHgrDxYgWrTLcatt4LQz4EjKWjBDm4Cxqq9HRBiDzbzRjtxVWxUVu2tKpiN4Kj
         KPmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786380965; x=1786985765;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/iCLTOXabaj4z0hqf20GvwqmNfb3co6JWnXenjDC6Bg=;
        b=sdJh7sIpyxfOvk6exWTH40ZZkveQUTuPAqKWya+gNWxT+YRbYnMoXe/IHF2l9Cu69s
         iFeQgxbRtCz1q3dRgx3xdF9JgQSuA2LUDnudz9c/8UxRBecGuVuvN1qdDIvSPw9vXxNd
         2q+PuPlV7ixoEqkro+41rPleKKgff/B66sFHuuupWNrhVRbaXQHBNSrDb6Y93a+Ky685
         VVwdgvtJiE+BLrWSNVgk6juUArJCEwkYjCoHKYkbTPii4c+WRwSSlUpFtMXORZ3IeRd2
         4BcNjQxO5zS3fPbBX83jAqa9QfS3ZQ3emzOSZDvoxXYXazqyW9LzrliubA5I7F00QEwv
         Ap+A==
X-Gm-Message-State: AOJu0YyC07zqbzTKbH7Zc2cjuCGW0IQLsAZOwhrhG9X58b0OLVNdihQs
	LUukgZ+TGEkYisAuRhz1jMoaxcokZ8rFz2p0tN84SxECgt6K+xPCXn7l
X-Gm-Gg: AR+sD12kA8WMYkDv+V+XZMyyZQzAgsathgwrNuNVnqJPrPmfG/MFQS5cXUA6v0bIZiW
	K4Jv5ScR3s6Zst4PsnmQCJXK8kevVIC08lmzlQWgFvlDtp8WiKtZy7E84kWTXQeZ+0zali7Vwqr
	EoRPqnkQzUyYRlgl5neKonYfKCCb/VYq/5O8xXj+5sgxT1sdMlJ5moZNBNbDMLR9595A98gpog3
	n/TCRjgshVvqVlORYB1q5guR+Hoap+vCJPLi7aFz9tuOJlDUOdVxL9EFL6sIHr/AX+NbQAKKV1/
	2KhyMOl7qZgi0ZBYgWUPLuxi6eoRg7iXz1iFtvWLncy4LK39AL12q6gBrcYicBbxsgtkhPq2jBz
	qUQkyEjU+7qWCvAh6V6hisnpIIqh5pmgIV0vI42oNOdoXQxqKJSwAUbyRbGdcC7AGona6yYOnTC
	XFYeXacWbObx3pVWc/0ydqfCl8HBuRDk7r7NzBieYqBRiP3v6kSvGuRwwl86ExChfLc2CIBkXab
	7tfbXN/xHxUVd194M84aik6
X-Received: by 2002:a05:600c:4e8e:b0:497:ff5a:38b9 with SMTP id 5b1f17b1804b1-4996247e640mr230932455e9.9.1786380965439;
        Mon, 10 Aug 2026 09:56:05 -0700 (PDT)
Received: from [127.0.1.1] (83.31.73.193.ipv4.supernova.orange.pl. [83.31.73.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995c69c8ffsm238472635e9.2.2026.08.10.09.56.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 09:56:04 -0700 (PDT)
From: Adam Skladowski <a39.skl@gmail.com>
Date: Mon, 10 Aug 2026 18:55:35 +0200
Subject: [PATCH 2/7] dt-bindings: arm: qcom: Document Motorola Moto One
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-next-patches-v1-2-79a779d76173@gmail.com>
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

Add compatible for Motorola Moto One(deen) based on Snapdragon 625 SoC.

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

