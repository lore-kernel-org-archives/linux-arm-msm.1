Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7381825C804
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 05:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787029628; cv=none; b=CgzFC3d68tr4GnQe4qdwX0XHBI3NF7HhQVwrXEYF11aZPhOxvt8iEJ+PI2pLvgPw8Yk/PSwETHuy9HkYrCC7g7+Smt8WmE0DdEDKZePvLZFWZWzxC5uBmJIsk0smh6kUWEAm+WE3/zDc8NfI5L3dS6pLEuInOlk7KEPQJIKE7q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787029628; c=relaxed/simple;
	bh=mdu//a0Msa9i1GDiaeUzEd6ZcjMTI+PpLfvTOGgn0J8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H5Oek/UcfG2n+FAMeQrY9DHd/Nh+ASZIPc84LZ/AWCDkLtidKyeIu8E+ZQg9pl4fp8HJAOhk+jaUiW2pe75CM1OY6SFzHgUGoLJ6lyzbc88fH4BKDBwhYHrvBffOnFaPLs4+01zftx2qTTD+P188Uiq4UFXT2oXgnMSokKGNnBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PJ/ovc61; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ln81m2WY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PJ/ovc61";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ln81m2WY"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67I4fS6j3464620
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 05:07:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=N7HGS+js9AQ3WFgzMDszCKky
	Dss9f629sxI3gpvij1g=; b=PJ/ovc61iT8zGIRSevkAb7H2Uu2MtBok7dpcghQn
	w68b6TKfFcXYbLJrbQlL30w5jK5f6Xu5qg8N3Sg/3Tc/Jdx2PU5BQk1aOX5olvUW
	d1j5dYKS1uBLDQl/kin/hL/YtMvQOGE3a26caBamwqk6iNPWMCA9Fbg4iufmopXd
	xt6jPLB32XWutsHmXBPN/5cFPM5kxA7kRyVQI7HyVMI5grTJcVHAL7eDf8D6d1R4
	AwIzv6Qoa222HCZXvZlFLz+6YDFe40gmwDEQYoawzYn8Sd4UgIQ48GiyJPEkFgsT
	aZhShp8PxkGcGdzDzOT9HuuPCK1LDrf3AnBDe+DvAlovbw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4611as53-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 05:07:05 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e52306621so407285285a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 22:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787029625; x=1787634425; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N7HGS+js9AQ3WFgzMDszCKkyDss9f629sxI3gpvij1g=;
        b=Ln81m2WYjc1+Atl0tvPkA1vI/2BHNTuhtJoikfxx1aJqBdJV0Zh01ppA2LegUuOlq6
         FNm82PwQAHVSfrj6hQ7Id3tRodzZ3AsY3cZw5JywD3JLjM5YG2T3X3Ozl46SIHbiT1Tn
         h7Z09E/b2zwXMYtW/SVLQ9FFlbNrF9LkPZRA5svHpRyaYU2GtTq1EpamsCsfXEE+td0S
         LEK9xUdmCtNxvzu91v7Dw1QF5tUipy226V3oE/8RsfkWNWlYrUNFyezBoCJXcOaG3cQI
         +7JLOG4BOdjXm4pajz2kteLuWNJ/Mg2T2ttdswc9rO7dhctxMkxmm1C3s/2fPRIxoI58
         rhIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787029625; x=1787634425;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N7HGS+js9AQ3WFgzMDszCKkyDss9f629sxI3gpvij1g=;
        b=LwacUu6Ljbc3Au3ojVzZcm1x2TcGN2xzltRnQzNy24t3JH+PstgHUQytXBcmN9P+Zu
         zZQ0ScaiHiAjgwau4vWI2MQlktrjC0c7dgl3dupFohZmEckcgmFAh9TftO1qzCNvC1A6
         cM4ni9HiglmbXh62BwIGimXRTiFqF85zMHdVmuhztT/TH2QICAzz0UXSqOB8I/t6wSqp
         xv7hou2JOgmKQSB1cK6rKUXdmbHLGq+wj0n+KakjATRRoyiClrwI7XISqTTWcEo72t1+
         lW7PcI6Fbobj5knMapqozHucajlj38GujjsQPc5+5tXyOLg9NPAnHzx9bVzfhbn0iY1I
         Qgfw==
X-Forwarded-Encrypted: i=1; AHgh+Ro4gWcI0ZCcum4ZjUAzcCQCd1O9graflEuXMr+K7s6Z98Gq32K1UDx6Pt4IxQIkFzh8OTQgLiqGeyYHu7zo@vger.kernel.org
X-Gm-Message-State: AOJu0YwwtguXHhSCUVB+ren7loVpe8buszXDlG87KEZRarZRc1ZzVX7z
	v/sU9k3tTpZ7Iz3ayY3Brwi0dxHH6Rr3btvKT0EQcLB9BGPbEBMWla64sYYPGGDWFkgkGXpSMaD
	NXQrfEi4GHrN/NgXQtJm5saNJgVBt/77tAo/ml1ouoTbiYdQPTcdehYvu/mpRlB62MnsH
X-Gm-Gg: AR+sD12w0EFW3LFJYg9BhyWOmPxYkuDEoIW4oIqYNVWnYwuCO351HEs9gsw11NUu7ZN
	JUPu8mAioVlo6zgi3iPthq+N+O+aCqNNCg6p2E0pb64mG3K7/mtoig0PBDnZ0mqUsr8aKAU4Fkr
	VPBdHwaEHyVLdILbm8NFLSxkp+GKl86uTQwy1qZDUSreUU8NA6rsEW0V11Q+7nkuVn5q0R8i9P2
	/4XRXdiPE5LPNxUzy9uuf871unheEDh5TUQVWGvheuB5Yuth7mi7ejglPT9EtIFn1PQOMtrHSBL
	Z+M/pMaPy9Rnk6igt4cGjd5fDcK6fuyM3QaIq8HT9eUNtd9Xz6z3hYRDIOD2YBeyjIdiQekYkaR
	5jsWhQl6O1+05+VxsJFIJi3QI0EiQD1q/0zfUboD7qq0gdnrd6WI8/08ZmJMwXITkk0CXakIYb0
	thpYm6BqGEEnv5
X-Received: by 2002:a05:620a:319b:b0:936:9fd5:4fa0 with SMTP id af79cd13be357-93704bdff4cmr553673385a.45.1787029624688;
        Mon, 17 Aug 2026 22:07:04 -0700 (PDT)
X-Received: by 2002:a05:620a:319b:b0:936:9fd5:4fa0 with SMTP id af79cd13be357-93704bdff4cmr553671685a.45.1787029624245;
        Mon, 17 Aug 2026 22:07:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a16b204389sm9696581fa.42.2026.08.17.22.07.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 22:07:02 -0700 (PDT)
Date: Tue, 18 Aug 2026 08:07:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sailesh Nandanavanam <saileshnandanavanam@gmail.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org,
        quic_akdwived@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH] remoteproc: qcom_q6v5_mss: Fix off-by-one error in
 regulator error cleanup
Message-ID: <54zzrehjmurnpx5nv7f3vmq47y2elsns3cfsjdae2khr6oy6om@by6wtlwb3zd4>
References: <20260710194638.1502-1-saileshnandanavanam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260710194638.1502-1-saileshnandanavanam@gmail.com>
X-Proofpoint-GUID: IB6Bx2J1BsxtnIOLMNXd1wAC7ip_9zEV
X-Proofpoint-ORIG-GUID: IB6Bx2J1BsxtnIOLMNXd1wAC7ip_9zEV
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDAzNiBTYWx0ZWRfX51/V3c2tcb8i
 tmEXVNnadMFakyS0xnTnUv1az6Rh5fDY01aQOt3gVV//6iikoiCYgenroCImpfDQBmeOvvnJZO9
 AI0AhGkQ6013QHxYweWGV06xyNgIi7o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDAzNiBTYWx0ZWRfX/Ls13vZm6IGh
 s9WRkl9m8m61sHXMr3S5DvS6QcC9mFHr/HRZjIUTLkA1VhAlQ/HqvFdedWmozioQQDbp4EGNui9
 HWBZK4oM4ADezfS4jec/OQKt10kndkJXW1VMCqwzEXm7sqF+etHUriQmZ0dccmGD4f+hgVAg4Sk
 2cojbYNHgzyRE8vVJQOz9SatLdeo2nwzHYo3zbYqNmSCrePSZDpcji880dMUp4L2bWofDMeR/6b
 agkvNO2vf3IHrOr3j3MZTB+ujAnz8XCzs6ecXhBlni+gcCCbHr38puvlf0ZGjpBzUxvH2f70Dk+
 uo92SObVbpuWnR/x7QOCxromTStSrONpWBeSB7XhIfXyk03gE0ElMzqo4+8ZsxJXWT+Io5799xq
 UYuMY/rQA/xUlSKGUkoKssgwvglI4AgOMvHvRUjFbhYeUs9IjsLck9boOI+cIHyAakDcGpkKPEE
 6+iKIFTwBxzgRaGxbWQ==
X-Authority-Analysis: v=2.4 cv=UslT8ewB c=1 sm=1 tr=0 ts=6a83e879 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=hI5qLSgjwfH9RGL9AckA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180036

On Sat, Jul 11, 2026 at 01:16:38AM +0530, Sailesh Nandanavanam wrote:
> In q6v5_regulator_enable(), when any operation fails for regulator at
> index 'i', the error cleanup path unconditionally calls
> regulator_disable() starting from index 'i'. However, regulator 'i'
> was never successfully enabled at this point, resulting in an
> unbalanced disable.
> 
> There are three distinct failure points:
> - regulator_set_voltage() failure: voltage was never set, load was
> never set, regulator was never enabled.
> - regulator_set_load() failure: voltage was set, but regulator was
> never enabled.
> - regulator_enable() failure: voltage and load were set, but
> regulator was never enabled.
> 
> Fix this by introducing three separate error labels to handle each
> failure point correctly. For the failing regulator at index 'i',
> only reset the resources that were actually configured, without
> calling regulator_disable(). Then roll back all previously enabled
> regulators using 'i--' in the for loop initializer to skip the
> never-enabled regulator.
> 
> Fixes: 19f902b53b47 ("remoteproc: qcom: Initialize and enable proxy and active regulators.")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sailesh Nandanavanam <saileshnandanavanam@gmail.com>
> ---
>  drivers/remoteproc/qcom_q6v5_mss.c | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
