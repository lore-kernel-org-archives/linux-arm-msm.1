Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792758876;
	b=240gbNXMKDBKhc5/aU3DTsAxfOO874CA0HYVYRBnu3246XbNog6lZa7ZAIHYw/iCXjWj
	 vEyAU/Uc709u/ecrP4y6RVnpIL59/v+D1NVzgOzVa0F6wm3l8baECn8YfjH8Yy18Ldtlg
	 xwGEn5YzXH2D356St4j/ZfD2+cehwgi+JtzjqlX+a842NCpEUUrdHTC0/nXqz9puBvCV1
	 58r9OjXzq23z0vLM4Ncq+RQQt/FcprwzOS/sD9Rq+NoESNCvIGfkNB2fR3OQGwqrw8SaY
	 EKkR0VgaMtIB5tmDngJ0RnXFPwv0pU0n305smVRQfO1d5TiwCSGzlWmXcyISP0IM+Lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792758876;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GbI9dWRYHQC4FFZk8/mMBImcoolC/UhXap4+Lg16pBQ=;
	b=4YVI0yhE7F6bpOgOCe9UN3iuTSES5q2l39S6SAPhtj4PNRRo+pI8I/OS/7pwdvQ+jeMD
	 /s66wQe9JkQ7woPdTow6EY1jysFo2H8NLl2+Drh7S2ZsSU3ZGkqrKZkEQVuCSV4cTU0Dl
	 qU6MAEX7xByTvGPVsXmcgPebl6XVFguaVZfPvNwTrLq4qzV6W/sn551pKPFZi36z2nMu3
	 DySdawxFpqO9scOvRG9IaR9nzn4L6xpZDnLORvWidTuYO4HgNdX6Tf56lBblodEGwmFR8
	 NZ2WVqv5MFxaNS6DNGAyh6FhtqRdgsycNVSgq+7RJdv3LZeuwodQDBS+FL6StsHo7vQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ePFoj4Ji;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F01F7606A320
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 12:34:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F01F7606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ePFoj4Ji
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so480801a91.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 05:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792758875; x=1793363675; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GbI9dWRYHQC4FFZk8/mMBImcoolC/UhXap4+Lg16pBQ=;
        b=ePFoj4Ji6UHC64tiavSfZtLS19cFHWa1RIj49Ihu0WgCjTj2eFsnrdkfPYSD0DN3xl
         gfhn9yka82e7p/ZwJZurTV6x4+I5M6k7+zBV3NCM2SYWIEYyWz9Vjt9lLNBvmXFXkmOo
         rPUA/V2XXYemSU0f8ranX3yXG5eKLF0HZ45o6NsHSCVMs7S5tr26XFER5LWndeIhtzPo
         XY7uAMvzrmYoKR6AUkGtV6ialZhpJBCVsMV6fyTcNCwaw41H95tIV1kVgXseYcAbzPyd
         ofgcIIsVMRys77aeNnETAAplDW9ALACdWziyrrZni/7WXxpUMshhY0eeFxTA35STSbba
         6H3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792758875; x=1793363675;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GbI9dWRYHQC4FFZk8/mMBImcoolC/UhXap4+Lg16pBQ=;
        b=kmh3xqVF2BQVly4uQI0IDFJIjvyxa5TBqQ8meHwn2aZ2d8vQvpt4TTkh1CwEdiTU0h
         5aUgdyDodlYAnaUZDmwMHMus1xdz+7jj+HGg6jQvDh8yHhjvkI7KQfnx2rfMsJx/a1xZ
         20Op1fDa9a4pQ56CeaFDgJWB1vpIeVGvY4dzDxoOfTyywKb0BhuGp729iSiQSt9/baLk
         MgCo9DwMIwqcBizmJ7hyLklb7kT2Uf5GLXlVpe9gY2RAXlWjt3oE08KSCKWNWyVxhn+S
         doJByXGuztYsU5aX0t7+7ExYznjv8ZyUp3DgCRtOS/tQFhOuDfY6VU8zkN29ig1pEWOf
         e/Yg==
X-Forwarded-Encrypted: i=1; AKwUvBxkf9L0Qae2HDENl4aTh/DjQk2rQBRvv+JJjq4FkZytQpxuKYTl72l04paoPqm2LOQs/THmWXFR2QSE4cnK@vger.kernel.org
X-Gm-Message-State: AFq9FYLb3Z8t3fYi8dPIX5dq3oKczuKYVisPFu11+vQ2GGrljBCzL+ZT
	WMzMiqmQ3tFRDAmiPrvg5xsKxmJSCYue3ktDrGHGxjHlkm2Ac3l2ArtA
X-Gm-Gg: AYBFou1XxBP+9EnNFkkWuxr8y7xtpFEmNThSOfAvE58zt+oGKncE9Lmf/WaT7dq5zR3
	sxqnUMLUiel+eMhCWZyfkfPSgoJy+yD7YBzP7ZGIgHSzZu4VrbZn67RQCqqiNYu9x/tH7i/cy1z
	vLR3rE2FlqFe3b/pfA/BVCMfL2SDz9FP2ZJW4g9EXY59TtXMvs/fTfhLuIg0kVpMHoXCsN1/PMF
	VbujVQekTjj/2J4FxfUW+yneq/ld++EqP0ouGDUxRxNu6L2A1/CWpW0lhsAO5FeRc6NFnsgqbxH
	L1OdRFdZxUyzRSiADnd6d61pW6evewnJOJ63Sg4AQ2FbDCs5kbjVMXsboOx2XYrv60fAXQcdY1A
	gYuBEjeeQvC7AF6r9e1wHUALxG+vjkUJpXdQO+/0tV+vW9plAOW9R75ZkabRcvYxngANH7PdY4O
	qptvKnoSlik1PZIcHK6JGt20iQKBqfbF9t7IvlmvtUOou7kxgsS4Zi1lGMz4BdMUjFusqrkCSVc
	c3qsE5w/TrKRCwL/urwBXTVSf7k5yqjECk3SEAd3U6Y7ikxZMvThX38MwwS00crKpTrE2M=
X-Received: by 2002:a17:90a:d007:b0:3ac:9a5e:9ce9 with SMTP id 98e67ed59e1d1-3adce02dfbdmr1807811a91.29.1792758875260;
        Fri, 23 Oct 2026 05:34:35 -0700 (PDT)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3addd8864f0sm110001a91.17.2026.10.23.05.34.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 05:34:34 -0700 (PDT)
From: Joonhoe Kim <26rote@gmail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: mani@kernel.org,
	mkp@kernel.org,
	James.Bottomley@HansenPartnership.com,
	bvanassche@acm.org,
	linux-arm-msm@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] scsi: ufs: qcom: Reprogram ESI after a host controller reset
Date: Fri, 23 Oct 2026 21:34:29 +0900
Message-ID: <20261023123429.1967-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <a3298437-21c9-4b91-94f0-417d92045afc@oss.qualcomm.com>
References: <20261022165006.1275-1-26rote@gmail.com> <a3298437-21c9-4b91-94f0-417d92045afc@oss.qualcomm.com>
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

On 10/23/26 9:45 AM, Konrad Dybcio wrote:
> I'm not sure it's related, but with this change, do you still need
>
> https://lore.kernel.org/linux-arm-msm/20261007143716.2161-1-26rote@gmail.com/
>
> ?

Yes, they fix different problems.

With MCQ enabled (which needs DT changes not yet upstream for
Kaanapali) and without FORCE_MEM_CORE_ON on the UFS PHY AXI clock, the
MCQ configuration is not retained over s2idle. The first command after
resume then triggers an SMMU fault and the error handler resets the
host; on my device that happened on almost every resume. With the clock
patch the configuration is retained, and I have not seen a reset over
s2idle since.

This patch is about any host reset, e.g. from the error handler after a
UIC error: the reset clears the ESI registers, and ufs_qcom_config_esi()
does not program them again, so completions fall back to the legacy
interrupt. It does nothing about the s2idle faults themselves.

Thanks,
Joonhoe Kim
