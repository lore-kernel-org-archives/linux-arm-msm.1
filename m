Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64AD63B3BEC
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 08:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790152724; cv=none; b=IebYnRWzlzLvOydO8AIssfZrAn5YbvSeWGbhd4a9d+5F+X8mQoQrERHIqqrNUgtwauGWafJyLOVp3LGbEo/u2QlDasJXYcMOmnPGwBAcpsoStjJOtumNtiuGCXLMhk+W35vpSBWoBsXP1xsE8ihynnwI4SR5ouKmLkSvcoSXtb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790152724; c=relaxed/simple;
	bh=yyO1TjjuZ73WiNg4/ZkbI22ApDsMSWGk15dUuD4XbsM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o7AB5p9CyxzR7GI9AL1g9Y/wCdgo3ckzsz5n2VpxGN1Ctu7OWqgnZWlnz40ioUJzom1xOE2gJa/Kh9wwIpEx3JYvGCzI9TZ9uKJrD8/xiYtUI383lflhSI/sUqOijeipMqHD6NRsRgHD5VzJvskgFoCZpPNxYp9AqTLdyzeXgp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gtxTY3Lg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zhn2gsns; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gtxTY3Lg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zhn2gsns"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N8Jbbp3178027
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 08:38:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cDb0sGso1ETTrzZaYUFiyqOj
	3EvRajpbPDzXFX1BXvU=; b=gtxTY3Lgmo0J0t3fEs82mwgejpRgmqwLUASBH8J4
	Ki5McU9Wa1putLIOnCfeR2umYGTLZ6dtjd1ldPWAKWKVn0+w/voJ4XwJk9Nk10sf
	W9KLmbiD0eHslzVSQMR3TXdKVYrNK/iPV72ioqmV9QIMX3dFcY7fUPWfIogvp95O
	tFEn/ctHVnLWvtBvr/G0nS28K6k4pyyo280LToKcJaaM2dqRv6X8Wt30Wd9A/h53
	oBufjpMbb6PvGqZVBOyfmUhbDS8DKbmYehYdOogamQvaZ+8nS5ZNkAlFHv6jhukm
	O1op1TidfRMkeIimSZA9w9fkPzmjcp4o89brDadfG0SZ2A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux863dsj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 08:38:06 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-939f248907fso70161985a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 01:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790152685; x=1790757485; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cDb0sGso1ETTrzZaYUFiyqOj3EvRajpbPDzXFX1BXvU=;
        b=Zhn2gsnsHhS6Nzv8y+/c+rW3oWJCtPmHGsG1mtV3+NptTYpprjv2hshm/SfvNImBGJ
         d0EwYgTxKifE0H9DtIrN3yP5751Y8dBuII1gU0e5t/p6yR7RwM/K9KjYk4EXcqTxLm1i
         9NcjIFiHXY454YqxV0nSlunE7Tg2O1Suc+vZLodVqM3blUUIkEJkXCsOwA4jhegtBNnN
         O7M30ltE9K9UIKucvWnJbXpM4kYqGnFTOFM4YKwpy4smpoEFV0OFVb5MxzT2fHKXKp9k
         haiaDJQQ5jxZkGQiQVCDfCm2Pmdn8JqBNFc8VzIgSWy5FaxvQRV8pfEOaYvkzcKSMzv4
         rlig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790152685; x=1790757485;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cDb0sGso1ETTrzZaYUFiyqOj3EvRajpbPDzXFX1BXvU=;
        b=13JX6xaxdeIzNExhIL5gT/KFElgeytsf8EEXyoAOaWNfcKIIs4o9UBeRomxm8RZSiV
         M7rPIhnRfkx6YHYwtRPaXRY8gz5ahRwGe60pY+VSmDSjXKGbMfnOZssVq0p2IMBsNHfv
         Z1jkQmHG3X7+zsYm8WTp7jTc07UGsLsTAmoorun/fn2qLXNL6cD2Xu51lwU4FSvPJC38
         FSZvNpDItDY9AWLLbwFb8Jjg/rA0VHtQg4V8VO4KTxbT+v529G0l3JjoLykdyOJWXlpD
         RPOKSZA4hFbdxAS+4FvKy4buDE0+0Bj80MDw5pYS+IfE1TCb3HNmZlo5sQXkJ+ZLCd4J
         Wf6w==
X-Forwarded-Encrypted: i=1; AKwUvBxFg0iGeq0sledN3iAvNnEJJahS86l2iD+MTOUPFzK70/WQEu2RT6I1yMkpqPZa1K2fIrEtgcaa6twrHdhN@vger.kernel.org
X-Gm-Message-State: AFuF++nttS6ucUHnWGJaH1mJIWzdY7cuN74zqRbBzBoa2RmpyeeA7cDM
	BW2uQiyldHj9lHxj/01wkeezGXRunjuwBxfdljI43Tu1sgP3TqrT/WL5tIX398gLPDPHjxlAujL
	OPiscDk2QicbidCD3nxJ1GxNm+qLxehrmJRXqxUuTd7OnjvQ9CwbHmS0Uw3RJIJTWikIrEGtkqD
	fk
X-Gm-Gg: AYBFou1sRXArFhaG/4bZgEaTjT/DTI30H/pPQhCOvMCpg6yZWDzJhhFQVHwFO7sj+Yj
	8zNR7e4H5DvTQE1uz5fJjMl/wrUTALKOAokCgpaqkgNulS+QfVUGtvanEC4jQ8p74tomSUzTpYl
	Ne+UFfyYoZ1rpA8KyEwD42Ctgq2nqD+K5DeLKlFtem/5hMeXStB+wJYYXZO3CbS28rN1A8IFWSv
	j26hr++F1puXvhVq6v+kaJ3epTuk0zBnd1+H2mcYCVtFvm+Qg/GQ76QKmj78MqAltZEwcj9TIrA
	xZcd+FJEKvFRZJyrRYppidEONOWO4AC8LTiVt7892GJsMjox761lOGNxJmlIkqQI81GBufNEte2
	Xh6hPywftEfuPAHJRQ5xMynWajrwGtVlaQkxggL/mgaKfMXNqD3oa+Cfojic70CXyUDBRz8aOa7
	Xo6yDeRG1qyiTG
X-Received: by 2002:a05:620a:4054:b0:93b:c581:2e16 with SMTP id af79cd13be357-93c250cdf90mr298720485a.30.1790152685337;
        Wed, 23 Sep 2026 01:38:05 -0700 (PDT)
X-Received: by 2002:a05:620a:4054:b0:93b:c581:2e16 with SMTP id af79cd13be357-93c250cdf90mr298718685a.30.1790152684724;
        Wed, 23 Sep 2026 01:38:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8d859652esm418457e87.83.2026.09.23.01.38.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 01:38:03 -0700 (PDT)
Date: Wed, 23 Sep 2026 11:38:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Fan Wu <fanwu01@zju.edu.cn>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Song Li <songl@zju.edu.cn>
Subject: Re: [PATCH] usb: typec: ucsi: yoga-c630: unregister EC notifier
 before UCSI teardown
Message-ID: <z7v6erddxh2ydm63xavvfb3sckvwsaruife4bz3r7cpwmyg65r@j44ta55rkcgg>
References: <20260923074828.489562-1-fanwu01@zju.edu.cn>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923074828.489562-1-fanwu01@zju.edu.cn>
X-Proofpoint-GUID: cDBbykI9Tb6-74EqXj1xFFBZScca0JvF
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAzNCBTYWx0ZWRfX5zkRku+B3cl7
 Z3/RgN3i8x6tb/CJjZeCa3TN3SXbjLNY7Wl+Nbl0UVopWg/YI7RTNM7Esb/6BILMn4uhDkkj141
 64Q2lFYloZENuHNNzv4vVub4vFuxQAA=
X-Proofpoint-ORIG-GUID: cDBbykI9Tb6-74EqXj1xFFBZScca0JvF
X-Authority-Analysis: v=2.4 cv=eIOGH3p1 c=1 sm=1 tr=0 ts=6ab38fef cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=pIWJAyJa_h66JnIjfXsA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAzNCBTYWx0ZWRfX+PNREhHkfZWs
 nYnMfNW1bH+cG3R4QFvQZnNlSKC19LW7xhqm/QmCr0l+JFbwV4XpyG3JYuXEKBarYYQUJzXZvU6
 wisOv701bqMIPiXz2ubl6CivvXiOd4rZGJR4FsBF7UJbJGRsk1JRkzM1NrecwJNb/BJoMfei3uz
 6etiPb8UK/xkd8byQx2toxR7If1zYhNuEyURfHKZfzMBOvB6axrVxjeoNjWR6qF1/ratUq7NxhD
 DhrHYV5X1MIKwdX6F8FOUMzJQP1nex5x6pEdIZ8c6VQfYT3x5dIvCSDCf97RJAP7TmEgixl7War
 i8JRq/A8iRA8lFD42qn55ZU1t0i7ylYssDLeSNNSQSg6AaLfLs+GPZSv3rWr97vDKaQVFT5X4dC
 MsYW9N4eLLlUYFleaOfpUxgbR77yYAWY/9qnKGmE3APma/gfE5aGqPbv21JqGy7Z/YypsQhDK3H
 LBhjZ7G2aCdStj7T7Xg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230034

On Wed, Sep 23, 2026 at 07:48:28AM +0000, Fan Wu wrote:
> Both yoga_c630_ucsi_remove() and the probe error path call
> ucsi_unregister() while the EC notifier is still registered.
> ucsi_unregister() frees the connector array, so an EC event (USB, HPD or
> UCSI) arriving before yoga_c630_ec_unregister_notify() makes
> yoga_c630_ucsi_notify() run on freed memory: typec_set_orientation() on the
> freed port and ucsi_connector_change() queuing work in the freed connector
> array. USB and HPD events do not depend on the UCSI notification-enable
> state, so the disable command ucsi_unregister() sends to the EC does not
> close this window.
> 
> Fix this by unregistering the EC notifier before ucsi_unregister() in both
> paths, restoring the teardown ordering from before the error and remove
> paths were reworked. blocking_notifier_chain_unregister() waits for a
> running callback, so once it returns the EC interrupt thread can no longer
> reach the UCSI instance and ucsi_unregister() can tear the connectors down
> undisturbed.
> 
> The callback is also the only external source that requeues the connector
> work, so the cancel_work_sync() calls in ucsi_unregister() can no longer
> race with a new connector-change event.
> 
> This issue was found by an in-house static analysis tool.
> 
> Fixes: 168c3896f32e ("usb: typec: ucsi: yoga-c630: fix error and remove paths")
> Cc: stable@vger.kernel.org
> Co-developed-by: Song Li <songl@zju.edu.cn>
> Signed-off-by: Song Li <songl@zju.edu.cn>
> Signed-off-by: Fan Wu <fanwu01@zju.edu.cn>
> ---
>  drivers/usb/typec/ucsi/ucsi_yoga_c630.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
