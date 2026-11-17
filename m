Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919201;
	b=t8jcrht7DL0ERVmZ07CPoRi0bQbNKHWEyEBFZJAsOAcfcJmSFixXVCqt7hOl8543JzCw
	 svDyhwDdh/nZj4/EkjhtD7A9kgAhEXmYyLc80v6yAA6alHOsB9XwZjhH+p98Kloef9fS1
	 BgKUrVjfwafq+PoGsggESIkoYTz5HL1PpZ8gHL+jCV6f8dKln4is3KwBs1vqprfS6Oeis
	 OWXO6aqyCFocsAhUxNnn8jzyfsUQ8CA0MvJbVdjTBm6WNkKuUnubZMEAm5WI/nHOXQad8
	 UbDhuApijO3kD2zyR/XtYkhNNU+IjCZxCECdEi/Rb1SwTBGKHOlthHyyQijDxqbUYsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919201;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vjrAJfQ30bNb0haiNW552/JsaDvfxHWTHWoJPW/T5QY=;
	b=LyDcfpKVjaq6IZTNyk7BJcIrA9UrE/gc1kTkSfRP6G2kwyMM3p6nNH0pAxuDBCDGxlgW
	 aAZHAQlcwVCjRb4wN/YTb2uf8FKIJjhXpi/HvUePC7hEHZqgbICC+5ThZFpj6ZQ79ndHT
	 ovJGiZAZozB8d2U7tOqlCVoRiVQXDO5+3i6Esf+vp/cGzyC9Pxg5S5OngZuhtzlw/+anU
	 elxPoEsBXrLwiPuRQFwNH0g44yIb+OXtQN24b1q6A2/nkSzv1bxBLqNy5d7dyFQcPjpTn
	 uqROUXCt+wHsTaq7JItlNPW4839ojVGPZ/CVCEP9PG1Y/doi5sXnL0xYknLzpG5DOlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=amuFs9ok;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36BC160A6F46
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 12:40:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36BC160A6F46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=amuFs9ok
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so54760995e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 04:40:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794919199; x=1795523999; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vjrAJfQ30bNb0haiNW552/JsaDvfxHWTHWoJPW/T5QY=;
        b=amuFs9okLI2wRGNauxrep+gGsL+WgJninSyaPDOkEbfMWHi10AqUav2FKNgAwERcf8
         V7IB6M42D0ens0gIQNIPkVtXA+GlgitgDE/T7rM6Dlc97u7gzS4hyS4gFH6X8HoHIKB3
         Y0ExhX0hVl9YGII2y2SZVK/0Z81ZNZ7/S/1DAXzPo4mmNwD02YDsVjM7OXvof6xjax9b
         RxNowgKMcyVGzB24AobXPCvssYOu/F/FgK/lg8M5j/hPa7llwNTv73eKS71OEYgmdOjh
         6fYLD9cmVDCn/h8rw7RPMmeo+yAV7i0mpGYKAXXAHZMV+EpEJqIPNadAlkBDgh5j5J4f
         Vgxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794919199; x=1795523999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vjrAJfQ30bNb0haiNW552/JsaDvfxHWTHWoJPW/T5QY=;
        b=YA3mLR2fF5K3/eOYkIRwN+oi1/8wN9gUmi0aaRW1QdTCO5/7xbqrkHnaZANJLCXVsW
         UFy+0soHGbAUM1OI0oNC/BpxCIZW1HsLXOLzys/vpkMLXJoFY8CYkbcuIlQ2NBlYE6Le
         Zb1NUlBpingEVKexwgkWLcjcn6v0h8W1JAfXPIaNUvpyH9Key1ZMyd9RK6uExYSqlvpT
         XkTagQI509SjcQCjDpt9qM7/hUFrymVo+X5/5OOh8hpGc5PTzAvzXt5aveGgBr72FGmi
         l0PFxv1NlWG5MZi6wYk7Jpr3hbbGETBJ7J3cy9gtfUB5XiUHc7qprThCVVw8c+9GcMlX
         p7iA==
X-Gm-Message-State: APuU4Z/xrz/dEhL6Ikp2CcaGD9pYuE2cwhiNnAcTsQSMvAAUW1zKV731
	FgL+z4aKBk9j8Q60OeapCAFahN1XVeoMZ8q/qJKVvCUz28e1+ER4yfeBGblqiz+2JoITKw==
X-Gm-Gg: AYBFou1hXx6kxgpseBTU1uh3nn6WOHRUdzvkZGh6Yjl+BjVYLMv6eYaacF5OOocXEyA
	eHuCXNNs4DkWwHiz9ishqPqGg63VQLAgJ93sgw73cJ+VzWA2uRnM966lKD8DPywBOt5GdWeiRXP
	wJLwTAL4ak8Rnis+iYoWiYafmeG093nIos3atOQ4Ku9NseGo5zHz4h8QKxQLaZo6175x/oUH05o
	SMgsRap6b+wW5zdqUOQYr6FUiYHX51qT5lGy+scfEkiEWeibZmaBFxE7qVNhl449MGKUFz1TvwB
	7PKc9QTNuyrmmS+l1bWII3MRVZY8M8aTXUAwZkflPY7fc5zZoQb4d5uSHjuCJNckyGSSUZ78Ma4
	lnyOCLbm+47u3lIO2z9qIcOvTTy860CYLBtaqC8UqZa96VHXjPXwMGoceUb941duE/6c/FxpbKA
	jX4Baugs9CrVju78ZNBESa+jBT//vAou2gQQql377HUI89K8KO1FC/lDJKW9y6gQQjC4TjnvIbz
	G85/p3qbpnS/IiGRyVMjqmH30LTUZ/reeSfPq1FT1Ajh4zynRj7aK6a2coKey6e9DKnLa/vugHJ
	wJntjVKFMkSEmIVAAqiRFIY51G61m9hiWp7y07bMjv4WjDk0boMP0CZxZnRRTJbB3Nlwog==
X-Received: by 2002:a05:600c:4e45:b0:4bb:56bb:1196 with SMTP id 5b1f17b1804b1-4bb56bb49f3mr279082685e9.23.1794919199526;
        Tue, 17 Nov 2026 04:39:59 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (94-21-223-203.pool.digikabel.hu. [94.21.223.203])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783f8154sm71474905e9.4.2026.11.17.04.39.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:39:59 -0800 (PST)
From: rofikkerneldev <rofikcoga@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org,
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
	rofikkerneldev <rofikcoga@gmail.com>
Subject: [PATCH v1 10/11] arm64: dts: qcom: sm8250-lge-timelm: enable USB Type-C
Date: Tue, 17 Nov 2026 13:39:45 +0100
Message-Id: <20261117123946.668557-11-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261117123946.668557-1-rofikcoga@gmail.com>
References: <20261117123946.668557-1-rofikcoga@gmail.com>
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

Enable the PM8150B Type-C controller as a sink-only port. Keep the
primary DWC3 controller in peripheral mode for now; host mode and VBUS
sourcing can be enabled after OTG power delivery is validated.

Signed-off-by: rofikkerneldev <rofikcoga@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm8250-lge-timelm.dts | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-lge-timelm.dts b/arch/arm64/boot/dts/qcom/sm8250-lge-timelm.dts
index a094aa81ad225..6b57c658cf918 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-lge-timelm.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-lge-timelm.dts
@@ -535,6 +535,24 @@ &sdhc_2 {
 	no-mmc;
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
+			     PDO_BATT(5000, 9000, 15000)>;
+	};
+};
+
 &usb_1 {
 	status = "okay";
 };
-- 
2.39.5

