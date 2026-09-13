Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A1C8334C39
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 23:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789342267; cv=none; b=ICXcjsxG8E1NNSRZG2Yflga24hHJetmRh6xELaaci6Yvv4xIskEEDENWm7RGFMUJIygSpmrQByWf/J9Uhb/B4i6a3ck8YyZQJnHL8s3aIrPxdZpYNu0xpxy7jNvquPFPFhCabt9031KSS0VPh+QLQsU9PrzLj04hz2D1v6t70rM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789342267; c=relaxed/simple;
	bh=9ExU84slyAwDQlKmqAhicl+Xj5XhAq8i24BFAYfIM1k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V6FlhWpRdPZT1ibnAzhKzr4ywUwg4/GFqXQ/Ch4Pjtsf7PKGElgPyXQMMi48Q8jaw+lPkZLGPt7iHFRQ2WgfO198JuHa4dRh/IwED2sDYNRyKAEeg+wnNh70Q7lcpm+GSI7o5gjxeH9YlD/cNNyait0+TuM0NOOeZvyI0iOsqEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h6Z0H9Hc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SIEeG6mV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h6Z0H9Hc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SIEeG6mV"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DJxtIl1986377
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 23:31:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DNWkY13/F7vQQirOcn7RyLrj
	8L/7ZC6/5Neaz+9VVak=; b=h6Z0H9HcHEhQBaja6fkvXBbrNNPS9rFg+FpgaM6/
	faehEqp0/cj9WrrcglZi+FVs6s3GYk0m6/+uh1ySJ07HvMB9MEqfit0uNbrdX2Hj
	FbpF6MJp6HX2y24ZL5YMGg3eCdleotfk3u/QpjwLSqfKthfQG5Cc5a4V00a/APr5
	xFe7nQLUoPu6uX+UH21axp829CT3l3M5Jgs4LFdDd5wDqRSc4ozYOz4qxaAplHAr
	EPGPTpEnRSk2ynvKstsuPuhFxntWtXu+P+89BLO1YYZfaijKFL5XD1Mt02aOHfbJ
	6usUxLdxxWYJaRBX9IvzbRjiuNZplDAoZ/CLJbOPe5xw8w==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9ccae8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 23:31:05 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c851df59edso972480e0c.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 16:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789342264; x=1789947064; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DNWkY13/F7vQQirOcn7RyLrj8L/7ZC6/5Neaz+9VVak=;
        b=SIEeG6mVzvSQa2MmtfDyupL3Q8jyeApcXtGl0AUqCYN2oxfMsBRC8y/fxSo0glVfxG
         apPxjZwdwTxRqfEzLyPM7xsB8iiX1ZTtezQeT66J3b0wayZHsirawUMZpADKu9HDMVwp
         uzs1Z++plAMSSHY1dUiVmamyuG/lr6pvNheAknk9u+AVRGnUy8dMldOBGfiXLA1aZ3Ij
         +pGAm4qXDX3LOoMVkL2t5YmdQukzb30/+Y0WtDCRbVTNmFase40Hx6rtyXvsLK2wudMY
         FjZoNRqMBArj8UNPtlFMD8n1dWPomQKtId8qSVWxZ+7JMko4/wHwF5VIs8JZVqE6Q7X8
         QHPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789342264; x=1789947064;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DNWkY13/F7vQQirOcn7RyLrj8L/7ZC6/5Neaz+9VVak=;
        b=VcWJYxZ4HG2z1moNJoq7PFwCbHNFT+mbdGs+rcspNKmRIxwqL3fhhxUpcMCl5eol/B
         9/9SU5cGOJ3beiP+6v/NH+sQds0Bd7B+w6RjhI1vOYHQN/W4FVoC0s2zvtHYkrGIpgc4
         8iaWvdAo2r/UO692Ok9nxeWcBYR7rlrDshZIAkenN/GB27UiVllvEGoA1QM1/LVRhSax
         IMYbDetT14X9jt9gAL9fq4YXkpSSesqIm3tAoWx5Avl63/XvXTQCvSrZ/KSwXE2ckU+K
         mtoPcszwEa1QpKJIMUO6KRxPQwpJdW8HPgQb3XxRAnPGwpXMtnAt+ckAAGuxV0InPReF
         kExQ==
X-Forwarded-Encrypted: i=1; AKwUvByfz+ltZTuAnZLc24uSEJBUyeRa9CqJYadgsp+fGE7nnjURt19xHNwG/4zCJL+Wwx4nkwW+ExTAQSUDrl4S@vger.kernel.org
X-Gm-Message-State: AFuF++lQtNqCwZB6QyO6VQPczP5ItI6E3PeOPzA4I70P84wwhHXS53aZ
	wY/KTW8uNyFeAaXQPoJf+e3a9kpwCFWIg5xcl//rUK9d2pvMbis+xInnvcJEaQ6O5GWp8PkEluO
	0Sp7BrEtPegSemKGB5D1uNYbNctqB4VtW927zEwcPFoL1GsT+W2qsX4KLXK27ULf+KYm8
X-Gm-Gg: AYBFou1Qk4PFJlhy9ULbfnsQVce3H7/pnkNPpt0ytCj3NOeXXCc2xLm/3jUXIty0zNj
	nCtJlo6rKLA2EELlRMThIGXfAfetwzpuRxtLKxPqyIu28FjUz+oidakg93KaQNbqHUf3DsxFRaP
	ZD5Gxhv+kazTPRqxfidEuirwRPDbabUANZ7juAK15Cmqse5rYeuAWGzXg5XsJu/vv8NS57j2C3b
	4Plg/6y/GNuX19pZX6TAPFsryZ3h3W6Ieh8v2CC95rhm6fNBY5syJWd7RJsSxA9dsr78aHDNcdZ
	ClDTeSL3y+CTZ1rsnzpykhzM9o/hghcvNoCQc8p3cnOiiM801syFT1xm1i03L6SNGL5uvFwl2w9
	vN0NMg/+41sSHRdzGES3PAgRwe10VLoM0VmSz2xRRFszgTbAppOgYpuAy1Lg5RETza2CJYoxU16
	St6Oe+MgjA62W1
X-Received: by 2002:a05:6102:32cd:b0:79a:47f7:6cfb with SMTP id ada2fe7eead31-79b5c700894mr1565137.12.1789342264430;
        Sun, 13 Sep 2026 16:31:04 -0700 (PDT)
X-Received: by 2002:a05:6102:32cd:b0:79a:47f7:6cfb with SMTP id ada2fe7eead31-79b5c700894mr1537137.12.1789342263937;
        Sun, 13 Sep 2026 16:31:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a0456f85sm2019892e87.29.2026.09.13.16.31.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 16:31:01 -0700 (PDT)
Date: Mon, 14 Sep 2026 02:30:59 +0300
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
Subject: Re: [PATCH 02/17] dt-bindings: display/msm: dp-controller: Document
 Nord DP
Message-ID: <pxrdizcozxstimw6qortyrhyqdeicgdir5stjqxridexmeehes@wytomwupuxnq>
References: <20260911-nord-drv-dt-v1-0-e25c073cf1b6@oss.qualcomm.com>
 <20260911-nord-drv-dt-v1-2-e25c073cf1b6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911-nord-drv-dt-v1-2-e25c073cf1b6@oss.qualcomm.com>
X-Proofpoint-GUID: 1hE_4-ylCo2s9JQtO1AIBTAXMhwwCzcy
X-Authority-Analysis: v=2.4 cv=Pv4G/AM3 c=1 sm=1 tr=0 ts=6aa73239 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=07SeQkCZaLl9qT1boBYA:9 a=CjuIK1q_8ugA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDMzNyBTYWx0ZWRfX9Px+7u/nWoyj
 bh+0Ynld+OmMkADssngCCavZSBrPmmdenHEFUY5WoKxitdGMNrwY5R+r/xsh1l2pTTiybO1XkuI
 qvYhrPeAXhGihw29KdVD5M8AZE9QhBQ=
X-Proofpoint-ORIG-GUID: 1hE_4-ylCo2s9JQtO1AIBTAXMhwwCzcy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDMzNyBTYWx0ZWRfX2UefxGNpeXOt
 +M8XBrg0KoNB6AyyIcevFtFj01Hb1R7L5zryCYou4fxdDJZV1/6C2TnlJfrwbWsKxedT8U+mYMd
 TpRkYLf8EfvYlY0fz6VMeAQVdxANMIxdbmBufga/zC8kxRbRq9CL0wrgwrsasR7AlwefRgVEHXX
 sUTjEFOF2ngTT4/7g0P0GHWtIp4iEny6rURX3RsDm6yZPYgxE9tvaU6pBFbk5ZSObUnj0JC5Js4
 OGKeg25X+EMb0aymylMutYChww3tulGGxhZxkfG4W8z8VZ76EXB2y3G4oijY9y1Q9Ju4JgGy9va
 vM62umkzEC1c7oEePKsrKQ00LFLhxwSivOT15gto84aflEBlxjTMAafa1XmAmrQlo2l03CaIWWn
 rsxxdY5+yYOQYAp1sLNbHNPFID47A3e07XEz0+w24PtM0aMhbaPA6pyFbktXKgSwY5mkn7YZuGz
 YC+Ci6AAaX6lB28cPbQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_07,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609130337

On Fri, Sep 11, 2026 at 09:06:33PM +0530, Nabige Aala wrote:
> From: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> 
> Add the compatible for the DisplayPort controller found on the
> Qualcomm Nord SoC.
> 
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 +
>  1 file changed, 1 insertion(+)

Incomplete bindings. Check the conditions in the second part of the file

> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> index 094a6383bb77..8d980acb1a16 100644
> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> @@ -19,6 +19,7 @@ properties:
>      oneOf:
>        - enum:
>            - qcom,glymur-dp
> +          - qcom,nord-dp
>            - qcom,sa8775p-dp
>            - qcom,sc7180-dp
>            - qcom,sc7280-dp
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
