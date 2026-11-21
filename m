Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795220192;
	b=mO8VrlSZjutwQ6OWAIZR19WwmzAE8zoEKD3LkP71PqIKEmgsrLHm+yTwBxKwyjpe/01v
	 liqOoPfGtslYkcy5vmMG+sHAhIIK9wEyKCLbJLDWdE7f0ov2m14YJRdnY4wqscpv3g4XD
	 G5Ou6nWlnxO/sOxgb8DaiYeDo64k1jthng2LclWPYTWIiu4djy5FxDcl3YzGy4izA1uHV
	 OkD4vkn0ZlUaZz5pktJD7crhT6nT9pp0bDtjms81pGscOSx7I4wBItUnKBCzZThaYGgq5
	 0ZXsYS3F61ngTpYbtE5HI+koqT7tNhHhbr1NY08CJr8PAJVpcI4Im+A+0Y7TjbNBobA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795220192;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=74mngtbu0bh2Wb5wAzXvu9Way1o05aGhqD03WL1B//I=;
	b=g3yyhg8uVSTxGgRKBKZzolfZQyr1WxSExcsNe1SqIvipo/+8eQqvnDTMMmiTvnRKlYNP
	 Csvo0J5p/lDc7jkLeZgx4fVtUg5DOFukUZcJMTUElY96wxypA8o0ueZalblf9c7nYIpOo
	 OScplgVMMpB9ARK83tCQ69Sxb3zwXtqHb9COPF2gJk5qNutMwuGWdOZ8fZFSzvqWp15K6
	 jnNMjGsWptLfZ0/fajIbw6nY3vSor7rvw18b3Eb5otmzPYj+6dg9ZCnw7Iz2HpVY/t5V9
	 LChyLbZ4aYqayVpxSbdi/3fms/jDjh/RBzY1XbSBX2jusXx0LTWGDnq08LRB35S/75Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vsEY7aZL;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 154E1606A6A9
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Nov 2026 00:16:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 154E1606A6A9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vsEY7aZL
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c511cdd5a82so185289266b.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 16:16:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795220190; x=1795824990; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=74mngtbu0bh2Wb5wAzXvu9Way1o05aGhqD03WL1B//I=;
        b=vsEY7aZLbfG4aR+YOrrvDrHTqcmqaMe2zCRckmgtEst56/mRWDnX9GixIyJYZZ81ll
         wZoTufJSdYzFDGoaugULowvXnK6Kuw79k7WM94qssKr7pGgNgl13bcYrC2tK93dBZFr4
         cVCTTmnWeqAJc1sM7zirDtOnNI8x4yrWuiyVS0zyB9g8uHd1EIaK0DFt+w7Ztbb1fOD1
         X4anmSGfTJzXyxUTxIn0dGE6/xG6IcdVcTq4Vzs6aWnVV3C1ll4FKG5BIvREQK7X77SW
         Isdt0xmMU0BeZBshzkWVpeRBlY40dzKEE5qWfzTPmL3eKO96E/mIPwta/RvW83VYCySG
         DVxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795220190; x=1795824990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=74mngtbu0bh2Wb5wAzXvu9Way1o05aGhqD03WL1B//I=;
        b=yTGOmku9jGwHci7aYaBjU9L6ZwZQBhvsX8MKyHkCDqWuiVERwaP1SstKCb44FiMf+9
         9nXvIIzHSjY1wedNJmwxWLhPd8fCnO071CJOM0asBbQP53AE4DN0HKzdbt0WHDnvoBYR
         Ja8Gi9bk875LDn7aYCvxKfNtga/9h0VO0CKXDpzQIRKehRnvhVWpE7lY0aOyaLFTVEg6
         vJfJIi/jlfBWZRtkFOcspZyxEH7JHaiSvT6JWVPK2Y/Ii7t86EFds9CiirohjfQOw5WW
         x5Uw9XrepzGrdrbJQgMV2Uakt3Z8Vpv0j0syFghCzQIAE4ItgKmBoYH1HZdjflR8R0YD
         N/Ow==
X-Forwarded-Encrypted: i=1; AL+hErFEUpSRnJkuAVP2+5p1GS8R/x20TE1FOqS1h+3fCboM3ttCkyytzkRqHimPSQw8aBEhL6Fph3TcB+bMY1z0@vger.kernel.org
X-Gm-Message-State: APuU4Z/lYLDW32tXeOS9GX/p3w4lfY2BqOHH7g+Y0T8GUoLOuvggKVZZ
	ZKiZzzicWu6osKpS22C48uvcIIDIIvR202CXaQX6i1iU+UFLHtu7YKk=
X-Gm-Gg: AZFdTZcedGs1D8UmGGlkL+N6gyZ3klbEh66rb1UzZ9UfXP8SfQwyWI/Lq0kvwlTk2pu
	cnjLZC7iw3i6b2xThR3vxvPb/pzUt0yGOLvseG7Wdq/TjI4u2Lzh65HnV0xqvrPJiJnj3eABD2p
	feRZGAoKvATNGRFfUexc+bNdeKG1ur+7hjCfJCfgRhb4Rkb4sGLVpcEdJ0N2hg0gfFClX+Hnxeh
	70TQbx8NZg2A1f1eMA4v7hSJLgWxjxxfGV7/OZQ+uNHcGO8WJr7v//k4dp30DFmtcCSbq04VUfG
	Uz1Iep1qFv7AiaWpmxPSPzBoOFysaWoFZhg1LpHeJsGIyKOCGA0feBJu1tv7hqix2xqwAqQR122
	Ac3EliPHTwDxiV+kK5rrq44d1LPgu9E6j/mWBLl+p9St//JPzVYi8UaTEWo4bFJYRet8STmSnWy
	jCDl44qDeseWeTfmw7dILwLcAFKr9zREhatKcUTzKGY2cGEAe0RFdZ6MajW1JLwyOGL6bS19Wx3
	S09430u0oqdzT8Jm8mGXAZrUaQGzH3s3Q0kPlsWvMKMas3W97IhH2ROCfYZGzPon6PIZypt0S4x
	JzY8e5Qwvl+Sj3boEd7IlwvF1Vws4CALN/bcFjMRj83+hW1Mm9fl2IsLE7xIr7PAk0H4bcmUd+4
	3NLWmLOQnS0VVSUgBA7ba7vNu6MlZg4cJCT/VRNSkGsiPxg==
X-Received: by 2002:a17:907:ea94:b0:c50:aa10:d888 with SMTP id a640c23a62f3a-c513acab9d6mr426725766b.40.1795220190364;
        Fri, 20 Nov 2026 16:16:30 -0800 (PST)
Received: from sohrab-omarchy.fritz.box (2a02-a44e-4ae7-1-c0e-6d5a-8ae2-915.fixed6.kpn.net. [2a02:a44e:4ae7:1:c0e:6d5a:8ae2:915])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae6663esm146454466b.21.2026.11.20.16.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 16:16:29 -0800 (PST)
From: Majid Hajiheidari <majidhhdri@gmail.com>
To: Nizat Mikayilli <nacht@dxdmail.cc>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	iommu@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iommu/arm-smmu-qcom: Add SM8550 MDSS compatible
Date: Sat, 21 Nov 2026 01:16:27 +0100
Message-ID: <20261121001627.4091340-1-majidhhdri@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261107-b4-smmu-sm8550-v1-1-777d0a41170b@dxdmail.cc>
References: <20261107-b4-smmu-sm8550-v1-1-777d0a41170b@dxdmail.cc>
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

Hi Nizat,

On Sat, 07 Nov 2026 21:00:50 +0100, Nizat Mikayilli wrote:
> Add the SM8550 MDSS compatible to the clients list, as it also needs an
> identity domain at boot. Otherwise the scanout of the bootloader's
> splash screen causes unhandled context faults and the screen goes
> black.

Same on a OnePlus 11 (SM8550), booted from the bootloader's splash on
next-20261120: without this patch there are ten unhandled context faults
from the MDSS stream (SID 0x1c00) at addresses inside the splash buffer
before msm takes over; with it there are none, and the panel comes up
normally.

Tested-by: Majid Hajiheidari <majidhhdri@gmail.com> # OnePlus 11

Thanks,
Majid
