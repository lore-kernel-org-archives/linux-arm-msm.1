Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E179F279DB6
	for <linux-arm-msm@vger.kernel.org>; Sun,  5 Jul 2026 17:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783273665; cv=none; b=uFs+8HajT50hKrbGeVsHNJNoFsfem99jPOp5de7HZG4w6lxY7iqlZPTdAG7B4JWITkAz2ou9gZzcbD/8rCWAOGMEVGm0DuYNVzQyh+xxJX0Ue5TWZDUrbbEftIEfI8a3rkNq4JYeIZiaKvziehP3qGtk4hfmJKov0ULbG/ZQ9vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783273665; c=relaxed/simple;
	bh=+DWCiJuHtexmYzOgAlNi4lBL2tdyHsr209Svskkd2Rs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=CL3TiYbHAJYuXLnp/F41LdqzuiWbiY2HDl56Mf3qcc6M2Rc7tPfT+168qCe/VsipGh6YLkeqUVER2dBZuVnfe98XGZLHoxhiuYHz/xM/Rs083/nBiqY7ZTsoaUk+yoKvhlYoBiuFTlpPcDpJIZR4COesRG2qk5pAdxhPrj5iaPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RR9EVRVs; arc=none smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RR9EVRVs"
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-6a15ca0d761so1513707eaf.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jul 2026 10:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783273662; x=1783878462; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=75FEqaRZi7gyVEUOxCRUP71SjurGrXH97prx6jJpO3Y=;
        b=RR9EVRVsmCAw+wcrAKa4ntkKxPOIH9RrIpAy1ENR/V+W4NGiDXFGjZO52kbHPTlV/5
         lXnuIBS+6aYZiccU/hhfLr5wh571ToWp0Vfgpy0XY2bp6nK1j6fHro6pdciCpoCr56sh
         zdzQpGurW1AuVtlQ56rt11qsotsNcVxBRXSAHsDbwPBK/K0bhvLmeC+FtxNYqz1AoS3Z
         vyWEK9HiFkuemMIXcEd3GjymH0ZCe4z4DTp6ba9VNpn8egmWadrPOGb+nGPN4LpYGD2S
         MFq+7VUj/T54+Rnqwc+OzfJ4YU3dR3xTs5e/D8u+3K64Xapud3rE2veJ3V71Xzmk0+vC
         Ub2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783273662; x=1783878462;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=75FEqaRZi7gyVEUOxCRUP71SjurGrXH97prx6jJpO3Y=;
        b=NNPT1rERVe5MyhIfS/t2cDd+p574cXa1sgEVNWVPX+kM496XhJNsp/Qvn2UXFprmnG
         EomW//lWST1CQ5NqkAFmGtXN62btX79/Cinm9lRB67aKIkQRA5nU/+BmpRMqvWld1AXQ
         U9y/t7oowcugz3r3Iom+FQnygWPxaITD6OeJtEr0ZxeW5DPsMIh/rRYMEXW/Y2vCVb0l
         o50pZHGG6wehP0DjDffq3tuQClcaY/aHY3O+VWXuIoueFhzs5+jaauhorQFwiWUxTND3
         mWaoEJi4E0GUs5DDpIjVh8/h7xJWSNXQ8gzf4wbJViobL2p2RKFZC3p1xNgnb8cjtYRE
         jptw==
X-Gm-Message-State: AOJu0YxmrfPCVnmQ/rPZK0qF5znw1VduvVIDQJWIaCTJLkNlVi05XrEM
	GzeisVM4T96HCksB5Ov9HXWRTMM2on3uoQValH9BxA4xcIF2ilTAdXdi
X-Gm-Gg: AfdE7cmi2Dp3cFxgqyNTBlQIX6+xX1PkCzeds9BTQkDOxhkpxL5Fx3DpjV04U8cvaoN
	cI8WvSXbcWvSOoON1qmAWXDieGfnvT7evTO1Dx97WBDEh/DaUpt3Rh1WIiPki1NcNaOmFDj1f/l
	kkMtl4FfKoV3H8fmdZxLyY7O4qPIz4WSKZWX0TfumXlguj/5wjFAjdkaOZHWtDHAWbMlm8tat+l
	nzQK0ZdcAMMIxMcB/s4acLFwHCJPcvMD+cm3v1lffNR0zNBUpbsNqnDaLPmvWiq70VeiHZjBGe/
	OljnIH5d+019TidR4SKp1XW8Nqafm6R2aQTll4f+E7Kze/p4XYktaZdgLMGb7S1Av28GWzITh8y
	1n+glyHiR/PtE43f/XI3rpkuM/Gz56i2Pfqq9GtCdLOYdfArKh3tF0nGhO7Agq/4WGq/MIDZqLV
	9lExNweAiv5ZErJol6ETPXYfJZ75n6pjtAUTMzG/j3l/nrrl0JHg==
X-Received: by 2002:a05:6820:3095:b0:6a1:8192:4d75 with SMTP id 006d021491bc7-6a32f5d6b94mr4075618eaf.64.1783273661937;
        Sun, 05 Jul 2026 10:47:41 -0700 (PDT)
Received: from localhost (23-88-128-2.fttp.usinternet.com. [23.88.128.2])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-44cfb559559sm8482157fac.9.2026.07.05.10.47.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jul 2026 10:47:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 05 Jul 2026 12:47:39 -0500
Message-Id: <DJQTR5SRX5DL.20UJ66ES758CN@gmail.com>
Subject: Re: [PATCH v3 2/3] iio: adc: qcom-spmi-adc5-gen3: Remove an
 unnecessary print
From: "Maxwell Doose" <m32285159@gmail.com>
To: "Jishnu Prakash" <jishnu.prakash@oss.qualcomm.com>, "Jonathan Cameron"
 <jic23@kernel.org>, "David Lechner" <dlechner@baylibre.com>,
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, "Andy Shevchenko"
 <andy@kernel.org>, "Amit Kucheria" <amitk@kernel.org>, "Thara Gopinath"
 <thara.gopinath@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 "Daniel Lezcano" <daniel.lezcano@kernel.org>, "Zhang Rui"
 <rui.zhang@intel.com>, "Lukasz Luba" <lukasz.luba@arm.com>
Cc: <linux-arm-msm@vger.kernel.org>, <linux-iio@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>, "Kamal Wadhwa"
 <kamal.wadhwa@oss.qualcomm.com>, "David Collins"
 <david.collins@oss.qualcomm.com>, "Anjelique Melendez"
 <anjelique.melendez@oss.qualcomm.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Stephan Gerhold" <stephan.gerhold@linaro.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260705-gen3_adc_tm-v3-0-ac62f387dbce@oss.qualcomm.com>
 <20260705-gen3_adc_tm-v3-2-ac62f387dbce@oss.qualcomm.com>
In-Reply-To: <20260705-gen3_adc_tm-v3-2-ac62f387dbce@oss.qualcomm.com>

On Sun Jul 5, 2026 at 11:53 AM CDT
Jishnu Prakash <jishnu.prakash@oss.qualcomm.com> wrote:

> devm_request_threaded_irq internally prints an error message using
> dev_err_probe in case of any errors. Remove the error print in the
> devm_request_threaded_irq failure path as it is not needed.
>
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> ---
>  drivers/iio/adc/qcom-spmi-adc5-gen3.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>

Seems like I'm a bit late to the party, I got distracted messing with
email templates. Oh well.

Reviewed-by: Maxwell Doose <m32285159@gmail.com>

--=20
best regards,
max
