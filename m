Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA7B852BE4D
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 13:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790688870; cv=pass; b=eJo9ic8iujPLJ0XMkPoexsaQO7neI0PVTOgj5650UyYWM+dhmuFVp2UJBEBum6dP/JoAyo9jXdhn7KINOdPRc7rfS2zrOJkyZIsj5Ao4klJeWcqJX2zL8ANX09uvk/N8kCgRnxuP4adKwXVWFOgbBeY4Qo8TIB7V1hxNgjRzKds=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790688870; c=relaxed/simple;
	bh=aatIQCpb5b6E18tOT607YiK+lREgF4JTQbKPFrO+iVw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hbOkNIt7FBGfRbNW8SkHfCyv3XqeBHa0+J+x2nURHupgY9qEWskuOYDcB9v4FbzH0vMpQ1m2SA+vf6FtFvtFiSN5/x+5+qnRjkiwafEL8RNxgu/V7M1UvvToYly9/npbYi47HwRNVzn+SdWknMTbUFdnuJU2U5l2/yt46OCDZAM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hk6mvLlV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MnW5UteW; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hk6mvLlV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MnW5UteW"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCqnlL4151558
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 13:34:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ApZtp9mCDzFhUghEqNRHfpNQRpHQIPz3H5GND00+/Q8=; b=hk6mvLlVWv66MepN
	iXjqUBQgGPOer5qnBJte12x4wjPvxOCEYL7J06CYjn0EHwKp/mQIZhzGf/7PTCrr
	JPVMRa5P31yNjd0syZbjgMb1SqSQl0EhM88wLqYun1EFTHMdFhjcUQaYctLQJvLB
	m8rrLNP8N82Uo9R+rz0dot2NO2Ag+BRrRZy3QHNaATzsOSBlDlmyQoF67xxVYAwr
	6AvhbgJpiztMCqAaEVjfmc1yrAp8Qnex8FnEzTZH2Oi00Q9D6r5JmaAxiFebRClG
	r3l0ApPic+NoNoV0+qGAVh5h3Rn6Nx3BILxnO83SaAFd/J++STdI9TWC1odBWbQy
	41skTw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyvwnc9xa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 13:34:28 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39de4e72b33so7789630a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 06:34:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790688867; cv=none;
        d=google.com; s=arc-20260327;
        b=XTKh6NlorcO3vA1/0HGbkGKph4+ZRbMwpwLwOX+6H+jI6oo9d6W4wtQGkKzA8jSJyy
         tmJ5i3d2+duE88wc7cDAypbszpPHE/Q0AfOZ1V5z42mX/MCF55ZCYhciHL5b0kN6QA8m
         H6vvruyh9sKef3nLFHp8NBGyXN0A7MDhWPbkkebfrFG+aYH4v2dg6AgzZoW8EFhcwgvn
         HFs6zIJG6dAu9hWmuCdFT6PppreMPQEMvUjklCRnL0k86yxEXiXWvmQMPvKVytToNiwL
         g8yDGcC2lPEFcOfZGh0fQd7RBYdthEpT+di+Be6PYhioVlIQF6c5cUyDGlWUIBa4OjZa
         M85w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ApZtp9mCDzFhUghEqNRHfpNQRpHQIPz3H5GND00+/Q8=;
        fh=LCWQdtG3Ro1ixkH1xlU2hTdNXUNYrfdgmonDYixJcEc=;
        b=MQqvtDKWBwqYo9gRlDpIHNnBWXsXx7+6MGqGsd8bddbKnS2QdoZeZ6+JTQ3BodPOHv
         Loi7LeOi4aRdpvX5cYjje+kcMfRbYLT+UZ8x6gX2AO07bOelaQfO2eoeocM9M4wa+BWf
         IcCOYfsO0TpNLuCs8XqyWpo6xaqnSKkSPqsaegZGopo6FrNN9x6N5JUUq2P2N8FlGQXT
         0lZVT7R9SuAlj9TY9c0Lssf/kZxfUEcme/cw9/kyolemP3IXeHOgEJ+tDM1clv/OAd6K
         +o9+V+oLm5V7rXBdqr8qZl0ipwTcaRxhcp9OOrouIxWhPPWmFUAapZ5Far8EU8hUK0Rb
         8ozA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790688867; x=1791293667; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ApZtp9mCDzFhUghEqNRHfpNQRpHQIPz3H5GND00+/Q8=;
        b=MnW5UteW5tCkE0domqFe0WMEddVoAo24BrHbfCGicKqHJ7zswfoA07vSpvD8NfqOnE
         fF8ELmym2xBwXyl8/OfGKwGsoqqQxQokZj3gd+Dq32ZPO3DRhsUh73z2LfN2tdHpGy/H
         EPBeds6ekZJPCl8GDtF9YdK/apasEgcCZd5m+U8eKxUnzX94w6I8HytVWl5AvvjGs3zR
         DpK+qksSdODDf/RHW+WZU/BkBWAdIHCAI/QR4tzPiMQzi530jEw/yRRLhlCn3CDzzxlv
         lqWsAjIxiU5+U2yWw0xsJgp1V2E0KCF+z32vgJSxHnU3S1tTCcTS6PAXS2gHKiJQLrhb
         2M1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790688867; x=1791293667;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ApZtp9mCDzFhUghEqNRHfpNQRpHQIPz3H5GND00+/Q8=;
        b=Dq8FQnoHA+JgiD33SXFcTWu3P8XCAL94240fPyZyHRPo98LdQZS1zwqlu2W1iJziOS
         WwUL3I1i7jF3LoxGFhkGa+Bq+dU6XMV9p9PR+7maDOQlr3xG8i9aAIW2/FYztNk7HxJZ
         r4HEq3eNh8F7u7+ifXCUrhX/yq+i4ZHopaFfEECZ6Y0cPxTBubkMAdxS5oRUr4uV3DiO
         fv9eNtgEmLXI0k7YDUFO1r7pmpA9tcFfTEIdB4duzEXX0xETWSnFa3LxRIYuLf9Ziyj7
         uvzaxuDRxeAnsKJ+9YW7feIrIeU+DIariw48Q9LP7gsPYk5WGlPc89RHTYHA/fLIKKKG
         FXUA==
X-Forwarded-Encrypted: i=1; AKwUvBy6EfkIwlW3obVSkdZ+X+N4TvQPqdYcX+FXMWMS3hkwWlYZJyH5oykrfauzPqgLk53cki0kKBsMxExspHRv@vger.kernel.org
X-Gm-Message-State: AFq9FYLBaCiTNR02TtvracTd+OfIdrmdXu4Udg6J/KntlS88JH0qxT+2
	91igf4eGyzIfBHn0UU2IDteLZNfzwR4a0EIvUVTZc3B56z1R3lL69qalXHZieYpn2GjNvJaaUN7
	pOjT48LtvqCM/sYxC56TzY3J0XhkojE8LMYFRx8ECHFg6GqxdNVN9uZ+K+lfC6rEzwR3PlsOGk1
	BGrguYbHjB88jL5+uIijx8Cj+HyeYQvIu1tI/qsm5qKk4=
X-Gm-Gg: AYBFou3KXo2uZwCli7O2yKaoQSZs2uiD49MJEJFMJmXicccj1H+1e57iDX1PR7fH7p+
	vfQtFj9TAOr7TWxsbe4L/06p4f026rnU9CvYFWQhnMriduLBex1pxBSUnVoOJLXanO6pwz90zHt
	hiYvUXodgxBg9omLFMp51vNnQAYDaaj/2OOzkoQfKB5FbHE6ZlYU8EpUmz8g==
X-Received: by 2002:a17:90b:2b8c:b0:3a0:574f:5854 with SMTP id 98e67ed59e1d1-3a0bb60e74cmr11071579a91.39.1790688867384;
        Tue, 29 Sep 2026 06:34:27 -0700 (PDT)
X-Received: by 2002:a17:90b:2b8c:b0:3a0:574f:5854 with SMTP id
 98e67ed59e1d1-3a0bb60e74cmr11071507a91.39.1790688866886; Tue, 29 Sep 2026
 06:34:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921-msm8952-initial-support-v3-0-b96fd3fe298b@mainlining.org>
 <20260921-msm8952-initial-support-v3-5-b96fd3fe298b@mainlining.org>
In-Reply-To: <20260921-msm8952-initial-support-v3-5-b96fd3fe298b@mainlining.org>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 15:34:16 +0200
X-Gm-Features: AclHuK_IsoMVZ8jA--KFIskLK5LDOvw3Q0lyiLyhAEn2l6B1awM5w3Hl8Ax8gbg
Message-ID: <CAPx+jO9qPRgae_VqWrGQ8bhDOHBf+zDzw3A-BxCMa25XfPaa7Q@mail.gmail.com>
Subject: Re: [PATCH v3 05/19] dt-bindings: mmc: sdhci-msm: Add MSM8952 compatible
To: muzafferkadir@mainlining.org
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Lee Jones <lee@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        David Heidelberg <david@ixit.cz>, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mmc@vger.kernel.org, iommu@lists.linux.dev, mfd@lists.linux.dev,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-pm@vger.kernel.org,
        linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: spplikIZbX1fdvZi44qEDyM1P07N5l3n
X-Authority-Analysis: v=2.4 cv=W42txhWk c=1 sm=1 tr=0 ts=6abbbe64 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8 a=OuZLqq7tAAAA:8
 a=wO7LUizMVtHDz2nkp9wA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1NCBTYWx0ZWRfX1qumpKO4WJTP
 /rYixsyy61MgwEDbvDlC86yjUqFO7+jUa9djo9UWJcNGZcW4V7tVHv7cHsCdBTHVscEOfJbaHC+
 Ydh/qnDIP6baeOBJVEhTvwxrRzru/UVEzVsrxkCja2HUjglF7RuqBxYxcDCC/Rf65f2wlQ5DZe9
 kqQ4zYX4Eh/cTjkPNEBGux3U5QNRgkpuqLXiZ2lUlZ02EO85H07T/vNGeEGWTJzmtAC8ThDZUnW
 ocnoTbWG64VbwUt09pJvgnjriU+Lk4wBn3UEKaJTCtUzbwyUsfUw3ssEVYDGBbrh4AOEwvnXYUL
 Dt89JZi7knc2XPqDAbkvdnHqKHPNYI7N4mC6bMZnEazIlS+OZOsqLjQZYxGJ1abdeMHsz0xgggw
 vOs4aFHtrkl5eSEpqkwamJub0wLfDxfT6cetf/SToOFV1t/6tP5u+ayHGcapz3ssISlWi4eW32b
 jzVlhsO/CCaCksCjGtQ==
X-Proofpoint-GUID: spplikIZbX1fdvZi44qEDyM1P07N5l3n
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1NCBTYWx0ZWRfX6ih9PAlW5MEb
 dL0W7D9t7z3RugpPrvj+VDXscEGkmTpG2126zoqAQ90oVJVMvaOUJL9eRgVao31sGgTQWLAchAE
 1CwrDBvotBd2MeIke1MYIaKMOV0ZKg8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290054

On Mon, Sep 21, 2026 at 8:19=E2=80=AFPM Muzaffer Kadir via B4 Relay
<devnull+muzafferkadir.mainlining.org@kernel.org> wrote:
>
> From: Muzaffer Kadir <muzafferkadir@mainlining.org>
>
> Document the compatible string for the SDHCI controller on the
> MSM8952 platform.
>
> Signed-off-by: Muzaffer Kadir <muzafferkadir@mainlining.org>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  Documentation/devicetree/bindings/mmc/qcom,sdhci-msm.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/qcom,sdhci-msm.yaml b/=
Documentation/devicetree/bindings/mmc/qcom,sdhci-msm.yaml
> index 69bd44e65ad7..9d4409c958fa 100644
> --- a/Documentation/devicetree/bindings/mmc/qcom,sdhci-msm.yaml
> +++ b/Documentation/devicetree/bindings/mmc/qcom,sdhci-msm.yaml
> @@ -26,6 +26,7 @@ properties:
>                - qcom,ipq4019-sdhci
>                - qcom,ipq8074-sdhci
>                - qcom,msm8226-sdhci
> +              - qcom,msm8952-sdhci
>                - qcom,msm8953-sdhci
>                - qcom,msm8974-sdhci
>                - qcom,msm8976-sdhci
>
> --
> 2.55.0
>
>
