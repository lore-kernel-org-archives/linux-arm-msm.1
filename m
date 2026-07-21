Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043A334E774
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 13:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784640299; cv=none; b=FXJ4qN/k1czTd/hlgItJqfdLjCaBRa8CFzZmzpjoQyetmp0tU54W3nz47RQlJGlwzCtoDk36YDgP/QQOBttymAIbKeL8eHw56gr5Zj3VyH4YxRhJHE+jbE41CE9i0p/wAP9tctRqXy8XPzT3wBbXPx3NdbigdVxWuXnq/S+lXLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784640299; c=relaxed/simple;
	bh=kqlUaUNg+9S7I02lfTWEP3yIC96MGDX3Wvb136tIjUw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZaowPbqHWTzCkd9JW617ky1t53tkjVpjInahINQsvEo3bCBw83PtitUteW7ldML09YCMz0xcSKdG2S8u+n6h4JTKnsxX3kSNgOUlEYoYIb7Fy5Z5uWx4qsNHwOAZwoOBIirij9QNeZxVA4w4dtfFyIyiRvIiCNf8CBO04FHxxJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TRIYC/A0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h+DrD+Rg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TRIYC/A0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h+DrD+Rg"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDLsj91890575
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 13:24:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RvV8gtZB0WCQm8Fq2A8UV/ab
	XE7LrOG1ZMiCmRexArM=; b=TRIYC/A0uDO7kga/jrJzZlGyNEX6cDqpGMHVde2Q
	MnP7rADV9I/3XAp1wWwR4CgogjW3T1D67SljUfnOhYqbFAUj/U0h7QVBTsQ2JbBx
	US5Me3dJDG5oOLdzIwh0Cd8jWoNdG8kW6uEpN20uLSzTZ1gPyC0wGiQucLyccsWg
	vbHXtitfhuC5RwCbsdB84f/vT9n7onRc2WlpPVw52krvtXvaR1WXgVMqgEokuM9K
	/rVgIoa++j6+SjnhGgaDR8dSXa3aKipLyWniT+36Hzba0oNDELqG8YGNrTKoezQ2
	QnqhkpYi2/2G2LbSP1iFuS7RdevICX7pciSrdOlOSio0qg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj9bs82jd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 13:24:57 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c2af04aeeso30630391cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 06:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784640296; x=1785245096; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RvV8gtZB0WCQm8Fq2A8UV/abXE7LrOG1ZMiCmRexArM=;
        b=h+DrD+RgauyNcoKe1Hz+xcQzuADEMvGTLzLr/EusQsMW3rbDq2PNrkzhV/LK7ajIx7
         9t0+E4LrZWUk3kE6cR61vupjeR6kRqMDG3USllZVTJy3TEUYF1jBaodqHseOC1NBD7eE
         hxWJMVel+iYAiuCwCr7IHKuBMJ6biooU2MccoRKie8Wmpf0Ap+Hs5jFpVS5uAi+UjWGi
         tVXHUfpha2yenBbjscBebQiKCUPuAXwFlXyZerEoshyWy1IzvgeW1taawmAdpFtZcxhm
         u7/QNqrbJ4fwXC582NIb3EGrQ/WG+lOoksN6N7N+6Clfbvjov325VOc4kPbrSg6mu1Oq
         06+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784640296; x=1785245096;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RvV8gtZB0WCQm8Fq2A8UV/abXE7LrOG1ZMiCmRexArM=;
        b=cjTT8DGpUtisEulT/oj0Aq6inoBIk8+Pb996/nrrGi/ttMmoL0e1hncyLkntEFGNyL
         Bmy8+aQTnSOGgZDpN8KV7otKKS2CnFtEkLt+liVmh1aGfw9fKA570cd7Eup762mPB49x
         eaMRtLLtArWEbxMZ+8u7gWUQq0aT+qT8GEUux9LjLjeJVKk5m4r3lVVw800VdP2gN1JY
         xV/yoTpFgVP08m9tb5yY4ebnZx8XZDFAJJywn1M1F/Os8NfSYkjUpLjWNvIU3CmYJfsc
         W/JhN6mhy2cHqywx69GBpykV2Y1QOP1Pigq1XMkZ6dgCPHFA2eUG1mYsqfE/aIJmIlH6
         syXQ==
X-Forwarded-Encrypted: i=1; AHgh+RqUPcjYc9zZt3CyhVpCZtzIXPtNn3PJ2M1pCAH52sWXp92McZ9XcFrel9uRNAcsP9Sxm594EfmTQrx4hSkP@vger.kernel.org
X-Gm-Message-State: AOJu0YwBg0oF8PwSfcYOJ8Gl3Ac49ym9uzfCXwzzP0e72VvQkk+brwj8
	9Ljto7tfYnTzrAeeLZWDJdoFKMeYBHrEJYBGSe3wcmyHfz23p+POfhCMqGy9nrugVqANYcOy54O
	Tr+ZZQABI3Kv127YGdf6fO+J2s6Ahl96mXgZQSc0PMnbG+w2uhNCsaOzGxC7gRyv6gWz+
X-Gm-Gg: AfdE7cl4T21SyZl8lhAdn+F8Hu/1lLVKDlc4RyL1z8HbsAw5r7RjXNwFoDJUAEynrH/
	0nGQjDzDT8UKQve9aJCfNcDb0I+XzB1kZ+ybQnKyAeArpiWK+PyMVN+Xj1J4Z6IdhIhjb23nm5y
	gwUJk/Q3TojxZWt5ieab0IgFrK0FMYNyt2Z2rWac8fvd9x2h5AZsh7kABt0XakU0R1JZ6t4knpz
	Vkry3x/uudjYLoxP4IJbquwz6yxpprYHuEan050on9hiUl5YvCifmCXh5W8E3CbxPbMCyeHdwgg
	4H4URe6UfyP5qOV/Qga8N5LeB1TNsOeqvdAUtVo7ew9wHj7Lyvm4A/78DCzU0GZU/9RP3LdA+HK
	WMD7mU29W4mhGgTtLGYK0J5Q8Ex8aI5lGzIycyiqruM8trVpM6fX1/X9FdrdA3gqOZKYG9VoaEr
	Qp6LeFqESwoGH9PA==
X-Received: by 2002:ac8:5d4f:0:b0:51c:f8f:130 with SMTP id d75a77b69052e-51fc1f58216mr222387771cf.39.1784640296370;
        Tue, 21 Jul 2026 06:24:56 -0700 (PDT)
X-Received: by 2002:ac8:5d4f:0:b0:51c:f8f:130 with SMTP id d75a77b69052e-51fc1f58216mr222387371cf.39.1784640295901;
        Tue, 21 Jul 2026 06:24:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b291e0eb4bsm2883547e87.46.2026.07.21.06.24.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 06:24:54 -0700 (PDT)
Date: Tue, 21 Jul 2026 16:24:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        jishnu.prakash@oss.qualcomm.com
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: shikra: add vph_pwr and fix
 supply parent mappings
Message-ID: <wqibfckpvyjlcc7h3iizeovzchyfwg4q56uhlvzufpac4jtpc5@gsrv5hzesujo>
References: <20260720-pm2250-fix-supply-parent-v2-0-60ca47031b50@oss.qualcomm.com>
 <20260720-pm2250-fix-supply-parent-v2-3-60ca47031b50@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720-pm2250-fix-supply-parent-v2-3-60ca47031b50@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: hccS1DGLeDnC3TsaJ0o8NNB1HodRN6W9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE0MiBTYWx0ZWRfX1rjqw2aN2c/w
 GhbWk0hDP3HAL/oyByOAxs/rCaymlb7QzvKgGcTiExmTJ9HcHrWPI3AxmW4MooA8ixARk/DHEaY
 hUx8jDjpcjOUG1Ue+KzVd9KiF5tcrUcysS06RxD49ukISTgZCcATlfo6dZ/jrA1vTAwywPQiyuN
 YUALX5FUs9/myKjl0Tk2UkEKywU79QXfkxUg3P/EuCYKicsabKKBBVCwe5E9JNt9WOSXOEXdeXt
 B53Gu1S/0HU0+Ir7VN0O8O1UvnP4R4fk4SpCR32UyE0nO3vqJ1RiaorjrR7BwarRI9ngFtM4Rxb
 DKsmcKqblCV3GFrhWoXBLHEPmf79kScftWtr3D8AUsYYuSklV347AJAMR70OLclhyvba0FoIJL+
 gs6A7NPk+QbBwqvZq5yWoefzIqLp3Ldg9LVZS6OGRl90IGPN83M1WuxGSn24FFrYQQHDtpQY3jA
 FMh5o5KFZbC3EmGeKCg==
X-Proofpoint-GUID: hccS1DGLeDnC3TsaJ0o8NNB1HodRN6W9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE0MiBTYWx0ZWRfX0MPGW0HyIamx
 BFuzGwiUhG9BgrNc83CMsveDticwFyLD62x6uWSUnceFWjA04hnu92FRy1SeKG5el0JfVThg095
 l9Ac+aXMIBlz6pOgTzq1G4iXuLApszo=
X-Authority-Analysis: v=2.4 cv=QK1YgALL c=1 sm=1 tr=0 ts=6a5f7329 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=74fUUoaEURcX_QxnTv0A:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_02,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210142

On Mon, Jul 20, 2026 at 04:25:06PM +0530, Rakesh Kota wrote:
> Add the vph_pwr fixed regulator representing the PM4125 charger output
> supplied by VBAT, and add the correct per-group supply properties
> matching the actual PM4125 pin connections on Shikra. Also add the
> pm4125_s1 and pm4125_s4 regulator nodes.

Why? Don't describe patch contents. Describe reasons for the change.

> 
> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi | 33 ++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 

-- 
With best wishes
Dmitry
