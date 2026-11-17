Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794903870;
	b=mAiyvpKkWUrT8Y3q11KhkK9VYPggaZW2BDAe1VKiEo8g7D4edhv4MSF8yDL+COevpmBv
	 JbUpZBrLQS1KI8y8sThOpjYyQSA4gA5fzeDV92Dg7VIifnD3seJOoh38n6Ai0wFACiOBB
	 O+RyTMG0d1KWpvLt4ncJ5GKjnLSi1GzsZ27eYjrwSqK/hBbzZOA6x9ljxPxR+cbYvYEE1
	 eeU/3UV4q2SJrWG69B9JkFwvdmL/CBbN2spMLtH8uvo14cQypxbcvhXSEvo87gRTVE6a1
	 RcMTcvwJ17QezAiXPiw5Cdwuqfj5u32twmwzaRlA6HctjPoEusuTVC8/Lwjt6Xsc2ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794903870;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=xw3xnb7M3ni/K395S76W5M9HsZ1EBFx8fzPBd64UQdY=;
	b=wsr4LdFMKqE7SuctstJXseki3HiZMjlyU6X3Su57XTDpS8Vlb7HspQiG5ilG2LnlE48e
	 ayXWtH9bpeSH8aOhsMqczBJxPig7OSSXYnFIhtmTLlgN0DJP7VgWHtkuMgXg+AkAzGPHQ
	 ZLIdAwQJw60Ug2MZG6Tq07m412CTASJIhspx8ZRedHDvNao0d0J0auJ+OvDLIUPjTWVAD
	 QZpbgUGDd24sgoVWnblLN5CB81IWciGPLcUq8aVi1kzUxRye/kEEoqJMWgsBRsur5g9tn
	 ted+0/9ryCppflRKdnD8gcm35ZVlo//BDKebs4WlmhuNHpwCc0Sd/t2FC2cE2Gvi3Hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=SHbfSFnd;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E8CE606A330
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 08:24:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E8CE606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=SHbfSFnd
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c506a231b88so621642666b.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 00:24:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1794903868; x=1795508668; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xw3xnb7M3ni/K395S76W5M9HsZ1EBFx8fzPBd64UQdY=;
        b=SHbfSFndESk1yY8b/OsbMm/euo3XP110OsJVHrsLsdYSpOY39tPL6ns+z+sdP0oJFk
         khgUnzyP3YKajHvNhpszCJiaRzKRtMHkVX8NHWr2m6xdTSFCkJU4ClvYmgNS47iMqn4G
         MHFIuQFpZCo4vBGjxab09RtA+7HfZ2oVkncRvzSkTZ6cfeuB7KTtE4BuPY3EDJRdjcQy
         rShqUqiojPjqHm1NaYlFFxn4ErPnsIL6rn0ToRgLYlEY44TbdaQYdlDTMUIDSsEtNCTE
         K//0K3ZfoWwvtEJJmfmTtkf3aQ0EqnWbrYdeUoEqBUPRYmpIiWaE/5EELg2nOLU5GFEt
         jkew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794903868; x=1795508668;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xw3xnb7M3ni/K395S76W5M9HsZ1EBFx8fzPBd64UQdY=;
        b=fgtJoGsKA52eVrivYO972r7HFCX9I14vQawnbxmFy9ZtS+Qm6SUqvqCDsmt6BEB2zi
         AfL1oSmRc3/NId+P77H2+zmjdIWjuwzXli22j15fXMcA1qeS0VC0O9cgTV8on7AcPCOi
         PjNhTsC7LxzzjBjiy331UZ3y97oRoJey5wS1a5mrP2679qowxWLrXxeyUGkaGK0Xren3
         42ZH9qwDoFfJkBNd1tcbooaGWLkL/QfdmkTXyp+3jYmqdL0PpGAgRKqeK9hGiQLrkIze
         KtbF4TU+MU5KixgG5SjYG0VsAfWPnfP9Fhk4n1RlCT5fvcVmdFKmvgLW6u+7KnI+z5yz
         aeTQ==
X-Forwarded-Encrypted: i=1; AL+hErGoxLEjJkJ6LVjM9GH3KLh5uT3faShGx2BoaX0l8zxJ1iPyuorYvk8EQ2YItSnOu28FoZ71TOYXHB7LrEbb@vger.kernel.org
X-Gm-Message-State: APuU4Z/Vf2fO66PTR1jR2fPaNTp9XzUGRbz/Et/Dr4+v4QWmvR0QYIGP
	SeX9/ozky+RuUZ4Wjw5Aesf2f6PKCBn6ZcYTmI6+TeV2UhmsAXCMblpzlOEhncWQbfs=
X-Gm-Gg: AYBFou1bE6m3rFfDksDhnLylzl5lDZ05gi0t+QIeK4MX6059c85543fFMuFB0NQXosE
	VTa1yx3EKtspr1dC90zArV9zP0krYnF0kuy4bGyLn4xB2FHBuLCqUHR6hmjtqWrDuQqkYLUBjsG
	wgDoVeusECsPiZ4VCtuPvxsXt5hTR3nR8YeaOFE4WB9JzOyFQnCUpzZuIkp73QXTw/8OOijh44P
	f07ygeogpZWLQtepmfCDwoquOfcx5JtzQ9I7hjVdK0RF54qnDm/iiM9GxZazcYV2RwXc4PZp3+J
	7JjRW41AlhFXu7Er2y8AMTWG60pkWeOSRTnMiZ5+qn9AkahnMNgDc+40NjdUn05fIcFqgEWS5+L
	7F3xY4n0KeaBiwjEJoyfL4wfxmodEjoJzvLFKbIhoYet3mBjFYm3XO1iWMOfNSfvbKbTA6Q3/Dk
	tPC5IpSE2jeRbPRbNnOyFU/UC82enyz1N+5eV82OPu5YWmmKJ4i7Z9Mw1HYhHu4GNoZfaif1rBO
	leBKDoW9QITSAWt3Wz9H7i/QCoPxynciv/ybCBDSZHTYSMARaeoctlKUQHemdHhxWh+Nhqe0hm5
	zEU6kQXijlTdcz8zu1wpSbeE8mSvF4OQ799Bm0TBjvqZc42gd+fr45pN5kc8ZeWCQa9fS3MesJX
	pq5ab+0KRhRvJiVTxY4uXSa6Z28aeIouSjuCygWHjcyZbOk0r
X-Received: by 2002:a17:906:7315:b0:c42:fc8b:6c7a with SMTP id a640c23a62f3a-c5096550449mr1132986666b.41.1794903868527;
        Tue, 17 Nov 2026 00:24:28 -0800 (PST)
Received: from [192.168.101.179] (2001-1c04-0504-7401-4b2e-1820-6d24-b264.cable.dynamic.v6.ziggo.nl. [2001:1c04:504:7401:4b2e:1820:6d24:b264])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c23611casm5616953a12.9.2026.11.17.00.24.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:24:28 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Tue, 17 Nov 2026 09:23:14 +0100
Subject: [PATCH v4 4/5] arm64: dts: qcom: pm7250b: Define battery
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
Message-Id: <20261117-bat-temp-adc-v4-4-14d5d309ebfa@fairphone.com>
References: <20261117-bat-temp-adc-v4-0-14d5d309ebfa@fairphone.com>
In-Reply-To: <20261117-bat-temp-adc-v4-0-14d5d309ebfa@fairphone.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794903862; l=1412;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=b7mnu5CgjN796/wKAPryTmfFj9uk8BxPsgl2XchGimQ=;
 b=IEavwQRoBZ9J/7BaFptQKLVBcbOzlROC3o7elEG/KJxaOX+vWhvHEkOrTZSwFs3fttmOJJc3Q
 PHcebENwoAHAURwSzKsaLbonycN9YknjNtC/PDT1eB5SmaSrhF3UTW2
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

