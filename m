Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21CFB432E60
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 15:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789226333; cv=none; b=apwzfXFZu0/jF+S161HST8qrWJU8dF1bz3zjXzlLF/jtREIv3EmBWT7v05XHaqrTLXxdwvVpQQSUlr4peZB8iAHttjdvLdCP14AvycHkqOUe5z00BKpyMKbeJiKlBcZaM1Z93lMpQHebPBXIn5aYDKDbKJEAotnOzOSONgMHEFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789226333; c=relaxed/simple;
	bh=yUyedlztWXbA3lwvxrO/styw1IzAPB86ioonRT5zCKQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HVu8+tYko3/MI0pxHDnH9HFdRU77pKbo6omGxMDlay7TqAvGWxnyJs6UjD9EJtvsYA2pYSJiP5+oUK00Yhr16om0e6HTi958Z2WmEZnqCb9rIG/fazBaWAYt7hpKA4Y7WIASTAki+0Ccv5ZDDJAYe//jrYcv+58ptZehEvfI2iI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k9xbIXe/; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k9xbIXe/"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cc4d03f95dfso1012624a12.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 08:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789226331; x=1789831131; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NujR5wP2r0gRxOSsqzPbYYRli2E0gkVnbRP1/4DKQ0s=;
        b=k9xbIXe/gflMItzRNjdnjMfzzaSi1gr/VnOsQu3Row2YcHhd9VHPEF4tMlpyM+q2pt
         p5jvr0GapE3guWf6MzVMxI76LTS9AALHehtO2ipCrIcakY089dzPnfvjJiP71uvlA9yW
         MUVL2t1tFoAAqHwO9YCQyxRRO7ijC4j58vPrPZNr/eaF4ADdmuFZUXftmBUZGxZ+VAbR
         n9LMBqqtLz+2M8iObZYgob39sAwxudjvTn7MoYk3Ilco2xYA1TG3lN3rqrKA1FWBWzEy
         Ne0jB2Muv9Sa+TEAT38Q8er5bf5XS7nzEyJx3zt2tDXAdE3nWX00L/vkdNDGG0w3QC9K
         bJkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789226331; x=1789831131;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NujR5wP2r0gRxOSsqzPbYYRli2E0gkVnbRP1/4DKQ0s=;
        b=tPxIpOeVM6cFLQg7rPUB8FpN2h6dZyuGRnmycWBvPzAxzJtPe4pSzJP+sY+eWwylxT
         505aXnLmY9W8+iT4i3smp9ICIp22cqEEk0qd/V0QuWDleJfgWTpt42BTL7esxMnQ9XW1
         ucwQ8d8jh2y/q4UNStY0xX71akH83m9ULTFpJ5Ekhm/Eo8GXPkY24+LUfNmCV85spP45
         Ox4fiXFBmHRQ2IduOT2h18ke6mKHXcZn1+f0DY3Cp/mRWSJS8g6ldTUpQgHj3km6FfaN
         3j/4yJMKyF4q2Py7HTDoWSBTSQlfxX1nUm3wXU60Ap3CZIRGPuB5n++ik6hEHvV77Tv+
         DyZw==
X-Forwarded-Encrypted: i=1; AKwUvBxxfT8ne0CvH283VZWLkEson1jpiXFPdjN+qFlcVUoFEva1HrbXRs8AVL8/Ud/5IwacDboU83wacN9AqJTV@vger.kernel.org
X-Gm-Message-State: AFuF++lKDT14V9GZq16lswOYXSapwyjb0yFgLOizyQ7uobKxYZh2zKET
	ghlsBr9lRPRn49s/I2ObgWheBBb/4AgcOYqWjQpOVmuVPzvAtC6LdR84
X-Gm-Gg: AYBFou2a3nzrFJElAn0bbyFRsjfHL/HUeyrOAmUZoMjuOIjHsjctJrEpuTUaCYy2vf7
	VdLuqMkPmTeuPEC2R0HGRjr+H+3jFosQmW8dZ0fSz150ANRPLWRst28QrO7SkvOvzrh+xK25Xj1
	Bw0zLn/igBPSjS5WgQ7hYGrqNCrTvKru93PbKAuZ0ObcqJVGup33uqVLDwHp50dUC98erHTAWom
	A/aodWRIGd5X+XuPDGtl3RY2dmAdnEsj30VE9OcrQDGLPKEUSFmwY4iuVxmPsla8pofsm6uSEjd
	sXgL5g13bm2JEOoxhhXlkkBCy/uguSv45Sgz075xUe8fzDxLLXw/pGgMp1Ndwwu5f8PUfDyljfN
	At794jV0nsD+rAHbJapFpYjWsg7Xh/F7yOt6AwH/STN/vSOwNBX5Nky26QzvnOUhbIPj1FMXAkl
	j1KhWq+jgffuspAYRcqu/80HsdWEks4TvF11MGUQ0xCKpoW3t0Zq0Lqn82k6Dsmgs=
X-Received: by 2002:a17:90a:d2cb:b0:38f:efed:5448 with SMTP id 98e67ed59e1d1-39d9bd971fcmr15354593a91.8.1789226331249;
        Sat, 12 Sep 2026 08:18:51 -0700 (PDT)
Received: from [127.0.0.2] ([2404:c0:701d:4e35:f53f:aaab:9e63:54e8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d951d1056sm10635924a91.7.2026.09.12.08.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 08:18:50 -0700 (PDT)
From: Reza Kurniawan <imkyufie@gmail.com>
Date: Sat, 12 Sep 2026 22:18:12 +0700
Subject: [PATCH v2 2/2] arm64: dts: qcom: msm8917-xiaomi-riva: Enable USB
 support (peripheral mode)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260912-riva-usb-v2-2-997fe0171ee5@gmail.com>
References: <20260912-riva-usb-v2-0-997fe0171ee5@gmail.com>
In-Reply-To: <20260912-riva-usb-v2-0-997fe0171ee5@gmail.com>
To: Sebastian Reichel <sre@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 Reza Kurniawan <imkyufie@gmail.com>
X-Mailer: b4 0.15.2

Enable USB node and PHY. Since VBUS is wired to the charger IC, also
set extcon of the USB node to inform the USB driver of cable events
emitted by the charger driver.

Signed-off-by: Reza Kurniawan <imkyufie@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts b/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts
index 7c323214a..c47aad978 100644
--- a/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts
+++ b/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts
@@ -69,7 +69,7 @@ power-monitor@55 {
 		monitored-battery = <&battery>;
 	};
 
-	charger@6b {
+	bq25601_charger: charger@6b {
 		compatible = "ti,bq25601";
 		reg = <0x6b>;
 		interrupts-extended = <&tlmm 61 IRQ_TYPE_EDGE_FALLING>;
@@ -89,3 +89,18 @@ bq25601_int_default: bq25601-int-default-state {
 		bias-pull-up;
 	};
 };
+
+&usb {
+	dr_mode = "peripheral";
+	extcon = <&bq25601_charger>;
+
+	status = "okay";
+};
+
+&usb_hs_phy {
+	vdd-supply = <&pm8937_l2>;
+	vdda1p8-supply = <&pm8937_l7>;
+	vdda3p3-supply = <&pm8937_l13>;
+
+	status = "okay";
+};

-- 
2.55.0

