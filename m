Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 797A847CA94
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 14:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787841341; cv=none; b=V4oi74zewm1oPU/vlX+07jdlFIx6MZIxTeKMar77I2KmwfKBnMdAlTNMcYIoWLi5KwlqYqDotGPrke/oujW4Vun0vVq2CxD6kHr3v1R26l6MHObTeBgpfNPeyM2RDMvmILLExWLXShILL4N5vhyeOr03yJLX3mCFrrzFTosfzmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787841341; c=relaxed/simple;
	bh=YVogohUxhXYW+qro4eW5iR1NlUCYy5vSLjvkomWHDaU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y3TFVGlmxpA2UgLOieCAht0t4FYoZXhej1UDoKdP4hMgaq6wgpugXI+nmxDPgnoENqJKTcMfiRDp6AFmqqQ9fl7FdPn9Ki3sj/yaGmbTxBcC12M7njm+MRw4o9L8nVH4vyH4FkRvzyKcOrPuAhU25/yLc7rBk+vaHJLN347j7JU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SykoalYu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dhiBbOn5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SykoalYu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dhiBbOn5"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RE7Sjk3630663
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 14:35:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cfkQPAK61rdM9CVGwbTeSOvH
	+QMdclpOh9TVNimhDYY=; b=SykoalYuWSS+3VTkMeSCeJe2+7W2Q0+HK+T5gi2k
	L8j0XebgvrJ6Zd8Umjq8EcPQHPmCDDKIAHdBEEcJHHEg5KmHyfaLbBs9EXl4bH6F
	AQ09EFxbhgvu6irrED5gFxYH8Gq1suXAIQ3GtIuSRhiNpGOHF4YKOr7+1nhT4sb8
	orXEfJ3i3d3PE0qbpSm55V1Nf/fnS2isx0+sYrnA79H/Bw+TClofPmzfThW5zDFf
	moYiRW/N0sehO/U201HY6Jii7rhYxgmqCgs0qR7tHt7sY13pQDnXoRCdHtylVH+c
	t75MWuzrWnoXNliPSA0tW0QOt0+ecv2pYXuxQFZU1SfUoA==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4game7rqmk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 14:35:35 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4b28d7ffab1so2081355b6e.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 07:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787841335; x=1788446135; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cfkQPAK61rdM9CVGwbTeSOvH+QMdclpOh9TVNimhDYY=;
        b=dhiBbOn5Q2GZ0HR3DKE6dqp3t7wfiNogO4lO1F1Kf+eUPyOao0UmkdbbZlH+Ax8LQK
         QUFhjf2xa4By5t7Q/g3j4WnmJeSzVJhUAy/Fs9PZ26nY62uwboqGLnpi1OcTs9Pi2xuj
         Dkzr9NxYCycGNspo+rGMCClWey6slxP9yQMPtxSAaCi9Y5fCU0A/GwVuxCfZC+GaiKzS
         HxtbJgU6CXZOmvqlNTj+rbCrN6093NM/vDo1USzmcd7wRWJeuKlG9eKVcDqxLS/ofGQp
         FBCqgW99Ej4YU6gmJL32HSTfRxQs5OKyxzOKh2qY20v6gyevLbdg8amRrKHdxlEFA4Xc
         ku8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787841335; x=1788446135;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cfkQPAK61rdM9CVGwbTeSOvH+QMdclpOh9TVNimhDYY=;
        b=cHgS9XoPEqfpYsGiFzy7Zkm6Vb7qXjX8KWN/qUFpAHvXPuyUA6Zjm8CMejwILN36WW
         wuicr0oEK2fNzpeSyjLcgp3EUIEbS43Dt8ZkKl3aOFJ3SXCHo8JKtu4MK/R7+SKKPQ2l
         Zg+Vvq5UcsKjWrsCbv+T9Tw5p7KlnarzvloohlkP1zNdkZ4J2LUj4tpP8AMAA6lktGXG
         gVrs3Mm7jJ2QhU8WzB0z0qaiyrjQu03H1FCJhUMBXCtf3ohRg5PjviUg5vkjO0zYCaGP
         +eQiVqTflhhjqsQjMSJ+3BGKS9ir+u+bhVhAuy1PzSyy+dVHJQr8/mnXfHffGx9gH8Ci
         LDxw==
X-Forwarded-Encrypted: i=1; AHgh+Rok0ODsx2qushKNSWE/mC0z6Kq5G6Y6B081ooFgsU52pMQwcHnAq8m805kcPLe6b1XT8I6bWUAUzQZyMCyX@vger.kernel.org
X-Gm-Message-State: AFuF++l+1U8cDuzIMa4+dOtcXmjbFK2HJyTVD+FepHSstqdl7317imyX
	Ajqz2bPPyjiuzGFG+ZqpF5HjokJQBOTTjSzelyPhCGe4BJXUCCLovSzaYT689ZAUBnFshcfG5FB
	jmige56vrFHQ5HCYYJIxpPhsq6ZRvtlawTb/YN/lOerlG/6BcpUuZNybSUc6VyJZ8P+SB
X-Gm-Gg: AR+sD10Z0rVYeDIPZY8bpNCi86uStKkhPg4nzZIctDNmTZidMrTKKHjwneJTmE6pnaK
	UTGeGvVo2MNrE45egg+0tYByhqSc63RKg0Db2e8/J4msxBkLGBr7PyccG+LUdsgRU3PwKRzDl9n
	Lw8nmHMcvBYx8PRc9lCxOIHYSLt6nKiinOgpxaojJYxyOIN8kvrq+lHN7ro5E4LaH+kf3bYiMMP
	h82GIgQtl3HHE3tHcMNNZdHbNdw8/X1OhoEPo7GGrW4VWnPZaHaVuN/gPM00QFP/L2ZCDms232m
	Vjuq1gs1dar1kNI2zEVRfhKqfpwCWH1vtB/coPjn68XHDZZGFgAIDLRfxeVhI3mW26hMaYhVZU2
	XXZVSVcvWwGNedhCr0YfGe/DJrBzneqez926/aK8r3FU=
X-Received: by 2002:a05:6808:c173:b0:492:c9a4:2104 with SMTP id 5614622812f47-4b37c999474mr5860670b6e.10.1787841334628;
        Thu, 27 Aug 2026 07:35:34 -0700 (PDT)
X-Received: by 2002:a05:6808:c173:b0:492:c9a4:2104 with SMTP id 5614622812f47-4b37c999474mr5860621b6e.10.1787841334243;
        Thu, 27 Aug 2026 07:35:34 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b38cc3e4fcsm786416b6e.15.2026.08.27.07.35.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 07:35:33 -0700 (PDT)
Date: Thu, 27 Aug 2026 22:35:27 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>, Vinod Koul <vkoul@kernel.org>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] thermal/drivers/qcom/spmi-mbg-tm: Import IIO_CONSUMER
 namespace
Message-ID: <apBLL4x0h2kUaz-n@QCOM-aGQu4IUr3Y>
References: <20260827103555.883018-1-shengchao.guo@oss.qualcomm.com>
 <apAzGkXpnMYHcnqJ@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apAzGkXpnMYHcnqJ@ashevche-desk.local>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDEyMiBTYWx0ZWRfXyB9xF4f0hJhf
 mhWdEVcIgUwE9ubk+aOreUUSt7MXpKzdxcQ2ec0UMbT0fsYs6zXVEJ96kK8DGavueoiuZUzdgqp
 1BNTCjV1/3evRxfWAfEyyBS6aG1V3BIt/MNr12jStzasAHFjlNL4I+fzIZ+wCOBs9uj0MOO3GJw
 T8dRtbrmdth4LgSGP/jqDfvn3dV1a5hbjIQCESj2LtG4E6Fiu3QQGrnSsizvkcZR10OEBq6oUC1
 ngcP70DrAqqgOjRmQ/rTyUy9JRCvE73ctTi2ZgZhSAiIMExogdbPPWfTumOg4n516EKXAQu1pCn
 4STkCzEeiE6WvdmlptYnPvexRC9j+uq7VIDv2RVVBgRr+KVZRNYVB6YWtlZo1VvKcEbDL79v7ij
 01YXxM3bRqUPjfnYogaUXyhpuV5vtQ4IYMdNIC9HKJg02md27Xj3EG8j8bAZzPpRGMOR6qUgQW5
 bWa//5aeHrpgKy5+pzw==
X-Proofpoint-GUID: Twpf1kHX4cRwUFbN2j3MDrhB24_poBv1
X-Authority-Analysis: v=2.4 cv=Yrc/gYYX c=1 sm=1 tr=0 ts=6a904b37 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EsJU3W8_Wz0UbiPOGlkA:9 a=CjuIK1q_8ugA:10 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-ORIG-GUID: Twpf1kHX4cRwUFbN2j3MDrhB24_poBv1
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDEyMiBTYWx0ZWRfX5K1E+Q8Bb7WZ
 AvScufxL4tlbVSlwpYxLBXIdKNulLGI7r66RYJHkVnUzEqhd55Mzd0+8PpRXikZjj2aoL5SWFjO
 XnIuIK7xyMyeK598XgjJrRulFbUTNiU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_05,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270122

On Thu, Aug 27, 2026 at 03:52:42PM +0300, Andy Shevchenko wrote:
> On Thu, Aug 27, 2026 at 06:35:55PM +0800, Shawn Guo wrote:
> > The IIO consumer interface symbols moved into the IIO_CONSUMER namespace,
> > so consumers must import it explicitly.  Without it modpost fails on
> 
> > 'iio_read_channel_processed' and 'devm_iio_channel_get':
> 
> iio_read_channel_processed()
> devm_iio_channel_get()

Sure, will update.

> 
> >   ERROR: modpost: drivers/thermal/qcom/qcom-spmi-mbg-tm.ko: module uses
> >   symbol 'iio_read_channel_processed' from namespace 'IIO_CONSUMER', but
> >   does not import it.
> 
> > Fixes: ebf1d03dab96 ("iio: inkern: Use namespaced exports")
> 
> Shouldn't this be backported to stable kernels?

The offending commit just landed on mainline during this merge window.
So there is no stable kernels concerned by this.

> 
> ...
> 
> Code wise looks good.

Thank you for the review!

Shawn
