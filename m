Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3269647F774
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 16:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787156781; cv=none; b=XjT4QxDXVqE3quW4OuEZU75yUO+px6OYmM0I0qaL2iOdD0LJVgLVK5OMnh9MtBE8474m7fuxLItZoIo55Ido4un952h9WXhhFzz9QV6o6/wzV4V3zwgLN6gw4AHHOwy8539d9wf6W4pTf60jAxxyWRyabkd1P7XUjQQg4BblEZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787156781; c=relaxed/simple;
	bh=8NvFExY1IIy30LJ4s4NF697B7+Drznbx4P23YUJc7hw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TbBgNNeI23jNqEU1qAl9DnjR6wIapOL7CtKDE8plJ1RhFRVXHa2skDnxAdmg1nS9rtH5DSagUXLEp5ikMXfa0lIXyRINqbUV3vmwowlN96PCRcaVe/J1smDJcjS3JY5fOLvUjQkiekmpEtoRhz/tXCfsUMJeBN5iIHcjHBIgnhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dRGhJ8mn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XWDJwoey; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dRGhJ8mn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XWDJwoey"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JF1maZ537284
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 16:26:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/9rMhk74a2juhpVbnSIfPdgHjjTg61wDnPfb4sxCZOE=; b=dRGhJ8mnAPheC9gh
	c/qGP74Km8iqTNxi9tSlpKqJuZIS5bPuzCCYUegy/kcgvaLjt9n46sCy7tCL36yj
	L/jYEWPbZ3kNTxiCvFd4xfieWFzbCIvIPdj9pHlgSUPSfY0sKlGf1K++sd2FXGa0
	8JuCvvxp7CEbbNVwu9YoM8VLBdTILJnitr2kEG8banZwoHjj6QfqMa+GhJEtdEx6
	6EhcZR4PzQvmOYjJcj3FeKDJEnhwLIbPXVIcPI+526/AR8FNzkeI2lv6jXdazoG7
	OLz1iq7q7RdtuRn1b3S6cHbHmG2NUscIgtWY3Jsi82vHhK5NHAHx+f75EELUQsCX
	3QG3ow==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5es58ewd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 16:26:19 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-73966c839bfso41790137.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 09:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787156778; x=1787761578; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/9rMhk74a2juhpVbnSIfPdgHjjTg61wDnPfb4sxCZOE=;
        b=XWDJwoeybMZT/Uk2jtfe8a29r/6dgcfE789wdbUW+hcO+iIzl7lJdVVxZGWa2x/G9M
         j3FnfWqjiGe0BkIrWKYqq+Hh/pi2rAy7gadxutI/XbjKM5/4u18k/5Vrvk8gBdQtrSGD
         rpyHs95hVEt+JyoWHPrHJApYFvuXG27qDx8wgUNnPDG2SoGJvXwe8H0tzK5ZQfCpdm7t
         4/p5J1ZoqJdTnfAilQOaNIYc/VKxQmXQqCMHMPIoQgbl2LFd+STZbIzi9icYpsQAnkqZ
         4uHN+c6cuRsoIVfZLzXduA5SH5s26AY5Ooqu4UvlZq7fumK5uszYGZr1g/Rh6mhS1wgI
         tUFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787156778; x=1787761578;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/9rMhk74a2juhpVbnSIfPdgHjjTg61wDnPfb4sxCZOE=;
        b=XzxVY8j3rpJQ+S6ak7LeUcGmhhnfJz/mNVU/bbG2O3E2cMWkj8EzpT91RtGvVTnHKB
         LNF7eUIkiop1UQHMoinYrf6rldPHtO/Y6DDjYgHT4sKAxGEEMpge5saOyZMNNd0WURzj
         TPiOUm7aE9YyFoaYIa+i0BS63d4qYfC4ozCe7ljhr9Loc5ivXtypdsWpPtrQ3wkiMwDv
         ZWwvBgmhCQSIH0xaIRzLxTpXaECOCQAsb7WJCIg4R952qTkDElUeWxoCMvJjWDANypw2
         cGKsYuIRhmcMG4wI5cNijtL6wWn5P4FYd5TyIBT1vA3G+/cMyk1yKWqTpYBiC9xmixw8
         OU9w==
X-Gm-Message-State: AOJu0Yw3tLTJKMRw/qcvv2e4eKiz20l6hnqmCIGsa53Iv9JRwzGMbNE6
	mIk/hWv4S2uC4gl+s31JS9nua8CS7OborukXb/5oFYy0GxwCfez3LgQoJTfC7jKPIeMv2VJ8ds/
	y9tetYaTNm7N/CYJOi9b9s70iMVQURMv0bvJQdGs6k4i2MX17VEGoBnnrEQ03lyuNtl+Z91ReDF
	vk
X-Gm-Gg: AR+sD13E8RyIOPwPgYH51nqJAF8wXgLzdaqWbb5Zo7mLi+yYZi4L/1m/fHgL8lHx/II
	q5+Dw+F5bhJbJyCxc+Imp04gogmVB2aBwQm2ld9RCeFIM76wtBEudNCO32W5kBK6Ts9UoYpvUKP
	9Kbkr9MWkAlHd4mBqYW1VepWQ2sp373mZokTiuOjpPN4yCrWwn+AKoLmJjZijEZkNNJREzaGWhW
	N/xjJh+UbowR+TsHuf5SkxARfYu5wVcoLqvqjFSSFM3qbZyHHdVw8ESLXgeNVH45T59IRAAHu/X
	EYseLfdNQGIophzpGucURCEXkqtmDhDZfkQNUuzrT3W7eBGY+nCrw3+GTxGnaWTfpb5l2g4I3nJ
	rsM93TuPZLk9GxtmcK5Fe79xV
X-Received: by 2002:a05:6102:6ce:b0:72f:6669:286a with SMTP id ada2fe7eead31-777fb1ad702mr864385137.2.1787156778380;
        Wed, 19 Aug 2026 09:26:18 -0700 (PDT)
X-Received: by 2002:a05:6102:6ce:b0:72f:6669:286a with SMTP id ada2fe7eead31-777fb1ad702mr864379137.2.1787156777883;
        Wed, 19 Aug 2026 09:26:17 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3ff177859sm1043913a12.27.2026.08.19.09.26.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 09:26:17 -0700 (PDT)
Message-ID: <05c7ea33-ac20-4418-90be-79f933733ca8@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 18:26:15 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] soc: qcom: llcc: Update the SCT table for IPQ5424
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260819-ipq5424_llcc_updates-v3-1-42b48451481d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260819-ipq5424_llcc_updates-v3-1-42b48451481d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: _BpKK97scywmOmqCWpcbJTUEiv3S2cbn
X-Proofpoint-GUID: _BpKK97scywmOmqCWpcbJTUEiv3S2cbn
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEyNyBTYWx0ZWRfX7CrfxT9K0dEy
 RSbUeLQZ2exnKhvSH35TMXsw75dnWMF6UFNSi+cgPxPCUfllxfUbSQfOqFeNWy3yLMptAt8yZ3w
 VW+m1Y1WGNG/GW1iT6LiUaGnLDeGcV0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEyNyBTYWx0ZWRfX+jXAs79Gc9z5
 AoGA4ouy+Hs1d0b8bew6t8AGfLHL/pNFEuBmq87ZDpdRAQWRMwtBa84gg5giwAAAU3hKoy+Co6b
 X0Oft0HBZMY7RdZjlR/Vy8wP2mIhdA8vim5ZNwPaxKGrIn45nbE5Pbf6JGCO3/tIKyFODnLt8q6
 BWeWmWr8h8/TeqjQtAKdP9X0RQki5vtp2Lo7XaHyWAqXkWCJ/M8m3mDip9eDA+VpW6HHFvUKqBa
 XZ6Rv9t/Mpp2ml1nrxdqo0glC22pwfD4WDP7SYN8nSJV6HEwNEYFbsfSk4aZTupWHfjeDcwQsWz
 A5dgBmH42hLcVhrvk64YdpNEQ8ozLlgEk4juvXk7BQzjRWkqE7ghuV/SvqlCxCDeHHFcjRpehhu
 gXVctPiTI7D62OC/IUthCqnNCYExwJ5ZS9BAKNyA57ceHnf/9fEYnZlwYswKn9msGFBJPY3Yv3x
 QpScSJ8WGqxhkY7BNLg==
X-Authority-Analysis: v=2.4 cv=Oc+oyBTY c=1 sm=1 tr=0 ts=6a85d92b cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=scoem_1CX-FocSWMDOsA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_04,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608190127

On 8/19/26 6:23 PM, Kathiravan Thirumoorthy wrote:
> Update the IPQ5424 LLCC slice configuration table to give the PPE
> and Wi-Fi datapaths dedicated slices.
> 
> Assign slice IDs 1 and 5 to the PPE RX descriptor and RX fill use cases,
> slice IDs 6 and 7 to the Wi-Fi radios connected over PCIe, and slice ID
> 2 to the CPU subsystem. Adjust the corresponding capacities, priorities,
> and way masks for these consumers.
> 
> These slice assignments are based on recommendations from the
> performance team, following throughput measurements on IPQ5424.
> Having the dedicated slice configuration for each of these use cases
> helps to improve the networking throughput by more than 1 Gbps.
> 
> Rename the usecase IDs for slice IDs 1 and 2 because LLCC_CPUSS and
> LLCC_VIDSC0 do not describe the actual users of those slices.
> 
> Assisted-by: LLM
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
