Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A43534D0A04
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 18:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790360004; cv=none; b=L12Ur2diTWnMrkSWH9wXd8BdyM8PV2v55DkHrIgqyJ7jVBe5/Pk094pvDi3aA6u46u2KSeA72kakfshILGuHblOllBL6oCHhjUyu6oJ3luS92ZVmJjpknjezvnmQvN8Itujbm+2zmNOSvcg+Pa4NhWyVwZ++zQmQntIAiSoZmpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790360004; c=relaxed/simple;
	bh=HGpVmBgrp87uDedZ6+NueznYEIsUv4O6Rx65ZiU3LUM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MJ0F0aVkSH8UY7MGqpHS21vcoA6v55ss9p71luu0wS5uggfbm6jH+7zSxJQo+5OY0J4DR61ENLvyS59Y1/B357+mY4slBayjeqJ2W+4tWA0/cQI1BNZcbz+2SWErVLrha8TxWwfGhzjiiYt1oB+Hby4WqWB1XsuEF/Z6kwDdNQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thinkoid.org; spf=none smtp.mailfrom=thinkoid.org; dkim=pass (2048-bit key) header.d=thinkoid-org.20251104.gappssmtp.com header.i=@thinkoid-org.20251104.gappssmtp.com header.b=uqQ5mgEm; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thinkoid.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=thinkoid.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thinkoid-org.20251104.gappssmtp.com header.i=@thinkoid-org.20251104.gappssmtp.com header.b="uqQ5mgEm"
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-52fb76906adso22087961cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 11:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thinkoid-org.20251104.gappssmtp.com; s=20251104; t=1790360001; x=1790964801; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HGpVmBgrp87uDedZ6+NueznYEIsUv4O6Rx65ZiU3LUM=;
        b=uqQ5mgEmIajHhdNHbbvM3PbxXUTLvDjtL8Rc9iERioUTi3dt46rNcXSCPT41uoiwoW
         Z60BTBIrQehH7BueWKUm1L8O0TzvfM82cdp4BBqDBVb7AmikTzgyDwZxQa8kd/0C8af3
         s8wlafzf2UzL1HyFstiGaYiCehMlXy4Et0j6rGRVVvHGufOPrrcDuRxR30be60oLThSu
         m+Pzogd2l2Q/oBm678HiQN4vmy3yqnvL82QS6JmN/cUOOr2QkX6IhwmXdNkwWtxt/NDT
         OTq8Z71Z7xIE6KycC6uHefoRlYd8/oWih0zGfUx9EIjlx08xztueSPHUvbu71Yf2AzOs
         5cwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790360002; x=1790964802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HGpVmBgrp87uDedZ6+NueznYEIsUv4O6Rx65ZiU3LUM=;
        b=KYFaPasiAsvbVTUj6m1EDR9U4codpociyQQbrfHl5pvkTw2rjlM64ter914VQWqnJV
         B9VmCQGt6kmomuN4sJkw8m6o93BEtFinHOUOf2LcpOTjk7D1Yjl4uBTrAkQ0W9Ay95jm
         kDT06+zLQeGHPmWmD6fDXPQzOY3i8M/3CBH/0h96iTbCLCQeZC2aU4jNb1kSfL+LgoZW
         8Y4QWM+L2DLgUVnlMCBZLTYnVdvGwJ6tu2Citxgk9vExOZXR7OkyAqWrAys/SnSXxJeO
         GK/+8rkpm9lgG+O2Lwi8mK48DslR5F06/oH4ZlBez2Yj1/FekMMY5hN8QcLrfg2MsLeF
         hs8w==
X-Gm-Message-State: AFuF++mtEYFjMjZyJ67dPp/or4ZmtljMguKGGi1TpAKJFIenyMPQgK5u
	hygUrNA2mE/EUE105FR0N0IpYJi2HnAu6paEB41dlTzULclQlPAUOCj4wKuNqm80kaE=
X-Gm-Gg: AYBFou3tZRB47a9tb6ZooGJ2Kt5PvVLKZ0fyn0bpyCpwZ1m6wI41pBos2IgSXUesi0n
	1RUTEG5W50Vqk7MK/FFIoUre0Ffn8bi1q4PdRoA9UJT3DBt6yPnQz8RO4h26EnJsJItIJI5qYpT
	8hHyUXauCZr7EX5TflcbUp64CkJxDmkujvkSI0zMoBefFC6s9f921Qqi1LS5GEMTZ7D2QbCgrXG
	kfiqa4qRB0pT/YJ9X9SrfBeCTtYzz7zI4hm6YeR6vAcqL6VoTmLjrA5g+BSn/RTsJ9Di3MC08uA
	/n67+4US9b28D2tfMoSouKkE3u5/OQuiq/QRGCFloHXqzA8az6gzaMYdrKtPqBkXDLom8TwMGGC
	EzhXQ38KTv/w7zWFLDCVnKT0hoVgUnYABv+KZf2vA5O2tFc3Oe7lQDxglG5TqZ4RjWNLJk0IyS9
	wuxp8z3LrFdXtFrdcs8A3v+n+gUC9d8A4f80Jro1dUBzMhDYI=
X-Received: by 2002:a05:622a:58a:b0:532:9d80:3fe9 with SMTP id d75a77b69052e-5330b6dadfcmr62777901cf.56.1790360001529;
        Fri, 25 Sep 2026 11:13:21 -0700 (PDT)
Received: from armok ([2605:a601:a61d:7a00::2])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5330c0452d2sm20046541cf.20.2026.09.25.11.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 11:13:21 -0700 (PDT)
From: Liviu Nicoara <lnicoara@thinkoid.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v7 03/12] arm64: dts: qcom: x1e80100: Add CCI definitions
Date: Fri, 25 Sep 2026 14:13:17 -0400
Message-ID: <20260925181317.22532-1-lnicoara@thinkoid.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260917-x1e-camss-csi2-phy-dtsi-v7-3-1a63eb35838b@linaro.org>
References: <20260917-x1e-camss-csi2-phy-dtsi-v7-3-1a63eb35838b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 17 Sep 2026 14:20:28 +0100, Bryan O'Donoghue wrote:
> aon_cci_i2c_sda3 = gpio235
> aon_cci_i2c_scl3 = gpio236

Tested on a Dell XPS 13 9345, with the board DT for it [1] putting its
OV02C10 at 0x36 on cci1_i2c1, on these pins: the sensor probes, its
chip ID read over CCI, and it streams.

[1] https://lore.kernel.org/all/20260925181024.20352-1-lnicoara@thinkoid.org/

Tested-by: Liviu Nicoara <lnicoara@thinkoid.org> # Dell XPS 13 9345
