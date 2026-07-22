Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 975211A6806
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 13:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784726662; cv=none; b=oXNobTEXHuOMhXlqH3mg9VE+XcHh/5Ip9QWctuk3IIoHNFg3EUZfIwmaudcvOwW4oH1qQh32i72IvoJed0m6GxLIPp3jKeUcxiXzMt90STWaUOYFVgUeVWBiD/RWioFBlfkskV5WdE0lPWe2w5zVau5s4eH859MUtB1JxRhRJGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784726662; c=relaxed/simple;
	bh=OtuCzfm+Y2UHA5VM0e1dmQovrRINQObfVgzsesKn0hg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QyWkib1RbRJFj6b4f9kJeX38pGcZKonHTzMgKzztP8ni0zqzYJnxzFfwstulaNL3XGF+x+ggNOc2rTrAsg3K/NSGjP5j5aT+idNLQ/PnjVe11Zm4MNyKMf9nXmxbk0HzUfSlcyEHGD7h/Ra/xGDbwkYjG4rfSleWI0zib76lrKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DPcEo+xx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DmKsj1fU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DPcEo+xx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DmKsj1fU"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MD1nZD905640
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 13:24:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=T8Wl3PkYX0uLbKQSwPdWic3x
	tWSYx5vu6/J67u/+Rn4=; b=DPcEo+xxSPQSvINJRvBLZJXW4pTaq9Loi7Cvs2GM
	OVCgodeU6yt/m4VDJg8CZpb4Q34wiKP65pAobLkNYAzTqVP6kAGYIzLMpRgin5Rz
	/mxRZIJ8/yLqFCsN0yID2+JwHrYMTESHthjoN3GqWtv1CvciXAWbtAZqfbixVMdw
	KZFDAWGOcqwPes6fdG5ldkCoNYCvhs4j5DCO5z5OP0sFWNOOINgCaaRdrdM8IB0V
	8n/tCEJVLyfadK1hI5q/1OmiCG2SEnwL6GT9wVZgrery+nOsrD073eWSNo94rO8J
	+k8BwU52AAu+rNPahein7acRqxwfUBOI7p9tC3Vt/ngRvg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjuu78pdw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 13:24:20 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1c7f135bso188975721cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784726659; x=1785331459; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=T8Wl3PkYX0uLbKQSwPdWic3xtWSYx5vu6/J67u/+Rn4=;
        b=DmKsj1fUnlq8qRlgi9Gc/EvoFCEsjAteaea7suavFko3wYIulSFMJ9oylZ+6UIhMcC
         6mJV3YsIKApBtXu6AeAWZR4RhL1DBpU7TiTaGcaCGxMallOLzi6bjWepJ5b527EU3LSD
         1Ht/rVltBJNVQcbdKDxFXcZHQjbc4S07TnLkiwrpHuz5s06I0UY7cRaEYdvOUBuu2EYn
         DC8KnaCjvZgDd6WIbtZi5Kuo1A+9vYBjYTuaU+ihQ7ggk5/tiBaUjMpWV1+nfO8cu5WR
         5NGSeBKh/VQIjcZgn5GsDGrVSx6L/b4KWNjVqq0dBiS4TTpepvnvrcCeAooM/K7iplXr
         suLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784726659; x=1785331459;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T8Wl3PkYX0uLbKQSwPdWic3xtWSYx5vu6/J67u/+Rn4=;
        b=P06KrAq4ZXtj5Z3lLy1TxXSaGs0JeYRPwK2hJ79dWfkORCjZsu4iHAjtK9pntUoXGp
         C4UuLsRj8zhWVvqbWaJa9mHd7JIHjhhMU15du7BoaGOeIq8HIhCjWWjsSFIeXYu8aqli
         KVBPONks9Z/Z65DR5SvlA8+8/YF1kvvSBPKxYaiix8RasegSi4RcoKtR/9siBbU3lnM9
         xtR3pwjhyFSpXMNPLZ9lkc3Jx5RbkJOTYp6IjEI6sbrEzPuexGdFoQGHEEPwcR4z/4kd
         mRWua854Py0UmVkfEt2KEdFGEw1XeP4WekaeCL7sCyBo5mWbBCugIV81W0XaoneXBUpI
         ohug==
X-Forwarded-Encrypted: i=1; AHgh+RpE/dIfe12f6gcX2i3F/jQKkRIB1Cblyd+pIzo6WTY1dckL37y5DArPY2GghSxheNZvqJuwRuGEmohspmYY@vger.kernel.org
X-Gm-Message-State: AOJu0YwSGgOZzUXqv0xrW9FJD/u39uzUDUhK6KraeLSC3KAzapvKn1bh
	4/mv0JG4dyh9yM0S/b45HGxSe2IuDCGolexwsWTYyF88NKlwqwG07Pi1W+TDLYXeyl0e+rWvVMP
	QqA93fOwF7HdBOHm5k4E3feHDPbAZj/CmBgc9cLDQraIiT7heQG2Fv//WrNzcYUCdChub
X-Gm-Gg: AR+sD10GIiXw5y4e/eUXSmhLilkoSIGjylcNZ3pYlPFeSKYE22kLpCb0LN4FnpvDkUQ
	p7pTow6ODshkAS2LLn8uW0Pyo+OD7b/fT7H0Iy271iV5L4CeDuoxtqJuEFI9Z3cULofTpxFW2PS
	7B1lSwXbA4yPUr5vvgUSyFSGOPeF5dyF/xSTEJfWaBHhG6oygBcNaWxFSxqrDWUQ3paq7t9hXTo
	u6QNA1hdnND44Agos1fptf0rZ/A7UaXhi7uTz5WOvmX2DqBMq7czQ67idANWQIrTKwH0Ay6xf/t
	/5D1uSRsHoYjTfhknE9DfYC6KNG5p1MXobbMfyUZzMEKbyLTp0UHBwoC+wGY8bZ1qKJ+fsWw+Un
	XK4kw8UK1bReQMVbew3G30nQfkspVlmOORJUyyRDzJ3rzhkADb2e0bSgcHL4Np8quXn/fCjAc4B
	/PfQguseo99YLaZg==
X-Received: by 2002:a05:622a:8c6:b0:51a:8c97:fb91 with SMTP id d75a77b69052e-5213fc53b39mr230566411cf.58.1784726659065;
        Wed, 22 Jul 2026 06:24:19 -0700 (PDT)
X-Received: by 2002:a05:622a:8c6:b0:51a:8c97:fb91 with SMTP id d75a77b69052e-5213fc53b39mr230565661cf.58.1784726658456;
        Wed, 22 Jul 2026 06:24:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9d4353csm457943e87.57.2026.07.22.06.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 06:24:17 -0700 (PDT)
Date: Wed, 22 Jul 2026 16:24:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: esteuwu@proton.me
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/3] clk: qcom: dispcc-sm8450: Migrate to
 qcom_cc_driver_data
Message-ID: <oehzbfhssp4ky3tptpygc66ebylethh6sla5nunfhluwtznqfi@meykqppu7jwy>
References: <20260713-sm8450-qol-dispcc-v3-0-56fd05822270@proton.me>
 <20260713-sm8450-qol-dispcc-v3-2-56fd05822270@proton.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260713-sm8450-qol-dispcc-v3-2-56fd05822270@proton.me>
X-Proofpoint-ORIG-GUID: 7NUG5ISXJupTPrV4EB9wjP_lnWuwpoIq
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEzMCBTYWx0ZWRfX9klCjvalqzqC
 2yvWP5wyqGYdysqdGfnx6UfIHs28zjZZf9WUAzspuVIDBoufsr+REflP7CaxfB3TClR9wDTH10P
 ZOjGC0qRur6LIN3CbpE5rbAoKXg2KSQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEzMCBTYWx0ZWRfX/4cj6YEFZs4K
 TqK78h4Y8K3ypi/2ucL2I+2vibEiI9ePapLHI65lbzULDzsVfPe7Z+xzysMES7hJsVxi50obKQR
 4IdYXeNgzGqu7a3vW0USYmdlKi1WCp1YPBMedRlcmTy4CJA63hRPW094w5F4CxJLGmLUwM84uG4
 zMOOCXA6SWzjSeMNn0suGfZxWgKEht3vXuZGXCM/vK1dByUwua+QIUf5CHCFjRVYbQCRmAjQj3U
 2dLTBQnh7EWptk7xgp7Scd/2RZz5S5iWjkdPvlp2/ZV+s3BTgYlQwJ9n4a+QBes5H4KbuwdQBbS
 oNKwvwjX4SJzZ2HUD8aLQWyhFCVNCpz4h1zGwVsdTxUl7QbfjDRRG+W0cuCu8SwTY5jux6DmQsA
 nakPBtMosiIsbzaZ0d2mBWMoOnACXxj+XlvP/O8pnCfNmYF0Sjy95ZO3cLam4+8kEI2lrDaRDmc
 85IOu4s737QpMMVv3kA==
X-Proofpoint-GUID: 7NUG5ISXJupTPrV4EB9wjP_lnWuwpoIq
X-Authority-Analysis: v=2.4 cv=JuTBas4C c=1 sm=1 tr=0 ts=6a60c484 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=RFcdKQwhVAgsHQyBjzUA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_04,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0
 phishscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220130

On Mon, Jul 13, 2026 at 11:28:18PM -0400, Esteban Urrutia via B4 Relay wrote:
> From: Esteban Urrutia <esteuwu@proton.me>
> 
> Migrate to qcom_cc_driver_data, which is used by other clock controller
> drivers.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
> ---
>  drivers/clk/qcom/dispcc-sm8450.c | 38 ++++++++++++++++++++++++++++----------
>  1 file changed, 28 insertions(+), 10 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
