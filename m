Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792572044;
	b=igLNe5ekbQFNKie6o+vYj1c8jeSG5nhwrnVpFZ2qjPXUczG3/qTk1N+XWAyIlLbaAF6D
	 CgqZbVY2UphTXkp1FC/OGeMVRkdMiMOqGmkyXzPlhhzqMWqZuDvLgI1e9Zo3yI92aH2Bk
	 oftiSB+k47jlEit7RkA7OFkpeewBo+Z3RSPgNprz9vD0Ul98YHifTY/0HCIhV7WQsfJOZ
	 uRQo2hznPpwiANwyPsYE7s8LsJXDcHBU+djR2XyxmLAcvVXAw44lF+emZNXQdRC90+zz8
	 s/45NW9bRgQ3S3KHkJe0TO6e1nZ9CCFXTtPAozzW49fhfZbQB0PgGkbMQIzehHUa5aQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792572044;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Nfw0PUvK6imNS0xXM3MSxUotzC6eCCqH+vuYtGmu7X4=;
	b=Ug503e7PHbSZGcXmjni7GZkQimZvnqRBUcGyYQVrCv1yL8UZsOiGwDcfhUjaJ6XBkKqf
	 62PNBaD3s7hDVVGUpVMdGY9qPirDNQ2/Jdwq821AVbHPChgYfjt86L4qnDDnr0Fbrs4UB
	 5DZ1Buv4kUCEFKCy0MIbhXSFHojQj2Us9sB9zk2banQVOHGWoZqJBwPII7ERjVSxvSm5y
	 BwnrSEagQO1Qmx/HzGzHq3GH0V0IdCG558MLd+jjneVG/TJyiX6kXvHdghieCl71co4S5
	 CvkkOhjN8+Es4/RMf0FI/gWDycDrcpUo4e232ltONB6oKY0RunqCCwSS6YkAZBZvcEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Z/Fjub/m";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ww53EGqe;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77CA8606A32C
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 08:40:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77CA8606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z/Fjub/m;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ww53EGqe
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5j94i3711583
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 08:40:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Nfw0PUvK6imNS0xXM3MSxUot
	zC6eCCqH+vuYtGmu7X4=; b=Z/Fjub/mbGKMnxjJc4Gt1M/Pzy6QnFCS47e7sML/
	6xHjYNHpVDW+eZRMU9QFaTkI7SJ1y58xzx0nGOtJtPIXGGTXRLIYfmUo6tEsp8m3
	7Z7QV4ErCtI4Qs268zbiRPqJKuEJwIJ5Vea52NQbS2yiikCKuWeyvP0q9i0lQ9qb
	CgMaB5aMHS4h7CAXCq+w7WLGwqWJfG83J0vcye6Qtp7rqArQGJUuolXIQMKZ9OXU
	q0WvcaBy5v0fVtNXa+hrhInHeHRXb8VEhz6mUvdd1jZQU2fZmxlKcl/0zQFgqqaF
	4zGCMHRYTiOB2r3J2rjwOjl14l/fykY6uSU0M/fyx1Rliw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hed9v30w1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 08:40:42 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f32050e72so166765285a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 01:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792572042; x=1793176842; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Nfw0PUvK6imNS0xXM3MSxUotzC6eCCqH+vuYtGmu7X4=;
        b=Ww53EGqeTH+CcS7tZHZmjPzWG6oCQflZL75FcS1YhxAHX09J0uSAFs3ztZ/bMG3DAp
         A1g5T+kZ2zqzaxL8Y+3y5Vm9Jj/aKjFZqry4poZoQdYlSltBUQNT9ghx1S2JeIgOmOGd
         W9uOZvgilc16e0r8yZ7h2mVnkHkQpw2Gneo4EHFt9UhWsRftmm0EZW6vj4gf91bdu0Ro
         GU5Byuv+03adbuHhh0tauwkg5m/UYgpyNmb4CpPrYNEHW4SxNuALkHjgbCOaSaSaQ/vC
         JAHNjTamq8piITm7U4SMJlHuIq31KNmbj1koPr+7gC88s0IaWnlX7jeYyYZCryLH3gbP
         V3IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792572042; x=1793176842;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nfw0PUvK6imNS0xXM3MSxUotzC6eCCqH+vuYtGmu7X4=;
        b=B6IS7knneilJWu/slIKka0o2rfqN1+TnYUlwjp+WG6SIO65+e5Oc+4oY7pdY4xOQh+
         +3GS69S9FhgLhSl41LTrW7hDKFE9QUtq/jsDSVkFDGhHM4R9dA6YEYAsqB+ifJhZqoHZ
         BRGrKprEkuXCaNBvOq4ps4PfXlx8q6N1y5PIfBiuuJOgXoyPBQEfNWA7c2wrGDJEBOX3
         jQrNbhaJISxghTFj8LJXeWXh6Mx7Oqgb1B9ZVs8l4Ql5gqsDZO5/FzwTJIyE71bvdeKr
         6HwTRALMW9xCBDneIN90Cl7bE3w4/oWFrRzhaa+jOvi1yLpg+xI8sjyMgVVaRE/KEM5U
         oIeA==
X-Forwarded-Encrypted: i=1; AKwUvBxsvofqrN93gYsIS4giOND1o8Ek0euUUoExZ3VY/JnMv5bA6WGTHuo/9XI52J9fM/Z1pa3zGEtGvQXdnDBs@vger.kernel.org
X-Gm-Message-State: AFq9FYIwjzjsEeJ/TiUuF+vvcej8Zg9qPLQNrMFP52/3uGoMTFtzychB
	pSdiLXNsov+iCxy4HBeSQnmc6KGbUgKT1WYukUUNlCPeFzLB/+fGarN1tVadtwR5Arvd6Hta6Rv
	WYe7Wq89K2DnSe0B1m5tHD74Z0vA+/izh4x/5335cySZ5M8rrw38glrGjg3S3L2NRGZdI
X-Gm-Gg: AYBFou22RaA4vkoXkR9pHVATVmYYANrsAwrWhpHn2Lgm/RVAVx19UU45CldubLLAOqb
	lbJO6HddUvEsaSzoQJipju3aEM5WsWYxu2nzikrTzBjlArzNuDPMwOBpUH2wK8tqkqaMowLQHcp
	rspkq3Vt0+JXVawmYtx1b0huco25pBh8PPvINWkCR8ldsqvVIA+sJCYQ7TkKhqwiAfkfI0A5Gn3
	mun4Mwi+B0jaFOQs2/GmiiFTw1MR6M6mGxw2u3p+yPPPb42dM7xL0sJenTVEkXtoLEUzidQaeJe
	wx71Jd/E0w4o5g794cEg8zAXbqCRrshjvtW6JMjS3vzvkLUqDJGUOJ6gLgzsj302tOTSG9gLAe7
	R1S7UxIcIGWcvlGNN
X-Received: by 2002:a05:620a:4505:b0:93e:c12c:fbc4 with SMTP id af79cd13be357-93f57f9f3c7mr279116185a.81.1792572041628;
        Wed, 21 Oct 2026 01:40:41 -0700 (PDT)
X-Received: by 2002:a05:620a:4505:b0:93e:c12c:fbc4 with SMTP id af79cd13be357-93f57f9f3c7mr279112885a.81.1792572041068;
        Wed, 21 Oct 2026 01:40:41 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f8016c93sm96917225e9.5.2026.10.21.01.40.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 01:40:40 -0700 (PDT)
Date: Wed, 21 Oct 2026 11:40:39 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Sushmit Singh Rathore <sushmit718@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Vinod Koul <vkoul@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] clk: qcom: camcc-sm8450: Park the camera RCGs
 when they are disabled
Message-ID: <qvoigeiju2ka265iqjazauwcjv7zkl7d3in4cfo5im7a2gp3ss@heo6u5sphmew>
References: <20261020142157.1749-1-sushmit718@gmail.com>
 <20261020142157.1749-4-sushmit718@gmail.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261020142157.1749-4-sushmit718@gmail.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzNCBTYWx0ZWRfX9XinTT8kkyoj
 JdCT8ponuq/xqujrabu9JQ6SrJbntSkgHd05OYmgUE7Z5p/9wfRgfuiPoo6yv46NcTiaoPyn87I
 a613nluobZEjwjrt0WhIq+tk+wdQC40=
X-Proofpoint-ORIG-GUID: zYxOl1WaoHGqjMkw1vPWrRMbKZyDB7x7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzNCBTYWx0ZWRfX/aQbWDQO71mD
 FzqDmTJvf51A3ZaPukVq7jvr7i/ElwbZPQYlVhEvPiFvUGmKi2YnlbazL6/CPp72y20ZnmE5S5q
 NK1p61SGdX+bHOkyPjhr8A12chtTP5xwbiJYXbC3QyDI6yqQDYMxFlPJdJnN2fE9T1ZjEYrwdj/
 C6YjDA94EgHwpq9Uvc4Chq0cr47uLORX7M+DUqxFuAWVeo3cz+3TJUgG7iBIH5YmIzkNZULmYVu
 7oz1Pk+bdqNpDlL8IcRH1u4kYF+YaLPVVnRdobBw7VwUyx9mJfW6BukOUlkxEesJ1oBtFvFfSvv
 j7bMGcYRq2ui/GXZJhxgo8Z2npAkp/UMAGIv0l3I9JtfhPzILTTRmRH43+MmwEIJO4hbb536HcB
 tdncqbDUbu19yv306nTTgVC2GVRAm38p/+xCHU5gS19MRvKya4eZCN3zf1BM7VYA8gWo/1iJ6sq
 /Ldhd9BDwIk/hJfBUDA==
X-Authority-Analysis: v=2.4 cv=I6zw19gg c=1 sm=1 tr=0 ts=6ad87a8a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=xW1KjDN5FDO35nT6SY0A:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: zYxOl1WaoHGqjMkw1vPWrRMbKZyDB7x7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210034

On 26-10-20 14:21:31, Sushmit Singh Rathore wrote:
> The camera RCGs use clk_rcg2_ops, so a disabled RCG stays configured
> on whichever PLL it last ran from. When that PLL is turned off and the
> Titan top GDSC then collapses after a camera session, the SoC hangs.
> 
> Switch them to clk_rcg2_shared_ops so they park on the XO while
> disabled, as camcc-sm8550 does. cam_cc_sleep_clk_src runs from the
> always-on sleep clock and is left alone.
> 
> Tested on the Nothing Phone (2) (SM8475).
> 
> Fixes: 6082037fe62e ("clk: qcom: add camera clock controller driver for SM8450 SoC")
> Assisted-by: LLM
> Signed-off-by: Sushmit Singh Rathore <sushmit718@gmail.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
