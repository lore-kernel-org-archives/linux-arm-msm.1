Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795107272;
	b=x9rkH3xmn8qOKcEIAoG4+eumqmAiRpo9Pwys2Z3gQBpcbeApLO5jAdRBleRkUwlnuu1j
	 JjRQqTMaYIbTUH9o9v4bCnpGn6rrHocxtiqSlU1BppS4HEbbnTgSjy6teDjQ3Kq/WBK0y
	 eG4g1uveKsmI2n0k9MvfRUW5CbW1USZhtS+QEQXAqV1XEwstC1m5Goy8f/jVDvYektJ14
	 Sou5esodDp9clEIPoAG/BuqvDCtjhKAoNoLfzGuzyZz7dV+XSxeWKL7PbLeeMI/ldTjeM
	 Sx7VvMf76jdUbQ8VXObEBL4WxS+TUwaLi96yUa4C9wBvJwABCxaMEXSv9RUzVei9KlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795107272;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=tqAZ8i8YHyd8H+59b7YVQzKbswaS0aGE8O0OFJI4g/c=;
	b=TbV/9DF6mCYXSOg4u5YaCVzGX52EVwK0g3Fp3ownO5IZsUXKiLisS8G7TM93mxp6rgAo
	 rNgPIxAXgvhCqb+S7zcJZUJhHsHryf7WiALJYiOP3mnBa+oqVpDbOR/2PQpdV0TUaSdUS
	 Hf+qXJLOT6FV8ommmTEQPq8NUl/gAjJKgg+OoyB4+3Mld5nxoYaV4Dfp1cCG5BqQQ61cd
	 3ZqYwr/aMUfsHXJ4BM7D1SKgPsdcLJjIpyvxaMPPXoqVY1SqPkvUvnvVyukPGjVj5QCH6
	 T20SuWE4qxlsM4GIuSDE37y7cv5Wef6xvT5lXbv/IpnC3bBA/JO7nNXShbUx2RZOuXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XjvZK7Pu;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 716D4606A339
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 16:54:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 716D4606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XjvZK7Pu
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bb6c7b6dbdso34541475e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 08:54:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795107271; x=1795712071; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tqAZ8i8YHyd8H+59b7YVQzKbswaS0aGE8O0OFJI4g/c=;
        b=XjvZK7PuZi8XTLMQa9L1sxjKmZ99wpMJwrPePbpWH07379UZUNok+6QSl9OC3Kggox
         FeCAOTpSGChqgFOVuCTcHjorrGpGYc5CohQoABPLaPZBcDDw17Q0VZW2GZshTqjA5iKQ
         Wi4a0lcEzN40ZbpCD02r7Q0jjIVCCJNzYofqFcHcPD/AaAYTQ5IHBDJPGOygekgGzhdN
         dIjMZvJgXgHZW/k+CljgLPFPTkvnB5OG5SMpeR+WlZVaF/cNyo0UeXmqPX8BP/GRobN8
         epQmPJeLpAp12sX9EPiUxmh3SrM2MY9gu8A5HVpKexGoiKKNmeGTZraqbvC4Qz+fjM9e
         7yzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795107271; x=1795712071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tqAZ8i8YHyd8H+59b7YVQzKbswaS0aGE8O0OFJI4g/c=;
        b=EYo7SzFlkUnBpyou+As/5AZoE74gPM9cxoNmeKJ3FrtIIP/gCk8ns2jmi0K7lN0fbp
         Pa0/FFdEHYejuR1e0m1WAzs8OMx6Bi7WCP5T8J9PNT9ypmPSy8WerHnrHLLQ0b0tsD/i
         P8eUYvUUKnYWDnsS8OSonlaFCDAKr9wZhXDxXMqn0jARNeoQyDp59vYYdAUuoJQY7gWR
         J6wg3nV92t8bgXZs21PLiha+nDON3T9kG+54wySYJJcUiCmrBjFUcZSmMACWd4Y4OHap
         zFoe+ewlgeOIPJcFNjsLXNyT9zLLGFvUdUbEpGcY8oyf0UxFcj8LUBAcDu1ZMsNmu1TS
         JZRA==
X-Gm-Message-State: APuU4Z+czFWT8TpyNsOO4eumjGfwMQK9ZFhKUwRFcIR+nrI7EWDrZg88
	YBEK1N+hT0pmSkpWBk9hINABOLtiW69Nz9XxjfdycGou7scFcTUSWoJnYqqC96RCfJg=
X-Gm-Gg: AYBFou2TrAAWzJ+T97sYM/SWZdu88wO19n/qN9ugXOo6iAvuajJVQ/fsgOmJplEAE0c
	p6PiqS7gZgRvD/iKL8Z0t1sb855nsv1zEMP9//Zr19MVP5G6J30rYg1S9iBc/PgDPTVUIFim8Yh
	+XzvQsQmyKAV7QF+nbyG7/ZGMSIALOz7uKREqsDi68xJLO6HlRWasCRQAcx65TOMKm+10+DN4cC
	0QchEgULXo0R4ou5xsMuapbGChOjZLNKs5EOd0MuvFtThgc7h+xUM6EgFfo2GnzZ4TWHVYycbLA
	2wL0v8Q1Ah665brLUynExETyyeCpxvgvpBzkyw342Nxq1nqz6evyPFRXV9VGJRkidGkL65iItgZ
	13s2gkyT1QLgCZBWJR96t4jQpWfhA6nhd8b/astYL2Rk6J1hKzPJD7JgjnZJUKycl0jvx+mcqwX
	uI8klpIuPfGtaMnGfY8UKnT5aRGOhcRK4f9sceik8Ri1PU011l/JET2LYzI1dhcNK78oo4irNZz
	t1G6tEoMYIOJz6bATzv8ZVVsNbD7j2gcMLzcvUl9cIVtiun/rGDPTxF8gJCqC9fwsIK+GBQbxGh
	bHKXZDNS3k6VDeS2DgIAeow0w85j9QDN7b4OXm5PbfWZNR9pVoKTu3VuCVXGRylsou6h040RgII
	=
X-Received: by 2002:a05:600c:8184:b0:4a3:5a7b:6002 with SMTP id 5b1f17b1804b1-4bb8881e969mr1657545e9.28.1795107270775;
        Thu, 19 Nov 2026 08:54:30 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88402ce9sm9894555e9.0.2026.11.19.08.54.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 08:54:30 -0800 (PST)
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
Subject: [PATCH v3 07/10] arm64: dts: qcom: sm8250-lg-timelm: enable SW43103 panel
Date: Thu, 19 Nov 2026 17:54:17 +0100
Message-Id: <20261119165420.24466-8-rofikcoga@gmail.com>
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

Enable MDSS, DSI0, and its PHY. Attach the SW43103 panel with its power
rails, enable and reset GPIOs, and four-lane DSI link.

Signed-off-by: Abdur Rofik <rofikcoga@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts b/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
index 00e3fa560e95e..59d6c1518a469 100644
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
 	google_assist_state: google-assist-state {
 		pins = "gpio1";
-- 
2.39.5

