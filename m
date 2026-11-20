Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795190101;
	b=tCb8k4AxKgXvF2by40DcTVGuP4yFQ5h2uCtI0sFyCjz3Gl+NsIyAdAcn462lQx5pzZFT
	 1hIluvdPuF81XPRIBlCuFNHQ8AqNmG8jJNJbsHf3H0JvZwO/dHRjA5otlUApxeudjZTbX
	 YH3wuPuOLcz9sm4vRu+ZX4L5dbmJJAGbFT5IjTbf2l/BKqHpqKCzLvqwDKPQTLd/K7InY
	 953PDD7dOfFQ6A6HPMLhsph68Ilft8N3btnZrREbxkzi7LtGeCLM6zRIziGSbYpAW15mT
	 F0hM9lLou6vRKw0NqqPUd23tW16pJr0an/uVMeryXOpt1TxdD/on81YPXSxruf/qS8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795190101;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Pt1Ey6vqlrKjY9t+x5QDUocIGkE3O17FTDnJ0augaVA=;
	b=HBRR+k8fCNkL1FjyQ8xQhH7FkaAbgdmGpiwY6Xdtf6ZGhwMhmqTzDIA30HwyBY7LPy1v
	 IqunH1jgJDScroLPYN4hVcut7+8lJTyRU356b+e7uVD84VEgcx7YI7WZXb3vbSn672Xl/
	 V7B6VoCRGQUTt0vmBSFnXtFCRrZj1Hj5fJ/TZG8ITFm92jCoK4DbArhwgv35eq6la6RCY
	 w3/UmZaMM1ZquAgfU1oV8omHlpcQgBQcv0NhpqgEP35wsr/OYLOrm10Iw5mnalcHLZOBJ
	 YYZvovVU5cJybdX4nV8il4JfNz8WLl78phBO0taVEjO9IAfMKTJ2kTBFMknA2sqlJaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LAyWppn+;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5CAC60A260C
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 15:55:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5CAC60A260C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LAyWppn+
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so9333395e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 07:55:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795190099; x=1795794899; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pt1Ey6vqlrKjY9t+x5QDUocIGkE3O17FTDnJ0augaVA=;
        b=LAyWppn+jN42g5ue/7dWHD/Z8Rwq1gOzYhPpyTTLG+WF02MlqFwSGIxO0B+wQgN5ld
         hIz6rg73oHcqjK7Vag/IpGzqWwwnzY/a/cCaADa5Z0V90oK6ejnhzwJEENTZciKdwXoP
         Gt0WphRiPIhG+iIlFesuiTZ7Yc/Qzbu7EKR0vX3yAE4INm9y5QN1WgMyh2PsHUZaE/xU
         e9OHMF9JkVbKGROqvTn5JYcKeLjhqOTFPEgmKnN1uzVYgJTol12wujkvy1XkgiaY6LYS
         Uu+rFittCfRVMAEKrwKhOvXb3AKOuXRR72c+on0w2EsBbPbTHL4/WTrKT+K+ZJKGswEL
         Osng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795190099; x=1795794899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pt1Ey6vqlrKjY9t+x5QDUocIGkE3O17FTDnJ0augaVA=;
        b=ycCN1Ks+zZPyfKZRWRCGzHZ7K3yF/mUiClgIxRHnn76AbKsjKvybxWOT57zAuZpI50
         AmFZ1ObmFtGq24tJYJBxIni0kWkG1d4GIrJrwT2uN660ELJ/bebdxP5WlY+6RQ9VCKxY
         isRETwdbghXEjlH6oQYBjZ5XRglDUer8o0JtzGGwKeeoN3dSfQEQmefr02n9LixBTNcO
         uDbCa5uNB4W4lhGU6V82zBcl6yAu4iXapbJwV3Mb+mKrY0W/XQYqpgozM5DrCNgOr+P6
         IvOgp4UfbwVPt0V/jULzxq3IFwOAArAvXpiUE/VgK6KVMtRn0CrNLvEOFC4GmzsfxteP
         Q/Qg==
X-Gm-Message-State: APuU4Z8ZJ9HVKk+yooMoRdL6Xuw2OKDU7GUo2QCEu+Vle9oqm9tEV8+u
	BhorBr+XNNaBUxBSwkX9TFSt2AyVBl06/zo5EI1hKYHOj5eb4ss30ixBf6KzGqY6FfU=
X-Gm-Gg: AYBFou2jXxH00CCdYMLBdWHp6sMMNbcZUbmesfx5FVpdhSFWUPhqBL8oWj++8dQioW3
	qp9teUOFuYy716dPPf7VZjVgrDCX5gHz6qW2V9qFkjHKymHjsowle4ixbhYa2oFrMYapC2VNqha
	fvAhUTmE3KzCYkBZRskqp0gFrZisXhm/qyrN6zfqx9gQLHaZjJ5Hyy2vVhmeyZNNKlf8qaENnlk
	UKBK48S0MaLL9REV5M0BZ4TL2OXVV7lKnFIl+wOXDGvFe3TOuvyfqQo9C6/xrCgG/rUCGvDf7LQ
	IBnOvnFmIkXK+eB7JHvIVjqfdy8SZA8dG/a9Igva6pIi8AEC2z7es681seouXsTrzNsYs+yFfbq
	+BcRgneKqgLyLe3IQYE0vze42zK/i1KquMAC3YBjHkmwsVkI7Nd1UswreHjevT+mNF/wZAOsyV3
	TbYNAHOV15yHgcj1kpnnSDimN/1N3Ben1HzaVjhe2X1Ip0IhA8wwkgX+cl0ReZWxFp10a/OsCwl
	J/hUQJ4or/o6uwO0DqIihYAFV0b1BveBTYjbBwwbbyjc71s5t9bEMTSQ+prLbufmCL4+BPPsuB/
	Ri/ZchXLvBRStUVcIf1hoyUz2+Ss3N0y8JSO90wfSHN0E8yF8a4bDm/2X9tNEu9kbSqRySRVSu4
	=
X-Received: by 2002:a05:600c:638f:b0:4bb:6752:8400 with SMTP id 5b1f17b1804b1-4bb8881a2bbmr71997325e9.17.1795190099296;
        Fri, 20 Nov 2026 07:54:59 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a15absm83982635e9.9.2026.11.20.07.54.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 07:54:59 -0800 (PST)
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
Subject: [PATCH v5 07/10] arm64: dts: qcom: sm8250-lg-timelm: enable SW43103 panel
Date: Fri, 20 Nov 2026 16:54:46 +0100
Message-Id: <20261120155450.7719-8-rofikcoga@gmail.com>
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

