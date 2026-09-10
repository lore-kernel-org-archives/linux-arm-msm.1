Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B753C48595D
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 12:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789043263; cv=none; b=jnHyWuZH7exBxr+1U2DpB+IkhRlQX2G2ZEWnYyBdcVIJqixQaQ/UcGhYTtIpskMRi/YU9Lm9kBVJKYOA2TVUCI2/t+PaqhFVfZY/BBPzdK9KIBWIR5O3Vfk1h8dZH7DMn2hrhVO0f3RN8xVwKoKFYoA4N1RldyYW+6Gv0QsdlHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789043263; c=relaxed/simple;
	bh=Lh+SwH21jhBJph617FXvRF5JB190/NoNd9H1iE00Q2k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BQAhhQmEwS4Hh3j2a0/N1ToGO21bKCyMIrp0aczI/1ZiTHngCSG27PihbUPoMyXOWp7pSJ4cOAOI8qRtzv77oV6OdaDmw61ULA1lzvcPzLAp3cfGCJr/lFC9CjKCTucoCfC6Mr9nZZo+pB1iFeRpxoFElUYsAXUgExMR5SyddBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TMxbFDFm; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TMxbFDFm"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6a63667b78aso11249953a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 05:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789043260; x=1789648060; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U2IuLo0IrIpLFjdkCWDq0IoYangZfYaae/T0dXFNw/g=;
        b=TMxbFDFmt3hxXLACKpMJJLpqffUk9hvoGdFYTa7ULXzo9tOMwkHqFeIkwQ2l6tfBhq
         LOQA6YGzvWI+GKv2ddjzG1+j1ejGIFOob1h7gxDn/jbotZzlhty+PRsRTNhfEp99y1X7
         RkIcpAKAM4+Cw0qbA+BRwHFyI66jInSRShrOqnrk7P22MQkKeoNG4yHrPnQGOlvq+Nr+
         Q3FCLfFe+g8NDqk25YrcAqSN1plG3Tmom0nw6P2MFwVZXavRUnm21cNCALY916ydyjU4
         Ns/J1ftRW/Xeyl67UYVheYg9Na8P+lCm5XWjtD0NCEBIcIHXABEGZOGz9rioVu+ABiEc
         b7jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789043260; x=1789648060;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U2IuLo0IrIpLFjdkCWDq0IoYangZfYaae/T0dXFNw/g=;
        b=g3uFSDkJSaHHAAQXqOKHLutCq4qBbkRxNB/2SX7HNlFWhrdkPaoQo6j+XWLeH+oTf0
         QjzBPxo82G10u3IcffKRcPbwIrf7bsT3tt8XSHHIX5s8SfD9krm7PiDWXiTR7rKya4B1
         /2AZwhAFxfyegdTroQjeuW9okiNtLtTfg/mla9TjTwrZe58IN14fekReSsqF7wFcVBvS
         l/Pum7MiX3kEKsAflf6Quap7JRdKd8wihQ4ptwP9FKK59k6IwydwTz4A/xBkhDyMBQof
         X7sT4GKVUHXD+MT0nFWscUkatYo5kl2oI6ZDg0QV2zNHJq6EUwEKbO5ukBo7cTHtUT6Y
         b3vA==
X-Gm-Message-State: AFuF++l+RiYjJjcOAqrYvp51MiWBVvFp+xb2u1P3QKyBgB3dM/OV5oSa
	EDyrpLxGYsugJIvDBO9ypiIpjgt46bCKxrz8us1M+kU/EKzsptZDnlst
X-Gm-Gg: AYBFou1SgC47ql8+mDyccsxweBG/v7NUcVDEjElK4p+JBcAQVzOFWv6skBgc4NDcK2j
	WfGOXSqF5C252TPsy82vrICrHXK9IkYDeV7yPVRBLBsYQhZDf28E8twU2KFN7Q2cSdrKgE9zMT+
	fjJU4gmTxuopZr1xV6pZtTC6nzV25/V+J75xhw3btB9d2WmBPvFrDDi3lMZcad2xX0PCbXE2hUm
	HiW5aX9GEgSR8K4l30iWVnaZ143BPNHSbWdqxoO6GOtxZ/q4g4YLghbpYet2kazYE+Aa46DrOB3
	wM3nIiW/61HA+/Stp1nNBBLVDTd2HBdu0HGAxGnMpaUbSl9GjBY7Pq0A6RCBHl7XuQwEeHzdUB8
	MhMc4WGAoC1RzaT9ctiXfiCjSKu32IQvxFoysDm11Gw+kqxi7ABXkVMEXNnV0BQA0+rkQgVvAAQ
	fhtpW6oNaKnzhRuxxeCLVn4mhyHrLvwx4vN3BJgA2SMJeUxBbmTnASmPpn6w==
X-Received: by 2002:a17:907:6092:b0:c25:64ea:4d70 with SMTP id a640c23a62f3a-c260c65c251mr1785575466b.1.1789043259949;
        Thu, 10 Sep 2026 05:27:39 -0700 (PDT)
Received: from [192.168.0.68] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2951217d12sm65136066b.44.2026.09.10.05.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 05:27:39 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Thu, 10 Sep 2026 15:27:22 +0300
Subject: [PATCH RESEND v3 2/3] firmware: qcom: tzmem: disable SHM bridge
 for SM7125 platform
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-sm7125-samsung-v3-2-c467bea0fb9c@gmail.com>
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

