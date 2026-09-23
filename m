Received: from mail-dl2-f7.google.com (mail-dl2-f7.google.com [74.125.229.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9685346E7A
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 08:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790151909; cv=none; b=BaQs8dka+i7zDEva5CIqfc9rJ2kfa50BWuXTzNmS5F1XAO7FByyJIePlQU8fh0j+8pGQKS5d5KkgdwXk5nlYHJ/k/CctLI6jGB365R4AHadgenmyGpHS83TIxSyDnvrfMw+L92gFBD4nCb80CBFMyGMo6lEqbgLFBGmeUzTYDpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790151909; c=relaxed/simple;
	bh=Kp58vexdkb6CDSoliXc7c0/69wiNNnH+JRab980sQIo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NOowNFIIuhuH6Lg33Mhj/YClxdaUiDjsdjx/Y+xHqF0EpvqlHGvbMf7tpYIQEoB5p2KTe5uKBfCZRsEK44V3YuCbzkiLYXVFnyN3hTaK8VzBD7UUVn3rrOnB+LW6veKZp/E14KQ6wvDTTkPT6IwgfqMOitwSMwQ6kuCh7z/ZOBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r9i13Ljq; arc=none smtp.client-ip=74.125.229.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r9i13Ljq"
Received: by mail-dl2-f7.google.com with SMTP id a92af1059eb24-1433e7b05b0so51473c88.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 01:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790151907; x=1790756707; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Kp58vexdkb6CDSoliXc7c0/69wiNNnH+JRab980sQIo=;
        b=r9i13LjqfIC+nlSWu+cTyjfJTGCs9nzcetdMAnPoqlQyvq+ibWVtJIVquwwMANVu4N
         ycK40yJw0O5bAY/+X7Wnyk67ZOeVW7lFa4MwY2Bh7DyKyk0LVED2J7Rxc+3oSINg6eYq
         HUkrHju4091LshHXR9cSA8dvSAWsrTRSpfR+1vB0o/B+WvrjcFeGkIxL9JRGNSCrsW6V
         eBc2g2EDCiym1A0CIgDsS4eKOd1wVRQ98ruIdOUbGnJMNlPWKQg615mHLCNj+jZCX9su
         LoJzp4YKYQMa8fdUSINNhriQ6/CVLm6CRDjeBK+0Va0tA3n8vasIdsmiArRCXWjcdFKf
         XICg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790151907; x=1790756707;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kp58vexdkb6CDSoliXc7c0/69wiNNnH+JRab980sQIo=;
        b=0Pj0DRFj9p1Y5S395EdDaAtK0WOAr5pFkwTue3mtJPQ6ykrb7eMdxT2aUwbMxKYloM
         CEKuTJih0zQ1oN74Ahl9VF/RnBu8uRYiEcjSOaNl3h5s4aZiJxSxmH9/2NevA19Iz/IL
         LAwvcSB75ZLyh8qbHLPrH9hwEFkiUuebXpH/pppJlDLQP36gkIVVJAHF+TmwKY8k4ou+
         Hs9pNc+9cPApb4siywU7oPjtCVGW7rXnMWefCfpzv/GIAB+pluU0JVbyDLN6dXAsYd6s
         xc+rq/4BPfmChKJ5adxldWZYYNsRFlYVzERs9scQnp3GCRY72P1Zn2LTJ/Vq2v4yN+cp
         WJsw==
X-Forwarded-Encrypted: i=1; AKwUvBwBXm7sWwUn3SR4j1if0A5l58YWI5KJ7vi5eFGmvQ+SKJA7ERZZTFo9mqoPoOzaamKd47a0a9e6FKxSCO9Q@vger.kernel.org
X-Gm-Message-State: AFuF++mc1oFswU1eZc+RFAxPx2shVyoXfY+QjNmnsc26QLSvmdhLKsRP
	gOL1B8A4sNZzGSQedBjRGgPWao02qtCYGmxsewwj0/OH0hgGHXyXMIE=
X-Gm-Gg: AYBFou2v+EcoAUfPtLqTkPhotSUSD+Rw+ZvIrSwFJ+orCMsDXTGkiMu4i78vvzzCSBd
	IBdjCDsFiGs3ZiajGurTOS6vkFugxTcBGPEQaZkn3l95KiO7y5vxDWNZUTd2Z2FAyODDCUz5XbR
	W3R6SELYBqLq+WLzdwLK6OLml+RW/NIXxfk99hBvioUzWnEcJyc9UbaepWnzUwAeMVIp/CAgLS5
	bTQxuQCaBRGgbIs8Guy/iWaLOls0ptTXB5qMLvnd0b43nkh6cYnOUn+Om669Zx/nG7Z5Z9WI4I4
	e0oQ0GlGt67xvGXKSfTkXdZ2IXloxZ17cczvvXoXdC1ZmEgKhssdXtipw7bbK1UvhGTAb/9Fn6I
	PI5YswwWAEn4yjrfPkn8BKuCR3jNZW6fDSZld6AMzHIILMoI5xY7yMPiE+rklIYCAckikckS+cu
	zcZAIMuzSEodeJ1nDnFcIipqd/VnVWcXULuE3DulFqDuogBy9hpvodMeashZje1/Rg/BBrX7jEU
	Mb5/aZQz35jQw==
X-Received: by 2002:a05:7022:7e07:b0:144:c128:4c4b with SMTP id a92af1059eb24-144f91cfeedmr2268090c88.36.1790151906746;
        Wed, 23 Sep 2026 01:25:06 -0700 (PDT)
Received: from murali-Aspire-A515-58PT.. ([2a09:bac5:3fb3:11cd::1c6:c])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f983c5a1sm7587951c88.7.2026.09.23.01.25.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 01:25:06 -0700 (PDT)
From: Murali Krishna <muralikrishna2444b@gmail.com>
To: srini@kernel.org
Cc: ekansh.gupta@oss.qualcomm.com,
	gregkh@linuxfoundation.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Murali Krishna <muralikrishna2444b@gmail.com>
Subject: misc: fastrpc: is a ctx_idr IDR -> XArray conversion wanted?
Date: Wed, 23 Sep 2026 13:52:05 +0530
Message-ID: <20260923082254.15312-1-muralikrishna2444b@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Srini, Ekansh,

I am new to kernel development and would like to start contributing. I
do not have much experience yet, but I am willing to learn and to put in
the work properly.

Documentation/core-api/idr.rst states that the IDR interface is
deprecated in favour of the XArray, and fastrpc's ctx_idr is still an
IDR. I have a conversion prepared -- XA_FLAGS_ALLOC1, xa_alloc_cyclic()
with the cursor kept in struct fastrpc_channel_ctx, xa_load() and
xa_erase(), and cctx->lock left as it is -- with no intended functional
change.

Before posting it, I would rather ask than take up your review time: is
such a conversion wanted in fastrpc, or is the IDR usage here fine as it
is? I have seen similar conversions in other subsystems declined as
unnecessary, so I did not want to assume.

I should also say that it is build- and sparse-tested only (x86_64,
COMPILE_TEST, W=1 C=1, no new warnings). I have no Qualcomm hardware, so
the converted path has never actually run.

I am aware of the accel/qda series, described as an alternative to this
driver. If fastrpc.c is effectively in maintenance mode, that is a good
reason to say no.

If the answer is no, I would be grateful if you could point me towards
something you would actually like to see worked on here. I am happy to
start with something small and learn from the review.

Thank you for your time,
Murali Krishna
