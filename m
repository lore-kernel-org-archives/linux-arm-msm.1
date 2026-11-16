Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794807278;
	b=BtrmJbXIgld+GaCS5s2bQyYSajiTVOIwYmaqmIgOe8trKfDe+zOdL+eYTUOJFHbuqz2M
	 xGmJAXVsXB79Vipz3kTVeNb9G8ZmE+0kL9QtssRsEoGprmEqQQzG0LBYjkiOQGxBepos1
	 1cD1LhnoJ2KHERcL8RISho/G9OYVSLnmkQ9EIV5pZsmMC8e39AZqo0kZBS8PNuJtrJ79D
	 gBoFslzbIDEyx2y3bUZXccY41D3lJE2Py4G1601Om7zVmGX98c977NUzZi21hgsHCtAZe
	 xAZvZBXI0UQ4Y3IYxswwB0/XfUgJbI6pdO0D/4Y5lTYYJJPDj0WKQJOFMSY6MrcMCNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794807278;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=AZbalvr0RZKV2CHqgY8md5UEm/BcGTfETxormN4SzfQ=;
	b=NBmEVHmv7vutzzedDDAGT4TvlCxw8vZ/yFxG7cOwGewNFO+LqCbgQRuX6CK084JrawMg
	 pJ3bD1LqPnO0UEH00Uux20960eUZHS6cT6bMwjhgK39F9rhaenSphILVR5ZaE+FtDBBnH
	 U9redmPq4S9/TaPUQM3qo2okPJ2ZBy/zKkayTtse3Ad22tHB2fxm4DDuI9+lpLCrLML7m
	 mSxyd7LeXJEpbS5BTTMxkX1ab+5J9BaX3ViHOK+IeFgJoJhK8gIgGGqXvzzhxxBIQiV0v
	 6+9siq/vmCxBNAgqBjf/LCxY0wd9gzDzj2g5kBIEi2L5OVpVuqxjKBHrVi2ILIq3zrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A9kf1Z+x;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74DAF606A330
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 05:34:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74DAF606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A9kf1Z+x
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1aefd1bf74aso2270602c88.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 21:34:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794807277; x=1795412077; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AZbalvr0RZKV2CHqgY8md5UEm/BcGTfETxormN4SzfQ=;
        b=A9kf1Z+xZAI+O4NImLVZ1du3+v+O27Jx4WofylUUmF9RFtoG1LQXRwitighsJgZfqi
         bDR74J4ta2cYOj1P2ia7fjprfYCcH0n1C2DO2PrNddBsf7xBT0cgB9dK2w3zZzUoM0Ui
         E/9AaBdwIG6dyB6jPetrfXbxH5tuhm2jMySWBXeq31wwhMcVnWTGXqcUEh3VQ92gZT1E
         uUvQAD7M0or+QQwUMFB5UcDyDCDYh1tUKryBkM+GVGjD8XLlEgkLdp4Z+WqAuRoD8e3J
         uOQL7Rh+OzGltnWJp+mA166rBe2WF+QZiMCx9T8a9xYT3dOiOAcJwskNuwwlQG3WySsX
         e4xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794807277; x=1795412077;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AZbalvr0RZKV2CHqgY8md5UEm/BcGTfETxormN4SzfQ=;
        b=aTWIZnji4a+bskrewbR/foeO8MpPoEMICRQud/4kVWhTKMYeFFPOqzbaS7qoJscTh8
         CV4xakusp8SvK7XfoQhfw9Go+s38N3A1fxyuv3SkR/VLuaFnzodu8lZmwyEe5rPwWtfD
         EzsNslWuXScclXIGC9lntbmXMGgvaNQwBCY8xAO6iyA4HvfxKZ4yLlXnVRcZefFaFlt9
         5Lj2A3nSotveUAq2ZtzGR6bdSc7pthVPM9SktA6u/M7l4SQ+iPlKS4SL7TCL5fEofcgY
         +1lDYOEcO8bmLpqIUqneh5S6WiCpdHOPS80XO18/+uRco5xqGu2BpYKlqMbU3BIeE/vx
         F+Lg==
X-Gm-Message-State: APuU4Z+egU5WmOxRYMDflhToMVzY0A/YYEGr0z7g5AqgDBCfyuzAYenB
	CFUXgeD7wnHts663L/F9OIVLpigACXQ6eoiGVxs+jSfk6rAz3KAmtvrv
X-Gm-Gg: AYBFou28fTa7lO//MgdvsfW79FE1Ad2W4zOxQQ/c48MgOFoa1IehFRtjYOOfsUK40d7
	oBP9949bcoZ6Yf1WHO3ZopSyCdwayUqkxVko04XAvd6M6g1td2hgrrr+pe83jzdMHaRnNzn9jcc
	amdydQ8a3BUzWf2clJ8P98huYrDRFqC+rQZQMqpXI3An7IHFqwuvuydTeW64y3lC0lX4eaRq9V5
	1i3TL95v019T0tnqEYbkEtmCJkuWsNjnoWStvdxyBMydK0Dv59S8w44Cqqu5wDH7/ypIdHE5djc
	ZJ8NZgzU0OmJzJvIe1TwlgUt/wMI9ZbzCbxbdRt9h30j+SFLvgwwrKuGmes562BTVvEIror28f5
	qIhcA7th+OE8hQ8K3vsphO/QP5sNfphBXFcNvAHQhqC5TiyyBD95CMoYgD7zyBcjjpAhev0rs+m
	woH6AF7DqhMpzv4E/lR0K9hdpZ1VKJb94wesD7v9TwDKbbw5J4ba6QQWBxc69MwxIJ4TfrxfKKc
	6nqBDbZm99VHadw7c0qN+xTSEXe9axpriu+UHORg4RDlBS9DxGBuu8ntn5pLqlvhA0MMhz2L28/
	CByvm1z4faT0k1ZGotIRKxk+rfYHMEJVd6zzwEXJIRkgBq4JtME8emSuqOOt3pKICav4r2yk7lw
	VdF0/
X-Received: by 2002:a05:701a:844c:20b0:19d:233:989d with SMTP id a92af1059eb24-1b5030ad3bdmr8391819c88.14.1794807277352;
        Sun, 15 Nov 2026 21:34:37 -0800 (PST)
Received: from Sobhana.localdomain ([157.51.206.8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm33463380c88.5.2026.11.15.21.34.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 21:34:36 -0800 (PST)
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Mon, 16 Nov 2026 05:33:48 +0000
Subject: [PATCH v15 4/8] dt-bindings: thermal: lmh: Document SM7250 LMh
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
Message-Id: <20261116-sm7250-v15-4-6acbb232fef8@gmail.com>
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
 linux-pm@vger.kernel.org, Sreeshankar K <sreeshankar0910@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794807229; l=791;
 i=sreeshankar0910@gmail.com; s=20261029; h=from:subject:message-id;
 bh=VBYR2sSJ7gPSfZ1zDIlxykyMXb9GohC2X09rRKZ3wIw=;
 b=GfWIYZ4Rdr47qL4uVzwmq3cHBxuZuZfauAK9SuR+lb6tJOGaW7G3JO5uex+TMga7n417jmp6t
 uDxoG1lyLysAGDzg6fS3Jl0jgyrf7wGrThcMpQTEmnFiL14C5GZ0vFS
X-Developer-Key: i=sreeshankar0910@gmail.com; a=ed25519;
 pk=CGSHduvtn2hwLCNRXRc9s/fh6X8PH/zNdp08zC8hOuQ=

Document the LMh compatible for Qualcomm SM7250 SoC.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 Documentation/devicetree/bindings/thermal/qcom-lmh.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-lmh.yaml b/Documentation/devicetree/bindings/thermal/qcom-lmh.yaml
index ce72347e2..e1d5cb871 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-lmh.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-lmh.yaml
@@ -21,6 +21,7 @@ properties:
       - enum:
           - qcom,sc8180x-lmh
           - qcom,sdm845-lmh
+          - qcom,sm7250-lmh
           - qcom,sm8150-lmh
       - items:
           - const: qcom,sdm670-lmh

-- 
2.43.0

