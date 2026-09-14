Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F60A44A3FF
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789387896; cv=none; b=QLLZfEom2JKjaxrnedHUKSa1KsydrD66cZoTLfJlUja29aq1Xro48qTTq++ynNcIDJITHcEeZLYxNCav9q9NAysY2F/CFkb5zvOYW6+Annefbm/6CtRq2Bi8M045Roe2l9FoxeOX1657KlWj6PwujjTym8BST33ZWV6GglO1vrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789387896; c=relaxed/simple;
	bh=/qXZQiWSYZP3Hk5lWB8Zy7NUdHgncjUSfqqrWQCH8HQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dPP5p9FLKF6Y8PREuPKQfg8VSjLGkCDzNpHdLcY+3k8EOyv46wJWngbj/Fzi5eFrDpkXAT/yw4vB76ssUeA/A6zW/98LyXGr3ogHpzyNhI5lV5d53vThvjpwgq2/uoikB3cNAV8QX42/gpTXZzj04jOkZMoAlPVCu6tTDahH9vI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZLu1+IBf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZgeMSbhP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZLu1+IBf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZgeMSbhP"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAm5C21216233
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:11:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TGOsUT3dlL6kI53BlDSeWVAg
	IydWNJ7b2kgtqLeWv58=; b=ZLu1+IBf/RnwYRTYq8ExeBOIkuZOTXWWJ7HUZ9wS
	+j8xhBhd6B9ut/wdfdl8wx+7TbHY2X8sHPjkYICYOw+6+ot21wH4ehpHO3s6zd9I
	54D8Fl7jJ1SAzDGfvnkcZog2ozCLnRUX24p+G6InWJ7rbJLFliRyDdh5i9HouZM0
	BqPNUL+/WkGISuGfWwB1F7TMTSx9h7OhWyAgHZS4NaYpWRr0/AHRCaJ/0m2ZocUy
	6kv2ZFNuxEPYd/xD7XAi9QI+4mVbfd0O1p5FpkAx1wVNk3LkBkfqjyvr7zLjVGlK
	xS2u3yc1PRe/MHS4txbHJzut4h37bCv1W3eYRxeM4ohBwQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3k0adp8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:11:33 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c8487ce333so999682e0c.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 05:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789387892; x=1789992692; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TGOsUT3dlL6kI53BlDSeWVAgIydWNJ7b2kgtqLeWv58=;
        b=ZgeMSbhP6OUUbgcCZy7tMlo2h9Eg0Shyf8GCAWYWuKA0V70zFjORA0DA7O0tOLOlvy
         JbvndHOQFjMZwqVA1ZOzx1DHKXwBhmtsLrkWgu977038UipfCXaj2NYp/Jj2E72KL0SZ
         wlkLzzUKD2FYR5WS8ox+BdrzC4gNn0Z7YYqDzXD96JMZZ7AhSCRBEkigewUUW663WDE6
         Dp047rw9umeYqh9IydUgKrOzvrZ/+jCoXCUj9DTrQ4jzs46fTfWL1i/pcz/m77wIUCkE
         haFHhdr5EUiOWqAZSQfs/xIeiW5dh2zZejQNWYbHAvOANrB+TYyhv3D90+5zZcLVagqG
         2JKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789387892; x=1789992692;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TGOsUT3dlL6kI53BlDSeWVAgIydWNJ7b2kgtqLeWv58=;
        b=Xm+0DY+6lMZZ7Smei4Qfs2Iv1Rj0kRojTXDzBtd/9ew0jsuciHxST5X/RnVTDowiq2
         0Cl3P3Jz/cOKXa0FfMpwxOn0CexanLVO2SCg6tu1soOqHqn6tOul1siKRf+yn6u4G+JZ
         f11+4XKPUy5budmAGgiicRg/tb7YYZw05yWRuaqb9DF+se0Nse4G53Q59R3BXhgfvqGf
         bx8wtuJJ8+HUgOhdn2hohogjrtaDS3X3Obl1vW7YTjVNe02UP8+ahPIH9GTUqenQglov
         dgZ0x5K9qa42JB78w4K6KuiFfm1RElDDZM1wc9idf6b7Hb92h1Ea3Lo9XuiX3AbBBTfZ
         5YBA==
X-Forwarded-Encrypted: i=1; AKwUvByZlhhZ0T+Ks7haaA6LL2MhSWRiKwg2/2JBbgYyCLJ9E2xqFgNDtIQ3RE10ebuBu5PCOqQND5bNsw+F32oP@vger.kernel.org
X-Gm-Message-State: AFuF++maOtuvo865PtRLBqFfVzDF1Th/hiOXB0bv6WvomFxID9lZ8bJ7
	FWV2kZxfnqGdDv+gL+t3hGSeKYeDUBVnb8p9UsOPyxcCo0u2HamJmqM4woVSKB3gU6V54vKYQ2u
	dLuO8P4QIlnt35KOaYqhWVzaNEfg2VqfgeakbosAoXPnC1F0yxGqQF7cC86qVvXjTZYB2
X-Gm-Gg: AYBFou08n/6Z/7VdTmgZQDyNdGzcJnCiP0ILZtxdGn7mSQhlqp9RSayB2mi4icOh9Jy
	UQMKczTON4Z3VkRPy1139B7YAEImVz5y9ZOt8ouRHVDP5uo42tJ+M4Mx/LRRiF5GRomvXPchc7R
	bv+Td4lxcsgfoAOECYcLRwWQGq2SSA26JlWiaQ72xSRhc1pAQZKKxjmBwGAe2L9hRvFVax3dm0K
	u5r1g397yIX48wp+NIZQW1OIaLzrbrthXc6dFFT9gaqHWUg0GVHx4Oh/DjoJ5qFO2Ht3wOfJwyu
	dpx9cbbhYks1zDgqm6zGQcXcng69dTdEDUGEUcOunHk38bzFFbrRMt5sVYWW0eJ2wNnuowZymq4
	YzNwLActaM4+rNW3IM5xZG89NId8VHk3E1PiU4pElF2Q4jTMTO7AS/8/6clFYBKiM90MXELFSDH
	/GhhWt3z9D6wcy
X-Received: by 2002:a05:6122:547:b0:5c8:2ad8:1484 with SMTP id 71dfb90a1353d-5c981ad6d23mr1305467e0c.1.1789387892340;
        Mon, 14 Sep 2026 05:11:32 -0700 (PDT)
X-Received: by 2002:a05:6122:547:b0:5c8:2ad8:1484 with SMTP id 71dfb90a1353d-5c981ad6d23mr1305402e0c.1.1789387891867;
        Mon, 14 Sep 2026 05:11:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a046499bsm2338562e87.44.2026.09.14.05.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:11:30 -0700 (PDT)
Date: Mon, 14 Sep 2026 15:11:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xilin Wu <sophon@radxa.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: iris: Add SC8280XP platform data
Message-ID: <cwljkshgt7q7dbmujest6u2igpnwcgyx7xmxct2ns4g7ph6avo@zngraegxzmue>
References: <20260910-sc8280xp-hfi-gen2-v1-1-ea51d0386fdf@radxa.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910-sc8280xp-hfi-gen2-v1-1-ea51d0386fdf@radxa.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE3MyBTYWx0ZWRfX9r5h/2gf087C
 fw9MgoONfDUofcskELTb3vVUBb8mzG/OYfenTB6+j3oGXyR5PmYDX5XIj8fR8sJDfG+7UKXXYnW
 V4MbZmwKKTueMT6QI1oWj8i2YeOqRec=
X-Proofpoint-GUID: uYmrylXPU0QkuVD-po2ba0eeVws897v1
X-Proofpoint-ORIG-GUID: uYmrylXPU0QkuVD-po2ba0eeVws897v1
X-Authority-Analysis: v=2.4 cv=BtAIUoX5 c=1 sm=1 tr=0 ts=6aa7e475 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=ksxQWNrZAAAA:8
 a=-APiHbVL8haAwMLVaR8A:9 a=CjuIK1q_8ugA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE3MyBTYWx0ZWRfX6KtqHu+aDxap
 fhTDNn4nXg/hesG2nul7eEKzOBuGZSruXphzrxzuy5iJvXYY6id9Gb6KkQSXF8pyILrWd6IpJ29
 dSi+hYw969g6sBUoe9almz6+9XNM/X0KUjdEfZxPdG6K1JhsCSqEUb8Cr/vNlneQxsHvUWZXnqX
 afKHEu0zP9h2tw3xpnQRrUr0vw20h26S0pp0wG4/Yv8FE2/tTdvHBtHFgQeu+V77qmH/e431FZU
 rX5ZcJuF7VQqdmJ9jay9d5yDBF4Ab6Bxcg/KzmTZ3709VP84Jgx1YxvufLSH3XWBNDAqzT+dYca
 YZ+E2SESPJGVo/3Puem/gEgDtZ881U6pEvdg4BWmjsQDd20xwAkwmsiD2ynA/jUP6x/22JCCHfR
 1F0d4cfbrUBgsbPkKEa0Haq5CNNIURUENvTdPZo5x+4GZ0i2tO3h5ud71al5K7K8+nIZPKww/4f
 3k3JCJBRc+1Ozc+tqEw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140173

On Thu, Sep 10, 2026 at 11:34:24AM +0800, Xilin Wu wrote:
> Add platform data for the Iris VPU on SC8280XP and hook up the
> qcom,sc8280xp-iris compatible.
> 
> SC8280XP uses the VPU2 programming model, but can run the newer HFI Gen2
> firmware.  Describe both the legacy Gen1 firmware and the Gen2 firmware
> so the driver can select the available firmware at runtime.

Please extend the existing sm8250 entry instead of adding a new one. It
would allow any VPU2 / 4pipe platform to use either HFI Gen1 or HFI Gen2
firmware.

> 
> Set up the SC8280XP clocks, resets, power domains, bandwidth tables,
> format list, capabilities and DMA address limit needed by the Iris driver.
> 
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---
>  .../platform/qcom/iris/iris_platform_common.h      |  1 +
>  .../media/platform/qcom/iris/iris_platform_vpu2.c  | 36 ++++++++++++++++++++++
>  drivers/media/platform/qcom/iris/iris_probe.c      |  4 +++
>  3 files changed, 41 insertions(+)
> 

-- 
With best wishes
Dmitry
