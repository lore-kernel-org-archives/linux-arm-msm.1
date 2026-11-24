Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795485430;
	b=apbPmgiRDJgQ7Gp9O0fW6+TC6TlE9cOrlhog20URz5heemCG4/DA6h+37CVDylsQWTdY
	 47syZrpRKPIYA/IJKjGk6BAmEJ3aqJqJvUJWH0wv9NUoQtGNrWbmO/GLFcVGFUJNb1w9S
	 jZZMqwXtjsiHYCKrBhsetsE6wGXXxsEO+Z/Tx1xiMk/jzlDAGvyOANy7VOeF0+zMT3ywH
	 VN76qb47jtzmrl1khDtE+y8tBLlMThWOETeWAwaBqGVilG7hDJbswXU+dljOspYP6vz5X
	 ANHzQ1583Xps2iBCiJ1MAzZ7qDHb04YDC+rzGqvoEtwqJp2VWbYmCPhkF5aMDoVcbog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795485430;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xabHsePonONdwiTfItD6MgwcyoESmGbeuIKIPwB7xTk=;
	b=S3KEsfU10/XEJEKlnCBQJQ2KlB0IcDDRc6vcbPWU+VIn9602oCrf+LsmjSQ+z3KAoEAa
	 Pjt62flK9AHbnNwpWH14sdYfQi2VJUr1WxSexMEkUTGYZYJ/SCsJH4X6zOpW6ovkxT2yl
	 XJXLVltodbKxtv5CfEGDpF+7NnGXYCWmWOfPEjWNTiOv2xd8x79lY0rkxm3d5yq/xHaY8
	 3/OFtVl7hp/K6xVxASS2XjpB3AD4lgjN4ODcjwhiWaji/VMcI/TlZYuc6LxAVJoL0qovt
	 70pZmrXpVVYRE5XwvLrFsP8YMPcPhxgnLW6NdFhPDbStfsUmBERqvw9qkSfJW8isJ3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tRi7EmBy;
	arc=none smtp.remote-ip=209.85.222.176
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E606606A31E
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 01:57:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E606606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tRi7EmBy
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-9495f083657so447043485a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 17:57:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795485429; x=1796090229; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xabHsePonONdwiTfItD6MgwcyoESmGbeuIKIPwB7xTk=;
        b=tRi7EmByIhgObATe2GhCUv1TEXldNm7csFsBg3QUKYAWyf08f+rm/gIc2r4Ill6JBS
         5cQimg2e0+HXf2MShkwB2vJK4bYC+knCV/6RjTDTLik3iLj8Qc5PqXat78HpQ7u2NaDu
         v4yysu0OgBfsj3rh/Sq4QK6Q/GKrP33rVTcozklXk3kfsGrqhInSt2y/v3JkkYQWwoBs
         OhcOQcNND3TRi7+zq/S7dz4KcDhkTbcTKiC3MyAVsG4xjCgnPhJo0H2SLmBhqlQ52plw
         Z29O/0zZ2gF73f058JTUYATU3c/+MxVam3sVkQZ3jIQQEHrVAGZv4Z2QQnhNKuOk5YVJ
         wO6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795485429; x=1796090229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xabHsePonONdwiTfItD6MgwcyoESmGbeuIKIPwB7xTk=;
        b=26sitpTA+Su5W2KEJ42nsrqxk/uL5Qz3E452D7VFRFws6FMQWcS5uzxugxzVDicHfn
         FO3ASKdrHDanNwbveiLiq0jhUhvs3+4dndX6IPv160b7TnQPYFWp52zfHC6aqfu09klO
         9930aMNLS3L2SfhA0A7B9P1UjSLa7g1OnFyEfdypai+y0LiB7RxMgbAaB0uV8gzcHTW+
         xZSToLczRC0cveK9R3bMacopKB3fHStORNJh4xHVmfiuwlMmTjgdt73Eo8Dmca5o/o9D
         ebGDNCsbVP3/Z2ACnb0sNu28mDu+r4gllLaWQRpZCBc0Ks58Q1ua7aFaFp6/c4BgrtiJ
         oOig==
X-Forwarded-Encrypted: i=1; AL+hErHSnQKYSgWDFN1sQlRAmWUgI/cwG2sfX8mft7tP8zWDTjd/9KHXu/jP0YfKi1hENB6eNI8sIj/katobIoLV@vger.kernel.org
X-Gm-Message-State: APuU4Z9aDUqWBxvxR8/9hsN0OGT7pYH7d9p7Nc9Yp72QQUEDMsB/++1U
	HcnlvrGY4HfrKT0MMI6Bysy7A2YNi8h8ZpdjWknbdTSqV7FKScBECXYA
X-Gm-Gg: AZFdTZeYQiuYnkvIGifSCn1NBcEJ4FqvU36KH8IGm1mk4JZT7V8YXgzUlRr2egKU971
	+30i2pSUGIRIvYTvQMafRkT9NOdPboIg0xpWbY9Q157n3iPYHpvZp8n0fIzpP/X9yB/6c02y2oL
	599AjvxvrwaU1qflVo8CAveX+WE2UwByA2NGhK7r8GxQLlyQ+HTlM8nmEL6r5nTm0BUsbGsQa2k
	nI9amQATcXFAgD0YyruPIesryzMEosqvZtoi9czwsdQiJ66oeJHppdCz0UKvbFCoWaci/02heqo
	DhfH+Vf2WZk2xTIdifkgIo4DUZMrgih+fPgsrO5KbkP6ofkfu0QiShvBdDieapqF4HmpcHDYGVb
	zHi3jw/fbp6kwAk64Dd+wtJk8Dy39pKN4HSlRdXBLW6ez/UVP33o//eeX0lhp7PICUNcTTDf1Ut
	hPTzHaLp16/8s5+pqbzqGXwx6H5WZ4W0uqH2PgY8VampF7RBGqUZcDTwx+wqhBXx6Yqm0sj3xGj
	Hsp/iglLxbWLwQg64nO3JydiX/axjz5+jB94O/jPVdai1dO/liFZ9eBdWsjXFatgybldmALpwyc
	xFQMSBWEDMqxbVV6QaaF8fNtt8zc
X-Received: by 2002:a05:620a:601b:b0:949:76ed:591f with SMTP id af79cd13be357-949ba82851fmr2343857285a.8.1795485429482;
        Mon, 23 Nov 2026 17:57:09 -0800 (PST)
Received: from localhost ([174.93.36.89])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb0354a9sm946256185a.5.2026.11.23.17.57.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 17:57:09 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: phone-devel@vger.kernel.org,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v4 4/5] arm64: dts: qcom: sdm670: add digital audio codec
Date: Mon, 23 Nov 2026 20:56:10 -0500
Message-ID: <20261124015611.187024-5-mailingradian@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261124015611.187024-1-mailingradian@gmail.com>
References: <20261124015611.187024-1-mailingradian@gmail.com>
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

Add the digital WCD audio codec to the SDM670 device tree.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 arch/arm64/boot/dts/qcom/sdm670.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
index e99183c22208..54d903b89cc1 100644
--- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
@@ -21,6 +21,7 @@
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/soc/qcom,apr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
+#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
 
 / {
 	interrupt-parent = <&intc>;
@@ -33,6 +34,12 @@ / {
 	chosen { };
 
 	clocks {
+		lpass_cdc_bclk: lpass-cdc-bclk {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <1536000>;
+		};
+
 		sleep_clk: sleep-clk {
 			compatible = "fixed-clock";
 			#clock-cells = <0>;
@@ -2822,5 +2829,19 @@ data2-pins {
 				};
 			};
 		};
+
+		lpass_codec: audio-codec@62ec0000 {
+			compatible = "qcom,sdm670-wcd-digital-codec",
+				     "qcom,msm8916-wcd-digital-codec";
+			reg = <0 0x62ec0000 0 0x400>;
+
+			clocks = <&lpass_cdc_bclk>,
+				 <&q6afecc LPASS_CLK_ID_INT_MCLK_0 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+			clock-names = "ahbix-clk", "mclk";
+
+			#sound-dai-cells = <1>;
+
+			status = "disabled";
+		};
 	};
 };
-- 
2.56.1

