Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794557802;
	b=xt8qJ/pelIDoW6xY5fSfXH1SqPEox3FTxSXg3RHUZe5CYs70vZIDxac/rgF8HSA4fQkI
	 iSO0R7tqUo8TLw9xELvbhJm6kV4pIjeYrj88w2KjpGJ+Id+GB8ULt2AOXwbRWHU7KHEkZ
	 BiGpu2lMYMdzaH4O5tG2Lvqd2ovvTZ9F5vWMA/UsKURIFMOk6ar1VF3O6znhOGffpgWQj
	 W5nMsiF3U7wVgABbwRaMGXEx41SNPQfx7b62kmN8B9/pEVrxqhOfhTzUY8DiktVftG//0
	 CAm8Es7ptGDX+NQEqVColHW5yhM5/SXFF3LVhcDx5laUspHqSHiSAMc9lbsZs+L624w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794557802;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=iQFTvmXhc7Os6jgWWtbp3W0a+iCMVy4yMh4ovPL/AhI=;
	b=FZ0zjyzIYILinW7wiglMes0ouz/fIo2iGFLVQm76JGK4cz+mAI0ltFSMdsg4kWeOdLZv
	 QeZFlYUaOnNGNxzUgIR66qAqSVbA0AqvmTQBfwVTnVZWYaM8jf0eG4osrM+vkUP6cj/7+
	 fhQ+P5JT6FvJJD5izgMrGCCCu57uNUW0dlorcwMQZlD5Pt6lRY0QZ3VKFpZCIKWszPyca
	 a0pkKtfGEvcntes/A1JHtf6cmW1K3X0wLtFRLHILo9tXgTBd5NwN3LVcAe6HuQe2OZLnI
	 2g/1NfgIZWyjIRJ0XbZXop0Q3iVm5PvMDhqba5LfBQjof3mgc8Lid5V56EpjRU+/j9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=MSscyRQQ;
	arc=none smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41991606A8A3
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 08:16:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41991606A8A3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=MSscyRQQ
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b6f42095bcso1255168a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 00:16:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1794557801; x=1795162601; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iQFTvmXhc7Os6jgWWtbp3W0a+iCMVy4yMh4ovPL/AhI=;
        b=MSscyRQQ4ju3BAXAXTqwR+KnoFm3xqXW+bk05zNcYmZZ/GU3BcPBJNmWgnFWB3+u/B
         2207JCdcECYzl3Ckdq9gwJKzEXaxeefn0qlLcWzFVGzJK8eHO/YGboT+aW22A5V9tieX
         vMyFzTi/kbdPCg6VtFGgFm0EZhbIZWpmbqZDi22qYLCcsstULFdSTExzs1E766mwH6J+
         JvQmD4DNikUfbjPN+QjlpF+aFFsjlkwu6YYXmzBDndXhYWTz+qGJPvZjD0zvi84ahmj+
         5fvUTnA2Kl/gLwBnCgHambLU/GmtoBf/G2OIVLHlMPH+spsKfIVgbHT39AVZ0PF6xvZ8
         lyLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794557801; x=1795162601;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iQFTvmXhc7Os6jgWWtbp3W0a+iCMVy4yMh4ovPL/AhI=;
        b=MueUy+7xVdbMT3VUgiEmX7FKa4kGUheGjacNxu6vvrctg68FQIR3MNlYoNDpUmRyU6
         uLGTQw1E4ExID6twWQXap+xKRenmdsJzTcnQd5+Rjp5d5RvvwFNceXtkXqrnNhBm5M/r
         fvOe2wcjjLC8XS9rqxIGJz6Fea5mRGYk0OPZ5F/pL5k/i11efI0m0CoTLhvNJHvMEYa0
         IgcqslOaRqgeZfZXFbQXNEgaxU9u3qA81/1ih44wRhS0GFlPOlSwDs42S433QwtdMz+p
         hTO52CGhO0e+l9/RbsTjMQgyGzC4PrLGQpmgI1/IRh27gp3mDNHyy+Y00E24YbNVsAJY
         K4mw==
X-Forwarded-Encrypted: i=1; AL+hErEMiRUHCTcDzx3KjF86TrvEuWINTMsLPJ9gAQld9KlKWBX3CEIGo+Hz0RvGzT6ZFmIB2EmU5B9bwXR+LpcR@vger.kernel.org
X-Gm-Message-State: APuU4Z8EbBLW0ZOLWV+3LtxJisAHBH0lVHHyfdvUz62K8tjNxEozJznq
	kzglGYw2Wz85MrtGX1JbAOKglVoWkLMrccOgnDhGMbNTYuKMBQDF+BQwGYe68YrDctI=
X-Gm-Gg: AYBFou0I6oP8u3nNwFz5A8U8OuueObWj+DnPjnkNBw+HiFpZsAFualmZcD6tt+SeJz7
	skyls3n6osbNSH0amKgGmGd33xkLrZpO1Ep+1faweE8/UJc1luJGwjg65MhPjkcMTEdsfcMAERv
	7Gw/Kpl6TEmSMAuIdloBf/RHfnEmNN2WBdaHCM42g4H7RhI6kLGsQpF7Lh/l+rKCMxlZV80U60u
	+2Jf1RnMovm7FHiRnXpIPIUrOlaoi5fo5Xfkj//sdea6UkaKXFM0FMdTrsL/9Lf1nsA3lIPZkrB
	WrtyQolwK928eb1xGWPUxyL2pxjr9qoFRRI5ndpY/hElrSMeiqgAESdw8Qoe2j+AkNRsjMczp7L
	9kQZVEvXVmntlsyGzLNopMQhHfc0ssz3JxkBg6tkUg7evjYGe/lXTB+jXboPflhJ6DC+0yDyxJ6
	Tq3sxPinOv9axKiLsAnLl+gr41CpsaDPi4JZ1ntGwDuhZdJSA+01X662YVVnNreXNQtTl//01v4
	ajoAoy0ACQsjbGr9RCNBLww6QMxJcggZzbidB4FARJmWuiZvEcJ6E+ZYtJ1u3GvhVmIKYCffgcv
	8FVhA3m6lCcZkyO93PN0n4th6nKUefkYtVh2fFEDCj/6WfO2P5hoNU3mrqMOVTQBc8Y2nj5S/Gu
	hYhpIlBw=
X-Received: by 2002:a17:907:72c8:b0:c4c:fd37:bb0c with SMTP id a640c23a62f3a-c509642fa91mr120493666b.29.1794557800810;
        Fri, 13 Nov 2026 00:16:40 -0800 (PST)
Received: from [172.16.240.104] (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b4214fsm65243866b.35.2026.11.13.00.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:16:40 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 13 Nov 2026 09:16:38 +0100
Subject: [PATCH 4/4] arm64: dts: qcom: sm7225-fairphone-fp4: Wire up
 PM6150L LCDB
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
Message-Id: <20261113-lcdb-enablement-v1-4-1dc40b49ed82@fairphone.com>
References: <20261113-lcdb-enablement-v1-0-1dc40b49ed82@fairphone.com>
In-Reply-To: <20261113-lcdb-enablement-v1-0-1dc40b49ed82@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Val Packett <val@packett.cool>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794557797; l=1746;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=KjTKTH9Miq+8wMoPpDn8TAAfkWHtiUZa4QdKBZGsgPQ=;
 b=0gEdfshP1PkmZVEL/h2v+0KFiWjmOvW0x74d6gZcB7Mc88ZUGZl6AjEnXDATqUxlfd90qJxBn
 i6waAEMPGQbC+r+RZ5r+EKzsjOrbv6MuRFlWCZp+Cz6OAfHYIEskU9Z
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Since Linux has gained LCDB support now, wire up the LCDB regulators so
we can turn them off and on as desired.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts | 26 ++++++++++++++---------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
index 37aa272019cc..d592bede6a61 100644
--- a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
+++ b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
@@ -72,14 +72,6 @@ key-volume-up {
 		};
 	};
 
-	/* Dummy regulator until PM6150L has LCDB VSP/VSN support */
-	lcdb_dummy: regulator-lcdb-dummy {
-		compatible = "regulator-fixed";
-		regulator-name = "lcdb_dummy";
-		regulator-min-microvolt = <5500000>;
-		regulator-max-microvolt = <5500000>;
-	};
-
 	reserved-memory {
 		/*
 		 * The rmtfs memory region in downstream is 'dynamically allocated'
@@ -784,8 +776,8 @@ panel@0 {
 		reset-gpios = <&pm6150l_gpios 9 GPIO_ACTIVE_LOW>;
 
 		vdd1-supply = <&vreg_l1e>;
-		vsn-supply = <&lcdb_dummy>;
-		vsp-supply = <&lcdb_dummy>;
+		vsn-supply = <&pm6150l_lcdb_ncp>;
+		vsp-supply = <&pm6150l_lcdb_ldo>;
 
 		port {
 			panel_in: endpoint {
@@ -925,6 +917,20 @@ pm6150l_adc_default: adc-default-state {
 	};
 };
 
+&pm6150l_lcdb {
+	status = "okay";
+};
+
+&pm6150l_lcdb_ldo {
+	regulator-min-microvolt = <5500000>;
+	regulator-max-microvolt = <5500000>;
+};
+
+&pm6150l_lcdb_ncp {
+	regulator-min-microvolt = <5500000>;
+	regulator-max-microvolt = <5500000>;
+};
+
 &pm6150l_wled {
 	qcom,switching-freq = <800>;
 	qcom,current-limit-microamp = <20000>;

-- 
2.56.1

