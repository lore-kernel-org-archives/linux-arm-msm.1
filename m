Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7A242C51F
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 16:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786380966; cv=none; b=lnKiVAxEZhq9aTUoJe2Mk2bQFYtvwzrzOAt3wxUaSiaI3ahJ3ytzu8+OMXUyul+t0uVZSm23Eqep5ewMhEfDI+4SfxxK25xAoGo4o/2MoXESR8lCJiWXUia2lqVx0gvppSIpYvTR1sJWNaB7MaGCM+SNcJDNjJiGU4FvQpElv8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786380966; c=relaxed/simple;
	bh=1QK3cTT2t5BsbTp2CghYM4pnPFZxEX5FAMOIRXPEdno=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=swpTt8/H2Y3ntANtjsJU/6cZWB/cRw6JA3TJIQAn4nGw0L5uVs9XAFP4szSebfsUjGYwEWHuWnsspXqqxKKvr+enMaaKzzroleUKcHd9OVEnDV4gkoTiIbal7zevy+TzU7M7fq57a9HI2vBUOUPM3yZWiErNtYc+50reOfiGP7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gXK4250D; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gXK4250D"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4954df200ddso14227495e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 09:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786380963; x=1786985763; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bsOwVJwKnJHY2ExLl/CYmRtzOXIqsyEdBUQGA5n++9Q=;
        b=gXK4250DU5xEwzstcZMuP6zi4jo7P3WkZhUYSKiiwGeYCc7ZtGOrHs+vOQxksIm9HQ
         YZ/q2japhMkqhGeBBpU/ZkCthSrkuO8OHzb6rSo+RC0Hyf2QQfG3n4sYNwSOFPzpfHYE
         xlkMppRGopi0A14U3CzsR9UWi3qhHKjQChEUN9tbkQsghDU84VJUH4GXF1rCAmRS8zQR
         qhhonx0F09gvH+F22dEYgw+xwBJHIzYV/9qxW+kxakzT61zNg9Z6ftCyBugQeGWlpNqX
         JmsP7FFOzY3DwPASMm3vIkR5Een3jOY1rAIzBMipF1olArGNoC+U/o/QaGAOpkF+jaye
         SGjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786380963; x=1786985763;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bsOwVJwKnJHY2ExLl/CYmRtzOXIqsyEdBUQGA5n++9Q=;
        b=FggUjwW7KmcpS+ef56xeSe5Fu9XYQBqT7NL5/WR0t1vdqysIauxCj8kX7BLRsFLCX0
         5vvdRz6yAtL955nybsHw8lYNcwY5H6ESMZImjEDDlu1eNfJvY9w7MNuRQULo4XX1fHGb
         WMRfQagyknzac6QJ9I3N1sEzZ1dW/qxwLEKlP94oVC+wRYxDM6ViUVmS24SM0U5PYI5M
         2ZIwKon7WWrTf+6f0t2twbsyWK8+BJqOtJ+MGxU8Kk+LeCjFl1BX4HjJTBq2ISlttyRf
         4S2M5liUjyN3SbFPo5MoVd0tlZIbhMyeJjo+116UNH8yM15bzUIxJp2fibg+YUsjEUF/
         qT9w==
X-Gm-Message-State: AOJu0YxEmL5ppyIsH9N8pI2FILbjdD1dS1DZKwwlq3kTPIS87z9//d/7
	Dpsa9ahQ8oxZwi90YEeQhPe7ihGrugD3D/GILzgU12fSPvTfHgiloZi7
X-Gm-Gg: AR+sD10IeLLZc6d1avxg9VDpm17LGTc21VOUHcvG4ffUG6Jnw+ShZYSMOrg/xXg2t/R
	16iBzxde6M80ttJLcQbhZ2CjRS1xQQaFQevEMkT8SEtO2G1IC69XdW71dmn0r1kRdHQumOSQ+J/
	zmc8Ttvk4riGSS1vGxIbAJ1EVmDQN5+lR/DYDhV9LN1yRL0EVvml6JRaf1QN046+g6CLOWMP4QZ
	i4UafzNDJ9xT2HH/wdMVC7cjxeWInwrcirbaSdX2gRrwcadPtdih8dNGIOEx7cAR/hMElbJhWDn
	QB8UM8EhCW/iF0/3WDOR3BEOoB++J5PIo+oAFquWW0DiJJlf8seWYaEyVkIZaejvKAbqT+qNwRI
	U8lEZUsr/rOgcNk2VtfP3vWEgN+/4r+CN+HnzGsPrcStPuxvRElsLWxfsmNea7ikeW/jreVwv+G
	TORsASEVu0CzBeGiupz4ojxbkcJd3w9KB9NLTThQKLbBfD8r41tnAmSJtBIFRh90ky83xZrG3pq
	FMc3fWZYmDn0NBSwJSXuR7G
X-Received: by 2002:a05:600c:5489:b0:495:6134:6d61 with SMTP id 5b1f17b1804b1-499727d853dmr45181605e9.19.1786380963049;
        Mon, 10 Aug 2026 09:56:03 -0700 (PDT)
Received: from [127.0.1.1] (83.31.73.193.ipv4.supernova.orange.pl. [83.31.73.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995c69c8ffsm238472635e9.2.2026.08.10.09.56.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 09:56:02 -0700 (PDT)
From: Adam Skladowski <a39.skl@gmail.com>
Date: Mon, 10 Aug 2026 18:55:34 +0200
Subject: [PATCH 1/7] dt-bindings: vendor-prefixes: Add LeEco
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-next-patches-v1-1-79a779d76173@gmail.com>
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

Add vendor prefix for now dead ecosystem company LeEco
Link: https://www.le.com/

Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 136681412501..dd0762d3334b 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -947,6 +947,8 @@ patternProperties:
     description: Shenzen LC Technology Co., Ltd.
   "^leadtek,.*":
     description: Shenzhen Leadtek Technology Co., Ltd.
+  "^leeco,.*":
+    description: Leshi Holding Beijing.
   "^leez,.*":
     description: Leez
   "^lego,.*":

-- 
2.55.0

