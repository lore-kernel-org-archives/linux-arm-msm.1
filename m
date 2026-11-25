Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795607653;
	b=TJQpmEjydkhtxwuiHCfjJwwRa5fVT21ajF2OyYJzW5kukMjWatejxf49QmwWfVwwqhWT
	 UXxVdWkagQpiwDN03q8nQ0I86C+KWd2U2JcaQJQ4xoWJiDY92A5hZYznVLFVPQh70kstl
	 WxmHQIvVcojklO/TXTXy2MIfqPYlDIWpgbkEHgx9moq4TVqKPcfDbxOgGzRTyatRLID7e
	 qE1CvbBcR/WHsUzXTgW97taKVnZ7nBRyP6H6rH+IBVgfw9kAxT2QfcDeI+CBAHw0TecLw
	 mslr3jsAacakzAXIR0yVGnJgKTEgJEF8qJsAlrwKVsyY2LSwt4SNyw1/uFcsdKyewjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795607653;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=bAP8MPVU72zIQ48DLEkAqxoVMqgbahC0A7QFbOq8d8k=;
	b=oQEJtiT9OUl3GItcLNsQObnwdcqMKKf7lcYFmM6okKF7sMKaMTG7LtRyB4gQlPu6HYBI
	 VJ6pTrxqcru9KkjMAMMU8hoP/Dmv54bni2T8Nqh117K0Yq9I80GTtEHdQZ5AguCmZiG2+
	 uitBO5rKtskJwQQWejfGL5v3RCAUrzsL2rm4mugLpuTASofHcL3DL48sQKdBAPgtphj/R
	 asG1yptfGrdetQWLr+oHW9h6vTjIGL0rxOMD/u1qKVUyXkFHXGLHsHpI1+EzJ2ExJM4Ug
	 xJjWKlJIEVRUADH5GoH+WEA++4v0KQnN84f1YSCajSVB9B6xxsmH+XBckvOIzkxtoIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=VYr03wKW;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E10E606A333
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 11:54:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E10E606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=VYr03wKW
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bba5e17728so5531235e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 03:54:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795607652; x=1796212452; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bAP8MPVU72zIQ48DLEkAqxoVMqgbahC0A7QFbOq8d8k=;
        b=VYr03wKWdp81/AEq0PLdK4q+lNYLmvhU1oSDotFNrmqzc6hodIiUPmfd21KhU7/icJ
         6gszkr1dVBM2lH5ytMxsHWFLrbtCu70nnxOd/5i731gMeY766P/8Iogtz6kEn8Y7A1p8
         80TNxX1kzioGYbToUmXzLavsqrwuShAcxGbpMEvhrjUSquBuYwYlPMMrGo0V7u/mQfdX
         SjAImbbRBl4H9toblKb/hOI6S7o0uZk1oNs+1QHFDEcya9V037xqbPQXalxaK5tw1Xjv
         v7WVSSUEB0hq+z2cB2sqKkxUtNlODvQJP1633Xh0xZApLTciSijCRN6T6g+nx9BwY0iM
         BnZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795607652; x=1796212452;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bAP8MPVU72zIQ48DLEkAqxoVMqgbahC0A7QFbOq8d8k=;
        b=S8pwiYNJxeeqs9DD3/jwaK2nkud1oC8pRTCdKmkGkd0HkJokPTIxtbuMW+4VkAQ9tM
         1BUDS6Ic7+BeLBJllnIHYbrIzsz1T7fL22JYvq6t+RkNPlak4JHrY1Hn2vY+5DnAeJSy
         W1NlZ2BsWw+EJcyQYsy8c0FaJGmgKCEdzghgtFN43dWnTZOuND4U+oIPqtNvDb3JVTMS
         GJaDBJyl9mSDu3a2zfH4w3ZkybMLKcFn5XXlzkhUwNETpRReKdcvyumzpJDn0dmSgple
         VEkFKq94HWkIKVKbu4rnYhY9IPomo8r6VyxVDDnWbomGmO1flXXwOVTWt02wHKSE/mAM
         zcoA==
X-Gm-Message-State: APuU4Z/jfQmCcpcV4qW2NN3vBbxKugIXQNnakztX/wymEZO1pHCyCAg8
	0oOeQtPTH3afkr7oJGkda38SHsjglbWaFv58vkLXrApCkJrsBpm65mOg+7jHU3x/SO4ArfkFldG
	wskTipTXh9w==
X-Gm-Gg: AZFdTZdDwfw9y5KpT0PF35a9jqPE24UQxnAC/bsMilaKkPpJBAyF6lRc/FFR9fWEY3Y
	CdQ/Gnx5DoDGW5fLf3iJlpH0nEiJazygOsYP93JTwRbuL2MZDogiedtjo2PLp8oQKZDqrNfciLE
	z2joZGT+SPB7gD60M6fxf1Jf5fswRtmcipEBsymLrK1fW6HyCWm4FOtHtb/atE+mo42+mgSKe/2
	KoVkUKEdtxP6ToCJfy9/qNP4pJjuCU+wjSdfFv5KbiJ08WwWxCbTa6prfRUcCgkp3yssiqlzEmC
	t5eE/1IjKWDNs81DIm3jyhvVA6OjZ0y3un9L4tKfvIdOEnLQybj9MjRDlht1Rg7jVKMbRhXpNqn
	v1vxha79gCX5nE9qOUGbgY5atPUnkXQcEWUhZUDi6SX2QGQ2UC+hFyQXY6bhB0yDj4YYHOK05Fq
	3Vgm+LuWMrINx8P96WLtOyloqapWii7iyAvy2J5pH2Oyxm/E6NsRhy5W+rOCdi7oiadtgn3UmKd
	3g+UF4th1N0CGNPEl3M23HpkVC9uCHedOKfzZdkma1EPGTyEv6JhmZ7w+b/JTSHBvDxujPvdYPS
	ythTl4/pbpbnJrrSfitwbLVIJGDkCoCdwn54km7x7pmJZqfe3SCgQHEZBYfKyv7nDMK4Ccs=
X-Received: by 2002:a05:600c:4e8e:b0:4ba:59fa:510e with SMTP id 5b1f17b1804b1-4bb8893014dmr361789275e9.23.1795607651454;
        Wed, 25 Nov 2026 03:54:11 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88f643adsm234073615e9.1.2026.11.25.03.54.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:54:11 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 25 Nov 2026 12:54:08 +0100
Subject: [PATCH 3/3] arm64: dts: qcom: sm8650-valve-deckard: add Type-C
 connector
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
Message-Id: <20261125-topic-sm8650-deckard-tcpm-v1-3-4af33e89ea9e@linaro.org>
References: <20261125-topic-sm8650-deckard-tcpm-v1-0-4af33e89ea9e@linaro.org>
In-Reply-To: <20261125-topic-sm8650-deckard-tcpm-v1-0-4af33e89ea9e@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2223;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=DGBMbg5rM7lq2dyPtHP6LsElM3jk6iwWqUc1wZ9h3LY=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBrBsxgiEbzIA8KRafCHDHNsipoFh7GiDNJ+Tty+Mnc
 tL8ZfhSJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCawbMYAAKCRB33NvayMhJ0TdgD/
 9xttoKME+78ra6+biaLxkSB+QzyMSiF1tayl8Na4Zj6GBm8AN+AC3mxyWGzPjyMjF7tDQmNsSqO+IF
 YnxASpHCxjq8BX1Ceo19IHxG6da7ni6zkloPx/l/RFt6RJkrVnGETdWy0O5QULpobTl+Z12mGs8i/C
 mXudVAMeVUC0+aUOOI+5McdEqk+yNT9BWY8JgdMP67/XD7USXs7uD2lTMoqcUkmv3okvxDLd9xYNqu
 dhMD4FdyqVmFlCjytSahLBeS0lC+gTgmyzFBs0nClaVdybyTqB1Uk3U/IaWHtLjhGP0YfT5YhcPuVl
 OsobrGfLANA6Ny8ZQ/UK1k/sYBZSxXQyan8M+OucaujfYkDheL2ZS8vz+fvAW/WY1BQ8FXpB43iVB0
 sDK3LkUYybDvbgUIQRhnVs38LbyPjCDnEeHp7xK4RaPODIwMYHv9uINJFUx/Wl9XiNRF1zBA7Y2jBj
 mj/ACFB3in/I4pAaEebcnjQnOP6th0olp0lNf3VzF6TtjHeBqaHv/QToH1Ea41C02q3O53yXXlMyPo
 8/Uhlfsqpc9ODMzLUdz8UmOWvH+2/SOMqDYGUSvBek4+7fvEjLULXzbzVUEpk5fUZG4KDLoXDpYPPh
 tpUzZV8PupxQnUtSryHaC3ZoxHMThRIiSJGznPVTBUROI7TG3rer6wGVBpvw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Enable the Type-C controller and PHY on the PM8550b and add a
connector tied to the USB3 controller to support dual data-role
and power-mode.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts | 48 ++++++++++++++++++++++-
 1 file changed, 47 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts b/arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts
index 74bc0728ae7d..0e68c5a6414c 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts
@@ -8,6 +8,7 @@
 #include <dt-bindings/leds/common.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include <dt-bindings/phy/phy.h>
+#include <dt-bindings/usb/pd.h>
 #include "sm8650.dtsi"
 #include "pm8010.dtsi"
 #include "pm8550.dtsi"
@@ -1122,6 +1123,46 @@ &pm8550b_temp_alarm {
 	io-channel-names = "thermal";
 };
 
+&pm8550b_typec {
+	vdd-pdphy-supply = <&vreg_l5b_3p1>;
+
+	status = "okay";
+
+	connector {
+		compatible = "usb-c-connector";
+
+		power-role = "dual";
+		data-role = "dual";
+		try-power-role = "sink";
+		self-powered;
+
+		vbus-supply = <&pm8550b_vbus>;
+
+		source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_DUAL_ROLE |
+					 PDO_FIXED_DATA_SWAP | PDO_FIXED_USB_COMM)>;
+		sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_DUAL_ROLE |
+				       PDO_FIXED_DATA_SWAP | PDO_FIXED_USB_COMM)>;
+		op-sink-microwatt = <15000000>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				pmic_typec_hs_in: endpoint {
+					remote-endpoint = <&usb_1_dwc3_hs>;
+				};
+			};
+		};
+	};
+};
+
+&pm8550b_vbus {
+	status = "okay";
+};
+
 &pm8550vs_c {
 	status = "okay";
 };
@@ -1472,7 +1513,8 @@ &ufs_mem_phy {
 };
 
 &usb_1 {
-	dr_mode = "peripheral";
+	dr_mode = "otg";
+	usb-role-switch;
 
 	/* USB 2.0 only */
 	qcom,select-utmi-as-pipe-clk;
@@ -1485,6 +1527,10 @@ &usb_1 {
 	status = "okay";
 };
 
+&usb_1_dwc3_hs {
+	remote-endpoint = <&pmic_typec_hs_in>;
+};
+
 &usb_1_hsphy {
 	vdd-supply = <&vreg_l1i_0p88>;
 	vdda12-supply = <&vreg_l3i_1p2>;

-- 
2.34.1

