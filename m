Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793657105;
	b=cW790tRdbhAl8OUln7KotIKqUbh2+Xk7MmTqwFw4L1zNianHKiWIRQ1J198FdGdRFKf5
	 ZPcNYONf5S+SprqDQJhmciEh+3Y2L0FwDa5Fu3HczLidVcw607GI/unJQGdyj4sLfU+ln
	 uJOBCcrGe+2IubjA8dGD8iIgxvvjz+BO8yUNmOsyGkzyvSPnozlAzt7ccLFHlrp5BhLcR
	 ZrlzvdQAWObqAXygHMBGnbxXPGAyhOP9hHv5GaYlRsOOy/wh3u0fvvbgI8Kk7DcPYCb4F
	 UunfFuj2mULlRjQlPL9SNe5TRNGS3XEJiqVKMP/LQULpyaNjjgXPgQgz7cmL02GpBTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793657105;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=YgJaaouQ4HjkbJr/WZG70p3Wwx479oigUB8WJp3RE9g=;
	b=IpSF+wJPYp5i6z799G0T/5wi+X3CRu950fL+tqsUoTXguz1jxjv0sUmEiYYsCiMV1bAC
	 F3CMziPhn3aaIpWO9ihRaZqdTygRQSqN2uPlBeX4b83/EtAZ1zJV+qgTWeBR5/aAtoq7y
	 6GXxi+Df7Yz2XrsPVtHlnta/zwW/gHgAEkT8bW5jjCxTxgovCm+ISbCZjG0LJD4jQjW3A
	 mTfT85fu7hozRP3do9i7VETD5WNcb/5VoVWr9g0GHeUPEHomucUvjVfR904hFdAzIvH89
	 Rt4e4ZRfJEzddqeKTZLVrQpRy8rkfIv+ptek51Rp3iPtj20so9JQwJ8cxdxOcuzvacQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AW4zcBfm;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A9D606A33E
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 22:05:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66A9D606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AW4zcBfm
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-36661f953e4so5490637eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 14:05:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793657104; x=1794261904; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YgJaaouQ4HjkbJr/WZG70p3Wwx479oigUB8WJp3RE9g=;
        b=AW4zcBfmp4FsGuGANobnF3IwGmcfPQr4x5MHyPWmd/80LlgrbBHfXgRaZw/uAqzu4o
         F/aOexAM+QCZ6vC+i7Ugtx8MYs5WWmZNUxEf008KZckZi3kCUXiiSAU2iEMEPOtbpoGq
         jd3MxANp/jTCUCIAbWa0QngMqYs8sTD+DeU88X9lzgbCs/08H9rHcTtIchs1zj+OPz4f
         Dsda4NZ7mylQ0SRJGOwVzT6YFY06i//Zv2xOX98KZnUvAdKJ90/aEZlQ0P4VVCTVRa5/
         4FyRLqZUKagOhhZ7mcganFDHV8q0vgMEaWRdY+O/NEkEyVIJCX9Fr7L7NXrE16U8wfWn
         H5TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793657104; x=1794261904;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YgJaaouQ4HjkbJr/WZG70p3Wwx479oigUB8WJp3RE9g=;
        b=XNOxyRf9uGhxhWzkkGh9q3IUQuFmRA464GDXIdk+GIs65fNmyloJw3vLwkffqLn5HR
         wlV3SXzVite2E/7lBfvezWBOIVqSwzgYDr/SRLFxXMcf8QO7+yE9zfauYi8OwP9uH7BW
         tXonSV5mHq2DOogoHyYNqMO9mnBUCeSa8tYq3chXVeeNac+6H++njj4Inx6xrQ3dY8VP
         2SqONSnoXih4F4l6qPP7TEVJzzuxpzlzdZhgiisqEO0aIrDXInrJ5jMjbOiFPO/UDubI
         7vW2Vztqa13AwaxLy/g6c8AJrN930O6qnKX0mOUofgFDk/y0qQzN4KaoyfSTu8Jjyivt
         RtSw==
X-Forwarded-Encrypted: i=1; AKwUvBxG9Kux4eGF1PWTFyDgEofuWuAgUV5cDnaR8PWrPpBSgdIZAcvua1QufqX+fhrCgD6fz2mg6k8oBK7ng02b@vger.kernel.org
X-Gm-Message-State: AFq9FYLklZozyjAY0Ps1nVOJLuDoshhSz4bb+Sft4YMh5jKVlIAsvu4j
	pcVgBXcYOl1+Ry0+IxqhTT3P6FbBK2eskVTCkZwfz5nzohzThCFy6D7P
X-Gm-Gg: AYBFou2a9BZbzX44a5ca45e2P2SIc3KS4XM5bOaP61oLLMjoFQivSKxkcMsSwK+8hql
	xzXFRQbtTkDxgJyEWiRsHcLiViWFee7zVQdLpXH05Ssox+IAY6PqgcLnjoPCeYM7yORjP8aLG6P
	/LC6d9NRn7RixSuYAWKNsGW2B+wId81IXckMOHmcPy6uYmnWKQMBhp7BDbrVR4JvIVyAroHMxhS
	RiIbs+DBUbP+hI5lUuGsMcoH9R1JT3UVSFscCSWEob9+vsBhSmEELBnsMLX6YDOZJ5aRbtY4qDK
	/vfEugE9nuLbFD7w1Uim71DhoQ2SNnLuQ71NYUazp7N1UXEq1stPSafPJ+41b0RturXbw1tX0FW
	/Ij5biAp2gW4g+TcKKvtT0B8ppiZbgd+NEblVbc5ZaJj0qZEXiezuYFlGgF+/prPWQ7W67xRbbR
	KkaNrdeS0MtCOxY9NXnCdIes/070bcfatzIr1dnIVBpI7Zn9j5L2Y9eCx7WyNOGOXvEYYfMAGJN
	yI2e1nWSm+32dHQ0uxIHXiiaaUX7g3YnSe9J6V+X3/xaeER0yHhW1b/S/MI5UJ4S6NDEm37m4xq
	6T8/rh+Dkx50KITbeUXc1CbEFP4iaHpPgb4zD/cP2XGv
X-Received: by 2002:a05:7301:b01:b0:36a:20b8:ee9f with SMTP id 5a478bee46e88-36a42203f98mr15418420eec.1.1793657104432;
        Mon, 02 Nov 2026 14:05:04 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42952e1csm43006249eec.20.2026.11.02.14.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 14:05:03 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Antonino Maniscalco <antomani103@gmail.com>,
	Kalyan Thota <quic_kalyant@quicinc.com>,
	Federico Amedeo Izzo <federico@izzo.pro>,
	Helen Koike <helen.fornazier@gmail.com>,
	Vignesh Raman <vignesh.raman@collabora.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 09/10] drm/msm/dpu: only reassign resources when the encoder is reprogrammed
Date: Tue,  3 Nov 2026 07:05:01 +0900
Message-ID: <20261102220501.1704-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <86bf919b-5528-42bb-aa89-b518452ed7a0@oss.qualcomm.com>
References: <20261024-fd-kms-fix-smmu-v5-0-a5b0b284aead@oss.qualcomm.com> <20261024-fd-kms-fix-smmu-v5-9-a5b0b284aead@oss.qualcomm.com> <86bf919b-5528-42bb-aa89-b518452ed7a0@oss.qualcomm.com>
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

On 10/26/26 10:19 AM, Konrad Dybcio wrote:
> LLM is curious whether turning off CTM/GAMMA should trigger a modeset too.
> My hunch is "yes"

Some data for that. I tested 7/10 and this patch on v7.3, on a Lenovo
Y700 Gen 5 (TB323FU, Kaanapali, bonded DSI) with out-of-tree board
support. I counted msm_dsi_host_power_off/on with kprobes.

- A compositor faded a night light filter in and out twice through
  the legacy CTM property. These are blob -> blob updates only. No
  modesets, no visible blink.

- With no compositor running, a small client set the CTM through the
  legacy property ioctl: two rounds of NULL -> A -> B -> A -> NULL.
  No modesets. The CRTC kept its DSPPs after each A -> NULL.

So turning the CTM off does not release the DSPPs. On chips with a
single DSPP, another CRTC asking for a CTM would then fail
dpu_rm_reserve(), as I noted on v4. This run does not cover the first
NULL -> blob on a CRTC without DSPPs.

As with v4, the tree carries out-of-tree SPR (sub-pixel rendering)
support. For the test, dpu_crtc_needs_dspp() also returned true when
SPR is enabled.

Tested-by: Joonhoe Kim <26rote@gmail.com> # Kaanapali

Thanks,
Joonhoe Kim
