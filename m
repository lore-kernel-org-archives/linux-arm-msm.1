Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794595120;
	b=YLvaS9EDMYv37vo/DpDS/ZnzzTAod+JU9J0cqTvEnu6Aj7DnnhRjxopg7CHF+LVDiqhG
	 L9sZxfXVEPi8cekztnt8XToVNxIJO3erM3Y1tGQC//bw2U5d+OjsMn1xUFbphBCRLIO29
	 57E/3T3rC+a4X/GrOn3/zee9C1rOePH7fTqN0Mu9x/IJkhP0KtOza+9vM59XU41BPAITA
	 kgRHroaw+X+PgMfizInAUMe6ZF/LVy6DygJY/GFH29ZVhUpgnxk/AuS9gj0noGu8xdySA
	 7ASjKcz1ry8M+3QKzl+sJFGzpJ+GijR1xOnQhi2pNardOxmkJ9xXKgc+U/3w5AIZKMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794595120;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=MoBNpM/r1nyqe9L0ZxAELscFmoLxO1wccNG+nA8IZiY=;
	b=u+armjA4QqWBX7Q46dI1kHyP295lQPYSYUwhzqqYrShLxG5uGehJedy4sWRWwNzksFC5
	 xWi+WvdsUBfcqLkG7FbH4kg4ikIky//iALFShf0U+KSF0jkb5fE1jJSzepofeCTNY/5BT
	 OiqhkFZ//sYNeQtOBspwngtuf3VX7JIVQ1u1o/CG5WhBx8WO74CE+mXdZy6EId7RhxlMG
	 JSAAxSku8x7dpm+yw0hcNjdI2diEInUyqaM4/znvlEyoXD8E9Awmbbi7j9xBoLcmdDjCk
	 2UD3D29dq19QozRpfUdFg9BNuo9Bb628PKlCcq6QE8+KbIoadZAq+H7HAzCLqeAaiYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=KLJM8TPg;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 515FE606B33A
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 18:38:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 515FE606B33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=KLJM8TPg
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4918c2d727fso659086f8f.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 10:38:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794595119; x=1795199919; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MoBNpM/r1nyqe9L0ZxAELscFmoLxO1wccNG+nA8IZiY=;
        b=KLJM8TPgZL5z47JsZHk78jrLrCIcYspZEstNhGvRsclZ7pYYQM1DRGXUCM8pMkylkg
         L26SeRrRErzk8r6t7xyaAQOehhQEgMDgUKTqpmot0YuXZhGQE8MX7Mbf9L5hlezH5FDU
         LxetkSDrfNL7+9yawDSPXlwKswl+EYxCbziDLjTYqHaQN6fYbNmKj0qO9m9+eQq5btOy
         FqQYpnKibQ5Uj7qnkDfcmltCHgk9fi0IG8samb2jfxZWXpDvvHJdh2iXic3JaqK8rIf0
         M8dnt1SAfSRKI6c61AzUZUQtWxivcV/kiYFzeoOHs+YgOduKwYvTPKFL2i4Wg76CZvXA
         /a0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794595119; x=1795199919;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MoBNpM/r1nyqe9L0ZxAELscFmoLxO1wccNG+nA8IZiY=;
        b=BLeRBtaQiIn8WwN5+9KQXMBcDelAEQ43XQv9V7RnOA31iGo4WKP6EgfpaTujELeNlV
         zQ0OUh5nt/8D7HGg/uzQGr4Wet9thyz5se2ujLszOsrZyISJ2XtZ15E64u5Tt5E3Auop
         PGIGbwGMqrceQM+APl3wOYpcEZ/pYdxu2Dnz5tC8AdwfKUTSoLScMKWRJIKAfmzhoNFz
         y9IJ0mwqCu0Rc8+qOVd+iJvVP33MO02aukv4j+HKEzaBESOinZb6xuxqyztK4G/v1JHY
         e6gTiwvtlSR7rD6kAW9JDv3KHjxh9kh0N0bUc3vekrTopMg5ab3hBSv7OPOtkOK26cWU
         LKRQ==
X-Gm-Message-State: APuU4Z8WCsVmVGWDJwBWr5FVMlji+3fZjAMtGktvg9qlIv8Q89K7p3JM
	92btJgKufc1VjW1+hRyAUUDebitLYSZyPoulp9SHqiNKQb9iBgkCaWdnE91IwrsJ3+4=
X-Gm-Gg: AYBFou1tDGdRpIXNQ9B5XmPhVOeHsP+pge/Gk7MRh6EHnJuse1bed9S63/lrDTWVr6Q
	iOiqM52S9VOenaQWNsD7j6j6HEwT6VlOkrJIH/M3kGqHr+rS8P0tNBrwtcFcMwiO2Ea8pnmpEjc
	ip26Q57jeYGCicETd3Oy5lrMgthpnB69LOOpFoYRpl2uiCQpz86O/cF3+F6mMnliw65qY3FvHat
	TmprJs8Jr1KEEiwiMx3yI4pNGosP9mWN2awUc+991HQJmMMDiBzuufZIMdBPb87PHMz2aovutpJ
	C0PJsoOa97+M6g3KTo6d61nrGqs1hhAPlbnxVI30V7HhgSmAC5Gz9I9wP3GCAltlVjxwOXjCx5C
	TSbLJ8ABZo/u7Lbq4m/cFvL7S0VBcMpA1/d42euF6nmR78AXRIFSOmC6rBg3KAZTfpNPH93K3Lu
	C851ZMgdD47fqhyz4UqyUFMaVozfCY7smzJBjmMAc/lu1IF3ETlvmDrNy8PJiKNhsKXN3ux+rQR
	MWe2g5PiC1ItE7SMHO9cWWxb7dRq1CnPGLWNjjE5ovG7PaWatgWreOfT2vIXTDpOaTh78zNymRh
	cCwZPPiS2pG5pzzgBc4Mon4bTI22QBYyrsfoXvHw8aAVrZ7jAzg6RWTtMahMQ1aK
X-Received: by 2002:a05:600c:c84:b0:4a1:e57b:667c with SMTP id 5b1f17b1804b1-4bb55a68429mr75652835e9.26.1794595118599;
        Fri, 13 Nov 2026 10:38:38 -0800 (PST)
Received: from arrakeen-2.home ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f7828a4sm6865870f8f.23.2026.11.13.10.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:38:38 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 13 Nov 2026 19:38:17 +0100
Subject: [PATCH RFC 03/23] dt-bindings: pinctrl:
 qcom,sm8650-lpass-lpi-pinctrl: document clocks and power domaines when
 ADSP is not used
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
Message-Id: <20261113-topic-sm8650-el2-v1-3-5183f6aab9fc@linaro.org>
References: <20261113-topic-sm8650-el2-v1-0-5183f6aab9fc@linaro.org>
In-Reply-To: <20261113-topic-sm8650-el2-v1-0-5183f6aab9fc@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Rohit kumar <quic_rohkumar@quicinc.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Konrad Dybcio <konradybcio@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 linux-gpio@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1649;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=IYZzKllyENGnlE8jlO51eH0Je07L7Rrz0zPT4BMmGvc=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBq91keb6kA1VBPnnlaUARHEhCdJgsbPCQ1ljeiie5s
 R+jFRjqJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCavdZHgAKCRB33NvayMhJ0UlNEA
 DIDs+OuP5YF0RoJBlUL5/B5Wlya5YkksFWt/RKxLIu4fFxvQtEHbQjSN+ANdWJWWFIkNmDgTu4/z6a
 Aic/L2475k24voVJK7a3a6SCUlJd0Y1DMXJZVcT3pavimXIQr77dtxTShIMI4K0q+vc40XS7z7WhkX
 PLjGGDbmfdJo/2RYfkZi6+yDEVPzYpqVxF/TwCGCGrHg1w1m247Moj6umOYseWTF3R10dCM8162Fcq
 m9Rc1e7K/V9FcRXBwXaiyCWaKTd4+MloE8HdNcFPfmK3WEuFgXe3ADjIBvxJ1dlIvGMvp07uQ2IGaH
 SS5LhyFhX5wjNJQpviRheXLspz9cKDPoKqq1/SpNvSQha7/fZWEun9O7YBHaFJvULgJtnTQOmp/aX1
 NiAbHZWVK7Ve948pl5641G1P1556n00BGKX820XlkW8XJEvsnfZTv51hcLuT1clwmbu7qBUBvd5Umx
 hYyKj3XTXLrlG4pHyuq+lt1SChrgf9hLXr7Z1W0NTo6gLm89hNLJ6Wu0xGiQMgRstniZ9OemXEC1MA
 JRMdN2DkXDohMhEZ9o68RZkxRTkyy/pFW9ncp4Z1LIwLeYEiZQ8ypOnqHFPiYDhPPglSxIrNrEF5g3
 V3f8xuKwiEtb6aUFAMBfVfNiWT3F164EYcWURan4J2MWsMDnCm1xFfgyNsmQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

On platforms where the ADSP is not used and the LPASS TLMM
is entirely handled by the OS, the LPASS TLMM block requires
a different set of clocks and power-domains to replace the
clocks exposed by the ADSP firmware interface.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../pinctrl/qcom,sm8650-lpass-lpi-pinctrl.yaml       | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8650-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8650-lpass-lpi-pinctrl.yaml
index 1bf08860a4ba..4c54f873199c 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm8650-lpass-lpi-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8650-lpass-lpi-pinctrl.yaml
@@ -29,11 +29,25 @@ properties:
       - description: LPASS LPI TLMM Control and Status registers
 
   clocks:
-    items:
-      - description: LPASS Core voting clock
-      - description: LPASS Audio voting clock
+    oneOf:
+      - items:   # for ADSP based platforms
+          - description: LPASS Core voting clock
+          - description: LPASS Audio voting clock
+      - items:   # for ADSP bypass based platforms
+          - description: LPASS Core voting clock
 
   clock-names:
+    oneOf:
+      - items:   # for ADSP based platforms
+          - const: core
+          - const: audio
+      - items:   # for ADSP bypass based platforms
+          - const: core
+
+  power-domains:
+    maxItems: 2
+
+  power-domain-names:
     items:
       - const: core
       - const: audio

-- 
2.34.1

