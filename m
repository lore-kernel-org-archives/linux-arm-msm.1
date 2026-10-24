Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792810946;
	b=T13qL/fIkVsfMGUXKV9hrH+oNdV7aaeWp1c5tAjvDxYQR+FZEd260TZC4HndTcgpxsJV
	 TJlW02zGPKZc202sNNpU71aOqLQIVZk2f4bM6BPIhlxs62iI0/B6N4WC73pKWM+IcJcEW
	 6vLBlzK5mJDjBrWr92si0DhxVTV3jhc+IWM2YYRnQAzctpJwF8BjcKDbdv0GpeCgo+uMX
	 zEUEeeIIogafMmxzeKLsSN+JvGJOsmO3MFS/pI8Mm3/oFTilYSAQuUHI75ed5uDGwEQzf
	 xroadcvyckW6ok/1xkb1RY+7RNeOTDbaUaeqD6uTuvdZM5Iv7Vb4j5EK2XiFciIldwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792810946;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=a1b5LqRY8mdvBUKXOEQXg0mPK4S5xc8s9ZkWSNVbjB8=;
	b=zg+Gm762TZ+9jAXGtBjBoGTHMxb1bBKbyUfb33jAzwGqMIyeXs9Q1Vuyn4SsaTsOGTIm
	 EypgS44Sea0J8SDHq/yuAomKNde53I+3bdJsIufFPPs1+dk/B+RPlZ/EgCB9yra0NC8CG
	 GLrMQC23670PzR1c/1bt9F2g3z0uWTaamY3glUSnfdPJ8IhMwSwen8laaRF6fghwnDQlK
	 5f0p6yf8WwcqSpYuzJILKKNEssjf5aMTvyFFxE2+CPRd+B7urBm35U3KJTi+zVUDGtI0H
	 8lInaKwIFpUZCNFAdYMgLjt6PSUlzD/T/OC4c+L2GqU4jxGtsaqb9aqGUPqbGwneemA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=W3kxhTVu;
	arc=none smtp.remote-ip=209.85.161.45
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A8560A261E
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 03:02:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0A8560A261E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=W3kxhTVu
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-6cfed5dd083so1080871eaf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 20:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792810945; x=1793415745; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a1b5LqRY8mdvBUKXOEQXg0mPK4S5xc8s9ZkWSNVbjB8=;
        b=W3kxhTVuQ+8cLf6rhlqLOrYzMcLaBl8I6Dag0J4MjPvsfpUc9TzSZxPf66HrcYBPcx
         UoYI/Bz8LC6fRbrkUcS/lhAjs2EAWt5n6AgJGiztosBqlhc+/ySrm1ZWyyqGqhr9fb5O
         +lHz/tlj6SJ/1pFAlZV8aoqB/l8ZIfMa2QpbyDqTiSLAcH6EGdgA1VXviQRRiDsXrWyk
         jgFx+hP7LF+kRN5k7lVimwFt+20nuEV5PIyFUPPZmp5umDg6QSQqvFyjB5+MXyAcbLhN
         K2DlKrvrzqFBVdQkG1boYm7RShhXEh6w717TtNYkYhAC61oq4tgYj233iT+LzTZ19MI5
         3dRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792810945; x=1793415745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a1b5LqRY8mdvBUKXOEQXg0mPK4S5xc8s9ZkWSNVbjB8=;
        b=hd5uu1Ode8vTjzwql7+AIYPkF+MosZTPBKQj8AyOj8JdOM+LrqstG78jHYNsHzCtjA
         D3jk2OqtBXQbjnteR4YpteymAVYxpggTh5cUb9O7O6y48na5qW52zDHfQAI2Lhr9GGA8
         3I4wtibAtiXH7uSSbWSEJy0AAr8Y3owSSLFurQr1xCQM25/zqkppGxepM5/kQP5NeP4A
         whxSSvEL9o7stH2pUORuuRF9ypWAe+bH2EdCwI1ly8A4qIYZ1VGBGJW2BuC2COpVkmA0
         /QLBIv83sLB7lCRgpEXLaUDIOLc3O2HDXxzEkVh7wAHNoy+EerIrGN/OXoLUcql5XJeB
         NtcA==
X-Forwarded-Encrypted: i=1; AKwUvBzJhfY8efQC9IDdMRYceNl1bt0umuXIjD1fNIdhIAxnRRVEkGYgKQRUOY1mARti1zppL38V9mN9+IJgAXCe@vger.kernel.org
X-Gm-Message-State: AFq9FYKqtM6kTjm7SaUS8DelNO/QI0zyG8j25jMq3X7+aGtkG2Ys3M7i
	pW/9CZzVdhApSSSRxpcNnhSC73kzUGweEqAQxxPg4f+pkX9dt4uMw43L
X-Gm-Gg: AYBFou3dJdntuoRVppOct61gEkGBHMbn9YVIbCKVvDCDwMEmAE0ivGcd7aam8X9wjWi
	0oyBNpTUXO08x+neBG2DjfTUMfgVQI+iQLNjOjawHNKtsYishqkLTLPxXraG0MVMJqvbp4KUEtL
	da/326L/rT169b9wtzsKFhZjQ6Y8IaNsdmLvTIOjG4To+apWGUj1/RMrmhMzkGi2J+EjPHiulCF
	2q5tBSnQQR+YLBFCIW1Y5cl/geekOt9VavsFzZGNUbs1EZ0NeEdBQ4PE1AcSdCfR/ydR7y/Y3ay
	XPJh1dn9w87wPJMqQDmne/yrRgjmQW0ByxMe93Vwhr6aznz+uo4Qi7VUJa2kO6bwWeNLquT+tEA
	wtNnEdbLrex6gztHgkHHHy+eZyfe+wmRs3C9uxZ8PsfBQaLWnKiVJEdxp4pUK0TJ55WDE9kvW7Z
	4O3xa3zgBA6ucDpnwtNKwIpz+UqYkKQzWzCsF1uJquwvh2VI2Lwn8Wuu+HmtNz/RsfQyWqoIjSg
	juECpcr2foMENqMwfV2mUdTKK6Tm0e+A2uewIMQOyDh1nrDi6PavOryPecuo5c3ZvUdAWN3zu3n
	QTDqCQ==
X-Received: by 2002:a05:6820:1627:b0:705:cb2d:e0d7 with SMTP id 006d021491bc7-70ba0d9eeb5mr369148eaf.26.1792810944770;
        Fri, 23 Oct 2026 20:02:24 -0700 (PDT)
Received: from jeffmr (63-152-17-145.cdrr.qwest.net. [63.152.17.145])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-70b9e1fa334sm824552eaf.9.2026.10.23.20.02.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 20:02:24 -0700 (PDT)
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
	Mahadevan P <mahadevan.p@oss.qualcomm.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH v5 03/11] phy: qualcomm: qmp-combo: Update link rate specific DP PHY tables
Date: Fri, 23 Oct 2026 22:01:28 -0500
Message-ID: <20261024030142.13643-5-jeff.roach0@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001-glymur-phy-v3-v5-3-3848c2615d5a@oss.qualcomm.com>
References: <20261001-glymur-phy-v3-v5-3-3848c2615d5a@oss.qualcomm.com>
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

On Thu, 01 Oct 2026 15:04:20 +0530, Nabige Aala wrote:
> Update DP PHY initialization tables for all link rates (RBR, HBR,
> HBR2, HBR3) with corrected VCO calibration codes, lock compare
> values, SSC step sizes, clock forward config, and bias enable
> settings for proper PLL programming across different data rates.
> [...]

Tested-by: Jeff Roach <jeff.roach0@gmail.com> # HP OmniBook X 16 (Mahua)
