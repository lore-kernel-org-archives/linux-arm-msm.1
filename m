Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795190103;
	b=IYH3K/m759LfhhPylfka7rxF/zeZLkJ6UfXeYXSm5FvYgKZGlbsua4ZipKBipH565HpY
	 Hd5R7bp1mknAJT9Rb2EhXpv/MEgSNm6FmAsISQISyhk6auBO7hVex/BChUPIeJxRRrQJO
	 ze1vMJlNBOPxpWu42nXFaMw+rh0os3PDK1SqT/CoAqLtBTDsv3On0DA5NuHjRz8n5BK5m
	 BclZAnmpO9odG3PUj5hi+AujP9oWT6XR3scD1+PrKoUpmALCAERsWvA0tyCwW7Ub7dlmx
	 nvTthmnw0HteyRZ4KjGX24lcQ9mu6JMTzm3r0DFtAwcDmmF0E/uz5kRxTbZhHG7Mjaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795190103;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Woi1KVVkXXGab1Y1GMu8DNbprDgDmJk8VMTl2ZFXeN4=;
	b=YaEWH/yWaEUQrdNXfRU4k+yWScx27a5gc+PdMydnNjP29UmV/5LfSqQBYnJMnQuDQKOa
	 F7XNyDuK4cB69CtLgrbig93JHUErbVglY/yywf6L0LoXQHFt1l7YzjixrNF+wK0hxYBTn
	 Ls7m3EaUABmblzKBte+u1MEmw/umUfNFOlgke3i1jkoxKgjzv0Oqmj5TFPXgVl87JtqHn
	 nx37R2UqMjR+1O44Cil/NcTNFOmC/E5lO8DY4WwX47EWD/puD/Tm4Hy6Yxreru3C1b7xc
	 H/ugGJn7vGz+vBKdliec9Bi72DDTAJrQrAONvjDStjZzT+R7AadhvECv00XwLkTbVvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OJVMJzIY;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F4FB60A261D
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 15:55:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F4FB60A261D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OJVMJzIY
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48dee593f18so928371f8f.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 07:55:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795190102; x=1795794902; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Woi1KVVkXXGab1Y1GMu8DNbprDgDmJk8VMTl2ZFXeN4=;
        b=OJVMJzIYubhmvYoRu9x47nJJXRiM4PhgvEsOk5u2w7awypoHsv7Zry8W1hpyz8KZZl
         IWM2QAmIzGaDZRfRo7PFA+Og7OK09Y/f70tM4f3IZthspZ46KMsl4PNbC3cborQeX/hr
         6mziUoDEgRixsiVciG3swpELp3E+IqeDSDTDDWg89VjnGYryg+dY1P9EMqt6iqNffdzr
         J89vjOekPjNTdrOQixAQ+dvFLDZtiRq1/n52g4UY/NDcOC/2TPr+tFm6tR52GIR6V+FA
         UeWom9G6/6ndj9hFHVVgPNZiXuJIUuyWiHMABzEPk6oSezpkypKakyOX5JSBXRcd+LBo
         dILA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795190102; x=1795794902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Woi1KVVkXXGab1Y1GMu8DNbprDgDmJk8VMTl2ZFXeN4=;
        b=K2aquORpZ15HSGnIPim6We3SFSGuWWg7JQR3eBZZnL6OEjdtGFsmKryLXw/7za5X68
         Zfm70AvAECfjYC5QsQ4BtiF9Mh67fRjV/WKbW1nmsLVP4DSdF+SPtxFhITjgqgmEeOot
         ByntSNjMltU7h2HA8QhVOs9iXMqTmiELxZNQtmVvRZk9kEva1CAmYY4GxLwln9DlS80u
         SInAOl95zP/UXNlRf1vsezR2Uq+fsuWdfOxC7sbTqd8A1tqBI+afuQb8B91frsgVT9cB
         w7kHy505kSnfI6pOgaMXuvjaDZ/YMGC4Ru818X9YvRlefuQvvlH67/gF0XOfJQzFnQEv
         j0WA==
X-Gm-Message-State: APuU4Z/RpvOURKyzihSPjliGHKnftUaBleO/Hrwgz2XZR6xGCqzVAPxH
	SNPoscxauO7Vq2yfjvJZLFsedwXdD0d0NjUXQhSZDDt3mVP74Y83Wn0TMKjMajLG56U=
X-Gm-Gg: AYBFou16SQb8xtfyrlfrTwt29ncuCRI7gCapaC/GAz7+UxadQcYc5s/QoMaa8lYdgTP
	iruVWLgglQfDh3cn7ntjf5zgQ3ecxMhH35txtpSQkjZX6FppzkLwZbEEt1V8NPkGpG/EQG3XEMu
	qRBmmYHqaaxStCt4GL8O0E9KmTvva5cgblBF0X7ALlidNoXD+osHHQMntfu4iF6MID9DUAYrUnK
	8wYkSd3I424cHu744IlfM8sGRd8pXPm57xKuLryvKMxOglb1dAZCypJJ8/yZQSyN75XD5oRckCD
	bvlzAnq7ZNS4JWh4g4nn4yeo4GZnhSHhvvv5Qrh6lJ6QGwWRSngDdsoE6dWBeFn4AgI5u1+PIrD
	Tt3U6QKXeB4JzoEY9tvYkX21BFkMxsINSCZA0dIBPrzlbDUyfiEzERzQk75VM4pHPEVw/fX1MFO
	QxZ8ZYJzD/WOQ7gpqPiI/tsuG6V5Tnw3hvuaGew9uIOaMQ4ocQBfaGh5/1T2QIi5YRbZWUbop70
	aY8XOcoNpJwsf0vXx/SLY4rKcku6B6RVCw+ZOslXeAPA89sZ7pJhijJMHH1rC+9u+XFT7YD4UDs
	mxnsuqXqYrrUCX0OpPHgVCU86PeB7rAYkgI65iG2zj2EDbsrdMSHK2YGKqBZoyAH3KFFDhYcqUc
	=
X-Received: by 2002:a05:600c:a085:b0:4a2:a9:ed87 with SMTP id 5b1f17b1804b1-4bb88811c75mr88092485e9.19.1795190100244;
        Fri, 20 Nov 2026 07:55:00 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a15absm83982635e9.9.2026.11.20.07.54.59
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
Subject: [PATCH v5 08/10] arm64: dts: qcom: sm8250-lg-timelm: add SW42902 touchscreen
Date: Fri, 20 Nov 2026 16:54:47 +0100
Message-Id: <20261120155450.7719-9-rofikcoga@gmail.com>
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

Describe the SW42902 touchscreen on GENI I2C13 with its interrupt,
reset, regulator supplies, pinctrl, and native 1080x2460 touch area.

Signed-off-by: Abdur Rofik <rofikcoga@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts b/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
index 709cf9674e2d4..6f00495d42467 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
@@ -107,6 +107,24 @@ vph_pwr: vph-pwr-regulator {
 		regulator-always-on;
 		regulator-boot-on;
 	};
+
+	reg_ts_vcl: regulator-ts-vcl {
+		compatible = "regulator-fixed";
+		regulator-name = "reg_ts_vcl";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&pm8150_gpios 8 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	reg_ts_vdd: regulator-ts-vdd {
+		compatible = "regulator-fixed";
+		regulator-name = "reg_ts_vdd";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		gpio = <&pm8150_gpios 9 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
 };
 
 &apps_rsc {
@@ -461,6 +479,28 @@ &gpu_zap_shader {
 	firmware-name = "qcom/sm8250/LG/timelm/a650_zap.mbn";
 };
 
+&i2c13 {
+	status = "okay";
+	clock-frequency = <400000>;
+
+	touchscreen@48 {
+		compatible = "lg,sw42902";
+		reg = <0x48>;
+
+		interrupts-extended = <&tlmm 39 IRQ_TYPE_LEVEL_LOW>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&ts_int_default>;
+
+		reset-gpios = <&tlmm 38 GPIO_ACTIVE_LOW>;
+		vcl-supply = <&reg_ts_vcl>;
+		vdd-supply = <&reg_ts_vdd>;
+
+		touchscreen-size-x = <1080>;
+		touchscreen-size-y = <2460>;
+	};
+};
+
 &mdss {
 	status = "okay";
 };
@@ -580,6 +620,13 @@ sdc2_card_det_n: sd-card-det-n-state {
 		drive-strength = <2>;
 		bias-pull-up;
 	};
+
+	ts_int_default: ts-int-default-state {
+		pins = "gpio39";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-pull-up;
+	};
 };
 
 &uart12 {
-- 
2.39.5

