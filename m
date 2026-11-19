Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795107274;
	b=boL+f75AeeRjhNzEIwZ/G6HGdqPj9SXtYAJ6ORxW9D/wz/nQt4xJj5YWnNCHoGTjGOko
	 ywxsoU2eU3A3L2syYixd2deZCtlgWyptll8kVvxBNcyfg6yLbe6+v2yvB782vtHj4V+Xu
	 yentQ47ZjsW2W4K88GqXHh7+nNDebUncIaNaILGvhNcdY1cBMTYHAUHEzqeiwfx4UnE6T
	 KX9eq+iQPDRRNebLpdyFskYHjEbwEDaA9PFp4C38cBo1Bf/h6KhNBqHCZyM89xGBuSNQ3
	 vGAa6y8RvP58VodIXG/u3PjIxC0+ZqcJSzpWILCux1hz27POuHzrUABPh4toU7GJ6ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795107274;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8HAdjmJFS/vSTReOhqoIJm4R7O9SEUoXAZM3wxNxKGg=;
	b=qOFlpzu2/eMbSBPsNHn9KSBpdBxvUZHZKhWn7WiplXAG8VcA0hEaku+5L524+jEFALXA
	 1LbpvmHqwy0ybY+z2ZvZMrPzmGp9GS0nh4ZMPWCiAYMUS6YQJCI9rOqMUtOn64k9rynHL
	 J9w2jpa1PdSiuwngS3G0Y+N5JEC+pjWkcnIj3kXZ76jYQVoMsTp3UYKZNP8THa/Ro5diZ
	 yCc0mZjiOeIAQAHLw92CJVXQFsRAvbFw92OiwS0b63LwjFMu/oxMDrRgkp8Uq3CG5491i
	 x8WweLV/62/CIV1jH8lPmbbem/xb++xca6FpkDYEgYgT3Bl8uMDTWvEww+x5UIYgeqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tWxDVM+f;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75BBD60A6F61
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 16:54:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75BBD60A6F61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tWxDVM+f
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so20325665e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 08:54:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795107273; x=1795712073; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8HAdjmJFS/vSTReOhqoIJm4R7O9SEUoXAZM3wxNxKGg=;
        b=tWxDVM+fAapdNLO5oAWMSWtAihRfVvePxg2vTZOMR1EAAz1T6LOrtjMhCbIyJukujb
         CK8xrym1k13GJeg8eVnp9YpO7I8Dml4JbqzQPDDNTW260lmsIw1Dy+21wMRdeblnV8GR
         rHisEaxrRdyV7+Iatn88T/yvi4WJXXkqtg4Teig9r/bD8OS9HsoYZmSR6+eLHfTP+TaK
         n8Q+MisHDTFGPTSqSsmHX1qPdRCEoAmYQNGhRWvVjUQVo5FFWYJO8fp22aEacncxuyIU
         NufuF4F5ndIjeqeCEhW7rSePkv+nfoUuAC5W8V9Omo7ibEFqK78trnrigzgQ+6gXRKnz
         5NjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795107273; x=1795712073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8HAdjmJFS/vSTReOhqoIJm4R7O9SEUoXAZM3wxNxKGg=;
        b=JqaO/JDMo3SZaYOmYyCRk4WbNXALItojdliNylymra5/911ESort0yGdwCRerYFGL5
         fyMiWuWYPcMFgYf0677n+gUBzJeCHuW1gRSyJtEQmtChkHKF3U5ACgaA0Nn6F+HUmTsQ
         Y0FuGPxgvYiBuGtL/0dF2f8LUH6fF5Y2QH2BpomWb2UyaQVSHhjp5Slt0eZakQExTpXk
         01cvComXZOqEh29eo+Xc3NBigfOBDhXPSx4zMQb20iA7Gg8our+/8v/Hwg1NKf9SDmGG
         gcmgEn7J1QdCSi72dilEDDxZTOLDbOc5FtL9E7EuYhhVOx/zr0azu/iNP4+LlxxCFU5/
         FYMw==
X-Gm-Message-State: APuU4Z9BsZt/R5jJbgTv4oAayE1cOhwKmKwtaia+lUFy7vtz4P3uVOI4
	GbzoSiJNSSTv2XO4teuwTF1K3VQVEb3korGYGBcXkacbwPM4p0uCL25HmtXLqcqiwdE=
X-Gm-Gg: AYBFou285/1uafu8wQfe2baMk73+klIDMoCNPo3YZrQBJPWbiO0q0T3i7Mw0GRCBOs2
	6bSXQ1XycZJZym7hs55XGPNhXKP0msb4jF9XMFE93eVT8S4oLUU5kzNTZs9ERiWDj1jFSHKA7VV
	OPbI7tIovmroN3M3YKTQwQksL9in44oSI5Q8vFYfD0GeFBWvP+zQB/jBP/7BiHHeAKZFRsA+q4u
	16Vv+jaT6+zwBccTUCjNz/t5Pv6o+xBkr0VTQkjvFTm+rqPUwYQsjP5v0IMVrIGv1d8jV370mkV
	NjYBZF9XWLw97aYJICAS68jsJCocEKmpEqGwX9APAHBCpJqyR7YYuTqtKcq7wJ1ZIWDKInaoKy7
	7Hyj6utV0KYpz4dVsivwHZTQ+hdUD5zkhmfoIWE10GPpayoO43IC1MGRDUHL3diRVAA3TmLx1dy
	hQF5sC77h5JhlfS5vz2N8ty6EFQF1TsFoicZuGZ/hjwiBhxAfqa7OeeBFJwTLGtLZStUYwRL1CU
	z1G2bOewbvO1IQ8XdWnwmQarnJB79IwxU3tI19xXzdwzL0NNTbVOrX1DObuiVUyFeyTPjNnjJid
	N1pZUojF8dr0NwIiFAPdaqbHq1B+xN/+/tLT1fjkmjpGbR1q0fPgK0wyU8UZh2lLNhPDvY+wqSJ
	c
X-Received: by 2002:a05:600c:8b11:b0:4a1:dda8:eb73 with SMTP id 5b1f17b1804b1-4bb8881c630mr1984605e9.27.1795107272825;
        Thu, 19 Nov 2026 08:54:32 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88402ce9sm9894555e9.0.2026.11.19.08.54.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 08:54:32 -0800 (PST)
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
	Ivon Argel <ivonargel13@gmail.com>,
	Abdur Rofik <rofikcoga@gmail.com>
Subject: [PATCH v3 09/10] arm64: dts: qcom: sm8250-lg-timelm: enable USB Type-C
Date: Thu, 19 Nov 2026 17:54:19 +0100
Message-Id: <20261119165420.24466-10-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261119165420.24466-1-rofikcoga@gmail.com>
References: <20261119165420.24466-1-rofikcoga@gmail.com>
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
index 160b6f4c98b17..3ce8161574a95 100644
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

