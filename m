Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.206
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794503389;
	b=vCtLbDTnWscV8HS5XBc4y22AV+mSn13dfT6GYdsjzQN9TZBkt0gAKF9SXRMXvuwgF4Bx
	 iCs8dWkKv9c/z4tpaxPbqTplq53Z3Gj/kUKixTANVBAzAwbyHqjGEsJslcEyYryCrGFW8
	 DnSqXfLfZOWOqokajTszf0Jr0dR9FCfx7Lg99zjejvkja/W6CBLk+Pj++k9/+hZIAEL4Q
	 qji5oi1+Wdcj8JUK2P7L2XavP/8GMXHjknq/3YLukcCzVxOSpbw3BeYvfnfavkZ90PVGP
	 x0PvaG1W7NcfYHSU+Cb72OyXJq72CTOeRFKu7CTejZKQsDirXThDvHI1aWjMR90r7rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794503389;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BGgWKkrRQl2lSND/U2uqoO60aN3FWXpk1m/u2Tb52v0=;
	b=lG+WkFN8C/pGzosPjrOUOJJVs1WS07OvCt1xPPWzYQ7meH42dLRwaNdycN6xUiTW1wUm
	 s8SGgfrVyhUm5Tn1GCogdT8Ojyl9EXY58OqHoAMDOWiPPLNtoEj2byU7t4y/mjBtVo5Cu
	 A14klgtsaX+4CozgcbPFhst2Q+cua440wZ/KdQqOv+i5BxUqfgMszdSccEP/PiUSpxsYb
	 5h8ZW/+bo37okNlEQihEiud/8TiGOkYgitWLvz3zLy6Csl73ZIQrPJQ9Y4lYXrxgheAEM
	 cSdO9tS2SBs/JeLto1Fw4mQFKKDvaCFzWjIVBVkWhgIcUm3yJQSVL0U+1zTFaVb3qqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=packett.cool;
	spf=pass smtp.mailfrom=packett.cool;
	dkim=pass header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=pYPsXGqL;
	arc=none smtp.remote-ip=95.215.58.206
Received: from mta1.migadu.com (out-206.mta1.migadu.com [95.215.58.206])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A40D606A882
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 17:09:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A40D606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=pYPsXGqL
X-Envelope-To: linux-arm-msm@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=qPsNvOqpGJ3pwA3WfkNEk+1ZJzUEL1h3NDg+2/5l8xs=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794503386; v=1; x=1795108186;
 b=pYPsXGqL45Wq3wn8jbxvE4KpZ24WxNKrk0W6akWqsfsjl7D4QrRL3+sFHXdih63yAxLJ8jBH
 m7F4y8htTxmp8KggwazeJmY7eFoJ7h8AY6bATXE7P6j73ohQYQJYLwjmzVpcY4b0FBrev8f+lKY
 bDh6xP2+qAp5KKqbbZXI0BhIBAjROVyBj0P2wyfh2XANGO2DV2JRiVySwMCe556nPjofW0jzNNO
 C3skSyunXr3EXExiH9GWYgYEXwiHA2/oH5T6gRH+J8GCWwjRe4Kfl3hsi4oiNuAjn0VIa0nNaGW
 vtNKt+CbzYRbPrM7VCAHxdXPs4+P3C0cRH3aXNic4Q3Ww==
X-Envelope-To: linux-arm-msm@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 3082e74ed36220db;
	Thu, 12 Nov 2026 17:09:46 +0000
X-Mizu-Trace-ID: 3082e74ed36220db
X-Migadu-Flow: FLOW_OUT
From: Val Packett <val@packett.cool>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Val Packett <val@packett.cool>,
	Marc Lainez <marc.lainez@gmail.com>,
	Luca Weiss <luca.weiss@fairphone.com>,
	=?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>,
	Danila Tikhonov <danila@jiaxyga.com>,
	Sebastian Reichel <sre@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	phone-devel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] arm64: dts: qcom: pmi632: Add missing bat_therm ADC channel
Date: Thu, 12 Nov 2026 14:07:30 -0300
Message-ID: <20261112170841.2189322-5-val@packett.cool>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261112170841.2189322-1-val@packett.cool>
References: <20261112170841.2189322-1-val@packett.cool>
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

Add the temperature channel that is used with the battery fuel gauge.

Signed-off-by: Val Packett <val@packett.cool>
---
 arch/arm64/boot/dts/qcom/pmi632.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmi632.dtsi b/arch/arm64/boot/dts/qcom/pmi632.dtsi
index ab850050eb22..82b5d7b7bb5b 100644
--- a/arch/arm64/boot/dts/qcom/pmi632.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmi632.dtsi
@@ -124,6 +124,14 @@ channel@9 {
 				label = "chg_temp";
 			};
 
+			channel@4a {
+				reg = <ADC5_BAT_THERM_100K_PU>;
+				qcom,hw-settle-time = <200>;
+				qcom,pre-scaling = <1 1>;
+				qcom,ratiometric;
+				label = "bat_therm";
+			};
+
 			channel@4b {
 				reg = <ADC5_BAT_ID_100K_PU>;
 				qcom,hw-settle-time = <200>;
-- 
2.56.0

