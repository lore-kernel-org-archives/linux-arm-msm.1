Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09823FDBEE
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 13:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784294420; cv=none; b=H09zFPMdiyfJKQci63u787etl0/PDpAQDH+mV+fi9ghrDiMQcoucUi/tkNokMhTX646D3RuVyrNFRxXgGZi1tzOU6RKOU67lq7Xs5H1PK2Hbv0P/jRofjQkMBa4bmKaxm6jSs4y2Z7k/ssJ0yFuF1zEcH24WtHcM+I9hp19DVAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784294420; c=relaxed/simple;
	bh=MjO6W5A/ltxThJlXkQzLygLqnAy6JNPNXtynrMtwLvA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XhB1FJzHbfWBk7ylWZCnWzuKlxQTdEvjz0sA3QrMIj4Hb7+Dsbr98Q5jRSCEgJolGTTGj7Rdj2N22UBYMnrXY9qG07dfjbZzhphKEk4vHkV+sX4Dra+0W5a+jmwwQLid2SNXBmQl+MRyq/XwcUbFTWtH1xtwazA29yxyem2cQL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=1IyTLDIQ; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="1IyTLDIQ"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4759b4f0897so2497033f8f.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 06:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1784294417; x=1784899217; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hhaF4s1+CqI0n3C8NuRp3YdXNZJruMrjCx+CZSUOYOw=;
        b=1IyTLDIQPc2PdMj2jzw7QTBLG7/+xh+LR0L7OrI8Mwl4by8+lk/kMPY/sSsIKfX7Hv
         6JxzOMmzd5eCjc1TsYSUaXRplQnCk8Qjv5hAQNn0VWkHLEFWHT0Ie1slVpkHN4vYHeaw
         TNET09+2V39rxxW28R9eVnWuy1UhCkbTpVus/BfvHkLNI5t9d6xOY4uT8tBxqFTtMpRm
         E3TnOQnUqiUtnJcnXLoxc3H0/qrb3lf7TrQMCBa25pQXvT21AIzta2nwVC15I9DABRCO
         YYAZQzZ6IF69nlz4b7l+pfuj+9uvRqoOBe/sJ+EIZ23tprr9wGe7LozMixZqU0fQ35P5
         Pdjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784294417; x=1784899217;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hhaF4s1+CqI0n3C8NuRp3YdXNZJruMrjCx+CZSUOYOw=;
        b=ZtoPFd/VA5wH3ulFtzxNl3lgR0S8xSlV/1Wbz1wQ8PvcrnhabpDkbLzQ3aU6A5P+0X
         pz3MziZ+Ixs4i69NVR04iORHkXd0jw9NnzvMEAxWAnFYcp8w2Ow2IZ7xAQhvQD/X7zQV
         VFZMy5FRxvCBEWxrEEFWNfMEwp7DS8ptFfZvg5/yondqPDgocvaPp8nQAKnSUqzGCpGQ
         v/MTOL74VQ65bqH+2elAcSuBA8sJ5KxCqTOlN8S2qD8LKpeV2F1UzAde6Abmb685jPX4
         jv7kf+qKTsYHkVw4nO5Wg3T2X/ZeySbFEkgW2hA2h4BqUzCvG7yswCvqzxOQH19yT1eD
         rz/g==
X-Forwarded-Encrypted: i=1; AHgh+RqQHOCaMIdVRJx9HokML8BO96eeyO8bU96VTyOKPD6Zq3fML88S2HM/+0HIXKcxn4j8IAN3p60nEFOdOUkL@vger.kernel.org
X-Gm-Message-State: AOJu0YwobqGKA2eM5P67juN7UrFkzJqlGDxndk8pyZ82navWg5oLdD7z
	B2K+Or3EJs+pa+ymx0BCtcZDh9Zgp6VQU0I4sAyUT4O4yfyYYAz2f1xbnV/ZOwn9qYA=
X-Gm-Gg: AfdE7cmzGWRX6RUbD50rIlhkwzm2yqNmz2iGnX2VjxGTS1F0Wh000+Z7+ubDnnKWoLw
	wscwfl/Hn2k/HrP6bD082Couf7Fncgb+MQ37OiYlQ1NvCA4dtsm3VHm1uq8yofWTHeBP1J6I0Di
	0xGhGSTHrvuYvh5WXYXv1V6DCQb6rtEnJEr2ZJINZBMcQie0/thBk94JO+GHXP3WAt83jTcFa4W
	sk7LzqFl8WCjjaamGOHZfWOmwNcuitOat9THBRVqwMfjLG/vG69BIY49FjYV2knAWxi/nqhRVCc
	6cBr7SEh6OzQ5NIjRXmQGs3IfRj9+JYEipMy5i89IZrxW7TirDENVfJ7leJNNoeRN33CyAythsk
	Pw/tXsek5Y6i4Kiyuycv2sMFb8PKRlGtqNtQy4YaFnUE/Yv2hjrgfRG2qkW1HMRPN5RZEN4Yp2t
	HLG7sjE0krQ93bhME=
X-Received: by 2002:a05:600c:354e:b0:495:4811:7998 with SMTP id 5b1f17b1804b1-4954a3eabb6mr33823135e9.17.1784294417136;
        Fri, 17 Jul 2026 06:20:17 -0700 (PDT)
Received: from [172.18.170.139] ([185.104.138.147])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954ba2abd0sm28220295e9.15.2026.07.17.06.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 06:20:16 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 17 Jul 2026 15:19:33 +0200
Subject: [PATCH v2 2/3] arm64: dts: qcom: kodiak: Add camera mclk pinctrl
 definitions
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-kodiak-cam-mclk-v2-2-04451f1374bd@fairphone.com>
References: <20260717-kodiak-cam-mclk-v2-0-04451f1374bd@fairphone.com>
In-Reply-To: <20260717-kodiak-cam-mclk-v2-0-04451f1374bd@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784294383; l=2083;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=MjO6W5A/ltxThJlXkQzLygLqnAy6JNPNXtynrMtwLvA=;
 b=DSoOCC3WuHY30B0RIdsNbSAtF7tvRPttoam9maR6JfzoDwOPxy7JTSUp/wteGfeCJ8yis312K
 lvEq+2jgcsqDyEyZSm1iZqQd0rCYOoLdyL+a67yrsw/hGBOQX6+fSug
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

On different boards the cameras are connected to different pins with the
cam_mclk function. Add the definitions so that mclk0-5 are covered.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index d5fc38fc10ed..13f1c205c07e 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -6521,6 +6521,27 @@ qup_uart15_rx: qup-uart15-rx-state {
 				function = "qup17";
 			};
 
+			cam_mclk0_default: cam-mclk0-default-state {
+				pins = "gpio64";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk1_default: cam-mclk1-default-state {
+				pins = "gpio65";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk2_default: cam-mclk2-default-state {
+				pins = "gpio66";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			cam_mclk3_default: cam-mclk3-default-state {
 				pins = "gpio67";
 				function = "cam_mclk";
@@ -6528,6 +6549,13 @@ cam_mclk3_default: cam-mclk3-default-state {
 				bias-disable;
 			};
 
+			cam_mclk4_default: cam-mclk4-default-state {
+				pins = "gpio68";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			cci0_default: cci0-default-state {
 				pins = "gpio69", "gpio70";
 				function = "cci_i2c";
@@ -6594,6 +6622,13 @@ pcie0_clkreq_n: pcie0-clkreq-n-state {
 				function = "pcie0_clkreqn";
 			};
 
+			cam_mclk5_default: cam-mclk5-default-state {
+				pins = "gpio93";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			mi2s0_mclk: mi2s0-mclk-state {
 				pins = "gpio96";
 				function = "pri_mi2s";

-- 
2.55.0

