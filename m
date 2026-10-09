Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 225E93D1CAF
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Oct 2026 08:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791535313; cv=none; b=O4HVXKbEdKRhXoAXy1+ssplIbQ91i7n8MYC7OwyAW6Jyp+XXpDuN8/bPtlaBH2a5ncLpJGs7FuSirtfSr0YmoEm9loEHlygUIJIqfWFpN7LTAiBRnBkzCOUEY+Hi9yksBlTaInTnZFcHWca1YEOf+CaPjAGfm1BssAVosO2QwXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791535313; c=relaxed/simple;
	bh=qt4NROSh+/Rj7ta/4J1JCt/wwRJVXnXOqe5ksJfpco8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YX4wrW209I5dihN0oqeYo0xiIGSYNGkD/U5L3L5AjEaJ2iyRS0xLveXQIFghPyy3i5F4JC6fRjspZxdnPMQ8y+v69jaWWbEedqkqEC7Xj43x46OXQN/ht5znbFNNQhLMQxfAA2CxEdlHCKZJ5BEGL3H0N8MkfQXZzCyOnpr7bn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nvi/+Bh3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OJ6EJJ7c; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nvi/+Bh3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OJ6EJJ7c"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6998KEf1906780
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Oct 2026 08:41:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CfN7f1pufqYbZZVQo+rvWY8E
	+8qMr4fBv7KyLGvbv9U=; b=Nvi/+Bh3YltzaPxX5L3au2Ca5kiPUufb2lUIehwL
	XmfCUhwgRs5kuvSwXHHim/tl2QyJ+Jj1sp9md6HSMuRweTo+NkU7qjSaSny/G7wT
	Ma2BtTIvKrlx0Os5l6XCiLgTdKMhK6T42OAPKE4WRUBeEvdPUBHUkNgnT8xRW8Os
	+b7jB7iRY7ANWEVCmxO49n3RwcLqIZScvkKaq7LxR2QuVsyc55BXK+lhbPhCVrqq
	teTHcMOZX3rTbuMSMo9TK5lkZinC8dG6msSx12POt1+RH33xu06KzbBzeEA6ITP9
	jaAcX2gWH6VM5nqZ1+/ebSiXEO7fX+M/lfpjUivhb0B+Xw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fmqtty7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 08:41:51 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-917a109c937so80775266d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 01:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791535310; x=1792140110; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CfN7f1pufqYbZZVQo+rvWY8E+8qMr4fBv7KyLGvbv9U=;
        b=OJ6EJJ7cyBHWPCMcpw0QET2yAX3jB6okGj07dt4/BYl2Ue7tPEKLbeFiZaddJTRiN3
         GDyiY7W4wd5DdGUpHlSGShpjb7gWYzmOGffeZDoqyBhcBTQiAW5kdJac+//V9HD1CwBc
         i05VJ1CaDEVIVia4cJQ+H4ifd9U8N/olA1/KQjtwHh2I4PjzU5uYmYaNdcGBVunVZ6Ko
         ILqJsqDNA3Zd2kGxhfAtAbiUpFBRo7IGG/WAcenmUgxe+qKdvijetf1xYTG+S3I7na/t
         KTBHfSwNsyQaK65tDIP6QZjb+H+9fUv0SEfMC0HlYCYa5SGTCks0laLiYPXIJk8Z606J
         T0/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791535310; x=1792140110;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CfN7f1pufqYbZZVQo+rvWY8E+8qMr4fBv7KyLGvbv9U=;
        b=yuLrpZym8+zjDwaK2OS9KkQLox8doRrW12AlDQ28fAfMa/e7T7BEl5KFWRsUgomKys
         IZ06P1BqviFOa4KEEuukjpu+v8sEfThSImOg3+eGDldLKhc7M//7uIZjlFcTuBslOsvs
         SuQbooeO8wjToxM0VWBeP2hzdNm8y7RrYgdybQ/lhaWh9vcxSIFFZV7/ZE4COrqB06gn
         ATxxQgvib6kDEYw9T9LG3jThqMblDJMNpM0lN1HCntwe26HmMQr4skzkjm6iCNU8d4z/
         OWyWaceF05XwQMVtECdF114BZ5zwnEyRAOY38UQSNI+LhFmr7PrGkvDP9lTNlRMrcdWy
         aqbw==
X-Forwarded-Encrypted: i=1; AKwUvBw8ud6Nmcba8heobyZrSdFAdg9NG+93F4C3MeQfBg/cgPw5ks13QoruJXzekRfsMtd9o8L1yNQ24uS9dbgj@vger.kernel.org
X-Gm-Message-State: AFuF++nGj7JqAXlj+uFz1bEyw1k3BjsrjDAl9rcXIhSVElNvTi0rzeJa
	VTHTVcKUVPIpDZ413Kdo9c5iQC2TnVVcok0LA44+kUsptyWy5wIwciMpEo5v/GKqYswDJnbZPma
	zwYCRWCcrB6R5O7aggLvT0ObwfU784K96+OwsUvTBGmU0Zpx6FbKUzMumXy+DYnPNWhzb
X-Gm-Gg: AYBFou3M6tYbcfJyZ6VjaS6/9y3RwoEpKYSnmz8/4oMDq9Cfcwsk6NFQGiuBrRB32L+
	LtUte7YbXYZWRLqaiA1sxuaOa3P8maZaKL46u39I5ekwBsmI3ZONpsWdzKhz1lzl8SRZJFGnYy8
	/EDbs9AsBWSHp3GSNkgtJBwLeKCFKy8ZEe4BiyWaM4TQ2JAMSMaLrQcWBdLF7iqKAE2DnmzEeeY
	BIBGFvX2UgxYBquUl6D27eurMERb3uktv1SE4tb1Y1wwq4e4fGG1qMNmBlZxc7ReXjn8xSruTeh
	ll8AL07AGaL1HWk58t3gLH7pJ2itXz6nx27JJvjCSgm5etO5sP/RM56B1+Rg5qQS5pJeDQ3l5IA
	/im+n5mvrtDEZJ6E/O3bkOasYBoApLVd2kcbV5PSqfn6V3VKHBzMbg5AzwcjIB0hj/F+sP2OVpx
	OoAbja1saX6Hbf
X-Received: by 2002:a05:620a:46aa:b0:93e:b729:879e with SMTP id af79cd13be357-93ebd211b26mr189346485a.23.1791535310352;
        Fri, 09 Oct 2026 01:41:50 -0700 (PDT)
X-Received: by 2002:a05:620a:46aa:b0:93e:b729:879e with SMTP id af79cd13be357-93ebd211b26mr189343185a.23.1791535309780;
        Fri, 09 Oct 2026 01:41:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a9c3cf7ffesm4278611fa.41.2026.10.09.01.41.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 01:41:48 -0700 (PDT)
Date: Fri, 9 Oct 2026 11:41:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Richard Acayan <mailingradian@gmail.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 06/11] remoteproc: qcom: pas: Add SDM670 ADSP support
Message-ID: <7brlveujfarxtixe3g4yusb6sov52jzxlno4cpjjzghon3ijpm@ef2u2oplwsmr>
References: <20261003175659.23536-1-mailingradian@gmail.com>
 <20261003175659.23536-7-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261003175659.23536-7-mailingradian@gmail.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAzNCBTYWx0ZWRfX4YZddKSDXRkM
 dFpE5q6km7MCvEQMMOBMSNBsVT1YjzZZM/Hiu8z+Q9jTiSTU3+XMDQVTEPRYKnPlqCnKwWC0SOe
 OHC+Gg1GAu61ugVaOxwkOR+guK2XugA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAzNCBTYWx0ZWRfX2T9RY2/uu5UR
 HnJiF1hb7koAu3KBk0fl+OVHHiEly5kqL3q+JEFO83A+cCoav4crmfQO+hjxNnY05gHldIfc+ku
 1rMiYZThxbU83g3jT/pH1X65qGA7n1SNcrPozHj0gSwW4Lo3KPO8t75ETZTAVVux4HtnCy37tu4
 sbVJY+vhtWKcVVzVdIxwkL1HB6d+Y8iWz508ocvOD9WISzqy5oLGNfQgxpfMMWciHFx5orrLTrR
 8g3PeNxgb7o3NQWmFXSc9LkFP7+YPj3dSxBjKStXMYu9KWFm9AFZibJR8enzpoCUWo19lOEZTgV
 eAVLbqhzpWDJ86j66Te9ueaJXx40dU7HxSJJIF0AxnB3Wwxq6Znnx47DQsBMoB/3iaXovV8Izvc
 RVpLltHxcDMK978um1fiOzy94WXGRrGQ3pnjQyzzxq9DmTqph+t5pcjNstGeuoFyS0pte/H3rG3
 xxLiQLKXXS4z3nkm45A==
X-Proofpoint-GUID: 8YCwVg93jkN--erHWEC474pAYO_Kbh9K
X-Proofpoint-ORIG-GUID: 8YCwVg93jkN--erHWEC474pAYO_Kbh9K
X-Authority-Analysis: v=2.4 cv=IqCL47/g c=1 sm=1 tr=0 ts=6ac8a8cf cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=vbmOaEBQJOqfsUEg3iQA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_03,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610090034

On Sat, Oct 03, 2026 at 01:56:54PM -0400, Richard Acayan wrote:
> The ADSP is used to control audio and sensors on the SDM670 SoC. Add the
> compatible for it, with the same data as SDM845 since the driver
> requires the load_state.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

> 

-- 
With best wishes
Dmitry
