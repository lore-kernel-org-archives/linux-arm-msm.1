Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D2B2E542C
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 07:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787296363; cv=none; b=BGnTANCw2WJjhENElXiNY43AdcRrdTdu7X6j9WsWWHE2dT3+JFqMbuhJY2wmcitCdiv4FBEgG41qF7yAfkQ59HZ7YK40qO0FcgKsHu3eg15ApeUr/LnPSHCLH3m/V3ES9JytRXcPnpG97c0DoY8y4R6V9Me8Hjox5cGg99yq+q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787296363; c=relaxed/simple;
	bh=tvgIcEmwbkn7e2pPKun/10FnYGAhaEA1A5qBEsJ80ug=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j4+2lOh6z21xlBb/KM+uxmNBxUfrqDV7we7IN2Ah6zsGa63gWEOfzcvvWr+1nuIhjMfA3rBXlx88lJrlDRIv96CT6YSENqMOIkvBCnzeyATv6VDn8Y7FJPLA7dLMSLvX0C1LGyx1ASPvse/ftD90S9w69oz0+UtPKXfQt2p4UYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=BX8rL4BF; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="BX8rL4BF"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6a0c8283146so1396311a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 00:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1787296360; x=1787901160; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=csXrgEgazCRDtxpVG8iq7b2VnqPzoGLj29Ecu+sqIh4=;
        b=BX8rL4BF2KzdKo2v8EJoEPme5dwe8SAZiAl/9I/h7ObpPciIIJTt/ZMe9DEDn6UKaC
         svRc70vwEwvcywfoSsksP5Es0ckoUWTnpdQBE3rgSUYoGMRdTWf2o+AStDEoNZmSf7H+
         fPkLenJNtti9sLjwpzQVBFwPCXwrSOaPJCWUPkBnm0St5wYr1p4WfdEa2yU29G4gfKCw
         1gFqEOQZuXuLQD1FkqyRVgjNGbuahA6KaENd3UBAW3Pe9cmdoh42vtFKT+Vk2aGdFnEe
         wjxudr5BkISG6K4Ys6S3G4/z1x4ovrRGTuae77VemB7gGY25rX90HyhawHLCHeRXDQ+B
         z9wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787296360; x=1787901160;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=csXrgEgazCRDtxpVG8iq7b2VnqPzoGLj29Ecu+sqIh4=;
        b=gZY3eAmtf5YpvQ3Q/myisQTtOXwWkWzOpLkkbZ8RCu6SLHYYF2ElFeJ2INmpMncDzl
         WLvdXIcfuSUWLhCyu62HRsaYlufzwKUbHSzhE1+pFhLSeFfC6llKCBI9JmLA3hU8GKXw
         kx6MlSnUB6BirMG7Q00RX1kkwwSDel6a/mftlj7JrK2K+vtwW/m4c6JRZHwKEyRrEQI9
         gaWSrIb/fzd2ozRtQSvieLUfXGi6yGcI3sOx76chzLB0nDN3TdLEmlc+4tVomv7MfVWj
         J+v071ZtGFypqFJqudmMtNSaClb2OWr1rom0kHQGUv31Cwl3c9prLxuR06h1/xHSFCbO
         dS+A==
X-Forwarded-Encrypted: i=1; AHgh+RqHN/gmAJNgkZXZvMw1Akx7hx8OMMxZJOX3LGQIIR1QeEjTHTS0Az2brzNat05+dKQlk0WFBV65dYQQwZ1h@vger.kernel.org
X-Gm-Message-State: AFuF++nJTkSB+qM/qEx22bXAixLhF646EQHztSubaI2nXeTKJ8H5CfrY
	8QT5Vom8CFc/XLAIVJ2CkU1M2S0mMp6BfAiCX+x3u0kdoBWHyzscoxb6KFwRAy81Pt0MoTnVoXP
	zY9pKfM4=
X-Gm-Gg: AR+sD12yOocPv6XC9NXyZ5GUt1YUwqCAL2jhk99sJOZO8ZWXpBb1OYBxjGnjDpHQ9+X
	QkbKwIG7r2T0La97Ai2vrsknYi1kNLoU0O+DPTQ61XaNWaTv1GVzbeILR8RjzgYovp4zeIRwhyn
	pDPJzbk+eU40LzKewlaMMT+sDS2VipZZDs1qk5D2SvxZBqV2BJoIin7LHME515r3e9sp6P3oDhj
	LYjvzmXn87ztwBjVNAff2+QqSBFnPIuInHAim/aI4PuC1aZkMg9R3y+0BB1bkIDzuqczdB+avsg
	vNZcxnwosF5tHgJ+rFabhkZvaTcAXA8lhFmF70yxt5OjEfpvyNdGk2suI10F+g/n8fMVHkSJ0Pt
	T8dpvxC44bQxV7hCaeBoTQYzHNZinDXG+NeKXc3QOf1I0ww/TO3K+7gv48DtipuzLs+37RsAZUh
	YREk+/MZ/nm69zZhmfagfEs3ZkrluPE91h9yv+sSEvhHaFjHemRQdxivqigs6arJ3hiAKKOoUkx
	cjCe0nKxOOW3I7Mu1IxYKO1u7XUq01CYyfwst4gYh8=
X-Received: by 2002:a17:907:961d:b0:c24:469d:5653 with SMTP id a640c23a62f3a-c246a653373mr384101466b.21.1787296347585;
        Fri, 21 Aug 2026 00:12:27 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24589e04b5sm339431866b.5.2026.08.21.00.12.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 00:12:27 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 21 Aug 2026 09:12:18 +0200
Subject: [PATCH 1/3] dt-bindings: touchscreen: trivial-touch: Add Himax
 HX83112A
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-fp4-hx83112a-v1-1-474941bd8860@fairphone.com>
References: <20260821-fp4-hx83112a-v1-0-474941bd8860@fairphone.com>
In-Reply-To: <20260821-fp4-hx83112a-v1-0-474941bd8860@fairphone.com>
To: Job Noorman <job@noorman.info>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787296346; l=1037;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=tvgIcEmwbkn7e2pPKun/10FnYGAhaEA1A5qBEsJ80ug=;
 b=5UI9BRap8wYkbwAe4UYWWdiFDrjr2MCLWHh+epySaUfuTZuusa3nS5sWs8RdUGwP9akCuISd7
 BhB+PXXHX/BBwllIwqdRqub7ah+wgkBTgqZCRFQekyjkihxPc1LYIKO
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Describe the compatible for the Himax HX83112A touchscreen controller,
which doesn't need any special resources not described in the
trivial-touch bindings.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/input/touchscreen/trivial-touch.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/trivial-touch.yaml b/Documentation/devicetree/bindings/input/touchscreen/trivial-touch.yaml
index 6316a8d32f39..a4b535bdbd6c 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/trivial-touch.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/trivial-touch.yaml
@@ -18,6 +18,8 @@ properties:
       - azoteq,iqs525
       # Himax hx83100a touchscreen controller
       - himax,hx83100a
+      # Himax hx83112a touchscreen controller
+      - himax,hx83112a
       # Himax hx83112b touchscreen controller
       - himax,hx83112b
       # Hynitron cstxxx series touchscreen controller

-- 
2.55.0

