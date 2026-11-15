Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794764589;
	b=f8jrBxbfIzO21JFqEgfyddcwRQuun8lmXRzTyGrwG7ikxbe+ODTN0VTm6VjtN/Wyjqu1
	 ewXaY4z/I8NQvxzeYhGhFJC26wNX5WyIsoE3jWSAfMuhE9onyhaQakcTuGHcMf7XK4Aq/
	 CYRGGCmtYBYJtt7r0yPE9q4Fc9AxGTPOTTH0BfXl3vDrZgfy8b5rc+II9CbFnhk16DVVn
	 Nr4Wr3Ub/CvRaAsXHFhV9owU9HwSqGCF8yQDzOqwE8dbjZCI52SaFYMWv+KuP1UbBxmkp
	 W1iujKecUViKlmLCP4/DZBgSwHzPzx2y7lvBY4CmYgaZRpSSfOCdSZViT0pyMwmGonw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794764589;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nEj//Ut3LvAdBYHkruCpeRqw/TE1nQ9XZ0jccIaxI0M=;
	b=1eB26Qt7iXvvNY4bQyaG0Q/bE6l2D115CB6pDppKgzMKAo6uppIteIbdARZkBjPAKl7V
	 0DeRaBHqxT8cdFDJI6/mGJCF+86NI6pSwZe8rLWW39OA/j0hGg56npsvUXkwbUoLJyabh
	 SXu/0sleUKqk5mxPnctNXS0fNGeuy1vo49mQWodtpYhwqbm6U9fXWJqMdYa/+hi6uzsYd
	 3tfTvjYzRTjBZKQ3D541MFA/p44buK5T+bq+pWGSiDHwULbzZHFX7GeWM0519JkgtMtbM
	 TjEcARWpCXggCtjf4KS4FIXnZIq/h5A5TTVibhNoxbOaouaqcEMIqFB1sn/5lmjzhFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PcvgdI2h;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E633B606A31D
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 17:43:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E633B606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PcvgdI2h
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3712b6d9843so2027698eec.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 09:43:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794764588; x=1795369388; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nEj//Ut3LvAdBYHkruCpeRqw/TE1nQ9XZ0jccIaxI0M=;
        b=PcvgdI2hMpvMdiW1+HQUyQPn73hNMwjQBCwx2gkXPzGcBD40Rm7sqewFwAMwQCrvSt
         dujQtw5KC39VuO4ARpPHiz3Iu+zKcCuXu8Lq0tBgOi9SUEdX/QGMVciLkHTJEwOvAjfM
         Z9hMoL2L90bxWRmAxOxqdqU1DyiRABaDLILrtFT50DBkiGTsLzDOE48d/UAbjKMf1AwG
         feu6Fha2eouQLYBnnvCedkwY0fj4ZGKC4bXCNatK44fRWUVlJWVfupyap9ckJWUErR+0
         eUl3RMiNb7nhdmEhxuhtFwZ7jvv7hluUuX6DMiuvI+kXR41QKL7swfA8LdDJotG8cZfc
         2f0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794764588; x=1795369388;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nEj//Ut3LvAdBYHkruCpeRqw/TE1nQ9XZ0jccIaxI0M=;
        b=n/KU0WG8l6YLPW1ZvZwD7AJ/Qd+MQY7dK7hyyr02CnOi26xi7x4nTMAHn54ZUugFyI
         WwmockD0sXlf6RMVV1t/fZfhHNGHJFMYpSupqJbW2sNKp0iC417ts3LNlkFUodM2p4EV
         /Igdj4aQr5hpSHDOHkMm9VwM5a37J4VKQB6uFBGgPQvtKgl8j5tOQwNoncwbAcWBg+Vt
         tfEQhH+ER29tFXaQTrTVmUOQilgWszAqsJyiylqfumGfIfVUzfCNbgAHOF51d9rhYoXJ
         pUxCZ+aFWoXi8Q14k744l/BVMkjuMumrPenlVZ2gi+rolJNs+DfYOGuE/+qaJKEqomR9
         qLBw==
X-Forwarded-Encrypted: i=1; AL+hErHl3b5xNOVnq5ezQdFi7x7ToK05v6LVNjw04UDVvFyiGHzexGfNO9Zk75fjVZdCgWSRZP/+I8TxCIxNvTGl@vger.kernel.org
X-Gm-Message-State: APuU4Z8eJ6bXYSXu3eDluaHqexFC/EPxOEhJqsQ+lAiIM+dzBCSXZR1i
	3bDboPNdzY2EuxSsURVrBQg9q2sfYvkej4+kgv21q7B+VOGQadDIIyc4
X-Gm-Gg: AYBFou2fX4GRjhm+VPNnZw2+j52mqWWyAIjYOThrx8URGQcQnpVJ4YXMI+1giCdgj1R
	PegsfK+9LsDkLbxlJ3JVDpXPoKh7hunn2Or41EHlPCUpiuKbPg2c6z4YWV29dvPo7DQg7VwalyD
	x3HcRtAdPYIBY4bjdYNrnc778Lpbou7Wrltglkk0NBGdTjSvIAp8hCpUAYti8MXQK+JVntJFAtU
	nL8aMi8im5kTXknimF6+wQEJvXe3XBR/RQnD7n0spahrc0UvigxYXMizgFhd952WOhrcFlzNlkW
	RnkSim5pr9NEGN4RFKte2tsB0hvTKGNe/2W/BAzjVWDemqamkxCtgCUb50X92H7rVNwBzGbNSxr
	c9avhCcCm1n1cgLE8boH+KZYrqpSJjXX6aTHv5X/wwaXqF2O3nzh5ThvAUBhR81RGPd6g2/ZvFG
	JNu5oF5MF88sDtv8jCwzAaKseP7DwPZVMy6VSXgODWdRHpXeaVX0q9Ba9i0AHQGU+9yozvSw4L2
	aCPzNbi0lmrzIEsy4C38bafse3274u+GSqoRlJefAWFa5GY4k9DULZr6c2ZqlDZUCSOWwa375WF
	OEn27w+xcpZieh0Gtnp9amt/pJe0Z9mcMw+tZ53duFGF1ZhWUFe+NlxcWipPlXfzmauuU5yikZC
	e4Pl5Cu87Tp1x90iFEz6Cp/Rh9DlInnh2eWBI8B173mgk64avz5VXhDUcs9G+sHJmzu2xPgn+Ng
	3ZLO5aYzE3M4yNXYoQ5Y6iqFxXJ7EPF1t31fefEfJu96Lr/EE=
X-Received: by 2002:a05:693c:87d5:10b0:379:f7aa:1013 with SMTP id 5a478bee46e88-379f7aa1638mr6773932eec.15.1794764588005;
        Sun, 15 Nov 2026 09:43:08 -0800 (PST)
Received: from suraj-HP-Laptop-15s-fq2xxx.tailee6f87.ts.net ([2402:a00:163:3509:9ac3:b274:12a6:a1c4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bb0c40sm28204663eec.28.2026.11.15.09.43.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 09:43:07 -0800 (PST)
From: Suraj Sonawane <surajsonawane0215@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Suraj Sonawane <surajsonawane0215@gmail.com>
Subject: [PATCH v2 0/2] pinctrl: qcom: sc7280-lpass-lpi: add ext_mclk1_c
Date: Sun, 15 Nov 2026 23:12:35 +0530
Message-Id: <20261115174237.48908-1-surajsonawane0215@gmail.com>
X-Mailer: git-send-email 2.34.1
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

SC7280 LPASS LPI gpio5 can mux EXT_MCLK1_C, but the function slot was
unnamed and the binding did not allow it. Name the slot and allow
ext_mclk1_c in the DT schema.

Changes in v2:
- Add the DT binding as patch 1, as requested by Linus Walleij and
  Konrad Dybcio.
- No functional change to the driver patch.

Suraj Sonawane (2):
  dt-bindings: pinctrl: qcom,sc7280-lpass-lpi: add ext_mclk1_c
  pinctrl: qcom: sc7280-lpass-lpi: add ext_mclk1_c function

 .../bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml      | 2 +-
 drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c              | 5 ++++-
 2 files changed, 5 insertions(+), 2 deletions(-)

-- 
2.34.1

