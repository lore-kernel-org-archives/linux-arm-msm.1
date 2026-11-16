Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794807298;
	b=h0gRCw0QQaobsr91IldcF1MmmPtdKpYlkbNbOan+qw2kC10wOLk1g6Od638Zw/iU2IX7
	 KxawYL6CIIAVuPzaIwQfgDNXvOdxeqQsw68PbD72lCR5L3okTsVTnK4TZVswqv+vSGIdl
	 Z/lnStf+a2Zct+ubcF3wkbxDNHZ6j28nZfihnsuL3InylLmZ/g/NWzpzfY0fQyRZy4FjR
	 uAAuGagRTxFhL02IyTmHdiOue37Dqy7aijLejlkTIkcH2y1YfzF+wO5sl3o0SH8SpNdgr
	 rqWIx/U3NujRu9tW4W5SuAhrjAPdpHOV/MVaphLIKmb4DgGHthpGOJib93N3Wyv6Pew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794807298;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=qOERypWJhWIh0EMLri6y7PTlFgXfpVg7COFVnAl5d1M=;
	b=Gaou4fgsAxxcE+5j3HDhbxxUj24Eih1VNCxPMDsn2J4pC30YaYhuqk8T1F82oRsM6Xrl
	 cJiqKG1OyBIDJFbC3/1UfV+Dng4Q8EdHHXjH9EiPk51DaWipgPeSekW66jD7yT6slmsg6
	 1R807woV9alg8vie5sdp/xPq/M5zB/QaqBP6o+/ZN84e5umwvIg9GcSh+lWMQhuwhxx9a
	 gmubDFy0IfRGL9kxbxVxzyjYFP+9mo8JA5Qt5JfQ4W0gPb++CI9f0ON1EIy9+dlZb/Mmm
	 3kvgIrSWMqyCfST+w4DYPlmar9G2geDZ/74PjqNYxz72tW1cx7+s6bk1sfHTQaqL8fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QgEkfLmM;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21FC8606A32A
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 05:34:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21FC8606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QgEkfLmM
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-170135e43c7so4835913c88.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 21:34:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794807297; x=1795412097; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qOERypWJhWIh0EMLri6y7PTlFgXfpVg7COFVnAl5d1M=;
        b=QgEkfLmMhlXHSaXrEB0rI647/8WJYtvt3ZL7nLXeWKGpzH0ChM+Z2sLkznM6o6l77U
         cIn902Q1pBIMkZPFitNjrvZuw2QwqYqnlmtddITPWhfX9HKYLiTY/EqF8a1ToeGRPZcB
         s33PjUoWn8gqONynWBg4d05aZfkRhr6A6OfcR4yq4Q9L5UioKsKqwiZ60DU0/NgroA9q
         Sdu6OPgMFF70Hmv4Z1JO/Oi5zKNhANjV3I13rE0DxZuZ1yZTPpJxVN6wi7PXPUgW4R20
         YfSMgCxfexW66Qe3CuXnLFZFGR4rdRAcHiTw0YZXvFj4s2s2djNDKAJil/XHvo1RLoAf
         4cEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794807297; x=1795412097;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qOERypWJhWIh0EMLri6y7PTlFgXfpVg7COFVnAl5d1M=;
        b=S1hd5uuxIxFMwtmH70Rr8MrbQTX7K0LANM0k7ZjCsvp2NRy3IJZLOV8Zl9NBbVR/fE
         9KosJRsa5tEtOl+Zhg+/L2MpzEKTOVC4O+HsIiliTFJxs2kipF2cnWLMoUHhw/YTqDKK
         VaYy7yRWkNYc3pguVaj85ilHSuYDolw2amc4jasVCqPocs1tMlBxtbOr6cyK2MucP6+C
         jLWIHCbd+rK1oc9RsDcseO6Kf/Z9asSqKyJRNdoFep3zYsNw6/SRx49322J3MkdkcP2h
         ufVAr+9QUcIAIZXt74qQHtPInSuXdJRDA/qkvDLbTOvj9QC1H/3PbHsVPJmMjM3PO5FY
         rUtw==
X-Gm-Message-State: APuU4Z9ca66+agj4wCH0dgvk+/osZ5s/1j6/Tip98lvCytks41+/+vV7
	tf6RATD1dSFisVEGxPuRvi+uLlRWdzRYsE38EMzmMt5dll1+jqyCoZNW
X-Gm-Gg: AYBFou2VoDzVBt0C7zxW61Mn2StbAGEulLrqEwDPdSwv7XgmOXg4eRrMR9b2lB6lmzs
	IYyRU0idCN+kEKDZUMczrliPi32fUKspLmlG9dz+4ZxHYZaIs2PXtjq0TYRurb8KZK/OlHipxxI
	Eo4WQiImOq4DLXNcHECVDHZvjBK8Ea8rjyWjdlm+NSYzjenOVVY4+v2Svo2kgoyJKFTWlaYLDww
	ALmRl+Htj3DOLnbrZpLK0nDsymukGkf4ptIzEy70za4s+zCDvoO+ARp1tsiZg3fV61o072lIWFl
	WQYJYtJf2cPcQLG9iyn9bRL96uKHq9B4+DMzcK604JWWOPXAiFZmUp6dC5bMtOKWbsfZgESGJCC
	yCrj8fZeqwbXtEcMu3wr4faTRWbtLUmulZE2lVuceu0pELzZGpH7XimfWHN0dDasNCJA1AjWmAP
	V5nOQiPCNTDo/dGqZzANtR7DtCjkZZH9oihm+Sm7owEygstS9vpicOeU3q1ODLcVmcXShG6jZJC
	cRR9tWUc6JRzWFk02rpUQ+zdFtwfrGZzYpYl7e7dKaQLgkWYadquSnu/Gk+ad96ECIbfzbxvImS
	nZEveA1YTrBff3he1fPT2BCScuh6jvGNKbtyjemAopyyH1KaR+E0Q+bAnIfObPtBy0Gop9rEQA4
	76k5p
X-Received: by 2002:a05:701b:2202:b0:1b5:e9d:c641 with SMTP id a92af1059eb24-1b50e9dcabfmr6979275c88.18.1794807297153;
        Sun, 15 Nov 2026 21:34:57 -0800 (PST)
Received: from Sobhana.localdomain ([157.51.206.8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm33463380c88.5.2026.11.15.21.34.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 21:34:56 -0800 (PST)
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Mon, 16 Nov 2026 05:33:50 +0000
Subject: [PATCH v15 6/8] dt-bindings: firmware: qcom,scm: Document SM7250
 SCM
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
Message-Id: <20261116-sm7250-v15-6-6acbb232fef8@gmail.com>
References: <20261116-sm7250-v15-0-6acbb232fef8@gmail.com>
In-Reply-To: <20261116-sm7250-v15-0-6acbb232fef8@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
 Robert Marko <robimarko@gmail.com>, Guru Das Srinagesh <linux@gurudas.dev>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, Sreeshankar K <sreeshankar0910@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794807229; l=838;
 i=sreeshankar0910@gmail.com; s=20261029; h=from:subject:message-id;
 bh=rejlxjgmjiSGoOQieemcJFRPRnZEl4/NvRv6It0RMUo=;
 b=+oPS+u7aNVKFGbhmW2mW9YMFYA8wj0VjuFaEEsNN19MH2mpLFA9LeS7/pYH3W5tSsVCAi+/dP
 DVlXk6/wjvhD/uXpn/EzjI8ASaJBL7/qCvU3NQ3e7f8GcDRtdKMByIM
X-Developer-Key: i=sreeshankar0910@gmail.com; a=ed25519;
 pk=CGSHduvtn2hwLCNRXRc9s/fh6X8PH/zNdp08zC8hOuQ=

Document the SCM compatible for Qualcomm SM7250 SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index 40a267c54..ee02a9c20 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -76,6 +76,7 @@ properties:
           - qcom,scm-sm6350
           - qcom,scm-sm6375
           - qcom,scm-sm7150
+          - qcom,scm-sm7250
           - qcom,scm-sm8150
           - qcom,scm-sm8250
           - qcom,scm-sm8350

-- 
2.43.0

