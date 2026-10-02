Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF3F738398F
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Oct 2026 18:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790964749; cv=pass; b=doDHsdRMljGS8ui3SjevnS0vTEcOF0wfV9sMGYNyxuaHMDI/FutyqdeNCZ7rI5e6yZJ3VX6W8kH/xLWwnHSrRKKm0jiQ7k5RASk7SjO7z+o1UPFarJU8GBMT01UP2pn24ZcnM7Y8/IGFa/eyq+Hm0H1HyScvRhLmk8HpMfkVcrk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790964749; c=relaxed/simple;
	bh=olqnuNuLfhNSbTMlRj084yoEjd7JnAYtZyXcGN1R2bA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YKDOjkUWESxH7DJeu+Sk47Fo1wLDdQtzRIh8Ujo+15kK4cqWuGCPIjjqA0tBNRni4dZ84a9uMHP57qMvgP8vDTiP2V2mLqcPSGgXJWrppLcYm5Kf7NfevpouXBVGBShQl5vCSbpGIB6/SXAvg+UyykGJGaZPHx7h6mN1FKwNWYQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XrVDpYW4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=he4jh6rx; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XrVDpYW4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="he4jh6rx"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692HcJE81198117
	for <linux-arm-msm@vger.kernel.org>; Fri, 2 Oct 2026 18:12:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=4CSRn9tEcJU8kiGoAhArcrJMiSynVhSMb0NK4Ngxt90=; b=Xr
	VDpYW4tG2obycAgp20TaucD8Vlyh2tE2ttwyxMbJfYFbQ3bj76r85LAnMm9+ONuc
	aIWOb7wmSr0krUoM2GvgQbwoclukaXijDnpdIje7jub9D8U7XJdtqAFarz5wCoSi
	EHpeNM6FgfcdOcX4KY2s+4qNoVtEbkT329pF4/6ZYBt4YNEGJ6lJpHWZp7lv7KTg
	ozklH6x0iRTsC4TQn+TBExdaqjUd9MRUUz2gJRH2Fd2q5b3fBLK9Y4MJEGfqg98b
	zHdL9oNCTt63yJUIfmj6Q2pU7ppqfdnvRHFd48KptMxSrtsKkZ7cc/w1QKeiNv3Z
	g1Ssx6fHfgHFEvM+V7kg==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1v034u2d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 18:12:25 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-46a5954cdfcso209025fac.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 11:12:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790964745; cv=none;
        d=google.com; s=arc-20260327;
        b=QtB36jJX9zVyMvcaCeQ1AvUfn9L8NkE4S0Qabe3THFA2UXwtXKQOpidRzzZPd952h0
         Z1U9AVPvISIjDCWOHWFvunNGbPTUYkcI2EY+4Fm9wxYn9xUODQHs3sKLB/bco1vJI16l
         DDmUvtlfGbtjs9IwNJRDjhLfR2aSlV9xEfa5BsNR9NAzH4WS5cx5mIOLG91SyyuytJf8
         eY+Qp2MLxmtP+do3ljBoM7blRw7pvHHGjd/euIZWu2TYSHaTxV+WGEv4HlNPLL7pFi8d
         JUI7rbL05qPqmrQGNNu5n7vCwBzAgFdspCxtDtL/wcyvVK/RWtAyH5nuQKNW+x3epJpu
         wBXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=4CSRn9tEcJU8kiGoAhArcrJMiSynVhSMb0NK4Ngxt90=;
        fh=VF3tlrbFqnHnwAXy82fTzcw21eNLypxIGwu3ciLWZ+c=;
        b=IGjk2ETbmsKOV46zMmbDGfbOUt/RWuXsETRqDu0cJsMwDQxXn50k6wdxzh+3zCRu3E
         GTGt99Yf1Gi/8fx7AQVd2gONkCscZd/D6IJIIwhLIX9pBnMBcnSwqbSMAXfH4O1iXBJJ
         Hvr8l9K8z+SiYPVXabsAALY4byU568hCCqeXj3iAtUEBv17jQpdSNNCSk7+KXsDpIckj
         kHWJlEutIhZv4o3pGfVkq3PD+DyCBGbnN6dcsWIe52PKH9pKtLqfpVZ77eVU7Jpbv5pz
         cFYn4SVZcAwOUlg47CL8Yx27q7BcxAXbJfCM07iV9HE/C6kbHZ6hhWZciNflCj9rEtYr
         aIxw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790964745; x=1791569545; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4CSRn9tEcJU8kiGoAhArcrJMiSynVhSMb0NK4Ngxt90=;
        b=he4jh6rxWPGDxr7LV9gpZVh9/41GY/uIClEeKNAbNIX70sRQmTXdA3Lf4k5m/Piftm
         3lJV8fb/BZRZB9NN+/S4nN/KK5OrvkH9dZMcJhTMxyazZcD7u30gCyoa6jDZHP1Vi6fk
         67ngki3FpDcJZvgZp+qABp9rxSxb+V2r0DPdqoE+xKNyYoh3cKPSL7TM8OaDkFH2n5/C
         zycH+YLMxoM6bWP7tKXQNPGu/27PXUtwQ/iuqLdK+zAF+wg25V2T4c0tobS6xxP2YieZ
         cvMKlP6mMQZRj64HmoWh4OfK1EiJZroorDm4mVBxlmd5KRQWWhE9ZNKfZRoJEoKLnyEI
         tf1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790964745; x=1791569545;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4CSRn9tEcJU8kiGoAhArcrJMiSynVhSMb0NK4Ngxt90=;
        b=ZaZkEmD/aNEPtvCQkxZvXJDz6ZOzGcPVwjSTFzI3N/U0yGWS4L55t7U3/0xnVwdU1Z
         jEgLQ82BP53Ky5IJhemE0b9/cwtfjebghoF50sVt59BXe0tLDhgE1E5C6lxXmH7e6Lcm
         kx66VzSVDO7bCQpdup7Clm7sJwMibm0xJbSqkd5q7yiONpot0MhP138JnMWAFhNSO2B+
         kZ7czAUUywerkYqALj0LeFj/fd4eAeFbhXd10kVtW/qENteSC1qi+cM7//8ROfelaKbT
         t/9tBf6ylvPFg52uwqvAqWed00FAyQ03A+yRhC4aIbK89JC0bxB3nSIQBQr8ZCK+f3AS
         uPjw==
X-Forwarded-Encrypted: i=1; AKwUvBzIKa8ATYJacUUtoDdQlPeqP1b/KynFg0Xwoqj5TJRCa8KEdOUoGEv7rxteDuQ+2kg7db4+GiKlhNt4xkQj@vger.kernel.org
X-Gm-Message-State: AFq9FYJTEFJRzNMzP2KyeroKJlE4y0hLIitRkwBHfvJv2b6GAzXFT8vh
	Hjo2pgvKaawY3Y2CSvWPseuYR7yqiJDBKEjI6kiz0UE3VHyLKS52g0TxnVqLf5f29ytl+Bv5I+Y
	jh4C00m243EyG38JU8O7cxhVRdF/+VXpnDjHL/nE2PTXWEhg7aQkVIuCKqE9W62cJmSSiBUBJvs
	uYBS0H7LLLVR4YV743zYA8CyNsVJNPf9IzTycyo+F4mA4=
X-Gm-Gg: AYBFou1wKcPcNbbuWv9kIvkFhWXapKjx8cMpfX/WzZxOHGMzY7g8RDrEIvEX/VUeQud
	FlrB/ZErD7W4zHdJ3S9+nNgOSJGDle+fKCrM0PbElcxpDSASYjXeCqf29NAF2OwdgJLLT+KdBPy
	0cjzLSgdwuyMvcT+6+ri5mMmZqkc7QZ7ubAhlrsW+e+TiYSce0bIXIORMh
X-Received: by 2002:a05:6871:c941:b0:49d:e1d3:e6e5 with SMTP id 586e51a60fabf-49e15ead8e1mr2700822fac.43.1790964744591;
        Fri, 02 Oct 2026 11:12:24 -0700 (PDT)
X-Received: by 2002:a05:6871:c941:b0:49d:e1d3:e6e5 with SMTP id
 586e51a60fabf-49e15ead8e1mr2700784fac.43.1790964744129; Fri, 02 Oct 2026
 11:12:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ar_AuRr1eaZzOfw9@baldur> <179096320161.1973.2852858792260211089@gmail.com>
In-Reply-To: <179096320161.1973.2852858792260211089@gmail.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Fri, 2 Oct 2026 11:12:13 -0700
X-Gm-Features: AclHuK8o91bLNwt3TjoUBHpVEYotMXP-4T0PZxyf-cMbJnzFu-NNTFKBRF7Wws8
Message-ID: <CACSVV00GwWvMFDR5QC7h8gonC-9qYbaG958nZHSxtUdWXGG_sg@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/msm/a8xx: Enable CLX feature on Adreno X2-85
To: Oleg Keri <okerixx@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA3MiBTYWx0ZWRfX6r8b0IDffOmE
 moFI1uB5Lam45SFoI0EmEk1LvycsEtyvnz4p7SnOkO/iob5yTnN8BRLxIstBHq35+DZx8kJyiJ4
 GlQBImLykVRWKQJ1jl6EjCInXTreZ30=
X-Authority-Analysis: v=2.4 cv=GqfXaU1C c=1 sm=1 tr=0 ts=6abff409 cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=pGLkceISAAAA:8 a=AHIf9BOdGwd-gaNHwY0A:9
 a=QEXdDO2ut3YA:10 a=y8BKWJGFn5sdPF1Y92-H:22
X-Proofpoint-GUID: kZI_3Ugz_vndKmhy-n5_butMXyFphp58
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA3MiBTYWx0ZWRfX6L7Kla/1+nA4
 +bDIp6pZ8zfSQQ+MRUQhioHwAFS5arX3HGiBp5e5qjw3cx2YOhR5aF9fdv1To4uYsiJEYU7FwDo
 oFs/8J4Vs4j1jWSTW3WwZgwan6XcVuX9xZCJd3DuDBEl1NFq4TFEINwjkynJnfMo22fwQwDRgrx
 BPRDDBml37aAdpjukje4321Doab8/X/t6JoqWWPN669SWg2JxGXl76lNx1ipSztkSg1PBBmE4OC
 3LXvdYpFCHq1pzpqRfB1Xpx8etdV/cavVmmlaKebxOSgl0kPrKqNQMdIm2QP2dQpzilu7xAr2RR
 8iGLHUUE6uu6aXyBnNzfS8GwJV0i1VGsryH9bXh8yjDC1ZdeQhQMTwDux3w/uXHbquk5oLoGHAk
 ocx4SndNM1yg3CR7Veb4+2r8NXihcUT+vRt3iY3YfSygIeK9BhK0R25o5NjZQfWZ56ugadpeRKq
 /5935/0RNDQz0X90Tiw==
X-Proofpoint-ORIG-GUID: kZI_3Ugz_vndKmhy-n5_butMXyFphp58
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_05,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 phishscore=0 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610020072

On Fri, Oct 2, 2026 at 10:47=E2=80=AFAM Oleg Keri <okerixx@gmail.com> wrote=
:
>
> Same on a Lenovo Yoga Slim 7x Gen 11 (Glymur) with next-20261001, GMU
> firmware v5.2.38:
>
> [    1.632277] platform 3d6c000.gmu: [drm:a6xx_hfi_wait_for_msg_interrupt=
] *ERROR* Message HFI_H2F_MSG_GX_BW_PERF_VOTE id 11 timed out waiting for r=
esponse
> [    1.642345] platform 3d6c000.gmu: [drm:a6xx_gmu_set_oob] *ERROR* Timeo=
ut waiting for GMU OOB set GPU_SET: 0x4
> [    1.642360] msm_dpu ae01000.display-controller: [drm:adreno_load_gpu] =
*ERROR* gpu hw init failed: -110
> [    8.053367] platform 3d6c000.gmu: [drm:a6xx_gmu_resume] *ERROR* GMU fi=
rmware initialization timed out
> [    8.053584] msm_dpu ae01000.display-controller: [drm:adreno_load_gpu] =
*ERROR* Couldn't power up the GPU: -110
>
> Compositor fails on the first start and works on the second.
>
> Reverting this patch fixes it here as well.

Interesting.. I'd been using this patch, but cherry-picked on v7.3-rc3
(on glymur slim7x) for a few weeks with no issue

Can you share `dmesg | grep drm`?  In my case the initrd is missing fw
so gpu is initialized later, I guess when the compositor starts.

BR,
-R
