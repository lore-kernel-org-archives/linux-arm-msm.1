Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793619961;
	b=zJY+rirAbawYhh2CCeTXTMjpzr9kqFTUIOYsaytEyxdadbDeMvqKUj0rYZvYPDFk4fdG
	 9EGtFaQeQGRBHcICKIkVoqCjpYlRqJ3kYHzsIgpm4OXudXzyvTQNyhITDoM228W/lga27
	 lK8NCxf0FHw96E1/ggJ4VfOF35gCJ9p1L4EBAEQfuvB/mxSMziG6jStyS2FMEUrTbfUTp
	 h8057lxQpyhg79xloAOjF4L8IF0P6rPvJZ2gYx1Tc5Fnypj35yFs8dQyMf0IeitF1fDlp
	 ZECqN0h50LxpMvC2Jf4GIu6ojZ+mz466Z7CteKCpJOUe6824HpmV5fPXzAXkb7nAuEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793619961;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ZWlFwcxl2xS4n689x8a7L4fhFq9uoke36N6N4X0UXRU=;
	b=cFy5bmNICadjezC1eZjLFldDMvFPCwMC1Qp5juDVSH2NFRsQWykENnSXKqpCWVK/cVCb
	 WC4hjJQrTfo5cXomNZem3PKv4a7ORYUMP4ugw8cLSjnQVqL54AmjisHjM/7sE/EWtJLVp
	 KmvUrKNu1pxsC7pydAXf3aymGkH2AzKLIkUF7PkDxg/fbkRbvh3xJR7xgbaKNyD654T4/
	 AUCpaRvRjdrIXhKLOiMiLmYTbVdJ3BNOylNFT7JPxuD2xwGn96i3QlHhlWdvIKO65BPMt
	 eooslc7Z/mw7Db4BwIskpWl+eoPPirgUamHV8OCX7ieDDSZfbgBvKjmGIeO0m4MHPWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SBEApJVi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f64+2Ohc;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A1F606A327
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 11:46:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69A1F606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SBEApJVi;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f64+2Ohc
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29A96U4039353
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 11:45:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZWlFwcxl2xS4n689x8a7L4fhFq9uoke36N6N4X0UXRU=; b=SBEApJViBHSkDqW4
	JVisjVeacG339NzlxoFxJd6O0+T8qDa6jW9eYnuWJL84ZiI6z2/b1SeAM9oXP1uW
	SF8/qI5ioqTv7UfMIz4Ay99lT8EISO3zL8+b79xRNSTrZYn02K3WP8DW4CJn3KK1
	7376RSXCa5A7D9pJIzNvoRupn7HuJvlpLZ7N0uKCtIi5k0UOJBCdeyaZwUPjMlhy
	hd0yi5EX87hv5JElC775RIjE3fKoqL8PGVAOsMyOth1XebP3n4xSRdzQuP2slCGX
	K8xPXO4ENMS3Vx10Iq/0G+7UlyuMce3xkxfFXULNivLoDxrKBluEExV8sIBVd3HB
	jys7fw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpph18xrk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 11:45:59 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91c83481504so5776036d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 03:45:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793619958; x=1794224758; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZWlFwcxl2xS4n689x8a7L4fhFq9uoke36N6N4X0UXRU=;
        b=f64+2Ohc+nBOQnsvS5CWWk5t8HRX4iGeDLQ0PnQ5cDrfE5W5ReMsJhUyvQILLhjndz
         21DMVJqmsZi2Lrz8xbZQynBWoOdrem5VjiafoInHlkJI37qFm4mqf+78dtvKkpX0gsvb
         L9P8XjueW8CH+xK5YHyA7rLbknNpNdnqXLaaIB4QMTbFS/eBGcnJJa9f2oxRq+cb+0Nq
         5E5MADRghMu6bkb7Hu+xgLdyxKFdvkIgdfJjs3GmI0xE0T85Ou01Teomzg7+eFvafgsn
         tGm9J/FBOqQvepGEfzPpURN+Y62R1G6pHnPDZvHbIG5OjO1hHfAoMdb7VpOExdORaJG+
         VcfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793619958; x=1794224758;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZWlFwcxl2xS4n689x8a7L4fhFq9uoke36N6N4X0UXRU=;
        b=jGWrWH1YpOT//B4UnorHefNQpQ8ebYN9gx3AX5Kmxs3bNmF9xC6mEE7nZzbC1VTAEc
         OqzJWoPkE7Sl05t7jisYgSrBt2V6QOxNdZAyFMkxKMGaS5Mz3YRr6RlsNH6gLz+N1zL1
         E33/dS0KM7+i/ZbcU+TetqRDcml7pLQWIbIYbNWlS8hAdx6nELu9W4zn23/UAM07p8f2
         U/JB/b0IlEHAw11DmTcW3/RvTuFuxjbd13yoGcaa11+DzKShyWpYJ9skEDfkGck04Rae
         w5uR/wpYIZvZ3svwNNDDqya5NGnoNY3N4Z/Qb6jl3mF2idDKWKqCeQ23Swjd9ojq8jOp
         peZA==
X-Gm-Message-State: AFq9FYJ9IK24itflWHeyA4YyP1iD9BlLHqG9mq9STLekPYDXxXuj4b8w
	7PhjwEuxD8DzYMDIvl3zhc1KnOKkDqoMF9EM0CmKi6P5PQNBlzWXi9IEWH6bXSYNwCR+VyW1dgA
	0v7gO1ZtiCWDb20Ttg7Rel6NdZN02uNo9qkB2Ti9esOReqMVnMhv5XlkexlsxVBWUyWOA
X-Gm-Gg: AYBFou1kFobotPyB4sH0myhmUGOajbPeJETrNxnGxwq0OU7G0US+nKABzld6NFQJjq7
	Jt4HjGhu+XS9NU1GLQIZ434/ab7cbKeU6030a/lmnO3RMuJsjC6cDBI8ib0dcK2LkJOLLDXk0qv
	arNwMXZInzlku9FeP6gcabie1LN6y+wDOXIjyePoeIIqSOPGrX1BNSOQBI3t5HXPARO08Qbxfz3
	l4QUhHZjIXPlxVPTK0PMUrlXGk2gH3YfuZAeHD9c4YT5DOPl0wlidhwLUPZdUW4l7VVQ1cFYQ16
	G3Vdh38PCK0s8wMQyN/Zdc5BhMc0xYMjNP66lAgKhFl6ouipBFB+LV7qkYb5W4X/y3px5U1QWpC
	KGAyfoJz0QXM+GRaOiAiXQqQm8a0S3LoKfihrMI8JtgX/AUdXAgXBIHjxjA8Iz+eZ+vE45rQ=
X-Received: by 2002:a05:620a:a7d3:10b0:939:8bc:8826 with SMTP id af79cd13be357-94421529babmr1591536185a.2.1793619958348;
        Mon, 02 Nov 2026 03:45:58 -0800 (PST)
X-Received: by 2002:a05:620a:a7d3:10b0:939:8bc:8826 with SMTP id af79cd13be357-94421529babmr1591532385a.2.1793619957897;
        Mon, 02 Nov 2026 03:45:57 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4eca0fbd6sm3168706a12.24.2026.11.02.03.45.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 03:45:56 -0800 (PST)
Message-ID: <34b84049-f3cb-41e1-93a8-786ccfc3697a@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 12:45:53 +0100
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/8] drm/msm: Attach a driver to the GMU
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Akisaira <akisaira@outlook.com>,
        Vladyslav Tymoshchuk <tvlad744@gmail.com>,
        Val Packett <val@packett.cool>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20261030-gmu-sync-state-fix-v2-0-89d3082d97af@oss.qualcomm.com>
 <20261030-gmu-sync-state-fix-v2-6-89d3082d97af@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261030-gmu-sync-state-fix-v2-6-89d3082d97af@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: bu7HF-3bEd7JJbflE4vvxV6Kw0_4Tz7b
X-Authority-Analysis: v=2.4 cv=IruL47/g c=1 sm=1 tr=0 ts=6ae877f7 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=_eAPKBbB64WD-mPM3f4A:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: bu7HF-3bEd7JJbflE4vvxV6Kw0_4Tz7b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0NiBTYWx0ZWRfX/pv042g9RE3z
 l+CkOSV472J1WLtkg66HmqsFN+PJyF90dNTyVPvcOifNhXD8PD5PopZ6uNxyZ97+7M1ZBLJV2U5
 xMR0c3WJ4Twv2YOgPg1RQEPfznT36nhj2MoFnXPZPBT6lzQHkgMUEoQpe6tysb5w2Di2yalOAbf
 /iyKIOyfoBuApJCauQnqW81HpK8fJgaSoOKNa/PYfq/BkylZd01AG3DlCWACNYmLf7OF9UnHTvS
 DXKlAbVM4/h0GGrST8dNcyXh9FcRbm4tKaIpevxbC7BWJhDH348449GdYwF2Q00y6hX3bbFFEnP
 sIhnmoj0iPDoe96883wzwTH17CvMeRR/JuoXwSjXEbqlOFV7Yq1U7eZ12eS2UeBCyAU/pIBKOYf
 ycS1G7TmY7AXS0+tnxm9tdgUdgDuSIUhdGd9uN9Rv8lS0Q0pj9Z2aA5kR3TXNv6IKwADXn20n7X
 saIoheGBO6xYn7uhrTg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0NiBTYWx0ZWRfX7tq2wEw6gDwN
 oozJs57LGdRqA8S1GCKVHTaBJvV1z6hq1G5cw98G9LgST2Zv4+su9ZUcyERHjv1FeImyFhnot8A
 8iGTFeC/+lQbVjoDP/SXG3dbBfXIeig=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 spamscore=0 impostorscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020046

On 10/30/26 6:09 PM, Akhil P Oommen wrote:
> With the introduction of sync_state in the genpd framework, any consumer
> device of GCC and GPUCC which is not bound to a driver will result in
> bootup warnings like below:
> 
> [   24.362666] gcc-kaanapali 100000.clock-controller: sync_state() pending due to 3d37000.gmu
> [   24.371210] gxclkctl-kaanapali 3d64000.clock-controller: sync_state() pending due to 3d37000.gmu
> [   24.380268] gpucc-kaanapali 3d90000.clock-controller: sync_state() pending due to 3d37000.gmu
> 
> To silence these warnings and also to have a proper state in driver core,
> attach a driver to the GMU and set it up as a component device for the drm
> master device.
> 
> Since both GPU and GMU should be bound to a driver before a
> devfreq/thermal mitigation request can be handled, move the devfreq
> registration to the bind call of the master device.

Can we do that in a preceding patch to make this one smaller?

[...]

> @@ -2308,6 +2298,8 @@ int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
>  		goto err_mmio;
>  	}
>  
> +	mutex_init(&gmu->lock);

Can we do the common init (just like this mutex init) in the common
function?

Sashiko has a number of comments on this patch

Konrad
