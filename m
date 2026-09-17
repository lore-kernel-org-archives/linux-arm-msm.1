Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE4283B71D3
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 18:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789668788; cv=none; b=mYA1EIICDmLtWV/m6tsdJZfkfsAQPbOkTZ99qYrGDc/Mt9cRV2NRlNHlla2E8xKSqngI8qMvLJzmQAEiiR/DeDnPa1eVjr+kVOFtRehUATqZ31Pc+ku4thJ0UMi3u0tXIjlB5VHNuDN36Lv3EUG6an5FBb4t2rnuPvUVT4xbE0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789668788; c=relaxed/simple;
	bh=rBWaCN814kHmYVV+q8AElI0MqDoPN0IJdHskleXzFrM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mQrahi9CG+vKhrv0zTdKHaeLt3D3YZj7Ydm2svd4aSGiwIu4/SZp+mAnL7ZXkwxXPbwwFQq/Ro/4i/Rlt825fusMzj481iFXm/2rENsfEMWwG6z9lwwx+hrZ/10lTXqr+w+/ky8i6C7m434Ym/WUa02YUwcm89RgecbnhrKJQKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cigLMYHA; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cigLMYHA"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e69b9e16aso11491345e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 11:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789668785; x=1790273585; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rBWaCN814kHmYVV+q8AElI0MqDoPN0IJdHskleXzFrM=;
        b=cigLMYHAq3HXFTD8YjNTGkS3l4pmA1m6gU26q46GcNXpz7uYr/HnNYk3j18Wq5/BdE
         ZyNe/1J+9ccrw+0b35rAuakTs7rdPX88fY6CDxGEDU0xof8eNHa26rELlxmvlA4Ztgsq
         00InF7VnnyYhNLb83btDZnGREbBKK4HyRWvQ8Vi68UMP+YzYEtOlwf87dQ4iANeqXQRD
         qGq20qiLByDUgH4Czb6Y9qCd2I3ACQiyiQXGfD0c5Kjy1YRmW4dVhfsZzVIUeVtc2THZ
         75td/qiJXi5b5XyyxrTvGcoo/4cHPBafUOvKnGsKWeYiswhkZaK7foUwD8bG1ooXZcKb
         zTUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789668785; x=1790273585;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rBWaCN814kHmYVV+q8AElI0MqDoPN0IJdHskleXzFrM=;
        b=r5R9KzW+EnUtiAyxwRftDbVpXSnhrW5uR5iIL+/d9Tdk2ILQ74p/X1tv2FzYkbxG3P
         uhiNCpkvBbZwCrQwVHhJT9bzwTGTk/uW7fNrL6gTNsYvluiBR7lR7H6dS/OA0RViPFF2
         jR0z/2WveZb0r3OLYOsGKyNDcHXXHvraC4mNpOL59bVsBr0SrXRfQ2xESWBU6DAKuVCW
         se/MWa7P1ZxC0wKVHigdK+Mtcp5dw3h8tNSGBUREwzmadp7068JsZILtn8Y4Vn8j4HFp
         JmP7ATGU0KxErZkvOZjRrRxp9t3y9Ex8upOe70Xu6FLRi+/XNwTTp02YBbKamvwUbPhi
         zb+w==
X-Gm-Message-State: AFuF++m7wXZtvEoRdyFhu14UPu662Z79ewP/gtjFiUNmBBKK1FzEQvA+
	n/IBcQhsUGSZcACHm+j5AIqZO2rM0og78Y3pbIGigNuubYMVSa84726g
X-Gm-Gg: AYBFou0/v/s4wbDFWwshEu4ck5ktAYCzHGN6jlNJJ14mjDypkKd6tShCEqygJeSOIY3
	ZsZa3SIOJg4VI2v58bYTo54fWoRZOiRQkC+eoXNG4VTTIM6B/uoiR/YATAxw6guoBfEJU3d/bTl
	0JHqythAzAvZRufasvCkbk5IYdpCNAkww5zV8kyXxEvw6aV1PeptMU3eVNb7F9vMrbuwpXBI2tJ
	1ORh8qckh/EgsydXD83Nh9vaR65oISkN0u/IhnY2g5IovdmtgHePqv8EKunQYTK1BKNCKct78Ss
	g4fqnFR9tp5kZ4kd9AItlJDsYar9jGEbhUPMYWyFCQzevmB8ONTEz2cV1wHfO1wuQUz/Mox27yM
	S11Tlu1SW4sZJrkbiimpAQwJAY6awJcbR5ZobotN8RhkPhV/HUJo0s3XWk4yMAmXlo1rYrBP2Hh
	6AAf/QDeZXZ6ZxPt9KsoJlT3ZmqjQvEdnFedR3QkRQqi9GVxJeAhDI5mFpN4UG9z1Sr/U3j5H/Z
	o77CMlt
X-Received: by 2002:a05:600c:34c2:b0:49e:6c27:d093 with SMTP id 5b1f17b1804b1-49eb72f7043mr91713485e9.15.1789668784618;
        Thu, 17 Sep 2026 11:13:04 -0700 (PDT)
Received: from localhost.localdomain ([94.252.75.113])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49fc4855b92sm3165935e9.3.2026.09.17.11.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 11:13:04 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Felipe Balbi <balbi@ti.com>,
	Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-phy@lists.infradead.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: Re: [PATCH v19 0/5] Add phy_get_by_of_node and devm helper
Date: Thu, 17 Sep 2026 20:12:54 +0200
Message-ID: <178966877406.2239.2890857291530516772@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260917-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v19-0-21ad8a76e941@linaro.org>
References: <20260917-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v19-0-21ad8a76e941@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Bryan,

On Thu, Sep 17, 2026, Bryan O'Donoghue wrote:
> Add phy_get_by_of_node and devm helper

For the series:

Tested-by: Oleg Keri <okerixx@gmail.com> # Lenovo Yoga Slim 7x Gen 11 (Glymur)

ov08x40 on CSIPHY4 through the standalone CSI2 PHY, two data lanes,
data-lanes = <1 2> on both the PHY and the CAMSS endpoint, capturing with
libcamera on next-20260916 with the x1e-csi2-phy v18, Kaanapali v16,
SM8750 v6 and Nihal's Glymur CAMSS v3 series on top. Streams, including
after the sensor is unbound and rebound at runtime.

Thanks,
Oleg
