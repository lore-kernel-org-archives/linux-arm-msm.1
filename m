Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEBF64734CF
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Aug 2026 12:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786106059; cv=none; b=H9CYxahaG9mpY18Pi2XIIQ5JP+OLI1HOTJHZtyiNGdNXVKPnz0TytfVfXS3NnCDHR6QU0uoHE5z5+Cvj7sqbHYyXHaXNoaf2QRWU4lbV+XOjrv1O1FSDpBZZ4DsMWTgf9FvPQYW9s5nYqQJK7Cqs5Wk65fWhh4ihl1ByvfRQjY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786106059; c=relaxed/simple;
	bh=swvAJsMf+noAdjAOdgZgJcavQOiTqHlXuhgcaBqarWQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I+5ZSCEzvgkNdVOQ5jAPo5lDvmpyfRuD3rWGbKPS+2Nz3muG51Pc5tgOa3HSfky+1E6YXhcv0icZm90piwQr5Dv6zCxz+rhv2XAdc2mkRa44UNGjTVuYIR1Jd+zGikLfQgt0M4kgUumCLTEGtEcruFxkoCXagwgG9pV+7EFMwSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bfX2s1Rh; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bfX2s1Rh"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4954f5e8020so17513145e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Aug 2026 05:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786106044; x=1786710844; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jo5o5mj93URUeV+7YiIiV0G/8Hcjq6XVQrtqV+XyI6g=;
        b=bfX2s1RhqrVvdkhe1dxYDU6G7TaKw/m7GHvsffzYiUVhiN6OweBovMyUpLaNtKIHn3
         0NXQrMAnr5lzdomB/kY8AjqA9TZ5Iq4FeH81Y/nGpNVGFIEVcyRMRVn/p50MvVJhB7wd
         QGIAKczXzBy98jQNmRbwucCdmzkbDviBVQpOnMLMpOKJshI8/e0TR+2wrkuCieyBWa7g
         FK1JBpC6t/7CVvvtjq8Khqvlc9X/51b7tg9w8eXqDVdHcqZb5KIhrKBCC+TdfhgNnXYz
         //zZkoWuFvAthyRnSEkRVRKILMbIWxPm1obDLfI6lxQv1PzliGG1hKlb51lupa3lld+e
         hwxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786106044; x=1786710844;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jo5o5mj93URUeV+7YiIiV0G/8Hcjq6XVQrtqV+XyI6g=;
        b=DD3rGWmi7x/PtWTRe6sUi2NjEkAcXjQCfdFRg5FBq3C5gkpr6H4Q7Q9UKaCDnQvdRl
         ficGKhE2jx0XQgvcHWd1d8sI47fzAG7YSrnWkkHUtDkvUew5CoS2eXf1+uYEQ/iNdNQR
         USOdCFiIPYJlGdC10qxWu8xAG5OEhIfeOPVVvk2dcBNL7y+5Hv98MJ5AV/oiLcxhmvAU
         Za/PIjTQOFnlxAp8ROrbbSFgTJZX+TILyPe+ZaVW0HvrBf6LXYtVu3MoQxlylIgGxawk
         iq6/PEW7NcBqz669dZBrFgoRh+3mTQr6FiWKfEL/VPvCpM71fzjEbbzA03LaVa9yf5rj
         bVcw==
X-Gm-Message-State: AOJu0YzJ8RqnMnj6bbSVS0JveI0tFT3pwZ0m6M1u2Wdpyczlu6EL6XDY
	AUka7RuFFIkDv/uQnij/8yEv2K0tWxiut6hl9bTfbYpMqB+UIYwI/+pR
X-Gm-Gg: AR+sD10ZNGpYpCwfZvoqRjBaUP/ZAqIbC5tlW7HGnxE/pZCzekSQabC3kqcQL1UX2FB
	H1FRbQjzRJ+r9EQOVXgtTXkKFqDUe5jLWfNUOzoiuVuGF4EUhUCqZlw8FzxGEoy4nWxbBPqd11t
	HySoIbmqagZZYt/0Fr7nb6q4I424WWbOfTJDgflfPq6vsf3snKy5JFc0eVwV4/hjnYRRsUgkDuM
	Z+EL6xs9KKvDoMmU7w11cIeWk+4NOSGOLWgaRAthBretVkIg1vwvQ4qYfTaqosYfCFlyVFv87bb
	ch1FSzaSUxqyXz1D2Vgk7rLTzcQK8cxBL5Xpf2gaVNbma3cdaoWk7SIfjrNiZMv4wekENSkDOeg
	o8ozo4rUvJV+UUvw0RFKAk9P/m0sXDS3g0ClWuI8MYFKcZqNA4XZfhuQQBZ3j/QXMk5Sy7f2UaA
	I324T8pfWd29F4z5a0kIe88W2xor/qWk1JvqeAIgIMUyfAVvqwPharhNo8o8Ff9iiB
X-Received: by 2002:a05:600c:4fcb:b0:495:5890:8f6c with SMTP id 5b1f17b1804b1-4995e084875mr42434335e9.7.1786106043871;
        Fri, 07 Aug 2026 05:34:03 -0700 (PDT)
Received: from [192.168.8.167] ([2a00:f502:270:d465:a26c:adcb:8da8:6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995bdca3ddsm49530495e9.1.2026.08.07.05.33.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 05:34:02 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Fri, 07 Aug 2026 15:33:30 +0300
Subject: [PATCH v3 1/3] dt-bindings: arm: qcom: Document Samsung Galaxy
 A52/A72
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260807-sm7125-samsung-v3-1-ac0139e5c612@gmail.com>
References: <20260807-sm7125-samsung-v3-0-ac0139e5c612@gmail.com>
In-Reply-To: <20260807-sm7125-samsung-v3-0-ac0139e5c612@gmail.com>
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

