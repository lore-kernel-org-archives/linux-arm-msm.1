Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A11133A5422
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 07:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789025574; cv=none; b=M46GASw4KBPNbwu1lAUjrT7dcF6PZZiIpnyEWd/O/2aS0i2zGqkBRy4XykA7BdNWmnhg8c+kK/K/fXw241HYn1/2OjplgBPiaAsh/3C3xr7X29Ckfx5DJQKAkH2v1UhW4QzKS47AtsZjVNpiTIyHLfPkS8/G4QqJNIvEJz/EmCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789025574; c=relaxed/simple;
	bh=EIZwHMOV70u5kU21l9SyY+RZx0yD1wH92QfFQM+jLd8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c9Z33mxdrdMAtYghKcIcwhkl90CxdkfbVbvm8p8FP6XCjv9VYMXrfLp7bIJzMIQQudCBoNgcOnRmZRAXQof/3WMuBJY2nKp1xLYKRDTrFntiK7OksQ/1jaIbApqyPdgptmJKEtu4y0GLuI1DoHMLpE+TXUHXEAKI0DBSERQvrNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X4RxeKsT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eerSxhZz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X4RxeKsT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eerSxhZz"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A5Gqkm3655330
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 07:32:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=p1biPjXoqkcIS9AjryIVISjx
	YjXFGn5GSiR/aDLhs2c=; b=X4RxeKsTtvdvWjwnPseUOUknA4eUzGeTrQN24zGB
	d9V6DmD/bvTLsUV7IDlENkG1mgmmN1FIFNIyelmU9lHGsZOsOjvdu/ZCKOz+VXgX
	ZGCKpOv4srTOEB/ohJ0fIsTT4GJkj6VeQTGB5brhKXyVOHE/MyY2jX+oJU2KGqS7
	xdf5SyUyKn2UW7p/PKT0nANuwnLknD+spwa/st+XG/m11ANdcQAcLlknNtOyv6U7
	etc7rm4CrtSri+ylO+dbFg4sQup8LJPIccN7+Qly9sWX5hNMa0njoDkjjfRe5rMO
	Lo++hAhQz5c/S9jrFT6lDDCAbbS1lvd6Q8EVDwpU449eVw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcydtn7d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 07:32:51 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9382f9430deso1161260885a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 00:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789025571; x=1789630371; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p1biPjXoqkcIS9AjryIVISjxYjXFGn5GSiR/aDLhs2c=;
        b=eerSxhZzgYVoxKnSSu6cNpkh5TEV6wldEIwx1MKN2Zc77HMxzN2np5625eeJDQ4Pre
         p9uNHRwBSIxg4YMuOyNipvQAswL7vH5uSYEVXLpNYxMQcjB8sHCpQxmuPzzIJR9AVFNB
         +6bDl+QiwzVxOQQY588D4opBMfSzRHUHpcDC85kYDyDBqC3y20hLuPPKnBuPJNFZ7zpF
         e5UsSmhilueEwrIbYUmkmnz5HRsXErnWULLxhzdWgZekfLzhtRYfBfXbS5e7kHp2y6EN
         h/xrLba5TD1bQaF7DhdQlDPNzinEB2a1/ENQY5+r0ctl4HSmxKITYy9mQIxsysUlKfpk
         WErA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789025571; x=1789630371;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p1biPjXoqkcIS9AjryIVISjxYjXFGn5GSiR/aDLhs2c=;
        b=SNukGHV6yV+5Yi0p68PbMhhFy+we70HKTiRN9AjbEh6Dy/i1OWbN4h5OV84OiGP74l
         grj1teUP1U0pmIKV4hxKHXOXUSRp29la93QjGah9+fXvr8K9hVoTpt5FleHR4Q6ZNaRB
         auL0tJ9H3EbuNRM4oOWcyYKtIdpKSTL3j8vO77fLg1FBVCqBHJiPCBxnQ0iOLphR2NK5
         /hGrVr1SE9pXOELPFMFr7enF65SgRPTjDmqfzRJXMiEue9OEci0QctSTy9k1UV5w/BOH
         Be65RpDtO0cgkMww9vLW3nFiQ8BeRxuT9XlRDTPG7A3WkvlC14p88A7mxt7QidRWen6P
         5kVg==
X-Forwarded-Encrypted: i=1; AKwUvBzrIs3l1WHnl0xxdqFOvtZjlxUHc57+ivLAv53WCRaMxpmqfP6RvYemk2ILfqEvyk3Xb3+NhOFG5lDqkHgk@vger.kernel.org
X-Gm-Message-State: AFuF++mRJOjgy5dM6jmph5mtq7yB4u6YL6lfZXtVozOe9v4uOGt1dAS/
	/9OneNEls8LK9RO9V73U+pilfuAJ0nUFSAJzljoX2xJdlIAF/+NTfzpYRBvFGh8h+x6Tca+q23p
	c5xZQiphR3d5kKe9cWShhGgWX3L12kbRhGeqNjbmalEYjJuPRDOx5p2WxprWZPKjH3NLt
X-Gm-Gg: AYBFou3F51cb0qhrzyYQnD67hnLFO1Dsrnjd51MXyqjwjjj79jvByxjSzIcEskbvnrw
	BU6Rj+gLT+h8yZgzutgy0YDbtbW/pWXIpHxHEDBye1YBiX1DkAwxtPr+EJ2/ESluzWGOZ4fPtv6
	uGX8ZK70toanFwy8PNQStD0UVthW6Z17MwGDAib2uc3ZZT+WnNlLrjx8Cgi+cNwwrZeFuuahD8W
	PeMJ/xOMD30XeCjLmgJIvtG12VAfXWXo/4HuyQ3/FbJYuwyKQIKgacIACIPWbeSqKVhAP7m7Ide
	KLL2Di/OlqD3DFr57cyiAskw0Y6NlTyxqZACf4pkr2vdFSKnQWzgXPP72yT8Kw6WfmNaqQS3jCx
	A0HtmbdsEMPyL
X-Received: by 2002:a05:620a:aa15:b0:92e:603f:1f20 with SMTP id af79cd13be357-939802fa527mr3757207585a.2.1789025570642;
        Thu, 10 Sep 2026 00:32:50 -0700 (PDT)
X-Received: by 2002:a05:620a:aa15:b0:92e:603f:1f20 with SMTP id af79cd13be357-939802fa527mr3757203185a.2.1789025570073;
        Thu, 10 Sep 2026 00:32:50 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.7.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d20fc23fcsm100492075e9.3.2026.09.10.00.32.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 00:32:48 -0700 (PDT)
Date: Thu, 10 Sep 2026 10:32:47 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Georgi Djakov <djakov@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] interconnect: qcom: implement get_bw with rpmh_read
Message-ID: <3sbvyjkqpczwnte2nbu7aop6xzjg7mzakdrwtpdkb7zeuy5mp2@np7plcce2wu4>
References: <20260909-topic-sm8x50-icc-read-rpmh-v3-1-2bc65d7b25e5@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909-topic-sm8x50-icc-read-rpmh-v3-1-2bc65d7b25e5@linaro.org>
X-Authority-Analysis: v=2.4 cv=IfsSymqa c=1 sm=1 tr=0 ts=6aa25d23 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=dePp4Gl7O00gmbwhyVsZwA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=7y3l6_YF2eMltEOdZhUA:9
 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: zXFwi4bj9RsXdY-gtyJo-zDney6M_La5
X-Proofpoint-ORIG-GUID: zXFwi4bj9RsXdY-gtyJo-zDney6M_La5
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDA4MCBTYWx0ZWRfXyUMR4lvKZc1Q
 r0pSHq1SwN3fOkZJ5xMbCMY3GzPkat97x9CrvGw7PrbI32uNYoOXgs9BTXKSbYnSEuB/8maj0a8
 pa9WWaP9pt89cAVRqGbwvoap9Rq+3PM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDA4MCBTYWx0ZWRfX2743j0mKRiY6
 vVwSkv9MzvYv9vNUHZOAwxwladqMLVeyI1ExHSPUn74QqZCb86VDm2ib/6Y/RXF9Da4fhDqrOHl
 X2tCfP75TbWG/lsFBZvE10VsefBHHibmh2kiQsGRMKaJs8lCivCw4Inb86oBaM8HI5mqLPbSy8O
 GeE+B6snzd7NNDN4ro7/JRJkUDDytv9jLl5exvOdZsoJ8eVYcNvXlZBrWyJnBKMFYhqVpZ/8tkY
 4EAGdo1MVGtaxyPxjhzBqvXqr4JQRJe/jM7UUXy1Yuarkcc6craVpsOWivkzwerj3Y5V9Bky7nx
 ceJdq51anfZ7kOkO0GNFfqMAut3u3T7KWrj195NJHgHtgj4fzt/kZ5nWW6V8iVBstoAv66Ikkvw
 Nth/Po0PGu0gnqLSsdDZiYNHZHBRIG13PGaUsIgeJmpQoEnMbX4RRU2mCEE4jYjkpt0+gYAAJI8
 rB989wAMJrSeCob0C3w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100080

On 26-09-09 17:26:29, Neil Armstrong wrote:
> Since we can actually read back the APPS rpmh interconnect
> BCM votes we can actually implement the get_bw() callback
> and provide a coherent average and peak bandwidth at probe time.
> 
> The benefits of that are:
> - keep disabled BCMs disabled
> - avoid voting unused BCMs to INT_MAX
> 
> If the interconnects are correctly described for a platform,
> all the required BCMs would be voted to the maximum bandwidth
> until sync_state is reached.
> 
> Since we only get the BCM vote, we need to redistribute
> the vote values to the associated nodes. The initial BCM
> votes are read back at probe time in order to be ready when
> the get_bw() is called when a node is added.
> 
> Tested-by: Georgi Djakov <djakov@kernel.org> #db845c
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
