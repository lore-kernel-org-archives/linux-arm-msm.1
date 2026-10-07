Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D733D3CF2
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Oct 2026 07:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791357127; cv=none; b=UaUKe60zb/Fuy/AtjCGc667FfUygHb2B1poaC03X3d8tXXIykizPA74KrvviK461d1yeXiRLLkiVLabvbWUlJJ6sQP/hpv0UoAufCiJZVyBm3b2lBjbOxxZNNdQ8NDQlWKS1po0fCNMWFX2OuEfc+LaZvmAS25JY8hhHNz3hjh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791357127; c=relaxed/simple;
	bh=qfIGU5Nv0gjACCKSPLGWnaMvD/NktpDCP2N4rY9QGv4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l8mg2OCjnhWcK2mgkzVcCDUxoxBRxfr/hMaEDIqqx0WqNfTtg2yPY7Cy5GCKGZM8TXj/k9PUC1HthsLboMKSBSjEYa95Uz6Uz0hulhZI7J5Qvx2Gef4zvCwWEeI+8UnkkmCra/Q8LQWD6fFJ2NuVSolIAl1y6CxhJ+UbsGPCemw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IP25/w94; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y4FuEBdX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IP25/w94";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y4FuEBdX"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6974TwFl3923469
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Oct 2026 07:12:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3GX4DX9WHgkoCjexscTyxRsp0Y9v+fPY3Ro9VgKRBTc=; b=IP25/w94e84gY3+7
	bAA0FSOYhxfaZT80uGMtUqAm36yFYmE6tYipp3D8zrmSAUXrpx4enx1uJI6qg1ta
	hJW+JeVpJtgLdGFpVpnT+T/OBUz08P9h4fZkSD6xvd+vKAoNtL3WCgnsgEQn44fT
	2WSB5a5sYOEDR+672T9xJPdddEmgsLlpPaUtJtS5fbw1O/j0Ipjaepdk5D5IIu/Y
	TeP0BxnW2O3TN+na6G0Or2m9oO+sWABZXpsre+Hsum7UAJhp+c1dYqux2BzgoL91
	PUIbC2n7JRwpANKNrCGRH9calDqkNfaizDud28fIJ0335JXW1t/CciCxW3xT5Fwr
	wh1i7g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c7190qq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 07:12:06 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-398dcfabbf8so5754172a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 00:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791357125; x=1791961925; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3GX4DX9WHgkoCjexscTyxRsp0Y9v+fPY3Ro9VgKRBTc=;
        b=Y4FuEBdX9SpPckmQ3YhqoCCr8/rT/X42woqrjrhAGvO2AU1WY0XtrkFW1vf+hyr9Vm
         VGOOORal0ftD0ziomNVNfJ8N4g9vsM0sSkbdLsvb0rVK1SAtR3VVzbdCQjLepC18XGXu
         ZmVggzi0d/E+4qclYdT8eAhRBfffadYUH8j1CqGz2AX1oJCkqi6jZgF7ZvYOwPbzRH07
         qIvwNLaCadOVszCi+9NxJYaieOoNvF6r18fTpaWFSnL6CihSGtBMW0Kg/NIitmBYDyJw
         wSC7piQ4Av1aDoCSkd7aFI2Omdw/H1HhqtEZGvhKCDTYa7MlcSPNScAa7gZZaYCkt6vY
         yQ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791357125; x=1791961925;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3GX4DX9WHgkoCjexscTyxRsp0Y9v+fPY3Ro9VgKRBTc=;
        b=GGiZsQb70YC+Dy0FODD6KAaKrwkLH3Uuayh6bD15Ct0C1LcCqkmXg4SyU/18eeGDRK
         l0bpxAuoRXldUCF6XAaHzXeIEgPcSAimVKmCaTvgMo/4UJn4sBeaqUOHR/CGq/6pjTFk
         08/1gEow0urxQ9biLjTMkJ+y4zHeVi4HfmFH6FUEJBSYYbqqUag/K5OA/vwbkMtCe8Xr
         3HDT9B8+JSuZZUgorxbRmJT8Z+TgV4Co6GjWDHYO2q+iTtLqEKniKK2/dvjQlXUIbny/
         InJW3Lg9258ZtchTGGWKPTyYPU7IwD1M/REiyyy5lAlT7HSVmcjrIvbUFzaWPB2EWK5S
         NGxQ==
X-Forwarded-Encrypted: i=1; AKwUvBwnu2gb+OAfoZnXuEI/+wnNhSjorBVFvAwbrNIydYgA5zyosWxOr6TCXSdXLnzz/v4V8Xle4oNfAHIzT2v+@vger.kernel.org
X-Gm-Message-State: AFq9FYIXv8rV78O5LiAgt3C/XdUy9KVLMCgcAZvmQKLG9QdtHl0eYLzN
	qWuAG40pUfjKA3TWiFogv6Y5ZWQG3utcFNwVBZoQm0VFFDWUyBRjrxFmDWGww1ifQ6EQo1SDgLE
	7syrGtPXJJgp8utSe9rTE7dROUm4wZ/SYHhVN+OGqAwWLZL4nyn6yoEtuJnqDLnnr9teJ
X-Gm-Gg: AYBFou3B/YINNSgHC3o+m59EAsw6mj87n1QpSoEtW8zDvCj1pOgakC9NgJbEVuuLzPL
	7HaTkXpCcajk/PhJzkRUZOj76bpBnVqIcn0hNNEm1YPAx/3sZVmzik8cBigCSJM4YZJQpXHI+Zx
	SPIY1KLIKC9P5Oyr+gIT/ayZIJIzyp+zZvkPBcumR9p/O7TNQqhWonWcD7/8IrcnKuSeiwtXI/l
	KXSdLhuIexU9wqbYOyTZy3GbtYpsWYrMnphNwv8FLJvFGSbnZJYiy13UuG27YTowT8tU6TSMtSB
	RLL4FCj6NgjosdNd6s7fKvi0BBIydQPxTPKblMF9N3K5YSnYGWjYnfa267gMNCZ+ja0w7lDiCfS
	DFk8RYbOVQRg+ePl3M9zt5VrgHnZbA7Y4IciqeIfWLiYNRfNb2gGpfKnx9cOGcJLyyZu9vM/uEk
	owULqRjksMuDtSN+bTEDN+/z/QpsU=
X-Received: by 2002:a17:90b:3809:b0:3a7:8350:3faf with SMTP id 98e67ed59e1d1-3a8a17f850emr1227712a91.18.1791357125344;
        Wed, 07 Oct 2026 00:12:05 -0700 (PDT)
X-Received: by 2002:a17:90b:3809:b0:3a7:8350:3faf with SMTP id 98e67ed59e1d1-3a8a17f850emr1227675a91.18.1791357124810;
        Wed, 07 Oct 2026 00:12:04 -0700 (PDT)
Received: from [10.79.117.106] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a897a22610sm3843683a91.0.2026.10.07.00.11.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 00:12:04 -0700 (PDT)
Message-ID: <245e5eef-e18a-4ec5-b57c-65e561101351@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 12:41:55 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: arm: qcom: Document Microsoft Surface
 Laptop 8th Edition
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maximilian Luz
 <luzmaximilian@gmail.com>,
        Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        dri-devel@lists.freedesktop.org
References: <20261006-mahua-surface-laptop-v1-0-406fc042162a@oss.qualcomm.com>
 <20261006-mahua-surface-laptop-v1-1-406fc042162a@oss.qualcomm.com>
Content-Language: en-US
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
In-Reply-To: <20261006-mahua-surface-laptop-v1-1-406fc042162a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAyOCBTYWx0ZWRfX5Sbj7jM3YhiX
 o46FBSSciWpo7xvJWVj1DvNNbz1xADsbQ1gnUwIfjqDSoY7gmLE2C+zQFZ3aBsDs/cRwKAqO053
 IO+hT5ZTqA3K3d4Z5Qj/e+hXSTtLCaw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAyOCBTYWx0ZWRfX3veOgK0kRaIU
 USqgg37tMfBVBxdd/1P4GgBpABmYL72j33sG6u8pYao6UAq9XuL7M/C2k4+VlANrkrcXVap9aE9
 zupAGV01eZORQ1tQpi4tZmV6S2TYTq1LOIwJLppMR7B/NHdT5nOSP0C7JGTpOgfCDQprdL5jgbY
 vVyA6g/VDQx5xlqP5w5FZ3K4TBGfmOU0z401j+Ue8wH8b4KEoN0K6LAVYYYHI5KwDtkZOe+00Jl
 2CSZcoAYEU9dV2tiEpZp0+UAwuY6XmYcT8kxEW51AAvj5nxsG2H7xjGx3RnDYevYit1ZI9viJiz
 N+MdIU/+CIu3pU7tRrTm4vNt7ABFEopi/e2jpFPejCDm9hHw9soIolYnXDn0mpfUFM3/5Hxrjbs
 Y1iI6jxlweLuU0VyxCtBILsg08F0mKxkjjtJkngrbhOJ3Aj1XY/XR3AMhfuxNJt4Bi14etI5xAQ
 pidDnkzHzA2ZVIYp1zg==
X-Proofpoint-GUID: ka9_lb7rhIBM-bVEmX5vRfynywW3DnvB
X-Proofpoint-ORIG-GUID: ka9_lb7rhIBM-bVEmX5vRfynywW3DnvB
X-Authority-Analysis: v=2.4 cv=LvYHWXdc c=1 sm=1 tr=0 ts=6ac5f0c6 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=yMhMjlubAAAA:8 a=EUspDBNiAAAA:8 a=jx5OK0JlhDPw0se3NWkA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610070028



On 10/6/2026 3:20 PM, Gopikrishna Garmidi wrote:
> Document the Mahua-based Microsoft Surface Laptop 13.8" 8th Edition.
> 
> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
> ---
>   Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> index 121ca557ce1e..eecc00e2a718 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -191,6 +191,7 @@ properties:
>   
>         - items:
>             - enum:
> +              - microsoft,surface-laptop-8-13in
>                 - qcom,mahua-crd
>             - const: qcom,mahua
>   



Hi Krzysztof, Konrad,

Before review, I'd appreciate your input on the naming.

Surface Laptop 8th Edition comes in three sizes [1]:

   - 13 inch:   Snapdragon X2 Plus (6-core), UFS storage
   - 13.8 inch: Snapdragon X2 Plus / X2 Elite (Mahua), NVMe
   - 15 inch:   Snapdragon X2 Plus / X2 Elite

This series adds the 13.8 inch model only. I named it
"microsoft,surface-laptop-8-13in" (mahua-microsoft-surface
-laptop-8-13in.dts), but that clashes with the real 13 inch model, which 
is a different board (UFS instead of NVMe) and will need its own DTS.

I couldn't find a codename for these, so I can't follow the Laptop 7
scheme (romulus13/15). Could you please suggest the naming you'd prefer
for the compatible and DTS file name? I'll update it in v2.

[1] https://www.microsoft.com/en-in/surface/devices/surface-laptop

Thanks,
Gopikrishna
