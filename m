Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A19C933C19E
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 06:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787035782; cv=none; b=CzVkm3lTqthOFPWZmGk/66WKOQ2CXFhScx4BBa/5tYiTYAcuqhRDVSFU4JS6unNI87ZDFgNNpF2ynROW+eXDeFNeSKkwZVo3rOXgTWe6zuD1/JxDP6n5dOONScBI8z3fVGqnfrYtUTAzDiKFPzIBW7v4b86fyIkm12I9dZAvUrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787035782; c=relaxed/simple;
	bh=bM6pDSjFTrw3Nm56Uum62JiF+u0GZCCUqToMVeaD8Vk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bBGQ+/RU4mHYzThR+S/u7nx1Nf3FtGYXR/W//4sHOVAjZQEDqr+4v15IZd9yFSMObWfjbq+6nlf5RwqiexEWUX+acQpMBmMZUsKF4/YjB3TSjrbaIKWOgP6PiC9hTkeJ9C9oP5AYFdIuAG1x3qGgO8UOxdedNQrxF8OG+5OPjoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IFHu1E/M; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cqmIwc3V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IFHu1E/M";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cqmIwc3V"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67I2YP1P3761843
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 06:49:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=k4JiTPe+bV5Bhf2Yri0mM0d2
	+t3X2WZruXXiZxqw0ZA=; b=IFHu1E/Mv4Kqnp0FU/pK7eVfYYOF/FRTGmbZMo8+
	E4z9LUwB+slAA077NtvPqeL8pr7vjcRxM2pHY85d1jwxV5+n8V9OG5roTMNl3FzV
	HaRsf+wIuPgp+gtPU/mXSapbYm23A6qyiobEI64b39Eyx5jnQol12uUVAOC8A4wK
	wB7NPb7Zzxue9goykupW+c/nrSOVvQxsMBPDqTik/YVCF3CGA5n2b6MZOFUaChna
	I5R18DNr6RJ1+QPcd1WRhYnGvKi/mwAoZTViWNeMA2TLVUXUnB7DpkXwXqtfKFhk
	ricqUkBe+qhuzSYjvMDk6nhaxYzQW1zwlVW8SjRsibvoUA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4eqts00u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 06:49:39 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93494527488so716426385a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 23:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787035779; x=1787640579; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k4JiTPe+bV5Bhf2Yri0mM0d2+t3X2WZruXXiZxqw0ZA=;
        b=cqmIwc3VpHSWvmRE1rL2Vj7s0w8/m6dgjlrYLIyeAVfaHWg4nTfpNn6tvNP2xFgXO3
         RizxkZJrhqYP+MWEVUwvha12Oay6waBt161hSFoVKAGmd/2+1jc6w6gletYxmOHHrPbt
         N2kfR1vpY82FBZhTJHPwFb4N9GFl106SYnVrTrHsg5F9eyCjDlTtxQwU2HEAvkOt+f7u
         R+Yyl6eQz/hNCJpYIZs9PEnK4Zmaj4+1KVuL2WOqFzU2rm5ixLsW1ZQ72Fio6PjutxvT
         HWBIxPzEZYn5oB9p5pedYhdx+Lj04VbUHRXBtDQIWJzfjJKr+Ir/JDnFRuH2c2pKIoK6
         Qt9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787035779; x=1787640579;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k4JiTPe+bV5Bhf2Yri0mM0d2+t3X2WZruXXiZxqw0ZA=;
        b=Bsc5yLmklCS4cd4V23YwZ44Qtn9hviAC4JAQpjXy4PoBTOG2j9W+aWLtkINk73UEDP
         0zBNqMUOSBgeXWvgRf69uD6lfw6rxTa3RB24AMO1+ECZSrvJbvJzXSEq/QKWYCd3ZjMe
         od2AbLRJu7l479CmhuQhxbHdcDumDSqcoXT7uTeE2SCT7x8dtktszMeVIBNX4wbb8j9p
         MgTvig0cXlE+XOurMOs2bPNR4tkZG23AtpitmJ9xrqp+F5WQNs7wj19FvSUS4t2MRwIA
         Qjdi0uUx4b1WszZFo9r6luYFz8ZQtHRHvpQeB2CHaVGZnk8CZIg/YgZYi7Ka29HTa7cU
         8P4Q==
X-Forwarded-Encrypted: i=1; AHgh+RpAdhDx44KERjgQxjSXUP8i4tJK9VvPqEPv8zfUW3BDQgxSJ5MBfM0l70+AXYKaotz211VbPMJDiDklrXKh@vger.kernel.org
X-Gm-Message-State: AOJu0YylcT4EdMyY1PBzaojho9EhJLy1XqVb7XANs+XvGNLPwhaBgsu+
	/KfqygXz3TCnDdvVwoBzlvs9C+RajkPrJYMazVErSjZLqNc1bCwzh3WPkW/u9njx+lLW/HZA8p7
	a2t+2QKzXcHwMIcQ0MMzRc6z7L5alNZ9+fGgdLoNrx4cSg3vpd3jRV8ydFc9sYr4mCaaH
X-Gm-Gg: AR+sD13KtZEZdC6XaYSnKnWhCfIGIZVNYDK0fppSmpj1J6ScFwNWg+UEQ1ek/4073LN
	EB7p181VaK9//XMGYg/2NptV6RXUMGZCwK9KSCfCj9w5Iq0fWi79Y+hBwkQRFDXYKVHGyeW76wj
	aw5z8mw4WPdH+6ZZfBj4l8G2OoQO7Unhfw+t8HhsEbKUBWOcv3QYF1DaQqQukQ1StJvSMwoAiBD
	3H7P3tCqUamzPnVV6cycWkLjqH7N4YjuZju66UO10STLRIelEWPMMYd6cijMqy8j8Wy+RIIjfze
	Vd4ZKR2eU/xDBuNS38/csfM43nCTI8okjtBGs5UiSTrAFRp2DptI3TmungeEPsfMPsJLYU9Idrr
	OQGVthQ8mMc0BQKFVBiZFUMLS+kXGRU2xBwp13jQDwRGfjnZe+u2+Tr+VLKf/3PfWDD64FjtLEU
	mIuIdFlpuRZm/2
X-Received: by 2002:a05:620a:4150:b0:915:79c8:ec92 with SMTP id af79cd13be357-936d231f768mr3068128985a.37.1787035778835;
        Mon, 17 Aug 2026 23:49:38 -0700 (PDT)
X-Received: by 2002:a05:620a:4150:b0:915:79c8:ec92 with SMTP id af79cd13be357-936d231f768mr3068121085a.37.1787035777872;
        Mon, 17 Aug 2026 23:49:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a16b0e3c17sm9714011fa.14.2026.08.17.23.49.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 23:49:35 -0700 (PDT)
Date: Tue, 18 Aug 2026 09:49:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 1/2] media: iris: Fix iova allocation from restrict region
Message-ID: <yc4clrtiuphrdfcd5nmvttr6lpgsxkbnrrmp7s4urkola3p23u@uv4ahf65clnr>
References: <20260812-reserve_iova_in_driver-v1-0-ed62f801275c@oss.qualcomm.com>
 <20260812-reserve_iova_in_driver-v1-1-ed62f801275c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260812-reserve_iova_in_driver-v1-1-ed62f801275c@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA0OSBTYWx0ZWRfX9LQtOnXI8TEd
 0OddiLsXTpRSOyCWyM6Asy36AR7E+48yvbsHNqGe/itWBB/clHRBDCZsea20/bHZWnn6ogXOy0t
 sdeUx0mLbv1Ai0OL49rl/lsL//ZDG8U=
X-Proofpoint-ORIG-GUID: 12kLx0Dvv6wxZh3Ngpk5p7_IkFBkDdR0
X-Authority-Analysis: v=2.4 cv=UfFhjqSN c=1 sm=1 tr=0 ts=6a840083 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=e5mUnYsNAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Hj55FqqFgxrcsKo4rRQA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: 12kLx0Dvv6wxZh3Ngpk5p7_IkFBkDdR0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA0OSBTYWx0ZWRfX8oOqWwMQUzcm
 UaKP/M2IMyOMpuO3WhPCGOrVnf/Vh0zwFmfAd6AJI9fqjhfLrBSyaHS8zuGCM+Xc1NgzGMsAebH
 UPS7yBj3YB18ps5GRgUSfR9xYKSh5zJjBj0TkimCt2SZoJ2yBA5qHI9eawkwW1sdvhfGEoyjWwl
 h6ug0BEJYaybA/k9Xc51xdqWUmj9WSa/VeFEqXQ/O7/CEC7ym6aT9bo9pIYju8nZnI3i3GQIL23
 kugqKZgqQSq9Z7jB7zm4+qPZVLWLJwWoZIQp6VGwmh7OSHDQhf9OMaIXcVQmC2+clYlUy9DxFvx
 Zm2e90uKKD6NxghZyfFEG8FthuHRomhmnXs8hZRYbpVJIjPRWL33zlo7ZnA9lzaxETzQ+DBe2rp
 V6+6qycRRpuc/lbpRVDlSBwSiGyU/QTLCjjOjx+ewwvxzRlAQvBJOah9plvMZKw4LudNrTzIKP0
 b6gnD2XF4sVVyKkyE3A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180049

On Wed, Aug 12, 2026 at 04:25:58PM +0530, Vishnu Reddy wrote:
> The VPU issues DMA through several SMMU streams, and the hardware does
> not give every stream the same addressable range. The non-pixel stream
> cannot address the low 600MB of IOVA space, while the pixel stream can
> address the full range:
>     +-----------------------------------------------------------+
>     | non-pixel stream addressable range (600 MB - 3.5 GB)      |
>     | 0x25800000 - 0xe0000000                                   |
>     +-----------------------------------------------------------+
>     | pixel stream addressable range (0 - 3.5 GB)               |
>     | 0x00000000 - 0xe0000000                                   |
>     +-----------------------------------------------------------+
> A single "iommus" property on the video-codec node puts every stream
> in one IOMMU domain sharing one IOVA allocator, so nothing restricts a
> non-pixel buffer to avoid 0 to 600MB. Once an allocation lands below that
> boundary the hardware faults, which shows up as unhandled SMMU page
> faults and spontaneous reboots.
> https://gitlab.freedesktop.org/drm/msm/-/work_items/100
> 
> A series to reserve the 0-600MB IOVA range via "iommu-addresses" was
> already posted here:
> https://lore.kernel.org/all/20260807-iris_iova_600mb_fix-v1-0-3996f67e33f9@oss.qualcomm.com
> 
> Those changes involve DT binding and DT node changes, and discussion is
> still ongoing on how to handle those for stable and for the upcoming
> sub-node design, with no conclusion reached yet. Thereby a critical reset
> issue is still open.
> 
> This is an alternate solution to fix the unhandled SMMU page fault
> by restricting the IOVA range in the video driver, which also makes it
> easier and faster to land on mainline and stable kernels. At the same
> time the patch only reserves in the IOVA space without allocating
> any physical memory.
> 
> Currently sub-nodes are not yet present, and only a single device is
> available, so the restriction is applied to both non-pixel and pixel
> stream IDs. This makes the solution unoptimal while fixing the issue
> considering all scenarios.
> Once sub-nodes for non-pixel, pixel, and secure streams become available,
> the restriction can be made stream specific.
> 
> Fixes: d7378f84e94e ("media: iris: introduce iris core state management with shared queues")
> Cc: stable@vger.kernel.org
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_core.h  |  6 +++
>  drivers/media/platform/qcom/iris/iris_probe.c | 69 ++++++++++++++++++++++++++-
>  2 files changed, 74 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
