Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2719A486BBC
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 12:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789044280; cv=none; b=ej6qUQjdgSkN3QP69m7VqGayoOESjt+tiQATQJFANfqEvFXgbApSk7SgG78IstVeqY66srhm9FMvhV4/XSpyv+fJkgSfxw84ZVIw2Sk0GS+zVsSl3aC85EcWCeFFbq7ObzbKzSaJt/GCEUMMfIWlqv8fRnglTL4wRXpvWHdZVfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789044280; c=relaxed/simple;
	bh=3rPs3zLWmwVwvVVM+gpBKczZPikUN8Un/vHgeN1cX9o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IsAJTFSF/RZb6jjpTT1+bgSdTLxFt066kutFPZqoLbdxFTjP7LujdQVmFOrEdASDKT0DX+J17fdyleu5H9V7rrmPp16xpQ0Ss3QnZZSa6YcMGN/7Pf+Ty0AuBQ/P6a7GZ+9FcGZYfF7GpgFPEBva5zSJc4rVqGoYXzHiX+OTcrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F1z8vucA; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F1z8vucA"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49d1fb0cf5eso10585575e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 05:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789044276; x=1789649076; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3rPs3zLWmwVwvVVM+gpBKczZPikUN8Un/vHgeN1cX9o=;
        b=F1z8vucAAaJS6wserE/YxUPorNq26A3L9sWyhoHpbv43UtLMoWrT1gpPSGj1ELGH1W
         eu4zdMG3s0hEUb30uy9JNUd1CrwLyNwQqq671IG38FSrKjl4K3SNjRascB565gb4RubT
         95Jj20n09J7wMdqx8Lzq6TVltlVx4X3TVQxFGzZ7wAoVa2G+AhHhEeYLtr6soK2a8+qa
         7h0SSn0gF5ZcRTQh/VqsAPSAwe/hb2ogtVGutQSuQ9ri7ItTbwuOQDY+F2/ufNKKEQLD
         Yp2oKYzV3iJ/g/9u2sDoCNq/w/z1p2dMl9hUHwPFR3K/+On4zXmtq18HME0EFu5iFqlj
         uLWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789044276; x=1789649076;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3rPs3zLWmwVwvVVM+gpBKczZPikUN8Un/vHgeN1cX9o=;
        b=A/UaazGavwxD/fjGClvX3zovPcJy7ADdrMoHR+ZiPrXrZDGM3En/nkkT/xZyXJ19E6
         iv59rV9FhsfoIXz5YL+kYWW5onQBCkm/6fiYntkUXUFxEyR4maQVssfJD6SKbUOaBrPA
         MK6psrmN8yctw+S2I+UHySKLaDo6mzopK9Un1UXJ+2wwnvvH5sMm4sfRZnVyP+WBJAIi
         E9g0eWuRLFuHjifZqMpx4MmPJcvoCRG0FcLlxK7MM/R+ANj3x+FwKpPOFlaLKk6/qvVD
         +q0W0KEhtIyA5w7UgECSWA6v1MQMgQx7lHviNCVP+SRn0d0f0CsHaQyE+27VYsDo4nT2
         p1uw==
X-Forwarded-Encrypted: i=1; AKwUvBy4eHCwsYeM3Y+StEWFPMSwKsODT/pnxsjUtLcYwff4LNBwzv5I70vIi0oVduMoGoUCBvlwdIwPPOVz9wy/@vger.kernel.org
X-Gm-Message-State: AFuF++kHU7XZvfcRA9NKsB4ozVSwH0BwxNGeK36zKd9t5zys23VuL4MK
	/CLOMqCaJOgoK0/OhFd7XM6kmdbNI71c04623MUpofyRgI0T5gxoxPWTvUwf7iVlvG1vig==
X-Gm-Gg: AYBFou0//45fTIN7ruiCwX5OAcS3Bq4rcqV6pwyBwnF3/a4JWKp9je9AtEbzo6wA+4/
	d1Q5OX17nI0/rqhV6D5seOwuhXel0A/+dWZ7KAJgqzlUTGtN5OfzIpmaGfL6wRG0hIS7sNvH4QS
	QMwKQWytQhXV0KUR3VcgKcaqwq/AlZPbo+uS7TbcX8q4lEd+4e+Kogzx2bkGtHiXqtH3aKelOLQ
	jNd9MqdVwwm0XScRU9Im2PAmAcWw6ltaf9tXj1Y0rdqh5H6VhU6hh1dJMbBKr3jwNaKl/v6esRG
	c6dVHbaj7AxGstC4P51tdLKxj/DzSMjmNyq9Lm6EzdUj/vxsyPQhM0AVnXQ+3NOK4hANfCrymzg
	C9omFYt2qG3U6CAFmCB+OtgNnx3wOZPTEGV/HwRVDDmh88gycIkpKE4KWbFw2ZkUqqmNv2nAGnL
	+JfCmq8FlTW3vMMmfds+LuDCST1RgTOzu6V16TlC2avJ78UwwBun9fCoDWJmQpUBlFK7nKoUueL
	kFEQpFN6Ux5PDUY8A8twN5hisrwJNDefrHlIm5iBU8L6Q==
X-Received: by 2002:a05:600c:45d5:b0:493:f140:c3fb with SMTP id 5b1f17b1804b1-49d258f1d5cmr135945565e9.7.1789044275597;
        Thu, 10 Sep 2026 05:44:35 -0700 (PDT)
Received: from localhost.localdomain (mob-109-113-160-48.net.vodafone.it. [109.113.160.48])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49d20db6e76sm144440305e9.3.2026.09.10.05.44.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 05:44:34 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: jishnu.prakash@oss.qualcomm.com
Cc: konrad.dybcio@oss.qualcomm.com,
	nihal.gupta@oss.qualcomm.com,
	kamal.wadhwa@oss.qualcomm.com,
	drajpura@qti.qualcomm.com,
	lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux@gurudas.dev,
	mfd@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] mfd: qcom-pm8008: support PMICs with no interrupt line
Date: Thu, 10 Sep 2026 14:44:23 +0200
Message-ID: <178904426368.12167.11218867694394370234@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <f7af73ad-f09b-433f-929b-cd6d22e2afd5@oss.qualcomm.com>
References: <f7af73ad-f09b-433f-929b-cd6d22e2afd5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Thu, 10 Sep 2026 14:40:35 +0530
Jishnu Prakash <jishnu.prakash@oss.qualcomm.com> wrote:

> Please note Mark has asked us to split the existing series, so we would
> be sending out separate patch series soon for CAMSS support and PM8010
> support.

Great, I'll test the PM8010 one as soon as it's out.

> Just asking, have you noticed any boards doing this currently ?

Only mine, and it's not upstream yet. Konrad's list is right - those are
all real PM8008s.

One correction to my earlier mail: the compatible does not change what
gets written to the rail. set_voltage_sel() writes millivolts, so 1.8 V
is 1800 in VSET either way. The wrong compatible only misdescribes the
LDO's range to the regulator core. Sorry for overstating it.

Thanks,
Oleg
