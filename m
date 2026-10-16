Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A30F4611C7
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 12:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792154466; cv=none; b=NIiWAqNcaa8UqxAia0e0TpGwCFh/Z+pYz/TQ/oaLa7onOSO7wHMS6GR7q85QepdkeFF/7CXuMHCpB2QsNEWv+VZ13IKoehcicvZxpqsku/g73oXSwJPhxLRBk3Tue7M0xjMuqn9vNxPrF+PUkhomv9JeyGT3LJ6Icv7nX6yIV1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792154466; c=relaxed/simple;
	bh=C6glWX2uIKdCMrFYP7++oE4vVl/Eo+Hy0RT+CSghy+8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GJ8+iK1ojdQCc8gpbx7iWQzVOCc/HRUnW3GfBzlpgjox/OO9iHcFGWTiihXX5FzmH7J3TzKAMhXEIv9kLxtncEf52oLqXcrSd3oQdIdArUuJZMVU5nMTXK3HTqNHxXe/q9NQ7W+9tsgzYQW3Mb3IaVUlCW7zwcnKTHF96jz75ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mSkoqAfx; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mSkoqAfx"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3acdcfa2bd3so287300a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 05:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792154464; x=1792759264; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0kuUNpKGpHmxXwciJw2YT+q4uhPu0mOIC0xkYVCIOFs=;
        b=mSkoqAfxTWUpRRhqkydbnqvjNKCetOi771fiWRWDfrfZOUBcNn7tyMk8LPpFXXDFbG
         M0V70XGdgAzKQ4q/YGhTcYjUjrnwTQFreali5Wl2Z0wkvHXdOiEj7TYyIidnzEAjmHkr
         0KQdO4SGk32kMsiHIGFgYcMC3zMK7QenvHrEX1GtbjY4Xi6ORwZIiIwBe0J/72oqEI8+
         UConHhGlfSod45MP2Ev53fRHvZ68QrOA78Cx8Vjqxwzdg2GEaXkvFuYXMIlQcI+D5lHk
         xLt2faWdsjcBpOgKmMxkUFtkeJs05KFbn0gDLz3FpWEU7h42yQ4SjeVl2WWxXekZCwCs
         sXAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792154464; x=1792759264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0kuUNpKGpHmxXwciJw2YT+q4uhPu0mOIC0xkYVCIOFs=;
        b=Qo8d2x4E1+4Qr17hWuR946mz1mGL8dTIsD/iBJ17L0OmZJHr68C05edK6EUuhiFzwY
         DHmEiKF/1DALjKOoksOCVp+pbW9sFWU3UXT6iGcqoMV2LQD6AZspyDF732GMQ8wfeduP
         6XnQLjPkJ0viuv9jud/f4n9HbMlCN7y0U9FvLnn9A4u5lNikNO2gt5fvCocXhnRr5xo1
         /L4Twoho6MLZZKLo2iTBGYEFXsa8VSewHBUnO86IxE/jzt1GV27y2kRgCXn9VtL0XPww
         n/X/sRHHCydIH0r1qVgHI3psKcTtweCpOmwFMAPYzC4MuYLTOjO5cMtwUf7wlrLqHygh
         1JjQ==
X-Forwarded-Encrypted: i=1; AKwUvBxVc431zwuLt280KoLMYFdJ2r1qZsFa4Cfl0oQxapbDW0tUYUmp3TUhhw9SSUwpc7LUrft/QqZ4mJdKX0JW@vger.kernel.org
X-Gm-Message-State: AFq9FYKauFYDH2jSl3UoeQ1JDNKkIDvnz9qIW9iN1EfpWLOu/FcQxZiL
	HWQQGENK3SK5cHBSu1ctzkaCQI5WMiyW91EJgzWVRD1ii+xmAFnYDYEv
X-Gm-Gg: AYBFou23d2xpXAzxufoamQVdSUm9IyJOsj1eiEdy04h8Irb33SuhFlaGMAaiB+q8qhY
	kkFSz5Cy1/JopnWF4rrReHVMM6UC5eZ3XXRIICqbYfeOM6ypc27Ig/hHrgBsWflGpB321Z2hCyW
	AQ0HQTn8FGZNDKf2lTkVJJTv2AqSYW/7RcZXeiQtEh/kGxbZboKL6JXX6ooq5Kkyes4e07KmK2L
	Q2JYBJB6XW8oJlPqd3DC0cnc79CkFiBtQhVI9eHz6DSrdIqyCSj2RJ6gXXYAYwMkqsJ6QvW6n05
	Y9w26UN6X+5YCV8PUh6x9ZDHVu9DGPCP+mc553L5Y2ZSubymsLo87vfDxb7ATif9WW3plKPiXUk
	eE21v2SPUezsdh+GcR1tbESp5e/OlItwT11jrexlu1tLIhOkJdmcQFOoKTkwyOlGLLLhNFwzLDT
	7+C8m6qzsIBKUXwbykp3dfGzH3pV/X5q1o33iTdWRGkjqXc0zydUX6Y3icvHdQ0/1YOchwCoJBt
	d8eXsdsI6WcIA==
X-Received: by 2002:a17:90b:3b84:b0:3ab:1b19:78f4 with SMTP id 98e67ed59e1d1-3ab3a3a11a1mr21060267a91.6.1792154464234;
        Fri, 16 Oct 2026 05:41:04 -0700 (PDT)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc46ebe40sm4180541a91.6.2026.10.16.05.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 05:41:02 -0700 (PDT)
From: Joonhoe Kim <26rote@gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 09/10] drm/msm/dpu: only reassign resources when the encoder is reprogrammed
Date: Fri, 16 Oct 2026 21:40:55 +0900
Message-ID: <20261016124055.1232-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20261003-fd-kms-fix-smmu-v4-9-2a44d4d8ac77@oss.qualcomm.com>
References: <20261003-fd-kms-fix-smmu-v4-0-2a44d4d8ac77@oss.qualcomm.com> <20261003-fd-kms-fix-smmu-v4-9-2a44d4d8ac77@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, 03 Oct 2026 03:30:24 +0300, Dmitry Baryshkov wrote:
> Reassign only when the encoder is reprogrammed too.  Enabling colour
> management still needs a modeset, as that is when DSPPs join the
> topology, so ask for one in dpu_crtc_check_mode_changed() and only there.

Tested with 7/10 and this patch on v7.3-rc4, with out-of-tree support
for a Lenovo Legion Tab Y700 Gen 5 (SM8850, bonded DSI). A compositor
sets the CRTC CTM through the legacy property ioctl: NULL -> blob, a
series of blob -> blob updates, then back to NULL. Over two such
rounds, counting msm_dsi_host_power_off/on with kprobes: without the
series every NULL <-> blob change was a full modeset, four in total;
with it only the first NULL -> blob after boot was, and the blob ->
blob updates and the clears were plain commits.

That tree also carries out-of-tree SPR support, so for the test
dpu_crtc_needs_dspp() also returned true when SPR is enabled.

Tested-by: Joonhoe Kim <26rote@gmail.com>

W=1 warns about the kernel-doc of dpu_crtc_check_mode_changed(): the
new helpers sit between that comment and the function.

A CRTC now keeps its DSPPs after the CTM is cleared, until its next
modeset, so on chips with a single DSPP (SC7180, SC7280, ...) another
CRTC asking for a CTM fails dpu_rm_reserve() in the meantime. Maybe
worth a line in the commit message.

Thanks,
Joonhoe Kim
