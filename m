Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5FC23783B0
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 14:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787237280; cv=pass; b=m4I2VIVjNISI5WL5ij9qwaTCb2SpNwqRSiey8uhuDJwr7aVS7TumWPchLPZ24nqixwn3zZ2ou1ACvPU6cqD05ao5sJZOVfICZO0Wx2UKlLBLd6EcQeLzg+8HBg2IMyy/kbl3KgHjcOxDCBWpeNEmaOYvaIHHwhC1tVEgCIZdWQQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787237280; c=relaxed/simple;
	bh=Tj982Jh94LhkkenOX9KGGw0zBOx2N1w5l+SjfXMkOqo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fjaICAgl6CGRYYJ9fnyrUTXYO96AkCbI2GlhUqAD9cWpNZqRKhWNViJiNtWyid+6+jvfUhwmw0WVM1gpxdxiqLvb7wBKEa1peMfHH5rieRPK16nt08zDa/J6F27xXcLK3bFvdx6rPiUK3g04DtGjVMDQTTGgTNkpv2Iy9CW2U5I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kIlzaYIa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d0eiacJQ; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kIlzaYIa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d0eiacJQ"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67KE7U9s3665818
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 14:47:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=yLR4KHznvXfb+H7PWHV2AIGDk1Msa3uBxnhAbjxWO9s=; b=kI
	lzaYIaMnkLJeut0wYrwIzKu5PkJIhncQceAOkWy0QZ+en9V0SahIzZBQ/Wppo6XS
	e2OQQ5dsjGw+/0JN2opJpNdUhvJFbKpEBa4Yuah5jDSD2nB3EMLkmNDZBsY/qOOV
	/uQz6ezGkCfPLaPqCmNE8Yw/T7lIY2GCG7Dur4QGFPGdOqUX4q3ePnNlzPAfd8hg
	w18DDIJ6pn6sBlpf83trCcQyPoUfNxwHqlpgKCOy7oJuJIctvvy46DW3hPkN0x0/
	nqY3CHwpMb6sMB/05dCd8VbDUJuSfzxziFYVVHToUNMt0iCL5l7I0UGfJQ1BitfN
	4YkTEh42f9Ydcsk2BzJQ==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5yg195f7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 14:47:57 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-43cd2d12617so3716781fac.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 07:47:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787237277; cv=none;
        d=google.com; s=arc-20260327;
        b=XPHn7Pvr6/xwYuCRflDWQJdQmKb3bW46WsqO1Wpq0uWCE+qkZo0O2VfPpeAaAd6o2u
         DEgcVBpUZV1Pv0n4naGGCBx0oywVGOKy/zZ8LPHHwVib3OQ6AAz84w6d+rObLCkuXMiH
         Pmwf3jGMPVZhhi/78hCFSTZZqRjWZif/khXVy6PyI/F3tg1PeICYLyk4teNVBbUh5pp7
         9dVq/WnKhECZHE41qpR3nBspKsxlCyOCbJs5/7xBI4FUi0ID1VrrYy5wieXksQubCNf6
         sGAatoQz4Ox7HSCT3e5PdXoSbfrFk86inSfeUU6o+HaFQokuZRpQglyp5AW3yFZ91LD+
         4t5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=yLR4KHznvXfb+H7PWHV2AIGDk1Msa3uBxnhAbjxWO9s=;
        fh=bFzu32D9xop6wNHylRfEasg7XN7yYb8dSEtw7t4OPtg=;
        b=aJWbNIje0QEWuWBDN/Xwpw3V3xU/NpNEKrBCMOWsIeKDlDv+RnndDvNg0GUuDHoHj7
         3DmlCPh5D33hWwD54iIWYBd2h05/Aagx1smEFtKGvK9CEOZuj30SCfMxyndG1wAVANi2
         LjCDWmzvryV40RObYVw0iytFX2maxJdRUiEaSy0NXFKwTjgTUizKEmtnB53H41y6KOyw
         55bkr/3L6NLfpJyQ+ykvneIVYOjiUCLVju9RN8HzLr0h2gumrs/cnUOoo5dM+h7GRwbq
         eM11S+yhiCCh+g/G1K+4HWVH3K2ah2PqzignunYE0dGBY64+Ec+WkbkW8yGeNEI8c5ax
         MHCQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787237277; x=1787842077; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yLR4KHznvXfb+H7PWHV2AIGDk1Msa3uBxnhAbjxWO9s=;
        b=d0eiacJQfZXhCrRBwCNBxbz8BTwijRlkMFN3Cjsv/HGsHDwTVYE/fhyTsqn3kuuqjN
         zSljB9MJkp585AGs0cdUkPnqtHvSCSDb3rYDEoffvI8avbmT9VeGGmWcFqb7SR05ZGv5
         uA8zjEzDtw3QV3ODkgO1Qkpu1q2MWUQY48yiuW7YpT0CLVE14SH1Hxm+CnDewEYHRLFI
         AXL1gDkExwOmy+mlsGXmKHoEqlahuk6Xf6nMHBCHqwR+UmxSnrBNrj0qdjJFWvEiEdt5
         ncJA1EJMNaKRvAkpPRGkaI60iJYLdV7YWTcS1xyXrYXiq774vXZ3L/QuRsJRuYbfuV+X
         OhqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787237277; x=1787842077;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yLR4KHznvXfb+H7PWHV2AIGDk1Msa3uBxnhAbjxWO9s=;
        b=XJeB7fq4zZ3cdQjIrWMRc2IKTl8UyE1GZX21eYzndFmCK4jszeQYK6MhNGaUQTICh7
         mRGXt2PfuivhNzQixRhDTg8hyE+H/SHkfpdDYu+eUi5NxTWel078BmWvmv3CiWtNMO/t
         dT4bBoboOdNo83a8HgbtAKsk5MayZRuyAXVxDDxotjJtgljDU0OzhvCx3zOhEzEtUzSw
         dV45RZuBKxubFVumb3QqAINU/XuF+46rgvVW0gh6G5/67SRO4xV3/lZRTJvqqZ9pgZRb
         HVuy6aFTl+wtpLjDHuIR/AHBuuvqIvUHM0xjYlPflaneVPqBKhAl6bA/R8UkimB0xa/S
         6UJg==
X-Forwarded-Encrypted: i=1; AHgh+RpHueP8zz9b0Kje8iMIzLMmOrVqaTnpRWnbPwM4oIPNOeIT27vZrHltX7K+xj0qMz7nCZMqTQ7jFi5+jU7P@vger.kernel.org
X-Gm-Message-State: AOJu0YxSNcDTwnJmwH6M6a6ID2yz7tiRb0CtNv+Q9csjD/Z7VgtPsCSJ
	xyyCVAnwobuLbwBvbfpzB7IYf8v1oDjWxGc/UqYn6IaFPXKsMFg1/7iPgPX1F5YEdTUVp5qjiPa
	RZyws3JWWwRvQyIu/W+PwutKOPPSuWRfTx387C0Oh3g52AVwzb+VUBX2kwWV/81o6AGllLQT7UT
	9kv8/zWv1O0SjjF8aNLeP0hBu0ystCHcHnmWWCEq/zTeM=
X-Gm-Gg: AR+sD1129Af4qo7BkF6DKCiLafrgHELUOnTNi4Srgr98+D8zxA7sNTUNCZVDo5XVEZ+
	Z1cjHanHDao2QDgK14YYtPxkMepQvWy5lvfEC/f9kEAgGjamGv919BfzMxu+9/GOr9Ehg+rEyl3
	R7ES+mGIFaWojvoFPPP1J2Jlbs8o8XQIoaLBSUF6vxNIjFc1p8nyrSuDFq
X-Received: by 2002:a05:6870:718e:b0:457:ed1a:9da3 with SMTP id 586e51a60fabf-462f68b3ee7mr12218557fac.17.1787237276735;
        Thu, 20 Aug 2026 07:47:56 -0700 (PDT)
X-Received: by 2002:a05:6870:718e:b0:457:ed1a:9da3 with SMTP id
 586e51a60fabf-462f68b3ee7mr12218513fac.17.1787237276312; Thu, 20 Aug 2026
 07:47:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260817-qda-v2-v2-0-69a02e9090d4@oss.qualcomm.com>
 <3322b42b-3755-45ec-ad55-345125f0d488@kernel.org> <10349e29-b583-403f-a89a-9a00c73666bc@oss.qualcomm.com>
 <87dca76c-851e-4cc3-ab91-68949d283b79@kernel.org> <CACSVV01eYr6FyA6XBG0xw0yv2dydvTEhcY-WUy07mxM8WwkZcg@mail.gmail.com>
 <318f14c2-0e87-4e07-8173-1511dca67d78@kernel.org> <CACSVV01T=ytVJKM7NRoBTAJm7vH+JPJNT9Tftu5X9YskGXerwg@mail.gmail.com>
 <e7b4eceb-cb3a-49ea-bed9-728c958594b0@kernel.org> <CACSVV03ypjBYkhRpt=TyDwOKhejKKke3x=Fi_TvxXN-5U_rCsw@mail.gmail.com>
 <fb834ae5-7113-4a86-bb84-ca5115c8d7ff@kernel.org> <CACSVV018jB4WRRJ_CUHQmkHXZcqauWJXWGgrzY_HA6cFQ+Q3Xw@mail.gmail.com>
 <dd3da35b-1db6-43a4-ae1f-35620692f51f@kernel.org>
In-Reply-To: <dd3da35b-1db6-43a4-ae1f-35620692f51f@kernel.org>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 07:47:45 -0700
X-Gm-Features: AcwNN1UDFgTj8DhU60we-UxrgwU5qCqC53mRJdhnjcqckwpTsRRAswI7otuboc0
Message-ID: <CACSVV01o_XYuSzaYGbo9pY=459qiA_fgL_KRHVJH+LH4RYcMzQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/15] accel/qda: Qualcomm DSP Accelerator driver
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        srinivas.kandagatla@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, llvm@lists.linux.dev,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: 6LHvLGDGj8uEukLvLVRZuP1NVHBFWIXN
X-Authority-Analysis: v=2.4 cv=G7Is1dk5 c=1 sm=1 tr=0 ts=6a87139d cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8 a=_Q5Bhtsilc8r9Aqu0AoA:9
 a=QEXdDO2ut3YA:10 a=1zu1i0D7hVQfj8NKfPKu:22
X-Proofpoint-GUID: 6LHvLGDGj8uEukLvLVRZuP1NVHBFWIXN
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDExMSBTYWx0ZWRfX1e71RJYp3cip
 94f1fTepyhaVdKrhQdnIJ5AdQiK2emqKp8JHs20srNz8jbN3XOuDUush8xNxjttn3i7cccZEAWJ
 6GF6uSlhteKO4gOdrF1YEBo2UP1SKSI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDExMSBTYWx0ZWRfXzpE8ICwvuqVS
 EMQEtxU0Obl17/7Xhs5gDhaSBGvEO+MLWHeDfrP1rSTr6bUbdCdpdvf7jQlip3icb9RnA8JWJT3
 7juOf7M3WlqYTHKOpUjt9mcixSD7K/qKyegWGecK0O7n29b8j7WpwaNujwUctoYxgJTlfuSACnD
 AtgYI/p9mPHTAV0qqKILjTOlpvs/ahYSTkARXqMmO/QDn5Kiil/IZRPjsr7kUKwAna8COFs+wAa
 0P4hVq/bh4vsKWr/Inv7YrV58D1F79FE2IJlA/Qx5dqxl473pXKskZngs4xAdzaknfS7L8RI9du
 I5yMKxQh5zh8/ed2A4oQf43urR5gyRh+jc0k0UQYGumQ+2gCW1gJ+mTnDq/OLcZkghZGhvL9NzT
 j1vbjZCmiX5a4NhZYDkA9rxjEcNiY0A4BH7nVXWwj03rFHMpm/6QQTvXj0rG0meMPJtMSRRZgRG
 yM9edmpEJveU3tAsHWQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 phishscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200111

On Wed, Aug 19, 2026 at 11:15=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On 19/08/2026 17:48, Rob Clark wrote:
> > On Wed, Aug 19, 2026 at 8:27=E2=80=AFAM Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:
> >> The rule of usptream development is that we do not accept duplicated
> >> code, just because a vendor wants to write something new. This is
> >> basically the concept applied all over the drivers tree, where we push=
ed
> >> back against all sorts of duplications all over the vendors.
> >>
> >> What I miss in this thread is why would there be any exception here. W=
e
> >> do not grant exceptions from standard practices on "I want" reasons.
> >
> > I agree that we should not have duplicated drivers just for vendor
> > lolz.  But when it comes to adopting common frameworks and integrating
> > better into the ecosystem, this doesn't seem like something we should
> > actively discourage.  I don't think this is a case of vendor lolz, but
>
> No one discourages it. Following standard Linux kernel practices and
> requirements is not discouraging, do not twist the narrative here.
> Again, it is standard upstream review telling that we do not duplicate
> drivers. Ever, unless there is serious exception needed.

I wasn't trying to twist the narrative, just trying to come up with a
path forward that isn't "no" or "improve existing driver", since
neither of those gets us towards a future using common frameworks.

> I asked why there should be an exception granted? Is the reason for
> exception following:
> "We want to adopt common framework"
> ?

Possibly?  But I don't think we want two drivers to be any sort of
long term solution.  (Ie. as long as venus/iris have co-exist.)

>
> > rather reacting to drm/accel emerging as the standard framework for
> > this sort of driver.
> >
> > So how do we get from here to there?
>
> What is wrong with my proposal?

Maybe I missed something, my understanding was your proposal was
"Grow/replace/improve existing driver instead of coming with a
duplicate"..  grow or improve doesn't move us toward common
frameworks.  Maybe "replace" is a valid option.  If there is something
I missed, then I apologize.

Options I can think of are:

1. Hardware cutoff.. new hw gets new driver, existing hw gets existing
   driver
2. Backwards compat chardev registered by new driver, providing existing
   UABI.  I'm not 100% sure about the feasibility/drawbacks of this..
   AFAIU the fastrpc folks where planning a backwards compat layer in
   userspace, so maybe it is possible.
3. exception?

I'd like to know what the feasibility of #2 is, since at a high level
that sounds like the best option.  Possibly limit exposure of legacy
UABI to existing hw so we don't get into a place of needing to extend
the legacy UABI for new hw?

But #1 sounds like a non-controversial place to start regardless.
Possibly with #2 coming as followup and necessary step before eventual
migration to new driver for existing hw?

Even if we start with #2, how do we handle first-merge-window
bugs/regressions without reverting addition of new driver and removal
of old?  It seems like we'd need a window of a couple release cycles
where both drivers exist?

Maybe others have other/better options in mind?

BR,
-R
