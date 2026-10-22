Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792660624;
	b=GqxoLL8PVVmWFjg+f28f5DUENc+PBkZyqA/G3l4fz/zpCj9sCYDr7Ce0hmmJ7yv9KSfQ
	 lQG5Z2e+bLGjkhFx8q8Dp2tc288plzA+E3DrQYGEP04Kn2KC2Ubcrx3lNfloi+6qtXiBG
	 rcgAIy+Fgx1SSEA9E++YpQs/SJjhNF1/t+Q58X+fuC/03QcwSHhSQsumbMtOxou0GGlBS
	 tGwx1jxS6tQKk3DKoL85fJKL8hgLr/TtQIoDaQ+Lf2yJzHpu+gfxSSVvDdVrFmzy3G6+Y
	 urPCwI9UdYLP4uw61H9iiGS0+bXCS4upS9njfQ1JBPthx8YS9rhoPqK3a+ECoHZyJUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792660624;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=EXk0lrhnVKL0TKuzMjlB4VAJbrmt9Kcb6wBpv74sthk=;
	b=erxAe/WUS0EoT7pQoK56Eq0vV6lLOoIefzllpZzL0mVH3je/HV5/fo50nwVtXxN1MJLC
	 r75jbZRFqcuKWAxYJjHtjHShtTeMZV54j4ArM7S3QzMYQr3kYINVOcQTYzkO91in4u+wN
	 o4GrDEn6AsoBoO/LiGP6FO13q3lUMYiQxrjc9bjZBdCAOiTtO1/EfcPhcrgzoMkrJzToo
	 aj3pqWbgCh90gcW62YNxDG6ObKhgHR1mA28z2Vz5EFvQ8l+csZ3d4ywJOCTjpLXkfxk1n
	 6GZLQOMJ+ARRD3lJS94RLHgIBLMZdA/zaTcwn8yHlu3tktjxAGX6/CJNMt7Ayv7yR9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=mT53uFFK;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4470606A32E
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:17:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4470606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=mT53uFFK
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49d0da752ffso13335525e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 02:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792660622; x=1793265422; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EXk0lrhnVKL0TKuzMjlB4VAJbrmt9Kcb6wBpv74sthk=;
        b=mT53uFFKOjtIzV+vEqL8G8ktBCtprByu/Qvz3ZYgZpu59TEtlslo/bOUHU3p36PadF
         z4DBv77TycywXqlndC2ejK063xd/9jQH90f+SrIxCx7Cup5wg+mxcsPSomgQ4jfh+pqB
         qZ75E9Eb5TIqL0flAjFo/YdwA9IBVrlY+HUZbW/CCGEbTpZJ/QSZJ6kEQ17dhCr/63JP
         U27M0QCKtcpZAYOUFRLuvQT40SJ5ROhT7G+Xe7n2i13YvjTSw5ZgtDWPj2b6R/NTGxmy
         rIRXn2Gr4V+u6Clkxp+p3C1XoYH/0YBQcjpV80uyNe/jlgd+0NJs7Zn7mOmEOc4+mPDN
         Ebbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792660622; x=1793265422;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EXk0lrhnVKL0TKuzMjlB4VAJbrmt9Kcb6wBpv74sthk=;
        b=x3lgtj4XDW3yrtgyGkvSqJqs7GXZ5Hz76XcFdnpKYud6kNR2OuSi68r6s/x2glQ9X9
         ddiMYoEiWQVW2Jnz2KTcFk/g+/d7+gcWWOOZlRPrV++njZs43gb0dzC/J62rPD3FRFuV
         LACn1LYppdV/hQMD4pfGEsmTriCkzARUwEwMvswkMDsb36iQF+1MzeLELihn+42YjhVy
         kPaj3Kmzh/WdWMrP8sI/RBeBjRPqoqEbd7NZwCXDGZf0Kc+PF5h/rmVL/USneLgdY0Uf
         bL5rCQ1zGhitWxZHvShJ1V0RW1uFLWOBo/9fru7grBoeyf01ZDwigzxU0awmZ+gZGYts
         Cjtw==
X-Gm-Message-State: AFq9FYLO6Z0AeDSnsBmcq60buVvRhR61ISuWA7kAiWsAuMA8pKR/EB4z
	JJDJj/OV6wYS6fG7BXGWXJilAoPqZw52pxexrk3n9Y/fULoLfcsn8Luddig2RgY88tY=
X-Gm-Gg: AYBFou3E5VTEP4yvBloeQtUDRGqeI2Mh6Lye31wYVoVK/6TLooRLVPqBGt4AnJsI+97
	jx5pGPWmi5Vhins3XXQaYoNVGO3L+MvpTKOCr6AErS6UndbbNeVjf76kWWt+0q52B3jnmJtaSFF
	9LshhwN5XeOlt9oeVOzkTNgPzOaYxXpLXCE6nqZNLInwKlz02tvh8onQ506QJpMceuWPwJDGoRr
	fRz8yZKxwgrdEjMY+/yqN4JdNkrbCmkzWx4UR7uVBb5R0Kg3LawIecXYdRroNyIvLKE5qsqQbTj
	gUno4PkMcqK4tyKnbZUBQhTJOYREaMvPaqO+BT5NFk0Ur3bUlTuxur7nGs72sV/fCY9w+dwj0+0
	HDbwfUDJpg73aPcy6NJpTwlOwPXr5JZHamXkYwxR8XsgiGrkfcMbmgBvnrDqV6l+G6/YneyOkc8
	wwl+Wd+XK97nKwfTqcCe4AvOAkeRNGzayJ02x2iS23Y8oWtVrDhuNKfbK39a2UHnjyrqj895xx9
	os/WdzRic0FW84/bZvwB361WbeLzWqwjGGSJloK8nn7v8M4wVooHibQtt0lHrWKMurAfAk=
X-Received: by 2002:a05:6000:46dc:b0:48e:f10:ceb8 with SMTP id ffacd0b85a97d-48e264a38c3mr6535353f8f.11.1792660621821;
        Thu, 22 Oct 2026 02:17:01 -0700 (PDT)
Received: from arrakeen-2.home ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e258213cesm11293672f8f.11.2026.10.22.02.17.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:17:01 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 22 Oct 2026 11:16:57 +0200
Subject: [PATCH v5 1/3] arm64: dts: qcom: sm8450-hdk: Enable I2S for HDMI
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-topic-sm8x50-next-hdk-i2s-v5-1-aa1030a75e46@linaro.org>
References: <20261022-topic-sm8x50-next-hdk-i2s-v5-0-aa1030a75e46@linaro.org>
In-Reply-To: <20261022-topic-sm8x50-next-hdk-i2s-v5-0-aa1030a75e46@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3043;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=nirOm0LzsMYxE5nXP5ruQK9hlLXAQcicRF97oQT4n0I=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBq2dSKPGZxr8Bh7XEZbTHPR6k3Kr7jt/JG5MeQpQ3o
 jMhoLXqJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCatnUigAKCRB33NvayMhJ0UsbD/
 9wmHZ8hvmpuIiGVSlxQGpYyJJ3wFlg9TrtZ615Sl7tx+aRg2Eu9iurS9MQ1VKXGGPaomNBp0/MyALG
 NfueyyvRHqcSSAX/0u52f+P5lXED1AXmlyQ92vRCcvRDdbR53WgKxlLEE1WUC0YySLLCM1sfpvjFt4
 jX8j/vC6rj0GVHbi/KcsVuL+gg8xY5oUo205lQ/W59pla0gE7flfkRU6qLzaavdCPvXOmO96TtNPqN
 6r5uskbCG55kSuzFyp2rhNpg3pB/iVPQHf6loyN9ts0yCnAEbffvduc5EOtQLsT+nPc2s5+j5n4wh4
 3skrzeL61sItx6xykJ7Fs3Ma7LBwkpme/bh50AJ1aeGNBLsuPrFjiNA/ADQHZpUMJDTg6hZpIQTy2V
 a6r+zD4o8om21ACcuEFKcZmoONwWdL8C8gr8CFNe368VBzChd0sTlgxpqNi9QyhgrP6chw1gtGbalT
 V39c1VA2ReYD5p9f6GLxgiaQ3V7n4GnOPgQKxko8g3h8BqbBeynPRc8GUJYoHS6Kl1qiBdEmEaknG/
 Nwpnb7dgjWsCiqHhA0Qu4zDRsrUVwc9Ldtbc6X5pgdLY97/ufUhZTwuL6wg3rpmvgLPw9LZkkowVMp
 6aefXS/AuPcembtgk7m+d0wOobDbdh5PwajYXwOoSsGVJGXgG9dudqngAyTA==
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
index 05417cb5c4e5..cf25e16b2f68 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -4296,6 +4296,46 @@ qup_uart20_default: qup-uart20-default-state {
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

