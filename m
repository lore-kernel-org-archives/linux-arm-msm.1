Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794807308;
	b=AkorXhZD7ZJGEDxpGF8j/p+vg9eYsPsfAsCLfuNshGlYenf89UThs2eHPS5/QMl/eYYw
	 XwWAvRmhGvDdgLLGVh99p2g+4fkcw4oViM54gWOI8S+jRFoAv1biSa7JLQWdN2n9BbcZ2
	 R3htWz0A6viW2FwaM18NbQbVFgn2NREzVwonFIUNPkHptCqNb5NnSmzHnaAofRfp5YtUg
	 yjxRGPjuZgJwRZUexaIpgKHTha1oK3GmE5Ql8nCCJ6OCZnYM6u9B1pcdpRDAxCq2W6GON
	 +DS1n6wN4/QsLQI5flSyu//iPjz5Uzi1jyS76W2eC6e6I6x8DDBAkWuO0ybA8kxphcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794807308;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=S0rPbDJDlkerZ4MNM0EC/3GcwzUG+YsiEl+gjmvqeKs=;
	b=pi1berlflvvHbmVfMuLaM/oMhiXOK4JVzrBHrzFkbzO3bZ+lAvgL92L8XvDQYfgnKTq5
	 WLkogITNIQZ1x7Z8qCG9lwGIpKs61I10kLHNbY1dAYF+IYNzQTJJUYx4C0FhNoxcfTF0j
	 bm0FUpSapb3NlSii57TsHg+Y2QNbu9Z9S7NrPWzqO5EsL+7MdY3Il8+3KdqbW0TGEnyLB
	 q0nk6nxV7uf/3iGGnQhb6AAhtwDRtiBxKBxkhSeXUz7fRrOOwJ0GvPvlnItl9dO90ey0n
	 aNwFVZn6lfTWkUmtlYz1Y4GzktkHjKCAGTEnx3V+e1lGbSNsiBOTaduR5vrKU1bPPlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gtmcJfzq;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2B1A606A329
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 05:35:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2B1A606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gtmcJfzq
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-170135e43c7so4836066c88.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 21:35:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794807307; x=1795412107; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S0rPbDJDlkerZ4MNM0EC/3GcwzUG+YsiEl+gjmvqeKs=;
        b=gtmcJfzqFlYh9d0VyRYPkwL85gT8VgY6z67ijGu0jwBTfoh7XzAVMXNXtbceVD7vBK
         f/LFyzuhqMPw4pUswhDVWBTqw5YAktZY95axELCGP4ZJfLye3mbWg5PqX14PvIfPXvFD
         jifUYkREMx9ZUNpGakCHIaadFE3zXgmzrZ7cbIY8OJpF2ivHHcKk9xQ0YV24MUePsMW3
         T/PAG/AnY0bCp/qwlfZoGiCYv0exUXKlbnNLJpEhnGniPB+aIcHv9/sVgWo/4jL26N2Q
         sr4YXYbzvWguag/oMlcsj1W3t89G3muDcdGN9bywCRTIqdRkp7RJUsRbNEOtlHmxO7l2
         3mTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794807307; x=1795412107;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S0rPbDJDlkerZ4MNM0EC/3GcwzUG+YsiEl+gjmvqeKs=;
        b=P95SKOpXoGA1DWM/9/HVGVVzjXHJ6y17Qcr1Mpg63LFM7NBb3jYdsWHd5fBLfDxmP6
         NzpEjqmlvYJ5YXwScbINFj096/pb3kxHijk23zcS8OWPGdo2Obvid068GbQ8d8cxIafv
         ahck+A4PQoX5dxWzGqW0iPmlGzUsUFUHtFrBrJ0W8Nt5uhRbSuRfq70Khsd0J8EilDsz
         ihFnpJnpKsh8reR7qKGLLOAD4l3shFDQlAollV/b48fKe++RJMDG7FKvDr9mSNaWA6oa
         RGiVR7oggnBYzr/j1wVFOqMJWl8jdWYLoyLq3Dp9dvbHSOoRnYT18twsWMTH4IqU+1iF
         8dRg==
X-Gm-Message-State: APuU4Z+KljAu0W78ZItEcIOloPy4F6T1xjqdXHBTM7jUjIFr6TjGIonS
	BM+mI1xCOT8LigWDs+b6YhDp3CTLIBR1YhhkQ02vRrinGvS0Wq6WmG6s
X-Gm-Gg: AYBFou1k4UPf46ro6bNu6U4E2n6jlA9R+o1yCah9k77Ubv43F61AqTyL9hXhIYoeSU+
	SicuZf6KaQJMhgCsvBeXPJdw4fZ3lDa2cqHoe/Y4c/LaCOUUbtHOwKi1Pyxw+2QKCCJWTltggPP
	saQgmMjo6BXcn/qKrTQJunWfwEiQqy5E4UTn5b3r5Ff5u2KgMpR+Q/7RQE3VEaPff875y5Tw9tt
	pDs3rlfxRUoIav8yA7vdM9hUI7DjwlZMS5bTtuidJnUeA/Rt5ljegmF5ZLsIcAcmMgOfbB7IE4t
	uc3reK8cHDLpeDy0AVhlhqOzGbrAkevYXCt3IYGEJZE7np7ymJlBFKTOzOigYVgs2eqLwaWLJ8A
	UY5G+EwleP2l5JBsD9u0PyRPvY0vHRrW+WTtxa5GzSG8qDfyz1vJ3v/wU6raPqU8mIQ2b3w6zNn
	Rl0x+iN6WnmO/Wdt1ZT8aaSCoR3iJ+Ist+eVaINbOPs0cIBQaRSztAcodq0JhYXcjaE6P4pX7mW
	JTyMC4+uWsKDlW0HgmxDw8bOjjzDbmF11HSj+LvWEXuF45DFO3TeTfGhv9KWSPSQybtldfy09Pk
	UO0jayg7NnOMCMqBg9xSQLjqxByP0lWuuAjKA9LGiNfEe8Bjq8YtDVdKCE43a8c9S6i2EF7l8ti
	1VJ1f
X-Received: by 2002:a05:701a:cccc:20b0:1b5:32d7:7d73 with SMTP id a92af1059eb24-1b532d780bbmr1029121c88.30.1794807306985;
        Sun, 15 Nov 2026 21:35:06 -0800 (PST)
Received: from Sobhana.localdomain ([157.51.206.8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm33463380c88.5.2026.11.15.21.34.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 21:35:06 -0800 (PST)
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Mon, 16 Nov 2026 05:33:51 +0000
Subject: [PATCH v15 7/8] dt-bindings: cpufreq: qcom-hw: Document SM7250
 cpufreq hardware
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
Message-Id: <20261116-sm7250-v15-7-6acbb232fef8@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794807229; l=1157;
 i=sreeshankar0910@gmail.com; s=20261029; h=from:subject:message-id;
 bh=tYOW7ZwAVWXKL25nNQ4vkjon/atY4Dhfdawj8MhM0Nc=;
 b=hoggoWb5jYIyIe6oCAJ+uw0gr7l4FQRLq2gxxhWWrRSTin9c8YLMUPS0qAHLKvjnJhZnO3guj
 zwZPzqxzYjzAoNywaOEbGWxmFGqS3ST3v5/P7mGL67kEI0MsM+mhyK6
X-Developer-Key: i=sreeshankar0910@gmail.com; a=ed25519;
 pk=CGSHduvtn2hwLCNRXRc9s/fh6X8PH/zNdp08zC8hOuQ=

Document the cpufreq hardware on the SM7250 SoC.

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
index 98eb36bff..f8cdb652f 100644
--- a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
+++ b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
@@ -29,6 +29,7 @@ properties:
               - qcom,sdm845-cpufreq-hw
               - qcom,sm6115-cpufreq-hw
               - qcom,sm6350-cpufreq-hw
+              - qcom,sm7250-cpufreq-hw
               - qcom,sm8150-cpufreq-hw
           - const: qcom,cpufreq-hw
 
@@ -201,6 +202,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,sm7250-cpufreq-hw
               - qcom,sm8150-cpufreq-hw
     then:
       properties:

-- 
2.43.0

