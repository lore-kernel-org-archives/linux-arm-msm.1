Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793778410;
	b=gjlJAGeu0tFl8dplmnvIPYdG1rK+rcKib7S12jkreY2bvMNEDZDgGQa6UerrcXHDwok7
	 c+5BYNVKpQSJn/ubrJ4ytHtCRGqy0D93RY0n3Pmj7+FzWZ3KcYIFSR3mmmGn8XKCD7bwm
	 oPoa/kLqcM5Ew+IwMMfXBBw9KnHdYnJ2rHw/VN6MNa7LWZ/AoFe3ZknN64QdRH7MCDEFX
	 xfLb0fLuZlxJmeNMMOZ/oTpV55ysk6/p/t6kXk8+BIlEUi8R2ZBy5HKnT1glZO+Mq060d
	 SL8ZQXyuIH+0AehAsFNcboYxEcqzSly6hNk/fvTiWday5gbRH6kHDX4wHhiikvimNMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793778410;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=U4fFdtJNvcZ6y6D1x1v24LO+4CMQIoUBaMtD1ZPuCLk=;
	b=y3s4vr6gkFHHLOPU70AAumx2j0ZQ0ZAWUA1qLwk8eMaMOG4Wtol3rcKFjRlIu8rqZd9b
	 0bR0wucasGtisyEMtAqg4ucDa6qm8BxJMOD3VdqxucffY1m27dkOWy7KPoscpgVpBWUaU
	 /vS3YxK0wCoyfDUAuTCBUKY+ceFSvAqidjHv8jVySM5JdFTreXlgGBDoAgRhSMuA1h23F
	 ezVGLD9TRwY2jhs4ANfOZ1FugLBpokw58N1LCYACJvFqVdAcMYdOyt44bsZJuS2N/avxn
	 A2JfxaJJ8zbg6BgDmFk4y1uKkDlEb63CeUi8Dk36LxYS/7p6Z9VfuKK9RXVMVX25sNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sV3ynZL2;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AAB7606A32E
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2026 07:46:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AAB7606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sV3ynZL2
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-36661f953e4so485883eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 23:46:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793778409; x=1794383209; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U4fFdtJNvcZ6y6D1x1v24LO+4CMQIoUBaMtD1ZPuCLk=;
        b=sV3ynZL2djp/uSfXZHC9ADdJ2Xf7y9fXRV3nczxd92MjSP4LgMOOaBP1T9LpwyvOfe
         Znql1e8wAVB0kHXK+wF94w0TqsBJFhULKM90WcGi1ELan/WbL1I8lKhy8sYBVJ+/7Tfi
         W5s7n/F0aBc1icuzGa8GlwKmTIHx8dLKxVmxUCK9eOpP+RFggQsiTgp3pl3z56AWI/6R
         JzpB541XSbN7HUQKzg/FJlevLki2JSj3BLb+sKG/cXdpN43Kxcp2W2EJAmG67WJKyq2G
         hjQPVIsExLqUJmZjlpbdp/nF4Vttuwc6RFL3s01X3cJ+IGFXTMrWZZGkYYrflGWLT0Vn
         y7tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793778409; x=1794383209;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U4fFdtJNvcZ6y6D1x1v24LO+4CMQIoUBaMtD1ZPuCLk=;
        b=QsLbRtkkqeFwUKbLphbGNRn+z6/sVzo3ohBKefDD5Fz07IoOhWBjlMRZUlHlhyx9ga
         er0seOfM21uLRCwQLmI/3Ic1mZNfgskMeEknsrEFPNsvTcEjnpcoP4sDpAC5JkfTrQks
         GhNXGhEYwM0hJ0dk+hoZCtSvSfYXlNMf9TCwe5eRYQdtJw+UwoBmxHcXkUd3bz6wiLBa
         7+hMPDmL/0PN6rAg9gO+cJlvsui9gzDsifdq3dctc0p8NBA6WqCWR+uDQ0uSkg5kAOBt
         ZsqyXu1729hlMPqM8lrQbKFwh1ODo3Db8hAgYeAfyTIRf1rcgQaI958mFqi/nDcXX0GY
         QXhg==
X-Gm-Message-State: APuU4Z8TRtXPcFg+MKyFe1y2rfDZwwSM9OaDS5CqhsqrwRWiNa54snOz
	jv1fgBiz+9sC1M83ggmJlOEMykneViVqVz51UvGJR5zqvELTQGald2EO
X-Gm-Gg: AYBFou38dZhHXLmMlRNgg+VQFBHlaKok7ulPp/UWFuDjS7RJk9rW98fDHhaI9NmUflW
	TTqxF7QXLc4mpIteKJXyg1UOWEp1ggwClbZGIMR9kUUo3pkZz+ci/VWAH6dmkisa2vstM225kF6
	6FYAqB282BZ0tTVyholtfD0+yp6elOuKWzoj4sErupBSvUF+QJP6ZqHhDmg7pzLlx5J0XnEErq1
	e1f6Xv5/jAh7QETh9IdHST5lpFpGIGr24REgl3rmDnB0gU8dhI5U9OZXumrV73vQr+fUfcP+qCU
	6lUubzGzvIopl+xAqxylzSGnLtS97zMrj9Jszztlz1uLXDJ1u0QZ1Kzxf7y6uwzgo4kmdzpzD+R
	BnTzGajAwlTD8FveL2VhVeYgpKARfz/5YAYp+8b+Dp20Q779mwcztdhtEvuIStpXNp+bpSv5850
	UJrJCbsHgMg/C2Hu6mZxyCbuY4Bdubce20iINDXAHEJnSRqGOSsm0bET4w55EPuf++/1JxBA1aC
	ERg5HkuHV/k72P6Tl1XH/jHgHhrwiRwm9CutW4i1g8+oSgv3qiRFA7ChZoW/6FphGqzdrZuhROJ
	nNTQXMG1Mt75SC8e/d+bWHJCKPN+mCfLZtS8KsfqUWo/KoQzGyjLv7VEF/A9W0FSa+Vo96fHBNe
	601KS5Q==
X-Received: by 2002:a05:693c:42d9:b0:369:f18f:3492 with SMTP id 5a478bee46e88-36a423fbc3amr23892888eec.35.1793778409284;
        Tue, 03 Nov 2026 23:46:49 -0800 (PST)
Received: from Sobhana.localdomain ([157.51.204.42])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38a67edsm4566016eec.8.2026.11.03.23.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 23:46:48 -0800 (PST)
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Wed, 04 Nov 2026 07:46:06 +0000
Subject: [PATCH v12 3/6] dt-bindings: firmware: qcom,scm: Document SM7250
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
Message-Id: <20261104-master-v12-3-57fbe9eef978@gmail.com>
References: <20261104-master-v12-0-57fbe9eef978@gmail.com>
In-Reply-To: <20261104-master-v12-0-57fbe9eef978@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, Robert Marko <robimarko@gmail.com>, 
 Guru Das Srinagesh <linux@gurudas.dev>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, 
 Thara Gopinath <thara.gopinath@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, Sreeshankar K <sreeshankar0910@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793778372; l=838;
 i=sreeshankar0910@gmail.com; s=20261029; h=from:subject:message-id;
 bh=n/5l0LzNHQkrbMmziTZYOIF2FEcc8PMKPnj4oscjta0=;
 b=He+lmNaewUvT9cE0bl4y22+ugSs3dJvjKw92KlKpQtRY9AvK5BMkrVzkdj8zXEZl8fG8GPtLL
 uKhSpXXDFh5DROYlAe28kXAKP55HN9uHwz3XLOcdD+pVNlTNmMJWUri
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

