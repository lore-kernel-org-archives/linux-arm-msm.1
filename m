Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795201011;
	b=iiV0NV4D04L3KC9wQKrfVroZR9Du5FB/AUKZ/uEmlOOSsK5ObrJWIXpSn5qH38wh0Axv
	 3jhYKRuATY3o926GL92MQ6vbnjXY9PYr53YwveYuP1I3SOxkRYzHqBtuaSFuIAcLg3Vdm
	 XFwDbs7d6DwhAKRERMECvR9ThTFANElRIPNEiFsutOJaPd7efavKSHIGgZ0jIe22Bvdr6
	 A16YK5wPUgWvYrhwKky46CrcLehyEoKbbPkbL1d1PmKdNRv6cimIIIpC3lgapHyp+NFTZ
	 ae8SjKL5ASSzeaY0Yc9WYxBpAvauXnHg/huKopHmemQSJ8c/vqyJsomg9AxRKH40ShA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795201011;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=MbVQtId4GZJpOwZIgQ5IVkC1l8C9teB2jkENg0QieKg=;
	b=Nl/2rzLHP5QZKI+fRTPOZopPrg0+2MWzEJQeXsxZOfxygGCWwyiI8nDfNvE4LnA6JM5Q
	 ykVOvC87K+eR5rSy5dtLiTFiZs/BOeoY/n2QpTOXrJ9BXr0RS2K0vaUhj7qz1dmoICBdT
	 hJHATNcfyvQB87G1naohP49mapQIhJZX6Kaw8qoyIT730Rf123jFSNSA4zb8x0WA6cKi1
	 in0gBzCgLTbGzcu2uFdhtBp24K+/o587GysddZKo+GPYfkxUYVEdyDAvVVGxFyqWkgXNo
	 VT7wMrpDUkhpda2rV3aLD8DPjse4enZKXNhX6fFBB0nkr8NNa89iHFHFi7T7b1u3+NQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r8GQQw9t;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942BD60A2607
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 18:56:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 942BD60A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r8GQQw9t
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2f03920c4a0so8538355ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 10:56:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795201010; x=1795805810; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MbVQtId4GZJpOwZIgQ5IVkC1l8C9teB2jkENg0QieKg=;
        b=r8GQQw9tdT3JOh+6FNwiH/8laGLkVWuAdVc6z6ZwV4kBuFi5o/1q6BThpy4rU7X1fs
         TuK8QuWm48oz7IzcriEy8yV3tCvCGN1QU+PjHPwsmFaGHK5OaevpI6Nb7PPxNiq1mr4b
         a+Zg3dqp2LZSApuR250ogcTr0aMkngN70Rx1h8Jlyoa62yEbl5Vkh2BneroA7at+k3PT
         zHec/Y8bHDpQ8Kc9ETuh1CXi/orZMal93vpieAuHFLGBDnqhMgwzs5FOZ7eVUk/aa7/k
         zEWIBoX4cdB/pxY8WqnwBjGOw7lmI38HIYIujaik8O7UAtopthj4VpCZm4/bqwtefwVL
         ft7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795201010; x=1795805810;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MbVQtId4GZJpOwZIgQ5IVkC1l8C9teB2jkENg0QieKg=;
        b=JyvAkjcZuWjNjjuQyGMCXcCpa9Owdh2nbEqV3lm2k76n0ZVxn+ZmSJ6BeimUXNDjFb
         YxV6UD5oMoI9Ro1FRSTLW0DX4w4LOGyqmBc4F4dqJzrIXH8fxKY8plzmsHsWReGLXmd4
         vihE03HhvRQtxmPFs1FY6fh2JeJ9Jq8B0uDHi4JAId2EVgKmpvyNuybeZWU2HIC9raA5
         9x4NOEfDUnEUdw1KSzjSPuWF0NCOmodcDyMgq4OzPSSdi2+joFuZNL4k5HqRUx1Y+qIn
         WEHjlJixInrSG+AdWDvbHLmUS93hgT7Q0wnEUkPbU+aJrlo3hNJFQe2TwrjKc40d9g+p
         3o4w==
X-Forwarded-Encrypted: i=1; AL+hErHgITtA4yqBn+PA1LokhzZ5HHSgLTXi1uMrS6Obg9MVllRqN+Z1t7aW5yVdsIoWBZTCXuXaZpqnxBcS5sZy@vger.kernel.org
X-Gm-Message-State: APuU4Z9wtbQmDROkkT+UCb9HFK6RUL0FwQzXe3OIRtma/uWFzPT3BaUh
	8SV+3fTNUC37bKuGi/XMUamTUov3P1KOIIbDhzktsY8ci5b+vwrgE3JOtoqo42qPuPM=
X-Gm-Gg: AZFdTZfRgjphSKclWPFz174hAPp0lYnBNY4NnzTh1gCVeJ5pgTfaHyk2oKJbQEddrOf
	KrT8IZ3xR6FxAuzKVPft12OBNvPZb3Jv1vB8EXd7y50pYUM1jST8PpP961nfb+/kdxHyDbPkrj+
	U4gRPjIaSdIty/yM7y2YSjEaZqkAgiHM52swZ6sypcW4iwRX6waKa3ExgHMtdM9JsMmiQ4lBWg8
	ea/mno7pBGXX871fK4zI73VS1RH2EHsqQnE1qs4xaA1fo29s1eyfU2UrBDjpWB//EquxJ3mvqoQ
	jcnRtI2rtHcXSkS+zs/WNNdC5PewHbtLuQC3/LcnCRBUKnYyOhrgi7qAwkvr1Upv94yYHtC1P82
	NlO6CbrRH01973DhKWX6ldIi44KiTyLlLcURsqQ6cm//82TXDNVmbZcE//DEP9tRK1/so6SoYTw
	1MaVm8x5O60Acm1w9p8RQsadgyRz3I3ihcMbqP5FJZ9YPnkSL+rfj2iB1+GdcBJbA+DnwLAn1xr
	8Nzu5QHyBwUV2SUcqaPDrvzRMTZD9/M9MQn5MLupt+k8gDnac5IAcFtlfXZTERQWQPrQxMYLJoR
	6YoMlhBMTetnk/Jx5zOaETFRuOORb2pMIkxlOw==
X-Received: by 2002:a17:90b:3c11:b0:3a6:f1d2:57f3 with SMTP id 98e67ed59e1d1-3b41c97bc96mr3964802a91.58.1795201009657;
        Fri, 20 Nov 2026 10:56:49 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([2001:e60:8509:ba6c:ade5:705a:60d1:a474])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d639fdsm8484216a91.10.2026.11.20.10.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 10:56:48 -0800 (PST)
From: joonhoekim <26rote@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Joonhoe Kim <26rote@gmail.com>,
	Thinh.Nguyen@synopsys.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	heikki.krogerus@linux.intel.com,
	abel.vesa@oss.qualcomm.com,
	abelvesa@kernel.org,
	wesley.cheng@oss.qualcomm.com,
	krishna.kurapati@oss.qualcomm.com,
	konrad.dybcio@oss.qualcomm.com,
	dmitry.baryshkov@oss.qualcomm.com,
	neil.armstrong@linaro.org,
	val@packett.cool,
	balaji.kalkonda@oss.qualcomm.com,
	tvlad744@gmail.com,
	effeffe99@gmail.com,
	prashanth.k@oss.qualcomm.com,
	yongxing.mou@oss.qualcomm.com,
	peter.chen@oss.qualcomm.com,
	tapas.rana@oss.qualcomm.com,
	vkoul@kernel.org,
	linux-phy@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] usb: dwc3: qcom: Use the UTMI clock as PIPE clock in DisplayPort-only modes
Date: Sat, 21 Nov 2026 03:56:42 +0900
Message-ID: <20261120185642.1188-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <2026112017-flyover-grape-cee7@gregkh>
References: <20261119124558.1548-1-26rote@gmail.com> <20261119124558.1548-3-26rote@gmail.com> <2026112017-flyover-grape-cee7@gregkh>
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

From: Joonhoe Kim <26rote@gmail.com>

On Fri, Nov 20, 2026 at 04:07:21PM +0100, Greg KH wrote:
> > -static void dwc3_qcom_select_utmi_clk(struct dwc3_qcom *qcom)
> > +static void dwc3_qcom_select_utmi_clk(struct dwc3_qcom *qcom, bool utmi)
>
> What does that bool mean? That's going to be a pain, please make this 2
> functions so you know what is happening when you call it.

Will do in v5: dwc3_qcom_select_utmi_clk() stays as it is upstream, and
a new dwc3_qcom_select_pipe_clk() goes back to the PIPE clock.

> > +	mutex_lock(&qcom->pipe_clk_lock);
>
> Why no guard() use here?

v3 used guard() and scoped_guard() for this lock. Krzysztof preferred
plain mutex_lock()/mutex_unlock() where nothing returns early [1], so I
changed it in v4. I'll go back to guard() for this lock in v5, unless
Krzysztof objects.

[1] https://lore.kernel.org/all/20261113-artificial-quixotic-firefly-84baef@quoll/

Thanks,
Joonhoe Kim
