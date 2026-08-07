Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E001A3DDAFA
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Aug 2026 12:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786106077; cv=none; b=UkcOYDyoqwjxAnmNAZCbIaOxWy5nPI9kOhBl7h2b6ek5G8S2AC/uaUHO4remPLTYASgfL64sbO83Smx4S/DMCpLxQmMAn3eJ68lhZPCKjdf74jE9w9/Zh7OSolDlRhrO3j3e0vY0Xh4xzaQCF7GiUj/x7GunQVbCgwRzxMEfFlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786106077; c=relaxed/simple;
	bh=Lh+SwH21jhBJph617FXvRF5JB190/NoNd9H1iE00Q2k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=powXsEvVdn49DpWKIHXRHwoElrFJxnSDSUbelyWNFIt0ZK+YKwt8K6XiO2jV53JadARoTG50DJSibrDOu6Yo8+mcSrdXjyiPwOgld+JQkjXdgpQEPPsanzFZRKqpUxhfzF7MTVlF3+LiRRNr7VS8SyYhxWatsyl1+Mzis7jyvl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qZM/YNzf; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qZM/YNzf"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4954aff6088so33321055e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Aug 2026 05:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786106055; x=1786710855; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U2IuLo0IrIpLFjdkCWDq0IoYangZfYaae/T0dXFNw/g=;
        b=qZM/YNzfgfmh3p91ZjDtiTJpzt+BOHuUQP17HLTCmBZ7OCHfY0lMSTbhhZ4AE2aHoa
         X8I3AOeR23SbSldLZHpMNHaR3zWFZnwA+GA+GWH7jAw0JM6ZPJZxkxF6htFvdiNIquR2
         mkRH/FqwM9i1Va3SswDoqwrNe9G98nz+mQctYgCEOnWt62bEzTO4Z+yCEL89d3TkhqHO
         DpQdKeVWgcgjPYKJ4qeWTgWzCOBZQIteE5/ZHhLQ2T/nN7244en5YZwhPHvJ2uW3xNo/
         2kTbNbiBfg6fyk/fJ3l5qds3vfW6VwE4/+mMPQywZ/m0bO+wUq64+VWtoub2bjgaeIQ2
         229A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786106055; x=1786710855;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U2IuLo0IrIpLFjdkCWDq0IoYangZfYaae/T0dXFNw/g=;
        b=pdS9RnqmO91vUCiJjO8sUIZnYE5CoKwiIC37Gbvc2q0VJ2MuYoFwT/z35BGPGhjtH6
         myve02c2aBp+a7XkYhL18zaX6aYsVCfj8yIg84LwgmNheNl/y74y3b7QCUvXBjELPl22
         Q2ObrGMNcC4yz+otjG5sqOPuO7zCCYeg0775fS3KFd+tBYEZ7MA6mszj0zsrnLC6pjv2
         EBJnKkgdDNzA4rFmqV64dft6G6Su3oFxlXKZ7KM1WkN2TVqwBOh79JTIyo8A3MbSofsR
         3u89ULWiRi/LkknS5AzZN7l2iyPW8+euSBllAiyn5m9XKmyP520JMbtZbXg0Ue7iP4or
         yj2w==
X-Gm-Message-State: AOJu0YxNR1UAPgXR1d3RyUKcFI/HsIEyZp6IMR+ruW6KlM39T699trwo
	na9vLpqxafEYaHT7sfbnx+GMv5orzq4fLoG7tkM1yLthVhj6LmFfPgPW
X-Gm-Gg: AR+sD11VNjg2rLM7WTrKhHp1aIQqaGGpIiLtRSCpf098EmLKu7m0BD6evS5pdav9p/9
	tX5OK3c6bhuujuuEUUjsqKv2Di7UfiO8kbIe6CRcXr2MJj42cOgGThiS/we2ywcH0zs/6RM5jUG
	We1B/QQF7x51eNY5UXEEd/lEhGjxTc8KUdlG+CPaP47v/gayp0ffZseVT88Wl4BiXWK0FkcdIpg
	WKtaQL9WdavtiuZX8sQoH1VtoWCaLtSEd37n8T/aGZ9WD2jMR+Rlsu8IGrGNCSpG88yFl3yPedO
	elb5+CYo1r2RuJBFLPZwbQ6i0WYpXl/PTn3UTZ+Jqx5hLB8hkIDGTg5AEvDWOytmtcqMr9TWnRE
	XZmdIiQwIcN3rYOTm9Xd1Sj3eD1M5AlC17n/WGujMb6EHuCpavYDXBkjO2vVPg3Al0rNT2v/JKd
	3WV074ALtaWxL5Kd0RxsLZIgJG9EnmlmuRo1XmJtbHIS39Td5WZOy69di6glkkodaXIKXCnWcfr
	+8=
X-Received: by 2002:a05:600c:4e87:b0:493:e365:ace9 with SMTP id 5b1f17b1804b1-4994e7c0356mr299435775e9.11.1786106054801;
        Fri, 07 Aug 2026 05:34:14 -0700 (PDT)
Received: from [192.168.8.167] ([2a00:f502:270:d465:a26c:adcb:8da8:6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995bdca3ddsm49530495e9.1.2026.08.07.05.34.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 05:34:14 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Fri, 07 Aug 2026 15:33:31 +0300
Subject: [PATCH v3 2/3] firmware: qcom: tzmem: disable SHM bridge for
 SM7125 platform
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260807-sm7125-samsung-v3-2-ac0139e5c612@gmail.com>
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
 Vitalii Skorkin <nikroksm@mail.ru>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15.2

From: Vitalii Skorkin <nikroksm@mail.ru>

Currently SHM bridge causes RCU stalls when booting. Disable it for
SM7125 until a fix is available.

Signed-off-by: Vitalii Skorkin <nikroksm@mail.ru>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/firmware/qcom/qcom_tzmem.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_tzmem.c b/drivers/firmware/qcom/qcom_tzmem.c
index 0fd9581275f1..91d59e3e5988 100644
--- a/drivers/firmware/qcom/qcom_tzmem.c
+++ b/drivers/firmware/qcom/qcom_tzmem.c
@@ -82,6 +82,7 @@ static const char *const qcom_tzmem_blacklist[] = {
 	"qcom,sc8180x",
 	"qcom,sdm670", /* failure in GPU firmware loading */
 	"qcom,sdm845", /* reset in rmtfs memory assignment */
+	"qcom,sm7125", /* hang in rmtfs memory assignment */
 	"qcom,sm7150", /* reset in rmtfs memory assignment */
 	"qcom,sm8150", /* reset in rmtfs memory assignment */
 	NULL

-- 
2.55.0

