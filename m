Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792810957;
	b=H4wyrc9vyvaDA6Tbt+z4g3uNdN6wqg+0pVFWK37sFBGy0XeOGPzIbGf5kaPKmoBAm1Sy
	 bKYcIUUFQo0OXTpdjKC38J+8gnNtPDMHPvxz+08JcwKnAeXs1n6FVoXy0rR9zQuoHDzGP
	 hVPzoVRSVlCiBAjggvccb5gYX3tyvqBPmMKxfuCRg7IsG8MayDLoLvLCcMaV2ykmD4LNQ
	 2voWR+zvjeWzbsRzkPDyHsJCnRIIhLZE3jbljG2XsIzvKufa0TufdLhUuEpZ37UWSo/rN
	 +TGjVWSHjzXH1bT/RFdTbUGhA+BrzT2Te7ZFq8uB0DPGi774KTumKy6qcPzYmyI1N0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792810957;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=5aDf44Gat6Pf0H0w4M0JG4CAOddgF7K2Xbo5NNmzKjI=;
	b=t1xE6xcRHl7Vcbqsp6X6Zh8SamCy5G1xVrh8GPuYD8yoypLSUDPr7CR++/lPcXt7ZORX
	 felBVpFZtZ7v/7nMYUQebFQPiPnvH4vnY7P8reGg8WxP0PpQgiS1iQGU7npD3GVSKEMyq
	 m1BNmwa+aSZhxnUbdlw0cIsW5cudfntEpzF3ySMaY0G4D78jtIBl9zP+GHgzx9WIAggN5
	 wXcTUCX7mSFXZJHAZBIKJxGXR1wt08qUcSD58gll2sXc37hBIKWeoui/1AZzkXkbkRCTa
	 roXAk7FCl6935B1Xb74oXDXvayxiW7Li8GEK7+/T3ss6+9/FrUMprYfbA6p4FHbD3EA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WwEhG62+;
	arc=none smtp.remote-ip=209.85.161.44
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE65360A5BC7
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 03:02:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE65360A5BC7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WwEhG62+
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-704597ef1d8so650324eaf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 20:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792810956; x=1793415756; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5aDf44Gat6Pf0H0w4M0JG4CAOddgF7K2Xbo5NNmzKjI=;
        b=WwEhG62+BnK/G1CmjOKJEAdiw0cztslgqRQMTvvG/OKwJkQYpKybttT8gmQGrxro5C
         MVgBYyYct1m3wZV+uT7b+nKBxwXCgj+/poDJGnsXG3Rio6UJrcGe1OuVzd1X81r7B6S/
         KD3/3aoRVYZu3qeV/xlXjGpuPsgA5eqV1CquwrNh1QHHap1SxfFZnu2xdNAtYcS5tbOJ
         4qzkbGyOKux4goYUnVZgY0mdtP9y+t4dcYja/Y1041UH9GW+N24OHChberYJSsCI1AcK
         xTIM9lTjAKXXPfYvsAE7VvQEK/nC0MxAtxQkro3uA47K1g67NpItcRr2mQp9iughsmey
         Blfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792810956; x=1793415756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5aDf44Gat6Pf0H0w4M0JG4CAOddgF7K2Xbo5NNmzKjI=;
        b=mMcQLCijZ27V7vVttR87Tz3NYxS4oMePC9+wB0Esnunr+qkfmclO0eEUYU7j0AAhJa
         bB8cejIDnD9U63jQcapWGlLGTDIGOhgBDrDdvQSorYkOns+1MTdh6N9L/9tmbuL490PL
         z8hxJpNrt6eapzYrxKZZw4LJEjzZcj/WiZBo8GwpYOdaClYXW3pbk/+jkW+nRa3esAjE
         Xu81Dp+HV4GZ74BMB/P31KQcmcavEqjnBzf5QXColejVdfVEPRnee2yb6gKLI7x+LApa
         vNLKk4uwKlX60vsDk2l1eIAWKpBbctZ3FKh+gttIZjAFb6BXNwkRGvWDEzsBAzPwIdV1
         FVVg==
X-Forwarded-Encrypted: i=1; AKwUvBynDas7Dsxq15m67xSC/Lx7dmLOvGtTvUDwAnUys2D6de29XT30AA8ZAan57jAfHE9hgMN8qjgTGL+LEVRK@vger.kernel.org
X-Gm-Message-State: AFq9FYJq3qZ0qkPp7D9oMIirO6HvPED1y5pc09jmVeH7909zO9tTTKJM
	ydyoxe1xWuyFmWYnMJ9eu/pILJ6o1/KCe6AfjFpslH23O7kWksv/bTa1
X-Gm-Gg: AYBFou3wwoJiim2faJa7MMZgptEybgHT1vDpWgEM4BTwnVNJr0F2cMFhBRQaTrH7I6t
	HmpgDcgM600Ch6Ll86Q/mnu8e+0b50sbuo31MlrcVu+5Y2egfvhgpv9zWvPz8Ol2Ni87nIP9Ncp
	s2zMyaNqNli1T0e2t2ZQ5JbpeQI/vhRXJWsv64lRduL38lp4u4zhxrwisI9Y2rFT3hMix5qsvQA
	ygssX7U8JyFotZKQV/dBjDNQPPsps+m+lb3y07Avs223VQdiT9YmRJgtn6Al2mf+Y10i5ymkx3t
	cMh3Kl+/76K8QPq+lbXasJW6r9CfjsY3B7FZHzrQBhb/ACUwXBuGAspY+373o/4skAiQa551dlc
	mo/gtG7BVOn5qFm4YTGWz3d7jnHIt7l1D96Kaw2zqypW6ux0f4YOqMuLcXeDLRFdTj0YGiC07QO
	HueLv0XRBQR8bQ3A0BtCtSmRXZts8KN+KFMXljNlwJ0TNiB/bWhWUYwg99AOIL9krSPt4+DmsRZ
	I4wHxX5VNOBWKJh1RWXtp+HtBSRHwPyZhSm9VztejW34sy78DQfsSx/v4LZDanb1sHc/NKGbIPR
	JZ+k
X-Received: by 2002:a4a:e915:0:b0:70b:8307:9bd9 with SMTP id 006d021491bc7-70ba0f6f55dmr422950eaf.78.1792810955676;
        Fri, 23 Oct 2026 20:02:35 -0700 (PDT)
Received: from jeffmr (63-152-17-145.cdrr.qwest.net. [63.152.17.145])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-70b9e1fa334sm824552eaf.9.2026.10.23.20.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 20:02:35 -0700 (PDT)
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
Subject: Re: [PATCH v5 11/11] phy: qualcomm: qmp-combo: Fix error propagation in qmp_combo_dp_power_on()
Date: Fri, 23 Oct 2026 22:01:36 -0500
Message-ID: <20261024030142.13643-13-jeff.roach0@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001-glymur-phy-v3-v5-11-3848c2615d5a@oss.qualcomm.com>
References: <20261001-glymur-phy-v3-v5-11-3848c2615d5a@oss.qualcomm.com>
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

On Thu, 01 Oct 2026 15:04:28 +0530, Nabige Aala wrote:
> The configure_dp_phy() callback can return an error (e.g. -ETIMEDOUT on
> PLL lock failure), but qmp_combo_dp_power_on() was ignoring the return
> value and always returning 0.
> [...]

Tested-by: Jeff Roach <jeff.roach0@gmail.com> # HP OmniBook X 16 (Mahua)
