Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB3B577E23
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 17:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790097267; cv=none; b=GI4akHj8ohKUHSmKh3AfZw9RxlgRUWncZ4TboCNnaLLnvnlH4fvnIfR+N0hwf0MrdbSFKd1JjiQcJxzQrk/WQSCH41wHCLNBRL8a/ZnfEV8h9N3LdugQjCTtuyp1ezZokB1gPyKg0ALPQunPb7H+aWrEqev4u9MPiVfneL8nAAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790097267; c=relaxed/simple;
	bh=YoKdxzXqcxs8aDLJDgxMewiJDR0phHL0RqzGzKoDtbA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ve6SYq4xYjFMPxD9NQn5+6IWXKHH7uypXxoMOSQBmVNCx7J38CeK/sg8Y3XWWmFC0f+yP1ocS3Xd890myBEFQS0Vdq8oBuRBwwTh9BXn0s1vfyhbaBvyOUaoIk4xEWkXDDqWiFL5bods3StAFMiTG3tPFDwn3tFK+zOIDhu5c/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SH+LZHyY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LTzBuDrQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SH+LZHyY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LTzBuDrQ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MEjHIY573087
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 17:14:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YoKdxzXqcxs8aDLJDgxMewiJDR0phHL0RqzGzKoDtbA=; b=SH+LZHyYwm2EFfev
	dC5BCRUX03669BE8eC0oX2/hVQM7GGQdKVUNUdu4Itf5aHF9qQvWOX7MmQOwrZGg
	kWcnsZWveGgyMRCrEn2H8nN6mhJLWFQPRtULJLFNTYv1cSWibtySAPnLuuDosrK2
	WuJsH+sc9vYBtwbhj9SZDjxSCF4nMV1MYxKEGmRGckPPpNkjIjpzDsALZHYkyV4A
	Wi0miG0scxa/iKB0GevgxH2N8lUg9+pVqEZ1MI+zPx9gUdwdAbwL2ZWWDOoCZ8u8
	/779x+jpuN2xDyu7BTMFi1aVqBky7lF6RSzfZ/PAHroxEQ2nZzWlv/2Sj++WFsJf
	6Sha7g==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gujkjbbav-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 17:14:25 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-98066bba118so25783241.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 10:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790097264; x=1790702064; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YoKdxzXqcxs8aDLJDgxMewiJDR0phHL0RqzGzKoDtbA=;
        b=LTzBuDrQM9/ievMqIR8scbOGzJHFlb+lxwB7lHQLh1ZWJPsvfFvSu5SL88NTZ6o8HA
         udd2wQkDXS5iFthPodSoo2T2xDzIEiHfM872GT6SgosVXXkcs/Ll9j/KnakDZ2Ro1Y1A
         Dg+/LzZmP9P5kjpijj4bdFyj3YXWjYaDJaIL5FWOMsHGam26/iMJuAK0iBTiATIy5OB2
         w6WZCLlEKIVaxRF/5puLsi/EchcJNmFh9YSLzUYW343/HrdWFiD7usLBf1m4poVJ9w9H
         8qKrYKHnjVyOya+IdLllNsy9iQ5LmXvo5KQ6867Tqwg/N4aVc+642gWu+hRwXwbrnGm4
         EC3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790097264; x=1790702064;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YoKdxzXqcxs8aDLJDgxMewiJDR0phHL0RqzGzKoDtbA=;
        b=J9dRffBeCia+1r+PMQcnxYUKnbfEvQjJ1KHEeqwaXR63Otx+pr8fB6J3fGCPMno7f3
         Wf6WUsd1fFYy4y08Wu9h+CrzN7X5vuA2+aCH0lFNxFeSlEMJvrsHBJMgmTVs3gbD4jzO
         576rpVDzC1kqNqdIZcIw/+3MzNjm0xwayOXswZj9kbL6lTZzHKUulH3mYFzYLWRt6Ib+
         hZ2LLkjFbQJY2K1LY4jTNzCMVsgtz61s1LpuUyG8V9NyQl8zOaDOBJUHZuC3h0lYCxS/
         MlBMbqLAZcRFzst/skOqHiokisxI+ygH6twh0SsNBIJT4pSFumQfbrbqAAi8awhUYbGC
         j4+A==
X-Gm-Message-State: AFuF++lq3j25zuHOo9VjE3OSueBFvDl2Ja1/kfQC9pabqmJayt/9gZJF
	fiOpJ8cTD5zD1s5mK60WggqjRiifqiErd52aTqSUSJOX62E2pwN97dNevU0LeyeI8FmUPRXQ3/d
	Sd80/dGEMtZpSfvlFAe2CTyDf4lu3azcG+IAyRGpafrt3ktu6dLB1A1JT+DAeTcY2qqGU
X-Gm-Gg: AYBFou0jPt3uEaWm0rqC2iGyLtMqyzCYuZqUyhAA5kadUI0gvNFiszMM6MyAB0tHRjR
	yzaqZgb4ToFNrKZBpVNof63mhJ/hHtQm2O8tQzeXlZlQd6Hl3PKQ/kBs/yUeqZjeFA47efuqjfa
	VmthIN7CnyGJE5/4K7OKSar9+wfNbdZCYaEGZ5nLR4WJjuL44q9vkr1l+dIDLpmA0spSqngekSt
	O9XnZJQ0QVbFOsgoDb0o1OsZcFhxZGkz/rjLfiL47s7ZGSwU/MzhzhZjbmAJvlFIE5uDL0XgcLI
	IgvtVA3zLhsU1fa7ApAu7viniwBikCTDKI//KSCOdmYvWgh+eNSWS1ygLPs8SlKnJBhSsZ4SXld
	cgMP4yzqA2fFsC5RHQhDCtUgCp8X8RxkjrVBY1sk=
X-Received: by 2002:a05:6102:f85:b0:7a7:19aa:f0d1 with SMTP id ada2fe7eead31-7a719aaf773mr6957670137.30.1790097264207;
        Tue, 22 Sep 2026 10:14:24 -0700 (PDT)
X-Received: by 2002:a05:6102:f85:b0:7a7:19aa:f0d1 with SMTP id ada2fe7eead31-7a719aaf773mr6957615137.30.1790097263755;
        Tue, 22 Sep 2026 10:14:23 -0700 (PDT)
Received: from [10.243.142.186] ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fdaaf0074sm59131665e9.3.2026.09.22.10.14.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 10:14:23 -0700 (PDT)
Message-ID: <a16d507e-17f7-4074-8817-4b8da3a71c3b@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 18:14:21 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] net: qrtr: Assign unique node id for MHI endpoints
To: manivannan.sadhasivam@oss.qualcomm.com,
        Manivannan Sadhasivam <mani@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        Bjorn Andersson <andersson@kernel.org>,
        Chris Lew <christopher.lew@oss.qualcomm.com>,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
        Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>,
        Juha-Matti Tilli <juha-matti.tilli@iki.fi>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>
References: <20260921-qrtr-multi-ep-v2-0-27dd80d841a0@oss.qualcomm.com>
 <20260921-qrtr-multi-ep-v2-2-27dd80d841a0@oss.qualcomm.com>
Content-Language: en-US
From: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
In-Reply-To: <20260921-qrtr-multi-ep-v2-2-27dd80d841a0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: g7YdbeID_x6TbVS1U_2jld6dCzw_EdY8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI1MiBTYWx0ZWRfXyCI8HXeAG2Hc
 vgnnJYpBcwjKCkmFgmKe4LIiktyjoxW1N3g3o74+u4+AmYWtbvGNRrGAi0jjSd0lZdN8lz1fyUQ
 TapeVa1FSsmX0G27AUo6gibWv9slr52CcZDMvD1E2oYshfA9gW89y4JOICqYNkdI3uVqt5JOxz2
 Vmd4uUxmmOg03bWSFa4orsRGEmRyH0coX75C3vjWUy1TJ31tMbhuRMK6TV8zqTlijOBsd8+I52u
 cq3VW4E0mxUPHDQqOQaIotNCyDKwqkg3wp1GDrujcDtueHgiGYWU5MvN7+CmtwT6Mn6BZje37i9
 BEN/ZzaivNOMSAPvieBrui1Gqm3rxbYQEY6Uolx8jVOE36B8FYHJ6CyNrCkB5PVYAudJBhs8MBG
 xRST1y/h5HS8mAznpvBpZDsqG49rnhnnVEb/FVsO1tVax0ZTbppawRFLOxHB0TW9EaSyjpMeJEp
 aHjGkSCboWNNgWM6LUQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI1MiBTYWx0ZWRfX7cNmVTeLCAP/
 pd4P4jSN1zKZmYfHia2TMvR9MErtBvTcZHedkrHYk+kEmXYHtC4ZUMEDRGEuqJWYJZ78HNWp25o
 Aww6PTz59I2L8e2HFFhPIAf5jJK3T2M=
X-Authority-Analysis: v=2.4 cv=SuAFe/O0 c=1 sm=1 tr=0 ts=6ab2b771 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=ar2LfINMGabpzH7QhtgA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-ORIG-GUID: g7YdbeID_x6TbVS1U_2jld6dCzw_EdY8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220252



On 9/21/2026 12:23 PM, Manivannan Sadhasivam via B4 Relay wrote:
> +
> +/* The offset is chosen carefully to not collide with the node ids allocated by
> + * the remote nodes. All the remote nodes use node ids in range 0 to 0xffff.
This assumption does not hold up for QRTR V1 headers where the node ids are 32bit.
QAIC devices use BHI_SERIALNUM as the node ID, and it is definitely larger than
0xFFFF.> + */
> +#define QRTR_NODE_HOST_BASE 0x10000u
>
Thanks,
Youssef
