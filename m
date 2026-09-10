Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FDAE483820
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 12:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789043261; cv=none; b=PlldcE6AsL+wujAwZDOdaF2Z6zet+VIiDeE5X7nh9SKPB5ChIFiCsETvifFZ1LSAVI7P1DA0DIZ4ED6EXpVysK5YBXMxCk6A0MqITxhPFEZgZT1kWgu77n0Rd4fazJrv6NtKkORIMcHOOIC3IZFcQIIDb2C+n5yzQFT7rq5giM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789043261; c=relaxed/simple;
	bh=swvAJsMf+noAdjAOdgZgJcavQOiTqHlXuhgcaBqarWQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aETZvWzAcWoAx8ZfGpq2g/dT6/YV4LzQpcMDwydpqpfJScIuL1xEn5OimiLdvtMEm0dQmzbRnAKTlwH0qsP/qFX1JZ06naw/TVkWOJB6MWKcPSIPZK4uLZACwp7MAg3I1rBFoW4/bAxCPhVbNYL1JY63gYqQqkbdyX7vFGz7wXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HxtQBUgK; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HxtQBUgK"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c250f28f1cdso1167866366b.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 05:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789043257; x=1789648057; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jo5o5mj93URUeV+7YiIiV0G/8Hcjq6XVQrtqV+XyI6g=;
        b=HxtQBUgKkbJ8PcWJFV2I5wU8yez7n8Rq4OzdoQZSZKcvunqp0U3VBjWVfXFsXDuFt1
         Kmqzs0NaTk9rOsNBlGDSh7ZK6Eew73g6htKRiRbElAHLuMAy1omHa3UmvTolIrwBWWk3
         l0rEyartKf8hJd8EKMa1b7bXsWGogesXBS6F2KoTxtXNLgS5iDEgscwYrBkn2NmGicwb
         e7iDWTscoyjx2EZjfx29l2GTqCMXFRdf72yigVe0H7rAkXCXPr5Jl8OKzX/B/539KnAW
         adIJpRo9/rlm/gfdki2foe7ZNwYofABkGqWmgH6VdR1uTv0kaSwhIgB+g+J5bH+o5C22
         YqNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789043257; x=1789648057;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jo5o5mj93URUeV+7YiIiV0G/8Hcjq6XVQrtqV+XyI6g=;
        b=G4tIEjAXXeo1/0pDYBb/N73CZwdvTDHES8JmNzcpZhh+XYyJrgrhJgH/JfSy4d9G44
         Lht8izj/7nJTRQCIdysjWPookqnlu2R6glDN2WttN+3b+1QVVt1w3LBJgdyK59b68dEY
         JkNH2jKoANP09NK61kTPgkfV/20d6WxMWfAcbq8s85gKPgo/XhhCYDQDR72jmR/kkR0v
         IDp3j+u/iRP655TpBlIdATFmNEtZO9HY6JPyHGpBjM1h+q9Iu0aaaPl5jCzYvPJVkJxp
         p/0qA3mh9yF7J3sXYQLkzUC1R/sBAiD/cSTDHG94KC7Y9KmAxbiKtfxP6yZyRqTLfkQ6
         zdiQ==
X-Gm-Message-State: AFuF++npuTSQ1ZN2JFz1nL2mwrxeayQFCDiInxwcqsiRpqiTsOkxw4jU
	fpQUsM/KjnazVNoS2Pn7IiY4Nc5fIulweY61CWQ12REDlUw7ZJPkSaG8
X-Gm-Gg: AYBFou1rVucpde6ZzNm2EWEbahd+wUcbBEmgZQCiwvfL1apuKL0pe1z4EOI/o06frMY
	gFuD+rvq4cj6mOXz6+JAs0PI4lJMbTekq6NHoH0EbPpKmQU21C8N0QdJRZV9AMTWpQWoSyppnx3
	wi/U1tcWF5Ph3naYScQUww74yr9Dk6ZVCAVAWJB9QpnZH50TFqCZYzxuUOptLm280vvAAcQ1O1T
	41HbiKt51hRWyYXaNx1DRjX6FWnjgKyDwQvgKQiVQAo912Iv91rGMilWOEyq6Xjywgx8DGtglxv
	uNosstkTl+ecdM1Pyk4/6DWvGPHIXgstCocv4UZN5e2E+gxi7C6atvyatKqMY+E5jeskagjpcL+
	Ac1nOq0qxNMm40hsBZ1+KA684ulZCZEQDNdDc+asH4o63uvflVIguyDRCSYpK19hUaYD6ihVkSI
	QxxLjcCZpxl57u/KnZ9OKRFUxGhjg9pseOoXhRK2w22RtqHYlyeDXvk1sMkMz+PyYssm6fD4YQj
	egZXB/n1Os=
X-Received: by 2002:a17:907:3f89:b0:c29:386c:58f2 with SMTP id a640c23a62f3a-c29386c60d2mr385878066b.38.1789043257404;
        Thu, 10 Sep 2026 05:27:37 -0700 (PDT)
Received: from [192.168.0.68] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2951217d12sm65136066b.44.2026.09.10.05.27.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 05:27:37 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Thu, 10 Sep 2026 15:27:21 +0300
Subject: [PATCH RESEND v3 1/3] dt-bindings: arm: qcom: Document Samsung
 Galaxy A52/A72
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-sm7125-samsung-v3-1-c467bea0fb9c@gmail.com>
References: <20260910-sm7125-samsung-v3-0-c467bea0fb9c@gmail.com>
In-Reply-To: <20260910-sm7125-samsung-v3-0-c467bea0fb9c@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Stefan Hansson <newbyte@postmarketos.org>, 
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>, Erikas Bitovtas <xerikasxx@gmail.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2

Add compatibles for Samsung Galaxy A52 and A72.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index ff8a35df7862..d3746bf6a106 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1068,6 +1068,8 @@ properties:
 
       - items:
           - enum:
+              - samsung,a52q
+              - samsung,a72q
               - xiaomi,curtana
               - xiaomi,joyeuse
           - const: qcom,sm7125

-- 
2.55.0

