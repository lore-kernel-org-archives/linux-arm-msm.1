Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175153C6A57
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Aug 2026 08:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786006438; cv=none; b=dr6ATH4iMOWZ6IHbT9Nh+VFigYPTX+TrISccUpvYSL8y3rf9t5moLuoslOOkb31PNMJnCkxA4c4Mj2AW/7Sbg+x7NTzhVv4VbHgiinZQsr9ZB9RgGUfE22AdZwi6QKoi0TrmcOuRxy9WnX3/HVdX06DP2eIdo34waOWJ2alkyaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786006438; c=relaxed/simple;
	bh=zPUa7skzHQfXDK1Wh6BkiuwRT9Aw1oXUoDkZeSfuTmY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LwKzJ9ttxgS7TfhKI3OZDZUAeAhRMxBFdd80ScqFPyt1H6AYRA6U0hDk1Cxky2tlPU/6djb7tyWuEixlH4s5W/km64IYhzlUrO44ej2ECASwPjhnked6qHQUzqTvimaA+qRka533QIkqNPPgcWGTzq8anLJ/IAgetMdRKZE0K3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bsmaJ7ko; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XmaAJFUY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bsmaJ7ko";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XmaAJFUY"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6763wrvi482381
	for <linux-arm-msm@vger.kernel.org>; Thu, 6 Aug 2026 08:53:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1FrWmrI3zOjyRqZFM4V///Zw
	RFP0O2lkdJ0CFPjbB4U=; b=bsmaJ7koc3RK6swlFQ4V8BKfmmb0thnNbbgk7LfF
	yAg/SCzUkC1ajRL1vQF80JtcsRcB3JMcZacR0Oz1zwBQqjYPIB91staaX0znuOpQ
	H457CPSDrm27NUklkfgpm25zBhHpSOmUE5h2wTOxGYym1lZCCtib4c6DVekpRTlL
	JYrApZHhWFiRd1V/04iTZAmygKXpbwdA33i3EOjRw8Q+gV4+Hhzvq2cieScpbjS0
	g9QFii2QytJqDkAKjdHySwOC8wlx58999vmrw0fVeemvsos3Yh4UbQvmdNf46R+s
	IzyHflYpMI9eU+cHkaIF0i9FVtmeQHiYdd3JFbP2+j7ChQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvjueh4s9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 08:53:52 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51ebdfceddcso21058731cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 01:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786006432; x=1786611232; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1FrWmrI3zOjyRqZFM4V///ZwRFP0O2lkdJ0CFPjbB4U=;
        b=XmaAJFUYb5VA+prhlDNnbW9YhWuo+Mq2G3MVaTkjxX43HpSboMhvc8i2dm5arZsC4n
         USNjl/wWCGrbf53W+B6nH3i94aRsix5ncIkZUiQ5Ifnv4WWBT5Zkyk8QIKHG8u1mF81k
         1qEFaFiTOOubeeZoQe3EY1n/J7DUD4vpIZnfkQzzX8Iq7joAf7DIRzO94rpMgL8fdQHb
         IqiZHLy7aGW6CJFNcY/OuS9xnFL8We1ow33JqoJiw37BEoRymmTQdD2HUJ9UlF/jFYP/
         GVvWin8swgxVG34I2mF6yFCrc+YapM4O6LE4Z1TLH9ZzZSCqFhu45zZI8q/p+wQqD780
         Hy/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786006432; x=1786611232;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1FrWmrI3zOjyRqZFM4V///ZwRFP0O2lkdJ0CFPjbB4U=;
        b=kGMCBO3/XCnxZfNECvwXwC3pB+hCsutEapQ1SS5CWDKTMGUjGGOL14ChxBqnGhbZr/
         Xbwe0gn/4AlDC0NY+DMZMcETr3//3mRckv1Oy/ZwBxoQky6aNg8Cco7YfL09kyh9aqi9
         p7odmqISOMXbFZRUyDj7uv1G35Bfrkzkk9gdL+MnqtmxWRCRdy/06dLvaLIC/F9LgyCZ
         1iMMiz/tpl2ECc8F3x+h4KtEdgoxxVgEBVDAkox4K+nB0LDND94RdnDw4w+xYM9Kn3ZZ
         L0NJeuMiphD/f0h+wBzWHQp1Qr+bDoyMeRRJFc1ehhRGetsfAdU+9VAkgg7fkFRb408R
         R7uw==
X-Forwarded-Encrypted: i=1; AHgh+Roy17iCchCQA2JxaVtCHNHum39niJoeyEJh8WPV7hkEUE2KsJ4wZwtCT1iOq/XVpIsBjG4jbs3BtSmV0TBL@vger.kernel.org
X-Gm-Message-State: AOJu0YzWwNciVs+qfFAJIjnDE0lEarThbVQXzgo6JaPXH2zptJFnarZD
	a5OCX9vfX9k1jtValQviFqhmy9Uc1u0H9oAgvSZ05/5IrgPiNvV/uyGMBj+bmwLSElMI9056EdJ
	Cv0N1lusu5fS6mTyacXOoP6bd9AvV2+5x4+tD/HJOOWfZ7nw4Mtcpi4+TuFrko6HlQfFd
X-Gm-Gg: AR+sD113qsA6ChNkpQd/z0SMVktCESIcxw7tc8mmFAhq84ejkYoq/Rrr9NiQ0aF4UZA
	QnlY14MljSKMnNHumLCGVttoiMFqn4Tusk00FIUbeCCuiHYC467gYYzqArFLxbK3q6pUl1nDkuX
	JLqsq4HcwrDAqw1Gx6DJt4oAZNDD71DTcWWK1cgwFhV+1xt2hroO8lvYt3xS+EKEk2qV0RTo4bQ
	OnrGz0lVZSeVEScoQv9dgrq8ecDTzg3lPeSQKAxwDmFcqFf9sgH6uEAB9OramOIQhOtsUT8H8ak
	LBcK6QuGLdX3xNjOnH+ljWnuak/UW1Bsr87XjsHZEDf88zspf3dXvIJZ5RV4/U6Je+3v7voIJI3
	HjOII5mqhfYy6bnwaJa74f45R0rEg7b3KHal1Qz8241GkQqg1DuMOXXg2qQcVuh1P1HQZOY9Wcp
	RBP3vctSG1PhpzWw==
X-Received: by 2002:a05:622a:587:b0:528:38b1:b54b with SMTP id d75a77b69052e-52ce61016ebmr130234161cf.20.1786006431820;
        Thu, 06 Aug 2026 01:53:51 -0700 (PDT)
X-Received: by 2002:a05:622a:587:b0:528:38b1:b54b with SMTP id d75a77b69052e-52ce61016ebmr130233951cf.20.1786006431436;
        Thu, 06 Aug 2026 01:53:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2f62c50c8sm577467e87.75.2026.08.06.01.53.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 01:53:50 -0700 (PDT)
Date: Thu, 6 Aug 2026 11:53:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, stable@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Daniel J Blueman <daniel@quora.org>
Subject: Re: [PATCH v2 03/12] media: iris: Add platform hooks for context
 bank device setup
Message-ID: <7txz4r6p3hxxbgtbipeva7lftia3oebnwbv5my3pjyibjq74eq@3b2hrzg5xlj6>
References: <20260731-vpu_iommu_iova_handling-v2-0-da52b5228dbd@oss.qualcomm.com>
 <20260731-vpu_iommu_iova_handling-v2-3-da52b5228dbd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260731-vpu_iommu_iova_handling-v2-3-da52b5228dbd@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=aNzAb79m c=1 sm=1 tr=0 ts=6a744ba0 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=t9ty7G3lAAAA:8 a=2kl7M1k7MI1Qp7n5on8A:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=CsAS6f0m0zARWR-uHzm3:22
X-Proofpoint-GUID: ipJF1wr__zY_DF5X7t1QXpqxC3SGLDHd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA2OCBTYWx0ZWRfX2sF5Wqn1QonG
 n5of3ekWQXBFg/l0RuVgZSkDXbUyNrm5xCzbv8TAp03aPNWQFJ0P0MOzApH4JzuOfk1BseInBKv
 NJQWRu1DoU+0rhrUvdUjhjKVgjQ30wDFJcSwL84fMP6b1JvszxdItkP2NCNAKt022iPzg/tc1fE
 8lut+FacCTd4LEjwud/JPBczpZc4hvDB11EGBlPaX3xgzoDJPeAlTScgEJqaoZOKMLNtmlpZ4QO
 Te2bkrBJOZitoptfHFWMSLBljJuYtShT7U4yiQbKl5HJbp8s3lRagIdC+e2dXlfi869ofIs0fs/
 21p2KOdKZ0KzJ6JEXE2QJds8EV22weAff0H3svXcnHANT6T3CHy4fd8XwkXO0atxbHQa/APKzL8
 94qhNd9cYyyQJg++NK4FKQHNXNITd8Jc2vZObsDXl2JFcL4DGwWO6PQ1/niPrIDOJvdy1ojvplq
 4XbXd6s1dUUZ2E45f1Q==
X-Proofpoint-ORIG-GUID: ipJF1wr__zY_DF5X7t1QXpqxC3SGLDHd
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA2OCBTYWx0ZWRfX0bAwYzooJDKd
 moQ2miBzYu2ZjHaQ7llyPdAZrG/rBP1VCiNchPVo/dIJiZDn4nOrCkCt4uL3CtKe+mKIcrzhsUA
 wuvPdNWuYjLAzIkzFH69Eh3Gb7T2fq8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 suspectscore=0 adultscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608060068

On Fri, Jul 31, 2026 at 11:52:18PM +0530, Vikash Garodia wrote:
> The VPU issues DMA through several SMMU streams, and the hardware does
> not give every stream the same addressable range. The non-pixel stream
> is restricted to use 0-600MB of IOVA space, while the pixel stream can
> address the full range. Keeping each stream inside its own range needs a
> separate IOMMU domain per stream, which in turn needs a separate struct
> device per stream, since the IOMMU core attaches a domain per device.
> 
> Which streams exist, and therefore which context bank devices have to be
> created, differs between VPU generations. Add init_cb_devs() and
> deinit_cb_devs() to struct vpu_ops so platform data can supply the right
> setup, and call them from probe and remove. Both hooks are optional, so
> platforms that do not implement them keep the existing behaviour of
> performing DMA through the parent device.
> 
> Set the context banks up before v4l2_device_register() so the DMA
> plumbing is in place before any video device is visible to userspace,
> and tear them down on the probe error path and in iris_remove().
> 
> No functional change yet, as no platform implements the hooks.
> 
> Fixes: 41661853ae8e ("arm64: dts: qcom: sm8550: add iris DT node")
> Cc: stable@vger.kernel.org
> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Tested-by: Daniel J Blueman <daniel@quora.org>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_probe.c      | 25 +++++++++++++++++++++-
>  drivers/media/platform/qcom/iris/iris_vpu_common.h |  2 ++
>  2 files changed, 26 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
