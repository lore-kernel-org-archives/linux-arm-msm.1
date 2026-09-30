Received: from mail-pz2-f18.google.com (mail-pz2-f18.google.com [74.125.228.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA8951C337
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 18:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790793554; cv=none; b=LRWPxGmtN/j86v9QBF4AP8nezakEnQdBwqEpB4rLKfO8/O54ZoWds27sPITZswItDIB7TpqY6C5t4TZiYs3l4OBHJrODjSZTaWKkI77Nqq/OYjAk90i96KQNAMx4UQFaWiOLjBxCzzQmQ6VF+1CgmNTolXu3JBnjEzENYO17VdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790793554; c=relaxed/simple;
	bh=kFAHzsauXPIyCr3E+dyQQ6Cgg9yLC/fJTOD1fB8VlVE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZcDKSrmvpEYtan/uRMC39NqXzqq5mgt9f1TmVDA3+3qOC+Zn361YK9T0ZwevO5qi6wSYCfOecV+o1xlipQgJeGwV+SBa3cDuNnP6xSv8B1zOAZxMnIvKjvbYtRKdOPeUT22n2quOV8nM43gD+A/Gr2+p4fpk6ZmEz9CdkxA3qNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Poq8gseG; arc=none smtp.client-ip=74.125.228.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Poq8gseG"
Received: by mail-pz2-f18.google.com with SMTP id 41be03b00d2f7-cc4bdf8abaaso3394681a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 11:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790793552; x=1791398352; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kFAHzsauXPIyCr3E+dyQQ6Cgg9yLC/fJTOD1fB8VlVE=;
        b=Poq8gseGD8LaGij0nigS9Y9IHqBWyEZ4F30dzELv7igsqx24OqcINSBUy3F3jACavz
         OHFnvTkS7vmGF/t0AZMZIueGqFNux23GZWE7LCi/7ALwBMkN74TWPoEBZNAy1m+z4H/v
         0QaYi4oT52vMetNmNfADenbxpMZDXAVmR5dowevZ34s3hvX+I1WSSslpzyXAqVzIpkFD
         5+kMRs5FQjNFFxvyYRSHlYajMITtRFJOTPzH02e6+YKVOTMeNXep4aJE/iuu8FDF1/zw
         pEU/0ARNlA0OzyzHVEYcTIZ/WMWVJm8M5iVeA0LWAa77MLqKa1nvtmlLwlDWYs8aDMnA
         beMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790793552; x=1791398352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kFAHzsauXPIyCr3E+dyQQ6Cgg9yLC/fJTOD1fB8VlVE=;
        b=P2ioF2Ct6J5RcrydMW/ZOY5J6pfyPlno8kvoIH8b2syI3Bin/0AgKM0KEpJnkAuCLc
         52gSkTt7RpVZM7WMlEiYBgQ5KEw7PN2MFf/qD6couhyK8gDKeSC/jENG7xy84Xz9bQPy
         /s3KMqXlQ0zGEvaTFeIWX+ZjPmfLkWDlvwp/0sakiEfjbyO85snxjfVZiV5CMKQ3obmi
         BjfiPNt/HQC9r0pB9MQ6m8f5QCKjm0S3EMkA4zM3FLr6yHu0ELZQpZmmxtIEZTXD90OB
         Ip9Fovum47rOlPb+wUqFRjD3TiT1OzGpJPxt5qVomPvZc4WmwUZ6KhVywGa+5sE0yJP8
         Ngqg==
X-Forwarded-Encrypted: i=1; AKwUvByCyfnlQLqV3/ZBoJs6LQKBKoy0L3zKILbReYhOYqazD4TpNwrh0f/TYqBP/dmT7zim9NctV3jCe0ytnraW@vger.kernel.org
X-Gm-Message-State: AFq9FYJckCVjxGlPT8LwriXB1WqYt1Ut/WIKv3b+h6CFGm8KoF9jJhQz
	67pzJq3EaZc8ePUzJADGkGxjcadPKfsGsi681cwQ/2QRPgB+KgzcybaG
X-Gm-Gg: AYBFou3uU+EXd/OnxvCgcyBBLEfC+P2lxVcYNWp04MlMJXS7EvwnqjigMuwGsi9Xnm+
	9/uePsxUdMK3Qlgp0qgFSAAMsE1Jb5v/PmaeF22EwAVIh336PzwSDiV+5GvGSWf7rLrrDA5Fmm4
	IJptG1uRvKy4X1dg27lrHRE7bNDb1+TyeGK9ba84DXFBe4AFnlmkLbzYKJKlElDecWODtzCu7sH
	7R9ErcS6YFMs/78nXVBr77QDNyVfpugBQD0YpR3emCJ7FoaDuSDmbsg+sf/gMzHrgxq5INY9oPf
	PBM7q800ESL1OnktwcFaboHW+HJytLioXOXgLI9tuSSg8BGBrVKZoz46OdlN5pcTW0PU+Wa+Z2V
	tdLEuYd9rCeMdMo5GW2d9R/PhR3ZGCOJv9+gKenmtlW3V1EJ8FiuzCMmGVoB9gUZz5Hw53LZDH9
	w21s7OI4ctgyccHyGBAiAS44Kfw2SNYOvqclEvekYfZgvOyCMGEEcEKdcDADEUaX+aqey8uYeka
	vuHcarcROh2ECHKoWuXCz31MfIH0HZT1APHkgBglnkQVx48YAcTZI1uklMYMDfOTI6pwdSLqNKS
	DaojwbUJlCgRVACA9TEdtpN3V8yRaMRFqylJ
X-Received: by 2002:a17:90b:48cc:b0:3a4:c18c:b894 with SMTP id 98e67ed59e1d1-3a4d18f52d7mr1859734a91.52.1790793551779;
        Wed, 30 Sep 2026 11:39:11 -0700 (PDT)
Received: from rahuls-x2elite ([157.51.37.69])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f4419ff9sm532916a91.9.2026.09.30.11.39.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 11:39:11 -0700 (PDT)
From: Rahul Pon <theflyingrahul@gmail.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Jie Zhang <jie.zhang@oss.qualcomm.com>
Subject: Re: [PATCH 3/5] drm/msm/a8xx: Add Mahua GPU support
Date: Thu,  1 Oct 2026 00:08:54 +0530
Message-ID: <20260930183855.1184-1-theflyingrahul@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20260925-mahua-gpu-v1-3-0fa0bfd8d315@oss.qualcomm.com>
References: <20260925-mahua-gpu-v1-0-0fa0bfd8d315@oss.qualcomm.com> <20260925-mahua-gpu-v1-3-0fa0bfd8d315@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 9/25/2026 2:44 AM, Akhil P Oommen wrote:
> From: Jie Zhang <jie.zhang@oss.qualcomm.com>
>
> Add support for Adreno X2-85 GPU present in Mahua SoC. This GPU is a
> smaller version of Glymur GPU with fewer slices and smaller internal
> memories, but shares the same register layout.

Tested with this patch and patch 5 on an HP OmniBook 5 16 (Snapdragon
X2 Elite X2E-84-100): the GPU comes up as chip ID 0x44060030 with
15.75 MB of GMEM and the GMU firmware loaded, and with Mesa main GNOME
Shell and glmark2 render on the GPU without corruption.

On qcom-next the a8xx_gpu.c hunk needs a one-line rebase:
a8xx_set_hwcg() there also checks adreno_is_a830().

Tested-by: Rahul Pon <theflyingrahul@gmail.com> # HP OmniBook 5 16 (X2E-84-100)

Thanks,
Rahul
