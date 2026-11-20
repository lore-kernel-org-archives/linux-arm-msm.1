Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795160052;
	b=AqC4nKfSzOnfQQ1tOb9/Iw6Az47UXnI7MZhTPnh5y69ANBXQuHU2agvrYAG+7EmjaRtn
	 fRXwLiXnW9yk7fYPSreEEgNuNNKu9Agb59csDJt6rg7Yos5zixcA/VDk4OALi4A+ZWv4N
	 rK6FA7ijcGnbqZuqUx9hrIAijKomY8hS6PqhmNbWYg89BAwsB9bH1qpGY6T2TXElVADSw
	 RGxHFxlOcDrZcjASeGwwc/rcmkwwblA6gmlKhsGyqm7xvlJWED6s2wa/pOf/l25jyVtGn
	 UJdQNUrD38PClrPYhIWkk92ICrljHWzieNBb2cSahNaNxPstZO6wtQzY3JkJ07PSnEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795160052;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=kRnaLXMIjjDmMSY6mFAZa1ZXluewGJuLAGDDGmmf4rQ=;
	b=eTZFz7vHBP+Qzq1IFYFB+B465FbH3uGDVfW149r70Kd1EP3ZFMetujV2Z+/CNMZo+3jL
	 GRhJMzax3odOzCn6HuZfv0Er3h5wPBXguLXhRBbbUiNzTt4miToBSZsnjKIoW0ZGRsr1Z
	 7OOTWOysB0RAsQvqFk9b6Eq1bqP16Q0zwduBMIeiSa6jt/qNA+Azs3jSlON5ovuQX/Dvq
	 lCfT5i6w5N0PkFiSsakrk1HmRTGQjco3rsw89AGn3Zf8YMdQNHC4KtdIzkD9pWY7KMTo9
	 cyvlOUKhcXmEgJGpwd/bUfliCXVwhrg0In+89J7NEs3jzVn3yljArT04rg50IMOYZZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HKPNdU8p;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C709360A380E
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 07:34:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C709360A380E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HKPNdU8p
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so4317825e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 23:34:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795160050; x=1795764850; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kRnaLXMIjjDmMSY6mFAZa1ZXluewGJuLAGDDGmmf4rQ=;
        b=HKPNdU8p6BYIA0PhbhaC1eJory9J9d32I7tNCfsWv3fuI/ikf80iOswt2MD/UneDAR
         pZfsOIkqqGcjGwnK+QtkPXz76nrHkKEKIwP45S6dvMaiaSmTWRYOYMj9bs8Kvr9CqIhy
         UlpiewL52fQp4co1XHQk4F373mEW+dWSbBgzggPwt42FJHWZ7PAAtv//hGT/1c5aa2xJ
         /zbRclE/JIs2XkUT1vW3xRAdh6aefo8FO+wSmudGTq3AiCh0FSnZyAGRaqLKNoh5deiz
         cM5lGO7zQLxFPFWg9KsIf1xmHAtyWTRD7J4o+skfJ5KIHrZLemE6Y9/SB3dgKLtZsULk
         xLPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795160050; x=1795764850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kRnaLXMIjjDmMSY6mFAZa1ZXluewGJuLAGDDGmmf4rQ=;
        b=LFZkq4OQcT4Dcw4X2VR1lkkZq6TiRkscbzL4HtXZrtcqOOjd1ccxaSMszuC8VhArqE
         KrWjWfkCWPsWaKyFRbxZADqzJRbJoF3pnH1MlVGcymyndZffpXzGUNekx+T7KFVR3Z4+
         HSu/n5brFwHvXJl2i3TrYYmQ1n9Dk4JF5rx6AaVM1Hr0vARCOCNHu2ljE1CdC2LfMsPr
         XROATh0JaGKQ0Qv1srMM9dzKspwR1U9/FQlw7YzGG8yzjVWiL0hMxcLJfZdzPzsmuwUo
         +DPngzfPBK9dbuUri7NcwuflhttQLHq8s9UdT0K3EZHko+fdPDEk9aC+BD6bgZQe/3Sy
         W/5g==
X-Gm-Message-State: APuU4Z8wPXH+5f4a+nDJ2QgH14OJt8Vhm2t20iza0rgML7IoLZ6XEdsn
	3qgCg9D9OIKkblxLvdvlIt2hiCmQZvr+RKSDQHQHnjiOFh+Zc/Byq/IrNdaXXlHQMVY=
X-Gm-Gg: AYBFou3WNIgAqovwE6FqdRzhGPzr9FNgcZSKbSo3Q6NfqsciCBphJzYB434sHcY9G0n
	CvPl76UHslWQ+4MJ3n1AkAMzVCI8VM/T/67/Yoz7VB0wty1RcoDjmOV76Wr3UqWe6LadNw4B28l
	tDFdd+DpC129rv444KWB5yZue4c2vn+P9zX83QdB6HB5CqN4tOGKBrHdnsXB7YU69y7uo1/VUA+
	kbk2PtP7pSZuH0yu6M/A7P093kxFwo6G0cU347LnSSh4mKhQHXbcMGhsU8l9NbvfIK2CHe5ydzT
	5Yaj/XVwyvb3titwxqYxZPOZ5jPAGgEFmjzRFHADQDO4PZfOhw0iehz4aFPe+gtmGvRIJwW+M9s
	JwrbhdYiTb9DLNzvsB6hl2C9IDIq/w4eIxw9d6iVhSIZoP7kQ2ANCW1v41zmCuMyXBGr+9yRInJ
	YSPyZfiM0sAGCfCvez8nZ6mQW3/aUs7IWZquactVUn8PHHTwCRLRS2Wz/SjeftillQ7R13XsY8v
	UqZuZOb7tRhQWSQt1jKAz9yJKK7Wz9kPz/qtY8wY038LwHZN0JHG4W6mdMemvs8/VPl572uxgyg
	c4sASULyRGNn0ZkFQNKGW1iXZuKfSF5SEYrrj9uaggZ/DjpDGw0/3oCQ3yNzmZ1m+2Ri/3Mswas
	=
X-Received: by 2002:a05:600c:5246:b0:4bb:6de4:2f7c with SMTP id 5b1f17b1804b1-4bb8881c5bdmr46585025e9.20.1795160050056;
        Thu, 19 Nov 2026 23:34:10 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a3a3dsm54154045e9.10.2026.11.19.23.34.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 23:34:09 -0800 (PST)
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
Subject: [PATCH v4 09/10] arm64: dts: qcom: sm8250-lg-timelm: enable USB Type-C
Date: Fri, 20 Nov 2026 08:33:57 +0100
Message-Id: <20261120073358.10267-10-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261120073358.10267-1-rofikcoga@gmail.com>
References: <20261120073358.10267-1-rofikcoga@gmail.com>
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
index 16014df9c087a..2d8b06c05ecc3 100644
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
@@ -556,6 +557,44 @@ volume_down_state: volume-down-state {
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
@@ -660,6 +699,10 @@ &usb_1_dwc3 {
 	dr_mode = "peripheral";
 };
 
+&usb_1_dwc3_hs_out {
+	remote-endpoint = <&pm8150b_hs_in>;
+};
+
 &usb_1_hsphy {
 	status = "okay";
 
@@ -674,3 +717,7 @@ &usb_1_qmpphy {
 	vdda-phy-supply = <&vreg_l18a_0p9>;
 	vdda-pll-supply = <&vreg_l9a_1p2>;
 };
+
+&usb_1_qmpphy_out {
+	remote-endpoint = <&pm8150b_typec_mux>;
+};
-- 
2.39.5

