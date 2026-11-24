Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795485419;
	b=metSYer0bOSFOfUAUguUT8FhX/Uvzra9jAUMTlrnJtd+b5RrLxk1TNpmIScd0d8w+OIL
	 oVVbenq7oyFwsGTlzs/yZgtkWnRvHCg1P2jtNkECyjMSylBjNICoEnolNLSDhInbwD/6s
	 Pq29qxiTcj/LLsCYf9/OBW9G1JMKHmb7YjMH01n0ZwBysCvBoZ/6mXGgftt+oj/+Fwar/
	 nVCMDRMiR1q1Xd3G5j/1muZdnhbAzbZgwIH8xSUWgiEXk0PlRbQGWXMuVOBh3vU13kClM
	 A5k1Tmz9Plxsn6AAYvzT9KlBDYGnITixQ4myS3pQc8r7dMeyKeMHwseGnKG3cNTQ7zQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795485419;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Ys7Nc7n51L/KeLLawMSwxhQi3I/mI/NHV1h3ZwDRG5A=;
	b=BtENES3c37WhUwjuso7obzSvPRZQjCAV0GWjXQVC5Lg89MD++XRQtIcvXZxhMTN3UYrA
	 hRiw+cJ5+3JSUbc0TwCJ4dvZM9U+9J1u5VsA71Nj4oRNBX+kxkfLO4gfQVICu7DMzA1vc
	 PltGOgkmN28LSIc8wu2fQJdG82UsiKok+Hk62CD3ZzJRqtEbBid+f3R2sCXnWdJUPQ9Xn
	 NbLTsg0GYkvMC2mdK+57grLVTxC05kK+0G6hvUOUt3zKnuWM0YKDv1YNYuYvMed7bHPZo
	 HskXwp2b1DKKEJQoUnrPGMYhFL1Z94pboe1E2D14bLq3gGGw05OEzVSuNETiDQtP3Gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N1m14udG;
	arc=none smtp.remote-ip=209.85.219.52
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE244606A31E
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 01:56:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE244606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N1m14udG
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-92123f02faeso41505476d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 17:56:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795485418; x=1796090218; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ys7Nc7n51L/KeLLawMSwxhQi3I/mI/NHV1h3ZwDRG5A=;
        b=N1m14udG0h8jba3K9ai5qMlm6qdGjG3bqClGk7/veFDHpq6CPyM49tjIn2rn8wTDTq
         BqffRqsGdLGdcgI8caRv3mW29ArdUKBFoz/nIJ/7tGkK75trdW6JgUc1/l2YlW4u3ZCN
         FZ7IX3CykWZHK5UVF3g+BjNiKwBHxUPQGRKXE7wGXe+B98lg/71Sa+vtmmWH8pMIiVoM
         KdRyAgPxzCm6s8CSiUjgLezFtfSpqcQrQfRf30AuF+7cYGfUxT19KzcWf9+vwlH+gH7D
         o2RbanUsOhjEl9HEY+PmSa94mU4VLDkv1HuwDoQwSuJHd3Cebng459miaQra0keaI+/v
         +tXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795485418; x=1796090218;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ys7Nc7n51L/KeLLawMSwxhQi3I/mI/NHV1h3ZwDRG5A=;
        b=slB4iWXOlexfO07cUEkCqHEgmSogR5CYSg7tj5kBqgbU2lOJMeSupYSHxcxEwRQGXM
         5S1GbKr+GtxYF1TXUaVL0iyt37euKHT+q/nGSUeSnqSkpXF7Cz4BtxprVKOCdRm5aG4/
         tzvGmsO2w7UkphY3BClrtKHxlQ9edSIyCy1pJv8ovF595S7fBY3j21h3Sg5C/cIVFuK/
         iHykgo9vhW1ZME8AjYWpsGA2X+ZRjsCLtwznAdRafepQhg7cg3BgkiBqcq4bDoyOPoS5
         QP2Nk2ItZ89ak0xiw58tX81KGpiash34tMh+n5LfTB1O+jS4pFP15p7i4OOx4u+jZ8qm
         Lmbw==
X-Forwarded-Encrypted: i=1; AL+hErERvEA176cyd6ZnFZS1Jhw00sCahiJkIIqFFFEzQ4ds7TEQ4KM6s5MBngcC0VbwabIh3xntRcWcwpz0A324@vger.kernel.org
X-Gm-Message-State: APuU4Z8guaW80hL7TvDBMnjLKaekOI0ECJKem6wgWKe0Di9k4vPGQTS2
	aetuMjtQGitWBj/ClMc4n997EY4SZDulrhIUG9kMkmSPBG7CQ1ckFX7t
X-Gm-Gg: AZFdTZeIhJdTUYv0Uj6G3B+Rs/GBocHaijHvgP4Iq4+mBwTxQNjDvncTuKetQBSGYzJ
	xGLVl7ftVQMwt2akKmVsjxzzsodnK2uxAF5ZACcT2bhDZ0jahd6VW8SlGaQdq9inF/x4C0IpbxM
	Ca8JpRkfL+4l11uVb+L9HsfL4Llll2gaSpSNnUPbVmNQbQBTlzswprNbodAt930dW5PlICxm2KP
	i1XD7PFN5yioaIs/7YAjSQHqMwMn82lSuHvro4izNyoGKYskqV9MRykoDZfr9JxeQhdxSFRkePK
	xQleSYltFk6/VMl/V9usxxXFo2nIZPpZkFrTPydBbjx7ZSIfgWhObypKzxKD0ubYN04pI87prTD
	Q6K1MJZt6jURw5e2nMIvjtvo8Aj+DI8bz0RbXZ8i8E7h6nZ40gstpdqujlhX+zbK2eMondQ8A2z
	YemxDsBtx/5QnfSigYGihIwgVcSeET1b4S6Rxkc3c8YJBJYEZQu98QQ/NXVrWtRmXN1IWt9q6wn
	n38ng55cUvraBzdHiejx4IlYpKvXlvXt1TYtkd1R8mc12s/LtWCTzjwKkcam4j46jAx93VBxuYl
	fpl+vyEHe4LLZT3yU22oOQVl+76V
X-Received: by 2002:a05:6214:27eb:b0:921:57fb:4bc1 with SMTP id 6a1803df08f44-92157fb4dfcmr85526476d6.29.1795485417823;
        Mon, 23 Nov 2026 17:56:57 -0800 (PST)
Received: from localhost ([174.93.36.89])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349eae11sm121629546d6.25.2026.11.23.17.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 17:56:57 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: phone-devel@vger.kernel.org,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v4 3/5] arm64: dts: qcom: pm660l: add analog audio codec
Date: Mon, 23 Nov 2026 20:56:09 -0500
Message-ID: <20261124015611.187024-4-mailingradian@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261124015611.187024-1-mailingradian@gmail.com>
References: <20261124015611.187024-1-mailingradian@gmail.com>
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

The PM660L analog audio codec (PMIC revision 4) controls the headphone
jack, and optionally the earpiece and speaker, at the vendor's decision.
Add the analog audio codec.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pm660l.dtsi | 37 ++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm660l.dtsi b/arch/arm64/boot/dts/qcom/pm660l.dtsi
index 3f8b9eafe164..59afe3ba6fe6 100644
--- a/arch/arm64/boot/dts/qcom/pm660l.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm660l.dtsi
@@ -87,6 +87,43 @@ pm660l_wled: leds@d800 {
 			status = "disabled";
 		};
 
+		pm660l_codec: audio-codec@f000 {
+			compatible = "qcom,pm660l-wcd-analog-codec",
+				     "qcom,pm8953-wcd-analog-codec";
+			reg = <0xf000>;
+			interrupts = <0x3 0xf0 0x0 IRQ_TYPE_EDGE_BOTH>,
+				     <0x3 0xf0 0x1 IRQ_TYPE_EDGE_BOTH>,
+				     <0x3 0xf0 0x2 IRQ_TYPE_EDGE_BOTH>,
+				     <0x3 0xf0 0x3 IRQ_TYPE_EDGE_BOTH>,
+				     <0x3 0xf0 0x4 IRQ_TYPE_EDGE_BOTH>,
+				     <0x3 0xf0 0x5 IRQ_TYPE_EDGE_BOTH>,
+				     <0x3 0xf0 0x6 IRQ_TYPE_EDGE_BOTH>,
+				     <0x3 0xf0 0x7 IRQ_TYPE_EDGE_BOTH>,
+				     <0x3 0xf1 0x0 IRQ_TYPE_EDGE_BOTH>,
+				     <0x3 0xf1 0x1 IRQ_TYPE_EDGE_BOTH>,
+				     <0x3 0xf1 0x2 IRQ_TYPE_EDGE_BOTH>,
+				     <0x3 0xf1 0x3 IRQ_TYPE_EDGE_BOTH>,
+				     <0x3 0xf1 0x4 IRQ_TYPE_EDGE_BOTH>,
+				     <0x3 0xf1 0x5 IRQ_TYPE_EDGE_BOTH>;
+			interrupt-names = "cdc_spk_cnp_int",
+					  "cdc_spk_clip_int",
+					  "cdc_spk_ocp_int",
+					  "mbhc_ins_rem_det1",
+					  "mbhc_but_rel_det",
+					  "mbhc_but_press_det",
+					  "mbhc_ins_rem_det",
+					  "mbhc_switch_int",
+					  "cdc_ear_ocp_int",
+					  "cdc_hphr_ocp_int",
+					  "cdc_hphl_ocp_det",
+					  "cdc_ear_cnp_int",
+					  "cdc_hphr_cnp_int",
+					  "cdc_hphl_cnp_int";
+			#sound-dai-cells = <1>;
+
+			status = "disabled";
+		};
+
 		pm660l_spmi_regulators: regulators {
 			compatible = "qcom,pm660l-regulators";
 		};
-- 
2.56.1

