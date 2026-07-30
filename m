Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C73837703B
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 02:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785379087; cv=none; b=t6dLbc2NxxlQTbJwCdOXtSkq1doqrLOnXS89kcVtlnoyc6VY8HCqo8clOkOzost+aDIRikZJYJhRELQuHIK18PtnNomyDwWKCzWhNXlNYCkfV023Ky8ZLcvVbsjwcQPUVyZ7WVsUMfkoDk8QYGS/UKL1ys+94YfPhSEuwC28vMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785379087; c=relaxed/simple;
	bh=l/EdOThcddcE1RLR7XAxF2kkA8GvtvzWgyQusTR/UsE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eXLJ4DF5+3b9OAII48TuG4X8lL0KYFqZr/yGAva/YGYvqV76qzYS8lHp7vw9G30L/Usb+5qIxJIwRB11BNpclHAwvmS+gpcooaUJd32GD6GycYPv9dKDLKDdj0wk2gqjVdoawiSz0UbCpVO0hL1WLqxylUnK4lLBNYfLmrFm5Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F0WhQ6No; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L9wElq7o; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F0WhQ6No";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L9wElq7o"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66U2Zxts3613509
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 02:38:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wjI3wUO4Qqnb0Dg9f29kTT78
	Q4hT9b7fSQY2MUDAEyk=; b=F0WhQ6NoktOxJUtR/jJaR0TY108hx/T1gj7kdk3O
	kuxREkAA0muDtve6tMGuNN+kgBh4FEnIEjmscdhQY8lmndOn3gCVIqEvR5TiuQsH
	AqS+hhUiMBLq/ch/27WoSmJq5hvV7skHOAElx/tWN+Y4XUP/k4o42yiRzMPtUKMs
	liLPT0P2GUItGbs+QW1Pytf+W4jfMBiXGk3ZIZAPGY4ZpyDdaDMypuBKrDEg53sJ
	iCw+19HgS275S8vtEKA0hx/+pGlEd3CLNBwL9Lvj8TCjlR3ULM4wDyb8MD6Mqk52
	Zkc7M5rcpI1jYpwyMNO6WO/y/v9DHO14SWO39dxfsQc70g==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqwygr08b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 02:38:02 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c96b4f58ddcso1271587a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 19:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785379082; x=1785983882; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wjI3wUO4Qqnb0Dg9f29kTT78Q4hT9b7fSQY2MUDAEyk=;
        b=L9wElq7o5+SiXd60iAfh7T+WrhLgTr0yNgMuNgJKuKEJHiETGOYKD/EyPDjjuJPEU0
         VFLL9fQTsS+UiNyn58Anrphjo6DSTIPJksAyu17wginpL3SVLUe3pxbIjXI05g8JYSD7
         Odyno4imZp9Nuwc0hrTjQXF8hhBjJfkuuE3SK+9zO0XiLmXjoIC8ezZRhqlCCEENsGeD
         N38DQw2EdsQX5QsC3Xu6NmJraHdxwpCeei3361lKsy7qWN8C/scxS3uy7Rdgbi9fp/m3
         6UC6ghG73D+b4daJwxYOgR0xYG33ZIz8egC3KlNI1a/sJbuihu50cnzgR0Dd9PJfHfVM
         8h4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785379082; x=1785983882;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wjI3wUO4Qqnb0Dg9f29kTT78Q4hT9b7fSQY2MUDAEyk=;
        b=paGFkwEX5ZBAUR9IUp9MXVnwN2dNREK3gm7DbYRMCozPNeaEz08i/CJjCMlA+X0B7C
         k6lHSsIzn6P5Wt4ZgJlsBxSkWRsf6El5DDdO3elUYDDABvpgU2JuVLQ0dR5FhHbtByma
         gKx9RJbDstiMIVwUoINV9nsPpA08vQvELVp4BgRvaN/lGNQEW5v6LA3RmyeMgP18BGdD
         mF9W8Y/s//iCFvJ28o90fhlsYma+z6Ey1zlfCckv/BTY0cLT4nAnTcrZY/+4KSKP/wJF
         qDbGduJNJ6F6fIJ1Z80j/AIa5dCwoOGLhJWXUEJgule5alV1mAfZlO5q0Aq7HnvhiJem
         yx0w==
X-Forwarded-Encrypted: i=1; AHgh+RrBZx0b8xgE5zYtgGk3stl9cgxfxfZyEjbTKL4GqRmPoQ+4RWt6KGv0sq7aQCBWKhqord73b+4jSfeHqDxf@vger.kernel.org
X-Gm-Message-State: AOJu0YxkIkus6cWkkWHikZVal2fhRR8aJJ+UwwMfNsMGI7B5Xl18ZcLn
	s4ODJF4kIg+jMHSeX07mFUGCnGIJmvJuBloRmdoUcTo7U4UeTeei5Jtp0HNy2tAPYwjhP4hpkLb
	0WMXbpgValKpR6Yxl7jI8AVIuuGpGnnKVxJxD9mmzmabwG5oJbGetapF/nI+d/q8gxXDmL90iyr
	SjsLk=
X-Gm-Gg: AR+sD11gF831Q/p2otbfuSAS++HhXDHHBCE5lw3xG0vocBxZf4Z7H8bwQlq3SocLdDy
	oeDKWY6Zhfqoq7H1k5EkTQR0b6I43BP8v7+Vr0JjH3y9mWUXhAkS1lBa8MpxsKOwVDws0ymuIKW
	OmMierQl0NJgL9/y0PYYxobuOq3zy21TmigXFxrRPfonZsa4/NL1ef7W4Ba+lzYuEGInUiUCUZA
	b5zr6P5rppNH5L9BX93bulKByuEVXd5cUykY57L1tJk2paSktIH66O4eo8JiIcMGd9ZBHpLKZ3L
	8aqOXmVEcVDihg3LxRQsxs/cQlR9OH/NkVz57vf+0RAorK9eOn/+8544/zy84/G3AmGINgwxZ6i
	ayymqXdbXVaa+jUUqOfuY0hsZU29eAjDqE9yqBK4gLbo=
X-Received: by 2002:a05:6a20:a109:b0:3c3:b656:4f5b with SMTP id adf61e73a8af0-3c9008e68ddmr558668637.56.1785379082150;
        Wed, 29 Jul 2026 19:38:02 -0700 (PDT)
X-Received: by 2002:a05:6a20:a109:b0:3c3:b656:4f5b with SMTP id adf61e73a8af0-3c9008e68ddmr558648637.56.1785379081717;
        Wed, 29 Jul 2026 19:38:01 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504d3250asm13654842eec.20.2026.07.29.19.37.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 19:38:01 -0700 (PDT)
Date: Thu, 30 Jul 2026 10:37:55 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] clk: qcom: negcc-nord: use clk_regmap_phy_mux for
 USB3 pipe clock srcs
Message-ID: <amq5A-o8Hqy5irVW@QCOM-aGQu4IUr3Y>
References: <20260716-b4-nord-pipe-clk-fixes-v1-0-e4f583633356@oss.qualcomm.com>
 <20260716-b4-nord-pipe-clk-fixes-v1-2-e4f583633356@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260716-b4-nord-pipe-clk-fixes-v1-2-e4f583633356@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: Vk9qt9JXkdw6MsLgRukSBO7csmckkl34
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDAxNCBTYWx0ZWRfX7LrlvZXVwBfZ
 0UboRI7UjMoPuz7gSrJyFrLouQt6KHhQYomV6+y38s2vRGR56RS08Snt9ZsMkhVSV5pd3ZvMYeM
 S5hUCeKWu8N8SLXkDqesdCOyg6OcIOs=
X-Authority-Analysis: v=2.4 cv=aoKCzyZV c=1 sm=1 tr=0 ts=6a6ab90a cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=CyjPzYRc6_wJduQYL60A:9 a=CjuIK1q_8ugA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDAxNCBTYWx0ZWRfX5WsUbiVPE5wi
 7RojpsDim0VpSuwdPQGjPTqTnfrUM6XTFxC2l5ir2c7ja656c3RcOd2QKhMlGVsU4zCklVqPKqa
 1GmMuK/bePlyUSXZjsHP6iV56xtL/lgeTVv886YBX5uj0mdN1FcAzkmYseSelQc+5bfhaHto72r
 0n1G9detkOfN6Kw4eJ9bOS1Gth6VRj0cZt0Y9sj1UXrm0yxDruH3DltuFTAu4hw02VrwuSrnUGv
 a3AJqSqfnusChKs/pazFGrTY7D5Ko9Mo3bf8IaNBQWMmZmSgXaS23fTcL3WG9y5Y3g1we4PjzFZ
 mJeBb6ekTHFo16FPmcXarh/QWVaMeyuYEwmwLv8gcm2EciQCUG0J5eWXyLOpIHeIWnk6u4E0aHK
 ajmiwo8dSr+vFF6fHa3g0z1PKemjQumWSQNxaJcA8XsaOl5kY7MpA4bcvtKpbPM26R01mc+ZmEL
 VUrNdw4Eo5wzv0bbqWw==
X-Proofpoint-GUID: Vk9qt9JXkdw6MsLgRukSBO7csmckkl34
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_09,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 impostorscore=0 phishscore=0
 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300014

On Thu, Jul 16, 2026 at 04:29:12PM +0530, Taniya Das wrote:
> ne_gcc_usb3_prim_phy_pipe_clk_src and ne_gcc_usb3_sec_phy_pipe_clk_src
> are 2-bit muxes selecting between a PHY-sourced USB3 pipe clock and
> BI_TCXO, implemented with clk_regmap_mux_closest_ops. This requires
> manual parent switching and does not park the mux on the reference
> clock when the clock is disabled.
> 
> Convert both to clk_regmap_phy_mux with clk_regmap_phy_mux_ops, which
> automatically parks the mux on the XO/ref source on disable and
> restores the PHY parent on enable, matching the existing UFS symbol
> clock conversions in this driver.
> 
> Fixes: a4f780cd5c7a ("clk: qcom: gcc: Add multiple global clock controller driver for Nord SoC")
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>

Tested-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
