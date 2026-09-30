Received: from mail-pz2-f38.google.com (mail-pz2-f38.google.com [74.125.228.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D315187EB
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 18:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790793517; cv=none; b=fuUNFp3BlYe+XQND6ZLwkyFzE17VkaLvdTZMQx559J7e1yKp/dPZoxiZ5UQno/N5IDn3M7MFcg1RzbmuJg1alY56fm9VWKN2yPLa9rM1yQrGdG8fZcV1kEcbabmWbCK/nk8chd/SZf1cs2VB9PydTmpy4iDeIYD+9WUXq0X1pFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790793517; c=relaxed/simple;
	bh=GGi6ovI4LcDEis/cX9YUCASZQ/XVD4U6AA7Pt2oLAug=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e2FyZKVDJ9+s6k389BtSc7VXUT7DnRG61Ldo3hzAkOCkisdiozjjo6MR1fy73Uk04VlR6wcZxnHoA1rneduMs/loyb1gLmJfeEwbK11qsnS0NTGiQBdiO+8UwRCbV+DrGcd4ejfMZ93HYtELS+8L+1ONQ9GN9VPJ1yLZ7ItTpCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eZKy5zQ3; arc=none smtp.client-ip=74.125.228.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eZKy5zQ3"
Received: by mail-pz2-f38.google.com with SMTP id d2e1a72fcca58-881a3a28e72so2078933b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 11:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790793515; x=1791398315; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GGi6ovI4LcDEis/cX9YUCASZQ/XVD4U6AA7Pt2oLAug=;
        b=eZKy5zQ32ZWlKsDmgtISs0ZcDyu4apaPH4FWRV2jGKr5/W+IDOgBx0a7kWkKfs8/B0
         YmcgAiNNp97RCnlBrytLqbB1JFtM7O1lYVGGRu1T2bOOfRTauZ5LF8jGLtQlw4EwdlOI
         q0NtUgIskl65wexwX8taMWdbv0z+xT43JaGIHKyJHXhjlAuZzuyXFdqjvH7epiAz9ZGX
         idDhs5RULedEYd4nb0nRViCyXEa9At9Vn/w8uuSYx50M1JT5BcsWnG8I1YDamNQFbrEt
         nIyKyjcR6Y96BQ4+YfGSDJCumScik2x38PZPMZ+pUcfZkeY6Ow8AQZplVa8U6sUEP1ci
         KIMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790793515; x=1791398315;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GGi6ovI4LcDEis/cX9YUCASZQ/XVD4U6AA7Pt2oLAug=;
        b=hYkEr9L/NQo3cjnwOBvvfVPaez2M797d1pLmnEGq0+X6v/Ixf7gGHFzHUu/BZyTEX7
         b+8Zn2W/dprsr/vFBNrmYmx4MffEcxRPXB9Wbk13uj+yAGdOYi1BsuxRfEhVY1/1wTbz
         q8uc9OrvbW7avlFEcbNuJbgeVWX9/iRBIVaw54UpGRDNaQEJm5sxmj8+KvDI5MIV3xx7
         kuWOGCs3b6COCmqvEcUZYY4ww1aReINstLcr/18Vyp1pXnmJIBAXDqr+Fza9LtoQLHLo
         ncBhACrWXelDqljgJAEYYXCcg1rqoPxEnhxkF+M2Dq0UsCW29+9H5oOuSaiU13cmDhD+
         bCxQ==
X-Forwarded-Encrypted: i=1; AKwUvBxWIorYLtCaOCi34dk3xMRahlbu6YRbavPj9ee2bRh9cjJeeTek3eGbf9PZWYxtBHNAGnwpN1sa62l3vZDs@vger.kernel.org
X-Gm-Message-State: AFuF++lVOVJvx3IGtmig5/P2wLppH2KjWK9Z9quqH2SwPzZaKLgaC54K
	1xvGjqy5aa/WVQAT0IIxZFgjbdAzfdq7SpQRzwCkipDndnm6VIfIrazd
X-Gm-Gg: AYBFou1gQ5Dh7eLcyI7usED7CFaCvEOW5KT5UKrbjqna/gxSf4rIrWRd4VQLOmOT0X3
	mD25o3uco+3j0KZoE2z6A8xiOpEleaFVely0ZAWd8FSyarkpwbzcR6G8saWTQSrusoa+FyH8fZ1
	lBFTbvFLDwA9SuuPSz1+Hqr6SK/9YXaX1sgqSlE8NiAS++84JY73K3/R6cy/RqZzMwBTwxjh7Wh
	igUu4npUjmHVRDUCzo1fNMfVBxS3XRj2sYNdjJdfNW7QLw22DrpvBhLSDHp4GnhCMUpRb1ZXzTy
	Dg6szoWCIbF+UCzKDX494Grln57QQubXO1vLuBOZ2HeXttJCWdeCPCfYIeajCK4HJNPdgAxdWBv
	0ugNjtmLtVkol+Q6KBJq8BNNT3oqzgEbSnlKEZ/qnJShl6ouGj3+OLQBESZsHzpSG9I0iVUUH2H
	VS33zOfDrwfVqveiCQH+b8j8mElvcBoykmJlVor621sxn/hgEguqE9qhIwVCk2axStb99fH5Fhg
	49vCq1JkXEV6bT8uS2az/dHhOihG/hbLTA/ZE1T/ZmuxIehmVJKh9E2WTCNKNiMYpK9zMZJW/ow
	E2+aIzKEA3gcU0dQ/OOpTT94W8MTa6NQHQSy4w+RrhPkS71E
X-Received: by 2002:a05:6a00:4f8d:b0:881:fa65:d4fb with SMTP id d2e1a72fcca58-8874ceb9a8emr1764351b3a.56.1790793514815;
        Wed, 30 Sep 2026 11:38:34 -0700 (PDT)
Received: from rahuls-x2elite ([157.51.37.69])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-888193d1fc9sm47224b3a.33.2026.09.30.11.38.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 11:38:33 -0700 (PDT)
From: Rahul Pon <theflyingrahul@gmail.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Sean Paul <sean@poorly.run>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH msm-next] drm/msm/a8xx: report the GMEM size of the active slices
Date: Thu,  1 Oct 2026 00:08:22 +0530
Message-ID: <20260930183822.1158-1-theflyingrahul@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <d6cb8aa3-1360-47cf-9ec2-e2403974bbed@oss.qualcomm.com>
References: <20260930111711.1160-1-theflyingrahul@gmail.com> <d6cb8aa3-1360-47cf-9ec2-e2403974bbed@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 9/30/2026 6:48 PM, Akhil P Oommen wrote:
> This commit text is incorrect, but the fix is valid. Please use this series
> for Mahua GPU support:
>
> https://lore.kernel.org/lkml/20260925-mahua-gpu-v1-0-0fa0bfd8d315@oss.qualcomm.com/

Thanks for the review, and sorry for the confusion. I hadn't seen your
series. With Glymur's X2-90 entry the driver reported 3 of 4 slices
active, and I took that for a part with a slice fused off.

To be sure I have it right this time: the X2-85 in Mahua is a 3-slice
GPU by design, with its own GMEM size (15.75 MB in your series), and
not an X2-90 with one slice fused off. Is that correct?

I've tested your series (patches 3 and 5) on this laptop (HP OmniBook
5 16, X2E-84-100): the GPU now comes up as chip ID 0x44060030 (speed-bin
fuse 357) with 15.75 MB of GMEM and the GMU firmware loaded, and with
Mesa main, which has the 0x44060030 entry, GNOME Shell and glmark2 render
on the GPU without corruption. I'll reply with my Tested-by on that
thread.

> Please add '()' to improve readability. And it would be easier on eyes, if you
> don't break the line.
>
> Also, reword the commit text to exclude mentioning Mahua. We don't a partial slice SKU
> commercialized yet.

Done in v2, which I'm sending now.

Thanks,
Rahul
