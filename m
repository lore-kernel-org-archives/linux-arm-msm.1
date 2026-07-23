Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CA333FE363
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 09:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784800257; cv=pass; b=sRSYJwdWTcyuxKDV4q52R5G+bTComg+avI1Zpt6OIjznyqc3jMscRCCRj6NRNcfb4cF3lGWQwOjc//VYq8RM8bdMcH7MI0qIJcQRT6rsThMYaRWsMuhlFp3ncS1PMBaeQCwizfYDtPgHM+gsM4v+vuxmSFQzR1sC6gWtNmr9d7M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784800257; c=relaxed/simple;
	bh=l0nK+u4xvd1US7TRZ1Ho7+ymO/AKnq9a8Ro6WLBZ8LY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XuMiK4Hf4s0twaxCyY4KAicZo4gkZwJqja1FtlMesIP/Fm+sTJ1RyYRZMBqmKBiYN2aVTuDwKh6Z/Urz0sUT5/Yb8ggoO/pI8cWBh4mXc4/AnaTAFeiYi9+K5UTiCm7hfjz1cHSFoRbtuKCSg6Pymy47UEB650p5TAqLmyTRLWk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OMZ7G0nu; arc=pass smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OMZ7G0nu"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2cacf197759so6842055ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 02:50:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784800255; cv=none;
        d=google.com; s=arc-20260327;
        b=lCbt/iD+RffiGZpmaJNwWyd1DwjsziFs8SE13JSkUEppYcsJcJgTt/Gsn9bp46fHT7
         mW7RiJG7B0Nwlg9GMD1kFR/lWxuNSCEUkh6w5iuD98BD5LKskgR8ojtOQoi14aQvz5yX
         8wEd68GFu725nhahQWf5UpXFc6pqsxcY6Vwft8VYj8yJ/FI9m+VJfc9uu357utQiL0PR
         mTOnz0/Cyjj5o41L0D9CkYeB9kgd64a60K+HzAkah0AtCVrbL9L3RKBwsP/FNpbZTg9d
         P+vl7uav5t3d2z5CTUc1Vcu5jPIw76O64wVR6wvZArnLQqGqr+bHSywTsf+XaWFs4CHf
         aTnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=l0nK+u4xvd1US7TRZ1Ho7+ymO/AKnq9a8Ro6WLBZ8LY=;
        fh=bNqBLDqs0jdWN2RnYv/1RzkBaxHA5E4VGDE6PvI4tvw=;
        b=ShRLeFqzkDFeJ6BB7+2+zVTSm3L4Vp2yTkh7UCYwpOF1v9Kt+kszzaFHPaa7AdX5BD
         Jjx+pPyigZb8sgRHdEvulb9s83Wm/wnhyRVzYc3CijZ8pkJq/YnJiAGnNt34LW1o2V32
         WZaqFOAoRAogZEljj7FEM4gn/WE/K5Z0mfOiJO9vL91Vw0td9Rkeh0eRbFdRARKkMvAr
         fILkhvSb9unkOxFbcPQnwDM16Z6nfNh9FxvW14LYHAsXXGZK8mSYtQqlnlwAVCv4n+Sc
         1m2jj7dJVYRGoVahFPudquYMO8uhmHqJzxgw0vzw62X3VW2gljUc8H9E/p6fdu0rURg5
         Nmvg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784800255; x=1785405055; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l0nK+u4xvd1US7TRZ1Ho7+ymO/AKnq9a8Ro6WLBZ8LY=;
        b=OMZ7G0nuen6zyzcpE/ErJHtzEcyekpyDI8qsaW+nB2u0WLGn+ty6uMVOMR9MI3HCoM
         iu01bT0XHWsqOM/f4vyMKMPylCLfvXqhXKET6wfixVOa8oHprwQ/J2AhZmdo4+UiYCol
         lXSRNWQWAitA3hK6xypTfA7dMe81oIeV4n9N07kNfisWGPzjUILId8aismutcOcParfF
         EgbHQIxNZMqrEaY2QvbR193LIqHfr014PFCYQNiqSyLEtk9V5kb0OAfSxK68g6XQWv0x
         /nx43+KSD9ySe3mU1RmEGk03dZCG3c8AJG0j4TxpLRriFnoRWXzw1m25AHJwf56Ehl4w
         p4sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784800255; x=1785405055;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=l0nK+u4xvd1US7TRZ1Ho7+ymO/AKnq9a8Ro6WLBZ8LY=;
        b=Z3iR3Ps7DxGWdbPKudDMtImJvMnBSw5V0L4llUNprODjctZ9KyzloW71UwPWbex+sP
         531b11llaPlgy35AOuyKWTm/xOeApJ9IW0BayVdWFZuC5uGLSDl/Sk7hbRqdno1DCrDe
         acqFDz5nJkyINfbXiGzYa4Ktz2uEoX6ZUAAI5Bm1hU8PLJ/cbCl3xDiY0ZTGrW9zdPDf
         gNEJkEubagIQK7pSx+tthpHt32oMP18424X+tptxg+Im8TZVFyOemobi0SolqgFDIYZz
         09L5N7chRDvr0YStO+igRgkXrN4x6jUwM3+Io7SRslavIWX4Z0dvP3Ymfc8DSIp231XK
         /YPA==
X-Forwarded-Encrypted: i=1; AHgh+RouObbHy95AztOwKBnUKc8iuleBpP9MVDW35BKWBQkpbB9ILvHju3EKBl5gmjQ6my1wili1CAk3C1NCogho@vger.kernel.org
X-Gm-Message-State: AOJu0YzysNtPhfXW30nLV307fqxFJzBeie+a9pQxyw915FkqQ2u+nGDD
	S3NrApyV1S9RuQTRYWXxbxduMYN1VNoXV9WBzBs2VzhopVX3XCEarPWPtYQ5GIhAhpTVGEjYSb1
	Z+kA1rnHtS2TuiKQ6wLVzwLCxvpnIIZQ=
X-Gm-Gg: AR+sD11hqzCrgUh32oo/H7ccVj+9UmrNNn4p3mvsQxVvOBFDojqJEyfajvosuFClscO
	qt0SHX8dTx23WnUwdfIC2c8Lvzp1TDvms3MQJ1yISHCBVOiZAdPDqzpIAEVEcuXX7xbBnyZlxHR
	CKZvnSu7DcSnFi5/6O68PWssZ4rVeI1OHT/CCjm1dt061i8yUDjo3HwvTjIbVsAbAdqFbZVSH+e
	HXgw1wL9YKZp34iysY9FPmk0EDPNtA8huIEJBWUjKUvaKeraCEayPK/zgFrqb84IFotH3Z2PuUG
	q7oTb6xEMgx8Z2YB
X-Received: by 2002:a17:902:f68b:b0:2c9:e9c4:82c1 with SMTP id
 d9443c01a7336-2cfa7488680mr27492565ad.26.1784800255414; Thu, 23 Jul 2026
 02:50:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260723045327.28260-1-phucduc.bui@gmail.com> <20260723045327.28260-26-phucduc.bui@gmail.com>
 <3eb2eaee-85dd-4dc2-8c6f-397cfedd6946@opensource.cirrus.com>
In-Reply-To: <3eb2eaee-85dd-4dc2-8c6f-397cfedd6946@opensource.cirrus.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Thu, 23 Jul 2026 16:50:43 +0700
X-Gm-Features: AUfX_mxM44ZVP9jV6XaieOqLwYCtTn-0wrj5JJ4vYZFP9uceKJcb-13MlSsTyFk
Message-ID: <CAABR9nG_vhiRjYHtHRL0Ltk79RXg3OKa-FBw9iGAyD8LG6TChw@mail.gmail.com>
Subject: Re: [PATCH 25/26] ASoC: codecs: wm_adsp: Use guard() for mutex locks
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Lars-Peter Clausen <lars@metafoo.de>, nuno.sa@analog.com, 
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
	Sen Wang <sen@ti.com>, Steven Eckhoff <steven.eckhoff.opensource@gmail.com>, 
	Srinivas Kandagatla <srini@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, Linus Walleij <linusw@kernel.org>, 
	u.kleine-koenig@baylibre.com, Thorsten Blum <thorsten.blum@linux.dev>, 
	Kees Cook <kees@kernel.org>, Chen Ni <nichen@iscas.ac.cn>, 
	Bartosz Golaszewski <brgl@kernel.org>, Shengjiu Wang <shengjiu.wang@nxp.com>, 
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>, Pengpeng Hou <pengpeng@iscas.ac.cn>, 
	patches@opensource.cirrus.com, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Richard,

Thank you for your review.

>
> This has removed the mutex lock but hasn't replaced it with a
> guard(mutex).
>

That was my oversight. I'll fix it in the next version.

Best regards,
Phuc
