Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D8C3D6472
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 07:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789631802; cv=none; b=Psg4gKW52Jo+Y2xMYu0D79ZdYNwFa83KknAha7wElFBG+3QC9sZD+zgDhboTq0/app/eQahxMhFm5l1jndLwYaK3LtgpmRJdI14yelBd9Fg1VqCapkuYRilEgR2ASWUE3j9jjSs2zVxtxVEop3Vq09yIencuuCC2PJiIXTinpBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789631802; c=relaxed/simple;
	bh=CMYvDPqsLAq6pkjr54jYgkQnfHwz5DtZrlvx4wqgFtg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=obpV2o0itDDeXyH2+XeGG8ZwY7tVlenZTGodc3Xx4pnq59LjbYCz8IcmnxatEnTrlyZ2MBNbamrDr/BcGTZGJmpGmYfiqGysm5wTUNvhtLlMQ+mewrxB/XhQp+TvAt+X79tscWhxNF6/ziItGxXnl9MUAwnPo/5PdjkZioBJOAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cC351Cz3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CFo2oaVn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cC351Cz3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CFo2oaVn"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H61GB8133187
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 07:56:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PfClSxRVkrfkzd/aMC38kqBu
	wsc6wodH7g/O5+B060M=; b=cC351Cz3FKnbAmbwF8Valz1+O3Ke711ETI/IspiF
	EV/gAjRy3MflaR3dA98hBp7VpmynY6LvnCUp9tEJd0zGodlV0vvnWp3e8XUHGsxa
	97Shdep2V9woRBLB4X7V+XmbBmWKycVhHPa0xcPmCLu/Noldyxb6h+UcQNNyYiV7
	tjwIQWMYpinQa4pm9Pv2tpBWdY00VvpJ+C/9NE07va0RxsXNwSRmFll8IJ9oh46T
	Vnyaww+Ga7IcftNRYzbMrYl/8IhDwMGQjqDHxQk9jB2Dxd9LUIwl4CYDEFzbQsF3
	XrIvUqsddweiQ733QzZsTURMhp8600BMoFBRp5zRsqIemg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqtn54ftc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 07:56:39 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a1de6d5c3so124954785a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 00:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789631799; x=1790236599; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PfClSxRVkrfkzd/aMC38kqBuwsc6wodH7g/O5+B060M=;
        b=CFo2oaVn2R7ZdV13BNp5qdHBbTQKX4/60+lu8aKZTEImQ0JIngNuLjQWQVfHZjpt14
         QTsTgAQ9SqfuCwPApEdgQcm8H/hM8l+pzMPQi3igTEcUunWxrtAUs1K77WUfupZWG51M
         CkqrZYfg4okrjzOVkOkUCV2qJA/PeAB8qAWiPE0DNhDNpuQt3WDwSDvt9U/a0zVNOpMc
         lVJUI4z2cUIlr5s6dtxZqyjvw796pXQWyxPZHR+Y2EeRh92xC/UTfzIy08387yJ6qblu
         2+2sWGihoc/5XNCy5oIYM4hw+MU8OA7kP8XSME4X2+aw7KSRJvVJmFTSnsBXJklHmLUx
         Yn1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789631799; x=1790236599;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PfClSxRVkrfkzd/aMC38kqBuwsc6wodH7g/O5+B060M=;
        b=zSSJmJHdFBMEgXH6RueiROF0bjgX9+tEHVz+iAkla6Afh5Ks/UTXsaOYZZeVp8+H9x
         QPkIATFRsE3q9t8MZCVR5yuE/HAeFl96mkCgFy20BzH7Jomj1r5xOxL0PFEIXMMhC7Vb
         B+bAVPdsafJB3OlsfT1M6a42NjUPRUTfcE364DV0MVdHFLWohQBKbxwTzhMeBR1cSf41
         7WfcYmxxEb7LqvnSEhft/eox4jGsxNF9+7E6l7hO6TEjnHenxMRzJlsjQ0HaZHas3khU
         xW6kCLz6aqaMRWMwNDqKhyENWSHVASXMRl5jB5AmcZPxzqVhfXeRWKCr21eDZDJhClrE
         MxOw==
X-Forwarded-Encrypted: i=1; AKwUvBx8G1Iw8L6d7nMOZukOKlYEZH4GIHbF8MGlutXKtmt7t/C4LQtLM34OwE/ZG5pdZ280sn/oGiOPbGSqtFp4@vger.kernel.org
X-Gm-Message-State: AFuF++lwmNtnaxkMZN+ndloZQp4HSIv9Jo2yIUXpffjtBZSEfrRMLpMJ
	uebm5IEOmn4nQJVbtHIPPYorWItmjLSpvZN9P1BOLBcWBQYDvQnZgR/301pWnlUqxMiOXW5xPIK
	inJ+XpJCssRLXU9dTYyjY2N0zmwTXoJybXxmzPp1rE5HfHe3/PPQLSvXNLN9K7+IE8phj
X-Gm-Gg: AYBFou2JdWDYieBN1q1Ojee82UFZuPSECn1VdVMjCJ9kd4JLjjE/8WLgK4NJA36Vkv7
	TrUdRSPb6UKs2nFbUPqBNr6irhhqIqYPPLgj3h74HDFsgwTr+L9HNJwr/yuzGmq+zh95ch0sfro
	JlUqfm6P2QqagHUIPYGvG7sE9rdh/SMZi5ZvNlRcjcEf8v2cViUMDiy6/31qRzd7Ne4rRztJuXU
	t75hCZ2qEsA6V6RfLQkDxrvCPx9LQZCjHuZsLS4SmdB8aNGyIazsyJDCeCLhcyurGBiWSe42zsv
	MMVbvf5Oiea7MMKZpQXb7eoONzWFymCnkb9TujOzF2g6hdX4Dv1nznSHNslYt1GYHtHDAMNzha/
	L1hH5AlYJ1LR8cFEp3vyPLqErR4UEZjhGT8pgTc3lj1sgaf8TcxxUqC7ZHbwQsRLVUkrlK2Fuhb
	ggdsmw58Kx75Te
X-Received: by 2002:a05:620a:600b:b0:93b:c45f:9024 with SMTP id af79cd13be357-93bc45f915fmr557190285a.7.1789631799323;
        Thu, 17 Sep 2026 00:56:39 -0700 (PDT)
X-Received: by 2002:a05:620a:600b:b0:93b:c45f:9024 with SMTP id af79cd13be357-93bc45f915fmr557188085a.7.1789631798944;
        Thu, 17 Sep 2026 00:56:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8b57deda4sm1587200e87.55.2026.09.17.00.56.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 00:56:37 -0700 (PDT)
Date: Thu, 17 Sep 2026 10:56:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 02/29] drm/msm/dp: refactor msm_dp_ctrl_config_msa()
 to take panel
Message-ID: <lo76t74cekbhmigetz5ovb6t7fg2pbvkh5h2pzjbjxmq6lb3e2@f2nhqd4la3w2>
References: <20260831-msm-dp-mst-v6-0-c91d35d6fb9e@oss.qualcomm.com>
 <20260831-msm-dp-mst-v6-2-c91d35d6fb9e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831-msm-dp-mst-v6-2-c91d35d6fb9e@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDEwNiBTYWx0ZWRfX1+rxemfctH4m
 X/w3zjmVxzy7RpRPjOMvQPEoc+Q5xG53GOX9tjMUYH+yhLXxeI3pTabKN52F16JyfWeGv6Tkhvc
 +9AKXfvK2/R78OcO8xvROFRsmw4ZMHyh5ISb56zARfLXsMUJTZSZALsOR9ycsbOx0cMd4bXTysX
 HqGNFFVnZJ93dwe97XLMbLL0Qngq7o28BdoupwkMje8yHh5mM+HfLaPivLWXblXMA8A2wEnSja5
 8QDTSfHw8OKkF1x9emtaZYasJeP3LI6TAnxeJOkDQ1sR00FhhJ2rFonnD+sXfq1fvmR9Lx7Xxse
 Wz2sVRLWoPkJ6YEhtxOg9HAEKScXnEwTyN3V0Y+tEbHY/ycpHOTyFzYcFy9+/nkjkOahNnE0jkM
 9KunSYyItP3SC0ShHH/3yBLyjtN3Kqhs/2BzBTdWx0F/GqtWlluNbmZVdJQh7kNEoFm3JSuSDpp
 5g0h8Jrzz4V6h3Hl9pQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDEwNiBTYWx0ZWRfX362v15czcTxT
 8KPDDJlUhtGI3vQBK8dzRebSANHlosk0tNzBn7OHWNI72rXPjpRtAtwUTwWJhU/uoh2bP5FyPXG
 juJIOzZTETc45/gbQlj4KAckinYEZec=
X-Proofpoint-ORIG-GUID: 1wax7xxHEjzNj6PY2_-KlpbH29N9F1t1
X-Authority-Analysis: v=2.4 cv=K7O3jCWI c=1 sm=1 tr=0 ts=6aab9d37 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=HrO3g0W2lMO92zknuLYA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 1wax7xxHEjzNj6PY2_-KlpbH29N9F1t1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_01,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 adultscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170106

On Mon, Aug 31, 2026 at 04:17:19PM +0800, Yongxing Mou wrote:
> Replace the (rate, stream_rate_khz, is_ycbcr_420) parameter triple with
> (panel, rate); both values are already derivable from panel->msm_dp_mode.
> 
> This lets config_msa() use panel->stream_id when writing
> SOFTWARE_MVID/NVID for MST streams, added by a later patch.

Please note the difference from other commit messages. Start by
describing the issue or the problem, then continue with the solution.
Yours instead describes the change and then mentions that 'This lets
something to do something'.

Why are we performing this change?

> 
> No functional change.
> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 16 ++++++----------
>  1 file changed, 6 insertions(+), 10 deletions(-)
> 

-- 
With best wishes
Dmitry
