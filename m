Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794483606;
	b=rw7qvEMFF0eRnpHnQEYzj+8JeXrigRzEvBsaqh9NAHmbHKAoNgd3+x02pwC0QNHV3tKU
	 EUjrW81Mv5CMDvXv+jfW9YkqUrcaY75IPicm2pHR8DLA9Uup6CueFuOKMXFmS3jUamhFW
	 zlU4HwQ/lkd5hztO9v7djPsfnHbFqkS+9RNlyy0vqtHlnmnmj3ou+sBzhFf7Q62kiuECg
	 lmX1gZP7mSbg4p+0AdaX6Nj4Xj4tO+K5yE5KDDZOcHOZyQOy4pKRdYw4oi+bX6nJ5/ewP
	 BKmWrfDkms36kAl1zHN/EZ6IWJpJC/4Tgqpw6ZCRPy+7neDWAR0tPM14rUmyU1pk0Jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794483606;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=VmudOlYzKuyF8nJTc3mFuzpqRfR0BM4YC36DH+65758=;
	b=hrWxF+qakrCw65xPBYdFfbBz82JJIBM4g6J/lYAYFpxWWteePXHXzNWnj8hxW4WEIFIK
	 SAqI2eNj4xiYWeX+8sLNY3XLh+8lpmktC0894fl+5C0kM+1/27Bh0JHjVeUcyr2pGZ7mY
	 8yXlX9StqDakDhB4bs2jtrKLaX3UGCar546ER/upjk/WyiqAetXxgaXGTUyx//B98Jf8s
	 m715Wb7b3Qxuzl1NCu0wx5ly9TaMEOyEUbD07qFyVo/s1709fV0hBA9fCO4tddxUu04iY
	 xkTBfc9lJtb+F1TYo3HH3shozAmJCfrcdQkqeB7eyf+73UHuXHsmfA7VkejMlwlZ2aA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cBHXdmWj;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C404F606A8B9
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 11:40:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C404F606A8B9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cBHXdmWj
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so6252204eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 03:40:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794483605; x=1795088405; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VmudOlYzKuyF8nJTc3mFuzpqRfR0BM4YC36DH+65758=;
        b=cBHXdmWjd5PSdJdALXlPRiY+Gbu3JtX/fpgTkexsTEU+e6rGz30LREHkxLTk9hiVrf
         LNUvX/eB2l+J/XOY0MkxUf+5Kgex5BlnISeCqF9cAkwhdL1n2e/Bj6VV4yR2WNOW6LWh
         BnKvmL6WOxdQk3FP0TvIftOtOvhKTOt25VzFUqWQ9NLJU5FQeWsyVSwW3QZH7XGbipMp
         4ks5bZwp7ffMV8HGSBP7/DlJiCT3OldVfB/TjvqxH3AsencJyTqsiKzKIx2vmQbF9Hu+
         XpcTCwevvEw81u3T8m35CJYbZFZabzwkeMUJZKdn1e/kQNAm8pNUIWpaQXb18hGRF1p9
         CuKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794483605; x=1795088405;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VmudOlYzKuyF8nJTc3mFuzpqRfR0BM4YC36DH+65758=;
        b=BdKHPZyz7bSVfw6wFWvwcMgFxynvMNxkEGjygxAVLcwOw6w+k70wBP+KGQAW9trfu5
         mndhLPuN9EYAcNv5Nps0znaifZDuznn7Jyy0ieW0scoxJ8fCDJzYSgOi3R4jE7aY81lw
         UJSQhC8cWT2M9iSVerI5OuVYXB3ex/gw8hnlQO7mfNeIGzuuPE9lbanootYrri91hzma
         d9cRtRoVafFfpa2lSy1O/s7xZ8hLHCku2f/QZ7xev5D7C6Bl9fSle4mhDlYjYeTH2ddu
         X7px529DPOQWoUN74siCy1UHzaPtPGmvmwybXADwAVnfDUYLvjBxKtXRw4hAk0umMrHd
         +q+w==
X-Forwarded-Encrypted: i=1; AL+hErFH/IfFenlik3xI/IdH+q/DxKSanS+ZjqdftuePp/Uut+8k1Zail46Ud304djvOzt6V5ivMaS8PVrPkaMRU@vger.kernel.org
X-Gm-Message-State: APuU4Z/MFokSSjPswtcXIC0SJ/fYnCErSFjT5Xmgm/2IhlA/PDKxbINc
	94FEyFNNB8w38azEZGoa2TqDY9YLg+9ajwxffOAe7N9b2G1v0+SWEAzk
X-Gm-Gg: AYBFou3U9gPK027XRIfEKijQr/VJ8P2aoZVomk2IUy5+hF9Ah7rqeviPqwDy3W0+Oww
	h45JpVtLTU7J/+HMqeMTwhIfhBKD4MlgySJKVPaKEMaBZMrdJ2BeZgbKpJtOvRBelyQzN0M4m+1
	CVu6nSysVo/XK7C5oXJLeJPfOLea5vD51oI0fM7QFgnzLVgXrGv1zZFGoZSsuFNgRRy0AdSKUq5
	ZlDWIbJdscpDJyMyH/NCvmtREooq+Y5L6NjDEEXq1Sb81Gd+v3WRMAXGpwQwYAD9d58ClD7V7rk
	u6ZhDLh67gjaWKR1NH5jSfaHwAtfzynxzUIGiNuEpT8mePYPKZUxOm7Akzl3VhnWkP2DnmKI1jt
	Ps2/qS/UgEeoZ32RCe/6hdCwFVQacfj+69hhy71zJMu+sq/pGmxv3240ufnDiuag9uL8/K0WikS
	1ycgjt+heDPORJRvuLHYmnqzvp+vdrCcBse4KKykwuje7aBCg/sEWvhIYOZ5n68bxJjJV32BNAI
	Nq1oqAeOEAnJiQqtKuu3emSdpYPcKemh6m7fuUQmiLHOGRzZuN7M3RW0byZrZYU3/Na+MCDPWzN
	JtSdNi/fxoWGyLc2YJpLQJ3BYkdB2YtXQbqcbMihHw==
X-Received: by 2002:a05:7301:508e:b0:36a:1434:c691 with SMTP id 5a478bee46e88-37686171ea2mr4966182eec.14.1794483604509;
        Thu, 12 Nov 2026 03:40:04 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([180.67.33.100])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212e9e03sm50310345eec.23.2026.11.12.03.40.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 03:40:04 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: sashiko-bot@kernel.org,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-usb@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: kaanapali: Mark the USB controller as a Type-C mode switch
Date: Thu, 12 Nov 2026 20:40:04 +0900
Message-ID: <20261112114004.182-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <sashiko-outbox-195550@kernel.org>
References: <20261103135057.1682-1-26rote@gmail.com> <20261103135057.1682-4-26rote@gmail.com> <sashiko-outbox-195550@kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue, 03 Nov 2026 15:05:12 +0000, sashiko-bot@kernel.org wrote:
> [Severity: Medium]
> Can enabling mode-switch on the Kaanapali USB controller trigger a race
> between dwc3_qcom_mux_set() and system suspend/resume in
> drivers/usb/dwc3/dwc3-qcom.c?
[...]

Yes. This is the same race as in your review of patch 2, and the fix
is in the driver. In v3 the mux callback no longer resumes the glue.
From the start of a runtime or system suspend until the core has
resumed, it only records the state. dwc3_qcom_resume() applies it
before the core resumes. v3 also compares with the clock selected in
QSCRATCH instead of a cached value, so a selection lost with QSCRATCH
in system suspend is restored on resume.

As Krzysztof asked, the DTS patch is now sent on its own:
https://lore.kernel.org/all/20261112113921.1143-1-26rote@gmail.com/

Thanks,
Joonhoe Kim
