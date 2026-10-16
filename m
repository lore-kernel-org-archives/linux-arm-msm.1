Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FBBF3DC4C9
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 13:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792156841; cv=none; b=ABzEZ14ieOAt2rRgOU1eUWtKaqN44FOIiAxRsn+7lra2kgTo8zardsBOAdWouvn5AFYkvEvInVXAyO6INVZKPR4XUKObA2GRyg2djVliHDC3gUFAyUhozvf5NNjsBy/9CzVUdYEsZXvKuC2k+fYeGEMguX5DLgmMB+06d8S4WsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792156841; c=relaxed/simple;
	bh=8LZRcG4RAXDCcewy5ZGkTw4K/dxAa6eoPk3+1qnhNgs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GcMGIN+yB5TYS5PJQDbr22ji3nH7HAscwjRnzTS0TQNyefo6K4ujBUPOCIRERYyYfCuQ6BybJwfOkvTaa1lxdwy+gFz2IAUXQ0018fgY83NKr8+HRS795XtOMVg/m9EUxJKcDTHHdrc0odA5+6NhKaNlkpy4artIPo2VlhgTf4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZervzatF; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZervzatF"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e86dce4510so33037835ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 06:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792156839; x=1792761639; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8LZRcG4RAXDCcewy5ZGkTw4K/dxAa6eoPk3+1qnhNgs=;
        b=ZervzatFkoo2sXjhZ1M4J+7RUPhjB20lIDF0+czu65Gjrr9NrUEmc51GmMWp5zbm2x
         HhdULtZrHnurc2nJtN9M11X4rRFICm+1nhuggXWKHZy8K/t4wp4HYusiCw0LSjXXIRLw
         +0zpn2VClUnOQW0t5gDM2gdBhZONmtLeNvctPIeGXJXzvB73Vg+mohA8D6BV6lkXm89M
         rtF5P4OTnQKSpGQ8Ofxri8bxU86XUrfKEOlwcEYK+06njysL8IDVgpxkfFnUdarMGlaz
         ddExseChODmoo++5Ie9apti65rLv0VvOOuviKi7nznOysmcYJ1aYtCgxRweNEK+bwe14
         libQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792156839; x=1792761639;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8LZRcG4RAXDCcewy5ZGkTw4K/dxAa6eoPk3+1qnhNgs=;
        b=nM4UMUcqgDFwA/Qqaw4JBmDWlj1ilWRx5y8SsZnT/EyOuDkQWQZKskWRZrC/U4hpLx
         vEyFtIjXgMX45SSNJafBaxP//46AX0ci/q/KYE+dbjiiGigP16Eibp01cdPYudXTpfy2
         /+5f9WFm8oXoK7/7Zz5TF4Wt3vbfaWA99TUOeiAixCXSZmFKWLOSVjmrYAJl311vrtpD
         FmFdzpdy6NhIFtSV6qs9OxMUkhYgaYJswqnd41nUzIvZYIcquFvJAqG5Vvyfka6FeVhD
         w0J/7idMSCe9Uz+MIpyEdq22qkrKFSPjLYmMhBvYh3pmlC/astr9P9gtzo8tAH8GnRom
         ThLg==
X-Forwarded-Encrypted: i=1; AKwUvBzEMwuiuIndiZWDfpkN7lPV9vsIp7Cvivw3YQ2lYRQ7v1n/331dB302ZvsT42L6eXWOJhHAJkdJZpBIosBf@vger.kernel.org
X-Gm-Message-State: AFq9FYIWB4AopwyYwE0IW8y0bKIXT4ppO9O1RjPmKPQoeronsKLoYKvD
	dZrEvqSzHx/j4lUik35m/10tqNX58qsMTe+bl6NToigcppsesZr5dmBD
X-Gm-Gg: AYBFou2PbAZ9UcIP4R+l/HXAJ5/IjwmHkOmjJVTH8yjQjow98P0G7PLkmscpTIU1AXD
	76Gg0l9oITpxgd8pwMm66vIW9pxSwvvYrb4tAwt5MGRWNjE/mh6qb2shpo3tfnQyVQSPVW9EWty
	9Al9ZOoxUw9vEjadCdQE+90geXDFIZ6sMnr4mvqQPXWH+hUKVzsalfutWQXhk6Ch4MjXr8CnauX
	XDZDZQvhyUf3SOqpVlPHXOAAa6FpK9jL08KsFe3u8YbO9IpyK5iOIDnNE1Hy7lD8tUXzDJ/etbY
	r0trvPbfkWT2ydANeh24Scuxi1jbugVPz+t5aQQP/EfDtUBKxMnZfSwljpp8290LnxBR8Je37UA
	WZoABRuoIC0TeO0/uu02TfYLlBh1R2qeX3XydqUIhiHxcgm3tYdjDoiQ7ymAvoiD8e/aV3IEsW2
	efNOgQjO1cq/u1z+ucb0RcOBiRk9oicdFlfCkjqQTpW1P09Q9Q5hsFulhYZ44+nUGbItwdPoGMK
	8LWeftnEYeWxQ==
X-Received: by 2002:a17:902:ea0a:b0:2e9:492e:1688 with SMTP id d9443c01a7336-2e9492e1786mr75900865ad.8.1792156839354;
        Fri, 16 Oct 2026 06:20:39 -0700 (PDT)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e8997edsm10013245ad.63.2026.10.16.06.20.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 06:20:38 -0700 (PDT)
From: Joonhoe Kim <26rote@gmail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: mani@kernel.org,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	christopher.lew@oss.qualcomm.com,
	deepak.singh@oss.qualcomm.com,
	pranav.phansalkar@oss.qualcomm.com,
	andersson@kernel.org,
	linux-arm-msm@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev,
	stable@vger.kernel.org
Subject: Re: [PATCH net] net: qrtr: ns: retry service announcements on -EAGAIN
Date: Fri, 16 Oct 2026 22:20:33 +0900
Message-ID: <20261016132034.711-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <bbdaabf7-ffdb-433d-91fb-f6ca03b0747c@oss.qualcomm.com>
References: <20261016124600.31-1-26rote@gmail.com> <bbdaabf7-ffdb-433d-91fb-f6ca03b0747c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 10/16/26 3:14 PM, Konrad Dybcio wrote:
> Please remember about Assisted-by tags if they apply in your case

It does apply: I used an LLM for the analysis and for writing the
patch. I left the tag off after "docs: remove Assisted-by references"
was queued in docs-next, but I can add it back in v2 or note it below
the "---", whichever you prefer.

Thanks,
Joonhoe Kim
