Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794405973;
	b=B5+rOGF7XwjvbpijaXx/g20hChObl5x+otp4yGuaQ6Qu41BuniHZezZbp6u+9UhTrDB6
	 3sufr09xUQYZep9gKWgz6473o1DGjfs+tADCy1gMKnN07hPA392rV4qrc8ALgrVZbFOHO
	 ruXBOH+MeB1vCKJuwJO2nhFbyPxn9kCjZzm4umq+QWxHfsqpIOXGqUTD4xePvkO73FOwd
	 FxbSJSoNI+Tcun9P0J4YT0sSkmp2BxiqWcuDQxGhmnQ8lnrrcqnYiYSWpt1KvGwaHekFw
	 MC4iW60GiMEsuwqKgzdRktaXRd4FuXGjWGZeQfU+m4AhJt+5LHT4CbwJErpo367etXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794405973;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=KXBhJCFqA5bIGvWFtXt6+Gu86y2tdB1JbBanpyQaxXM=;
	b=alKALkRLsQ1mUuJMiDnKZeZwnTN9t68277kFlYnh+NTPVd2FEyZXYkX3G9x2dNcYUvZb
	 K8zODhgQfhu95EOd1b8ucnm9HeQPp7j5sjTz+glQfLBnCdr68c+jaXn64f9tV2AOEzcyu
	 ifQnBStXVSjrKtXCdLaYpikXNfxlmBlJMGbRuaG0fTMUelP/iyxvpUjGls1BlP0JxHuFZ
	 oTWs6RwtVDf7ZKnXEKy9vA06ZsiikGaDEyRcgxoWpLimJo0jC9igXrcbmEszKTmIgobyZ
	 qgKMgj/f4bCtUxhyTaWEW7HT63aS0VPjq+8J9tSo7a3RfMjx6fONgLUx5hgXVsygbbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k3Bdbnfa;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OsXpbN01;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC946606A32E
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 14:06:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC946606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k3Bdbnfa;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OsXpbN01
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABCYv4O3291897
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 14:06:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KXBhJCFqA5bIGvWFtXt6+Gu8
	6y2tdB1JbBanpyQaxXM=; b=k3BdbnfapFZUICnXw4zScnfcFSOPWBP3oRH1V+Dw
	eg2ahj90B9K7ySGaeK60xw8hqm92X3/AQ6W6/mwTuKiPLsgVVikoyWrlpr6xGWmQ
	L8+jlPtBHQFOWm9vFs/gQIltMeYtd01HYEPFCE8/qCFTVHB4sX790VzH2qer2XNS
	5f9YiSA4EKbVrxIw5WSGRWYqQDkZ4yyhTUlcgoC9CipCuXTf9XjqXRydX4TyQtYB
	ixkSGXijVhYT5Uf1I55xSIFZCfvWFWeyxjYQRIKUPYLqm6AV2xNlHW1Qhmfq8tGx
	WlLaGsi5227/L89FAhmHv5FGD5et1b60gIIFhLOs9KvIxw==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvdnp2smn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 14:06:11 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5edf86a8c00so762278e0c.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 06:06:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794405971; x=1795010771; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KXBhJCFqA5bIGvWFtXt6+Gu86y2tdB1JbBanpyQaxXM=;
        b=OsXpbN012QHt1MH+LJglpqx92wGQnAISfMnCfg5zkJqwth2RnmepxdUzarOyHpvZUC
         XZ9DSHIZCIqr5l+ymkf6A6OJ2IyVyKnWumtOQOCQtCwCp73ERZqoeICFtiUPbGe05WDr
         2GWn7mnjQGYNlnzOCxOpL9+jo05PJod680W0Tgmk1eii4RhY4G2ynrbbWgWvYdGH6Nsu
         4BRLqYMOHy7sk2kcYs7Dao406oa0bwZFeGjTkN9K3fsgSiwUr36blu2ROeHkGxxVOB6v
         3qRGOrzq8w/TJMKOu/1To3H3HOz8wQT7tiEdhrdRwcuZ0WFX9oz79i+Iq/qt2VaaKQrs
         R6iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794405971; x=1795010771;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KXBhJCFqA5bIGvWFtXt6+Gu86y2tdB1JbBanpyQaxXM=;
        b=Nq1BsDIlLPaW0GG/kPRjjyv+fUGPahT6juWq6B/tP+6P39bKvGRdpU44xFLoby/xyz
         gOAoQLkN7TlXlBZ/MMkNTUhTWUOyzZ4HyzGosLdVWeGroBFyqyNHVqjPCAxSQaVuR0p2
         Yj3k4X/MCD9bztbqxtwCph2Tpq4PfPiXrOOuM50zhZY3e8tAkOujzr07e8Ply0FKj8ZG
         Tize1+1gKbF9hLSz1sneyROi9To/vzYZ90hjDQljsvz/5jzhApEOpOu+ZZshUdqzwaF3
         PmFB1vS9YYigdeQAcIQE4KvxM/ppN+rafNXJ6JfR8CjB0xQrJufsjvVkNc1iwenkE/tx
         i2pw==
X-Forwarded-Encrypted: i=1; AL+hErEtDgzSy3o9W7X3V85vV9GD2J6uY12xplfzbMkjnNuxc92QvxhiXXSNzFaoHpKbKXagGbyaozI4EEktlaOS@vger.kernel.org
X-Gm-Message-State: APuU4Z8uyOOsum2x8xKK9zX6BlzJ6e6Yvmg8d8/DWcUlWQ5x2LQvN6cC
	FAejk9BQXv3U26LdHZRBPYaq8qFvT7z063tNy4iavkr/qSECE7DKYjOIomy9EE72LdbEYvof/IR
	XAHR5MesxI332W3xAp1hXI4UsKTFUNPsXIhcLtZzTNATqTB+yqe3iMqFi7YKV8O80jok7
X-Gm-Gg: AYBFou2Uk/Lkpg+kGlbKBUKNFXC1qSIxbZuAoQC+Hc6y4qDsh/+7yRiNGHU95O1WTV0
	mOBGxv1p8y9lhq4Ig6S68U8+PJ6NgCdjwBhy6b0rDEKsS39DlbaHY+XVYnBj7lb25773EoFBPKT
	+pLFnarRnUrTCtOB8fe80cxshXuqKVMkU5nSMX1sFd7Gd/OV2ECQszukQKrTj/5WeFgqDPBlQVL
	hI4cnJjRux5s0+sLy2bTokIPS4SrXBma/fXg3pD+2Dp0i0WOD1TovUMoLKQX0w8Pl7mWz7uKtKH
	R0PIj55z1alY6YUxwW55HDZtZZLlP8JV/kK2MxansldPn8mqeXMh5j8Dg6GBb4d2DVix2UIc+Mi
	y5NQhLHrzDZMT7FhR7QpRI5mhN113V+JGCdDGNATRUr/n5J95kJCXG2WUfWA6a00Jf178bzybQD
	3pYCsrnHrHfAe/cuNWb0iR6/FcNusNGE3f/eij5GyU7PsHPnxksVB6QTv5Im0z6A==
X-Received: by 2002:a05:6122:8f89:b0:5c9:a60d:327a with SMTP id 71dfb90a1353d-5ee1c443198mr713184e0c.14.1794405970690;
        Wed, 11 Nov 2026 06:06:10 -0800 (PST)
X-Received: by 2002:a05:6122:8f89:b0:5c9:a60d:327a with SMTP id 71dfb90a1353d-5ee1c443198mr713132e0c.14.1794405970186;
        Wed, 11 Nov 2026 06:06:10 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c15776f2bbsm966580e87.0.2026.11.11.06.06.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 06:06:09 -0800 (PST)
Date: Wed, 11 Nov 2026 16:06:07 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: naidu nama <naidu.nama@oss.qualcomm.com>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, mani@kernel.org,
        robin.clark@oss.qualcomm.com, lumag@kernel.org,
        abhinav.kumar@linux.dev, jesszhan0024@gmail.com, sean@poorly.run,
        marijn.suijten@somainline.org, irlied@gmail.com, simona@ffwll.ch,
        Saurabh Anand <saurabh.anand@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        quic_riteshk@quicinc.com, quic_vproddut@quicinc.com,
        quic_mkuntuma@quicinc.com, mahadevan.p@oss.qualcomm.com
Subject: Re: [PATCH v2 1/3] phy: qcom: qmp-combo: delay Type-C mux switch
 while DP PHY is initializing
Message-ID: <xby27hg6ajesijmdclu7f2sa2swv4ednmokka2pbn7uaufm3za@czdij7j2qcml>
References: <20261111104434.2222182-1-naidu.nama@oss.qualcomm.com>
 <20261111104434.2222182-2-naidu.nama@oss.qualcomm.com>
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
In-Reply-To: <20261111104434.2222182-2-naidu.nama@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1NiBTYWx0ZWRfXwVVZK9KnMOhb
 d7EMv3cXccInxqQpotS3GMWygoSlfxkn/4TsZ+i26fulbRdfA3zu4Kja1Gb7PJzXU9BuePdxt0b
 AWt5AJ6OSL7eM7GuSh3+qUGZ7Q2s1Kh+zCOwgmhUseOj6SNx8lR9S3Jy0Px6+xmxhW8lDrsz1+q
 MB3qlSGnEd8aAqERu06KglYpsHPZHpIJ4Uqxm+c2cAEmJ28xg8HXOiyRISTrdnaKeZIvq9mYjbt
 V4tjd35aiORSRInoB4a8U/XPsPeBHRKzSTNOOk3LIk+cfeohSKhdMyPKCKDIMJjbpjCNemw8DY9
 b43/ahB6/1V7Ww32fUV2uvVekefP5/vUEd59XFQiO6vMKgTR+fbE1SZtNZh8SmBMzrQAv7sidND
 ngvhxsj54ULLgTnEVqzlI0jO+HUI5/1iDKm/XuQXcsbFPLlFIkz4dQec3pTyqOVswhoHCrR88Jc
 Tw7nHN1fA0dF8jPMLFw==
X-Proofpoint-GUID: -Ch9Atcb2k8HjkKcGewLDS8aoIwoVm5X
X-Proofpoint-ORIG-GUID: -Ch9Atcb2k8HjkKcGewLDS8aoIwoVm5X
X-Authority-Analysis: v=2.4 cv=NK1AaE6g c=1 sm=1 tr=0 ts=6af47653 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=hTi17YcZWSOoB4cLaREA:9 a=CjuIK1q_8ugA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1NiBTYWx0ZWRfX8IUiYbemQWMx
 5hXBhJx1Cab3hUzflGPBTpucohGFevv6gxxhkVn2XYRjFEXbfCWy50/VYqDxpx03x51dNita6uV
 HkMflpgIqBv7+qWjInSaARDY8BQjXYA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110056

On Wed, Nov 11, 2026 at 04:13:53PM +0530, naidu nama wrote:
> From: Saurabh Anand <saurabh.anand@oss.qualcomm.com>
> 
> The Type-C mux switch guard only checked dp_powered_on, which is set in
> qmp_combo_dp_power_on(). However there is a race window between
> qmp_combo_dp_init() and qmp_combo_dp_power_on() during which dp_init_count
> is non-zero but dp_powered_on is still false. A Type-C orientation change
> arriving in this window would proceed with the mux switch while the DP PHY
> is mid-initialization, corrupting the PHY state.

How is going to be handled then?

> 
> Extend the guard to also block the mux switch when dp_init_count is
> non-zero, covering the full period from dp_init through dp_power_on.
> 
> Signed-off-by: Saurabh Anand <saurabh.anand@oss.qualcomm.com>

Naidu, you are resending the other people patches, but the SoB is
missing.

> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> index 61d8b7a5ce8f..3f93043f94e5 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> @@ -5163,7 +5163,8 @@ static int qmp_combo_typec_mux_set(struct typec_mux_dev *mux, struct typec_mux_s
>  		return 0;
>  	}
>  
> -	if (qmp->qmpphy_mode != QMPPHY_MODE_USB3_ONLY && qmp->dp_powered_on) {
> +	if (qmp->qmpphy_mode != QMPPHY_MODE_USB3_ONLY &&
> +	    (qmp->dp_powered_on || qmp->dp_init_count)) {

Can dp_powered_on be dropped then?

>  		dev_dbg(qmp->dev, "typec_mux_set: DP PHY is still in use, delaying switch\n");
>  		return 0;
>  	}
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
