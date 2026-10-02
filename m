Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A559372EC1
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Oct 2026 12:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790943679; cv=none; b=X+FI+AGPa+1LNCQc42zRvKCLZOnKqOGyMhLEn5khJu4Th0PkIrlfoQvcAnj1hPB2gHm544TaodXSvEc6M4cOnpy+s9m6X49WlEp5gdf1sYYURUhX3loVYnseHFvEagl94AMfaQMQcZ7qrzfwXhJxhtpjwByAG1qrHY2zvm3BFrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790943679; c=relaxed/simple;
	bh=2LejIYv1mw3zhtuSKKt+Gu0dMT+z/pVFgluGypqiXvg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lAVO3caDGtjpLFyE82Zg7Kvy+tZBL7OVEvuPnHuXpxvkcKb63h/c6j2d7gHgvThzRB/J0tcE93OSKUvk/XmBeG0Ntgs9yzAQWDr+/C1RHEruY4M7ZBa1OcfyWTLBzgn4EhPSqgF+m3cX7UyfVpDpFg5AJHhTCo/zXPAe8v6GbYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TiJwpzIB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UPAN6emd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TiJwpzIB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UPAN6emd"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6929nQoV344037
	for <linux-arm-msm@vger.kernel.org>; Fri, 2 Oct 2026 12:21:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Wae5KuvkJ0kAtp7ZnZDsr83K
	4A2AnXNcvedN/k0fXnc=; b=TiJwpzIBToM310YAzU6ACgCASTz0OoHb3OEj23dm
	Ax6ZX1cSwKkIFII848co3sPc7bRFgWeG2GVypLniVuow/M1k6Kwt6He8KkRcrYLT
	lDn8faBRexmecRaUXtHZwjbffMUJY/HzZBPpJ/pwiCuXGAqJgOtvygyx+MI2OHhI
	umtkcDLmDa/Q2IgOFqWbuPAxLnUo2N/2HGl9eZkRRtS7/o/8pWOMj8B6e3yXZDZV
	Wncn6sNocfLAnMQQFY0UYzXNewmvOmFbJFjlcg7irE6KqLvwYf1DDqBtmP2s8Ztn
	IcsJvEKLIlciu6Ya65sEw8F132yepQrFFFLR2gwx1mAUiQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1rvqceeg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 12:21:17 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7bf67e46ae0so508410137.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 05:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790943677; x=1791548477; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Wae5KuvkJ0kAtp7ZnZDsr83K4A2AnXNcvedN/k0fXnc=;
        b=UPAN6emdz7lL8XFPI0pAqlW8HXhpZWmGiARUwilinDBG9uc8PG+OxoffQEdewEGGrI
         NiIl6U516ucr4hp/nJ6o1TYaSPBzauH0eqLlXRSyw57GdFZBRcDXugi/BTAfkIDnE43I
         sE9h+8oJNZE0OcuHvVZhk0pkI4J36tQcru7jCNBHDqo1i4DG78i+IuremxgbNUjCN56T
         aYDfUuhdzkA4z5zhZhd/7fSFfX5/0x+YXQzG72KA/Rbj4bGcoeP9P7ftTUM100qu4lLm
         T73D8xSz8OQrNhXF8qMTYOY2HBfiABkOt19Ha+faQJSLzMPzzmonQ4o+VXHipNlsJY90
         lXHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790943677; x=1791548477;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wae5KuvkJ0kAtp7ZnZDsr83K4A2AnXNcvedN/k0fXnc=;
        b=VVWnSZHm6Hz36np//u7ASOp0VSwg8TC7rJ0m7mIsb/QTOPpEzd0owYkUsp1S4zQp+0
         gqs68CiGb3mUWXUYmqF3mIgA9+d7zNGMAfnY1unmqJccQS1zibIe12bA1fjaJIBfRmBu
         0NHlzb/FE1NrPoSmDh5FUb/y/cebUWbI+IPXJBH+9RAWg7oegB2TMnghzpEVyo0grENJ
         vrSLCMwJsDj90Ym3S7UDw8FyFJt8Pjix73UbyB9VTwm/9zhu3PwsrAyCLb4fqZYRpCv6
         fVvR64qS9LjKOmAZ9lsIVLYqVBcYGQN+5hTfzC/Z1OqMMPLKXwdDzxB3sAvDy3G8vxIc
         ZwSQ==
X-Forwarded-Encrypted: i=1; AKwUvByuMBj1qtqpXuNp7aN9hyhz1ryuC7hApIKyMxatJCaAA3s3Swl0uUsH1tWGSSfwqFFEufOPqaFjV4SXQRhN@vger.kernel.org
X-Gm-Message-State: AFq9FYKfHTDr/SpM93v0mR3aWD7dyJ8vvc69eRJVIcF2BTVuQFXvz1GQ
	P5/udLW0n4gmKKHhjTmaIVsx3800bDZVxMmpOrPgVW6ZR08fkig4xoMD7L94CrPyxmwPA6Q00hs
	w8mMi/xhWEgOrmx2ceWa911Vun1IT07ybV21vEycsu1aHgdUmQthQJjAllc8HGJzMsPhH
X-Gm-Gg: AYBFou1NiRrWXlaCpvM62EFfi94DeAXu3PofkMBZF7/i5jqm1VQ/HBGZde47l2BGcxK
	LByAla960+sFwAa7Jmgt5GQCakpfxruXfcOWmm32gc/cfI4hltHhHBNlp4TQZHax7OllK1Xd1Kw
	cqvvlKdpienj4NPPflY/KH+T2/vfMeAFS4ymfE0zExaWROBLoMf9RG4/4UX/wgk9C8tqXWuye+o
	AceiJcF8R/fSlNIjqihaHOEesPL1tgciqwO77u7tAByxQ9wWRJ4MfgHaRvPCoU74TR7L+u8Rbgi
	Upg09OqrmGM52NkGDJrRN3BZmk2yCiiswi+Hap/0x5negL30TGWbg42yZEBbIq+Q6Dl+t5w/Vax
	b5qeHZiJbEa38LG10Fk0geNT2Yq21anEx6/VDNEL9dWY+mW9Q28FiXBdu3jizSYD8ZWMMRlVKJB
	n0HqZvzJobHHs6
X-Received: by 2002:a05:6102:4bc7:b0:7a7:5355:7fb6 with SMTP id ada2fe7eead31-7c0f59b3ca2mr448778137.24.1790943676392;
        Fri, 02 Oct 2026 05:21:16 -0700 (PDT)
X-Received: by 2002:a05:6102:4bc7:b0:7a7:5355:7fb6 with SMTP id ada2fe7eead31-7c0f59b3ca2mr448770137.24.1790943675425;
        Fri, 02 Oct 2026 05:21:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a87e32c6ccsm8966761fa.38.2026.10.02.05.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 05:21:13 -0700 (PDT)
Date: Fri, 2 Oct 2026 15:21:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com,
        helen.fornazier@gmail.com, airlied@gmail.com, simona.vetter@ffwll.ch,
        lumag@kernel.org, robdclark@gmail.com, robin.clark@oss.qualcomm.com,
        valentine.burley@collabora.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] drm/ci: Remove sc7180-trogdor-lazor-limozeen job
Message-ID: <q6yw7ksztmybe7zz7tsrfbnjwsvgku2rsybqn4k56kwd5gk6ka@7uo6s5taakt2>
References: <20260616115410.325837-1-vignesh.raman@collabora.com>
 <20260616115410.325837-2-vignesh.raman@collabora.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260616115410.325837-2-vignesh.raman@collabora.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA0OSBTYWx0ZWRfX0gCvoV3Anklh
 XT4BZPMuBALrtiWEWtc8N+qg5Iy//cj99q9O7rmd7Ok60DNvtkifvfxSk0wcTM+5KNjy8mV1OSa
 y9iLKoMVTA/q4r+vh8RU/Ffe3coMFq/g+nXU8PeXvV6R9b9bHBXiB+Su3JxPn8UPwelszO6P965
 IpQtO94lnmwAqI6zXyjCkreG/nyC6zDbCoRaalSHj9HRsjFmP9eRz4KJEVenzMkKNmMfzbNFGDs
 xYj6GMkPJTUYJjfpgIj8rCBcievzkkhstvaErhxLacGWP5T1dfktShrAukjsV2KgfZUvTJhcqxo
 BqpuiRsHom+iAHjkupXQEXB7eZTL3SsrW0RpNHKu0f1XPBaPIJF1e38qpTCD47zdUodVLUSmIvB
 9zaqQCEo+0uIy1a3mSlKLi1s/pwWbUcdZEJrXJPstQtTOTWPtF8e/DtJ4DSTLDjxUuiqPkAR2M0
 PVT23f8syG70aUshi8Q==
X-Authority-Analysis: v=2.4 cv=JIauIMKb c=1 sm=1 tr=0 ts=6abfa1bd cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=e5mUnYsNAAAA:8
 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8 a=JEwvJmOL-QIgOP14BV0A:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22 a=Vxmtnl_E_bksehYqCbjh:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: BQvKVDXpNp9QVM8RCyBIQb_538FDIj-_
X-Proofpoint-ORIG-GUID: BQvKVDXpNp9QVM8RCyBIQb_538FDIj-_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA0OSBTYWx0ZWRfX01s2Xl49BuZ+
 C88UkVbLkkCKYcrZ6MThjQB03lUk1Rd2ZWiZJE0XnnyFNw8QQvHAH777NxyN9KecaxCIVGvdb2M
 5rDR12r5YcPrAvil9a6dE9U5R9DThuE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_03,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0 bulkscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610020049

On Tue, Jun 16, 2026 at 05:24:04PM +0530, Vignesh Raman wrote:
> sc7180-trogdor-lazor-limozeen devices in the LAVA lab have been
> experiencing stability issues, and 4 of the 6 devices have been
> retired. So remove the corresponding job from CI.
> 
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> ---
> 
> v1:
>   - Remove sc7180-trogdor-lazor-limozeen job
>   - https://gitlab.freedesktop.org/drm/msm/-/merge_requests/221
> 
> ---
>  drivers/gpu/drm/ci/build.sh                   |  1 -
>  drivers/gpu/drm/ci/test.yml                   | 10 -------
>  ...sm-sc7180-trogdor-lazor-limozeen-fails.txt | 22 --------------
>  ...m-sc7180-trogdor-lazor-limozeen-flakes.txt | 20 -------------
>  ...sm-sc7180-trogdor-lazor-limozeen-skips.txt | 30 -------------------
>  5 files changed, 83 deletions(-)
>  delete mode 100644 drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt
>  delete mode 100644 drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-flakes.txt
>  delete mode 100644 drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-skips.txt
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
