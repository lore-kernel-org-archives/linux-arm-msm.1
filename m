Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF1FE4766B5
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 21:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786485300; cv=none; b=jwU8yv1nPS4Lh1KcP5srFwbhQqVD2mqzSCanwYxxFf1cN8egdc2TnIXiswKX5LLpK2InbqA+6XNHhmKQofyvlIfo0Fo0mjTkza51f/vrpzN2pTR6nblxwiNLMZmrrSFB+PRjBAbZIxkQ1zeqHiBlObYWtvRojv00J4CtGcG8lrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786485300; c=relaxed/simple;
	bh=K0qHNXC7XUAR6czQRw2ccRE+viWZzRlnoUqvKGWaejQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V3/Z8rAdol4RvZMZjNaGAVQXvMbJChGBgMnfVpAyGDqlgZ3rQftlJSIaCzJoydQ1pvsgG9OTdggoRWTICPmhVC79Dc+SN3uoRd5Yn5wIwni2xZiDHu0pu7rA7HId/CWXxDIU2C8GZu2N6km3n9Q5edbyKh04lLJevl5wULKfmy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nMJATCG2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NRkYAwNI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nMJATCG2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NRkYAwNI"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BLb6uT2998221
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 21:54:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Lg7r4jRNOyzkLhjbQxRqnnTg
	A8DYDTKbQUaLgWsm+OI=; b=nMJATCG2ECKwJBOYcXB6q27b91R56y3xTaMVYyG5
	psmZ+Ai02U4LU2YDkLd2iow1Vcdc3XCIG9iabzVolj0PAWELV2Tvp7uQCh0HysWi
	L5gL+RHBZVEuLnQGULWXRnkp/s+1q3tRr8Bu0w7lOtMn8H38G6/uFQqiBABUS3u3
	CLROt70QL64DDG2GWieBqPQZWTg/1XxavfEeFRgbZ3JApcGTum0Su82EQL4F9H2h
	8HBeg/+Zr4i8bAZX/BT58wAYKvopg9kxrtlWBv2SAMW7oNh5nhP7rq58DfhLkyK1
	8M3wkZI9YMV3lI8A03Cr5VtTCrQ1gZ32jhAwzRXshPV5SA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g049bt9pr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 21:54:57 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1a9764f0so4604501cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 14:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786485297; x=1787090097; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Lg7r4jRNOyzkLhjbQxRqnnTgA8DYDTKbQUaLgWsm+OI=;
        b=NRkYAwNILfqj9XbME/QvuXvVse8x4BKajhNBVNPgAuOmlX45EZFYrPjSRDJfQ9Sf4P
         m1T6SdqCHIijOa3JFtBVxB36ZRThppy/8pchHiC12KsvJeqmxJ1B1T4c4yhOYRMlC7ME
         rGfHPCQrbEDIQmnu571z5CC9sTs3WbQ2pVmmAqJ/2N3KNQTvovJm09YB4jwThSK6lE87
         VO3j0nBc/4usrGKl5wQfJYJKAa9f0c7hyp23vyO2qkwLNRb+lPh/ur94wLFQsrJTI4la
         SqJf5TdAB8gpupyepBZYdYUTqu2haq/THAEDc5lkb9Ao45zIGww1E3xOtkVlvAnnK1RP
         MhDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786485297; x=1787090097;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lg7r4jRNOyzkLhjbQxRqnnTgA8DYDTKbQUaLgWsm+OI=;
        b=kufIa2M/mvyLZGSr39CY4+Mdhc3/X7qsPtEGGXs4tpvN+MvTNyqGMtB2gGTKakvlcK
         p1dOC4UAURd2qAi6KHr/Y731EJbPjyVnjGh9YVaVfEe/4ZDcCPZK4htByiLwYjzWWfsy
         LyDvUVm712Ulml9M8C2mQZB2nkeWYyE0l1ycw5CyYBxXdXVQrrh7FRi8M9Qh9hcJrajm
         ysLKBknbkWZtyoU+YQhxU7mqlxMym0FREU67vF7j04tUR1gH51DKOzqzSLIegLleGFgp
         1TzADsvel0NsuU5l9KUrG17FW+Wqe64Ob15z6sNOa133WBMVXtjTU3JFUfeodbrtyzZq
         1aWA==
X-Forwarded-Encrypted: i=1; AHgh+RrSV/7qlhbuewTN2ZEFdXWNKSVPFrFlmw5jiGB8mUBO/dQRX4A2PLdu4M0KfzO5xokEQxLY0OwESD+6GqsM@vger.kernel.org
X-Gm-Message-State: AOJu0YxVLpBLCh0TGzpJmW4b0+Jh9RWdxKMCezrsgX7XCfTrF6b3AHMR
	oRMLK4bZHWmMgRRga6R/2JpGSqO5f+en97AtybOWQHYi4k8Hdds3HhbOxmihwZQHzljXRCsc8Ku
	JS6D/qNM8Nc15NKAlJz5GehyEhDq+sQGceepwzazCEeNq9nDP5RxLR7rqUao54B0TcCJW
X-Gm-Gg: AR+sD115cF+bx48jl5RmdBL2cnVJxeMt9mLmV+VX7VmUYskAE4wxaBD2zdicj50Q6xc
	0HGnm8kRZ3BaVi3aOd4e0KjPNrFVEyxAHMiBen+dbRMGXXjC5ZwtutZ7QR2F0P6dYOqLlDLKcpQ
	EjfCtNfOhwUUvUSNXi/8vMhZOOJ0mpYMAwxlvcegMJXdKhYkgcYSIjOitDWqd8y+UW6AoXTBYfk
	Ppnr9suZal2qbQOmJoW6lGWZpeR8/HuJrqKUkvLVyU9mrTP6TMOVgeJ1DgUgDD7O+5lllGpxJPF
	6wNvCuemGiKEQDAf0atmXOQQKwwXlPzxe0czyjCwdu+lr4jW2o4wgsqH3ZqUCn99BVjPDrE8rjC
	damUeNBpXR3BZJtV9gTzeiVYkT2HHzb8T0ozU+2zlRuw0Cu+Hie3cy11LuwujDYML1i6mzYG4qn
	QZm1WnBybL26lk0A==
X-Received: by 2002:a05:622a:1a93:b0:51c:d1c:10e3 with SMTP id d75a77b69052e-52d64855f63mr3822161cf.35.1786485296812;
        Tue, 11 Aug 2026 14:54:56 -0700 (PDT)
X-Received: by 2002:a05:622a:1a93:b0:51c:d1c:10e3 with SMTP id d75a77b69052e-52d64855f63mr3821811cf.35.1786485296383;
        Tue, 11 Aug 2026 14:54:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b44d046df0sm108492e87.69.2026.08.11.14.54.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 14:54:55 -0700 (PDT)
Date: Wed, 12 Aug 2026 00:54:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: rafael@kernel.org, broonie@kernel.org, jishnu.prakash@oss.qualcomm.com,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        "open list:QUALCOMM TSENS THERMAL DRIVER" <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH v2] thermal/drivers/qcom: Fix missing spmi adc tm5 gen3
 file
Message-ID: <r3bw6yzla5b6k43crebsrexufmeeudiaqa7sepcf4eutjozpnj@blgu2vl55ke7>
References: <20260811145427.3089426-1-daniel.lezcano@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260811145427.3089426-1-daniel.lezcano@kernel.org>
X-Proofpoint-GUID: jeVntVl2QzTAU-Y4AapiJmzSz82H4WjH
X-Authority-Analysis: v=2.4 cv=ENg2FVZC c=1 sm=1 tr=0 ts=6a7b9a31 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=bC-a23v3AAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=0md38Pq4iEJnK0vhYSYA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: jeVntVl2QzTAU-Y4AapiJmzSz82H4WjH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDE4NSBTYWx0ZWRfXziQU6CEfbZxA
 DpRxENg3Ukb89mvvguiM2s/hXMXKoRawSIgb2zAWjrKWo9rngFK2kuONNSLCR3BGfUCafvGxcow
 5m4SPHqWZXqrOl1r3jLdubZXxUboQpIO8TxsdOniVcC3D9+gQQxuZ01M92MnSF2iAHApnX+Eq/y
 z9GjqL+NfvQmWTJLgJxrL2VMwrONaeg+0TvkcTIbmYoeNLBIgw2+4JoN5Pz3yAzSm+YCQq2WLh7
 EoG5XL++IvFPlycUup1wd6GHLfea7LHAqBkptwaDmO/9EKVewMuQiz8o4s4nKA92jM2RN8bkBK/
 h9Uf3CIZoK5s4rEMg9yrfAdRQO7qU4Bh1DTH6EytRn/2routwgoDCXYpbugr/jknMHXwb69smNk
 x1DhRAQRGdQMp8MPeatNbf0LeTbvMks99DsqsGEbA6JLLRuepWMBB1GkYl0UxM2UfIG+sAYaFRl
 HvGN0KnU+E+it5f+vig==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDE4NSBTYWx0ZWRfX3/WzUy4ellHm
 ZZK3hS23RVmzqzkrZ6QI9fynH8GDkIeKRlCgbdzM24rbRV+4BupXYP7+ZQRniZEnNrytlBl/RyP
 o1kLVwoE0LJa0fTn76WDDXJT5NuHdug=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_05,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608110185

On Tue, Aug 11, 2026 at 04:54:26PM +0200, Daniel Lezcano wrote:
> From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> 
> Add missing file resulting from a manual application of the change
> below after fixing a conflict in the Makefile.
> 
> Fixes: 948ee3a74f35 ("add support for PMIC5 Gen3 ADC thermal monitoring")
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> Signed-off-by: Daniel Lezcano <daniel.lezcano@kernel.org>
> Link: https://patch.msgid.link/20260811094544.2939556-1-daniel.lezcano@kernel.org
> ---
>  drivers/thermal/qcom/qcom-spmi-adc-tm5-gen3.c | 434 ++++++++++++++++++
>  1 file changed, 434 insertions(+)
>  create mode 100644 drivers/thermal/qcom/qcom-spmi-adc-tm5-gen3.c
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
