Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D19A32FA2B
	for <linux-arm-msm@vger.kernel.org>; Sun, 27 Sep 2026 15:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790523165; cv=none; b=RpehCRLvDb+wYdV7w5HL0Dhgx1w8kHsezIFTxKkISpE3SqjyjIuwr9Ji8hdVWmH28/dhOdGrlruqW3yC3GPz2Fk46bwDZLtZBAUj1F5slCH268RWFqHUInZBicmDbaOZHEFXCLJ1zhjqbdylotHHhAiC3efMsmSKoR64HLdPuAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790523165; c=relaxed/simple;
	bh=AUELxXX/4KdMVFHfZVh7d6Npt4NuE8mNYbP31G6l8cE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VYDaLNod0u9s9p6SV/nXYBydhnvM6s0xULadHaKk/iIwX8aKwdzRRiX9VpbtmALy+5o//vDEYzcUuak2sWHK8R1Di/VNtrszu3S82xorEz7RY+gTKEf4QxXm/zTAlwBkay1sIRt3hUJpaks0tE6joKu1tggvBI4B5Dd/UsK15dQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thinkoid.org; spf=none smtp.mailfrom=thinkoid.org; dkim=pass (2048-bit key) header.d=thinkoid-org.20251104.gappssmtp.com header.i=@thinkoid-org.20251104.gappssmtp.com header.b=Bko8XzRm; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thinkoid.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=thinkoid.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thinkoid-org.20251104.gappssmtp.com header.i=@thinkoid-org.20251104.gappssmtp.com header.b="Bko8XzRm"
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-5309a20a55bso25449901cf.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Sep 2026 08:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thinkoid-org.20251104.gappssmtp.com; s=20251104; t=1790523162; x=1791127962; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AUELxXX/4KdMVFHfZVh7d6Npt4NuE8mNYbP31G6l8cE=;
        b=Bko8XzRmxrxhB1yOjvyzWxL6fsflbVvF3cb+Jb0W1u854XoEEpOv1UgUywBedNTSG2
         f+9AuKYYMyxONsYCe8nY5+U3FhhMpvrwJL5tUtRRXQFpVfI7sgXMLKuqftBxvV+e5NWP
         tTQDTedpcQDJeJdgK+m6C38pvKZybvdzSrAKG/fn3r02D3ijRLNBDPH+rwhUrsQKR+jf
         irZaO7g9CxOF2fynph5lJO7/0MR3r5822IqdiHkpId98lewlIZF5N0u4A7bGSX7Hbm2/
         3+YJhCX01z1RxIPf8UDhMQ8Bo9J1+U0t/ZM0QAOvfNt0ZctALzDCZ52mLtvELG3J6Ek8
         l0EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790523162; x=1791127962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AUELxXX/4KdMVFHfZVh7d6Npt4NuE8mNYbP31G6l8cE=;
        b=Vk0jjf1voiPQaVo3LKRI2YQ7LJ1Tnq/2lggsCvLJgYCCW3bHS6SU0i7AkOCqNQr5Gr
         lY4OE7HVqlsOOw+pS5lB5cstREhn+h3BqY6PX3XofZGDOllhXyDWjrF6HxP4yPZpvIw5
         HVeiX4prOV1gJ715Emyj+hcwNV0WeOSGuHZTC1TkPBxFs/rB+e2TEn54zw4XNFUOzbM6
         qr6V5HA3sYAGrckYNQjfJRxh0Odmj5ktnSYo6DZXuquY1xH1vJL5PUzdSYFC5t6wXRFO
         M8a90qEaiyQGZY+RpsymuwyA4Dr+nH5aa1NvGE1Tt96/l8UYPXyiUpgHxpyYrfwJvNnj
         us6A==
X-Gm-Message-State: AFuF++kWdSfnuxfktqZJ/mdzjwr936PQbPzMuPPYL+OAaS77aThRJJSF
	zPcri/K/rMAUQ76UCMbbfty7I91tzY3yD4miGmvpLnGUQjy3v1v0g6N1ZCmBTAqqW4U=
X-Gm-Gg: AYBFou17Z4dIf6K/M6k1fY+4kJPakp1Oyqk1hgMEkXK4f2J4bU+dvmkS8YF5eTNytr9
	ftT1AuTJYJFm/ibXcvJV+LvhIu1lMWRwdhJooXnuU7PRtIXv41XbG2nF7dSKzMqeL4qQIGF2SDh
	G69Js+sUZT0T5Ays1iBEh73AdezmY0t4RnMsRLxraRxiq8BzQFYBtXyB1hcbAI1cmvvmlD0K5+0
	XWADcH1nBEfKznKInlfxV7sQWThTgovr3SBPhgm5yXAxPx3mH3kOWFGfNfT+zoBTTntUfaDrnex
	inXSOh664+djuz2g7/0mJSEjB84VciYgYhKde2uK7tWT2falT00GOIiRyU8Sf2w6KxQgHWLPOr5
	DeM/40+D7uWOHkF51ZitdYe1J5c4pSfQgSy3BssDwChRI7OCyrB1ub+OK49EQlo7FTbU8OwLbJt
	UmplWP5/8SV4ovsWUvvrE7uHboeOixk4/5+7bR5BiKFzEa7Xo=
X-Received: by 2002:a05:622a:4d9a:b0:533:33c6:e636 with SMTP id d75a77b69052e-53333c6feb6mr56127141cf.6.1790523162378;
        Sun, 27 Sep 2026 08:32:42 -0700 (PDT)
Received: from armok ([2605:a601:a61d:7a00::2])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53322020e91sm43319281cf.1.2026.09.27.08.32.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 08:32:42 -0700 (PDT)
From: Liviu Nicoara <lnicoara@thinkoid.org>
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
	Manivannan Sadhasivam <mani@kernel.org>,
	johannes.goede@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-phy@lists.infradead.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	Oleg Keri <okerixx@gmail.com>
Subject: Re: [PATCH v20 5/6] media: qcom: camss: Add support for PHY API devices
Date: Sun, 27 Sep 2026 11:32:36 -0400
Message-ID: <20260927153236.2727-1-lnicoara@thinkoid.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <105d1f73-5334-4ae1-8267-1927f8691a06@oss.qualcomm.com>
References: <105d1f73-5334-4ae1-8267-1927f8691a06@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, 27 Sep 2026 10:40:33 +0200, Hans de Goede wrote:
> It would be great if you can post your DT bits for this upstream soon,
> then we can add them to:
>
> https://github.com/linux-msm/laptops-kernel/commits/qcom-laptops/
>
> and more people can test.

They are posted; v3 is the current version, with Bryan's Reviewed-by:

https://lore.kernel.org/all/20260926122533.8200-1-lnicoara@thinkoid.org/

It also links the sensor to the privacy LED. It applies to
qcom-laptops as of 3e45da63f61e, which already carries its
dependencies (the x1e camera DT v7 and v20 5/6 and 6/6).

Thanks,
Liviu
