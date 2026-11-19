Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795081888;
	b=tZF+8h/nbvPnY1oG9gIGgqamlPSkKpxbiCesVT1gbke/lGjNHUUAbauLteYHM3YjLKib
	 FWkX4xkyQD0HRR/Eoqlqm8lw8n9LPLVzeRmpYvhf8HYrWnuuqHlJPa4i33BWM/QmSUQkS
	 VXF0hH3IFoU3oriO5oqvegQSp8a4w5mR0JOM1e60sRePw8CFu/kn3gn6yczVkgGt6I4kP
	 fdOrz9B9eupZ3uoi5cArPTMRDpasYxlvtou3gDb9CcHMdGXx2B17eUsu6sYWnQ/Hj1v8l
	 Bpi3xC6SKIVg9z/BEfK/DtIFNc2jdKQe1BcO1LN7JIxTQijQ93uUj5bR4csr9+zZREw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795081888;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=lzDU21F2EHLB7rOP/VYbDq+2X8MhT5hkKO20Bmq0VFU=;
	b=2/tcEQCueIPyWfXzuHXgx97kZFj1voTKppwD6/5GNjT+k30ZAzmYPgr8ddUgOq6Nna8s
	 /tt8+CCcz7CHl47RrF73gkljt1txJDXZOGs77+GzqpsY6LjVYRBiuVQHE9SL210sIsrsY
	 MSmjHhaxwhUJpsqlmVMKr/U3iMsTaaBdRS0twjLaWvoNfjOA2vkVCtgbAJaztCC1bltJH
	 JF/fDKBRSBP+D/Av5EP/aDKXV4ZBhEfEgXP+ZOTmeUoacw6i3OH48gfEppyqrEcfZ0g2b
	 CS0c2OSmxRj1K183Ftepdxlq2nk7nVWOcELNe3v2xcWKRoZreGCrCB8AQ6pB60uFsKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=tuT5UoBr;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F96160A262C
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 09:51:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F96160A262C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=tuT5UoBr
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c247f6687dcso306933066b.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 01:51:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1795081887; x=1795686687; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lzDU21F2EHLB7rOP/VYbDq+2X8MhT5hkKO20Bmq0VFU=;
        b=tuT5UoBraM7XADG/B+vWLbNmwJGNEmNaCzbPRSq/rt3g6pOqHbBtGLQv7O344swf8i
         m9hEtpaZN/9MqKHcbuqaHH+hQQBks9WlJ05E9e1BVwdTevrDWHUPWlhb745nVNmcB+rS
         s1Sq6aCJuYJalnpoTCtudQN169ZRKGb0qZxA0nVlyFM4U7/CIAs90tc1t2Cl6m2JvZZH
         SdmCLLRacQFAdhsKvKg9eYO4XPPJ8F7s+1Xwr9FAgLA9VlQHByko7ZkVKzBO1Bsz3jLc
         4zrq6pbkt6NZMaeUHgxPtbFH2eYoQ0qt3/Ax3C6DAaxiO/EovBzzfgu0f/zy5QMYy4Iz
         nWQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795081887; x=1795686687;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lzDU21F2EHLB7rOP/VYbDq+2X8MhT5hkKO20Bmq0VFU=;
        b=lXbeMSZNAjRMlESvZtLEe7NNQ/wF8lLFgSEsfYiv/uDxFGwLO2Q7NYqXSdfRdKHy1E
         hVvphsnYP4i7mPZ9L1JONV9PaIvwbMNQ8cOP8TpC0AB36VEFzRNGK+pDJ5S4hLZh53IF
         +883U7Rnf/yJ+Ja9Fky9jkWUKZahCfaibjhe9mupm0hwfhMNwp9Mz3TzeLCV8fObFLMe
         BnWDoS6JtfHnLx9GSUCHhnXrGLmQZoXD6gA/yw9ImW5kNILXx+7vHoMZTyBspaoDJMFr
         wK4X4EN+sJRRee3VmnvkaOzXWBOy2AO32QtjNYQ3kZk4UhOavZp52A3Bd5sP6VPvA+ZA
         jvXw==
X-Forwarded-Encrypted: i=1; AL+hErFjZZBrHzys//VCUs+8qxDl5mlO/vMcrEIC2n52j6JUj9ritCRyOt20eq8SbgGL4GFnDPdK3Las+jZV3fJ1@vger.kernel.org
X-Gm-Message-State: APuU4Z8Vp3c7C3dEropPYlALuJat3oHG6n9WaVbD6LJBbfop27Di/DtW
	JxMoGioIfFZVWexKhtiXfJXnu5agxBQuR2GqzxJMOzxwQzd/AiZf1eEryYxW1V4LACEiVGU6K1v
	km26+Y04=
X-Gm-Gg: AYBFou3gG6JEfZlsZou6ebxIirzmceaeCtdD4ykvbVFTulJnlbnfuxq2xBz3oEt+B4b
	2Hkhy2D1GAo4ogmKr7lRxsucK8kNdmKcNTrLJSA3gV1RHDcgWthmBZl5YCZof/AJneWVWc2FmxE
	HvIN7xybq1sGUwDDZjJZd9Vg3WUwwpxNYz2q8BslODGLKWlMDjo0XiLV2fZb/GPXEqsmHn2gKHI
	yR8iif08hg5am5Mt1pPp77CpQ1vhMRqBIwxWT95O2pUISSyCuWNXyLmRhP/SiyN76aPnwtW+py9
	UsMgaSKg4bJU9wYZvMYCcZSXPxxRyw5fH8dUaMPV4xO+mgyzbaxhoaE/Bv1qlo1EOJsmdXt/grf
	zfVyHWOzAOBZj8UYg5FhJgb4b+xIyBPdd+uUxsjQQNg81PaCBFKwnv/XTVJDz88toiyXEjGwpvq
	zclfKPUkoukeOmWliRluBBVR77ZWqZDgMxMe8I/TTE5m2DpaD2sV+bBeylc2+na3/APcV9Bmac7
	3fTCL8XiFIO777CoNsbCG5ZehRxCODvq4I5al8FKGZjYSCbgAxwFTL+Khl0AkmbupoBa5OrxSZb
	OOP5W7Ij0CQkoRwjH9tecyb0J3Y/XVlSXqzdxzDC4V2RXcxu8hlnZdJcDR0TYvoKwT3DMLEEqTb
	u8/MNXHW34c0=
X-Received: by 2002:a17:907:36f:b0:c51:2497:c64a with SMTP id a640c23a62f3a-c512497d81dmr169697366b.48.1795081886833;
        Thu, 19 Nov 2026 01:51:26 -0800 (PST)
Received: from [172.16.220.224] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c51231bc213sm95057166b.12.2026.11.19.01.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 01:51:26 -0800 (PST)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Date: Thu, 19 Nov 2026 10:51:25 +0100
Subject: [PATCH v4 3/3] arm64: dts: qcom: qcm6490-fairphone-fp5: Fix
 DW9800K support
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-b4-dw9800k_cleanup-v4-3-df26c431595e@fairphone.com>
References: <20261119-b4-dw9800k_cleanup-v4-0-df26c431595e@fairphone.com>
In-Reply-To: <20261119-b4-dw9800k_cleanup-v4-0-df26c431595e@fairphone.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 stable@vger.kernel.org, Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795081884; l=1266;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=mcLSV3KKUJrX2Vt1xs2+yh4YAv9r2QOuUzb8TrvhqBU=;
 b=CQYSyNjBO0Q/zSTuxeXLUaV+HvnPHo1DxvGi3LDOgBjJK0F1h6E4ABmNBlYJUC/6ZLjkTYYtZ
 +LHwZi/bm3XBFa/c3yFLbAkh37pXvffc998eC7/JZuRzWEqRvCwkvKu
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=drSBvqKFiR+xucmLWONHSq/wGrW+YvcVtBXFYnYzn8U=

Update the node for the DW9800K for correctness.

Now we correctly select SAC3 mode and enable timing-control with the newly
updated device tree bindings.

This is a breaking change for a part that was previously functioning,
but only due to manual register writes in the driver. Now that we have
the correct documentation we are able to update everything to ensure
functionality with other devices using this part.

Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index f41ad446a39e2308abaea68a6b31a7e387881bf2..a657a5dcba9cdf750fab2478ca319f3a592ea295 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -665,8 +665,9 @@ camera_imx858_dw9800k: actuator@e {
 		reg = <0x0e>;
 		vdd-supply = <&vreg_afvdd_2p8>;
 
-		dongwoon,sac-mode = <1>;
-		dongwoon,vcm-prescale = <16>;
+		dongwoon,sac-mode = <3>;
+		dongwoon,vcm-prescale = <0>;
+		dongwoon,timing-control = <16>;
 	};
 
 	/* IMX858 @ 29 */

-- 
2.43.0

