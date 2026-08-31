Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9900747426A
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 15:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788191526; cv=pass; b=kf3Vg9MfYvwQkRntSNhzLtJC8pnOXoYW3V/8HTu5OPleHl5dXIsuJxInrPKTLJ0Q/y3gBrQ9i0uuI/iRZLmslb4U8waZkkNZLRJu+FxEa3PSJ8GiE8y3HWDsCiE5ZA6e7PvyPJk+awWunixZpMCNjNoexqtj44MSLqnKuaqWR+o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788191526; c=relaxed/simple;
	bh=yIMH67iFY/zDCqJa0/kWLUzmpSflEFAoQKZH6A3GiNo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jjB/Xv/0ykPj6LAgyXuE17xvSdXz9flMx0vbJ2J8CWSVpCOmyGpP4PGU/ZLM85gzWp4VHo4fVpy4jZs9hy16tNBiOu4hjf1bdErfstIlU29x5QDW0bCEaTwG6kgsKUeaVPyzU9m6NanJwY+zbABBelZphCL31aZKBJE4M0pt0jc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LY8a6GUf; arc=pass smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LY8a6GUf"
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-6b1334a3b16so1502559eaf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 08:52:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788191523; cv=none;
        d=google.com; s=arc-20260327;
        b=dRdq9zTbf39jOiQTHMGMQ2nCtKH9kytgryW25Gv6B2k5jioDKWxN8yZWx8enZ67j/6
         0o1atBb4CPpNy8WyNlkwhXNk3dcuBNT0JU7/6E6L6wNF3pVnNiFn/pgPG8OsnRIa2cs9
         4bCl88qLg2IYaG4aIvhym8GcRYwtsmiZZSVhTtJCRHZiXIhoLbZa7ViWniFga/ryvBsn
         Cv2IZAl8Lqs7i+FXWw4/kxPNFfBmdb+DRfPLmOghteg8uRCU5eSpEiQ6CeWqJbcXF4ve
         O2b7j0DqyHlHlyP2U5L63XSteQ/YtYkOS/czptPGD/yULodWUOCMzFU59p+aLMCcUSEw
         8woQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=gv8LTcghy3tRcsgV2tnBunUotldPm+945vyb/VPcFy4=;
        fh=aEWYD7ioFnErJuf6UEi4Ogp5XsTAdPRF1OiYEUqtYE8=;
        b=YK5vR7xZrZQVVV7+uoJkBaukDZHwVypcIQWu2WDgjtluHizaFKLe2S7lMSs/rXhEGT
         wDy0Xk0fX5A9yMCswoNmpusrUQlr+07Dr8CtXCdFFATvVQBXOYIsVzr21wGHUS4tw3Yn
         PKdvnc8bxHelume1AT9LPVr60DZI3GSe/3jkaG/V8/Ug2dgz3s0A0kgAoQr2iX6gYyPP
         Scl8MDTRrXp7H/FKSY5WHigb4xBTl0HyzFvVyivWG0edHjArqO1HXRU1S9WXbpPizlXd
         uMx/LVCU2x+CzlGQ8JIfCcd2p1JYswiu+7LCotmcHtc/fzT8LGQfGKJcyZKebQnJX5XA
         mnng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788191523; x=1788796323; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gv8LTcghy3tRcsgV2tnBunUotldPm+945vyb/VPcFy4=;
        b=LY8a6GUfSW1WuFwgiGseITvQUyDv8nqvd9hLvP0fLzH0DI4shTBICIQ9YsUow0bfUE
         mreHwf1uGsittObwK++MrBy+qpEdTTaZDx6znpbNsW0/wcKsnfUx8xBg0LFJN8JwzqaK
         6NzE6uCNTIClKSkWqLDsZ+QMyIHQnX74YsZJ2SzP7z7NBvuzeqLFGMucTApIYR14nYFc
         frlC7RegaEBS+0jutVcp4eYSmVTGaVO2EuQB3lXFeGeSTxASHKH8OYSTJayVxJWSR2MU
         KH+gvr7m97b7j1cGJ6euZwddyGeJrjOPE6j5zkAWJx+inu3Uk+wBw3VHY21ccT1E5vcP
         OArg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788191523; x=1788796323;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gv8LTcghy3tRcsgV2tnBunUotldPm+945vyb/VPcFy4=;
        b=UnYmE3/wMdLzkLNM/0HF6S7J6ql6hs/zszcou3lxXOmSvuQ7cxZ8ppAuoDn1IS3EtN
         yBlGKdT/LzqOiPp7foyW6kOWTj82fsOL4eP0AQg57aBtgN0kyCNEMOiV+yYM8VO6M51a
         uvrJwf2yzgR9qendAFNr0YbdkGgODU8NyQlBlSpWHaIxkxIE0iFMy8gI7fgPLrMfC80Z
         aUJYwFvN2I0LBgiLXUxhMSmjG3TroNECDN34GX0Q3hBKn2LhxKVrxK5Is8MnMdGA7rzD
         65HmsLiEMeJO9q4h9QxX+zq7WXvQG9eHFvJp36Vm2IJxAx8840ZExMfgtlDBY34RBMT9
         hOew==
X-Forwarded-Encrypted: i=1; AHgh+RpRVKNvcorSmoq9/5A+wb5L0v5GAlS2PF+pNxC/PoBJSoM62mIHAm7oS7nA9MNbdCjhIoECg0miLEjm5jbg@vger.kernel.org
X-Gm-Message-State: AFuF++lmZsZxFq4kVXdVXp/4qW6gsnI7wyVc/16Pn9tCv10NKBEge3yc
	QBZmmcTedYTBcFu7bNvRAhy51/xrQ4PJ/1yxQVDUrykQ8mziVRTfZdZFpj1RZ00JOxwZnnrqOVu
	B7+MplLoA6wIoSR6+AJ8Ki8sl0bSTZsU=
X-Gm-Gg: AR+sD12HFaYD4x5SQfOI+tGI/H5feWFgvPpMmxSvrPxducNVYAXAJKcf2LFB9SxvPys
	Tm75T/DG6ZLYiE0yvJps2NZnVJ68O6RWnsl71fe/A3hFsD2U6Gak3o6W8IejYNQo3RFEHxe/Yjl
	XDYXija4JDkh5ButFPIYfMEEJkK7eFOXKO41XSKKRZ/nDl3Y/RjguazfZMUJcTQaCz7ViKNErHh
	dsBXlgoYJEZrfW6+UtlSXO0FtbeGrPquX3syfW9oZAA2TIyWPNAKsqIWIhrgJguWLzeB/BPUBfV
	kP4dBcIezfy08m3hZqhFnqeNqApwpjXNCZ8fWr+a5qluPJ6ZeOWQXPHenfTUbzHO/2o8jzeipX6
	W
X-Received: by 2002:a4a:d1f9:0:b0:6b1:a667:f0f5 with SMTP id
 006d021491bc7-6b1c673c239mr19248427eaf.20.1788191523257; Mon, 31 Aug 2026
 08:52:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260829-surface-pro-11-volume-buttons-v1-1-ace589343a68@gmail.com>
 <6f33aa1f-563a-4ad8-8c81-6f64fb64f6be@oss.qualcomm.com>
In-Reply-To: <6f33aa1f-563a-4ad8-8c81-6f64fb64f6be@oss.qualcomm.com>
From: Dale Whinham <daleyo@gmail.com>
Date: Mon, 31 Aug 2026 16:51:26 +0100
X-Gm-Features: AcwNN1VVfkTEW1Bwp9Kuf4cVK9-fWlNN-1KBCKmFxG5U1PmIDQuPO0voL3CHcBo
Message-ID: <CAFcmK8j09=tGoEUnFwzY+8Te=dBGPBr=pc9C-3dZGwAEorOi_g@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: x1-denali: Add volume up/down GPIO keys
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	=?UTF-8?B?SsOpcsO0bWUgZGUgQnJldGFnbmU=?= <jerome.debretagne@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 31 Aug 2026 at 08:13, Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
> Let's order the pin nodes by their gpio number
>
> otherwise:
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> Konrad

(Resending as plain text, apologies)

Thank you Konrad - how about the gpio-keys { } section, should we
re-order them to:

key-vol-up   { pm8550 6 }
key-vol-down { pm8850 8 }
switch-lid   { tlmm 2 }

Cheers,
Dale
