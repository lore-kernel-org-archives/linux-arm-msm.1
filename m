Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A34643C3C0E
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 06:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787639352; cv=none; b=Hw1853YxgBaOCtk9xbUTVUTgxt/axO5bXUCEeFnSr4kGey/Wj2XDKS1w2cK1oe7lE3jKFI1doQ3uVawWjJ+M1BZoV9una5SxsauwdgGaDSayZylMxL5uv2MVN/WgKLfN8cPf1HbPYv9nFAWiva90gJ/nKsQtqZcNYqRoadOQpqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787639352; c=relaxed/simple;
	bh=s3p+Q6oHRQC+Hjo5NDAypAWawX5aYOtoUawOdvdDQE4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TTWu8JQITef2YilZC/onbCEzUc0Mu0nL1EHSoliDEskvV3n2yWmRyiGuJYNoWYUq4lAuwNltznGIgNoSZZ5gMs2iCR2+d766cAgLe/MXsbh5fkmrnoUtN/iITIJ4qkzzMH60hATuAKjH08LJtj84fiMtXZ1dAIQx+zqnxkpiLvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VOtgFOw8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FFCJyhS9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VOtgFOw8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FFCJyhS9"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P2RDrX500010
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 06:29:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OiCk6OBZunfUknJgfXfdLbIqA4ktnCpbCIH2IimRzuI=; b=VOtgFOw8cN7/xgnp
	nFRdMkMYbG7j0UhPzQjxiBiflvNNVr9eZpS49DxnEvVxcTIFvFnzZILODybqdSzh
	+0+KTVHEWJW7UQmSM9qjLUbgYZj4DaqBoRIxuc1YbLm8l2Tbstofqq5wyJZkUJZN
	3LnrvDAqSoy6aLX9e3rNjpdCKXJzlyNKQOk0xMW/QnnOv66c5VPdyqRe8oVH0Wuu
	o9AEhRenWT/6T3XJiaZ2BZihZDpAMGXlp/Jzhc886oyBqKqqrLZoZ7MuIxlJNZfS
	Dcj07NrYJ3Q/a2RIbjgVJ30vdLFc/oOFZCyfzHPduTPI/JzWB2JL55C/pOLxTmnp
	aD9lNg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8t1s2dsy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 06:29:09 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cf1c86963bso4960355ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 23:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787639348; x=1788244148; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OiCk6OBZunfUknJgfXfdLbIqA4ktnCpbCIH2IimRzuI=;
        b=FFCJyhS9oXq4FSGVa/Jd9UXHp0FFmW7Ex3+3IaWHIK/yhgsPphzd2W/b7lJG/yHMu/
         hLBOQMK/G0QhKsaZmiJ74tI9CbGFgSDpOjMb1r6pWa04GvEEIFG6Ox8Dgb/aWeTUjevg
         ruyD7U/Nx6YEeQgnQFEDc9Q1DwJ7wEPC690dn63GQjDMBf+0axhhL3JY4DHlOWGdIyUQ
         u7xMBnNIxrJLxhZwE2khrG2BEwmeTqJWgG5EgAqABkZmvTD00LAdcl2JSUqQuUqY93ho
         x4TxI35GfvmFmdLKig3BuNBFoTM5BO35Ap8tjtbA4T078LPsBAtw3Ykw1zLIDyOrRvSk
         UOMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787639348; x=1788244148;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OiCk6OBZunfUknJgfXfdLbIqA4ktnCpbCIH2IimRzuI=;
        b=jPx/6Gu9BY1Fdz8oI2EJRZ3O2u/DDcQJv96rVK0DxoSvCgk5FsjLRT2GMvaDWcR+Kb
         8mNhgHS0jZvl8XA8YtbNkgDdoEwmfbkUIbQ0EL0PeE1C36J+PfZeTrMGP0L8TKH9Hs5K
         oDAeKjmvaDK1BL2CMPkbmPLVoP8/h1WQoNJo9fIDfL8G+QiQ4BFbw2AaDfSUT+jehaqk
         ffanly/Gq8F+LBHE77XkCnN6X7ISgYDW3qPK05BaViCryvkp3Uy3WM7SAYL4ZqfV3n8W
         JM8wmrd2AjMCFdogrkrvKcgQSEfnoEGBlRTDgMGrUkck7nSxr7obiHMoq+IvvdgkHY+e
         3T2g==
X-Gm-Message-State: AFuF++nNHYyZUgWNuUPlJ5m+YaygdaPxSD0X+k9AJtKMpiG3JHLFTp8b
	8o+zr9AMNqQdb0s4+26HxarhfAofR22yEYyrlGM6zJfqCG6muQBIX/J3pbKD4sXLk3IWdIJpxGB
	UU5iWwo/3VBRZyDUXBycLlOEkHr7jHA+6EjR1n6nKa9fPWkSOe5hcN0ZNups4u7awBddu
X-Gm-Gg: AR+sD10wVUcrDU6//Gs/giDhP+2eFxNl56gLwvm3PH7P7j/8YeBWhYbHy+x3oYjvt5Z
	j0RRPZ9siEnWF3wvIgdnxgcjbDSx8w+OMxaPSsnKL/iiATP+IPumVS9MSNFnDNClrATzKfMyM+I
	7gDUFetDDGQh9ZFb8EC5o80C8Ath/4dFbotjCwc2uTTYCFQvDTW7mrbhpL5DAT8wtMGshc051zq
	WZr77aVt+d2czG2Dfxgi1cN1Cx7wngSyPryG4hlubSX87wBysGFhGBOyoIBhra7RhKa+bsIGmdB
	NJoKc5419vfuPyZBkXFu9cqtuW5MkyTHag5QC7k8V0V9JekPWeLEKRkOwaWwnubl6t8mw/zFBRJ
	Ru8r2SfZ+ExowfopSbvtQpYmNBUNi+Dwxlwbe93+CuNxxV5FSlemZLnxS+mK9OirbbZ5QtfqR
X-Received: by 2002:a17:902:cf01:b0:2cf:7db9:e13e with SMTP id d9443c01a7336-2d6dc9b28dcmr52884585ad.3.1787639348392;
        Mon, 24 Aug 2026 23:29:08 -0700 (PDT)
X-Received: by 2002:a17:902:cf01:b0:2cf:7db9:e13e with SMTP id d9443c01a7336-2d6dc9b28dcmr52883995ad.3.1787639347971;
        Mon, 24 Aug 2026 23:29:07 -0700 (PDT)
Received: from [10.133.33.108] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d6768b9e3dsm24218565ad.65.2026.08.24.23.29.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 23:29:07 -0700 (PDT)
Message-ID: <f344a913-cc95-4fef-880b-f1fee200c108@oss.qualcomm.com>
Date: Tue, 25 Aug 2026 14:28:58 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: display: msm: Allow two MDSS power
 domains
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Yuanjie Yang
 <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260720-msm_gdsc2-v1-0-4687866d6cb0@oss.qualcomm.com>
 <20260720-msm_gdsc2-v1-1-4687866d6cb0@oss.qualcomm.com>
 <b36691d3-e996-4fc0-8955-25beeeecc385@oss.qualcomm.com>
 <ccab8aae-d980-423a-b39e-3ce2a7c82542@oss.qualcomm.com>
 <5341e732-0deb-4d00-9a7c-595e317bf1e8@oss.qualcomm.com>
 <db2a18aa-f5fb-4ee8-8747-05fcf740749f@oss.qualcomm.com>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <db2a18aa-f5fb-4ee8-8747-05fcf740749f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: lOzxgaa1J-GxRTODG9OZHTgdfemrgDGJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDA1MyBTYWx0ZWRfXxJ5H8pLkTPUZ
 eOcxYB8rB7KH/gcfY4g3cpOobglSFb1zahwA4F78thxYuRbUSZBZ1hqkZtpO2GdVq5y9aVIQW+T
 Yg8CHqsRryY3SVj1M7TRVY1ZAa2yEnBW0NPRMCYfaWkDeDR/dGXX2CYZ5h49taxQh3Y9Y9pRVxf
 VAuljCgtUzvVI6vS8Qqd2K08zQ4Z30FJngkPEojRf7BNKkQuBHd2iermbQThxXewfsZGSIZzLf8
 39UOA7wyJG3SbWWFLWWchq7kvu3IWq8ctjopQClOVAt+Qbk2qBYDfGZaf5IxxhCGLYZ2faeocg0
 57yPdcKD9eqUn3RTHwANKa2L7zW89NOyU+AnTJXD/+5PqJyZxWULV+Wp5RLgHCHcWA7dZRz+o9R
 wPYUa96PZIh4/0iVdgEzQvBN/HL4Y8UpYF7wDOcr1RLtNQJQ2xonPcJCyUw/TpUkPb3O1uUvIvg
 7CM7V6P+0YdqmOWhhTA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDA1MyBTYWx0ZWRfX/FdMG2vTdAUi
 L6MUl1TbGS3awfNwLz6FNRWh8sXRECVqOXbX9vW9kNnfAqK4BKxsB6Kq6ULXMTmV+wH1BeZddal
 UregpOyxLFbHVCz8g06TuyxRdy7BEcY=
X-Authority-Analysis: v=2.4 cv=L7ItheT8 c=1 sm=1 tr=0 ts=6a8d3635 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=hXMCaxYEdCLwTpMgVTgA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: lOzxgaa1J-GxRTODG9OZHTgdfemrgDGJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_01,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 impostorscore=0 spamscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250053



On 8/17/2026 10:14 PM, Konrad Dybcio wrote:
> On 8/17/26 4:13 PM, Konrad Dybcio wrote:
>> On 8/13/26 9:44 AM, Yongxing Mou wrote:
>>>
>>>
>>> On 7/20/2026 4:49 PM, Konrad Dybcio wrote:
>>>> On 7/20/26 10:43 AM, Yongxing Mou wrote:
>>>>> Kaanapali (SM8750) and Glymur use two display power domains.
>>>>> CORE_GDSC powers the main display hardware while INT2_GDSC
>>>>> powers a subset of SSPP blocks.
>>>>
>>>> Can they operate independently? Does INT2_GDSC need to be
>>>> powered on after CORE_GDSC?
>>>>
>>> On Kaanapali, my understanding is that CORE_GDSC and INT2_GDSC should generally track the same state, except that INT2_GDSC may be powered down when SSPP1 (VIG2/VIG3/DMA5) is unused.
>>
>> Is the MDSS any useful if *only* INT2_GDSC is enabled? Can the INT2_GDSC
>> be enabled itself if CORE_GDSC is off?
> 
> (I didn't quite know how to parse the list of states you provided in your
> reply so I asked again)
> 
> Konrad
Hi, Konard. Would you recommend adding the parent clock in the clock 
driver, or handling 2 GDSC in the display driver? I'm preparing the next 
revision and would appreciate your feedback.
