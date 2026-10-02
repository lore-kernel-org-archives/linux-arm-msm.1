Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B414E2F20
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Oct 2026 16:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790957122; cv=none; b=SnzdBkT8wrLLaoDygMC2YxB0Jno2mBI5c2BsylE36eWVqxDKn4Y3aXsPwk4OAqznsX/YnNHk5wd3/qMSv/Wipimulq2/mx/YkPObqIlfaVu/mV6BSJF9eJVWalPq3zRVSr8EMiT/yPAmks2uJnQ2VO+TgBzj++qr6QnjpBKAcGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790957122; c=relaxed/simple;
	bh=yN0Eni9Kg2efdRJajeGIiBF+LcseoG/mwMmZb88k97Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NjnRBdxVhvcOOF4rXR4UIQXJh+D/rxSvQlU+pQws50dzB/9IhvA82S8DDZCszAQZNu084hWnYBMrE5kE6DMmFM+TGJSAlspJ6UQdF+sDF/HLh3aItQ00XgnYvOip0XJgc5cETwrLmIlmN4oLYfdNRCu9bgU5fk9q606rp8r1DY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f28IOkX0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bTMaYlme; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f28IOkX0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bTMaYlme"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692FGj4P434998
	for <linux-arm-msm@vger.kernel.org>; Fri, 2 Oct 2026 16:05:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Q9r5w+GpWf4gN47am+35rMxi
	gCSGjr21fClI28eL45A=; b=f28IOkX0NMivWOlFrM5h2LD84mzH5dS2zzRCXJeG
	cNl6Yu1uurWycyU8Vv28IJ7qHOBql33dhZF28ZGzvzk031rdZh1yjpeyYThTD8Dc
	tjFc+3vW/2477pm8nwG9okxyoCB+PKbRlq2BuyOpyykQUZJK06fYWEenbYGZqFyd
	lm+w+QiFXnBLRbJ38ShJQPQ4ZjRKK1tE7KcjFr9aehzNcEQztD8WXW0lFdQQfT7M
	BBLrQoZRrxsfpKugqh5Nf3J30QBSPdRwoWXDlHd2JlljjIE9zjC+dvUStmXLNINW
	E9CHLOk0wcUBKgGBj1zETnJBZQE9rDGf6ueVUdQG1oGZFw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1vxebxhp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 16:05:19 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7c124d17880so210201137.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 09:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790957119; x=1791561919; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q9r5w+GpWf4gN47am+35rMxigCSGjr21fClI28eL45A=;
        b=bTMaYlmedG/wAkbQ1ak9zVjzr6t0/8Z5CRat3+bKKzvg8RkOJAAHJZ1xTo7BVBvTdN
         aH/Z6SloJLDuLoCVHv8j2xmnxFzJHmwICjCcEiraPLutDvUzsYcQ2YKcHW8fMxTskOc/
         DIykbO+JEOYo11OqJzyXwNoe+mXU6Bk993Kbp0QWURyssjZNkFo2a7WPeuopVOvwXx9H
         Vo2C0y4jq7L7JQtXpiKSa0l7e46XZjdAPPYN1/AOZjfRYXG2LOvEPL202UCXW0U3HR57
         +LsWFyhEGwKznP2lvMsLToT/yTYCqOJP8SMk9/c1P9JJM6K9/COziaIjEHS/SqOgBHyR
         KDVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790957119; x=1791561919;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q9r5w+GpWf4gN47am+35rMxigCSGjr21fClI28eL45A=;
        b=NETHVW1tH6S7exunhvVv1sbGljyiUoND6OZtvLD7jIciLDrTjsdOugkNNUzKwijw1P
         O/6TwpHBU8GliBptYJRwcjmOBBFpwjd5TE9ij8+St/aBZCU/IM97kLhe7/KDb7bxSrm6
         pD5qokjKTbbasXm/Rn6kB63i6et0zGbWL8vn9ZM5G7dsk7BpW7PGtIVLbq51kYdTyeXt
         go96yREmG53eqCL8+f0MyEAOPsdxwjKXTtsxgjm7y4OGj6WAZm4Id23gnRR9NeLbld5O
         UPs4hawZZFv5E8uv5EGJAp4j1hEfaMK7J7YUkUkmwroAdEAU4DarX1HDmXNWdoZ453xG
         cobw==
X-Forwarded-Encrypted: i=1; AKwUvBwOjr72XesjqoHTfUGMCmI84Y2a5pBP2YHQglAWrYP2dnv/MIh2J76mnNcPROGltjQSyhA+nUadZxW3opUo@vger.kernel.org
X-Gm-Message-State: AFq9FYLW8R9H7Lgt1tcYx9AhWN7iTIesHPGtgUPwzn2FtsV0OnSCWPMN
	AGzikEqhuBJjf+RiyQOI/e59nfcZNUnhvUadPPMk1EW1CV88BUkdYRt3O/kr+rhfMm664ozikTc
	08Gtekdsaq8xLirkr3KozA4kxVglkC/uloF03H11P/KTqWSKZ648FclCkqMqbJl6dV+Lq
X-Gm-Gg: AYBFou1L2bJ+yDIrCvvw81QKqFgVzAp9jhPuGjwcspvLPxguzPbFAqmdxMvO5pHE3Ld
	o2fxUW1lGLT7o/U0juEq/i0aVbpE5T7+SVB6/kyvlefnVdxJXWrqHcRsNcXBLErzpU+jBSjC2W6
	YEeUHTnpOtgwYdyliQdsUYB5r0p1iEKEi1qRYxnsIt3NgehazaRl6aR7Cn9Q9CZu4gXwkYLHumq
	vBIs0SiLcxYnc8N8s+V+S7rRuHz51w7FFzgBQ3rRrC80hGrz8cvqD293+doPPSoqSG/kTguGTVX
	WKj1cMi6XhDTSxEEGrq/YxzGzSjTJl3cOae4lHyANryK+H3YgD4pU7vw3PqkeUZVD/JMNRTlpY8
	0jgKbu/l+rPuVkU2nfl72tDD0OYOqfIrvzagohlUCPUKQa84akZM46ZrchuvXadiSN+QS6D00RX
	ZBe0krXuA7QIs5
X-Received: by 2002:a05:6102:8519:20b0:7c1:3b2f:d275 with SMTP id ada2fe7eead31-7c13b2fe0d6mr302684137.24.1790957118552;
        Fri, 02 Oct 2026 09:05:18 -0700 (PDT)
X-Received: by 2002:a05:6102:8519:20b0:7c1:3b2f:d275 with SMTP id ada2fe7eead31-7c13b2fe0d6mr302662137.24.1790957117997;
        Fri, 02 Oct 2026 09:05:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a87e3030ebsm10982661fa.16.2026.10.02.09.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 09:05:16 -0700 (PDT)
Date: Fri, 2 Oct 2026 19:05:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Wei Xu <xuwei5@hisilicon.com>, Michal Simek <michal.simek@amd.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 5/5] ARM: dts: qcom: apq8064: Drop PCLK from static
 replicator
Message-ID: <umknnkfjevejagydaktpq6zgh4l2uuxy4k2f5l7v2ypr2xb57q@obtxdmeihisp>
References: <20261002-arm_coresight_hi3660_remove_dynamic_funnel_clocks-v1-0-c3edca1c480b@arm.com>
 <20261002-arm_coresight_hi3660_remove_dynamic_funnel_clocks-v1-5-c3edca1c480b@arm.com>
 <z2bu73w3xcl4ofbp4td3rj7wazzoth5gq35obiqkrfhhfxufcq@hrfvij5jnb55>
 <20261002153328.GE1208404@e132581.arm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002153328.GE1208404@e132581.arm.com>
X-Authority-Analysis: v=2.4 cv=fdc4WEQF c=1 sm=1 tr=0 ts=6abfd63f cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=8NyxROJaIBheOw5Anm0A:9
 a=CjuIK1q_8ugA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: nn9xCfRFQI94m52wfVeRh-swKXV7lyZh
X-Proofpoint-ORIG-GUID: nn9xCfRFQI94m52wfVeRh-swKXV7lyZh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA2NCBTYWx0ZWRfX3aiutewbSFNS
 jPWmMxAH/zQZuB7mVvsCOuijvDOWWq1kgGeLaDAcRaSTUaY/0TmBn8mu09nm0P76VH/ofCbGag/
 /2mZdg+KYw6H6LKZd4rdTg4wyuya1NrP9QZ1ZRklV/xyOzzXh5rTREdvoTG7t7TwqmZisGvLX/7
 me4lfLFkSBqdG//gwRnASKeZrZ0W/cejbS2ig8WaOP/rtycwGtCLckRwKt8KBX17UT7EquHI0K4
 ZzLssBZiz9pMkF0/rvKp9RArPa+TwMTcH1bxk8hHX3kAlFKXwNZUDldWF8Ri2dTiNY9HEKLfGXw
 KylJEimFEtYDtck0HY5n5Wi0mPkVHLnl472wwTy60G5ZaTVMypz00+23IGaGlIU7UQ98xZVyEza
 NBYAwvOtZFiwWP4oAx4ptB6zu/v/gFcrirzKGxn1SvZrCj0tUYKNs5+gohRn55w4WU5zl8MkIPY
 mVAIfK8v/ch/xU7/SxA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA2NCBTYWx0ZWRfXxhgslV545Koc
 yNzM3yVhSV22fQALtCaI7CZEdvf0RaiXiUDiIZ3DzpZuTLR7tHDgDXqG0VcX95uHDjRE3WqY/Mc
 a18ijQ5oJBUy14fbEFDMzpkz1Zc3UDU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_04,2026-10-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020064

On Fri, Oct 02, 2026 at 04:33:28PM +0100, Leo Yan wrote:
> On Fri, Oct 02, 2026 at 06:21:36PM +0300, Dmitry Baryshkov wrote:
> > On Fri, Oct 02, 2026 at 04:07:24PM +0100, Leo Yan wrote:
> > > The APQ8064 static replicator has no registers to program, so it
> > > does not need an APB clock. Remove its RPM_QDSS_CLK reference.
> > > Other programmable CoreSight devices keep their clock references.
> > 
> > QDSS clock is not actually the APB one, it's required for the coresight
> > (or to access some of the regs) if I remember correctly.
> 
> If so, it might be atclk for clocking the module rather than the
> register interface. Could you confirm this?
> 
> The replicator is just a middle component on the data path. I read
> that it shares the same clock with other CoreSight components, so it
> should still be safe to remove the clock from the replicator node,
> as other components on the path will ensure that the clock is enabled.

Unfortunately it might be hard to find info for this platform nowadays. 

-- 
With best wishes
Dmitry
