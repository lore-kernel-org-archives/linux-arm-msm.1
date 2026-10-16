Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C059344AB68
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 10:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792145188; cv=none; b=GOxutrfdjW4NH7wNy25bcSk6Ti9f3Db5k7Y1a7UdTR5Rq+P7gGnR3ljd4wEbnUmzRKFY3Pe50nxfdlXL/WyoBebdzaMzK3GIRfifihmuMHKA/DqDTP2T7ikZGIPl7Fa3p5SqHiEuEf7tOCDXGfUqWQ9e95+d9POCmfAyoUIfi8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792145188; c=relaxed/simple;
	bh=HDb6dEAlQfqZ6w+pZ27i4VhJh9De9UuXiV4QYl9+3Es=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lzbcnF/iqxFOqIZQBMk6IUGuywoPKC5IpkhLWm2J5ST/Gt3oRDkmhKc8pwkS7Rt8LvJaclpLuC0u2iq3RaCFB9F3wRZII9qkAFpkLhZeVrlsuZn9Ch//+8x6JyUYDLHV54FEMZtMc3rNPnL/nC1ifwMn14FraUgj1g1RzWKEHQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BkE1d+lk; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BkE1d+lk"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso1535325f8f.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 03:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792145184; x=1792749984; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kZIV8SpDryJCkEdmLv3viRxRvmm/nGJEMBGvh6BKJRw=;
        b=BkE1d+lkOibyPPHKbYu/5LrI+PtWmFW1AKMnN+2+MCphdNXLUaU8P40SJRDLrVB1KL
         fJjrtvB4K+WVH/gqkuOqcsJU/thpSJhGO4FVFY9gglVmAD8Io9lBcfSgmvemZqfsnApx
         +CbBsf18hP0ctq5IhlRU0nXbp/7gbZ+eYLfvJblsG/8DeCuvhps0Z3TXtBfg/tvXjYli
         Yto8Xrb/0Ro7RUZhQpaQP7vkPfMa9dnI42YmAw/6aVwhy9cjNiKL8nFfVAgqnu4lRVgF
         3wWa4RXAGQI3TAbJXJaMwmuqCiiskCKzGnhpqTrzkvv7M7yyXzjQh0ik5h+r78XmmORD
         71og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792145184; x=1792749984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kZIV8SpDryJCkEdmLv3viRxRvmm/nGJEMBGvh6BKJRw=;
        b=pMNo73Gpsf0xFuDgoXtqleMHPpMuJYBh7mqV4vWN/TBoC+0PfmguzSKpjrPp70Zd27
         MwMNAUPWdEu/GHDsvotvPUNm2a7OHP+wjULr2Ll27uKhBHehNu9Ud19V7DJIHEvKU1Nm
         eIhN5ed2QdvKBr9002ZVw3GktfEZXlvqBwoNCP0CgGXuVzeqztE8oDWpqpR1FI8cT9Xi
         lKjKoT+c/E9UO/5L9RVX9jsS7gV6xZfmlQWmOwPFb4FkAIykBd830nJEm1Xz63EXC1K+
         lbtp4pVzv1mIp4F1knTgyntx7C4+u41FmTARnsBfppF0TYm4OhWYIBBtKms2vbtZGNVK
         VSgA==
X-Forwarded-Encrypted: i=1; AKwUvBy/My7JpH2aM2QLr8UNEy9PHRC5ZAorcRVjmy1cRKUx++u8S/CJBAXf9VsQDN2xtQagEevqk0Giy9GU+kqK@vger.kernel.org
X-Gm-Message-State: AFq9FYI69wSVb0zJcsDuwIXG9OB82vMsh06gGjKF7Kj9gWrkcNSiF1Sn
	zEJ2NC8x7zeErzhqQWrYUbIElcYrajvx+9CTfVMwYLYPOgCSdED788s3
X-Gm-Gg: AYBFou3lCKpDq6PxYi60mEZ8stbpc2efVOJX1TqskueoYDA/As/NDpYlkdII8xzoeFd
	VG5Awl+xQzRuw+1sACNOfe/S4OIhRCmgtqojgxQjl+NGMnad5z7x9jXTOBpoHL1z2917fmWJFMG
	xikB354kw1o2B6VjtsBC+DCKm4RXv0HtLevxONGLcZpdtckvvuygUD8un8LoZA+LhIMY0cIdIzT
	n2+usrkKxX1vPrrEmvA0A5RughBVWbIdKTeus1Qsa0jUQ815LDbBwr2//okkCLm5Gyoah8wtj01
	pyrhDTIXhBvlypyOlgKpYVm/WGCpo27tTw1Jrp6+Xz+IQnz5W48XOVbmt2RtFTnPSv5x7sQnJlw
	st/Q+BN+zAxSfSTYYHJfYdb5H/Fk0+cFR9qc3t7xHtupd004A/oLsIXvde7hvjRuEXfIn15VCW7
	clKm97qQvqcwlfuKwSo5m6bKR1Rq8GkTDr4pQFWRuKA84XntKe1lx5evybQWvTvX38+48ZGttfL
	6bSqFhTx0F1ICBU0BiRdNlfdIoYRwaGS+VMzW6LxzscJmIbfqdVQOwP8Hq9D4wA4c3pacox13uO
	8vzVyLE=
X-Received: by 2002:a05:600c:8208:b0:4a0:1b14:d00c with SMTP id 5b1f17b1804b1-4a18e446f55mr452412475e9.3.1792145183665;
        Fri, 16 Oct 2026 03:06:23 -0700 (PDT)
Received: from SP11X1e.cable.virginm.net (cpc99340-croy26-2-0-cust244.19-2.cable.virginm.net. [80.193.62.245])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8de7230sm45403835e9.14.2026.10.16.03.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 03:06:23 -0700 (PDT)
From: George Neacsu <geocausa@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	David Heidelberg <david@ixit.cz>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-phy@lists.infradead.org,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 2/4] phy: qcom-mipi-csi2: Add C-PHY support for X1E80100
Date: Fri, 16 Oct 2026 11:06:21 +0100
Message-ID: <20261016100621.427612-1-geocausa@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <7aed254e-18c5-481b-a77f-576944fff1d4@kernel.org>
References: <20261015-x1e-cphy-rfc-v1-0-1f3fa9af940a@gmail.com> <20261015-x1e-cphy-rfc-v1-2-1f3fa9af940a@gmail.com> <7aed254e-18c5-481b-a77f-576944fff1d4@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Bryan,

Thanks for the reviews, and thanks to Loic as well.

The series is on next-20261015. There, phy-qcom-mipi-csi2-3ph-dphy.c is
blob 966d79c98, the same as on the media-committers next branch, so I
think your tree has a different revision of the CSI2 PHY driver. 3/4 and
4/4 also sit on top of David's "C-PHY configuration on Qualcomm
platforms" v9 [1], for phy_sel and the C-PHY link frequency, which is not
in -next yet.

Which base would you like v2 on? If your branch is public I will rebase
onto it. Otherwise I will use -next plus David's series and spell the
dependency out in the cover letter.

For v2 I have:

- 1/4: lanes -> trios, and a PHY-layer helper for the C-PHY symbol rate,
  the analogue of phy_mipi_dphy_get_default_config_for_hsclk()
- 2/4: dphy_/cphy_ naming for the init sequences, if/else instead of the
  ternaries, the D-PHY and C-PHY lane setup split into helpers instead of
  the goto, and the helper in configure()
- 3/4: FIELD_PREP() with a mask for the PHY type select
- 4/4: the helper, and an enum phy_mode variable passed straight to
  phy_set_mode()

[1] https://lore.kernel.org/all/20260617-qcom-cphy-v9-0-83da8a8e4e44@ixit.cz/

Thanks,
George
