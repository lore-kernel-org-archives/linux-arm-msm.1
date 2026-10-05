Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC1F8834
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Oct 2026 03:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791171783; cv=none; b=o0zPUU5sYJ19Ai31bJUwi4Jf2JT3Yt31pdFDG21BgFhovU+fzCcamlFVx38vjvDZa8ccwv3v/rGUPXFAQOHeW+Ai71S5wwMT1TteKW2e/QWcc4DezjGrwTZXmnmoHLCFbg1KpqlaqZb9PMham+rm0bBhICgMeSNiBcvLogUab7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791171783; c=relaxed/simple;
	bh=UIiMS9AGBk6RdbvKnKfoPOhncbXZvPvzDhfOO/rc4aw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fUNX2ScscfEi0Bj3QOdOECaKGaZjkRn6WtJuJfFDFzKySgh1gp/VjGD+aVFFxq+1Vl0SHsyC9bITpR7iRkElZ3jbqO0/5UKRLHwyrpw3/HVVgOk94i8z9Gkun5mmm/uBp6bPSuOtYICS1+/OlALZ3cHwrCnXuv0Hq5jSP7m+B9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OlVcNXEE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KHDKm3os; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OlVcNXEE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KHDKm3os"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695102P0495956
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 Oct 2026 03:43:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EbPg2aQdB3WJiIm4v4Ostya5
	4S6FCqAcPPGhfO25FV4=; b=OlVcNXEEDPZC2iM3iL/LN1OWZVcT2ngczKHLkmPp
	CoxkL7w8EmQZMS92I0lg5SE8VBbnX9j9g5/OB0VkHGZC2qaGtdcNqYPOOP2YmguW
	LwN+ReFfCutdNl2LzNHtsPudZDOyDFNxKmqL+Lt9QN7dSd62sk/W9cCS0Ihj3wRS
	Lpa7W5hcuyzOWSI4I5bO5DEBMamjNPt4UNV3bvtmfsjK2ZmDqL8P0LGhHftk3TKl
	r+Vc8a7sSdN3+F4dF2l8nancbYyCvzVZov8Bil6HyJOocqNKY8b9iMdh1J51DvoK
	ymqNTsGppFQruLihreDpQRMPOejwRRdkdl3EIeJrZAht+Q==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h3xgyrk9r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 Oct 2026 03:43:01 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9806756ea40so1399231241.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 Oct 2026 20:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791171780; x=1791776580; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EbPg2aQdB3WJiIm4v4Ostya54S6FCqAcPPGhfO25FV4=;
        b=KHDKm3osxZd/Vj1CHlneFHA5O7A6zFn2qlKuJN/EIEZNb6XQ6XnjdDAq0IMvUZZSBd
         eDrmO8S5EMN0sEg+6vRBxeN9PN49ePJIZQfPm7nyc6fIzDQ0oSEoCALKl4m7S1VMUlpR
         n4AxHqAleiXKM6E7V0zwKbbuXheamGBhawv3zMY1LUTuBPMfQk5PQumyXPm5dU87LN4B
         79Qp1haQBX0XC2XygctKrXAeDkClDtjkcNAcbIf/rTGymtZQldopdugocPeFIpb/EQdO
         FSf9WpYaJ+Sz0l0vVrM8l7C+J9jun0us7Sw0l7e50TD2Vf/71okMDOR71GlVm+oyRzSQ
         +ANA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791171780; x=1791776580;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EbPg2aQdB3WJiIm4v4Ostya54S6FCqAcPPGhfO25FV4=;
        b=QO9bCza0OMPKSjVhZubM2BWm1SW8SPR3Ny4sQF0H5+GVTRXqOX1R0xzRZbqXjmFBvY
         eLfGQ2SUwwfGv0Zhxh7XI5BAIXNdx7baZaNMQ6zxVFPUMpRSoT4/pDZ62cbj1S0LwqZH
         HyKi3MnoTquBK4yFxSlSdN+ixGL6/c/jX5mCJG6OF3YA5nLosZE7SQgSY+4gzu9Jjwxb
         mij5icM7aPfAqCe68HQ4Tifw48b0lA+XViS24NrtdLCEKqDKheHKWT5aKiQS5m7zlt7N
         zu9HfXGDg/r8XSSodzFyxVyRoVKrmPPx7Iq+6008apXeOD+MFWugUkAJQ74HqxblbFbj
         jlmQ==
X-Forwarded-Encrypted: i=1; AKwUvByxtT6P6L+VKbzxHZRn8Li0aRlgL3H33/vEGMKoJIpEJe56RZkV2HprQI2MZuwISH2HJyLNGVCZSHlnK+xP@vger.kernel.org
X-Gm-Message-State: AFq9FYLju64VwPNC8mDnYo149vMB+kM+jJobVOLrBPEU1RgcgpuTVIWW
	iaPx1ItRW4NNZx9l2W90FyKFzqXRYB1Sw4Y/efacTUzJHC7t3jQjTPIy18fj8rWuibd1kNV0bEV
	DgeQhTdT5H9SnqYci3gDXsFgQMWHYldxV9/lO9QDS2mFZE54L6qmJxcWoBNOiWd2orxU0
X-Gm-Gg: AYBFou24xLVHIdK9H8xCyOSd59PogdV1hc1sbWFGxrzCzJCdDB1bR8tMEDf1iVOeGDM
	c4ew8YbF29cFQnmhV7TEnptYGSjE5TvD+w42o3fVEHhpbxqtMvq2aEMrnQReUQu0QmCYGWuwrsW
	0QJrT2XIEGkxvxUj+o4KPWFD6GKWknDTUMl0BU8Kr4Nx1uHhTTuRsXgc2/puIVBmUm5bgQjWHLU
	HAIvI5VreayGLS0uYO3uW4PZZ0BMuKSt/UZU4G0aY1NmjrPGD/M5tQ6XsuMFocvOtH1PpcPcs10
	8HKZm1KBGIaFcATGPAkKM1TmHltQhwvsOk1YzIza2cLbh3k7cflo7c+vlHX9jEjfcTi3I/h7f56
	EBdiqDTbEmH63IW2jsaowFYkuIGjOi0fxaBEb3tdXnrWfO4HdkTOAnDej689FxJBXsZpvw2HUdS
	LYlOlXE5FXgVU9
X-Received: by 2002:a05:6102:32cd:b0:7a3:4e75:d1f0 with SMTP id ada2fe7eead31-7c2457ce32amr1571276137.23.1791171780323;
        Sun, 04 Oct 2026 20:43:00 -0700 (PDT)
X-Received: by 2002:a05:6102:32cd:b0:7a3:4e75:d1f0 with SMTP id ada2fe7eead31-7c2457ce32amr1571268137.23.1791171779894;
        Sun, 04 Oct 2026 20:42:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a87e3235d5sm36801331fa.34.2026.10.04.20.42.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 20:42:58 -0700 (PDT)
Date: Mon, 5 Oct 2026 06:42:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Piyush Raj Chouhan <pc1598@mainlining.org>
Cc: srini@kernel.org, gregkh@linuxfoundation.org, robin@snyders.xyz,
        ekansh.gupta@oss.qualcomm.com, andersson@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 1/1] misc: fastrpc: Allocate message buffer from
 remote heap for sensors PD
Message-ID: <rz6rhmd46qcuaxrajxxaqudkoqj6ere5gdlb7frnvd6hjwapuq@kj3ldploadu6>
References: <20261003150559.6926-1-pc1598@mainlining.org>
 <20261003150559.6926-2-pc1598@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261003150559.6926-2-pc1598@mainlining.org>
X-Proofpoint-GUID: dPhPauIBrbmEQCPgi9O5UlL6mgKnZuDt
X-Proofpoint-ORIG-GUID: dPhPauIBrbmEQCPgi9O5UlL6mgKnZuDt
X-Authority-Analysis: v=2.4 cv=A6b5rKWG c=1 sm=1 tr=0 ts=6ac31cc5 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=OsHF4jKAAAAA:8
 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8 a=4qQ1mRuE16t6AV9Sk90A:9 a=CjuIK1q_8ugA:10
 a=o1xkdb1NAhiiM49bd1HK:22 a=aAwnOj5LE8VeXseigifb:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAxNCBTYWx0ZWRfXwuZwZBEUGVel
 6ZYfowrP1mV/Q8Gvi+Ks4iqh1vXn9H/6Ify2myb+nXTod7Svr51wqt0U6XTL+RST5Uav+P+tyAp
 NOu+0D8ViFYC8SVR2tWBE9/e7nRBZ2CjgD2UdBUhqA4AZzMiWZoNW2W4mH3y8XKZPZ5rRpapy2T
 IKjqZIrBmUdwGEEtJ2cqYyozzm0PkvvczU40Ixo3jQsl8qk+fWdajTGFJdD26dTL3pilZGSeN43
 cxO7qa2W7ASJUBta77/XRGSrsQXlQFpUIfCZgKNDDwesXhjXEs4EufpBasXhZK8+vDjAP4zoM0C
 dLV2vYPtjL/pXXG+jF/wSHqyQQtiExVPZUkVUyUxJq2ReAIZy6T8tncq4XTfQoX3fzNxwS9QcM0
 0Vf9pLc+nQ05Is0vqJofUUaPQLsNqn3Ta+NQmX81BTnlx9r3pDYNhVEm1ALU5qXuzbnwQZjdNuW
 GAUc2+bF+rjcLjAt2gA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAxNCBTYWx0ZWRfXyLNKQgXyfYuc
 xF1os3L/radjF3DQ1PZgvH0yjNtUmbwB6b+1pnjyr5nKC+GvFRJ5Fim5lhgGhoNU3bbAbAaZni8
 9D/OZNnV1GRcg2mrgZ8WDJxrBxD8oQY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050014

On Sat, Oct 03, 2026 at 08:35:59PM +0530, Piyush Raj Chouhan wrote:
> From: Robin Snyders <robin@snyders.xyz>
> 
> The sensors protection domain reaches the message buffer directly rather
> than through its context bank, so it requires an allocation from the
> reserved remote heap memory pool. Using a context-bank buffer allocation
> leaves the DSP addressing memory that is not mapped in its address space,
> triggering an SMMU context fault (e.g. 0x1fffff000) or bus stall.
> 
> Ensure the remote heap is used for SENSORS_PD invocations even when
> a stream ID (sid) is present.
> 
> Signed-off-by: Robin Snyders <robin@snyders.xyz>
> Signed-off-by: Piyush Raj Chouhan <pc1598@mainlining.org>
> ---
>  drivers/misc/fastrpc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
