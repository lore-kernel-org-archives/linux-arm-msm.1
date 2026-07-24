Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B05F7387569
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 11:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784892691; cv=none; b=s25A2YScKXfP4TukrWMNZ5ICDRNm9lLKVfGNZHipExRQFZ75i+5plodZytleq4ro5twYevkSkIvm6vV+Uwy80aUlzUVRXS6v9eGOaUk9q2VC1a8IP3EadBx3X9xgX3Z5GA1EFpTnmLNr6JwEJnakfD9f51aGYW4H45ZWSPqCKZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784892691; c=relaxed/simple;
	bh=+gtvZWbeM6fmyh8yJ9VP7oNw91t4TkpcUTJJwwOdJOw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qiCXx1B+/+uQViZEZ1D/K7E8UgGpbMqIaJ8cdomSv2N+2mcWLYbsdpk40VKVmhHNCAKg/8q1FzGQR6Y9JS1h+mWtPUIo5YTmtAVSioUa+TOt68r5F7uqdIlNI+f2yKlqtdsmJMvRIzYkcjN9nUwnDG1nMBSa48bugyRQSv/nGyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=co9ICKsZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BcfJJveZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="co9ICKsZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BcfJJveZ"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OAERaq2853565
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 11:31:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GTNkUT54TF2iHLE+OsKEcqIO
	ZmWAIfsbQQVqRgnlUjU=; b=co9ICKsZMmtyK/qTMtmeYUH4nq+euE8xpuTXFi8R
	TzuzJz2pIWtxkqUGWlloj6zfO9dTZnOvdK3/QzU3TJ0B6wtDqldIZFMDfr+sWqHo
	GpXwDiQVNxfH5XHPjhejxUdHVaSR+BnutAr9Sac4W1WN07G8A6OZNV65zoumS/AQ
	rnaJrk6XwJucR/3R5WjR5fvlzPxK5aQ6s8HWV0pVaXUYzicnFlQhFyAhE73wL9fa
	wJeZwUORRxfL68KGoS43wgBZ2Qjz5oEww/h2O9sUx6BSicSEjPQGb3S3EBOMAQNU
	lTbcChxQZ6OrBiTD88KS2E7bmNrevUwvXGCj5M2CFK1EDg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fktahts1s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 11:31:28 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-737d34a0dc8so302166137.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 04:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784892688; x=1785497488; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GTNkUT54TF2iHLE+OsKEcqIOZmWAIfsbQQVqRgnlUjU=;
        b=BcfJJveZxLhRZMs/z5vyXrlmknnEZDxAKHLlFRhSaxw2ao511fgQONTOtH6eOpQFzr
         5Vguh04BCgGTtyvKaDCpV7GOyXhtfH/qWhAeIJ83gMCMA6KRGSyij81ao0hmx0Uxm25x
         vZL6tfyPX0jmoWOnE/M+aAljhzk7u2ooC4krIzixlzCPvB8S8dffz9D95TfpU2ICcs45
         IH2lDrJTJwMx5WuBHgzzBxbSSwBJqbtHF78Ed1XvxXZcI3+6W9UuMrDyNFydFnHJkkXN
         +omvPIjXH5D7ltuDWoKNtRtOT07U+3sm79t5Ngxr52GvAel2fHgVkU4Qu5FWZ7O6H4nS
         QOKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784892688; x=1785497488;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GTNkUT54TF2iHLE+OsKEcqIOZmWAIfsbQQVqRgnlUjU=;
        b=HrsVfVaTPmvhymwwgfbCcAoIvGaqBFqWce/niDIZi+6tFLv26AECypZ/fSdp/Umqs0
         02AlnvNmnmouea8jkFrHf3p6oEMX5UfKIwnfe9PJmJMHcbHXZanaAEmM8loZ6yZ2OwYl
         uA6F0qY1Dk8OWYu61CZFi+2yc63Ooxu5cA90LGANc2nuoIGP0uWiD1Cm5lIXB2sEVfYD
         qm+ovAFTUzf4AqfEGbXYIaEXTjkBoVdn3K3NPszNQ8ICF+UlbXvjy8Wf5rG6/6L67cDp
         ZIGI7/gWZBfLj9Lf/6vZ2TKYMo+ETPsECwgCdVflXjkboI8uyyPeFzfBwHACy1r4tt4R
         BbTg==
X-Forwarded-Encrypted: i=1; AHgh+Rp1Z4CIPImAMoxhV2XVAOewgYkhZkpigQoJ4jeg4+gBBJn/0FSSybAmrjg8f8ZsZYDIMjr/p3vSzSDEwqms@vger.kernel.org
X-Gm-Message-State: AOJu0YwP8lntTvPUHeZ8Epwl4aUvxmA1UEE0rQpybqq2/pigQzPJyK1m
	cE1nS5ekBvf4CgtQvQc2TL63OYd5m+yUMywFpud5WdbvB3gPpZf+4D9bjcHyBPUjJUHQVWXT638
	mMmfNeWTobkd3/1hC84ind6tJiuKxWBrYq0NLQPSH1X0jvEEPPxZDtYMTHmXZutQwfOwT
X-Gm-Gg: AR+sD13WhPOj50eWg3FZRhToYLRnFYI0IZ3jAarzm8rBPxD+BO3NAIlVkmesR0ColtX
	xw8kZr586lDz6bOFI5MlxJqFkvtG8EhDZWnqhfOmGyKES1simPnsccVvmU/LpyVLKj0B9LigI9f
	FvEm4ctBmDrbO22qNPLAq1rKi/+Vvko5p1ChW8cZiwA0Va1+/qaHWUiewymX9y+c8ImJVkBax1N
	FwSEsnjmAvpSOqrdvPR/CCmmNQ6WQLKNwnPC7Uypww6WnUcsqDuzAke4CNRGYVgq22GdgXo91EI
	EmE1sWZ2oMySksbPirU9I0Sl456Rx/9j5SKBbdMeuLCFy9mdtzK/aaDjFru3GohxsxlyQLS6Hs1
	ngYV7yO64gZC8FC+64q9ymMeH9FTncCNTD3fsOHFSp/Qi0tAoajoRO5z/YqbKQnaznYPu86fJba
	YDWT1kA1laSvsMiw==
X-Received: by 2002:a05:6102:c53:b0:737:c272:92cb with SMTP id ada2fe7eead31-74d5fad6097mr3675426137.15.1784892687778;
        Fri, 24 Jul 2026 04:31:27 -0700 (PDT)
X-Received: by 2002:a05:6102:c53:b0:737:c272:92cb with SMTP id ada2fe7eead31-74d5fad6097mr3675413137.15.1784892687382;
        Fri, 24 Jul 2026 04:31:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9d31d92sm1452667e87.39.2026.07.24.04.31.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 04:31:26 -0700 (PDT)
Date: Fri, 24 Jul 2026 14:31:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev, Srinivas Kandagatla <srini@kernel.org>
Cc: Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2] misc: fastrpc: fix context leak and hang on
 signal-interrupted invoke
Message-ID: <mltvafjdiapu6366kv7ezb6orvqa7cphuallfnyzm7fq6dl3u2@l2vucghdejdy>
References: <20260701-master-v2-1-566bf8b7bd16@oss.qualcomm.com>
 <20260701082721.A81181F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701082721.A81181F000E9@smtp.kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDEwNCBTYWx0ZWRfX5qU9+gbaV/Lr
 2hswt0Uv/yisaZQ5PiHnmc6PAL/S+1kqS8BujFKn0Uo4RsWl0gb7On03xnPRmxoBfJjDdKQRGFO
 1LhG5iJ1/6j7fdzvjoiX7Db5FaaiIXc=
X-Authority-Analysis: v=2.4 cv=TvrWQjXh c=1 sm=1 tr=0 ts=6a634d10 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=VtxIhMinv1Xa_-Hkk-EA:9 a=CjuIK1q_8ugA:10 a=ZXulRonScM0A:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: ODi6fFhQBIheCkGYccBPBiEuzhARSsvm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDEwNCBTYWx0ZWRfXxXsumtdLktRD
 wUjRYIzGnG+6sVJnnldYTSuRTwWnnuPhYqAZsuGcWp7sjVKVR1JrDTMwnblxygAe5w9s4g5Vu26
 KLXup7PMqnazsO/c1jTuD4LOTNiAJ+tNPDOw6/X/JuujB43FZyDD2auuvgyVGZzC8hwaT2XPbhp
 7l2kQaXfq3Vjy6Gm3ADQJz1Gk8hhJsy0K3z7TiaNCIyndN33HLlYdfIxKvBP+NRjADf5ydLEjlT
 KrPgyUQ5K/wCAYpDF6MFOZxS9nssxBen7UTBP2PH1C8ef/TTeZAB5Pha+3HLVj3q2KsdyW1o70O
 lneg7ENc1yV4gYf40XeO1KEd3nfj2HU5QaHvUNIh+elFex63bin3hRSzZFm7V77RFI0LCSTMbOm
 KRNuwj336SUHnrta+ZQQCR+qvUqy9rWFBUHBIvM7L1C9lwz5kpU4x8GJBIWVI/mok6WtAr1eqYU
 iQpeVxCs8bRRkpMVW5w==
X-Proofpoint-ORIG-GUID: ODi6fFhQBIheCkGYccBPBiEuzhARSsvm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240104

On Wed, Jul 01, 2026 at 08:27:21AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential issue(s) to consider:
> - [Critical] Restoring an interrupted context fails to increment its reference count, leading to a Use-After-Free and Double Free when the syscall completes.
> - [Critical] Retrying an interrupted fastrpc invocation with a newly allocated arguments structure forces the kernel to blindly write output data to old, potentially invalidated buffer addresses.
> - [High] If a thread's fastrpc call is interrupted and it subsequently attempts a completely different fastrpc call, it will be permanently blocked from using the device.
> - [High] Double-scheduling `ctx->put_work` in `fastrpc_notify_users()` causes list corruption and a Use-After-Free if the async worker is already executing.
> --

Please review and at least react on the hose comments.


-- 
With best wishes
Dmitry
