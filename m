Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792819218;
	b=NFfyGCglAbDNMuCV0A1aZAXH32epwalxTfT9ITkafHlKcc7dn/wq7h7j6LuNyPrpH7Ir
	 9IdpAQs7gq6BzZgpqNllyZM5FzQL5/Rg09Aw6XKMDdznqtJ0f27qOC4vbj4vdHRSkziNq
	 PlYtO/6IzVfX7R67QP9a9A+72sYd/Mi/t4tWZjhfvw1VshDLmcNDvFOOXtmVZcWmeq/YF
	 LMZT/3QnNyTG450Hd8FDXFZkR2h3ckM5oXK6RWdbCW/L778Cyl3YVovl4VdoLnKuhpVwf
	 j78xbTDkjR3pJl/1WzeCEtGsWBywVNeIKZfG2MluEQMP5QaE9QZXBSIwckI+6F+GU1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792819218;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4GLuOUeqEK6qd9I17ORJDYTZ4CpL0kgFtBJTA57pHhw=;
	b=iNvBPzZGhNBNbug8S3TpwYD7GWDPh4jUNNVXgfFd0HNMH+9CFfKFz8nH8FQmn+BbXhYe
	 1YsPjDG4IfgoP+63Y3PL7MEySEfCcmuDKVfi0q0lpPPcTXrrLA5X/f/otMIBj3MKOzjOy
	 NNEu3kyt+ehZfllGTsxZK6W2b8QNW4+TRTAjiSOc6sBgD2gEJuQ8PFllVb3rjy5k9ruLL
	 XmlRPLLmjV3EhZLg4eHjOCtS/JmoneGhSG+1J6YIiX+Hzalgx7imR29VvHBXSEt1a7yQp
	 +72AWuiTAy2L7Y7ZORiNboWjs/IeVH7qpAdUCKNTxByoCNVsNmQqu2bNCcQpmnNIWyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=h5EO+r4a;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBCA9606A31A
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 05:20:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBCA9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=h5EO+r4a
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e977109392so8405945ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 22:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792819217; x=1793424017; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4GLuOUeqEK6qd9I17ORJDYTZ4CpL0kgFtBJTA57pHhw=;
        b=h5EO+r4aTYV6LkwAIdLngJEdFdLKmT/auixAldCoc7KanbcF/Ey0bChyjTMe/NphfM
         OnRz3JSulI45FAW0zMXVtLthka9wKo195UsjguQHIDqkX64IJ1IovSLTnAX2+6gy0QcH
         SBA/x3eaMMda1Z+/vNKNsG/1loR9uXLa5dmtPSoTRbdB2VxtXwb8MFHwRJ1NSLUrC2Gb
         C9tIdGL1eOiZ3ueCBtB2BdpyqBBSMjk0VPqkrVepi3AAErAgc0+AFnY+ToPV0LNuoP8u
         vjofGrldZc06N7UXsZ9xnQiDbzLjJvkjvBaMsB+By/Uw+0wCcsdiEoIhak7xHzlJP7Bj
         khkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792819217; x=1793424017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4GLuOUeqEK6qd9I17ORJDYTZ4CpL0kgFtBJTA57pHhw=;
        b=trsGNH/+iu9hvnhDZ04K23ggPUpfKETEEwImElmfag1occbwq9RIeNP30gHo2gP/fV
         p2xOltzyEosYUTA6XiAP8RIayEDZ3Dvi/9Fvxr8RI5ODrlTVwNEuqIL+iuY5DKy0Hw4S
         ZOHSbq8VLPiGLgSvYVeu+8LKlOZFky09zjrl5LYfJNTgqoj84+eMGu8o28JjHgkOo+Fq
         MBH/rjsmzp9eW9MhioutD/4qA8wHdvNeaCfLiGXVvonYoAaIeg2EvGrHNMqtxmyKJBD4
         tVqH1Nn2Hr9uWNIm5HK+EB9c/UppB57DyuUJCRFuCeMbqgeiZlcVq4lhWrH05jzj5Zbt
         wdhg==
X-Forwarded-Encrypted: i=1; AKwUvBwZZAX4bm24q9tklz4TkTOcXy6ETJlxYaR7EksYJA2NivT01YqePJg2wzU90j5JI84tjMf6BWRUyRpxjp95@vger.kernel.org
X-Gm-Message-State: AFq9FYIyPGI9oW+UCZ9yt+Ta4hHir3Ci1Ghafak5CyHKIUm8615Yycma
	kBEoVq19IJtNIMQjRtFC5piyS9Loc/QhpBdi0YE1eS1yuw4oySrUVeC45DDVrLSQM2rUEw==
X-Gm-Gg: AYBFou3hJ+a0COhF1Yfu/PdCdoEvx/V31hWWaljiTE07hFy8ehpMgQGvC0REIeVMsYH
	rJXjZ6IjqAuNdeyZrMLCtqd7sqaejnLZlZigYB9baMJ63K9cqicHVqQ3HfNhitPetOWhJ+zH4a3
	M2JVgwRwz9F/I0NbdvsHm59szmBnKSCDXze213KvzIgmQq3INRZcvuaePsOSXRHF2512hhy72vH
	KloNm3f9UlyHBSnr8ExahBkIX2n2c4cSN5sn+I5r7Z83eZS3k2PM7VqtdjQaTcQauzeDf0fHNks
	2FYSMryk7URTRJkyaj1nRT1lFIsZ7KC3nWRRP6Uy3Zl6omrCsbP1od2WM4C5mJxOEue0/g2JHwh
	LjWAjRuEx3rjJla0SzV2W+iRvfqX1hyei00UdSrrYM8PfIIYp5+1fAcAFx9orlJWBeRfSSmw9uN
	mk+z/pAcLoz0SlnpWfELfnDycmsTIiwFfpmUyAmUjgimCXazppV9MHQUHCPaoI0lK/PMfwSvW+n
	ct86L89NFPUQJNP0s5zPE8fgw3jpEZg4qRK65wTRM5qCmuv2yZrVvUdv+W2PQ7Z8rPrjnU=
X-Received: by 2002:a17:902:d50a:b0:2e5:54b9:6b5c with SMTP id d9443c01a7336-2ea9c66bb6emr9292565ad.20.1792819217100;
        Fri, 23 Oct 2026 22:20:17 -0700 (PDT)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9b14c30asm2701535ad.36.2026.10.23.22.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 22:20:15 -0700 (PDT)
From: Joonhoe Kim <26rote@gmail.com>
To: Val Packett <val@packett.cool>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm/dp: hold one runtime PM reference per plugged state
Date: Sat, 24 Oct 2026 14:20:11 +0900
Message-ID: <20261024052011.1358-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <c1f5b813-4228-42ff-94ac-2ea6533328f2@packett.cool>
References: <20261007155848.106-1-26rote@gmail.com> <c1f5b813-4228-42ff-94ac-2ea6533328f2@packett.cool>
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

On Sat, Oct 24, 2026 at 02:58:25AM +0000, Val Packett wrote:
> This part (msm_dp_hpd_plug_handle) is now also handled by the IRQ_HPD
> series:

Yes. v3 is on top of that series and keeps only the detect() part.

> * if we "find no change while unplugged" (!was_plugged &&
> !priv->plugged): no drop, is this intended or a leak still?

It does not leak: the existing put in the "if (!priv->plugged)" block
drops the function's own reference in that case, and only the second
put depends on was_plugged. Agreed that this is hard to see from the
code, though.

> * use a guard (probably PM_RUNTIME_ACQUIRE_IF_ENABLED to keep the error
> check) for this function's own reference;
> * and use a plain get an extra time when setting priv->plugged = true..?

Done in v3: the plugged state takes its reference with
pm_runtime_get_noresume() when detect() sets priv->plugged and drops
it when detect() clears it:

https://lore.kernel.org/all/20261024051952.2006-1-26rote@gmail.com/

Thanks,
Joonhoe Kim
