Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F42B3B95F0
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 23:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789342205; cv=none; b=at3GlC2YYUBq1IY3lkUUfKVv/mdyrQt9vFPSYEalZsx5B21HzFesZPrTcrjvtlX9rzQly3c/mv6Np27XStm13NUq9RoHEyZsAeXOvexXNZAtQCeQpdRSjtma+fTco3xLFdR6g+QsUWOpnDeQdGpyfnzfpWJtBh6+uBzJ1zGUeVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789342205; c=relaxed/simple;
	bh=KoKlgFodyMeMDkO4c3+6PwiXXy554h7lVzOO6S1/7pU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TGpQSWICkRXO3mgHWaVnhHyIoJe0BxirSluq/InhnhkRmttbykyyRCKzI5AE0oTI0VIOuZnKcreQRcQt8GdhIHXtos3OQ76qJdctUroXmW49WzIrTXbL6dCL92sCOoBPvZlnnG6hTcegVCUpiQnhYri3D4VWmXOSJ+5Ot5iVrng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BLIn0b1p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E1ExI0ls; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BLIn0b1p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E1ExI0ls"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DJxn6a2632058
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 23:30:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Nj6aKZsVdCtHBveKqJbFsHIv
	5njnLbiwoSwtuNudUX8=; b=BLIn0b1pzYHzxP2Lv8g7Ru4r+UzUaWwIzfJTe7C5
	Gco5h/Y/50+2s8218SsY6pJwkOj0Tj9Argy9lEkx9KeQY9BB4rzOHhIPt1Dpsbns
	tcMOrz4D9I9ubaNrCCi0sKJmgE0xDEK+yiAkZFiQnwhrOFcvQddF4sWcTKFu80Yy
	w15BITzYT6HFX1S/xuzogHTDpVMaB66o3Zzjiix3Dw4dZM7UBpxRT2qeoIa8LMyu
	gfYUAS+5wwpbLlJFMyl5eUP/n/xnd+xFgIyvNwGJLn44xqT6TTsqpd/A2TlEFfZu
	RjmIqTRv+dtfv/4O8Qiwd+v6KUfuZUQXlRuV7ATNJAj8fw==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9c4bxk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 23:30:02 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c7ab4af214so780181e0c.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 16:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789342202; x=1789947002; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Nj6aKZsVdCtHBveKqJbFsHIv5njnLbiwoSwtuNudUX8=;
        b=E1ExI0lslKfvmNUatN9LYa6P9ehrZjL4POGZMMMcfbpNiT2HoUCIaRW6bdaQ4EzDVP
         QFlC4dZ4xZqjiL13MlBR8MvTI6GTtODFU0nAKbsxI5khfhQvz5EUgSp75GDcqZDUsLu2
         zgccU6TUFmOqVNz84apZK8EMksALkg+uw3zmhib788By8Bobx7ZNBZYgdnU0Wd0HLNkt
         7J6m+nbd1sHFogPvU7YWGLp0CMTux3uiBBfPf7n29KpwxjT8S8zV6R9g4lvGSGQpe7ki
         ljLGZ8O1xn2eqhYUzmGe1qb5ODANnbpd0rUeu/p44PrsuZQsB8YRycJrGzT0yE/0vTef
         3dUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789342202; x=1789947002;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nj6aKZsVdCtHBveKqJbFsHIv5njnLbiwoSwtuNudUX8=;
        b=fe5EiTldrY7UKlkOUS8OXO3RezqbqjV91RjDE8adfS3fO1OGJ7oJvNTFAKG6VxFevR
         RDoQMgGPIad5/1ZJXQh4VmyuET5Vj6gtnBQgGx+UlVKlHODN6NJDCHYtk8LMCI9WgwiH
         q+Ct4VkWbnXjGELiwle3Fdaryi3hkFPpkDX4/StLqjghfYwCfdBDvHYYjA9XBf+YbCS5
         YiRJkPKKFIJ8DBv0j1i+rbysUSTPLivMBc+NT10dpBHGsz3tz9JU1jhZJUnDKuZRbpnm
         GFNEj0n21oCcrXHlfsUSk7SZqkCxjXQ50o82sL0iSpN7oHCaH+PNAL/oflIZ/rzIZAAa
         w8cA==
X-Forwarded-Encrypted: i=1; AKwUvBzivIjKH/yrCDytZi58YlCPWrqIeybBFPAd7WfFYWN/QIZyIVKbuDBCFvoEq9DijqyDe/M8GyJpAONemtM/@vger.kernel.org
X-Gm-Message-State: AFuF++lTwBskdpTWCIuJhNPYIoykXm4HHsWW5X+R6OgduzLx5tplFhXC
	Zec7WmTFDqSjidA1pIoaiMiQa/JWXX3xaugr7BhAjjsz48T9qAqqQum3gAWNs6VKJnKJ77vmaLE
	H0mbwlIRFfs327OyjXG+9xUKTzujCcVnsJ05nEtMBoN3bIYo2Nj+AGq4tsjjFTE3jn6Sj
X-Gm-Gg: AYBFou1htGx1rpYZGC/oUuDHyKDh+M3jSOKRP9GxkEATiCDiVY5WSfbW8dobS7VJtJk
	TeptCSsIku5j7M386PYFIU9Yz9aRy1J4ZuxjaxzDp+9wRJbgEePqpI+xbW6iaWd0+8y1KW1PUXN
	rC7EfSu2m6tYL1P2kpx6y0OdS//2LlLbD1WPiWfbAArezSab+u7LYwsuWO8+t6LDsOnChF8TVGx
	5hxxrfa6TJ9YLQcIszFjJu+pfW3cmUXmo5SHrj0nka4WtDNjySTT/EYFp9cNcrWnDm2+UGiv+2+
	vTCWilAOhEEGwfZAIIC0f5GfnumPQ6nCyCoTWwPUHwtIbJfhvyppQlk3RD1ukk/lPfAErmoJrbh
	BUSj72JWXvTjtSuXYfDc6jlQuHBJAob9Q81ajqjmafmLJ+L+hP1WICRh6Cgf0OurSPclwDfxVBu
	W8t4hYyej/CArW
X-Received: by 2002:a05:6102:5792:b0:792:2a1e:f9bc with SMTP id ada2fe7eead31-79b5963e001mr7189137.6.1789342202028;
        Sun, 13 Sep 2026 16:30:02 -0700 (PDT)
X-Received: by 2002:a05:6102:5792:b0:792:2a1e:f9bc with SMTP id ada2fe7eead31-79b5963e001mr7177137.6.1789342201620;
        Sun, 13 Sep 2026 16:30:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a5a33042absm22708231fa.14.2026.09.13.16.29.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 16:29:59 -0700 (PDT)
Date: Mon, 14 Sep 2026 02:29:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
Subject: Re: [PATCH 01/17] dt-bindings: phy: qcom,edp-phy: Document Nord eDP
 PHY
Message-ID: <evvgtf6b46zqpolvybz6xfklakgoyv2llnvawrblgz6np7viza@gtmqflkwwmgk>
References: <20260911-nord-drv-dt-v1-0-e25c073cf1b6@oss.qualcomm.com>
 <20260911-nord-drv-dt-v1-1-e25c073cf1b6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911-nord-drv-dt-v1-1-e25c073cf1b6@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: IjtX6g0dnftLzcpUD2orLqof5OypfgSF
X-Proofpoint-GUID: IjtX6g0dnftLzcpUD2orLqof5OypfgSF
X-Authority-Analysis: v=2.4 cv=c5Y+0h9l c=1 sm=1 tr=0 ts=6aa731fa cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=07SeQkCZaLl9qT1boBYA:9 a=CjuIK1q_8ugA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDMzNyBTYWx0ZWRfX0Dr3KkQOl3f8
 4Mjw8cFZok3P7hqk5aSzZWuoEUlQRv1vuG65+PDyBGeJa5yN9NBPY8wbSTKmzthOSMqcjs2llUE
 +EERVzR6yGwDSGs9i8++OrZFO+u2dX1hS5SCRvD7tZv2ad21SliB8SKb/K6ZpS4P0/sRw6c4xZO
 PViAMV4X96BU69NzX1QG3ItXEZgObLcOY4oxiogSOva4ApREkMmscbL6r3Hv3qmlvLEfBygaVSk
 m1ks+YuGWKsDqB/k3pD77Nl6r+PmQLzJqOfUKi1OD3pByQit5JRsOlwgH0fbfiIruBO6ZOKRkUH
 evp3v6JAG9YjNLsjblJT8IDFAylyy0z9EJ/uPzxPF5Qdh9utMN1Qhw6tiy/PtPaDrvlkeSokPzM
 Cnzn8AQKLrCPwcRsNWRZoTLtPwsn/eSYRXvpgy79HCducxI8jjnrmPXCq1INSOJdptccaimRycj
 MEt68ZyYKt5MoFpi+Rw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDMzNyBTYWx0ZWRfXycMD66c4xTdt
 8jKEmskGD2eGcHKHtGT4+0nw/b5F7JRHg3xkQLfY0T9w/JRe/+A39Kh/wWmmsQZyqMTmRIEh71G
 GWGv3H9xmkHd0VVrBYtoIH+O6ETguDA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_07,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609130337

On Fri, Sep 11, 2026 at 09:06:32PM +0530, Nabige Aala wrote:
> From: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> 
> Add the compatible for the eDP PHY found on the Qualcomm Nord SoC.
> 
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml | 1 +
>  1 file changed, 1 insertion(+)

Does it use ref clock?

> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
> index 0bf8bf4f66ac..91d7a5c8e19a 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
> @@ -19,6 +19,7 @@ properties:
>      oneOf:
>        - enum:
>            - qcom,glymur-dp-phy
> +          - qcom,nord-dp-phy
>            - qcom,sa8775p-edp-phy
>            - qcom,sc7280-edp-phy
>            - qcom,sc8180x-edp-phy
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
