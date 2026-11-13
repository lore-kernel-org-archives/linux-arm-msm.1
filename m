Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794585905;
	b=VXRXPHJyzMHuXW0c8aAaSYz40fLkQH/gytBtNzvP6M7EkPXw9q5unL3N1bicAFytChUY
	 QCTgf5x1Qcw2gKJQVQkZR8KlsH9e2xtMjgZViFgN0eQsZknLxhJvp6VJ0/B2A6U83H0nd
	 Fe2H/0HndI5k4mbAdMbgEbrk2Y7r6F3l3j+IbjjNfPQ7BFAYZdKMukenwpkdv9KkaQOnn
	 RS7cygjWNYHx3b606Xk1IU/5Pk2pNqNLtPBKYW4qoa3ZZpCQcfvgH3P4nrdKvWiMT1/XV
	 jklpJbjU2il1Rc5Jgb4xpp+4cr8UxIvxmEBDmjzGSFVeTe+z3xKkTCXwymC1oEsEpig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794585905;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=xw3xnb7M3ni/K395S76W5M9HsZ1EBFx8fzPBd64UQdY=;
	b=MUbKHkOMALkmvqs3f1O+P5NbGsAiYxzx8bHri0DKIjotnna/D6/ZuN9dn08Fn+qaKqAF
	 gkUCi7lFw8BFEowm0xF3+gXj0H/FZwF14Z5+GIZcE38l0r8AFSGJEJw0b7TypG6Him6DZ
	 NyVs87tJ02QYmatdmmfUEcUZohtOAZYc0tF8JQ+tIbiMNdpD5qkXQ/WbCd2dGU+9lcbgb
	 z26zzLGHxqtqScLYteOvF9QsIfBdv5QeYtuTU/+V3peZptFs1RlJ5JymtakbVOjPZo3yU
	 5FS6mi/F4hSCsrtGC/KoMSKj0MCr55e7HSDXSzpzc3/qvCCQzptyT0m7BDibfx8WEKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=CsDLFnXt;
	arc=none smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 500A760A6F77
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 16:05:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 500A760A6F77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=CsDLFnXt
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b757029223so1732757a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 08:05:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1794585904; x=1795190704; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xw3xnb7M3ni/K395S76W5M9HsZ1EBFx8fzPBd64UQdY=;
        b=CsDLFnXtB3WQ1uRAtL8aws3SolQHAtawncLSuzZPxSkA+bkQI1GAq54XPJex/Ud0wa
         EKWnT7UnEAVaqSpnyo32Ah/rEBa4EZSOOv9HFTpYrKnAHHrMrFRvbXVX+l/zeWSK00uR
         cyQhJpE2bgjnpBr6UKRN1a2QuYXr15PO7++KJLHnTIf4ZtGjlMFN68qoP4H+j+lT/kIf
         jqdG+IjYbtGtMwJzN5AaX31+8wOvMxnMu2IdVCLPO/xrb3qg7HNBi8Hsy4Q4gXuwTdwl
         JF7s93f6rXH0EgrcPxwC2lWZygZuw9kytyklugU2pHYTmMHAj4xrfTMrhfrtwxuJhyK4
         1qVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794585904; x=1795190704;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xw3xnb7M3ni/K395S76W5M9HsZ1EBFx8fzPBd64UQdY=;
        b=J9MRVcnsTl9KpnyiNxSX/R2n/Xgv33Jd1OgRz4MaRz8IcMY+9indinfi/iUYeXuK/U
         QchyrlAJ/QiDsrdPiZKuXEMvJLqYMgpCsBCr+VK2RtsLwFwUbLFtM1apjYfQ3FWFXmew
         GbvRb5l4GaSZGJp9QZb+3iV2NZLW2zgEYMq7ypWk8/NReoG2KW+bA93jq2mrTIa8LajG
         q6aHhvc30fLfqn7lwVNLiF7lGjG8sI/epRX0T/Oo9qxcZhpuVzsqJXR292rTbuU7pfRX
         LitkDpiZh3hGHzyQxOXdWvbYE8Fml26XmdMw2umQOZBtjWlYg5rUinSSLrRCuEVdG2m2
         6nhA==
X-Forwarded-Encrypted: i=1; AL+hErGatTyO5FoTeRHVYtBYeKsGZAVCVwmYmnMhUi9lew9Ll3oJWceRU/CPc0lBBx6eoQeqBMO/LCDcqj8OhAXZ@vger.kernel.org
X-Gm-Message-State: APuU4Z+KOF4UGliC8YpWyOclA1hbYO29qzeGhOwLemEIVeZhpyWwjyOi
	HmbJQDtGtyJXbeQ7jcLDiHZPAUt+PGx8GjrFpvcsVST/QyfgZfYp1bfcAl7L84RXYcc=
X-Gm-Gg: AYBFou0uLyyvLQ+aXDAkGJZRWL+WMUGOHC+fxMbMJx8O/rqOtdEq+cl+30kLLW5ODBy
	CYnxi0qwHGMlcv2pTEkAGKaYQhv3z/cfW+8c9vtek+OF6laM4NIngauk+PxApaIDeL4n7yMIcBT
	LY28J9PAu/4drT/sCAtUV01ckCWU8G/HuiJodT5iZSuMYrb5S4GUX3XY/O1lLcmGMPf4XnIzaAQ
	IW2AEpN2z630mAB6j2FfYqyCClQE6TnquFHnrV35dO6+Ou2amAQzD8zdpzkRzfN5UXeqX0FN8py
	axcB6G7I0tCb1rkrJR4yfhTX8aNIDpWfckaKjBgFrgF8ZLXBOE2Y1cMmQPbdqaGAsgvQMxlOdqZ
	hvzhw7UFTZpzpViU+Qpjr0yl45ovL8NpmiBZavz4uO6zuPSlJv2B0E/hngb+2DdZzfNIRsqwCHf
	e4aCKrSUt6ZjtnuLCo/GZLf5mHnWNx0n7zETfOd4FavCNB9vhPtCn0az1MccIkJePxLhPlcGZbc
	lCAV7m+WYgp1vuuexQqE3GnnAVLbqIIVwGqsuq4vG9ZeDS916GjoBklYvxFKgh5BTy/RjcCxixd
	1tkUrJpfv+JE+rwbW3pLFFvWzcHudOQ+PNTJ/PuaSuQ21vLSlRHnbyn7YEdshoc4FgvXV6L87Ep
	d7wZ5I4E=
X-Received: by 2002:a05:6402:c4d4:20b0:6b7:8ace:4bdc with SMTP id 4fb4d7f45d1cf-6b7c0be5dc0mr2076346a12.29.1794585903767;
        Fri, 13 Nov 2026 08:05:03 -0800 (PST)
Received: from [172.16.240.104] (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c264d99csm1123946a12.36.2026.11.13.08.05.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 08:05:03 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 13 Nov 2026 16:56:45 +0100
Subject: [PATCH v3 4/5] arm64: dts: qcom: pm7250b: Define battery
 temperature ADC channels
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
Message-Id: <20261113-bat-temp-adc-v3-4-743979a8fd90@fairphone.com>
References: <20261113-bat-temp-adc-v3-0-743979a8fd90@fairphone.com>
In-Reply-To: <20261113-bat-temp-adc-v3-0-743979a8fd90@fairphone.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 Jens Reidel <adrian@mainlining.org>, 
 Casey Connolly <casey.connolly@linaro.org>, Val Packett <val@packett.cool>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794585895; l=1412;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=b7mnu5CgjN796/wKAPryTmfFj9uk8BxPsgl2XchGimQ=;
 b=39kPDo0KhTsrVvnjKB5C4HJbyboZEw6GYyL3G45auk6/fdnDjvSVTwlOddsdPKaBb22KYj5re
 PV5Oqu4IxGcAOs2aPblfI2Ry7nV+J99UGRYwq9dKkZe/+PFdMxVRJ42
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add the definition for these ADC channels to the PM7250B definition.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/pm7250b.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm7250b.dtsi b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
index 43cab07126c5..91e83587adf2 100644
--- a/arch/arm64/boot/dts/qcom/pm7250b.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
@@ -155,6 +155,22 @@ channel@1e {
 				label = "chg_mid";
 			};
 
+			channel@2a {
+				reg = <ADC5_BAT_THERM_30K_PU>;
+				qcom,hw-settle-time = <200>;
+				qcom,pre-scaling = <1 1>;
+				qcom,ratiometric;
+				label = "bat_therm_30k";
+			};
+
+			channel@4a {
+				reg = <ADC5_BAT_THERM_100K_PU>;
+				qcom,hw-settle-time = <200>;
+				qcom,pre-scaling = <1 1>;
+				qcom,ratiometric;
+				label = "bat_therm_100k";
+			};
+
 			channel@4b {
 				reg = <ADC5_BAT_ID_100K_PU>;
 				qcom,hw-settle-time = <200>;
@@ -163,6 +179,14 @@ channel@4b {
 				label = "bat_id";
 			};
 
+			channel@6a {
+				reg = <ADC5_BAT_THERM_400K_PU>;
+				qcom,hw-settle-time = <200>;
+				qcom,pre-scaling = <1 1>;
+				qcom,ratiometric;
+				label = "bat_therm_400k";
+			};
+
 			channel@83 {
 				reg = <ADC5_VPH_PWR>;
 				qcom,pre-scaling = <1 3>;

-- 
2.56.1

