Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792661789;
	b=dT2+DXijmX1pmtxlfgDkKynjALnRpcSy6yognDK3jJ9q0OUoT81p7ZNpaJ7B5Syk8BRg
	 fhN+Z4uM7FiTmEIbMPPm67ySZnSYcdYEIxXCH6xZsg1r9sOm+YouAXGXKc3KzmAChpYhS
	 GIE/YoYGl4wApo0VgFmWnCfY1WaI3/l3yS83fv+QMDKwhNYGdXE0sYodXKPNqk5yd4ZZw
	 JlUB/0KHuWJOsPX5qRQjAfEvZXgeVjgMP7nx7ME4YV4RfuRrHAUyWF/RQ2dOfTzncr111
	 lVDDpkgHg8CRZXu7yfsqMX8OmrhXrmoJnDlDBK+5JXUgbwdufzsWwBXk/+IErSMvMZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792661789;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=BZOYrejQOL0YgJ7ClyEFN4icr9D3tepflpUCdoC5Ddk=;
	b=zNfKBlPvpQ6BFRBy9qrepySlsc4A3fGKA8FdsvaxZ0hOizZ1U/QsxGSJ8NBb5BFqzA7o
	 V6Har3zZegNGMxKHkMXmWN7gnWmaQJRauQLx6UBKwXrpPpPZrqK9S3a8tA6qQ0v8redmO
	 aXDukIV+yxWaDFhpo2oQ21pg5vkFa7smJ9mORcGT3KtLMHxZbPkyUqjycdkXj9f1YOZrK
	 YJjRTazJ1bVRlrCUSg24bjwPlEt5GKPCNpHqndv0joDfiQ4WrfCUffs1Tcr6sFSkkQ0D/
	 LPpszZZnSodzSD5UKVa83XX7ZStq5rYZpwJuFQrmNyRy9T4aY+e1TDQkeR3exJuy5AA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=hUkzxamG;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0543B60A2610
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:36:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0543B60A2610
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=hUkzxamG
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a2084d62cdso3177805e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 02:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792661787; x=1793266587; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BZOYrejQOL0YgJ7ClyEFN4icr9D3tepflpUCdoC5Ddk=;
        b=hUkzxamGHFvhVCDtj1CW/b8pkYnSHLfJeOmS8a3kCaoCPNzCnN6B0KgfBa3rjLe4yH
         LXzbuLZugymxBtGzo5FzvFgDIexyWkUf53LPcKGCLG12nKpGq8KePWLs6kj133rSw+2J
         BEm9vm3AV0t0XIYCQnsK+uTo5w/eTSdhql2rf2B3/4SPY7TlnbSZ4Pm6OQ1NKqbnsqBR
         YQwZQNPvwyikdiulas4iFn+NBEkAo3Et6umiy/WGNld8dbDzpuJXPNP6D/ZYWUNMY6AD
         DoY+M+5dV8DeB6Cu2ZPweWylWY3hvRIaZNYbn2qDXW7ViXOrR2t8TOZI4cRc5YHW6+Pw
         qDuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792661787; x=1793266587;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BZOYrejQOL0YgJ7ClyEFN4icr9D3tepflpUCdoC5Ddk=;
        b=uugzzT/ldoiKh5iIMS6Yz1XKBE2NPtNJfamsFMC24PvOoWCVNnJwa+wpW0pA0X7hv2
         B1NOuWnqfNiA13mvUnW0eioyHOOgw0S9ECXkEMuGP4OEFMdFJt5cm/zKFR+susRiwf9s
         IWKrokViSxIRIPC3VOwOtYzcxXIv2yvFrEyQovH5wXglEaByxigd4J5GchZ+rfMdhwex
         pNEJwmvM3AfahEi64dKETBWqBgnWx3FAbUZPysbvX7Y2R2xOyAN+D8A56itNVtNfw18h
         2NC3Yo/tfstigtLyScB/S16MbIGL310IimSX34/P88e88gQaie+0036qfBk6f6Lb86Hw
         hHYQ==
X-Gm-Message-State: AFq9FYI5szhSLzLxuabXCrvDy8kG0E92fLkOe6B1aaksDoqo/1q3VlQx
	o/zAkDoiQkAJznpXYzZLcTbb/eeXXA9Zx2BA4hQET69B7kl4g15Vm6oRFdB/mp6G8woJkpbtuVu
	XxxW3
X-Gm-Gg: AYBFou346ki7zPevowpeF1NQ5f7cmIUT1kiVUR2wAAS5Nn/MpmLS9JFT02ryU8bQZz0
	z/EHhh6W+ssppQcQcKqN8FZ3WpnyY2JW5gykZsdSYvN2G19HrdWOK4MUQDnWLz5JM3AupJB1x/x
	TrsaSXZrbQy/hf9xmFluXV1GglMviGhiYUI3V9Z+9+3BRD9xd+Bry5geNPyjsfWek9H7pJlbM+l
	Dhl8p+BWlMzZYu+7whtEMhBpnUYnVPjh7I8m+cwqcgV8I6rw3vqcR7TVkv1T9Q0UWR908SLxH9h
	OW9k3GnAdZYfg+/7lpKu3YxfrLNXE9v+bOTrI8KIEU8xkl1WNruBhnCFozI4Fvoxc0eWYBSu5fk
	GFmbYYu/V0DC92yfw3lL7mR9N+Dx3PufBNn/rerv9ILVpWORlp+HSbPwTERwAyD/CyDKay3W0dB
	sx6pnlkmzhhPtQNoC1JEHMCsl6+VhaRkRpMUjEJPnsa6EYhub50VLekdTuDv4SxcB/ajhy8Sgsa
	HToeZ4u+Z/ZsxQrWd+ZARTbnRqBz1ruR0Uibd+qwH+EFCErpMQpqZoZiMHUOFyhDgeieJ4=
X-Received: by 2002:a05:600c:6085:b0:4a1:d0e4:2bc7 with SMTP id 5b1f17b1804b1-4a1fdafd610mr96044215e9.15.1792661787266;
        Thu, 22 Oct 2026 02:36:27 -0700 (PDT)
Received: from arrakeen-2.home ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a2038ddb20sm53299485e9.0.2026.10.22.02.36.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:36:26 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 22 Oct 2026 11:36:23 +0200
Subject: [PATCH 3/5] arm64: dts: qcom: sm8550-qrd: add DisplayPort audio
 playback support
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
Message-Id: <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-3-8a189c71938c@linaro.org>
References: <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-0-8a189c71938c@linaro.org>
In-Reply-To: <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-0-8a189c71938c@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=857;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=dmWq6B4Pndw6DTEfJIcBV9nouQ11/jt7zUcfeK+gPCI=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBq2dkXjrv+iVYQ6idNZbpI2VZE5ehZcwZ7jv0Ex5Mi
 S8j3y6qJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCatnZFwAKCRB33NvayMhJ0YUWEA
 Cp4xhhWi/+krtbY5HhA8JOPBMUlAXpWMNtbC8Se5P3D9Pbi+pEiLsnrRGfTq14fJycSX9j6rDUaNEE
 qj/1p+UYGlJHV3GY37+MA1EBmQx7Fv2sfgPUDuypGBWAnMSJd7hPrWD2XiiEhFbWXcksxVUfABicOT
 TXGpOdhCLn3FFnKIt8IaWdoITX6i967VzpK6BADr49TG9jvYIPbdveXK7WxZupt6UOHKwWWvOgfSwr
 JbJKXIcHZcyELRKzs3MoU+b6zJ5N4l2VijN1yhsThhLD0tNmncSYsOFYiKjF06QIpSzWfT/uF0X0VH
 oZ2tYlM5TGTNQn4M/PXwX9uHzi+8lf6WpvT4oKxr5usQGWugd9OsGrHI2QwoJmyQpObOUFjVs8BoBF
 6XslsGWAflb+FliyyCREtR09TLal/TESrArDZjdhWH2uQ+OW0/QZCVX2W/Dz6mSPccJ2wshyt+560s
 w8uIpmYwZvJFuGbNJdSPPoVWUMgaGNDazjvSDXcj7rEFAG2YEhEOW3cS++aeCg7emo9vE2c391e7vQ
 T4WZDmoDFJPaCykYnZKGGojULToR73B/eCa8MeHBqXFhxtVJVo47DjgxO82JzWU/BchoA/ditIv+gs
 5z6UTG+7p8R1W99TcevRebM2LFv8NngHFFt2ObyB9qMb42HOuIdIDxDrt+Yw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add the DAI link needed to enable audio playback over the
DisplayPort altmode output.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
index a3ab0bd3fb01..dccd6fdfe5cf 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
@@ -203,6 +203,22 @@ platform {
 				sound-dai = <&q6apm>;
 			};
 		};
+
+		dp-dai-link {
+			link-name = "DisplayPort Playback";
+
+			codec {
+				sound-dai = <&mdss_dp0>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai DISPLAY_PORT_RX_0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
 	};
 
 	thermal-zones {

-- 
2.34.1

