Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1991D357D03
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 05:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787548551; cv=none; b=QpAop4CT7sJnr7RMQaTobw/INRTIhiJFqPbJyjLzXGvwwZNg+uTbEBwzJfj4OVcy3LsHpraGEQ7IgDb118400vIGRYJ4Cq9C8oAWQ8ttq829aUtNqgInSzeRUzT0q7Tv7MMnaNanYflIKDz7JnVEwzZtvfJ3aRkDLHaa1u+PS/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787548551; c=relaxed/simple;
	bh=xX+8439tLZFfTCEJmmZz622pCmOTCjFhMJed5gIjWjA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o/WGP+Z4JEFjBEyXDKbiNNsSn7tuq51JRIGDE1zXcqmWWOMmylTn0Cc535fcTRNs2kZ666b2UvfyIhQNxOYQ1uuy058BRnxPC2IWqyJl38sdyAA8Db5TH8xzJ4BuJkY2Xh3QlU5rNSLKB2D4Uf0lyHAs47kFYqTW8eYjEiJS4kU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wl/CQ/hB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AZQO9AKv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wl/CQ/hB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AZQO9AKv"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O0lCMh1462848
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 05:15:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xX+8439tLZFfTCEJmmZz622pCmOTCjFhMJed5gIjWjA=; b=Wl/CQ/hBP0Fu5lMT
	6lOYYc/hvH/pdwGGzHOMfboWj6m8iXr66weUAyOyXfvPi9PMKda5r2jSAUHkFP+B
	Elnr05wrYa/jdF8Rhg1a9RPCPSMQfq8kpsWuL7RdRh/I+ISfBpOk3K5htaUrPrRd
	xikhRGImY/75uGgf6dqBdERQQiGvbMgnzczwxUvXpUmVXzDGkV2YZBjgUQ/WcI0+
	1FzIlIy/Si7IMhTDtf2U/qR5P4aTsSnbR3m93FAMZWAFh3ayDV4fUsuzLP03MppA
	5v6opmA9kpTdk/nbJBivTDjaCmQeCdV1rPxBZrly9NJauikQAOEZ1WHLVQIYKDHP
	wE7W7g==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8bdr0njg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 05:15:48 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84e375d9736so2508684b3a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 23 Aug 2026 22:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787548548; x=1788153348; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xX+8439tLZFfTCEJmmZz622pCmOTCjFhMJed5gIjWjA=;
        b=AZQO9AKvuHKkIdjYNxhP7fQFEhpOjj2ff0zj+3RwYlFcxCswlIcyya0GC5jg1kpg8Y
         TD9WPy7Cm2WR1zpBh9wBTsHmNj2qxn4hk7Tc7mzOMzMBG4EGJcVLKzolknKZXXxV8tD5
         UHX2RCUaW/VuWQK+U3gnZoVCoZZBd5KrynjJnVUljMYpmA7bFh2GkH6Tawtxcm7LuWL/
         GtV2H7Bmm2Onk12y86DEaPxRarAZipCH1hGkuGvSZCAZcVZ3Gg2aXgDFnQ3+CE9fcW0P
         hOVvhhzGSNEhyOkyzP9aJNzs5GMMb2um5SI3aZbndxmU7myUDItaRKhPiDkAQR6rP7+H
         Nw8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787548548; x=1788153348;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xX+8439tLZFfTCEJmmZz622pCmOTCjFhMJed5gIjWjA=;
        b=g1IuI1o2lkEgl6I3J0cLJqkvN/Fhfwcwz/UliHsJSX54+ATkmN00laD6iaYwDR4tkk
         74+QglNH3yEh7PlfZhvSulr214CHey3JVGRVF3kBpOMSgxVQtUHxH383h8gHGHVlOG1L
         prnfkSBAfT3S0w+fRDo7cke4Bx90yg1TkqWb0dPKWro/XAWaoeGDTS1DPfPRILd0Ad2M
         MiEImjSj/HvYRskqS4/b2p94gPSkIbKIpp5eKVPcM6zGL6J+32QWsp3Zjb5b5NMMoOaC
         3SSt9sR1WkW4llbPqzEVPhS5B5tj1YuuMwlwoz5A4JI9SbP/jWMFqTcQ/jUqvh1WWq1h
         LQzA==
X-Forwarded-Encrypted: i=1; AHgh+RohO8Stlbr2TXmUM1cYGGBQ3fBgFi2ZmwOTRvJ4XVBfXqhT4H843RHjoMsTMxI0zmlN8cNN4P0WXXTrdctW@vger.kernel.org
X-Gm-Message-State: AFuF++kx9kFVxGHHGJJEnuoEsPVYtuEJZ3Jc3vz0iqrzEwLps8G5xZ/p
	UfhG9++P61T+5k4A34rBHWvaFuWI0HiJMPH2TNGUhD98X7JpagrcxFiNNORfhQcS3WQSmgNbyDn
	dPXk95IoQgXD8kBsUwkKR1rDT0+Y52XvD9gRWwN0KJg16SDcf0qVkZkRsO0i1c2gN58YT
X-Gm-Gg: AR+sD13ZgO7Sx9C1UCNQMo3+ZFjoevIqt60c59Z4YRbmEMmvVqXROiwekR45T9ilYnm
	WilpYFdYYkmNqo+HF/rU/v0PFAxLR33K2u+cM4jGgU9EUw93NaBj+Dseio0kXdxX8GRvBBqTNpG
	siob9HFNiYawMecbznm8IkAkcmvRJfcFlYwMJAfpeGiSjTEJwC5IXiPOqsu5d0nRHCtIGo8eBm5
	4XPdqnn3pD80EocPOkOa4WDL9OISMMZmhGG1tsju/+pFb05B+zM9EnLPhx0lg3Nlf0g1kSnF8AK
	2ICMOCc1pZ/Dw70/PQPwNf0fdYHcnU8nD9wrknpsZkqQlxG3tWm95FACTkTaY+qYHApuQZczBRd
	RPYAmeHeuIWrDugsvq9wK+iyx6vCTgYXZ
X-Received: by 2002:a05:6300:278a:20b0:3cd:51ff:1b14 with SMTP id adf61e73a8af0-3cd51ff1dd5mr14316443637.4.1787548547884;
        Sun, 23 Aug 2026 22:15:47 -0700 (PDT)
X-Received: by 2002:a05:6300:278a:20b0:3cd:51ff:1b14 with SMTP id adf61e73a8af0-3cd51ff1dd5mr14316404637.4.1787548547495;
        Sun, 23 Aug 2026 22:15:47 -0700 (PDT)
Received: from [10.206.101.140] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f91d37d9sm23580957eec.14.2026.08.23.22.15.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Aug 2026 22:15:47 -0700 (PDT)
Message-ID: <e917c8e9-0fd6-d61b-a2bc-0d81adbe464a@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 10:45:42 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 1/5] media: iris: Add dma sync calls for input and
 output buffers
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        sashiko-reviews@lists.linux.dev, linux-arm-msm@vger.kernel.org
Cc: conor+dt@kernel.org, media-ci@linuxtv.org, devicetree@vger.kernel.org,
        robh@kernel.org
References: <20260818-iris-fixes-dma-pseq-fint-v2-0-8dc8c4b3880e@oss.qualcomm.com>
 <20260818-iris-fixes-dma-pseq-fint-v2-1-8dc8c4b3880e@oss.qualcomm.com>
 <20260818160351.4E8F51F000E9@smtp.kernel.org>
 <4rk2qpalwmwtzcmmn6leezboybfgp7buuevap7pclcbf2f5mfz@zvadm7y5e7uv>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <4rk2qpalwmwtzcmmn6leezboybfgp7buuevap7pclcbf2f5mfz@zvadm7y5e7uv>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA0NCBTYWx0ZWRfX0YR2LO3ocguF
 fI+sJhjmRC6LCtGIcWklcmJ+VTWoR23zZVV0Pu108+WwOEYepdORTqVji1ztZcy2XljzGTLxwfu
 IF2PyPi1c2g0vthxFnSJHRPBDDlhjwzkKnuuDKMjhuBPNJR2FQP6Ni8XoRUVwge/UGHIzXXNqfV
 HQxji5u1TZ3imauhY+ylcHVkNMDSro43sxzYZdVJZRZ/cKQRkENH1fCSo4Kjh8WJlonYYxkDl8e
 TYXZsJshdOrfLTBC0zhIQV3ZR2VBrwYkYedAXT7sEPMBWbtC53ioMfhxyVLrlzz2ABkFVclN/TU
 mTQfTpJInPjD9y7d2mZ4mTktqd0upj/9X6di49bNhuVqPu5yxBvsTD6/Pp0eYRDlRBL0Dr54RDP
 72XwFeN7323wPWEeWQ1Ft045vaNfzesXLlLXiJw7PsGnmEjFH9JpIokPOIvSrhFIqdNtnc5k8j+
 u0pTVng/IlDZkNW2iNQ==
X-Proofpoint-GUID: -5Bk-oO2WydbrUYdRJbQFIJfzOj5vPXR
X-Proofpoint-ORIG-GUID: -5Bk-oO2WydbrUYdRJbQFIJfzOj5vPXR
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA0NCBTYWx0ZWRfXwgXNGNBkW4QN
 PnbyOFU/4SPypyPjTeZGQ4AwVTSSXm1BLOZ1qR60lFe6M9l/k+e3Zs9Mxh/Q3MosFgc+32jhLcj
 JkAusAtrZ3GggQQUddayaACX3/oEQLc=
X-Authority-Analysis: v=2.4 cv=W8cIkxWk c=1 sm=1 tr=0 ts=6a8bd384 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=vvLq9R5Q7EL3J8ZDTOcA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_01,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240044


On 8/19/2026 4:17 AM, Dmitry Baryshkov wrote:
> On Tue, Aug 18, 2026 at 04:03:50PM +0000, sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
>> - [Critical] Calling `dma_sync_single_*` on an IOVA managed by videobuf2-dma-contig violates the DMA API and can cause severe memory corruption for non-contiguous DMA-BUF imports.
>> - [High] The DMA synchronization logic for output buffers is fundamentally broken: it synchronizes the CPU cache before the hardware writes, uses the wrong API direction, specifies a zero size, and omits the necessary sync upon completion.
>> --
>>
> Please respond to Sashiko comments. Also, this PR is missing
> corresponding change for the venus driver.

I will check sashiko comments and fix in next revision if those are genuine
issues and add this change into venus driver also if applicable.

>
