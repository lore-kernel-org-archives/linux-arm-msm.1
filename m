Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 492EC3F12EC
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 09:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785404112; cv=none; b=c+mkad/z6NsyXPn5U7pBJkcLd79Gxm3TMUVb+0QOCr4KLDpL9Ppce0j+4Ro5HVJTVbLT8gnZfCvWexIHyQrN75PXzm0B1TZCoBgrJyiPjExp9z/6qzI/Luw37lQzKmRH3hZI2hBi1JVPZbZEDQMwl26DQygQpvFjykCitYsq3VA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785404112; c=relaxed/simple;
	bh=3ReRcSOymyULMja+V0YmUrgeSZE4hXMAgCGFeJtA1uc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T8U+MuOHYgUx+k45EytzXPmrzeeO5aFlSIGbnd/VZe3JZmSWORMNYF6CD9ZkJD5CwppGREYJHm2QIFJtQJF6+lRaFerkWMYJLS0SCaV8CzlWt3hdlhnJ4oesckzcuDrf9uUnNdPePg5jybZnrlN5XnuAdmkpqI+fs4z3sE7gfwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YQkBZbmc; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YQkBZbmc"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c15d111ca99so218117666b.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 02:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785404108; x=1786008908; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wkDRMO/NHA8kCIXBimZ+z8/mCEPuG9r8mSJg/GLK9jA=;
        b=YQkBZbmcRi74GAKtgFKH4HVKrzOiT9W8a3T/5HryZI09u8jbQ4nQhmflf7hsmL1PkY
         2hIs+IV53gFhzcrTZtXU7RLIRsuc9GmPXjvbJI3tFpauw7b+RobAtDDHYNOr2eMoF0be
         DlSaM1/iw6ZeMy2aNV8TLNJvUTJni50Nim/uR/qYLTUOsiNwxDMml1/8RcWommBVN4n5
         Benp2ofuiXoqIs1wHzDdzroleDVAEd83PnSHDxmrU57GMB4DgjlOK4K7NCCfEat7GYBU
         JLfItZFmjoSBx+skQ1ZUhCvWEWorIYbi06Oltyv3J8I0Bs80nRmlw2IJsLxfhMP0n/WQ
         YrYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785404108; x=1786008908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wkDRMO/NHA8kCIXBimZ+z8/mCEPuG9r8mSJg/GLK9jA=;
        b=DJroMeKSPg1ghvFTsthVj+u+0alRdlumSILy8BKFCvEKjGQuSt01+OpBaQs9p0Ddxl
         YLRzKbh+kaN9kI6KJlUo8TkXp1uTuhcKQK7dLRlJkbfQcy6bQMUY7cuy7SaqJRwhk66v
         wznSY8dRv1fGAqDUYgRW77C4zx90pMyhSKyro8zbp9OyliillgmTkVaoTSb//tnuLmLN
         0E+fJCjQB08KOlaqLdq1Vw9znxOuG607MtDCFbw6H0rIRJZvEmzdLinzNy+ey7ajpkx6
         wlVVLHXCsueeivEExU79aSMv3sCoMd88akfyrQWWityJdlJyzqniEy8GWJ1bssUTAMkQ
         RgNg==
X-Gm-Message-State: AOJu0YzqlOVP1s4v8kRLd3q78D7Q1wA8AiPutdCu2cpbL9D2CW3Zm3ve
	e5WDjbRiu8H+ritJu36CtkMgzZsSmDnOgfBuN06BjGQxDb3McMXkOwpj
X-Gm-Gg: AR+sD13pdUOpH1XHvqvahFWw9qPPATCx0JCq298XTwX1auSiK0jH5oFiU/Yfs3E7xJ1
	EgqdiIXGdfoeYcOWq4tewXcuBaPuOJCBZnZGon1Ytv0omO+haPJ2W/kWgtxsPs8pO3VDRWqq9qM
	w+S6iYeFB1E/1hIN+7E4i0stgjaKS24DB6eycotHUi+40DTjb+uUjHleM4DQuBgi8Nnh/+pYAnu
	NAEYY/h9l9dA8Eum4eJ+YALCZoky6wM7RC5ZbZc3NRDEa1mfrf8IwSA4CnAOMAGgB8h9s3gVmhz
	+ypf9KH35M0KC7kjc0RQDBIEUuINd+V01nEHXc5hVAUz5z9ZIjxb/RrswVAMpBa5VWhNJWFypgq
	JbR5PW0TQpUhdfqXwJVmFy2r65PX32XRl2J8KCrfAjhxMpLu5LtXyrivq42I0kfBSXDiC2+8AZn
	O4KSYSqv7T6QDQbk49s4iOK8KpzdT4G+xCwN1BBWgWmuf6zzNc4s8o49di+xsGYwT0VZShbmBPN
	Lb07bF40pQPni8citgN6Q==
X-Received: by 2002:a17:906:99cd:b0:c12:979c:5a5e with SMTP id a640c23a62f3a-c1fa50fa7b6mr110666266b.0.1785404108221;
        Thu, 30 Jul 2026 02:35:08 -0700 (PDT)
Received: from workstation (161-53-210-87.ftth.glasoperator.nl. [87.210.53.161])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fa8577e78sm46733066b.20.2026.07.30.02.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 02:35:07 -0700 (PDT)
From: Stanislav Zaikin <zstaseg@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sebastian Reichel <sre@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Stanislav Zaikin <zstaseg@gmail.com>
Subject: [RFC PATCH 3/3] arm64: dts: qcom: sm7325-xiaomi-taoyao: switch to device-specific pmic-glink compatible
Date: Thu, 30 Jul 2026 11:35:02 +0200
Message-ID: <20260730093502.689505-4-zstaseg@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260730093502.689505-1-zstaseg@gmail.com>
References: <20260730093502.689505-1-zstaseg@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Switch taoyao to its own compatible so qcom_battmgr can select the
taoyao-specific property mapping added in the previous patch.

Signed-off-by: Stanislav Zaikin <zstaseg@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts b/arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts
index 6f8bc65bb99b..bc4dfa49ef38 100644
--- a/arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts
+++ b/arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts
@@ -72,7 +72,7 @@ key-volume-up {
 	};
 
 	pmic-glink {
-		compatible = "qcom,sm7325-pmic-glink",
+		compatible = "xiaomi,taoyao-pmic-glink",
 			     "qcom,qcm6490-pmic-glink",
 			     "qcom,pmic-glink";
 
-- 
2.53.0

