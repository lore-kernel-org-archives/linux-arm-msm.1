Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793460800;
	b=0d6VcmUbA3gjxc0aiLfkX/XORHdRLUBGMGa767hYWp7OPw1rgjCXL18qbrOPhYViCr5r
	 KXaC8cRg1ngaJF2TO8DULWqkbF1u5YJxaxTD3zDrzL51kCO9owIvx3d/8VJgiyU9O52+J
	 QqrUdnF8TBKXhbfxy9Aj7L9hywgQaT1G/8KaeIKuWxRDlk9IK5H2g/3K0o5WJdmjKyc7w
	 ReZ4XQjHyhPnuID6W+DXFWc4YFGx8xLYBeoTF4vOfQOcbAzcKXn7LCPcTuxLlm68gf8w1
	 5xQ0vSquh9nJ6AS4e0aXo4TzosPr8EkGI6I+2X6/mnWGiCDh0aVjWk/NIqTULuCx+Ww==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793460800;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:Reply-To:From:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=+6KHp1DDQ2+j6W05RK3+UyPZGKExyceQhydv1qHVmKA=;
	b=AkcUUA6mSfTSBGQ2t+8jgwXtDG1c+GTMMGbt9HJcoeqskb9HTRJwb+QgatyEG4Y2uBoz
	 2byaW2jw8iDHSuZokGEOBs9DUtZbPSn4QVx6c1G4bvUX6OCLleLm60GRwT7hYFvxp6DqJ
	 vYy9OkSUq+6HFOOph7MvHLSxLg/DPkWYg948gWKLooRyF98oTcmKh36YQNTEEjL/zyAaQ
	 Ve53S5Sg978N22VqJTZFaIdCQ2VuJq96iuTTf66EAkSlcmBLzZllYh+/wUJxu8IjadDo8
	 EqWDGzLNhwTqknP4a10RprHX6Ynbr365lqmCbI1EIdTORqRQ4w12t/Vukr6pUnl3iWg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Rx5uTZEZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U1qGLOwl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3D1606A31D
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 15:33:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB3D1606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Rx5uTZEZ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U1qGLOwl
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VD0BaU2162304
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 15:33:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=+6KHp1DDQ2+j6W05RK3+UyPZGKExyceQhydv1qHVmKA=; b=Rx
	5uTZEZScz8k5imepm81GKYaWJzx92n6ZOlW7C1HaNVyfBqSFHxJDe6sIT05ZtUxR
	bQL1gebz5vqWtcHRGuH3/VmY2OxCKvax1EpXf+CZpIaPz2S2ZuSA5kurJeY1z4wi
	vYUOqRqiz7CC0E4uE8pmywnJzmaP8DOuPTbsJOtebPxLCdKWwkZU72HP9WvftqfE
	U9Jyp3JSdSXW4uKjjW7/FhH/vrqCUiSupnInBUETS4KkLQugBk08jLTGYvuKVSWr
	iouZ7hPZGyu/U3/XuYdId8OHlbssWu6r9lFwWrKNdSnmwtwdanYqLXjDx2/34fFi
	KG8z+RxJYNz1fjYDTEtA==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn8j2se8w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 15:33:18 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4a45b3f0bdfso2614217b6e.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 08:33:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793460798; cv=none;
        d=google.com; s=arc-20260327;
        b=Q+ZbTuRJySwMVSfTOSfFxz/5BDLkRimcwjhNyCK7UR31EGdYk7B1joDZhbLq+5bUfF
         Dc7U3Yq8Z2U001Z0hYWZzS/hii9oz/hKa6HeX/YBPNydZHI9wZvPLhjOridc+TPsLHrE
         6HvJdAjZIDe/PzWVpqjGEk3poECHD806BJ4MLlQhpTjNfvmpLIZfpCXqi5IXa2IUv4ZW
         TbVN8AdznQ32JPA0VDAYIAoXe5SGA3Jw9JUtkMwU7LzU7cyXMV8gO3XnfUhOHcTYioYu
         //d4bMLnrP8exkVmZlFr+UR3x3cELXGhT/u5KwYsRYQlwjhksZFY4VeS8uVoF2PrmO+l
         tx0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=+6KHp1DDQ2+j6W05RK3+UyPZGKExyceQhydv1qHVmKA=;
        fh=crGSbgEcAeAQzlmIK6GXDUgys74rrasIo5RWzmtie+A=;
        b=EHZiWTyM2svMkVaDIWBsMMU68ifZBCbZv+cBTj1sQvPRs470MkvKproz0irR2BRQBD
         arXLsNsl8couZgCz7IKNJ8UWdQaclrK+DvXBxh8Wd4ytzBDfa39ij7VAO8JDvcnKrhyZ
         bffdVzRFKRHaQp88i4MEZFEp9kY3f4TA223ofZv/n6V/eM5j4MphcAeOmKQr38kG0p4v
         2Y1mWtIiYN4nhDiCCoLp3yV9kVY6M2z4BZuz6yktObf1U+GNTqq+J659d3rSBMpWI1XP
         x2Qb8Z53HJbsbQJ60gG94U0dfdKdbUulAnhQX+xJciJLzFUoLTMMgOwyzbJyJoOo9ch/
         hbzg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793460798; x=1794065598; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+6KHp1DDQ2+j6W05RK3+UyPZGKExyceQhydv1qHVmKA=;
        b=U1qGLOwld9swP4wv9iCQRSw2g8HQYFcxqLBke0znOJiH65kYJjAq3/e+dlBgRvDmxt
         FeJM2XswuSY3eHVFEK/QYuaXCGdCEaNfVbcGvl3OVsIMQKl2Elve4aKyJexbEMkk9bBz
         kHRWRVde4cR/h/cmPou0RqNw/2H7+uYjXH6AzKPlUrq3gciw1gnTcVqUmlSmWVU8y+S8
         pRhNA9vw3QGpQ0h/Q+7EpRpCwI6JEzMYL+Wa5e+U0fpHKDQH7sFGmoiu2DETamEugplU
         KO+9DR+28LeGydc9quGIwaj8biHUB2SeSHGuXgCae5vu+eHP+IeYQKG+2X/P0I0I3KFe
         6kAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793460798; x=1794065598;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+6KHp1DDQ2+j6W05RK3+UyPZGKExyceQhydv1qHVmKA=;
        b=2f+3bSfb4x5ufx1zNIb2MMjsHc0IEDC24BO9zV/INyBJWlnwcCUhb0BwdMATxx30Jc
         suVmvhtNVs00dIHz3XpGw1BtUg2hthfZxuxHTcy1qKnYpU1BBtUEOTz3tGtB7frHLRKs
         SU5oEb6LboAmXhJLVMHxNziXUoQTh5vo6st3BDOi3XF6WLrnzVzmGLq0KA5milUVW65D
         2xyNv3KE9gAtHVL7yKabbm6UwqBxW6h9eZIwBxTuW7AoT4Y563XO5WKigMTtYuO3hfGm
         151j0nlV/G+GWz3So/YMFQczsOYhl9HVfWgPRGKP4hUQj4zXbZ+micgmsD2lvMWRcJXJ
         p1Qg==
X-Forwarded-Encrypted: i=1; AKwUvBzoXSzZqlO+Uj1FRYQKROLLtTZbFMNh0n+UrKdLc+k4QNwjuZ9zZvVANpys1UQCOn8O/3pzVjjOF9kgCoKk@vger.kernel.org
X-Gm-Message-State: AFq9FYLzVDk3UbuVM2h2KRVhe8k0FlL1WSaEra/tRBUZXz6KLnSuv0N3
	d5hRUCmW/uR8Xxko2kRV385nIcF/Jt6c4/X/RINOtbCgBL1dwAmLcaZpoFsl1MN8JLKcmt3op7n
	QWfATL6zj8w2r8ebLJegruGgMiuzQn4NqYv6AhTwa1G2RcgVBv/12oMWcGFKWhfIjlpkGu7zdKi
	5rE66Nf05LXm9iJo+0YyoiTRdruUQUCePGTZtZWPqqChY=
X-Gm-Gg: AYBFou2hfqnbtcHO5+yf4bb8ui3+/hnGSr6YtDPGwyiinl5gjr0v3ZrwnbjPZ4rl4SE
	w9s1YR/nRp6cuDva47ubR0hDo99z3Vd76vuqAmp9AP6rHM77IQjraMYCNRC6Y+OqjPxGyd8evyw
	6wG4dRDQgV9cN77wd/9bB/CvK73ETYfJCkXu5vm83nphB3rIcZwYQzF3ERFg==
X-Received: by 2002:a05:6808:30a6:b0:55b:f88d:919f with SMTP id 5614622812f47-5640de5c4eamr4534438b6e.53.1793460798024;
        Sat, 31 Oct 2026 08:33:18 -0700 (PDT)
X-Received: by 2002:a05:6808:30a6:b0:55b:f88d:919f with SMTP id
 5614622812f47-5640de5c4eamr4534414b6e.53.1793460797558; Sat, 31 Oct 2026
 08:33:17 -0700 (PDT)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261031-msm-smmu-identity-v1-0-a2a70580eebd@oss.qualcomm.com>
In-Reply-To: <20261031-msm-smmu-identity-v1-0-a2a70580eebd@oss.qualcomm.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Sat, 31 Oct 2026 08:33:06 -0700
X-Gm-Features: AclHuK9CSsE5d2RI7IGhCUXsadCiEmg1vr_YsLjfD1ZPNBmwTgEXoOH0UkuFoyw
Message-ID: <CACSVV02xa+emUMd7Dp1rDSwa0e3wpyQBcPeZg-bXPL4U3kzQvg@mail.gmail.com>
Subject: Re: [PATCH 0/3] iommu: qcom: Fix the MSM GPU and display with
 DMA-address based mappings
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: 8sqk4HsaaMunS6GpXZu3sRAFOmLH4FxY
X-Proofpoint-ORIG-GUID: 8sqk4HsaaMunS6GpXZu3sRAFOmLH4FxY
X-Authority-Analysis: v=2.4 cv=S5RMU4sP c=1 sm=1 tr=0 ts=6ae60a3e cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=QEYsvGaJyljY994YBNYA:9 a=QEXdDO2ut3YA:10 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA2MSBTYWx0ZWRfX8xHL1dSjQnrG
 /K629bISoGjR0Oy2BSxLpvK8pw0Rwxv1ABMcfJHcPfvSfijfYMTH9pGwhjg/flcOVNrUnvkZXZ1
 sP4Jz1bjXeVKa1Opt8u3t2PMMrlUND8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA2MSBTYWx0ZWRfXwp0bVhyvShnz
 Uc6BTktydg3LxC7ItI9aS7vWqFbEZOoN5HibYSPMwdtb0yd8mxjCD4zz4ESG8ExBmIIF+XBs3Oj
 AE2tFC3o1uP8CdbJmN08s1C4nu9yFCn/eoAfdQr+n5CzIoqspOtkCcE8/5ff/urCMVFaKlI1D1A
 OrpCuldSIzipmJY9qb0koan0hnIXp4jzTyN9IuNsxp3QdHIn7sVtJXruet/dWv7ZRmLGh85wLWV
 9TVylLy0AxATYPoPk+Hdcl1yVQPxlvEFB1ni0N100yJhLz8bqCFQ8IHD5gOkN5x8KdmT4M/aNP/
 ZgD0MU0++17EzxWwtXB9vuHVuinG2wjIPWbAjwol835K6R42kWHfRZCByITHycblyEpjJgdh8vl
 ZiwwVzI7OlutaSqZy7rI829CQSruHd+Lmi4oCOPyZqvuk7a6YRTF4brCoT2AIBNH4miovtDP6mn
 2GbvxrmsC9mgwPPTBGg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 malwarescore=0 phishscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310061

On Fri, Oct 30, 2026 at 3:05=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> Rob's drm/msm series [1] writes the addresses dma_map_sgtable() returns
> for the DRM device into the GPU and display page tables, so they have to
> be physical addresses, i.e. the device must not use iommu-dma. On DPU
> platforms that holds, the DRM device has no iommus of its own. On MDP5
> platforms it is the MDP5 device, which ends up with iommu-dma: the GPU
> then fails to start on db410c and sda660 and resets db820c. The last
> two patches give it an identity default domain in qcom_iommu and
> arm-smmu-qcom.
>
> The first patch fixes qcom_iommu's flush_iotlb_all, which never
> invalidated the TLB. Nothing relies on it today, but the series above
> does, hence no Fixes tag.
>
> The patches are independent of [1] and a no-op for the current drm/msm,
> but have to land before it. Tested on top of [1] on db410c, db820c and
> IFC6560 with and without these patches, and on Open-Q 835 (DPU) as a
> control.

Thanks, this should mostly supersede my untested series[1], but I
think msm_iommu.c still needs the same treatment?  Hopefully just the
def_domain_type() part?

BR,
-R

[1] https://lore.kernel.org/all/20261029212344.346069-1-robin.clark@oss.qua=
lcomm.com/

>
> [1] https://lore.kernel.org/r/20261027230452.130031-1-robin.clark@oss.qua=
lcomm.com
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> Dmitry Baryshkov (3):
>       iommu/qcom: Invalidate the TLB in flush_iotlb_all
>       iommu/qcom: Use identity default domains for the MSM GPU and displa=
y
>       iommu/arm-smmu-qcom: Use identity default domains for MDP5
>
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c |  7 ++++++-
>  drivers/iommu/arm/arm-smmu/qcom_iommu.c    | 26 ++++++++++++++++++++++++=
--
>  2 files changed, 30 insertions(+), 3 deletions(-)
> ---
> base-commit: f1ac44c32cba88ad65dcecd4a279661d14e93651
> change-id: 20261030-msm-smmu-identity-6fda3323023b
>
> Best regards,
> --
> With best wishes
> Dmitry
>
