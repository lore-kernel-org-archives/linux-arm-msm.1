Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795540468;
	b=R+hXc1Rpiy9CoRDlYRtzXUAR03oU8Z0pBnaBBZ2tN08N2gM/9SBKHsMcnEgjcLWacFTA
	 zPtKABjxi2xw1rrdX5XwjRUKjY17BSZ4sVrzda+fyrf4fguEMYbzhin5YPUlGD/D9qpx3
	 XGFjljHlwEHI6+yBqgudId3TDpwRb79tsUm2lSv2PKlsfh11FxVGqVA20JSjEaN/hQnR/
	 KT35UYO73Xa2BXk39ah26r0EFwCt6JR3XOd5vrcUH+SxACKAHZWUB0PrQQ0M+WZHmch9g
	 8YlApb6o6fFGI9hXYsH5nMWc89lCNzjuneCsPNOH0OpmGVKr1e6W78jtN9HyDAbBsrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795540468;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=Hd+I9pXW0sdvyEhQLvxNgU1qRGdrRwFhnl9rqEkxAvw=;
	b=HemnIMSIfDieU+uQBduBqkbT8mQe2HVrRrunkd/FSKRtpTqIT4LoN1xYdg4R5a3x4SbN
	 QowAoev8ZSIR7gWFW5QBMw8H3xiJlu2yBbsH5A3k35cREO/PSVW994lqfAcXsdLhSHCPg
	 tbV/uuTWNFYCuqADZiT6gn5rHg+vRmloNOmjp6v0Z3mwP5UPLawA3jvq6H/Unu50gJOgZ
	 PSGyyxgFUqwctwPBHFHM2Jvi44RjlR54i/+sxNxodrh3dnrcLSiRcenZpfwxDuggDqEaT
	 n3oHeableLLsYhno3PcR2k7BLsdhWzrpU/wuZR+C8B7bYVDGokLq3K5V3RfM8wQhyeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=hAzaf7HV;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B553606A321
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 17:14:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B553606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=hAzaf7HV
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so44117565e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 09:14:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795540465; x=1796145265; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Hd+I9pXW0sdvyEhQLvxNgU1qRGdrRwFhnl9rqEkxAvw=;
        b=hAzaf7HVGSe6Ta8UOuiGwSzU8wC/W4gE7QFjKOfpPImYeKL433CsG+nsm0XitiI1GD
         y17PfOXXz7bojs//ht5Lr4ZdVftlbCUunxgWR9BaPcDiKpP+RXQZ6+XfanXrgdokC/FV
         ORgCbrv+8zod2SEdmCbDWYMw0PgTFbBAIg04iUG6aI1/aJOdtcSgB7e8sfdU1iKK74RB
         QAj8u88PbW5EgVa9t1dncQA9pWvfFM7cA/5jINelt96IdYPjyU50Qz9qQa5Cpf002GMH
         UVfpiSLYB3rLu3FH4KQzPF6Xay1mtVXfpQmtJrRjG6kB+BjqoH4Itm/RUD8wEiiXrlGA
         MM6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795540465; x=1796145265;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Hd+I9pXW0sdvyEhQLvxNgU1qRGdrRwFhnl9rqEkxAvw=;
        b=ISNwqpW0f+JEfOnwoV5oE1aH12wtB5k8Cz6MquKRXeAmezMs/uj8QtX5/GkHEL8jUX
         bJ18PBw7F+7XdFvJ+If27PGWBApWMy7VTBJ6NRPARV+PLB2AfthNhqYjWf8mO3c00zEf
         TxpwjKtlYGZYnn/+1TaEBSYtOCIhbLomXIlORuuMuPqAPwgJKb8/qCh+078LUVbJNhwB
         qYONU/kdk4tHOO10RoYH/oZzVLgH7PRA2tWP5JIoLOlBBK2snHOgVfpVNtxHnW0Wr8b0
         eAVYJMUUGx81vBQ/l74j1T+8sUxrgf0GSnQGVfZTKi0KUn/GiWedR0SMO+vjhuUvdcvT
         LnTQ==
X-Forwarded-Encrypted: i=1; AL+hErHwM8MM8tz4hlUs6DiT8zN0lsR6HLo7qIvUC6QKSrXShRSGP5a4k0tHMmFThwsXK/tJNnm3FC0U7P/AWwqQ@vger.kernel.org
X-Gm-Message-State: APuU4Z+KxYB4QCDipur+D4e0spFHyHajvq+XzbDtsPOtxINLbfLGT0JW
	RLSjVRYVmd6NjoX9+12+DhTn+G020OCbSOm95bywPwjdJOai5ZMi3HUhHL5Q2IuopDvbAiTLkll
	tJ3ICyQ0=
X-Gm-Gg: AZFdTZeJ87ON74+PC+ycz62g8UsaruVVxEy3m3IHOLEqN1it9LOCRaxwe3dCbVTXCoD
	gMFK8fDG/O5Imo6rAXwlqjRS0xsVuQBA44NF/LtPBIvxSoY7mLrzgoV2/HJrLrsZ22t+4rdfOLZ
	ctc71lpg3A1PhGWb2mYaJZEsTllVyFQI7nr/EqINc92PmEwdoGLcATwtY33QfGIfHCRRQeCLAaN
	UeIjMn11FoQfN1ng6UoSRc005GpKQSQtVt7DGg2WDeCNEs14DETCu/9hSpqXcaAGy5h6FfZ8zUq
	URSQ5+WXq2xZA9aUics+1xovN3/E3/YbaG5AW+bgFRyD51LP+hsNdnjPDta8ube62jV6ubcgE1r
	ZGph+4JLIte87Ug5abKAAvY3AjV6XPAssvLVWM79ho1/POJ+MCT1FcMcMCY3bk7bcgQ5lJ7NcAF
	NY7pS0HsMlzdRbfFnfpFZ0o4akwQrbFRyWioXxJdYlBpXHG5cUl2PLaBPPwlDZrCdePXnbSSzJZ
	K/xRwX+b3JwvhS4PhbFOh27KUzp2hOkmXUoUA/RoI5DHRLS16ApRxR+04W70Cey7exMAY+6BAkF
	vRXuTUR0KjqsM3LSnFd/TwEmKNsuV8yyjFkhpTA/eTNwgODh4tk=
X-Received: by 2002:a05:600c:5306:b0:4bb:6ac0:6dc1 with SMTP id 5b1f17b1804b1-4bb887c994cmr314870705e9.2.1795540465344;
        Tue, 24 Nov 2026 09:14:25 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849e598sm410592735e9.8.2026.11.24.09.14.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:14:25 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v2 0/2] arm64: qcom: enable SM8650 audio without ADSP
 firmware
Date: Tue, 24 Nov 2026 18:14:21 +0100
Message-Id: <20261124-topic-sm8650-el2-pinctrl-v2-0-fd05c8378a08@linaro.org>
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
X-B4-Tracking: v=1; b=H4sIAO3FBWsC/32NQQ6CMBBFr0K6dgwtUtCV9zAsytjCGGzJtBIN4
 e4C7l2+5P33ZxEtk43iks2C7USRgl9BHTKBvfGdBbqvLFSutJSygBRGQojPWpc52EHBSB4TD4A
 ajTupokJTiXU+snX03tO35sfx1T4spq23GT3FFPizf09y8/7cTBJyKGVdOG1Me3Z4HcgbDsfAn
 WiWZfkCplw1i8sAAAA=
X-Change-ID: 20261113-topic-sm8650-el2-pinctrl-c6caf4237ca7
To: Bartosz Golaszewski <brgl@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Srinivas Kandagatla <srini@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1502;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=0xZyYQ1QCsRnZoyKEDk/WLh63GWw1TE5/07D9O+VLII=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBrBcXvXtZBbMLDgvkGtCfwe5VQZTIYtV2vlYQQnUF7
 gXNg72OJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCawXF7wAKCRB33NvayMhJ0VKHD/
 9NUveMCAmZ2GPhLrcDur6R6JVJ/4cFN+ATqPprw7UcaSAsfPUwTCEZh0cutkUl72Aw6MK3aXydLHVB
 zKTgqsQhlw7i58wOSG0souPfTE0g/ykG+yFN1gcSGYeAzTSv/V4SeNNjSW5d1Alo30uOxaJyO7Um/j
 3mumUY7ptOKEBMV88BzD09/UKoMFzX5mRQMLl2OtJq0PgFsG7mnQ8cnwg/TA97kyt+yOUPHMC8RDTk
 qLn2a8eDPAHonAmaTGo/3QOFbRL4RFoVOf/tilSizA7I5jA0qwl1By6AWY6r+GeioVP3taxZMzNYL1
 ytFaNdQRBpo2Vmd/LN0OYyuYFMNKDh6NCFfuDJq4dDJDYXTxCpRpL7tV+GWASTu7neTnON1TCdnaDN
 bBUuD1eleDutzYIRyfcEC8rcPnICuWq0bbUuRuMYWA8WRuui2C+aATnqwsPt5Q9NzxVkIgJOBRiAth
 JhPc+YtSPC29IJDcREnBj+1WHFb5AgdC6VkyswcnFb/FtsIbdzvA4B4jHx2awRuCbPfyCgX6VlRuT7
 NpN2zjTIijkVTRbISBt04iDXpuvvpsehdq8PRxKnyU/g+MQJNpqgU/JWkgqWkvfvBSNIkGWL3jsnXj
 91x2U/VQu9iCagAr14CI/vHtIN03BWp4U8MNACz2l57Ds6sn5KOlIDZmCYRA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

This patchset is part of a serie adding the necessary plumbing to
drive the SM8650 audio interfaces directly from Linux.
This is required for boards like the Valve Deckard that boot Linux at EL2
without the ADSP audio firmware, meaning the audio interfaces must be driven
directly by the application processor through lpass-cpu.

This patchset is forked from the monoliothic v1 at [1].

Without the ADSP firmware, the resources available to power
the pinctrl differs, and the LPI pinctrl power is controlled
with power domains instead of DSP clocks.

[1] https://patch.msgid.link/20261113-topic-sm8650-el2-v1-0-5183f6aab9fc@linaro.org

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v2:
- Simplified bindings change
- Driver update to use all power domains
- Link to v1: https://patch.msgid.link/20261113-topic-sm8650-el2-v1-0-5183f6aab9fc@linaro.org

---
Neil Armstrong (2):
      dt-bindings: pinctrl: qcom,sm8650-lpass-lpi-pinctrl: document clocks and power domaines when ADSP is not used
      pinctrl: qcom: lpass-lpi: attach all the power domains

 .../bindings/pinctrl/qcom,sm8650-lpass-lpi-pinctrl.yaml      | 12 +++++++++++-
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c                     |  9 +++++++++
 2 files changed, 20 insertions(+), 1 deletion(-)
---
base-commit: 909ef7a9a30fa139e69e555e3606680f5cca7726
change-id: 20261113-topic-sm8650-el2-pinctrl-c6caf4237ca7

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>

