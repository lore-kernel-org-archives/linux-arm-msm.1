Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00316492525
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 19:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789240402; cv=none; b=YPLYtitDQ6pG1ACApAN8Jp+Renzw1EUyzBZCewmXSC8vfM6ys2fBvrNKpZ9SaQ8n0WFdp826Pd+IBznAgrFBMCo5QUfp/ZHEykrp2wF0Bp5TkgpRIRkWJov3FxIXO1U/4bYiT2ETp0tOoruYUknoG+DIAjFgP5di/ssVGzxQqCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789240402; c=relaxed/simple;
	bh=rzU25QtfHWStXyf5JOAOYagDMlPR8E/O7UUr9Hj10z4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iOX3vDTrWaahHkz/qGEFgpff8Tb2W02MF/enyX6LMY7fF6rYQBIT8EuOEQOmIE6dc4KEcpDhKT4jH7lg3jGv0BxwqSobpatEPpQfCp11NbAnygAi+o9oFHBTqINg7TCrWcKHWcBL2Jx7uqOXMngEoGG71xUVv/V/k178TfvjVJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a3gOWOis; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a3gOWOis"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso2007502a91.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 12:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789240400; x=1789845200; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=epJRaVobxvGM+/1VLnT5WJdru54OJK34KQRZKM0LI5E=;
        b=a3gOWOisn5B5hRqXKFFZKdetKy+GtbuubsLGdKfo8dqVPZnDjUVVyhiVI9XUkx9E4X
         TMjXM4UvHdST9h6udvx5ez24iQKYZ2V7W3zX1Z0yh5dQCXfeX3zqcpE2VLPlOgcvDKPB
         paiBP6rpMsArRYh1Y3t/GG1OsXYDzEAPgP1HyakdZ1/FjORGhtUuAlf/QPT7c7QhZIpx
         lzRNGFdtG6uhd9cpzXIXhVGYxs5Kn7OxElWIVaR25MN0adsA2AhHHg7oF0GD8OthXboy
         aTUKZPWGTWoXVFr1+pU2wPMwfIAj8HJQ0Xan/coljkOmX3aPp+PI5OyofQSVcbAEQ8hK
         M3rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789240400; x=1789845200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=epJRaVobxvGM+/1VLnT5WJdru54OJK34KQRZKM0LI5E=;
        b=GYNcbfLmBeoQUyctgtm7Lgg2z8LF9LRTkm5HmO02DH2Q+EJflPm6p8e9NQTn9WqlSp
         twoI8ZMpnvyhK1pF6S0gTRX5FbvU7Zo+eVwopCGdySBEoNyY5zt8pfJyGJeZUzM1IjyP
         X3VP2ZeXuB7BGg4NntF5+TsOurglQl1BB0hGY+pt6/s84okPZ9m7RIJIp4C8BRbMM3zs
         mPyUFo0ELRZ6LX50iz/aOHA5V2PikXwT6C6lPvlVeH4/qpratXouS5jKA7iqJNcFpeGS
         Eu/pz8VWgJ4NlGxo0oPPkKzQBo2tYnTJXv7nk1FoNkwTy6DdlMIh0SPozjzuvQbgjkRl
         CMVw==
X-Forwarded-Encrypted: i=1; AKwUvBwxAXE4p6weAdHFUROaR+Y657Wlcj07LKcuOrHjEc32ZdVpNmkdMoUjErSUUBv+Ld3vJUN3Wem+3nVv2cR9@vger.kernel.org
X-Gm-Message-State: AFuF++keJ5obRZ4LAH+kT8MUfdsTD52Ssz5u1SLBXNEEVZEa9XTVIoyN
	HOHNNt0UfNMBGnftHBTRdxu8v7aC02LSEvWxU5XhwI82LfiTTUEc+2zO
X-Gm-Gg: AYBFou3ZG34Ru4zgp7/WjruZBWEf5ETPON7SzNvPLKngohWOQG97eQkRgKH0Ql/eBey
	G+A4y63pHO/hnW066NyyUQgq96r6gQLGCOJFJld5MsylS3HOZzw6PngvripvWi6hfdqvSO61nBu
	mXyW4QwVxdXSGQQ3ysF4RqOXoGYz0Z2acxN+WMiwEWD0J/385fWDpvSB2B8qFek6xtocPiJmEc/
	OCyfghkMNfSVKdEgw0HdC7p5N0/1G/MDOGxSI5m5bYa36WQUS9x+ZlDcXruK1Dw9fTnnTHoZhXZ
	8E9MqX4tHWZyAGPkNqOxYg+8jGaap56im3BjH67A/mqET9YaY+Y9IsB8hnjtOkIBdkqw9ShVdM5
	AP1Bo1AyhmxSi8hdg8CLTxJKiQYjUHLvaKMXRJ34RbEddPK8Vx/NX7FdKz1/CTn2rOkDWDY/RXD
	a+rJVMZyIliUuohpU0G3z7GgX9cm2PDD3k2HjJESZcjmmfzBKujWZuXOf6XDYcGxMtmQK6
X-Received: by 2002:a17:90b:4cce:b0:38e:7168:281 with SMTP id 98e67ed59e1d1-39d9bec4d91mr17930859a91.10.1789240400257;
        Sat, 12 Sep 2026 12:13:20 -0700 (PDT)
Received: from gmail.com ([58.84.61.98])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b348cbsm14722239c88.3.2026.09.12.12.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 12:13:19 -0700 (PDT)
From: Sumeet Pawnikar <sumeet4linux@gmail.com>
To: rafael@kernel.org,
	krzk@kernel.org,
	amit.kachhap@gmail.com,
	daniel.lezcano@kernel.org,
	thara.gopinath@gmail.com,
	talel@amazon.com,
	hayashi.kunihiko@socionext.com,
	mhiramat@kernel.org,
	mmayer@broadcom.com,
	viresh.kumar@linaro.org,
	sumitg@nvidia.com,
	peter.griffin@linaro.org,
	myungjoo.ham@samsung.com,
	kyungmin.park@samsung.com,
	cw00.choi@samsung.com,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	sven@kernel.org,
	j@jannau.net,
	marcan@marcan.st,
	casey.connolly@linaro.org,
	sre@kernel.org,
	wens@kernel.org,
	t.schramm@manjaro.org
Cc: bcm-kernel-feedback-list@broadcom.com,
	linux-samsung-soc@vger.kernel.org,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sumeet4linux@gmail.com
Subject: [PATCH v2 5/5] powercap: intel_rapl: Use %pe to print error pointers symbolically
Date: Sun, 13 Sep 2026 00:41:55 +0530
Message-ID: <20260912191156.185448-6-sumeet4linux@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260912191156.185448-1-sumeet4linux@gmail.com>
References: <20260912191156.185448-1-sumeet4linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace PTR_ERR() and %ld with %pe and pass the original pointer directly
to pr_debug(). The %pe format specifier prints a symbolic error name
(e.g. -ENOMEM) when CONFIG_SYMBOLIC_ERRNAME is enabled, otherwise it falls
back gracefully and prints the raw integer value. This makes messages more
readable without any functional change.

Signed-off-by: Sumeet Pawnikar <sumeet4linux@gmail.com>
---
 drivers/powercap/intel_rapl_msr.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/powercap/intel_rapl_msr.c b/drivers/powercap/intel_rapl_msr.c
index a34543e66446..46972ee1ff84 100644
--- a/drivers/powercap/intel_rapl_msr.c
+++ b/drivers/powercap/intel_rapl_msr.c
@@ -582,8 +582,8 @@ static int intel_rapl_msr_init(void)
 	rapl_msr_platdev = platform_device_register_data(NULL, "intel_rapl_msr", 0, def,
 							 sizeof(*def));
 	if (IS_ERR(rapl_msr_platdev))
-		pr_debug("intel_rapl_msr device register failed, ret:%ld\n",
-			 PTR_ERR(rapl_msr_platdev));
+		pr_debug("intel_rapl_msr device register failed, ret:%pe\n",
+			 rapl_msr_platdev);
 
 	return 0;
 }
-- 
2.43.0

