Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792601773;
	b=3u90JRrHfVzd9Lrf7P/d750L5nEIrPkXkIr2xwS70nvd69YqYhgbcflGCJ4jcbp4nr7D
	 nox2DBXzg7CIraDcra5mE3p4BzB3+Guagzrw9mpOPwSb3+XQwSftz7J4ljhZu5ljsM6Vk
	 DrvjGasQ+gVc2c0JKAcs65ZzrPCfDN1kdcZkYdhwf+gzAOZ9/eFnrTjeFhpuHyVfJ59KL
	 T/Iys99YI/XdgNQniLlG3t548IQ0h0cBVDsgNHQRm3t9ZRbmnS7FFYrb/Ev5F8ky1A/ql
	 TuJeZDzpw9/mfTeKEsktpXWlFL18UdET3RGZfHlC8m/qowIj7vkyWNqlnDdg5b4lFCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792601773;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=U1odT0h545fjjEeb0UTVDvE0Tg7Aw5T2oDxzlxF0X4Q=;
	b=auqiioYo+nxiTv3vyARukWBQZqXGtBx3cc4op8n6kPg7OD7pkqVyxJOFpMjuWKR1Zoyl
	 uWscBlSck+7JF8CZ+Balby2VXFLr6ikLySsCI8FUdd695BGYcvPmr05flV1yzoUfvfgCO
	 6fqHnqUUe8TEjilQh99cjwLx1QOm2e83ugC2/nnRIhDwxcYhhf6VJsEpstWTVx6qIqgfN
	 aXRoBfzA0nL9ILutkUikLFKUgiaB+EtmQuA0jASZPJG0WgqiqtAOh2hL6s+/NmrWYHIxT
	 vnV0XjZOnKSpkqKFX/4J+Jzs4/fpQ2SoC03neR50bjSKPqsIr1V7awz31qvqUwduzUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dbfgYAmU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cYuRoPmf;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2311F60A4AC7
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 16:56:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2311F60A4AC7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dbfgYAmU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cYuRoPmf
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LGrcvb1744670
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 16:56:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=U1odT0h545fjjEeb0UTVDvE0
	Tg7Aw5T2oDxzlxF0X4Q=; b=dbfgYAmUPR83D3MquXGFpWnp/Wrxo0tk3rIRxDpS
	ORZg7yNiKLtu40ncUtPzayfksX2qdpSYPEbC7mAtRvt6V1NguSsQD1kLwjH/54OH
	gXxeTx3s9cIzc1PVS2iED6SR2b7VyhNoc7Db1XjQde5WmmfCpFiNTdzTmHMwge45
	UDNUHFy13zGTOYJdadWx2R/o122ddPVokeWQYByBbJqzvFyVB1MxHrO3xIZ3qw+Z
	rxIFrMV00H5uz/KfE63V6Iomz2AFOvoTVhccJGK2V+EO8ZX6LyUv2o+J/wpxP4vV
	vR8uZ/PASeh2aQyYlX+1wOP4HgcX7oBIU75bgQM0EvY9+A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf0v884x2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 16:56:11 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f20addba1so176931585a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 09:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792601771; x=1793206571; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U1odT0h545fjjEeb0UTVDvE0Tg7Aw5T2oDxzlxF0X4Q=;
        b=cYuRoPmf0X9XqOhph4XOfPKDZySeuyRhOCMvZ6glNlMBVeqd+eamYW8FTjVNSOYFC5
         lptHqWdprO7FvoiHgOvgTCAHVrpMQR480LdxEf6fr4JFdr+ze7DDccketXdvxhXTHeu9
         tpJ+VOKJ06uZTCmd2vVx+guEjwXiMLEFUttASnHlVUEhgiVsbqWEdFJjCjN7rslJZtH/
         jomUv3a+JIp98mdvJFHCilcWp1yy9ID65YRqlHiGMhIr6NXgLORXKgpFTH1fVqSLBkFA
         NKUjTtCTY24KNq1/tNfmM6U/zOTeZdz/HAt6/t8yhxmcE3/43tKGuD+X0NIdJ+cWRnrN
         w4gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792601771; x=1793206571;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U1odT0h545fjjEeb0UTVDvE0Tg7Aw5T2oDxzlxF0X4Q=;
        b=EKMRxgsbfYfn+lPkaU5qd/swFg3JbjFNULJy6iFBKErxXZa7+2j7aS7TWs+sv0E8Yu
         1v7B/cF7qLvAK6gfqgEXJdxQHa0O1imVey4+x5Jo2rQgjWRqO4BkjfGitsBuzvGShy8J
         rV88z023R3MHK+487fG9uAUOgJmFNam8rphZGjIPHQvZA29nEAr6TnoO9hsUQQGdkJOf
         9WGoAKkaOnBS61MuEpPRyGdq0Jzku1kp06LiSDzK9Vv94w89bYAyk4uQRrmRF54ybOXI
         wQUOL1reGUSlI+JR4Z9Z9vCx9g0QdhfZmAth10teslS1nZbw8uGKr0/dVNe8qaEquvU8
         IUpA==
X-Forwarded-Encrypted: i=1; AKwUvBx0lMsYjB9luLQvItSOj1jJfHvlbmLu3gvYdepACZg61ePpOREVAmXSvRwS/oLl2IH3yLh2rnC1mb1PB5T+@vger.kernel.org
X-Gm-Message-State: AFq9FYJ310Js0SpwkyNKLI4or3HnfuYRTjE0uP2QNzz8/n5aBgwYx60G
	7Mc0ez5Vp4gOVWtJdjIU8ZAgG6eYvloFWliHTI7faW66g3oj/QTpwTWOywO2Z1kVp1R+Hj0qxDl
	U+ihO8S7NDtqIrJtLzKr9iyDdITzeIvEQS+EBSfvDQM/YqR6Y/wgphSSkPQnhgCG3RzIh
X-Gm-Gg: AYBFou3l7ccZqER8HgPwaSyd6hdv7yv16ASk0guFG9Fp8FmgtPYLOvmVdEAkdkfeHa2
	LiilMhMhMXILfPhnUds1nvhPT6JK9S0ykQDsQA5MpKjOrDkdaKJ3CDcwsktiS/CzC9JXyPPWnGW
	0XAd+4ExPzrUSvXIxTROQu19kExgvzbktjjclMHGeqh3BHLZ8oKeIqVheMxJtau9t0mnjVn0nJ4
	MFBqbd5TVjaxBrfUIAw6FfAHCGfa/Rvf38UhQOkCYSyTJ52Jjz2gYPdcuysdtQHlFTbdUeefKDm
	VPb/Dkr3C7gbGqIsx2u/+DfR11wiXmZ/BYkHo+XlCpURBMakBqQbxfqQQKxDmHaES9OHHr4DERV
	reYQLVPz10zQphlZ6UG8gJNzJzT6EWrm1qzTAPUlTQSpcNH/zaBqzmBlPEWw8hpxvqx3SWgF2bo
	0dN3NK9peNJRd3
X-Received: by 2002:a05:620a:31a9:b0:93f:1445:82a5 with SMTP id af79cd13be357-93f57f7a432mr536573185a.79.1792601771283;
        Wed, 21 Oct 2026 09:56:11 -0700 (PDT)
X-Received: by 2002:a05:620a:31a9:b0:93f:1445:82a5 with SMTP id af79cd13be357-93f57f7a432mr536568985a.79.1792601770867;
        Wed, 21 Oct 2026 09:56:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfa124187fsm640279e87.78.2026.10.21.09.56.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 09:56:09 -0700 (PDT)
Date: Wed, 21 Oct 2026 19:56:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 0/4] Add Qualcomm's IPQ9650 APSS Clock Driver Support
Message-ID: <3v5ul4b2qddghhwdyzbjh5uqwo6bvghrabr4nzs3ttvxpcwfne@tyepx5pz3tqv>
References: <20261007-ipq9650_apss_clk-v1-0-fd4c2b3cbdea@oss.qualcomm.com>
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
In-Reply-To: <20261007-ipq9650_apss_clk-v1-0-fd4c2b3cbdea@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=C9Z8WgP+ c=1 sm=1 tr=0 ts=6ad8eeab cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=slmPpXlptjOQBmdJfhgA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA2NyBTYWx0ZWRfX5qqKtKIcOqR8
 wOL8SnwJSmCEAPwFZ8J9KB716RscsiFArwarXxz6ojOgWwZS3VU+3lTpTZaF1sOD3k/+ozwRfnF
 9cwzUGDcsfRtL/DyrHYvOe9VGFPZmtM=
X-Proofpoint-GUID: 3_yjmUpQfz7fWlkEKUnD0CUofUaNdxF5
X-Proofpoint-ORIG-GUID: 3_yjmUpQfz7fWlkEKUnD0CUofUaNdxF5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA2NyBTYWx0ZWRfX1P8vkb8EzqFB
 GStzkt8hmAJvcbNxPobJVTWCibSvygMev63zsztcIiYAqIowHyHOinuVK+CObwxvPQl1AwndFd8
 /k73NMtwQKaQCj0zosMyo8QJ+prIfrfx2GvsSbaCf88HWC9b4MYt0PLE032KBG8N004v9nzK6QT
 30Ws0aXEa0YwxEBNlZQ7abqcqLAQWi5dDv1oLAeqA+PIcljHdQXmdyGdQB7FbTj+cZ+uoC9yg4s
 Dm11AW36qVnveanejrvA7TdYd+JvNq9t7T2Is27QmRD1ZdE07c2Nfu2cgVLNjjCGXfXUD4xF83G
 mzSJKCSvDN9jO5RXBQDBAarYFMtsq1sY9Px84lZlIGMkqfgwfIWjx22zHem36d+9+O2TcQ25fui
 EgMSv4VehogJW4YRDCRsYfotgAqkQpzPOIC6vJXIdvfM/ji2/W9uNTdpBhp6igBHIo5eIFuahdk
 cAhUyrZSaNe11B8AjwA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 suspectscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210067

On Wed, Oct 07, 2026 at 12:20:43PM +0530, Kathiravan Thirumoorthy wrote:
> The APSS clock controller on IPQ9650 provides the CPU and L3 clocks. The
> four Cortex-A55 cores (silver), the Cortex-A78 core (gold) and the L3
> are each clocked by their own Zonda PLL, selected through a glitch-free mux
> whose parents are XO, GPLL0 and the corresponding PLL. Since the L3 has
> to scale along with the CPUs, the controller also registers an icc-clk
> provider in which both CPU clusters vote on the L3 clock.

Is there a complete picture somewhere? Do you have a DT implementing
CPUfreq somewhere? It might be worth including it in the next iteration
of the series.

> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
> Kathiravan Thirumoorthy (4):
>       interconnect: icc-clk: support N:1 master-to-slave topology
>       clk: qcom: clk-alpha-pll: Skip Zonda PLL configuration if already enabled
>       dt-bindings: clock: ipq9650-apss-clk: Add IPQ9650 apss clock controller
>       clk: qcom: apss-ipq9650: Add IPQ9650 APSS clock controller driver
> 

-- 
With best wishes
Dmitry
