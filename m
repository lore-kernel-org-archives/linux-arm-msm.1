Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E17823C09FF
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 09:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784193518; cv=none; b=nm8MTrmosDjpBV7moQIiWCrQJM24IBNUTqgE9JwcCAKKsBT6//Wk/uaY3DbOlfQ2V0AiGaSEEN7Xv4lhwZbw42sedQBwLjZoEigaehML5piLiSJLSs5lOx/NwjsQo7lY24LSuamauLx7IzAqsQk3w4QGj0IyEDD24WLkbItWUkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784193518; c=relaxed/simple;
	bh=87ifwq86+t4uODzj7YLj8bmO1cfTOaQFYyyuAygpcIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eKalRTlcs4/jCHhDZHTilRp7r9qGeinp7LXaQPh506INJ9KKnKwdNRzU9mfEI2/Kl1ekxoOu0NlhXbLbLGDy5E8e1vn40mCljhO+fhxQLx2M7YSOE9a1kG5NR2cf+nRKOz4+c1vugn64Ma+9AtXzFQvqfdlvpD8WcAWDhzX8r4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WHbm2+jV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MiIoqnnO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WHbm2+jV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MiIoqnnO"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G7DvlD2115247
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 09:18:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mP45yvqK7ml4KHSvO22/U14Y
	uRcq4XFrwfupg+JvXsQ=; b=WHbm2+jVxyqEIQOm4NqtnyfO0hO6o3ZHTHzxc4GN
	O7I4OxXKAwiL/iq35SnBDo93DRnMx4SBj4MvC9xiuDiuNGE9TqBEh6VaN+EI/U8r
	e2a+1OR+5JsoGbAAcFpk3PzET5DG600p1nJebWjSlCgfVuH38rm/fIjL0eeETgT8
	XBw1YjQU+5JyXw3zUU/CXQH9hfwP4lqZv9n6QKxh+C1d/C6YWLFPJs99EA6RFReO
	0Oh9X7jkKvS2H7mLXWu9kT7arwQ3097pERzoVjjyPBu5BWDSodM9cjmXafEWGe+i
	jBUgcBnRHLVGmYfQE2W6EtwrnaKSHYBpL64LPpJdn87u3g==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feeg1k1ec-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 09:18:35 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c856470fe9fso2834091a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 02:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784193515; x=1784798315; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mP45yvqK7ml4KHSvO22/U14YuRcq4XFrwfupg+JvXsQ=;
        b=MiIoqnnOf2uua5KNNcZpy4vcszJOamHJixWNFMZr2HtZ2wlRIPM7wK1+gq5eIBTbfK
         LMOHypOdTLK6vauwRhe+3EK/QvThBujcFtvVIWkqAUiGrtutxwsiHuO2zzXFDf9/MTqJ
         d9iRA2YlhKeeffuMBk5CH2m1JBvkEo0XnDN1CcM7L/+GHK2VlxCxd6d8s63qOib/rWGC
         u9rSNfxklZe4y7WIENP3p4Q4PUdae0n5/39d25PxDiiWWO2FfyKSwRXprwiyNXjn/sYC
         vOlgmhXAUn4Hu3c7grj9h2Q4a50Y2a3zytAtRHkIuLZygYytqT6UrEAO6bZhA9eT+0cb
         c0aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784193515; x=1784798315;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mP45yvqK7ml4KHSvO22/U14YuRcq4XFrwfupg+JvXsQ=;
        b=YfN6p4zjFU/zr04d/MV/k8DJy1815tmOidH/pETAO1FUYUe7brj1XCCY4WAplWJA9E
         3zlEoZ4KAct2U0181AssMUdjpxhYK7ql7+3dpMVdQA4VFYTYynA/oOfC3L+unm9bZe1Y
         pUDPbrXS9PAlbi4BeEkxUvNZMpyRuX3UMgfJHmphCGITjR1nL/TZ3yPTvIOaf477rurK
         zS+zVj+FjM7dhYi3vEDWFazuKM1pCy2PlqE5c7ZPwmhPG8cWE4dpdhqtburv3ZYBWC5F
         kzf1z2usL/q2gPE3sXH3wOLEdAE14/FzL+7Xb4JfGY1HzHKwxvosfMuKs5jRQmCIjH8A
         kcPA==
X-Forwarded-Encrypted: i=1; AHgh+RpsX7Gdt5KHwa9Kv23jmdXOL5b5qNilPXkAesKVwrIVH5q6V+42AQzNnAQ0rHmsYFElS0jUP0WY8UxNNq6c@vger.kernel.org
X-Gm-Message-State: AOJu0YxEmyO+iZd8COLlxujzN5ZXHxKnj2IY38HP8ILLeP+vyKGwcu2c
	YzqoT90zLNwcgQFvCUIF29bVxhyDgiWOShCWXrx2I7CKG9Ph8PY43+EysUTE8Q60xbTtmH/g5jD
	544eNZIEEfC1qoKMlxgyS6vtsn5+F6Wu4ZVt7whhhH6Nvyp5rI2akQNBubiWBthsEL/Mq
X-Gm-Gg: AfdE7cl6HQYXwicTDw5qYD+NNle4IuFef7hBd9V7tNVTKyggtF8Oh+CfzvMVZiH2f4E
	un+W3vdXvOD4q3mgjr4TadBK+oB4fzrrkBXn5vs48ajdHdmsQe+3mTVBGc3g0jwdLUkurYhIVtQ
	dbjd8yzYR1nwsa9STJNOwcmv6DGzkYbnsPeH6BSKtoQU/0DiI7LOKEU80RlD/2LhNyuCEXEQ5oH
	fQrT1pnE2tBKvwBP54iIvhI5JKLj0yxhkZje+PN3xGoUVXYR2V+4galQE6iw7va/erOTZ76BI2Z
	ABlLR2gVRjDuW1Vq4c8Em6228a/VCZK5/8YYrPdW+1Omk6le9E3ISBEFF0RYeLZDTWP88Z9JzxY
	m8YsZtxrRGQr1CnP2P9Mhx1DXE0+AAoYgwHy5KEqmqDE=
X-Received: by 2002:a05:6a20:d70b:b0:3b4:71c1:ab29 with SMTP id adf61e73a8af0-3c1105145d8mr24781153637.16.1784193514722;
        Thu, 16 Jul 2026 02:18:34 -0700 (PDT)
X-Received: by 2002:a05:6a20:d70b:b0:3b4:71c1:ab29 with SMTP id adf61e73a8af0-3c1105145d8mr24781102637.16.1784193514326;
        Thu, 16 Jul 2026 02:18:34 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13cdc4accf4sm647760c88.10.2026.07.16.02.18.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 02:18:33 -0700 (PDT)
Date: Thu, 16 Jul 2026 17:18:27 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: "Martin K . Petersen" <martin.petersen@oracle.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@sandisk.com>,
        Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kumar Dwivedi <ram.dwivedi@oss.qualcomm.com>,
        Anjana Hari <anjana.hari@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH] scsi: ufs: dt-bindings: Add missing mcq reg for
 qcom,sa8255p-ufshc
Message-ID: <alih48Y5lLOqcoi4@QCOM-aGQu4IUr3Y>
References: <20260716083313.2367249-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260716083313.2367249-1-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDA5NSBTYWx0ZWRfX+qc0V7PmFRkg
 kuZplIp5DSTkU7ySCBWcK5ICMr/xEs/D08FPrMPSdKI23T8CONvTGBoTm/sCji0Xb5HrkP87J6T
 7bb7kJ4HAch/XMExYfme7Ryv4dlRXmAHmQaB/sqK7hdR2s3rp/pA9wqsCU43hTAVZ4jh2DY+2Qc
 1vQO/QpJHl0B/tp5zrnsByaFhVHgGDMfC8BA8NudXYthzbo654aOC82ES9aP1tgJ53IcT61z8Y1
 8Mv2x5V+WWBNGuT59NJPws2k6oO2DmVrwIdkycxM6aZiHDYCl7A0hByzU1pLdke/Z9QqqPuhHML
 Y9lcFH8wEJZRL+42Y3c9JE8OzVhiO7snzyUSZYuAigzOD/naePgS44HL9y69vZ8ofIza6bdePEn
 Ml2q9CFk0Nb+wDvU5v5yNsPEnI6TqsMxoJ+BzwmUf2K/AI/VMJAXXS/AjwVhHFq8udrCmGz/5HD
 dARaBtUD/drj7Dn6jdA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDA5NSBTYWx0ZWRfXyS5X+vqWG2GH
 oNv28RR1SpyyUGue0RJgRbXyjTubQ/jqh2ClgoKw89K1Wi/Dg2gKGAKpyc5OmNYyXLJXnODHy2b
 4eoVsCPTrWXsMg53n1HPL5gA87haP6g=
X-Proofpoint-GUID: G68ltwlVUkxaNOoyIs3fvk7Aru-xG2dk
X-Proofpoint-ORIG-GUID: G68ltwlVUkxaNOoyIs3fvk7Aru-xG2dk
X-Authority-Analysis: v=2.4 cv=SsOgLvO0 c=1 sm=1 tr=0 ts=6a58a1eb cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=3miq8Qb-Iyz2LYAwW2cA:9 a=CjuIK1q_8ugA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_03,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 spamscore=0 impostorscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160095

On Thu, Jul 16, 2026 at 04:33:13PM +0800, Shawn Guo wrote:
> Qualcomm UFS controller found on SoCs SA8255P/SA8797P has a MCQ I/O
> address space. It should be defined in the bindings even though Linux
> driver currently doesn't utilize it. Fix the binding before it gets
> adopted by DTS.
> 
> Fixes: e2725ed2a7fb ("scsi: ufs: dt-bindings: Document bindings for SA8255P UFS Host Controller")
> Cc: stable@vger.kernel.org
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/ufs/qcom,sa8255p-ufshc.yaml    | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/ufs/qcom,sa8255p-ufshc.yaml b/Documentation/devicetree/bindings/ufs/qcom,sa8255p-ufshc.yaml
> index db165a235cb6..bc8734e1fdea 100644
> --- a/Documentation/devicetree/bindings/ufs/qcom,sa8255p-ufshc.yaml
> +++ b/Documentation/devicetree/bindings/ufs/qcom,sa8255p-ufshc.yaml
> @@ -16,9 +16,15 @@ properties:
>        - items:
>            - const: qcom,sa8797p-ufshc
>            - const: qcom,sa8255p-ufshc
> -

Damn! This newline shouldn't be touched. Will fix.

Shawn

>    reg:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 2
> +
> +  reg-names:
> +    minItems: 1
> +    items:
> +      - const: std
> +      - const: mcq
>  
>    interrupts:
>      maxItems: 1
> -- 
> 2.43.0
> 
