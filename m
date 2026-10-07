Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E4849A3B7
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Oct 2026 11:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791372364; cv=none; b=CUx+VaemU6kBLbaG/+g/ydnzgxzV8tOfT6c6FYC+NnEj/OxLIvSz/YLTJgeHnPH6CDgJbdq3j8JMNuOokM5WpeqqBHjS/mn4tVDzOY63Fz97GYyAq0XWweP3AJoogqgquxSOCUyKiRwVt0BsGHPysx880FWqGwVZXbpT9KnkR9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791372364; c=relaxed/simple;
	bh=KJnbpRVIHloDGfDhE5+fXC557tLNYH9I8hBo5WFW5oo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ruhvSOyrDhKGpirXJ3hSKQXHRcUqbnA4ynio3ZowYl7kF0wffkbu5ut++2UpHXe2MZvZS3+ikouO0lWxhs1Q/cLYPAshCMazdqR/uyshhPN+DMcqQ2Zh8os6T87UOR5yqGBx54+93EMpjDozAzyMTYmYkUU8ktBjW0sr02hPC4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hbZWwd4f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aBrEOBD1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hbZWwd4f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aBrEOBD1"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jTV73298200
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Oct 2026 11:25:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	asNdnnn+jFtAWyz3FKWehQEy/53BJ1c+C7uY4v6X2c0=; b=hbZWwd4f45taM7oR
	1t/YxBlNIjROoMvoLxe0gQSim8xIGFobL9WRamvq9/R82/Y+TltHr2PAUJJ0H+Cv
	HaL084GfrENxafIPOUFc2pdpG79at5prnlP3qor8IIp+/Q3knXd+NIcsaOvQtZky
	zdaYb4wf7K6GAnlGUkcOCufrBOLB/oHIKlWJ7QlbxIWyj7OFQ85TPvCIuWC6W9ih
	BfA/WJxsIJfFX9k4oBIXuy1Vk+53Hr/pWqE+XkCjZfEcEXj6HvTk+uJOPVp0CFnj
	7mg0WpoTEk5zoY25BTy1NK5oDKltaas/XPKjwVkr9eJbsoN332Qlc01uvfon59mY
	8ggRLA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5hdcrtqa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 11:25:48 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cb6391e89so723225485a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 04:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791372348; x=1791977148; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=asNdnnn+jFtAWyz3FKWehQEy/53BJ1c+C7uY4v6X2c0=;
        b=aBrEOBD15UX1nWXHaZmo7GQBnOiQ1TUm1flblzmq8yWtt8/gOLQffY3iMbhYEoOGdZ
         R3wivr4BUmAxYSNq+XM/Qgw/Fg1zM+aN82QUS4+UxYiqf7FifrN3ykcPO79m7KPuC1as
         3sNF6HtiLJGmWSAgsCyUy0Ms4uWg+QbvMYfcojXnalVAdqcqoxctQRfSC8n9cqkj6Zj1
         E16d25eLMPfvdF0TjbULqVrW8EYJ0yp7RXBfvQ4D8EkJe55JIBghYjM2Xonuv8YIYNZw
         RbfhzvVQFn0qq/Bd0trIQX8r4WcaKiTLrCf0YXCyVSZexOsutsP+b3VdmSR3NsXtkaql
         w+sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791372348; x=1791977148;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=asNdnnn+jFtAWyz3FKWehQEy/53BJ1c+C7uY4v6X2c0=;
        b=IBqKOIGXYLhmTS27+UrJVjEUkuTruiszej/KTmqEcNbACqYl/SN/rWJyXUp4lRvqvq
         s2nSKiQTX5HUj2EoUm/QwAJYtefZiM+hG+EqZN7vq2XnIdl4cZTvmbhwOdu7FLBkfYdp
         P731c5mLMm+/3EKSrGoSPmPAIPaadX0obykUsHqSi72E6fiJkLoG655dmoMpSKecbKg3
         UTqg56YQeXPXPp5MEj4Q5r+K6MrjiYVLVFXQ/ZsiuCWln1pYHXFphbpdSTSo1VY9vXvq
         xsxKRijE9A01lcKgCBhSRphm3l5+sQZ1U+Whb165qYe4XYosb4TmILkvimPm1FQr661K
         K6kQ==
X-Forwarded-Encrypted: i=1; AKwUvBzNbkGSydKH1W6V55jE23WTytW8/jacPUmvX2qPP6N7UwPP0sf5H+tQXbY1Mh/nQhaL3VOPKiqPDp6gp2+L@vger.kernel.org
X-Gm-Message-State: AFuF++ms0yl4KREMOgS1St513OXIUi/o3us6SBY84Vt1b14id+QDHrZ2
	H9ZL4yND3Y2UKu/aEkHv42Gh1oM6PEbJ+9PA3AaFU7fpPPbr12JuChfmajZ155rnncTl4DipODj
	XROD3p8kjXE4TFqGxZ9mdD/l/JbFF5k7KM+6XyD+3QA8Oya+scxl2EX6Xu73TZ2lMLWBYmQD5of
	qp9Cc=
X-Gm-Gg: AYBFou3f0RIe23L34OrPlpy6vXDam3xbxZ+ZvDwp8bQp8ste5btugrWMv0TTwDAt3Mr
	BRJdW77Jon/TmDsmDXUoLu7SpPMOwqtyHbqczPB1P1l266cksXENJJvfBk1VYAJZ58v2jAEWRS3
	rbRrhKEYpvDcI0Bi0/XWDPzxY/WuABjcpViE3g7nfI/m+M1MZpoUXTX4f0yO9Wvpcf5S+pOhZkx
	lcaa9u4XvUUTMdkQYiXxPikmgSJgR99URlbhlFHhaltvAiy028feWHbXCSsEzVBU7JbIHNRVVA8
	ptbuiSqO7glkOg3DN8EhtK5vWGS1yf2XVm91VvVvvH89rmT/VouronszMKkvhLuEJmDEZXRI+hA
	WhGZq1HycfSjy3zg6n0HpFDXSHW5o7ehr2cyM5AQi
X-Received: by 2002:a05:620a:40c4:b0:93c:ba2a:6c03 with SMTP id af79cd13be357-93e9b71c7c1mr368507385a.21.1791372348047;
        Wed, 07 Oct 2026 04:25:48 -0700 (PDT)
X-Received: by 2002:a05:620a:40c4:b0:93c:ba2a:6c03 with SMTP id af79cd13be357-93e9b71c7c1mr368493185a.21.1791372345970;
        Wed, 07 Oct 2026 04:25:45 -0700 (PDT)
Received: from [192.168.25.64] ([94.155.124.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17f4482c4sm111196265e9.0.2026.10.07.04.25.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 04:25:44 -0700 (PDT)
Message-ID: <647cdc36-d6ba-407f-9eb3-f3b34ad9df4d@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 14:25:42 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/74] media: qcom: camss: vfe: Add helper
 vfe_bus_v3_packer_fmt()
To: Bryan O'Donoghue <bod@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Keke Li <keke.li@amlogic.com>,
        Richard Acayan <mailingradian@gmail.com>,
        Hans Verkuil
 <hverkuil@kernel.org>,
        Gjorgji Rosikopulos <quic_grosikop@quicinc.com>,
        Radoslav Tsvetkov <quic_rtsvetko@quicinc.com>,
        Robert Foss
 <rfoss@kernel.org>,
        Milen Mitkov <quic_mmitkov@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-0-ed985aefd611@kernel.org>
 <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-18-ed985aefd611@kernel.org>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-18-ed985aefd611@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: RgvZGZHudrVRqHp9Qda_dBhMo5Z42RQj
X-Authority-Analysis: v=2.4 cv=aKFlOr9m c=1 sm=1 tr=0 ts=6ac62c3c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=eGCDHFSXubCXFTSSGhjuOA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=F-lHOqjDzm0Mqe-WZYMA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA0NSBTYWx0ZWRfX7P0KRTQYVSEq
 9oXh46ONBJ/8C28YJNk6IznUzs/Isaj5cI0LrkzgCazxaOTFtUVPfhvnzwjGt/nn4xlxiC9CRBi
 zv3gk+60WHVXOfYWMmNSToEGptcIqLY=
X-Proofpoint-ORIG-GUID: RgvZGZHudrVRqHp9Qda_dBhMo5Z42RQj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA0NSBTYWx0ZWRfX3zEzdE0Rbq1a
 sMu54RhV2JY3JlNyGjfZD3rWsF8BpOf/FFufsGS5xEIT60XaRmhhibY2V3SnXC6B9r6y3ThueGv
 t6pY0uu8+5CrJPiRReRlKZ98KmcZCEcU0W3ImKO2FYV7m44tSXeuZaNveosVOcBCMZSTIri6xff
 +duNEgw4g7mQRuvBdPbXlMLLw9EV8Oaky2JALsFqu3k0HGbS+qXmPO5Q+ZslZDB60DIFiT7tw8w
 O7dUmiunhUvGswI+vzFR0rsKfbRTUFvmqU4XD/zEwmpkbsqjQrH7+cSd2IKn31rzSr8Fx6Fsmuo
 W5oC0qqNz7LctnWWREJaet4is0fOjnIUN9OlHOA2M9bCfn5i+/CXOD8OlYN+n7SoyeMUAAdSkWA
 w4k5Pifg8QeOCUx1MxubaanKtlO7NOPOc2iENbH697yHugmNBYJV1a7PZwj+jhR/1nqSmPP0ihB
 4FXw9vMbDeZhjUF1MWw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070045

Hi Bryan,

On 10/5/2026 8:13 PM, Bryan O'Donoghue wrote:
> vfe_bus_v3_packer_fmt()'s job in life is to translate a given v4l2 pixel
> format and plane into the appropriate bus packing format for v3 class
> hardware.
> 
> Other versions are currently not covered.
> 
> Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
> ---
>  drivers/media/platform/qcom/camss/camss-vfe.c | 53 +++++++++++++++++++++++++++
>  drivers/media/platform/qcom/camss/camss-vfe.h | 32 ++++++++++++++++
>  2 files changed, 85 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
> index 5b5201b55a485..c95fe5b0b05fc 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -370,6 +370,59 @@ const struct camss_formats vfe_formats_pix_845 = {
>  	.formats = formats_pix_845
>  };
>  
> +u32 vfe_bus_v3_packer_fmt(u32 v4l2_fmt, u8 plane, u8 align_shift)
> +{
> +	switch (v4l2_fmt) {
> +	case V4L2_PIX_FMT_NV12:
> +	case V4L2_PIX_FMT_NV12M:
> +	case V4L2_PIX_FMT_NV16:
> +		return VFE_BUS_WM_PACKER_FMT_V3_PLAIN_8_LSB_MSB_10;
> +	case V4L2_PIX_FMT_NV21:
> +	case V4L2_PIX_FMT_NV21M:
> +	case V4L2_PIX_FMT_NV61:
> +		return plane ? VFE_BUS_WM_PACKER_FMT_V3_PLAIN_8_LSB_MSB_10_ODD_EVEN
> +			     : VFE_BUS_WM_PACKER_FMT_V3_PLAIN_8_LSB_MSB_10;
> +
> +	case V4L2_PIX_FMT_SRGGB10P:
> +	case V4L2_PIX_FMT_SGRBG10P:
> +	case V4L2_PIX_FMT_SGBRG10P:
> +	case V4L2_PIX_FMT_SBGGR10P:
> +		return VFE_BUS_WM_PACKER_FMT_V3_MIPI10;
> +	case V4L2_PIX_FMT_SRGGB12P:
> +	case V4L2_PIX_FMT_SGRBG12P:
> +	case V4L2_PIX_FMT_SGBRG12P:
> +	case V4L2_PIX_FMT_SBGGR12P:
> +		return VFE_BUS_WM_PACKER_FMT_V3_MIPI12;
> +	case V4L2_PIX_FMT_SRGGB14P:
> +	case V4L2_PIX_FMT_SGRBG14P:
> +	case V4L2_PIX_FMT_SGBRG14P:
> +	case V4L2_PIX_FMT_SBGGR14P:
> +		return VFE_BUS_WM_PACKER_FMT_V3_MIPI14;
> +
> +	case V4L2_PIX_FMT_SRGGB10:
> +	case V4L2_PIX_FMT_SGRBG10:
> +	case V4L2_PIX_FMT_SGBRG10:
> +	case V4L2_PIX_FMT_SBGGR10:
> +		return VFE_BUS_WM_PACKER_FMT_V3_PLAIN_16_10BPP |
> +		       BIT(align_shift);
> +	case V4L2_PIX_FMT_SRGGB12:
> +	case V4L2_PIX_FMT_SGRBG12:
> +	case V4L2_PIX_FMT_SGBRG12:
> +	case V4L2_PIX_FMT_SBGGR12:
> +		return VFE_BUS_WM_PACKER_FMT_V3_PLAIN_16_12BPP |
> +		       BIT(align_shift);
> +
> +	case V4L2_PIX_FMT_SRGGB8:
> +	case V4L2_PIX_FMT_SGRBG8:
> +	case V4L2_PIX_FMT_SGBRG8:
> +	case V4L2_PIX_FMT_SBGGR8:
> +		return VFE_BUS_WM_PACKER_FMT_V3_PLAIN_8;
> +	}
> +
> +	WARN_ONCE(1, "no packer format for 0x%08x\n", v4l2_fmt);
> +	return VFE_BUS_WM_PACKER_FMT_V3_PLAIN_128;
> +}
> +
>  static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
>  			    unsigned int index, u32 src_req_code)
>  {
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
> index 089f525b98cf5..98d403a71cf95 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.h
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.h
> @@ -56,6 +56,27 @@ enum vfe_line_id {
>  	VFE_LINE_NUM_MAX = 4
>  };
>  
> +enum vfe_packer_format_v3 {
> +	VFE_BUS_WM_PACKER_FMT_V3_PLAIN_128 = 0,
> +	VFE_BUS_WM_PACKER_FMT_V3_PLAIN_8,
> +	VFE_BUS_WM_PACKER_FMT_V3_PLAIN_8_ODD_EVEN,
> +	VFE_BUS_WM_PACKER_FMT_V3_PLAIN_8_LSB_MSB_10,
> +	VFE_BUS_WM_PACKER_FMT_V3_PLAIN_8_LSB_MSB_10_ODD_EVEN,
> +	VFE_BUS_WM_PACKER_FMT_V3_PLAIN_16_10BPP,
> +	VFE_BUS_WM_PACKER_FMT_V3_PLAIN_16_12BPP,
> +	VFE_BUS_WM_PACKER_FMT_V3_PLAIN_16_14BPP,
> +	VFE_BUS_WM_PACKER_FMT_V3_PLAIN_16_16BPP,
> +	VFE_BUS_WM_PACKER_FMT_V3_PLAIN_32,
> +	VFE_BUS_WM_PACKER_FMT_V3_PLAIN_64,
> +	VFE_BUS_WM_PACKER_FMT_V3_TP_10,
> +	VFE_BUS_WM_PACKER_FMT_V3_MIPI10,
> +	VFE_BUS_WM_PACKER_FMT_V3_MIPI12,
> +	VFE_BUS_WM_PACKER_FMT_V3_MIPI14,
> +	VFE_BUS_WM_PACKER_FMT_V3_MIPI20,
> +	VFE_BUS_WM_PACKER_FMT_V3_PLAIN32_20BPP,
> +	VFE_BUS_WM_PACKER_FMT_V3_MAX,
> +};

I think all wm configurations should be separated in separate bus or wm
abstraction and move those per version of the wm/bus.

> +
>  struct vfe_output {
>  	u8 wm_num;
>  	u8 wm_idx[3];
> @@ -315,4 +336,15 @@ int vfe_enable_output_v2(struct vfe_line *line);
>  int vfe_queue_buffer_v2(struct camss_video *vid,
>  			struct camss_buffer *buf);
>  
> +/*
> + * vfe_bus_v3_packer_fmt
> + *
> + * @v4l2_fmt: v4l2 format
> + * @plane: plane for the given format
> + * @align_shift: bit position of the PLAIN16 LSB alignment flag
> + *
> + * Return: the bus packer format for the register
> + */
> +u32 vfe_bus_v3_packer_fmt(u32 v4l2_fmt, u8 plane, u8 align_shift);
> +
>  #endif /* QC_MSM_CAMSS_VFE_H */
> 

