Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792810630;
	b=z1u4piCbZcZJIHOgVaupS5VbFy9TvITbIEEKQz8Mb0QhFmY2/TD/YmsFAg+9tS4ZYtgP
	 FluA0UTJXPBhvaMkff4xAy2lv/yKHLFo11vQFMhG1to1zd9Dq51KQKC8T51EkanG2MBfw
	 JztG9ZBMkzKEzu6ZOVt1tcg2FxAfAwp1j3yq498kYrQTbmUL+oDTmvDiIxzPrLh48KODy
	 CV2OxY+fbIGlpKs291SbvDRtZcRVwI5iRwyh98oyziMs3VXzTogjy7GLhYI6HdYMHC5/Y
	 9tdyQohP7QT/PH9xoZ6uh0MAh2MP+APx9dKTHLBMjCcKsF/q0vKv2xP/6t3Fd3kPHJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792810630;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=I8fxW7vrt77kAEgSKRbYezNY7nlUDAstQ7iXToVpRQs=;
	b=idLfmb8qwLsDjTBEzEM9v38unJ6wJxPZyovwDjzMIs6A2JDMgw6Le9q0P5uhP/pA9OdA
	 D1A9QNkXqalkeiU6oVvryJj19NqDkTVdpJXCsc1IjShQYlNyWGoESXSr81xx5lY0zg9uO
	 Z0VdtcZxxXsvwMigZvILCniLlWKbUKcTv5HJrrFqcJ4ABVxrov+HxXaIZHRZp4UhLJkXc
	 F9zKTwxwlclsbsms+xelB+GfFoZ7a4v/rG+L9YLBCJ+C/BzBZdmrgNCoSmvlZCSiQoJf8
	 Mfr5vC+jdG07YZ2aBUAl4nq7rucG+gZslpkAp5CgJ3VFMNIve/OHqt7qGPNs/H2j/oQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BPKmkzCh;
	arc=none smtp.remote-ip=209.85.210.47
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BFA8606A31B
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 02:57:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0BFA8606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BPKmkzCh
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7fccba9c675so2917559a34.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 19:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792810629; x=1793415429; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I8fxW7vrt77kAEgSKRbYezNY7nlUDAstQ7iXToVpRQs=;
        b=BPKmkzChoKihc6iAdO5T/4xW8IiSD0BpwDr7WBsQBZL4PXTDwRMCy+lzq+uPmGvqIr
         AUnED5rV31sYOrzGpYJ074dWRG4GcWokzHAg1E+dNLtMDaqZV/suF6LoSMmEmbzSjhsN
         RWWVeWeP7IKiYJvmz8nB/gsaRpSFOHvr0+dUo7V406exuh4ZPqU9HO/qgRMRXVt4Pnog
         BRYfkbjuM6NbS4+3wY2UT3BZd8iiNENu5X7XnCEnTUH5Q68bsKy2c1c6NQaEQZgRqE0N
         N0davRMG3jx6ku739UiCyitbJRDNxddwR+iBXcBeVIw/LRy5ASqUZCtAlwDX0ZH3A/ss
         +Vpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792810629; x=1793415429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I8fxW7vrt77kAEgSKRbYezNY7nlUDAstQ7iXToVpRQs=;
        b=VJEdayaqylL0fFAigI4+4EXF7V4qz1K05NNcmRkHnqoOJwvsiGAA4IzDDlbSWHsijy
         C3HNnVX0ZL9nH33yrlJifRu9AWXvzo2AXMMRL5d1C9nJkAOIxNH+IW9tEWBmOy77I2Jr
         HER+RWlVBRs1BInwU/3TU1wJSTkcBvHEVOPV9lRmYhx/9pJX+7iAYslcc7hlr6tiaV2W
         2s0A+Xr7k1+PcJ0pjwB7atOhdcS+9gWd2QxS9GJ4r0JUCVsTsZGGIfRRtkLPpEvuE2T8
         Aa8W9qv5iUBeSm8JR2vAFxTsLkK9kXTXWdNLGsVCbqjAH2iB6tL7e8TAsVPAIMKTc1Ti
         bIVg==
X-Forwarded-Encrypted: i=1; AKwUvBzG8A8DurBf5sjXV/vqgwUpjKLj7moJT3P4nwe3g4LidRbVIauz1cCmqXaHEiMukr6PgX3N3DDtU47iphvJ@vger.kernel.org
X-Gm-Message-State: AFq9FYLK+M4Z76/Lw7q5VaS82ATEs2UvjtqpTQ+BcTOZau510hLG4SiW
	N8IYzb0hyjMtXvmKzALvRrusESqxiceHSOxzUrkwVDWMQhkccB/bAdXc
X-Gm-Gg: AYBFou20CKX7yZrNIgH8Jc458IWCVKQI6TzZDrSY6XQ64b/fqBy9Dve4O40caKRWTDy
	ROnnnPMz7pQuGBz4yc138MsHhYMGfNhfBKFh/8dRMO9YJk85MYLvMYUkwGGIR93IxJitP1IyM9x
	cOK/5iDrPEfS873M1P1VC4yzVx1/E6iSW/FZ3iPEK5VdwvUMD1c3brosdQ3s1SEZJ2jZZ3uMvbV
	1rORONcN8i4pDe9Yj7x3H+rzzZ315V101ZtH9u4BCSoeqr110UHWf/fvADNOMOA7JJx596yvAfr
	4rdXHFq+qWF0FAco4ptg90qVNCSufd9IWceGFTPlHcuOiUYk6ffyRkeYfZJOCFy97wqJZPoyg7+
	KXTdIS9EVjUfeDcpquqZGoKX1lKB959PA7+ACbKm9bdLxRcgc6Qu/GXb849D+qQSzhyK2Q0zPdm
	86dOB+UEPKd8SzHL6VKyCnpiEri2/McQ+6odwUS8gajXoqi+WxHqnecInpEm7tSJglQLxlDIxHW
	Nx3dTL+vcsfIXJh9+7Ce6SrDrvlqa6HKxdOsmWH0IbZQBX5Qmp4sEtpIgj4qrhm7tCxBGMPZYCL
	xJ2R
X-Received: by 2002:a05:6820:f008:b0:6d3:abd1:9b90 with SMTP id 006d021491bc7-70ba0fcde9cmr288037eaf.54.1792810629029;
        Fri, 23 Oct 2026 19:57:09 -0700 (PDT)
Received: from jeffmr (63-152-17-145.cdrr.qwest.net. [63.152.17.145])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-70b9e04aa58sm1060327eaf.7.2026.10.23.19.57.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 19:57:08 -0700 (PDT)
From: Jeff Roach <jeff.roach0@gmail.com>
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
	Imran Shaik <imran.shaik@oss.qualcomm.com>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gcc-glymur: Use PWRSTS_RET_ON flag for USB GDSCs
Date: Fri, 23 Oct 2026 21:53:47 -0500
Message-ID: <20261024025526.13339-1-jeff.roach0@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261016-glymur-usb-ret-on-v1-1-1790a523fd9c@oss.qualcomm.com>
References: <20261016-glymur-usb-ret-on-v1-1-1790a523fd9c@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 16 Oct 2026 11:58:44 +0530, Jagadeesh Kona wrote:
> The USB GDSCs on Glymur are currently configured with PWRSTS_OFF_ON,
> which allows the GDSC framework to fully collapse these power domains
> during gdsc_disable(). When these GDSCs collapse, the corresponding USB
> configurations are not retained in USB host mode use-cases and this breaks
> the resume of USB controller from suspend.
> [...]

This fixes the usb_hs controller (webcam) dying with an SMMU context fault
after s2idle resume on the HP OmniBook X 16 (X2 Elite, Mahua).

Tested-by: Jeff Roach <jeff.roach0@gmail.com> # HP OmniBook X 16 (Mahua)
