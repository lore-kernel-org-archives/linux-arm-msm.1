Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795160050;
	b=EirTeWMcd4++DYFPTkBDoSATcAJUoTYus+2e/ukpBV+gSu2dwiEq8Wq/ziYVv45GBz/p
	 uZp5u4TsOlYdFaIEr7htozS+HTBYUbv2oYCgcJgwk9dpde2o4JuVteae62tZhdj+lu/gj
	 OknqLO/bxZAoUs+qx5ackYdVROaMUnuruKuBqilT1eftSaVn9q/27301K4OwtmTNuIRoJ
	 EagMDLZq2XtZX8JlwL1tkkVcWJwkH/R8sV9Gt92HDktTzBLxD9vdqA5NiYrrUt1wNBsFq
	 XcuHCTURLahZeAhNuKhHG4NNuxZuWFgA5Zx5DBc3uxdur8IOYcEcRZ5cKbRHiFCjw9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795160050;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Pt1Ey6vqlrKjY9t+x5QDUocIGkE3O17FTDnJ0augaVA=;
	b=s3uJv3d5yqHi+5ViQrA4whk3/Wa48WwsTYuKcDT5K0tcaVrBnBHEXxzkhxlBvyU14ik6
	 j4narUWaUEBbzPAYJIzoFAo4w6IBVdovT0Q4SURWxdtStJMq3WNeXGcj8iWKk+UNPEu3+
	 sZY17czOcF9XB+ENehuOnrDBE3IdykgZPhl+f0qx2czVRwCNtT0tVhxf0Go1VCzyG2G1i
	 XQsZrLvVhBdF20du9UirwkT84xxJKK9TkbLh68LVILYd6vmwOkhxhd+r0BHcGznpeYpYH
	 l1gkhqKqiiCRzjgfU5O9nrWRM5Ag6pj995z8hXAgwtF70Wm9UiucrJjqOEk5zbK6o5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Sk3PdhS6;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8AD560A3803
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 07:34:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8AD560A3803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Sk3PdhS6
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb61185057so3958855e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 23:34:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795160048; x=1795764848; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pt1Ey6vqlrKjY9t+x5QDUocIGkE3O17FTDnJ0augaVA=;
        b=Sk3PdhS6u6GXkbXWDqXN4JbGbmCkBpKSZInRKLGFgBkhxX9mXxArpFf+rNaPZCwxU3
         3CGUvU9V68SAPRRct0FFpaEiOvp0VW5tPkqFGZ43AG+z/prjGacZajMS1sC4yXfIceeE
         hrWO2FrbS/V76SVw4FPSbKRpvuim+GphReaxGH/r8zDBT5Oonid7RGlEX4MWZ5+t0ZgK
         oZ5bq4BfqdAMXHwVrJfBOEzKNDUUUHf3rvuyMejdrknr1/79kCKrIWrW/GqOwQ2ZMz0W
         eSlgH3ZQGqwuba/uOXHZZemAE2ZhC/awGcVUrPBI7kiXZtNMa328GJ7IYVu8rq1KSraM
         loJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795160048; x=1795764848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pt1Ey6vqlrKjY9t+x5QDUocIGkE3O17FTDnJ0augaVA=;
        b=22PUU8Hejb8niJmZNE8GZhcft+Nhg0AXNMQsxjp73bZe92k94cd07Y/FVC6ABo10F9
         y0TucOzUfxxs7OOFfSBvm53WKFoe1Zm+rEtd1f66fE8oKrFgMuOzWE0XzqeAh3Q91Vud
         zwMT6NFjL+Z7cTL39vckCpR4bxxji1ty9Q0iRZhXd6XwtUeWQni6nMPVF4k5KCO5Jbyl
         3XOWe2eijt8b9J6sk9DWx81NLe5fT0M0KRf5QAZDtx1vfDZOJDNwOMTBLDE8G8xWf0KQ
         vaAMtk5A7lDfJws6kqxdMRzSeS8y645frlVr1VDNFfsFLZeGupSAX9gBoUu2trImdRWY
         XolA==
X-Gm-Message-State: APuU4Z/UIS2Q4C/R6d4Kq9LPJtuMUH7NM1mmrk2MSeCJtG2POvBa0nZ1
	T2Lkn7EDurZXnDtAP61Dm+Ymz+w2vh3PgX+ojvE+FXhxVVZXuPUpft+8WomvfUlZtZ4=
X-Gm-Gg: AYBFou1PL71RTYVBmAhpx0zUZRe7E8E7RF1+Ct0DO72GtXlhMX2BJqpzt5crtTBfiKE
	td1ZmlSH2viYFoP+ECFEZ1IHgxhqPOhxsMaEuZX5isYxuuAXPajIYF7OeFGO7e/CMJs8jNuy+sd
	aNW6P1HTkoX6DhoBuFNVbxF0ZJULc4JfE8+dgPIajVVKbxEbOJQz7HAWuspZO6mTIoLqUdAQMD0
	tNrFQRYTyGdS3oYqLCHj3kMLZH/CiIIhYpWj5dICeULceFlbEUzr1YisfqUh36mV9AWLRTHAHtu
	PlHQLfb7HDPVeet+mcnjb1oFOHmCA8mEMHwuwfuGFuZ199kj5lDo67BgYkTO/5YMb5Kv2cl7l9g
	RXbLHkRpvbLZgchgI3kPn1Sk0FRou9zoai3fZGqF8w789U6Bwvp6spw/4Iu8ppZgAhZF9HJXjy8
	IN9JYeipQOpFc9hLVdYogwgl6S0xjICP/UcStK9NQAvZf9DZeXgXK6vcTgfHHoRD6YeCOjMgO5O
	GfQlOVuTp9gV9XYYU08TIAhBFU5HLZohuYlhJfO7nCUTrPBV/LZQ164ZqzZK51cIN18QW4kbMOE
	ccjRCFsDxC/K2+AZXbEh9Eq912MhZPxuZLhShKm1166Iwj9vBe77s9oOYoZ5qPbx4ZRUBGx+Kd4
	=
X-Received: by 2002:a05:600c:3b99:b0:4a1:777b:8a12 with SMTP id 5b1f17b1804b1-4bb8880b984mr52971675e9.14.1795160048060;
        Thu, 19 Nov 2026 23:34:08 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a3a3dsm54154045e9.10.2026.11.19.23.34.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 23:34:07 -0800 (PST)
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
Subject: [PATCH v4 07/10] arm64: dts: qcom: sm8250-lg-timelm: enable SW43103 panel
Date: Fri, 20 Nov 2026 08:33:55 +0100
Message-Id: <20261120073358.10267-8-rofikcoga@gmail.com>
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

Enable MDSS, DSI0, and its PHY. Attach the SW43103 panel with its power
rails, enable and reset GPIOs, and four-lane DSI link.

Signed-off-by: Abdur Rofik <rofikcoga@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts b/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
index 20aaf70355158..709cf9674e2d4 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
@@ -461,6 +461,42 @@ &gpu_zap_shader {
 	firmware-name = "qcom/sm8250/LG/timelm/a650_zap.mbn";
 };
 
+&mdss {
+	status = "okay";
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&vreg_l9a_1p2>;
+	status = "okay";
+
+	panel@0 {
+		compatible = "lg,sw43103";
+		reg = <0>;
+
+		vddi-supply = <&vreg_l14a_1p8>;
+		vpnl-supply = <&vreg_l11c_3p0>;
+
+		reset-gpios = <&tlmm 75 GPIO_ACTIVE_LOW>;
+		enable-gpios = <&pm8150l_gpios 4 GPIO_ACTIVE_HIGH>;
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&mdss_dsi0_out>;
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&panel_in>;
+	data-lanes = <0 1 2 3>;
+};
+
+&mdss_dsi0_phy {
+	vdds-supply = <&vreg_l5a_0p88>;
+	status = "okay";
+};
+
 &pm8150_gpios {
 	assist_state: assist-state {
 		pins = "gpio1";
-- 
2.39.5

