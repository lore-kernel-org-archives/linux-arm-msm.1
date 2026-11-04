Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793810865;
	b=K+B04Tb7R/qlnPXu7aajGTpfG2gNO5ptemfUQn3RAOYo/kzrwgclqx+pM8eSzX/xaTon
	 /AFXatUtGfjFotx9RcSzy9+EAV3ICVxk1xB/weQVZBkIVbSuiy19azJknsdw+d34gL3/7
	 SSZWD4kNNEr6J3FpPOa6xT5/Vi/qpCmdCH4kzs2LuntwssDgH9bAVR19PXDU26jGUi15U
	 5DkVlmyFPAtfBmuUf3GX/YAOzGKvMI4hoMpBtAWoqDGdOIrPEoY8vq+eVlFIcSJIN/WX3
	 VYaIRtc9ahvWYj4Kn2L709EaXYYPOP0zVw+ZQd5HegEW59kkJZlf5qq5FLemkBkBiEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793810865;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=U4fFdtJNvcZ6y6D1x1v24LO+4CMQIoUBaMtD1ZPuCLk=;
	b=T7p2scrFOugxMhoGdO4PIHWhPmHJxiA0ExaoPYsVI6npDsR4uxc9iS6R6WLHk8SlmSjP
	 cn7JMvWaDPhj5CEXPli5ydLLd0t2l0lc+ULOmeCLG+7n0jWs/baj9tCLtS+Mx6DIHl/eC
	 LZ0sxkqN855klG+0E4UvfGNsB6KxCZMp9qvs0wSQQiWTRt6NldTeXesom3AIyF7kE14es
	 aEoR8M6opAH7cC1OB/EpBzA2tBs9k/JCggzEO1tsZsZ13Wcz8/k8FSwjuXllVAqfgEk4b
	 qnLGXonlsN5ugRoT19zO/HTr7oe8/yPnyD14EWIYV/f82XQP1MZE5utMRH7XtvSl3yA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oDKTeHu9;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 311116082BF6
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2026 16:47:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 311116082BF6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oDKTeHu9
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-170135e43c7so1402699c88.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 08:47:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793810864; x=1794415664; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U4fFdtJNvcZ6y6D1x1v24LO+4CMQIoUBaMtD1ZPuCLk=;
        b=oDKTeHu9/D7LEgoLtX2Id9RcRVT+1ag0PVlRkJn6LRUJ+tPK8qy9UNhH2k58LkNP7E
         qwgy6EaLkLHJ5BwA5IvnkC7NrLSYc+VeBrciVkYShA1mSofVv9xqO2P4ZLrlUdVgesFb
         U4oV45ybr0Ly2k8X2vFleAjnX6CyM7N/Xgxg+9o+QTkozkOGqbyFkhZTJC0C66h8lVn3
         Ngdhe2KDalL8T+jNBgDzqtZqBlnUPLVnkYXrCHkELW7VjmOHykwjTSDbPWfceaQ8znz9
         Hm8qjdk7tKhA0eI3M5t6XXN9tlH8Ir7rgJs6gdNaxOal2rgWZbfX415OgUxvpsc1Yu39
         sfJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793810864; x=1794415664;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U4fFdtJNvcZ6y6D1x1v24LO+4CMQIoUBaMtD1ZPuCLk=;
        b=23SbRwqflc9dXoHufsDEW8G7ieSTioRvJWF8ll1P9kdDYDEu9oEKkaF74NV7AuppLB
         Xn9VoSUQxedDpSwBJbSv91i5pRchQiJKU+DdmSCoOFzrTH9kXn1jJgV4fOT28fvXjW5G
         oc6RY7Clwdh6YOYtHBSJPGVkc4wyRbgZWu6qyldR76gv/gghpAyDRcIh53qNwUscuQYR
         IRyiWXBscHv7FkIoVg2pHiVMx/uQO3MwCZlgqs8KnNooBJ5TWKzMp0hVdx92sTb439Tu
         hdnLrDH0+RbO1m0chRjSe0LdjmSiZPM0tJETTreWBR+Ypjz9mcJahwZr2vtSgwskucUI
         p91Q==
X-Gm-Message-State: APuU4Z9CgT6Mimd8mW5KgOXrY3VB0wp8OTSnvUR8pBc5bm9TV6Str96u
	ngmbEwW81VSbjwLQk9iWTjIB/4NQUOnuWcKwjfZa0HbMG8swzZJk6sP3
X-Gm-Gg: AYBFou2thimNxhqVsHHczZe4bBmN41LbAvBXzffU79Ywog1rtZmSDC7+9h+Lf8SD17J
	gmCnASei4h9EZDQLoRoMPzViApa//N4maXlErBbK4yDymquHOYFg1uXA0Xl53rtmeNxCY9vENUi
	hkWbQ/vxd5Jp2VNNHT7Aoo8DFRirVx5JSOJ/6bnlE8pwATugFLz3+MWN8LgQ0I9S5olRhlkp6ea
	Le0Y3bhTdsec7OC1slNIQ0MkLaxRKTIz6s0B/aqOqlxtWRSxOOPWlVLIPZnAM+i4DJo3CUWckYc
	4q3D6Z7n3XU3NmkOhVQro7Tershc0Z/L/UQm+PtLXsTJYNzWoWQfTCHJiHrT7VIpARjEXta4JxT
	637CaF+xQshdKP+D4MJVhb4DTfGI+gusQFWFydEwViDCOIuHLita/gp2MABrN+JmlZZALXzRojt
	36addi4Gvq3k7jTuUh8oOvEm9ONTAFEl0XHb8B6FMVeEoujLUvSiIa/8MM4H+VuAwmoji6qKwwY
	+nvHpbO8jwZhZP+AY0uNzEK5mvzlNOGL+NMrVaVU1s5GvCZ7g4cB7NueG5rvjux8Qx/IJ5nnspq
	OT4dk7uWD2mNBiGc9PxP+i7ws2ZmsuimmFK2c+NQQcoXkvsJ4JIs7ulC7aJwDGJWL4GCNVhmj+s
	fea5qs3Q=
X-Received: by 2002:a05:7022:418a:b0:195:e4b9:d326 with SMTP id a92af1059eb24-1ac5b9cb638mr35445301c88.12.1793810863974;
        Wed, 04 Nov 2026 08:47:43 -0800 (PST)
Received: from Sobhana.localdomain ([157.51.207.207])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c57430sm10839666c88.18.2026.11.04.08.47.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:47:43 -0800 (PST)
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Wed, 04 Nov 2026 16:46:38 +0000
Subject: [PATCH v13 6/8] dt-bindings: firmware: qcom,scm: Document SM7250
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
Message-Id: <20261104-master-v13-6-355b65c6f764@gmail.com>
References: <20261104-master-v13-0-355b65c6f764@gmail.com>
In-Reply-To: <20261104-master-v13-0-355b65c6f764@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793810796; l=838;
 i=sreeshankar0910@gmail.com; s=20261029; h=from:subject:message-id;
 bh=n/5l0LzNHQkrbMmziTZYOIF2FEcc8PMKPnj4oscjta0=;
 b=Sm+u4EHvzCpGgwZKZFX1DxrtxcvbrxK0wHlNVW12r/ijgENS8oSQFaV6rQsbmumD7aCwcC/gt
 fIcKsAunm2yBJViY0+UhK+wTGor9I9Ro18x6cbo/n9EqUuUrNeNrdiu
X-Developer-Key: i=sreeshankar0910@gmail.com; a=ed25519;
 pk=CGSHduvtn2hwLCNRXRc9s/fh6X8PH/zNdp08zC8hOuQ=

Document the SCM compatible for Qualcomm SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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

