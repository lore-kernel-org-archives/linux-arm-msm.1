Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792802524;
	b=FchgenhVLc4ZOb31/sXFkFZWOAFlgh/E32yxp6Ahr4hmpT/jZvy3J4HI1V3vD6G8k053
	 VWhLHxSy4zvEAEnT1oi7IkCOjUzqEc9sRv3kzrqZ7anuEHBpyAGXsp+gbLLPcVHstQTOs
	 i0b0gOQI0dSK92oVHdeJqCAP3By1Ax+FmVwkAwXKnJZM8QZXO8ACbbubwZliJ5+K1SNHA
	 xOesDWvlBMhOfk+5IkQYJSvYX+mvAXOs9UPeQsKvz5A7+QY1ZQUGYPZMKNGK7qxWo1clL
	 yyqr7udPGAzRysCiYJ6pqw/BfvFZZBl5wVTz4cLve2Y3bsd5flDciKTiHuN2H/5Eiig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792802524;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/XRXSv4fVHsC4ziboqWGIFRRdg8cj1bRHxSMe4gZ92A=;
	b=XXUATipIzjCtKU5G+L3n/CY+vAWk2PyjuxAZIWI3iMFf59bE988GEKtmFhwOy0eBvaPM
	 OrjAQTm7H7rYz+zR4rxRj5TioCWNRQV/vJTqZFz64ons++o03K6aWd+t6zgtUCe8Udeua
	 SE46VerdbviLIHZq8xTlK8OXDmFNpbQ3WBjZkeVkMhqdpPo91wdPtoRWXum4+n0hFKsdC
	 Krlrsk8fVekxHDoatFWcHZ1oQGp4ubrHPZVfaAiMpX+Tn/lRwIuvSmiow1SmaCE3M+utR
	 J4bzCEZ3vur4fEOAqmrZm/LUIK5fQdwRdWWDYH14y2j7gCQMqYPAEHj+HJEXfaF9N/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=l1kNxS3r;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23E38606A31B
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 00:42:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23E38606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=l1kNxS3r
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-15ea896ddc8so2241875c88.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 17:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792802523; x=1793407323; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/XRXSv4fVHsC4ziboqWGIFRRdg8cj1bRHxSMe4gZ92A=;
        b=l1kNxS3r1BfdUFvUMKH7y1fh2OhEiUVnI2T5QKHo939GmXIeIk9Z6PxMsOccC+2wLA
         lRoB0mH+lRb6FY/eZmH9U9R2MZ8yD74jAFiRhiNj+CBoBV1EM1TG2kKho1LrvgkLLWtG
         NUtt2GrObPMgt0iBvyrk4z9aymonlMIiJa5OElTV2EV0/TzLie0HWxBn6COIJW0sb/J0
         HUCTUn5tU1Hkb+KmophqyHFLz8kYpAM20AGuYpAzNB9+qWO4HN3bNxCCpJ6rIsVhhalY
         ehzpW7TzyMTqTIz/c7ROPF50UW4FWu/5gmAaGtbgwr4R3Es8XCilXuSWkV21s6L780Qe
         KEKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792802523; x=1793407323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/XRXSv4fVHsC4ziboqWGIFRRdg8cj1bRHxSMe4gZ92A=;
        b=pufIT+zt1G+e9W2dsC07JLnXoNT1Yj/mZtv/yn9D4DMC4nuh3s3uUaYMQSe8o50DCZ
         6E6W9/0p2+ZKAj4RbPPekStT2zQ9hDkFrigOZwNNg8zop7r/fjmwGSl7apzcYkJHGgd9
         fhIbGgdXdTHYMO/Ohjpjq7hldYd+accY/XCN8LMOi1o61RkoHojn16XR2RmIV+CC/1PC
         SPQvSLwkrvkNb+uP8zpU/Y5FYcVwMZSD2jVNStUuVBlrBHDo7QrmYvmAnsX6ZHV7kt/+
         lSbFALBNTQQ0tZba5IBdn8zgRPdmCEPRtauRhkLTCYgvcsWbsQxip8GRsV/NtIEtebwA
         fkLA==
X-Forwarded-Encrypted: i=1; AKwUvBzUndpVsFzldfQmEd2xuXJ7yEGKqOr0pf2aibHcZc1qVpGg+qNP4KwJM3tHYQbMkToBu+yDL+4bFskzKo59@vger.kernel.org
X-Gm-Message-State: AFq9FYLSBuleYdWevXpn/ULw8EGJJeMX+dYASsNgTC1ZJR5vGQ1nC1p+
	JBVw0HD6mVk6UEx8gxEXSVMqpbCoUFNo06YxqiFAguu7c7yLtMkw4FzW
X-Gm-Gg: AYBFou1oRMQv3WRfncy8oo8BbG5K/fRPt1hU8OhZiFx4C9Hjs60pQoh8nyCRXSCZME5
	LuyEeekoh5hWqLaXlKKnvD0eZPeTGIWFvuhNbXwIcp/buuNIL3jBH9HDY71QIfN2PZJVAm0PQb3
	INLc7ZFdi/DFGraRvtfUGQSs1c1LXtMYjw2qBynITPmyQ22cHn8+9Tpq0Xg2vZKt6DkV4CzB0ZJ
	mlhGvZJXAP6pj36nhemSxxp8ylJPbhapccoWc/50ecoK5pCFRksqLJsvkLGYgvYb4RRXfMMKEr4
	1Hgph2ZjF+4SNniyIzz67VOliV8g4ByxSCqOwH2elQbWtSCLb24+b2VZYaAoDs9RHwhq8W7UCbc
	AybwAEJCqou9AEnaVVbN+s/QbRX+YLvWiHkQFX3mJyoV0WWWGVm2TkvWX5nzVUGcxO+py5MFNr3
	xN+weUt4B8+4QPcUkVbr32688Oa4sdhJ9sCdGRX+ygrQ/pD+pXfL17R5oFyrYaWIXe9rZCEMeaE
	LuleGVFM4jFSsNuDbnE2hZzXyS2pjEl/erJoiX+MdogkNLa8WryQfq8LPZKylwP+wcMPdiV3s7i
	GbnfbBrCmIHiNYnUnVE6Tho4qEIhikCC
X-Received: by 2002:a05:7022:3b8c:b0:190:3950:43e2 with SMTP id a92af1059eb24-19933f05581mr963161c88.8.1792802523106;
        Fri, 23 Oct 2026 17:42:03 -0700 (PDT)
Received: from ryu.remote.fontis.id.au ([2403:5814:a404:0:f5b3:4c58:d5d1:e6e6])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a37c88aasm1697548c88.23.2026.10.23.17.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 17:42:02 -0700 (PDT)
From: lloyd.hazlett@gmail.com
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Lloyd Hazlett <lloyd.hazlett@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: Re: [PATCH RFC RFT] drm/msm: adreno: attach the GMU device to a driver
Date: Sat, 24 Oct 2026 11:41:07 +1100
Message-ID: <20261024004108.2084140-1-lloyd.hazlett@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20251022-topic-adreno-attach-gmu-to-driver-v1-1-999037f7c83e@linaro.org>
References: <20251022-topic-adreno-attach-gmu-to-driver-v1-1-999037f7c83e@linaro.org>
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

From: Lloyd Hazlett <lloyd.hazlett@gmail.com>

> Does this *actually* cause any harm, by the way?
>
> For example on x1e, GMU refers to 2 GPU_CC GDSCs, GPU_CC refers
> to a pair of GCC clocks and GCC refers to VDD_CX
>
> and I see these prints, yet:
>
> /sys/kernel/debug/pm_genpd/gpu_cx_gdsc/current_state:off-0
> /sys/kernel/debug/pm_genpd/gpu_gx_gdsc/current_state:off-0

I may well be missing something, but on an ASUS Zenbook A14 (x1e80100,
next-20261001) the GCC half of that message does seem to cost
something. The GPU_CC domains here are off as you describe; it is the
GCC ones that stay on.

Every GDSC the firmware hands over enabled is registered powered-on,
genpd records that as stay_on, and genpd_power_off() returns on that
flag before it looks at consumers. So nothing downstream can release
them. Unbinding dwc3-qcom, runtime-suspending the controllers and
booting without pd_ignore_unused each made no difference.

UFS is the clearest case: ufshc@1d84000 is status = "disabled" with no
driver bound, and gcc_ufs_phy_gdsc and gcc_ufs_mem_phy_gdsc still read
"on" through a suspend.

With fw_devlink.sync_state=timeout, seven domains let go - both UFS,
gcc_usb30_tert_gdsc and gcc_usb20_prim_gdsc straight away, and
gcc_usb30_{prim,sec,mp}_gdsc once xhci-hcd and dwc3-qcom are also
allowed to runtime-suspend. Their idle_states show Usage 1, Rejected 0.

Suspend draw on battery, same kernel either side, both windows ~99%
suspended:

  domains held on   23.3 Wh / 21.3 h   1.09 W
  seven released     2.0 Wh /  2.3 h   0.87 W

The windows are very different lengths, so to be clear about which way
that cuts: the long one is the most reliable figure I have for the
held-on case, and shorter runs of that same configuration came out
higher, between 1.1 and 1.7 W. Taking the lowest of them makes ~20%
the conservative reading. It is not the whole problem, since this
machine never reaches cxsd either way. It may relate to your note in
the same mail that cx sits at perf_state 256 "because of USB3 votes":
those GDSCs cannot collapse, so the votes stay.

The same thing happens here with a second device, in case that is
useful:

  qnoc-x1e80100 interconnect-1:       sync_state() pending due to 1dfa000.crypto
  qnoc-x1e80100 1700000.interconnect: sync_state() pending due to 1dfa000.crypto

1dfa000.crypto is enabled in DT but qce is not built here, so it never
probes. Any consumer that never binds seems to do this to its provider,
so the GMU may be the most visible case rather than the only one.

I have not tested the patch itself - the GMU here has no driver bound,
which is what led me to the thread. This is only evidence that the
motivation holds on x1e80100.

Assisted-by: Claude:claude-opus-5 [claude-code]
