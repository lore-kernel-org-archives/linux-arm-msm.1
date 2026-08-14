Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E23D335C193
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 20:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786737684; cv=none; b=DQlvrIP7KrhnG8cnU3tcG5DM+Yy32evqOEPWkO0EaZtiOYfEv1I/g4BShQ+tie/qGO/ZojlcwfObrQU+BnP+k1KYSxY9SmvEyzmXxxH2++NRLwnRNqFzQik882bc8TICW1/tpJs55wphEZX7q0HLoaeBJOzeMm+cVTqthP8C6ZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786737684; c=relaxed/simple;
	bh=j83kp8s8Xf0Q1RvAfbW99lErJRF1O7DrHLpv1i0/olc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P2lntkKFlZB8ilIIUMTriHNxfmLy/EcouOLHt/YHiSRXY6/l7n/dNS5266NbtNURMRemusi88GvLkrYozqDwuPUAFwsYV9cFATxQ5x5Tb0i5XbbDyRZmVv9BvCcDNj+FIy4bBx7RXiUkFibCVboiOWGZQE1ktBKoSzmfRcwO9Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mDtbUOMp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WVFO/M2G; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mDtbUOMp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WVFO/M2G"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67EJh1Xn2678117
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 20:01:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N/HNCXReZAADEJUWfRzTrqJYptVDzlytOwMcdNySHiQ=; b=mDtbUOMpqWwlT5cz
	KMqdvaFb+kNYPsa4MiY0bpDueDmvuDbfF8XS2FLW5zyJXRt5LRfO15ve9+DEU3C4
	9MLB708jQYGYV3e0UVVb08ua9qsZg4ZF6wIq1uMj9Y5HonMINR2dzksZiGaLXcjR
	3pxZ7voqekWGfimOCXRTXfsb0IxOZ5jscvVdcTV/YLhG2uSYEoouvdvP9CgokFTG
	mUTlN9bura1Ga2qRvDYiZFdIxm5v23CuJY7ejQUxCTY8m4TmuxYor4CiROaBBWcv
	ADAPyxxoNH6Tc1iPFaJepEz+9J92GqXZYUzpT/clbSq/Hom33vyJ4S9QqEB1pcG4
	Urr7pg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g20gnagew-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 20:01:21 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e8e864ef0so2205662a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 13:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786737681; x=1787342481; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N/HNCXReZAADEJUWfRzTrqJYptVDzlytOwMcdNySHiQ=;
        b=WVFO/M2GumZLEVhmFzLxG6dNd+o/weOapIQp+dGmgJmtkI4ikJoFLoNVJCs6S5K+yo
         mDJO3D6BQkQ3AniUVnLRlw2gTUmxdar4eIk72bl511AkB/IxQtO9lWcigUTY48yh306m
         S1kbBLbp4LpwREEBlzzC674QAly83+Ycsr5kYUa8OpF4mIG5ydxVsfnsJRMyy+IQtYjH
         BCYLVEF2v3maU+IzpxGgISuBhWDe1QK/q1QkJYh67K8gQyVF8zyk2PmDPe+PkAejO7Ef
         fIaXOuUxMBWd70fowlVH7CsnqhMd+8aEH8gt81ysV6YnSJNvQUwgVa9NQ/qkVBeBX5Q2
         +V1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786737681; x=1787342481;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N/HNCXReZAADEJUWfRzTrqJYptVDzlytOwMcdNySHiQ=;
        b=OHbgCVxCyZjwOHYu9q+JLmnXCG7eHG24rKJb0cUYSYVsTZCfcXnBJhRdMV40OlJWyq
         NQThOjByC9BpOzje+A51F3TlOALrshEcy5IoppVszjx3cyL9G/nX/LfaFAHI0par5d/G
         R5vow0ey4rcIvrZYsv40pfL2uQE6jjCGRzol81m/6lLTPSdH1ckC2WvRNSeFv6EX9Wzo
         0KZTh1HF3iKCjBcv+I+/aTuWVCrQyBVzQBoLydDeV1Kkuf3LcASoUXe/GkKJzvccLE74
         WT/QMUury9QmDlSZqD+334wuZVHLtJ5qL8wMcBZ17s5ECKl7B5mmXw+0onsdJltNefbq
         uSIw==
X-Forwarded-Encrypted: i=1; AHgh+RrreLU7HCivqYlhpk4mCrCQXPtqGNEZbOr2eKYH5N5ZygO8augMjkkZDYKtv0bwQ9kyxMxpk/WTbA1ij3YA@vger.kernel.org
X-Gm-Message-State: AOJu0YxVBP0Xt5F6xuZTA5HK6jNLP2B7FynGBumB6YRxzXBQNCPIhyAT
	4S0SD2WoKjjETz3Ebcs2PZQFhj5fLlMhXl3hqxH/YtrsswIhCgtc5v52ysR3YeGsuyyMaW0JD6W
	wLwrRoGgsVpV+8WDGK3vKdchO+ky1xUinCL1385w4budcp+s9rhuY4EoojLYvbOHcb8Lc
X-Gm-Gg: AR+sD10u0vdaPdyEJF/QzrM+sLc1HX1tvH7mDAOlfWsnIslAVb7FV4GaDB5koCMM3B8
	sgdrg+Llmbehn7zNuOkIX36xvl1Irzn4Jh30IFNgYYPvRRHas9qbgBwjmJqb7oUK2Pz860B6i5G
	hMat31ICcw9/Kygjqsz4nlZJdYzW9sq+4UUo+G8Ym8LjoHEN+2aESzdCPMHZ+1k1GpAgST6Qs1D
	gb2Vc82o1kZQ2GV7HZ4PvlDVGu2o8KFqwEqQ2zJoeyp/k+QbnpcAZrkNBt9QBrc6Z4vmA+Zxqlo
	vhrlzBAg2OL/JFUkRuJWyEMNWs0BnNgQ3UEx1p3yBIHU7G/PrPSPZIZnX7h2qb6N3jHcHivPqXW
	xbg4qvCmP8SqID1ExgBPwDWYoTF1Sd4ImO++0KP+GHHwJUhvVqVewbg==
X-Received: by 2002:a17:90b:5388:b0:38d:fda6:4873 with SMTP id 98e67ed59e1d1-3933b8fc728mr9601318a91.10.1786737680589;
        Fri, 14 Aug 2026 13:01:20 -0700 (PDT)
X-Received: by 2002:a17:90b:5388:b0:38d:fda6:4873 with SMTP id 98e67ed59e1d1-3933b8fc728mr9601261a91.10.1786737680062;
        Fri, 14 Aug 2026 13:01:20 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320d5bdc5c4sm7756763eec.5.2026.08.14.13.01.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2026 13:01:19 -0700 (PDT)
Message-ID: <c5b93907-6149-481a-afd1-4ee1d8440f5e@oss.qualcomm.com>
Date: Fri, 14 Aug 2026 14:01:17 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Add support for AI200 virtual functions
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
        carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
        zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Troy Hanson <thanson@qti.qualcomm.com>
References: <20260814164125.3652876-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20260814164125.3652876-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDE1MyBTYWx0ZWRfXzhKo76QUsIVK
 zBPS3q7ts+tUd5e1UbgtpfKQYR3Zbmm9VdDM+b1Ybub0t9GerShA4WCSmeeNMf0BsFp9w7n7KyI
 WkG+xQgZ9kgIHs1YdFnQd/FUDJl1J6K/oXdgx+EouKEjgd50V28DJawDtmXUrbWlA1knl3ES44+
 b2H1KjlXb6EvCDEZI8R50VFp3iHQhpWmbNegEo18WTtJf4Iq3pEvjoiDR6nXM2A6YCglq+NFLlJ
 j2iksBHRTOCmqcg2/nDgc6cFrzcOcug9zFm4W0qAW5QZWX+mggBI4lArwLnsBvd5c6F531t9qQJ
 jpxxvRgnx6r5b2+WPEoraCLNbdmkJszYbEHrylHUiZYxSPHETgLUBXz4Hct/d/1goHQqm18A/7v
 81/f6uA/m48pL0rNuDt33/Tf8YNSvUaQBryvdLHurccEbLVw8LxzKn9xGf+DArhQpHkAxmVQ7pC
 ySGgwAGfr3PdoBO5WjA==
X-Authority-Analysis: v=2.4 cv=DdMnbPtW c=1 sm=1 tr=0 ts=6a7f7411 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=3CdRq_fta2TT3tACHWIA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDE1MyBTYWx0ZWRfXx3QYGuxH/DMP
 LNbscHgFTp3DPZktoo2l8HppoTenFxy43Fy/YxXrIYDpoqCSgQ2dCpwliyNdq0CVYEd3uXFu/uX
 Rr5+S2860VW4HkE+hhBAG1IBRixZgFE=
X-Proofpoint-GUID: VJHcMKmxPdI-RYbKPPCHQm6K-xOq7mAk
X-Proofpoint-ORIG-GUID: VJHcMKmxPdI-RYbKPPCHQm6K-xOq7mAk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_07,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140153

On 8/14/2026 10:41 AM, Youssef Samir wrote:
> Register the qaic_pci_sriov_configure callback to allow VFs to be
> created through AIC200's sysfs numvfs entry. Additionally, define
> a new MHI family for the 5 channels supported by AIC200 VFs: NNC,
> Telemetry, IPCR, Loopback, and SSR.
> 
> Co-developed-by: Troy Hanson <thanson@qti.qualcomm.com>
> Signed-off-by: Troy Hanson <thanson@qti.qualcomm.com>
> Signed-off-by: Zack McKevitt <zmckevit@qti.qualcomm.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>

I think you accidentally reset the author.  Looks like it should be 
Zack, but this is formatted as if Youssef is the listed author.

Looks like Sashiko has some valid feedback.  Please have a look.

-Jeff
