Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AFC1374A0A
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 15:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789139782; cv=none; b=UriYnF/eZH62THyVMFWBgnkzc/IrdaYa/TtZJX6tNh0sLkFD3yvD+oc0ZqdoEextoLyFwOCKZSkx/+o2QY08FbR7kIM34vJGuoScz+a8M6i1tNSpnDuFbuPmx5qlH4bZNeRBgWU3l8AkX/HgsbqEH+EKI4L1JUYc+9yZU1D4MiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789139782; c=relaxed/simple;
	bh=rFAIgZEb7/X6mAN0fuGGvUE8kDpeKo4I7MnEkQNfJDE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kpnNuIEkGPO/EvYFj1ExERr2sk/vWXkumhd4HBVRq9sOIeOcZueoAgXd7iNeSB3EPgaA3dlNs8jHrb8bKFQtdCjkjSezHvj/Ujo+KA2Tdu9hTHhsqKU58o3ATh0BgDMIYZf/pZcoO8yo9P3kwvcngxtqbo7Eo2PeBJU4OCNJXU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=SS7NeoKO; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="SS7NeoKO"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c29703cb796so187666b.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 08:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1789139777; x=1789744577; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TjxKNhrtXJ5EeGCSEB7g5l+FtJDfp2TwHE+FqxTaARY=;
        b=SS7NeoKOYVCsoXl7Wv6mCMwwudL3DJ4roDUA82GGnjaRMXAVSSKPLiT2CBQrW30xpS
         nPjePbXO1+6LhxK2gjV1CKQoKGH5x7m+uwbaQ9Hjqeumg6G9naSi5ccR0arbjHbMLgMY
         M83D8RPfXX/s8rIKfHtbESR2Kn94LE8eqdSiLL0lRvPUHdvb8iBKnHjOViZrWzPtRAew
         xck4bzo3bF3ORuBS0hVwfEkhCp0mn4zEVXhW+ufQ7Zd0WvjRtYI5JtnCK2q8Y6gTwQey
         KFWTOBsOlmrWtgP2JFt2wrjdz9YDw260zmvcpVSESAlCUhE5GjS6pz9qf8sXpN0MVEnH
         hLHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789139777; x=1789744577;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TjxKNhrtXJ5EeGCSEB7g5l+FtJDfp2TwHE+FqxTaARY=;
        b=tUI5kGKOnhAgtwCMS/1DbaNJkvyPV8NqKWRaUasrQP4Sez6UnWFXfWzedTkDuJIUZ+
         5eGArzeB3o5fErIo9WvQLqtMXqf1fMzpfU/LBkrAeyqwswQaquSdqv+y3TGHEcCqeLbn
         8n7UaPk/s+uE+lPtVZsseMMTiJogw6+SJdRIPUPy5s67jMLvMcNlpjXd0lbNXgNi7t+J
         KSb9pdi13QVjwhqUMHgc7f+suk1C4cyZUZp6Ji+82UgXmvkQ/spV/nUQB4SyK+e2vHNx
         EejrFrHw2biIafZWiXDpyA9GYlEK7lQeeOazl99LIi9+fGINrqe7+X09ZxfAwcDEWHMe
         cUng==
X-Forwarded-Encrypted: i=1; AKwUvBy7yNurJDaDeBWQ7JEhOhjAZaUc8vrI8Wki5t3yMpYuepPc2zZpiDqXNg/ukXAKenG71ZTfPqZUSeznhozZ@vger.kernel.org
X-Gm-Message-State: AFuF++kW2Xh0vqxC5lzBJzobUV1BrZpG9y7Kor5OZyd/hDaxJyLqssvl
	gei19D3tbZMQ3xNzHRIXWZxJVaPukLW/n0yECM0A7lf3io5H1HWG7sOz/8vKfrI6CB4=
X-Gm-Gg: AYBFou1euELQlqNXR26dH9exJs9r94g+Wc9TYZwnu0jWtjbdpVlDTbQ2p7agxEgenGi
	pizo+2bVTdOJ0tab1dewvQ8a3WuKMXj3kWcQCFJ49jSNpcmhGDX/aLpfzUZzF0H0+I2wtMAXDws
	naKmXz+odnrmQeLXDFNa67Wb3F/deo4WHZFPsaFUz4FmvcAbXVrAwQTIdRPgvalOqqW2fDNK47S
	S2RR9JQCLPb5aV5uF8zwdqKTR6HXLPfxUEjXBnV/r+Q+bFIQ0+LSzmhMZ7D7Ii8fK+AbyboGRqw
	WJV+bVfGOTAM1l4cYCNRPF2quIUpEAA3O2nXGhJsw1E6KnoNpsoV2w6ZZTlSaWiuvp9Z8Hbktiu
	Y4Ue/0rZc2Z0AvhJuEWfgpGoajygviLFnHJEKUGQVDpDx2ySgyF+1k6u8GpvJy8bKHqFB8VtzK2
	jxFJD6SJ6S4iIHogbswcUb29eEvKzw1IkFIGjPeHqC/36n4iSMrBXRY8xmxTgPEGzz3p2WScd4o
	I88O6tI2KAXCgXHSSj3lwX/6O5NRKVNxN12RYBWd1DomJKMZ/M4kGs=
X-Received: by 2002:a17:906:100d:20b0:c29:72c7:c3bc with SMTP id a640c23a62f3a-c2972c7c6c1mr89016366b.9.1789139777485;
        Fri, 11 Sep 2026 08:16:17 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29660ba623sm94656766b.45.2026.09.11.08.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 08:16:16 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 11 Sep 2026 17:16:11 +0200
Subject: [PATCH 3/3] arm64: dts: qcom: milos-fairphone-fp6: Add touchscreen
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-eswin-eph8621-v1-3-db447ff9e445@fairphone.com>
References: <20260911-eswin-eph8621-v1-0-db447ff9e445@fairphone.com>
In-Reply-To: <20260911-eswin-eph8621-v1-0-db447ff9e445@fairphone.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789139772; l=1541;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=rFAIgZEb7/X6mAN0fuGGvUE8kDpeKo4I7MnEkQNfJDE=;
 b=LCwm/TDK527AQHndrydQY3/jyrwYXRgoGogGegiCXJ9yDBVpchTj4EAC4B3mODItePcj8TAcA
 TXm5hyi8HI8CszR8Z7j7AW/GRfEdTV6CL70q+C+8F9gcGjrfd4hBdxx
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add a node for the ESWIN EPH8621 touchscreen connected via SPI and the
pinctrl state for the two GPIOs connected to the touchscreen.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 29 +++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
index 4b7ae87270ac..498fde3d3d18 100644
--- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
+++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
@@ -983,7 +983,27 @@ &sdhc_2 {
 };
 
 &spi0 {
-	/* Eswin EPH8621 touchscreen @ 0 */
+	status = "okay";
+
+	touchscreen@0 {
+		compatible = "eswin,eph8621";
+		reg = <0>;
+
+		avdd-supply = <&vreg_l22b>;
+		vddio-supply = <&vreg_l9b>;
+
+		interrupts-extended = <&tlmm 19 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&tlmm 20 GPIO_ACTIVE_LOW>;
+
+		pinctrl-0 = <&touchscreen_default>;
+		pinctrl-names = "default";
+
+		spi-max-frequency = <2000000>;
+
+		touchscreen-size-x = <1116>;
+		touchscreen-size-y = <2484>;
+		touchscreen-inverted-x;
+	};
 };
 
 &tlmm {
@@ -991,6 +1011,13 @@ &tlmm {
 			       <13 1>, /* NC */
 			       <63 2>; /* WLAN UART */
 
+	touchscreen_default: touchscreen-default-state {
+		pins = "gpio19", "gpio20";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	sdc2_card_det_n: sdc2-card-det-state {
 		pins = "gpio65";
 		function = "gpio";

-- 
2.55.0

