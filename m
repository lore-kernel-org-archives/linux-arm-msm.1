Received: from mail-oi2-f3.google.com (mail-oi2-f3.google.com [74.125.231.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E3F22AE65
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 01:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.195
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785286850; cv=pass; b=L3LwP/GrZl1uZm1gvdHyGUiBqpT7F/8v9X+0wCwR5pkKeww1xt3o85HRlbuCg3GklzR1jm37486is74EW5FgimssyPQS9IM1hgTRfwV8ISPUmFWKD+GUu4P5RPJsDNQwYjoa4LHlwsqxadxXlpnqu9cMNQao7LGy9eS2tvULvB0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785286850; c=relaxed/simple;
	bh=0A9LpMbKDLWB4hRsoDwyEmqhSZbsjDQKz1BDBkhcNO0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I7PjFz5/qGE/bR3vjnOEBIqyrcOrDEyqZR53RI4XUkLDrVEuRP9h4mtSXdLQNAiCMY4O1Gbbp9DXe2Z4hh0bzhkgLnT5iS8gV5lVV55Eui7NnBrmLzThntxlhlKzvL/38sgRu10j/034m5+vPrMXYuEmoD3ms36M51YymxhZFwc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dvllsZND; arc=pass smtp.client-ip=74.125.231.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dvllsZND"
Received: by mail-oi2-f3.google.com with SMTP id 5614622812f47-495e3c6a1f1so144610b6e.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 18:00:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785286848; cv=none;
        d=google.com; s=arc-20260327;
        b=UspIHtKfX8okuUMxOdnTNLrSAvlnH8taHMoZ46w57zuzJYcvfkJpsm3xGl9RC/OEkq
         Vr7AJDBNOxNZnJ71riFe7S92CuvRlcsSSUeFSZBJTvfCCcWeZ0Ac1P2ei7X38iAzc0pc
         vC/AN4W/aQ2FbDE/cWuS5daGuLVggLwWeJvksNcZFJV3yrhJArjC6KpEG5gn4nUyDJb8
         qus802y2kOD+gJI5y6NANAAuL/svvKzw6IwLAc1UWFSEHq07fFlFKP1wwZmP/Xa9D0Zx
         REOwHvkd4pTe4NsunCczv4broKAWfVGalQZcNYzpeysSPCllo+2aM4F0Egxx9C+uk2oy
         HQ+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=0A9LpMbKDLWB4hRsoDwyEmqhSZbsjDQKz1BDBkhcNO0=;
        fh=jMUIr9Rz07aGETTv0lRx0CRP6qt6o3OtM6Od4SRqftY=;
        b=NSRI5xhfiWXkpkRSU8DvMSXW2DWqs0x+J1KhPb3gfdjnUywU9x+IhtYr5WKlESscj7
         ELgGNRmJ8YZp9DOqDRM4inAMrIKCzkrTN0T34xIZ1B7XePle9XGUq4SkrYcKLD8B7z40
         95Fcyq77THRwE8beu0cOU7prYCRJOYL8KEPo25vS/nzzYbSfUyo0Rir+5MGqLfAWFl3P
         r5ckYNmjgMg8KBiZHDXw4RZUp9RW1RtUk74QxtrZm/E0/hOJg3fChm2HO6JfIChAAxjQ
         UkUMZjArmHpXCg+hHk7eOd1lm5olUNIXnewtPtv48sVfyeZvel5O7kUyMk5Wns070bYv
         AZFA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785286848; x=1785891648; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0A9LpMbKDLWB4hRsoDwyEmqhSZbsjDQKz1BDBkhcNO0=;
        b=dvllsZNDPplTOZr7pcyJbQUSCGEDbgW5qG8WbMOPrrZoruidvJQjcld0dOgozlBJHj
         ZX4X2g8NugNJV1wDph9qKJq+AHYzT9P5maihjxzjtW407HhiPSGBfKnJae28AMrzd1aW
         Dq7eEowk9M8aXfnY17DxRbCkUH41iRXgWrS3xK8J4LccwhQpGk5CtSJuVs33YBV/9XUg
         ZQ2ZQKCTBwJDN6rD76MfLn+Dm+ywm7Gfb9CpC4mCN5dKPCUs0n/CBy5ptW8yUAbFXCS6
         ChX13rNtRZ1qrbMLeJ9YGcOXpl75b+GtDQiZDiVNQ/XKyNFkqaz4GYLOZIn37c+ba9PY
         hR/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785286848; x=1785891648;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0A9LpMbKDLWB4hRsoDwyEmqhSZbsjDQKz1BDBkhcNO0=;
        b=lNdA1QjyMidcSCn+aCmy31Cx0UEt62qKt6vgNfBYYTOPBFC7/tkA8UynYYLJGJpZw/
         Hvw5zcr15bsX/P75wyOcuPWFZggsUHI5iKlPgBVihZxo2UfKrTN6CwFsvCD0GsEyXvJw
         byhIPOokEhjUwdFFbHWm9Zz0qDrtR47CPPQfElkMQg6/HUUUltQSoOncH9QTfD+oOZvq
         xLv6g9IvC18cXdkgR9cMc3Z0AuYkwZxhjpbewhq1mhgj+/xXAPrThylwCaiL4TKjP0qQ
         Xm3Pb9+InChZWhvx1oBE+8xDoUhz4/Mp4Q3/WEaVEIht8N3+U76B2j74jM0bQ+TdUo3f
         tNGg==
X-Forwarded-Encrypted: i=1; AHgh+Ron+aZ8mLMedR4rJX4XBNHg0kvZQsr0+Pku7iJf0xxpoDzUazxRaFwuGTBmagAYdWw3/ZgSXaI56V1i/eL+@vger.kernel.org
X-Gm-Message-State: AOJu0YwtjpKvPzob/kgwf/l+uZQKSmzhURuQBKL4Q1WEg7TfKhEGeqTX
	LjTElxual324KvxwhQJNYFBT4gUIAjXLvFKgzbK7FY3masKeEi0SXPlrjU7ytcSg3W/rSfvkhX8
	KMl9U23Timjps8l9RdfQEMasRstlreN4=
X-Gm-Gg: AR+sD10iXhMvAhuyVkCiHcv9y7LneRW8Dim7KzoFZsGAb38zOaGP2LMyODfObEHe7j2
	oAXXcmyb1VsEMRfYlC3YR7ijUtXb8uuhH9SVQ121OGhHIwQ5ZAaTclZkF2cbmKDDp7jaP/b1uyL
	KP99EaX8vFQtmq8T40fP/Ckgp6ZeE9miXjSVNy9Oda0Ra8tOkg92lBd8vaKWVrJg42mC8+mhIze
	+4C/f0zSHCmRfjQdYoGRCJ06eiIbnnTkEi719nLRVyQ4gbyhSqEkQzB0fT7xEnRdtQ+Z/BmStHg
	G+ZaqeTNs6/hWcv7K0sqVDz+ewXmX8g+ka2cxy15cyOC
X-Received: by 2002:a05:6808:138b:b0:495:ecd3:ba29 with SMTP id
 5614622812f47-4ad5b8d3dabmr3207669b6e.35.1785286848133; Tue, 28 Jul 2026
 18:00:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260604051814.41738-1-dennylin0707@gmail.com>
 <59e9c722-f58f-498f-833a-41eed573c23e@oss.qualcomm.com> <CAGEkeHc2JNfL7SfPk7Ad1kOTftnBhBtdLk7PcURZ-0iWwTL4oA@mail.gmail.com>
In-Reply-To: <CAGEkeHc2JNfL7SfPk7Ad1kOTftnBhBtdLk7PcURZ-0iWwTL4oA@mail.gmail.com>
From: Hungyu Lin <dennylin0707@gmail.com>
Date: Tue, 28 Jul 2026 18:00:36 -0700
X-Gm-Features: AUfX_mzcqNFVVCs3GcI0TEPFm3OatibgZITS6Csr40n3rz26lvP0GrMig2fl2F4
Message-ID: <CAGEkeHfQwJG319LqtFj4mGOf6BRd3dMUB=CyrhH+BTQbZibTMg@mail.gmail.com>
Subject: Re: [PATCH] media: qcom: iris: rollback OPP vote on PM resume failure
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: vikash.garodia@oss.qualcomm.com, bod@kernel.org, mchehab@kernel.org, 
	abhinav.kumar@linux.dev, stefan.schmidt@linaro.org, hverkuil@kernel.org, 
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> as v7 after validation.
>
> Also, sorry for the versioning confusion. The previous unversioned
> posting was intended to be v6.
>
Correction: I got the version number wrong. The unversioned patch was
sent before v5, so the next version will be v6, not v7.

Sorry for the confusion.

Thanks,
Hungyu Lin
