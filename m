Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D23124293C
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 09:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788167610; cv=none; b=pHhMxT7yuhLd1rHm77HT5a87FUahYVTk982WF5kRnEYEGgshceK8BXgMgg04+pvRhk3deg1lUpN5VxfCI9F5SsjaFNI76uStE21zKVvqJcstopQ8h5JrZcVefZcZQmonxEkZDHLfG9USlH/v8INWTQHU5/0hrqr+2y65+bDQSdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788167610; c=relaxed/simple;
	bh=3VtEgllYTwb9AoggrDrv0Lf/izwoIk49AtVszqcRoj8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OaZ6ku9xvq5RcHj9PC+m1LAp6qFlTtPT1w8e+zdGtR8I/LhYacN1iJntjJWvJOpN1NJYkd1k9vNAEncjSzOaigdbFmel3Mjuv3z6MWXIqZq98+M29FITLvEClTlrLKDEd2fUOph3IfC712864ruyVuuFjrjvBYEXjZWdf3PUjJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lB0JQOzY; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lB0JQOzY"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48431648f33so1037480f8f.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 02:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788167606; x=1788772406; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RxyTrocUHcniU2MAXabytwb4iSzDNOnn1iZ50nJ9bdA=;
        b=lB0JQOzYPT+gW+PT1YwkZpMKE3CQkJT6hGk29L4RleX+LgxBD7q2fap902teCr+fWP
         aPpVzBWWwKEDSUniRNq2yxxtg0VO44+oOmy5rCrtlOxGQWXiT6E1wewGksTMyF+eq29M
         QGM1FeA/AzbLaiQhbznNohY/QqAiIQVmMQxKBiNO5GAMfYChueG76O9GwaCH39EJDaKH
         YcqILJhG/r68MOKqFix/zCQ5aYuuEh3mWbpuHwFf95ntzeK19Cw1F3TpNYWOx1wjeidN
         IW+r/NU3fs1bR5QbteBNQpmlfXLKePMeFZPvegNFHThAfdImixOlJVZadUYPCZwO5bm3
         bRqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788167606; x=1788772406;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RxyTrocUHcniU2MAXabytwb4iSzDNOnn1iZ50nJ9bdA=;
        b=TcSwG4nl9npJZ6oUTS3v27+ggi3jQSyM9R0S5/tOKkr9YoZ5ob3h3Au+ZNPNYP7yR8
         r8y7boLvNYYRH1J/q1K6+Jx4ovWvE93C4R801GEmc4VjhSXTEdPk/db6tPiHvAV5VNp7
         lDEcasWZQ5/jNqFblsCKjsozyswJKx4ZfN2YwamAuHF8jW1WnY2QcJ36kpuxXHn8PBbg
         kALLCA7HwTEi9crBFaAO4RoWenVvelEGMeALtPqElguIzCF49QE2UuxbStSawdZw+K2P
         x29Yy78VgLb1SVjDSg63hxOgo3v5SVOC7KIx8aeSw70xMEDDxDb+lBlB1SeJHtIv+YGO
         Kecw==
X-Gm-Message-State: AFuF++mLNvnQXEGZ7PcHcuT9k4A8Fdy1/eBPI+rOerSk4FSMLukVbfiY
	XMv6/l1zS7ktMkSaQol9b/BIlmKWCJyMMY0QH2iFHLM55ZdWtLtgOD0RklArQmOje20=
X-Gm-Gg: AR+sD13FB3FTMY7Coqht+HKvPcG9AKWPcrZEeOj1txH9Op3ax45HU3/CzqsM/qdSMlV
	Nepuf6at0Lopc92p+d19TgJ7zFLEUHI7C/xmAQUIpPxEFvvOB3HEGsKWChRFc8W9sjbbIiUbzVD
	sQ3GBgBErB652VNO3g6SXogK7ymsFMi0XPc/uh713BpDN/DhFTVEZN8cnAgb6kcE3zNlRN+eGzQ
	NrAjhRUSK9PL2t+qvDKb7pXbX+pz60QYFkoQxS3k4n6E0STKX+fPWgauMihx594UezaNYL841xo
	8tXv6LmBT9R+MNw0DEzalnrgwLmQJD5UhAZcREulBumRYOHJ5EgCIx0Gq6xZTJ/rJhpeApVBCmz
	153+02IobrCh84Qmj5kdFJX9BsOhEyUolDct1H6CyRdPNlH4gZQvHEz3ryglSDMRg7QNcumZzuU
	i7JUmgKOWqrIO00zNiVrqbiu5KNo60wRU33AZa0fJtzOki89Klbc+OGYfcSzVn2yI2XLXZWGmPe
	2wTed4XTQ==
X-Received: by 2002:a05:600c:8b63:b0:49c:ced9:ab7f with SMTP id 5b1f17b1804b1-49cd53c438bmr107757695e9.8.1788167605939;
        Mon, 31 Aug 2026 02:13:25 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0e:1007:7be3:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b4dfdf00csm320935205e9.14.2026.08.31.02.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 02:13:25 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 31 Aug 2026 11:13:19 +0200
Subject: [PATCH v4 1/3] arm64: dts: qcom: sm8450-hdk: Enable I2S for HDMI
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-topic-sm8x50-next-hdk-i2s-v4-1-a224aa073f9d@linaro.org>
References: <20260831-topic-sm8x50-next-hdk-i2s-v4-0-a224aa073f9d@linaro.org>
In-Reply-To: <20260831-topic-sm8x50-next-hdk-i2s-v4-0-a224aa073f9d@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3043;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=3VtEgllYTwb9AoggrDrv0Lf/izwoIk49AtVszqcRoj8=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqlUWxjG/ZjZ0MaAs7I+R0pZjX7XOs9M7nGf3DqTsv
 It1lt/yJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCapVFsQAKCRB33NvayMhJ0QK7D/
 9Pw8iHrd7g5JZVhX5YJLgbZNJTaHVhp3QrDrgVobEFQ0s/8cuAHKy1483slg5r66BIrzXmBwP+QigR
 PSbP33c6iI8ST58KaHixi1zzsxpCVm92E4Ny0GHAb3JA4x+SV4HVcAh0Y62Kg83+vcjuCoNAUIHcMb
 ujwnDpwGAS6toEsuOPKBYySYTxri+JYM3A2TCQKM2KXWufGEo/9hgs1kNzBmjXFo/6zOpQV5x+YFHY
 elJDLDrEC6NdMsaNuNoGvMTE8LoMMqpT7NFGtFYQcom0HbOPf5pvlTgS8Ttc2uq1XfqfFkfcLeME8/
 Ae+TIFTTK0YCYcwY0VNk/OJf6/tHRXfmd6I1KRIqQEHzIymcjk4ztdp76TZ6PhpCVUSJlkpFoXWXtn
 10d3VB8oulYCeNqPFfwaQ4Qzu1vq3MDjFwpisuY6xAI2GVrLyKJFYphjfzqcKhwNQ8ThLKsGMom71k
 44h1vuy3w0EJZnBd4YEHiYxJd1jzRdMnPPq70bqVtvZS/57OKm1p4j0GsoJ9iC9voEE4a0zyOABcSJ
 fTlEHxb0byuyxvJOYsXWY/XtoC2mezYZxtU3Qp9beIa1YetcOuLxZLgrCYOXl+v7eFeoFFoiWPSwG+
 c54BviMUaT4XISFhDoLiOwWP7CX0/3o0+y50HkrHgFhj8/Cki9m7HVMqFA5A==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add the necessary nodes to configure the right I2S interface
to output audio via the DSI HDMI bridge.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 36 ++++++++++++++++++++++++++++-
 arch/arm64/boot/dts/qcom/sm8450.dtsi    | 40 +++++++++++++++++++++++++++++++++
 2 files changed, 75 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
index 4ade28f40cae..9b55d17869b4 100644
--- a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
@@ -665,7 +665,12 @@ lt9611_codec: hdmi-bridge@2b {
 		vcc-supply = <&lt9611_3v3>;
 
 		pinctrl-names = "default";
-		pinctrl-0 = <&lt9611_irq_pin &lt9611_rst_pin>;
+		pinctrl-0 = <&lt9611_irq_pin>,
+			    <&lt9611_rst_pin>,
+			    <&i2s0_default_state>,
+			    <&audio_mclk0_default_state>;
+
+		#sound-dai-cells = <1>;
 
 		ports {
 			#address-cells = <1>;
@@ -947,6 +952,19 @@ channel@44b {
 	};
 };
 
+&q6apmbedai {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	dai@10 {
+		reg = <PRIMARY_MI2S_RX>;
+		clocks = <&q6prmcc LPASS_CLK_ID_PRI_MI2S_IBIT LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+			 <&q6prmcc LPASS_CLK_ID_MCLK_1 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+		clock-names = "bclk",
+			      "mclk";
+	};
+};
+
 &remoteproc_adsp {
 	status = "okay";
 	firmware-name = "qcom/sm8450/adsp.mbn";
@@ -1079,6 +1097,22 @@ platform {
 			sound-dai = <&q6apm>;
 		};
 	};
+
+	prim-mi2s-dai-link {
+		link-name = "HDMI Playback";
+
+		cpu {
+			sound-dai = <&q6apmbedai PRIMARY_MI2S_RX>;
+		};
+
+		codec {
+			sound-dai = <&lt9611_codec 0>;
+		};
+
+		platform {
+			sound-dai = <&q6apm>;
+		};
+	};
 };
 
 &swr0 {
diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index b8793482b181..a5d5eefa4e9e 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -4300,6 +4300,46 @@ qup_uart20_default: qup-uart20-default-state {
 				pins = "gpio76", "gpio77", "gpio78", "gpio79";
 				function = "qup20";
 			};
+
+			audio_mclk0_default_state: audio-mclk0-default-state {
+				pins = "gpio125";
+				function = "pri_mi2s";
+				drive-strength = <8>;
+				bias-disable;
+				output-high;
+			};
+
+			i2s0_default_state: i2s0-default-state {
+				sck-pins {
+					pins = "gpio126";
+					function = "mi2s0_sck";
+					drive-strength = <8>;
+					bias-disable;
+					output-high;
+				};
+
+				data0-pins {
+					pins = "gpio127";
+					function = "mi2s0_data0";
+					drive-strength = <8>;
+					bias-disable;
+				};
+
+				data1-pins {
+					pins = "gpio128";
+					function = "mi2s0_data1";
+					drive-strength = <8>;
+					bias-disable;
+				};
+
+				ws-pins {
+					pins = "gpio129";
+					function = "mi2s0_ws";
+					drive-strength = <8>;
+					bias-disable;
+					output-high;
+				};
+			};
 		};
 
 		lpass_tlmm: pinctrl@3440000 {

-- 
2.34.1

