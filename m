Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792810948;
	b=y4OT8m/LIJnhYjrufmyWlgjXQaoihxFJGm82hVhv3LrQvwBfLn1ShQolFx3FOumkD4yC
	 hzJZAlM3SddydhsE9nxMl2u8BPWw9jA1HekmI6kpJxLcmYP+7sMBGr4n+a2ClTgEi4S3A
	 Aoaj9D4TCx/n5MVt1wIcDPIysIDjRPY1ctsosvu/nHKugWyDwPl75sAdJA82yYxyXgSh6
	 d8UrwWLIlKaNPU3KCDGWlfJnG+NMhT8AsJEid0SatXB+vnBgb/nYnopq2YYX5CpcrsIwz
	 xUQnfEcjQLTQ7ftjz0o3gD/zOmzwnYur9r7EGgGd0Jwa5VVm6qbIof63nSGCfoTCVSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792810948;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=19hh/+WHY1QppPzIy1oNIREpwHyJPWnwZ7GJt11J8h0=;
	b=i7lb60uuvDpZDzDVpjwDN03ISL+ogMfpdE9vHJAZ7/7zZLO8Mb0X9T3Q0RGQotWKsxsO
	 mVABAFmGR4Sdn6xmXw7LpKxFLqNjppAZcFvHardHJACWeW/fIGdwc8M+5J7aSclNEuXKN
	 wOO+ge2iBVGGIBGpleFUbkNdjUyT9/mBeXfkx9eO+coB/Sfy8PefCfleNjIK/sh5Hw8Dl
	 AHIzt5GYqxyQLre7MMdz3iItIvfuJr2s0ts+BmFsLu90OoCkramOoLGxvG0H/yXSLDOMF
	 Jb3Lt8aZ4JXJmfFjRl1yeuZdHAlbOcM6z+nZOoO8KnWsAjlmrNb/BRIT0UcQQzkkvuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=miXrIXDO;
	arc=none smtp.remote-ip=209.85.161.45
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4827560A262D
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 03:02:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4827560A262D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=miXrIXDO
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-6df7f544919so867291eaf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 20:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792810946; x=1793415746; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=19hh/+WHY1QppPzIy1oNIREpwHyJPWnwZ7GJt11J8h0=;
        b=miXrIXDOK8g3how+NK4ph2kcI3NyopKkZupvbcGiCGo/73yTn1jSe3WwhkEcAfpg0Y
         TB8lW7EzeBvYWKVhI5M+YK1nVgKTgZzzZ8BclFhEQn0Pi7wCKcrAQevZH7ahf0i9/iaN
         cLErMFiVXkwWV++StnqsyNUI75X+jTGOeW3bhgL7dAHEPEKnSM5vg7PleJoKsa8Hz+Ns
         kPQbfTFkVnbbi2cpqF0mquyRXU6MGqHVbTH2ob1Mxyg32HKhpJBsWR5jk0fG1At6HtqS
         sacHncJTARw7LB+DRzg1U8WMe7BUDaV4K2npWhDDbYV7drZxvYmlR9ltvsWGuRCX5oCp
         LEDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792810946; x=1793415746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=19hh/+WHY1QppPzIy1oNIREpwHyJPWnwZ7GJt11J8h0=;
        b=HmKf5EUTTV9eivn+Tl0hH15RkvbUmswypPedmmRULLpou0FpZ09Rr0YeNX7++UT8zz
         4rLXaVGz3PIPWEiY+1JV0q1jnKYv1p2nngt5z2/d+DFWNZR+X72HVu/XhcgpM/IJYwhW
         jF7vpFXjQYbC2mHkX54E+arFONlAB04DxQ1NppKz8nIKe/cybOw6ebejJi0Y21naiydL
         kKjTyZhASPryyQVrONv+1P/L6WQ4AMfeEO4FaDN8IzSHM9VGvSNhSiWBlV8komYoWor5
         Eu416jJuuoJ9N9A1+Uq7jjT/v6Qhc8/BFM9zn8WRadNKemHwInaD/e0bcCo+/0WyTl7s
         m2Gw==
X-Forwarded-Encrypted: i=1; AKwUvBzY3LgGjNtu2QZ/K587l+5HDs7Po2CGSXOB9i4Rs7ee8PpC7OyDofQGMH0Q21VhVfWkf0OaYwONNBdhuqFq@vger.kernel.org
X-Gm-Message-State: AFq9FYI8/eN0+qv13myMnISjMjF3ey2NVYI6YZjnIIBdqIq7eMdxCgKh
	Sp2KuGvb5pDeuCakMnX45/+aP61C/QXCxxLMti/nj/nr0lDQ2vvTWMqN
X-Gm-Gg: AYBFou3dKfwlRawi/eD2EEe9WIkhYliBPpxpyGSC7YFm0gheE3z2vBkuf34XXmTzzFb
	uux9g+llFaFcB4CDbI4Rio/A4jyZOA62N0uJkKW4f4yvB6kTY61N7KbagLfwr8OVPbudc4JuwI6
	WhHm9yES+5jKiqNpC0bgZDwdLPNqEOfHeXNwLx6PP/lfWNaKAxKbvdnj1HawwEsmdfQPET5Yfe3
	l2ecDh4M23FtncdEFR5rlsp//U9MqcNdE93/gl1q3WLvAM1x8QVArZrje/GSqHA/HVWnYu95P5u
	Jetajk4GU80II30XMbGijJunmck31oVXbtEnSCEbNgXz7dEujXMLG2R4mcSug4OvL6liCZYcnP2
	pm4KyAJfd/ocy+ItCt0l87QSz4Nj+w14oWrmdb0zW6CagEzZP0oCvsWeJT7McledhnjtcrBxOfc
	LUe3W+loE2S3KCoHE3D5h360PUCvqMDLRW+OYpm/H+0pMkiciB4PtCQcCVmhox+bZoAhQVUtz6c
	8pJW+pZVUCN3w3G6J75uBrJs/TGQgVrPDV4YMmn/m7xAa4b329x2LNCswHAdDLPsg9rw51xpsuc
	DViZ
X-Received: by 2002:a05:6820:f012:b0:6b6:93d6:afcd with SMTP id 006d021491bc7-70ba0e13073mr403628eaf.26.1792810946228;
        Fri, 23 Oct 2026 20:02:26 -0700 (PDT)
Received: from jeffmr (63-152-17-145.cdrr.qwest.net. [63.152.17.145])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-70b9e1fa334sm824552eaf.9.2026.10.23.20.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 20:02:25 -0700 (PDT)
From: Jeff Roach <jeff.roach0@gmail.com>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
	Mahadevan P <mahadevan.p@oss.qualcomm.com>
Subject: Re: [PATCH v5 04/11] phy: qualcomm: qmp-combo: Ignore Type-C orientation for Glymur DP mode
Date: Fri, 23 Oct 2026 22:01:29 -0500
Message-ID: <20261024030142.13643-6-jeff.roach0@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001-glymur-phy-v3-v5-4-3848c2615d5a@oss.qualcomm.com>
References: <20261001-glymur-phy-v3-v5-4-3848c2615d5a@oss.qualcomm.com>
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

On Thu, 01 Oct 2026 15:04:21 +0530, Nabige Aala wrote:
> Glymur platforms use a fixed DP lane mapping and do not support DP PHY
> mode reversal based on Type-C orientation. Add a configuration flag to
> ignore reverse orientation during DP mode setup and enable it for Glymur,
> ensuring that QSERDES_DP_PHY_MODE is always programmed with the
> fix mode value (0x5c).
> [...]

Tested-by: Jeff Roach <jeff.roach0@gmail.com> # HP OmniBook X 16 (Mahua)
