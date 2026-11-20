Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795190104;
	b=PFwkHhJEh9JOODNOXumFILnqZ74u7jjgONub6KgTyNUxYXqKoJXl6pBElx6SXtQOaqku
	 mcE53AbydQrtX6Jiwn/OUYyvt+VwpSshCSfppRsbRhu0FxRtSe1zgX1/VVoBiVzNON/cD
	 Ce1zDRWJQJ/INutJbFucG9b7X4l0LOncAvduCzwFy2E5XCeWbuctchpyfh1AOK+KLIXWS
	 qhkWLAnVJZMJlBUE0lGFvFJrLCAIbdvIO77VYNCjjS6q1C/VaPuBc4ksgGoPJdrx7Q5ED
	 voNoSTSFa7Sn+hLcCitzu+g27oNba9oAR+vns1s1oOlDIhBAZS5dAwlNv73CpTJtvsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795190104;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=grKFuqlZy/vF+EZ9KT+ynP4RyPsh8Pe65v03F3LVnyg=;
	b=nhQhV5rDexUKETKTJddoETMeh8hizkRF5L0kI5HS08mo3SH1nqhhwsGfXZtp9XFNTP2D
	 tshE9fiF+K1bHumF3Dj5TdSgCkVx6Unkw/sCRDq3IG1lm9gv9YxWWabhbq97MJbr3IrTt
	 GrrH56nIZSscVOlmX6Ukbd+KRXOKOHi7nayGcrAKI1RxeujKRJ8CpGPtAU4gdmCipQJJE
	 hV+nsPgmw9b1EYH1uQrmCGP3+cdtMv0H+vCs26tKMJDdx0YzYLeDmTeDlTHcFfLRmDueY
	 RShsLdkI38hizvaQoDzg5De50VtYMw04JFEhyuA9feUB4boL3ejX2IHWaJIw1KMUozQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s2kOcKCi;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D6A60A5BD7
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 15:55:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9D6A60A5BD7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s2kOcKCi
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48e47347279so609130f8f.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 07:55:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795190101; x=1795794901; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=grKFuqlZy/vF+EZ9KT+ynP4RyPsh8Pe65v03F3LVnyg=;
        b=s2kOcKCiOdhayP7XlDN2K+jTO88jXK32Xj8Z2koNKcodABBvPJzDEE4lrX+uH+BskK
         0j3ep3cMpa603H22Sp9sjtiY5cc1X+dlyc2t1VLetPq93hcTtVn7qjJY2XO0nzH2u3+J
         jISqCrmykUqbgdHqNpBZMZn42xrQi+HUo94jrL0T5wA+C1RQjryX/goit+z12GCpIuyX
         rTN6a/b6TrCLyY4Tnt1HRXy5HelUHYJQ+iX8L9yCnRYQB+5LEeJumKhULoWd8pZfTJsp
         jAgjEBkCFcppCTLmOUI4cipO1YR5A9A8vrYTly24tBfFcIjv4eHRHrgGaKouh/fAOe77
         Egfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795190101; x=1795794901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=grKFuqlZy/vF+EZ9KT+ynP4RyPsh8Pe65v03F3LVnyg=;
        b=shdKplbrsp1Br4wwYYc8x0v/5pSpn/Hs+hq4+VL1K++vjyIZyaDeSzkD77/7PBlKgA
         anZCLf5dszNe6+1J1Y7SVxqjzh48TExistPe4Ybi8WPcYGYYW9XweUOKYheXeLOONWDL
         foFTlQAc7xfTDwaEbRvj4+EbQ3CLHjADZvEkwOB9xnDFqMFBJTTKdJiwQhPf96tOV93N
         P/FcMgvOaf3W37O6uGrC0e1ovne1jJAi98qkVFEHObqvLm9E4WKh+cwEW8QAegLl06nI
         lYZeuwSxJMaRmb5UQjYgB9cT2A94XM4y1KHFKuZfer5jzlrs7Oxs+yd/WEbQocZokBT1
         BgAg==
X-Gm-Message-State: APuU4Z8035zwdFmRdNjeDzRQ8cTm2yn9MZMoVjonWjmiLi8m9t92bJho
	5FvHp2kPz1gtBz8CjYcxRikLhRHWCpa3jcoKt1x2EGwu6IoluHTtJeQPcQgz4gPXqH4=
X-Gm-Gg: AYBFou3av1pzRVJ22903i4FrsYpZSqZFglYjOX1LTxnFMa7Y7XvF9Ol8W1P18YZVUc1
	ZNxVGg7f6X6/dXDRNMNFcc1jNF9+DELKiVlQKvraBsnrDPrD0xwiRHpiltjKQ6eJ0oKmsIowNEt
	/2JI15f+elO7LJ6vY8nAiO+r8q+Pu30wv5gqcwO0yvcAJGjR+rzti7zORbS8Rq3AyyxqdPRCtGf
	9I8I/DvoSp+hPVQRoVgZTJA/lVVL5kBjukzf5562RivXS+S9M6TLG8r74bJ/KIJ1SP8QYxZ4HEo
	fGmCJnjQBkxmRPWePnWCfeDPeNHEHg/gHz/60YkmybOOK/knGIySXtgGn4I7NjSrRcPC6SBSe98
	2DIkfEeJhXwYfHTgO6kpcPkzJbiL/wo790T6Eso4pXi+U1e9jGwlLqNJluzfd2mMI/5S35eWvlF
	YkeP+Pebwid4KFVfyfUEN0OtuOAh0EaW6Z9sNkJO5+CZ9pxwxfeMrprXsOVPINixOsex1wN0qM8
	9MVLlNvT03YMmtEOIuS6SIXBe08sC2H0Y3lR5qKsQvBxh2lj5HxjAhykzDqkDiDvwukE+ZuHEUm
	qXn9H4w5ZaMud0EJIvVomCwAIJFTMlyqlk8DpblO7JHNm0fa0rQpilLIz8BM1ijlOpidvcCg5rA
	=
X-Received: by 2002:a05:600c:3e0e:b0:4bb:6a5a:783d with SMTP id 5b1f17b1804b1-4bb88929c63mr74999345e9.18.1795190101297;
        Fri, 20 Nov 2026 07:55:01 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a15absm83982635e9.9.2026.11.20.07.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 07:55:00 -0800 (PST)
From: Abdur Rofik <rofikcoga@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	phone-devel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Abdur Rofik <rofikcoga@gmail.com>
Subject: [PATCH v5 09/10] arm64: dts: qcom: sm8250-lg-timelm: enable USB Type-C
Date: Fri, 20 Nov 2026 16:54:48 +0100
Message-Id: <20261120155450.7719-10-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261120155450.7719-1-rofikcoga@gmail.com>
References: <20261120155450.7719-1-rofikcoga@gmail.com>
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

Enable the PM8150B Type-C controller in sink mode with PDO_VAR up to
9V/3A, and connect the OF graph endpoints for USB DWC3 and SuperSpeed
QMP PHY orientation switching.

Signed-off-by: Abdur Rofik <rofikcoga@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts b/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
index 6f00495d42467..16ed6b3871374 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
@@ -9,6 +9,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include <dt-bindings/usb/pd.h>
 #include "sm8250.dtsi"
 #include "pm8150.dtsi"
 #include "pm8150b.dtsi"
@@ -555,6 +556,44 @@ volume_down_state: volume-down-state {
 	};
 };
 
+&pm8150b_typec {
+	status = "okay";
+
+	vdd-pdphy-supply = <&vreg_l2a_3p1>;
+
+	connector {
+		compatible = "usb-c-connector";
+
+		power-role = "sink";
+		data-role = "device";
+		self-powered;
+
+		op-sink-microwatt = <15000000>;
+		sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)
+			     PDO_VAR(5000, 9000, 3000)>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				pm8150b_hs_in: endpoint {
+					remote-endpoint = <&usb_1_dwc3_hs_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				pm8150b_typec_mux: endpoint {
+					remote-endpoint = <&usb_1_qmpphy_out>;
+				};
+			};
+		};
+	};
+};
 &pon_pwrkey {
 	status = "okay";
 };
@@ -659,6 +698,10 @@ &usb_1_dwc3 {
 	dr_mode = "peripheral";
 };
 
+&usb_1_dwc3_hs_out {
+	remote-endpoint = <&pm8150b_hs_in>;
+};
+
 &usb_1_hsphy {
 	status = "okay";
 
@@ -673,3 +716,7 @@ &usb_1_qmpphy {
 	vdda-phy-supply = <&vreg_l18a_0p9>;
 	vdda-pll-supply = <&vreg_l9a_1p2>;
 };
+
+&usb_1_qmpphy_out {
+	remote-endpoint = <&pm8150b_typec_mux>;
+};
-- 
2.39.5

