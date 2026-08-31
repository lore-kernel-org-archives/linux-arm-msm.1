Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E73D149502A
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 16:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788193685; cv=none; b=I2cvsCr3lQjJqlk+6rXTxOmQpdtyLA5h3sP2NtxO3pT8+IOLC4l3fIICV41ag81tPQBjnXCkqe28Zwrw8/E2lCoPsehE81Jb4i5SiwI98HewKyCJ1Zme3lDrn1BJBMDpHWET6E8wz2FgFFe1u3wBPzqj3w+OqsWzYgSgHh7G3R0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788193685; c=relaxed/simple;
	bh=8ZR3CLLp2qDqIr4K1Ck+jt3CdaBOGsYcfqYueSifaRE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ReRe/0SNLxImKCb2NQgKY58SARY+k2tYktpelZJiUOeSRMK96i4Hooe6GyMNQUpGt9fuB05ChaXY7DypWlT54ab7pnPYoE6lkWD/ChrL+XtpTMuhtDL/pGpVoLxXgPcV8d5pA54cJWStIN7fBuyrNOkn0h0/yocHwfE0AWnGQ/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cQ84dMke; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=csFjk+Qu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cQ84dMke";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="csFjk+Qu"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VFq0uE2900842
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 16:28:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LkJ9lxCTtDvdCe5fxVE9tsx5zXvwZAtV4NrQpN1u2Ac=; b=cQ84dMkegfNwZO1A
	ISmP5JBgwUNkXh0ttbyAra6M+RF9f0Uc90yO/hDqUO0c2UxfiuH5ypUOa87owTbv
	rfydUmufXVZHNTrHbGRBfRekOFe8SOKaEK+ZaD/lS2NRiTJciBAljC0qY7MWmv+U
	oioopqJICC7HZH4iBagwsw15YSppKiBxC4lKKxGE/ZKYOIUvuMrr+V9jqiev5h+p
	fzLKiKurVDfia9bRG60GS6bzwcl+q7ec9Oc0L9ipn/ZgL9UNLrKydHkfLnZrSrNC
	0krTSmUEiBuQssOB0oEg4M0oWDCk1JYcCvcLV515n3Cg5Sy2n5VeW+5NdDY41mwf
	kgR6Pg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd6vahuba-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 16:28:03 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9349ba88188so97957385a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 09:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788193682; x=1788798482; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LkJ9lxCTtDvdCe5fxVE9tsx5zXvwZAtV4NrQpN1u2Ac=;
        b=csFjk+Quc3IxYDeBWx84Q6pQBI9MU5RyAcxgFQ4Acu25ySwzGdF8xFDen4hRyOioob
         VGGaC70JtQiwgZ222qlmYzfySmnlrXPoVNCvHhl5LG3WW5TM7sIXJz4Pk2eUmqUcsCsG
         rwQ4s0YnHyY82/WKg+LMdkqpIxgsaHxfIO+Rn4Cy9iciLQYy/E8FpTnoameHKOUdDOWW
         k9CeUJXn1Mn94Jwfzwz3wQQxGRsJxHVrrEuqsWBBimMNrU0vGPR+2wSnFqFryCxh8lc7
         pDe2geYsYohzoyt8rnMj+NSBFyaI+M2iroG41tCXL8PMIasx2GHfUtON4xqWwdoBg/PX
         Mj9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788193682; x=1788798482;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LkJ9lxCTtDvdCe5fxVE9tsx5zXvwZAtV4NrQpN1u2Ac=;
        b=eFaAuQwHx2fO8khmOC2FJ8grUZJglowJcWWNdK3+w/PpFvHfJTO6gqdjdMTRtGsjpo
         7FlETTvTpl8S9G8WKVZeKdYVfXuBbSpUMul9aeN5ayNlDWRp5QPQCgtCdFnfe1hyhTUG
         EiIz14q9lmjWrv4n5GWH+u5llBNDVBdWHXMV428UqijAAh2eoIXtTCCRhEuVoaJmKFOT
         G0O24m/TV1m7k0b7sdxy6ZaEJ0ntUPQTphYGOUKJwvjFVhC8OS1ryZQan/vUolahzzaM
         2NESQuQhRlpgPI36JFsOV4G2xRcVNEy+0yhhaSWUhw+PUSrimw9QLsAeHaiaSU58WQCl
         wHaw==
X-Gm-Message-State: AFuF++lP8V9TZaWq3gfTwg+OZBouNVHSeloK1BHqNoJr8cXqtmshPnGn
	IMgrIQo5489rC3xAYhxIeqkHizWbBEOpOFwSYS7v6MHPi733b/jve1bg9rUR1lVRq2OTuFLQyRq
	2A2iNISnrKc8X0XfSRnZd58ikBbZQeABXC1FPDPqduFpytqdTgVUDSeaL+IJN3dPXlyjC
X-Gm-Gg: AR+sD11wXt6V/VPsVcAyM2P1frCQDye23Gya999RxzmCD5x6s54bYCHAFrEeS9Lj4S2
	j1ApDGJlWgFD/Bwf3KHnT60qlt159aSizD/XH88VqXdB3bmsuX/oqBwF23m6vQte32MKLxD7iY5
	2lt5XHZYN/dQ/AM7AAMGxTa7MEz39s3eCQUxFrt/+vMKuFALMb5l+x+M+JKDJ/vpdDsiawzb22J
	pehxy4KWsM3ofNDyHV8i7yieJOHk2n6BoeOOvQqy1lJjVQm1JXcsv5Up2HAJ+4MkRKAmQETUF5x
	ReXP//vdy5QYEJE6Hy2bv30e9o+UQ2yG2yhELtSVLTacs/f2GGpuYAIU386ENZYDsG8R6vrA7QU
	Jdmk1c530KhlhbyACFRI8cQ==
X-Received: by 2002:a05:620a:224a:10b0:939:3fce:1a60 with SMTP id af79cd13be357-9393fce1addmr278260685a.0.1788193682030;
        Mon, 31 Aug 2026 09:28:02 -0700 (PDT)
X-Received: by 2002:a05:620a:224a:10b0:939:3fce:1a60 with SMTP id af79cd13be357-9393fce1addmr278256585a.0.1788193681450;
        Mon, 31 Aug 2026 09:28:01 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255f1b5a4esm464039466b.32.2026.08.31.09.27.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 09:28:00 -0700 (PDT)
Message-ID: <3e7c4364-db4c-4db8-b37a-c9ed78bbca3b@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 18:27:57 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC/DO NOT MERGE 02/12] drm/msm: Properly handle
 msm_ioremap() without name
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        linux-phy@lists.infradead.org
References: <20260828-drm-msm-hdmi-eliza-v1-0-67843277de17@oss.qualcomm.com>
 <20260828-drm-msm-hdmi-eliza-v1-2-67843277de17@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260828-drm-msm-hdmi-eliza-v1-2-67843277de17@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDE0MiBTYWx0ZWRfX+H6Lek3LjT16
 u2/lZNNsEWwEKaOv3juRQSUr0AAQtQhbSgxeRCXJ2Hgiyr7LLuwtMqpllFgqlEoEOJbX/cuHyEa
 Xr8Wq9uo6MwNLbnBGMKgXeIAQzZCy6B4k8Jz5t/n+STiqarvqU5iWZHJ7KSAyZYeUxKMJLNuso1
 gLBU/1cNzWC4Zq8BGPeRX32FehbjnAf8yNd/fXKT5d0C0xewhBRIYRZX7UxY89KJsunJjUCMYem
 d/R4X6s4IHv6B9P3wflWBURgmiqVPtC2RKD5l7bx+J0NAe94IdNrwtwtPvwK+D2q4G2BxB6YvFu
 Ib2khOMLutuo0gh1Gi36MYU28w19TOyUDMvGsorGYUCFjUJ9t/pluh3ztCj4DGSaszcj5v5XxnV
 IJyknT0Sk99Bg9znUtrs7MYbOO6xNzp1IEixYfTSrlbg4yvnE9l2T9aiiFocgK89tvb1BGPg5uS
 HQSmPAmOdb+hL3YdM1A==
X-Authority-Analysis: v=2.4 cv=YYmNIQRf c=1 sm=1 tr=0 ts=6a95ab93 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=20nyjBPLO04NUT9Gj6kA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDE0MiBTYWx0ZWRfX0O9Ff2wNxF1a
 8y1a5Lh9QSdrRES9X1wuAGbFeGziXK3aFv5e6TL5SthFZsMbMfG4oskBMbZy2m/oWNa3qFtoxf1
 wr9QCqjCld7ViPYez1MQ+m3eJnBiQhI=
X-Proofpoint-GUID: UPTOyrlmRDK5mgBSEX7GJ0tvSybuq2Cd
X-Proofpoint-ORIG-GUID: UPTOyrlmRDK5mgBSEX7GJ0tvSybuq2Cd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_05,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310142

On 8/28/26 4:05 PM, Krzysztof Kozlowski wrote:
> msm_ioremap() accepts being called without name of the region to map and
> in such case maps by index 0.  However error paths still use the name in
> error message.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/msm_io_utils.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_io_utils.c b/drivers/gpu/drm/msm/msm_io_utils.c
> index a6efe1eac271..93b94e330cb8 100644
> --- a/drivers/gpu/drm/msm/msm_io_utils.c
> +++ b/drivers/gpu/drm/msm/msm_io_utils.c
> @@ -77,7 +77,8 @@ static void __iomem *_msm_ioremap(struct platform_device *pdev, const char *name
>  
>  	if (!res) {
>  		if (!quiet)
> -			DRM_DEV_ERROR(&pdev->dev, "failed to get memory resource: %s\n", name);
> +			DRM_DEV_ERROR(&pdev->dev, "failed to get memory resource: %s\n",
> +				      (name ? name : "#0"));

nit: name ?: "#0"

Konrad
