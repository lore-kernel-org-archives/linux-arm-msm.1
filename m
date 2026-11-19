Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795087134;
	b=swFfX26ZUUBbs/fFkv83k5Jmx8xFSPOSlSHqWg7Ao/vvYEi/ZvKtjmaxglL0LPi3kFvD
	 7FgSk0igPS+NWt/ARFejJTRCVWA/7+vHd2A72NazT3VYTG4A7DU0do+ZdqYetEhXKsjwx
	 jSHX2Ihi7kfHXdnKa+CCjmr+afB1FRTiBMstxpEX1ZCI1eLw7jXKEGfkOQ5fMt1ng5+aI
	 BbklAsIna4ehus+nyYdZzsuGZ9Y2fJCBcyVQ9iSVSCJQxWDJ6FFGFdWfjq1XguhiszQYt
	 djjhXT6aOLKFtXn7IAaZW7mJ4mGBljlDAnxgevuD21Oonpxnjt+k2f96jAvuY1NNIaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795087134;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=VsZrgdffbixcAT0MIaZMhRKdxCgLgvf8zPgL2cWZJCE=;
	b=3AV/Tf6UMn5vFo4WXmS9Uz/OMeG80hwtPzFJ0i353DDxK+F3ZGqK+eyM+SRM8kGXRNUN
	 x4MpF62cfA13F1XlX0fvyGrNJUhdLdH4VoVgYClPYx7YY9JYI5JFRHPFAxQ16k6+VkPFI
	 lLU/lQltUgdqPS5muEtQWPCoJwyYr9+Nh9bnuBvi1VSnC3QhmYcwl5GOJ1o/MNOoqe5qI
	 2ioWn5jhm6b8n79HyaTrybT4i0SjB0AdLlnEwNEAOziC57yNZ3x8b9Zilo7QQ7Y6e+wVW
	 kYNQ9I3ekiwCMHFPp1WyYoUUZM9hUavr45RquHq78+OG7r51QwQVVryCDH/xW5y5TJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RZAKj0bx;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48610606A326
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 11:18:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48610606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RZAKj0bx
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1b546061d58so3683492c88.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 03:18:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795087133; x=1795691933; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VsZrgdffbixcAT0MIaZMhRKdxCgLgvf8zPgL2cWZJCE=;
        b=RZAKj0bxf0CrF217tp1LKG+Lxu12j7zQpriuF9ur47j4muc2dOYQ7cdUddH0ojuKLe
         Z9cLZHuamo/UPTvs7jeF8UMUp4XqQmyoy0DNfWtekeOGVTkokUbrt4bKQCQe7vdzu2Xd
         MJ/iRnLXhG7h9m2W72AEGEmFuGd99HSNnZHpyiIIinLi0R4VLgnaIrUPv6629/5jvDPz
         JexdQ3Mu+6GoR3zvtvP4cncf2RoJUmxkTo7tNNuWvZtNODJ3U0pEGXJZKXfA4qO+5ju0
         k/9tumhFOYydwZLHi3vVtXL769Fvpdinz3287zwfrUAFDTLBgYBBHox+6TgLcZ/uo9Lz
         hc1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795087133; x=1795691933;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VsZrgdffbixcAT0MIaZMhRKdxCgLgvf8zPgL2cWZJCE=;
        b=wVvuHrw4sUjCiG1UQnpJbOaSasKhv4VGbgVOJarnbvsub58eUrr69QcKTEDQFx7Hdk
         BjynAJyuWD82SDfG6NhUkD5PvRbTwkx9caqm5XrxOk3ees7C/5SBSEi2+jyffZN0ER1Z
         sBapi+ZEdomyHRhigOTTqb4dOIIftNYyLqxYA2mTV4PxYz1pagXQq3eyAERUUAfSXFku
         T0m5i/6IebjzWulsYZBcMM3GXYTi1qH8qCsEbVzROdl4venLLfdy0k7zaVDv3XdqE1MJ
         F8v9Q5RXXQB/s1YXhP/tvDa2VuYN8j084HcP5syDu5SO8whwXPrLFDjwHu/R23j2V285
         yiKQ==
X-Forwarded-Encrypted: i=1; AL+hErFs//gBn+dB/G9QU0NfzNh8ZU6IZgZBTFq/mewT6+xfLj3keCPKNY3q0SlCgOWKdWF/1IRoiDG/Iu6cC4Ya@vger.kernel.org
X-Gm-Message-State: APuU4Z9Fjd5Ef8zZVk2PKCX3z3xcILrqoPfPHx7Xg5Xi0pmfAskeS4iJ
	0NSqwfOfaQp4Uv83FpRbL9+4T+sVA3uXrSFoEShd+1FfU+D/sNImWdPK
X-Gm-Gg: AYBFou1z1WycUR7A1LqvnCaG5lFa5AICvrQGA/b8oL0oY34kAuLqAIgCL2i4mlGoFbV
	yfG0QXBgNLUmw3S7ZzFkI0QIYz+yEmYtsQN/3yThngTuBMWKeyQxDPlHxMZDpQAlBPF7hRAXtHr
	ggLp/0rzWFsz/X9joMTo8KItfLGSCPhCLyRxt4Zc8ew46ASEdR4Dpp0KjBxj4RP+4jzWuMOzfSh
	xzT41HVkVOqSL18KakrmJeVNZPwr9R0+epiIv7AysEBSOSfsKfZnP7J2Jr4W46vI5kOnE3m9iEc
	Bl2eWQan6XnIz7UXZyAvcbUnuLBh+mUNe20Poj5jjpKzKwMt0glqzmt2DmQXWUZqe71hTgv+wlO
	fiODGGpzSLzYXaFBY1wZCAyUCuQ/3vm9HSKDXSZaVGiHTd+gCjq9ChYaQdrsVrX9BnOEaavssLe
	2BiwO36wQngeD/Zo8RFN7pQSFCf4oCmNq6BIw2GLAgUIohV+hxL4nntMYHENidhiwtSDRI0XpyJ
	bxsdY8ildU+4PzQUbRQ54krP2OqXm+Km97aYZgaFCLEjKyBNV5RpzfE+qWf5LQNCRsxdmUZXJ5w
	LsJZzHz/Cl8H5V9XIuoCNbDUqPzMW+5vTur2HhJBaXJ5UUeR5wx/udDYvBgPExwqLu1zPGVWQz/
	gpqDWsS8l0AsvC88aMK3i5IuwUUwGXovIdit/fkw3emFiqQ==
X-Received: by 2002:a05:7022:7e83:b0:1b2:60ab:1e9d with SMTP id a92af1059eb24-1b543c3fb96mr6183656c88.37.1795087133021;
        Thu, 19 Nov 2026 03:18:53 -0800 (PST)
Received: from [127.0.1.1] ([74.176.208.23])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447dc5e9sm20583004c88.11.2026.11.19.03.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 03:18:52 -0800 (PST)
From: Yaohan Li <shunsheng1218@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 1/2] drm/msm: release the cursor flip work before
 the KMS is torn down
Date: Thu, 19 Nov 2026 19:18:47 +0800
Message-ID: <179508712793.3615754.817569571407027777@gmail.com>
In-Reply-To: <sashiko-outbox-222715@kernel.org>
References: <20261119023604.1495603-1-shunsheng1218@gmail.com>
 <20261119083133.3437277-1-shunsheng1218@gmail.com>
 <sashiko-outbox-222715@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi,

thanks for the review.  You are right, and the check is redundant in the
current mdp4 code: mdp4_destroy() dereferences mdp4_kms->dev at the top,
before the new guard.

The guard only protects the CRTC traversal this patch adds, and the v2
commit message says that it does not make mdp4_destroy() safe for every
partial-initialization state.  The existing problem belongs to the separate
KMS initialization error-handling series ("drm/msm: fix the error handling
of the KMS init"), which was not merged in the msm-next baseline used for
this RFC.

I would prefer to keep this change focused on the cursor flip-work
lifetime; if the check is more noise than it is worth, I can drop it in a
follow-up revision.

Thanks,
Yaohan
