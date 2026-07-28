Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 757B53DDDCC
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 07:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785225233; cv=none; b=Aj09Ylcy6D32XmbtlbU23hevbGTkSXD4/LXT7fMv3qfYinfax4dvcsx3ZJ8+q3JDlthfgFzGZRsncCJYgwXmIwTxNVdUfl791RPBZYYtEcKSOTEyInlN/lWA1v5cS+TFW1Y3xxoHALeFUI7H8UCOkEEUzlcTvP9N6SN7A9Qs1pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785225233; c=relaxed/simple;
	bh=OtD1wBdBAGt5o8LyIVEQ/StYqmup1okLzQrHXXtukSc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GeUXWGUXOgMXdliba6rmFlUilSnprm7zJT1xxt6/XxiI2UZt//VyTO3K9GqPgJntFbqeIhUtCD+1VZdfIJi4qGmFt0gf6AUuLI8RUdmgX5XH4b+lU8mZ4pdITmQCu1N8JPCYT4zExTDk84G5O8AxmkL2wc/ioFrK3PaJzHFSQWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AmMxxwtm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VFkyET+U; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AmMxxwtm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VFkyET+U"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S6Yq8N1824325
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 07:53:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	utuyuAxHY1PaIfD6AjLDIYVdeOwFDZ64oCdWRPB/Vnw=; b=AmMxxwtmquKYOJMP
	dbiEZwDECfBxqWfjFzvvuvQzFFs+YqaEtjFIgF2Q5jYoo1fp6U8FYA3PqlJb0qmf
	kNJdYUSI5QuupRx9DVhIoWhg5s0Wa38SerzSnFPTQ/mDDLmk+rM+voaoV7qpM/xq
	1CU8mRJven8a24Weot7TO3Kg4POMNWNgk4O4/aY1P7mIMnblGsDn+ZZ2FaLkKxbT
	9mw5gl3oqJAYzzepQWxXciXHNzu9CVJFKsoj5BKFbAvnC/gOHSE6yrozh4ELobn3
	O9hmrxe7z4PszBazKInYlYEUclJ/huBUW9xS0xPp0Pj9ApLZSPvxkp4Ma0gsV1Xj
	LRap2Q==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpq9hgaa0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 07:53:51 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38edd45cbc4so4292066a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 00:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785225230; x=1785830030; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=utuyuAxHY1PaIfD6AjLDIYVdeOwFDZ64oCdWRPB/Vnw=;
        b=VFkyET+UNQ3U5yk7bPV6m1T206tz8raNoM6K/Cvtgg584TA01dPhJWG0KCIblaGyMW
         ipQBvGng9Ze41mKAIC3z4TozJsYMGqyhcyHobCjiv308M/JJSRWM8B1QR+V3ieU/PeqA
         So+ybGaeLQk+Ld5+Dg2dzt87MWXmW1MeWVUVrqB5ZRiFeJPjO7nQ5egd2sGdgnlR7uG0
         6SOMaynF5zFfzHRzKQinU09z+aRY7zWCEMHENdxp3aRu/fEYCg5JsxDWHFqWprhj5A6R
         C7TD1ydr1A+BWYNWPnnuM4XLeRsMHEwaEdHs3ud8DPXm3cEkQGwjRPJn5Wx7x3YHF7jF
         wfhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785225230; x=1785830030;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=utuyuAxHY1PaIfD6AjLDIYVdeOwFDZ64oCdWRPB/Vnw=;
        b=eExJB73kmjsw8lt43ghsHJNIdOhXoYcVqJy91srfFXLZXw8tBaJWSKdPQ0IbQwC5zX
         Ae5wVnNx/+Mp0c8QbwaYG5e2aE1+pmSKjzulML4lWTa9oVIxEwtGCfZL4q5eeEDGK0EY
         +Q3ZrTHlrU44OJ4lmcvKSHpVx4oYa1izpUSClrixXFTUxZ0I+Yglg3E9XIFlWN6UnRWV
         m/9UjB9R4rR/1uP03hDThhq172OwGMNqkO4vGO29EkFMAQ5acN6AbwKqLh6XUledqi5s
         8zxvkIRx3pT5PrTh67KyrAd6WdwC2lpj1ZNY2H+mvA9OqbtKQnnvLJeSgLPx6+AcjVAC
         Nr9A==
X-Gm-Message-State: AOJu0YzCkm5QPZgxI0Arqucf9UsoO0OOP5YR9sJg9/CPO5jnwjBKW0CO
	wbqr8PDQ2P1LESw/YhIGyPiUX9Mkqh+Y3MXSMFniewoKP2cmxFKx2tYMF3d054SQHhBFKmgY95r
	UQPrMZyMAdQpjjo1YEnRz10E/nCJFQGClZElEULkwujpgDEx8+1aio7mWf1eJ7HYi/aX4
X-Gm-Gg: AR+sD117ESmlLQKkLnLIcpq9g23baTf6Ryg8pgTgmhemU64iJe8nx1aEHyB2yOg18sL
	whS14ovRDjw4Jue7IC/8F0QYgwce4K/z2OkdSgTdGWqwkSk3Dw7Yr9bRtQBsdtmDkrL7Jvg7zgI
	OqwJVhuRU+G9O8Q/+QfjTi5ZfO6LTJWQpy6KSmpv9fZ7CmYBcntOLmkPXF03VDPfTcVqFgi+oUt
	fQP5sjPw6/8BfI68vbVvccMJbtsREJMkFmzYKusVnovJCMrqepKrtpTY7qKxmE1z43TGYjWGGfK
	oo6e971mmwaCmk99aGru4bXns8R5kuaYD6nAuO+xOxbk4mYv0FexGAGPzzQtpFRmc0+JYcQE+R4
	Q5l5yCg2sUOkfdmtBggrt4K1l6D6NsqqG03y+izhRXj4r6N+oDZwpQEHUFk9K6naZmACHwg==
X-Received: by 2002:a17:90b:4a0f:b0:38e:75f3:ad4d with SMTP id 98e67ed59e1d1-38f6a310c5emr1802045a91.7.1785225230276;
        Tue, 28 Jul 2026 00:53:50 -0700 (PDT)
X-Received: by 2002:a17:90b:4a0f:b0:38e:75f3:ad4d with SMTP id 98e67ed59e1d1-38f6a310c5emr1802005a91.7.1785225229738;
        Tue, 28 Jul 2026 00:53:49 -0700 (PDT)
Received: from [10.133.33.15] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f090619f4sm3509401a91.3.2026.07.28.00.53.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 00:53:49 -0700 (PDT)
Message-ID: <51bf3573-adcf-41fc-905d-471dfce8111f@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 15:53:45 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] dt-bindings: dma: qcom,gpi: Document GPI DMA engine
 for Maili
To: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260708-maili_upstream_gpi_binding-v1-1-e48cb7e216e3@oss.qualcomm.com>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <20260708-maili_upstream_gpi_binding-v1-1-e48cb7e216e3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA2NiBTYWx0ZWRfXwcurfrkBq7+J
 Vhqy8kyT1YeGPgBgN1/qdTQ+l46XSthVAjqRkwtib/wazG/RHXGkB5EdTS+AYPgLIB63lZuGimh
 mIhFlBBupIgXF6P8EsPF8/pZzXlh5ks=
X-Proofpoint-GUID: gj_FsrGe4pftdB2ZUUC9iXIjejsRgP9G
X-Proofpoint-ORIG-GUID: gj_FsrGe4pftdB2ZUUC9iXIjejsRgP9G
X-Authority-Analysis: v=2.4 cv=Aa6B2XXG c=1 sm=1 tr=0 ts=6a68600f cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=sNGwWByCUGpZoCTVRkwA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA2NiBTYWx0ZWRfX6jy7B7cPEBFR
 CUcD4DYufAyCjFnjJ5IlDSrhRxF8DczCU8wiy61wqTaGOejF3hh4J6LHzQ1608R0iqHlsh+fQ9Y
 fKtr0B3vMIob7sqXuSzIz5NWewmd7HB+KSK/40q1ulz5N5oOory8npjbWhNAvLOGSLpwEkHzdxE
 leadPfXw789CR6T1fMEYGG6oF6DHVwI0kSzdeXeMQSFNuZ25Zk/dsOsktLaeiAAnRIPtv3IssJR
 ZBmvyYIOMVX2HaISkgaXIIliZqCOxGYFK+h63HYMM18uWO8SdCAVWMJXxUovReQmKWUrfcEaRCs
 nqQgvN5g4/Td9ma1WdFKMnf/uPJfZI3BNsiCsii4w9IeoYaYGdGDHVVGjd+lHkgP673T/0y7Ppp
 3T/WXAgPsLdEp7b3GS2r2Fcgk6rOOTJy9mits7jQuFPpdf4wibXSehS/nRWKSHke5GVXuWG5yPx
 n7RCKZ4sFyIYnNjtAzw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_01,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280066

Hi Vinod,

Gentle remind the pick up the patch.
just checked that it can apply cleanly on the latest linux-next tag.

Thanks,
Jingyi

On 7/8/2026 3:05 PM, Jyothi Kumar Seerapu wrote:
> Document the GPI DMA engine on the Maili platform.
> 
> Signed-off-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
> ---
>   Documentation/devicetree/bindings/dma/qcom,gpi.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
> index 54dca623223d..dfc4a3054b5d 100644
> --- a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
> +++ b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
> @@ -28,6 +28,7 @@ properties:
>                 - qcom,glymur-gpi-dma
>                 - qcom,hawi-gpi-dma
>                 - qcom,kaanapali-gpi-dma
> +              - qcom,maili-gpi-dma
>                 - qcom,milos-gpi-dma
>                 - qcom,qcm2290-gpi-dma
>                 - qcom,qcs8300-gpi-dma
> 
> ---
> base-commit: 598c7067dd8b65b93f3ccada47e9014a13137f1b
> change-id: 20260708-maili_upstream_gpi_binding-da1d2af41b78
> 
> Best regards,
> --
> Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
> 
> 

