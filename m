Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9038D409288
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 15:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783526348; cv=none; b=O8JvGk22b5Ed02t5LJiDKMXrN1SY87FJZU0bgscaAiS09ltZMjyoS25i/W4XatMTN+9Pyvlo9N4JaAKwlX7Y1+rGQuVYB+vnqfWZHNRuKXhoAaT5JsmbijHeFYvL9BbaF6RpSgDRzGS8VNc98Sydm122vJRAN6Fg5ymQUzOypzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783526348; c=relaxed/simple;
	bh=SXgWjPnQbNhe/oT5XLXgOGEmdJRSN9DuUFvcWlNqUck=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=qYT9H43snBIM1ScNgzUii4MVWAARj+uYWKtrdgwjoLHsCawJs85eKbOYPymSc768pUszZf5G2rzusm4wPhGwhcen6gmLktsYdQ7Ev1aEFwNMVPRBzKqshP+alMSch2Q6RQPTpQcguE5DI3rM8KFq+QDSnnjJ76ulLYQs180Av2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=BzMDxSkk; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="BzMDxSkk"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c9e0b89e228so475768a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 08:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1783526346; x=1784131146; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lEEqNJ8f9RcAM/Vi7JnY+r94DK2m8feNcQJBBQl3fMg=;
        b=BzMDxSkkB3kZG7aAgpWLRCZFiYwEhgjDughl3oCZzBH48cSMy8cVFJtpEy5ugU3Nzr
         H6jPgF7+7+VqEbvWjsGljxmByVniU5xT/f8YElfKgNF+yW0N5PvMHzwPIF6YeUNHH32H
         NiDxPoABGjsB/3co/85jXPnXNiF7RNNU28tjrUY+GaITqbS68o4zjcZ7BEKv7D+RdH0i
         ZjAAmoHkpVgDLs0SobmUTknyxr3B8ZVNCtwgqPJq+HQhRkhMzgpSIJJthyGblgZotNwY
         E0EI18cR/QDOKYWUnOCFpcr/iw0TzU5qaRj1ewjRCHBvLq7aLyW/LOJYh1r64sedNWvk
         0TEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783526346; x=1784131146;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lEEqNJ8f9RcAM/Vi7JnY+r94DK2m8feNcQJBBQl3fMg=;
        b=gtV2m8KsMeSAnZ3WR0QF4jaaa9CCWopWyUUhxPDXRbvNa2xDBvZQwMOmDCz7R153/w
         M0tqK2Cwfng2N2CBCj+hwZU90tcRDCoPnf5N8pwu+02AzuJb/u+WWv2eJLZGZy2OdHiP
         sYHjn58NiR14MZI1s1sBVSGgg9wV8A+IlvXyufryUIv0/dOCpT0mEW5f5kHu01yyR1BC
         YjA0I9TNdWS1t81Z+5iUGD8NZl5UQkcYgcHnfaWBbHsIvhBw9WbxwKyHVjyfEHfRSBvw
         j69HQvdSr3Hccy1FWYSrYzQnon2KJLYrWJvHMjiukBqJ4yVDtOA9APl7MYtnh1XPQ0m8
         dbXw==
X-Gm-Message-State: AOJu0Yxd9bySLYC1nFCXJKn/CNDnIgayRqMSH+i6xAOi/kZjLA4wTP3U
	/wY4WUUiN5VrBOwVMNbI/fcL/MRLTEK1rhrMH7acQWEYkH5Tli+UoIQe8kgrm72jqeM96DQDtx+
	b4TL5
X-Gm-Gg: AfdE7cka1d85t36fCTWfxtKJ5p08DQkzIP7zAFumvGy0lb36WhemOEkpzuKpUWFYUxu
	7Vl0dmqqpETxNAk3DgSumVsq2ry1jzs3IJ/mNfRAq9/8t83i4k5KVuqfEymGpP5ar7BOhKEpXtr
	M0H9+BQpHFu4OXOiMbiOTxxeTYyG8XGpzgVuBwEprhnOhQ0tHM8C8mx4iGh10KdnlTUsAkBE14h
	IhCvju3hS6ykvO87WUs7rBM9DbGOMZsjxJGcTGUMVt1mR/EYllT+Z1RnJMUYLzcukoZehSj83i7
	diFCvucHjfQAQIIypQVGk6HoXufilPyvwiqBHwRHlDXW60VBKRYQ5saF9k1hQm1883MuPzAASMt
	8XRfQKR9hdyy3VdziYzaIj9aI+JmRW3072Z7rBpbX2cFxMUKQGvdJdD/ugPjeyiQhFmfGttK3UK
	B7cc5syw==
X-Received: by 2002:a05:6a21:6916:b0:3bf:6c07:b2f6 with SMTP id adf61e73a8af0-3c0bd223258mr3679433637.57.1783526345823;
        Wed, 08 Jul 2026 08:59:05 -0700 (PDT)
Received: from 963b246bc1b3 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659c8665sm21537487c88.10.2026.07.08.08.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 08:59:05 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] qcom/for-next: (build) expected expression in
 drivers/soc/qcom/ubwc_config.o (drivers/soc...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>
Reply-To: kernelci@lists.linux.dev
Date: Wed, 08 Jul 2026 15:59:05 -0000
Message-ID: <178352634469.7367.11709668239834441811@kernelci.org>

New build issue found on qcom/for-next:

---
 expected expression in drivers/soc/qcom/ubwc_config.o (drivers/soc/qcom/ubwc_config.c) [logspec:kbuild,kbuild.compiler.error]
---

Log excerpt:
=====================================================
/tmp/kci/linux/drivers/soc/qcom/ubwc_config.c:148:3: error: expected expression
  148 | +       { .compatible = "qcom,shikra", .data = &ubwc_0_0_hbb15, },
      |         ^
1 error generated.

=====================================================

When fixing this issue, please attribute this report according to the
patch submission rules:

Reported-by: kernelci.org bot <bot@kernelci.org>
Link: https://lore.kernel.org/all/178352634469.7367.11709668239834441811@kernelci.org/

For complete logs and details about the environment used, see the issue
on the KernelCI dashboard:

- dashboard: https://d.kernelci.org/i/maestro:5044d70f871907ea147e7ef9de524230a4f90ee3
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git
- commit HEAD:  3d7933b9ed00caea0291d528caafe1a4c87dc9b8

# Builds where the incident occurred:

## multi_v7_defconfig on (arm):
- compiler: clang-21
- config: None
- dashboard: https://d.kernelci.org/build/maestro:6a4e6d4d06fecb7f474e49d8

#regzbot introduced: f86573e68e56a7df7d54eb58101ac413ba731996..3d7933b9ed00caea0291d528caafe1a4c87dc9b8
#regzbot link: https://d.kernelci.org/i/maestro:5044d70f871907ea147e7ef9de524230a4f90ee3

#kernelci issue maestro:5044d70f871907ea147e7ef9de524230a4f90ee3

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
