Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F4F94C33D8
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Oct 2026 16:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791219050; cv=pass; b=cDJo+iSbMCilig1hDSQLrYtGiX8e4Rm41q2a3nQFsObAWG+QWQpn+KopmA/EbYS+1gj13H5DA/m5J7v02z93285HAe31/U8PkqRnsP1BD2W/ToD0Dp9/twrltn+UK4Dxt7qr4M+bVIRX3dnf0BSBmDL6lb6RtRzB0v5D1SfKuAs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791219050; c=relaxed/simple;
	bh=Q5bEQNNXDkZhEHk+o9hidTvXzFCLdcCycoDgksfDDBQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lA8+wdObDUHP8GhskKoajgLf3huq3nPdqMckrtRHSr53G/PHBAbvB8gNLuDIGUSh0/k2njz7Dp6cLwoM192fxEzb+Hqf/KwZTOdK38JsZnyjmi5oD2PWrCDr5WjWGtuzGuKyH+FhobYHf+dSXxn/4rJzZFCf6QXd3GizmYnUnP0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SWvsjAzk; arc=pass smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SWvsjAzk"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-824e6e6ed71so1454435a34.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Oct 2026 09:50:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791219048; cv=none;
        d=google.com; s=arc-20260327;
        b=PVPK0Wb3rbkQmOwTNQa5tKFo+FxIoZgZfRjqh3Ig6JvzBPeF3a2skRG+RgQJFmcYeI
         WG3CFKKsVozgcnzvX5pLsy6BW1a8K1XJu7sC8uNbFPAZvFX/8JttTVZwF7rg7hpr3Nb3
         cuzvfQamw2ZOzJdSRRsuUynidzgr2uHQUuTgBnDRdoVYOTcBMbmPXyp2U7GgLX8rX4Ay
         Rerous9GawTvF5cadoyttBfAZQ731KRvM2APBH+vrOWtAUlfmvWF9jNzne7gAaiALv5X
         cSyFgohHS7J9UCPX49tK62Gekduvat+IEXatjp/7e88Keb52o7QFCSn2lweujSQFsZt3
         DFhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Q5bEQNNXDkZhEHk+o9hidTvXzFCLdcCycoDgksfDDBQ=;
        fh=LxbR6DXA7u99ORLRJWtrDT/WJXgGBw2FGhIMXwOfq0A=;
        b=SnekrfVNai0pl9F/wlWKfkICV9UHf8YAi6kAF7g4kyF8zsxP5R2C+6AgDh2nE+xm5f
         KX/u1/+t+dNI6V9YUXzDmrHQx26v+/nQLnIdQELvxhCAZ28twbmZet55R0atGh11f5yX
         6qfZTa5fcTmN+K52EvaoRUqxu49LCPTlhBfQGuKtdQaipwCP8u7wZMZba0etKpDQe9BP
         GSiyLC+OhmU+TC1YNHI1O3xpDhfpAMKEcTprbJ3wFo3Z+mnrVm8DsxZLLOx0FMk4SIq2
         IYaMUu60qjTQxfgir+MOyiAoHhLJwhKimFXqgwgY0q6VM7JbsZtJD0RYG/JAQBSnSkrv
         8M1w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791219048; x=1791823848; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q5bEQNNXDkZhEHk+o9hidTvXzFCLdcCycoDgksfDDBQ=;
        b=SWvsjAzkyHzUhTPj4aMhCk7arhV/KxwFnHhNlgosAH9UXEazEnXp8HGRuduScSm+Xx
         FNSz63r0/H35/QH/SUUk+y7IO6sQk3arjidg5DBRH6gmN7a+uQcsn218CX+Zvw5GX2yY
         BGmY6JtchlTSTise7rnucEdbAkqLy5UqWYQiBrzYZsyb/TFoTj5dJXY4k0K+fWEbHXIw
         QF7VBe55y7WRpB2oS3A208b2ALJ4/MB2PwAgHv/pQdVsE07nNd+xoC1EM9e3UVjygNAM
         I5XeO5teEYgGEbY8EjMR0kd4B6Yo3udi2gzcP8HWcTCkQoCS21/ENGYC5Z4i1aDA+kws
         GPkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791219048; x=1791823848;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Q5bEQNNXDkZhEHk+o9hidTvXzFCLdcCycoDgksfDDBQ=;
        b=rmtlYFKgyXHYGVBgF+jEwCYGr+0pcrkx81ZBg6esSSRPlLp+Fl/nPaJX3klw93BtHA
         ELoOwjhZS1fArYZQk4yol3pHuN7FP6JtCLSTmDZa3DOX7eTnJNcDOjACQpqtNY53CATQ
         lMQc56i6ZXOvEFrLa4aBvsh87pxh2sO1HoWZhVHPnynn2BA1W3UQpRrlV29Ey5Wd8zA4
         23YvnKdyDAXirBdjHLnWL1c0Dlbdjyj6M/L5ityFmRXfNRMmnb7m67b/5uc6hNbCeZbx
         LhgTc8oWxvTg2QnKEgF9sXnX6FPypAfGC2rMgwVeBvtcLLK3PedJcd0v0AZSWq3onKPy
         mymg==
X-Forwarded-Encrypted: i=1; AKwUvBx9Q5J/VgWoPSfK4J1Wa3D7ekUyhO3T6Em8HsGAE3ktxtbmNgGMoHlk46DUzm5k0BdpT9duwcZ5iBXvett5@vger.kernel.org
X-Gm-Message-State: AFuF++mkLiT8eiUFPJIHBLRpxwc/9gYvhhp/fOcQbsAN5LgmTcalON5h
	OWofAlLR6W5tqDDLJqbjtPWs7zEbPy/ftl4OSWCSXAsslY53DUX96LV0QMXDYNRAb4fwPKB5KWM
	7BMKnSX0QWyvFx68c0q4oGbbnu0ibabCTVHtM4tE=
X-Gm-Gg: AYBFou2i+dBcYzVslle9UhTZFarsbquri9twMb8jvJP2OvZuSHx+plvUyUDSGdLtO2X
	ZJGrNeOuZPvsHxxMIy0sg72SQBZL0mq+VfrJSvmKRuTYzSU6EKXTpMYRRqZibES/sZneb05opD2
	oUgPsAX6nT7wfFeU9DV1e7EVH3KNujTfAXcwrEwzL5QB8NkczjbK0aiywNt+KdmIMpXVk3D7iJD
	ievS/RQpJa1H07xhdKndSu2/pZRWaF0AWzR+dVzzIpvR29b4tpie0LQeXs2d8bXltNgN88ohi4A
	fpie7VgvFwOqtgs0orm+n8rOx0HdYBX8B98dUOCrJPtaViQI2QL6Ejjfd2ycFalLZUaBwe7fkON
	oI4uSCPQOLrJp
X-Received: by 2002:a05:6808:1795:b0:4e8:2150:299 with SMTP id
 5614622812f47-4f679fe2a10mr7854866b6e.23.1791219047967; Mon, 05 Oct 2026
 09:50:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261004165132.4313-1-franzelfranzel@gmail.com> <d791e70f-9c3f-4916-94de-8d76517339bf@oss.qualcomm.com>
In-Reply-To: <d791e70f-9c3f-4916-94de-8d76517339bf@oss.qualcomm.com>
From: Dale Whinham <daleyo@gmail.com>
Date: Mon, 5 Oct 2026 16:50:16 +0000
X-Gm-Features: AclHuK86rNmj1WNp2rnEYWCTMSv7GKXC5kLWAnqBi1EywA_4Cfr2oGHSi5bAdpE
Message-ID: <CAFcmK8haaN=O+aqvcRr4t6jc6dr4Bf2QDDPso-aT_frqEfSPWA@mail.gmail.com>
Subject: Re: [PATCH] wifi: ath12k: skip hardware rfkill setup on Microsoft
 Surface Pro 11
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: =?UTF-8?Q?Fran=C3=A7ois_Roux?= <franzelfranzel@gmail.com>, 
	Jeff Johnson <jjohnson@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, =?UTF-8?B?SsOpcsO0bWUgZGUgQnJldGFnbmU=?= <jerome.debretagne@gmail.com>, 
	ath12k@lists.infradead.org, linux-wireless@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 5 Oct 2026 at 14:37, Jeff Johnson <jeff.johnson@oss.qualcomm.com> wrote:
> my preference would to to break this out into a separate table-driven function
> so that if other devices have this issue they would just need to add to the table.

Indeed, as far as I know Microsoft Surface Laptop 7 (aka. Romulus) is
also affected by this issue.

Best regards,
Dale
