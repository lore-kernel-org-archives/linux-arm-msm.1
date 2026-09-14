Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA1E2321F5E
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 08:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789373298; cv=none; b=seNqXla5sZXejXcgeFNP+IHwNlA44I6O6kKJeiHuZr1qlX/PswGwj+h5zWbEUGbEyVHDiBq9wxUFWn8gdl2ulHBUnQl0t6wK31hjKwIbc8Kb/vDYzrKvAmvKz6TW0R9AaLUfj2Ey+PLOaDjEAzCo0N7k2CaIREePyoN7PJABDTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789373298; c=relaxed/simple;
	bh=oI7VifzfMn1zpU+IkOS28i03E+y/fe9j1/M0UgR7+Lk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d8/R1dghUJXE4sXic4cjnbmg9ih0fHi50kOXqwJV1EnzHR4FM8hu7ALFfjVQsb2lonGSeSrZt4IWeoihkZcJoOlmaScXnb4aHTWLgj3/VyfvgKMWqqZkRcaFYDyGzZdKKNBY7FEsgz+VChn/JxygrgPrvahnz9oYwcM4COWbZKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=imN5fpI9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VjWIeBMi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="imN5fpI9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VjWIeBMi"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5jXUU237707
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 08:08:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LrqX32EnO3d4Uq7N4G8r4oWD6xf4vvdnOcV1PMGcjmU=; b=imN5fpI9OinQuYhs
	Zm681p87GeCmBBbnNrsmV+rIMI3TIs9DAG63YrWCk4+cv0xplTeOssEsSTDfC3gf
	FCNFkRpVuiiMue+2+16QSY29pGduwe4c/flZYQiz319NL316w0em1y4KIKl06OL/
	u2MXHvKc5c56927lq1UFY9JfkW6h+5Y+Z0U3tTjODp0iBg3MFfp6HGTpyanRduDA
	i3eyhMEZ8GiqvjdxD6f8NIqJOlbILvDpmPHlps9/YS8PZiZtAVCBD+s+XXO1GUHs
	xh3zfbtYP708s+YalzI0KsFeFwZirB9r+Hw/RW+tNtajftA+MONIeBeMqbQgbWRN
	B6AEvA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9dnpd5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 08:08:15 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-90ce451128fso6979196d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 01:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789373295; x=1789978095; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LrqX32EnO3d4Uq7N4G8r4oWD6xf4vvdnOcV1PMGcjmU=;
        b=VjWIeBMiAsLVHowW25RgLPu6Z8t5ObKm5D/lEJsuakcgHvbCdxwJhYNbwiyUw7/USt
         oOpS3CxZfdYXPTcU5CT/TYsDC1KuQ5GtucWtmWzdKS9YlNizBpKzotD6zAih6fFdwUGA
         sfGgsFHOom7EprerLtE7hJX1rMOtDuxu6CvqHraoKjP9x5K4Pcptjr+co++Sx2AQf6RD
         TrO/sE2TTniz5UjEzWegdrAdCo5nAdyZYRPU+iyltP7IkUZAvOKC+dAiyivlWEN5+CbH
         OfacEueNFRhBfazHUILqHAc9adki4xvy2IsGqXAzPpBdx9uxIXZRozSWM5Q8+HhEfxJ2
         C5iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789373295; x=1789978095;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LrqX32EnO3d4Uq7N4G8r4oWD6xf4vvdnOcV1PMGcjmU=;
        b=ACvSoNJx9OFv9f3LIl+TVGHhW21NYmD3zp46f+EntqN3C1p9whhuhPCOfnVoYKeJai
         P7l/PPSGPMasyWLeuaRCxXhGVCJw04ZQz+DOuYAS2EVgzJM0JhjGfTl9EKmtFHbvi9iF
         DGtAZYgIqicwwYsE47FzHaCytlbNk0Mp5A0GVq+t8eEI11bh22sh52OVPi2nGacgaf3G
         ZJ42k08KrD37dGtI21Jf8Ajc19a/XeV07W+vVtYTjE9ZYTZfFvzwqoL41sI/DyaccrE5
         KnVTtU7k2LzcJspIn95ecoA7hrEuQPm6JDt75Z+S0MWn4k6CcFt2iBvPgKOgWhTS70B4
         cTpQ==
X-Gm-Message-State: AFuF++lZU71fzgtV4X0AjGeOcBSPFJ+8hGndd/bj5sGV76ka+IyNR4xc
	z9aH9DHSBeSVqHPB0gDEQ0ssvX6mJUJfCNFtezd2DRimj9ZWDKoYDTUk6Gsi71egANRTxw+9uGb
	G7Fhw2VJVG1UguzIBwccI5mWiBLRyz1U/j6Ys9Uy4Ybz7cfg9o4NmKyezsAQ2/wCwNaMq
X-Gm-Gg: AYBFou1Nun56yvbk3T/n1kwGWuzkl2+brHZxgvz4CAV5Y+05lwys+5V4+CZTRZNCjFk
	BagUYLneKkusOuUMEcEU8BsehH9CyDCAovNdipWd/Qhs7COqlNIZ1ZWUH4LHWvurvidfoySMieh
	90EtqcLbD4ygYItLfWkesaGRLKMi/pDIo4fqjrKzCjfHvmRUh2wdAJhnDhZTvY7qBdCgITPzR0n
	zzME0NXuN2KmKqTa4/4NSJ1pfHY/n7k6QrACuDkzbqq5tPXyQAW6eTVue4ISs6472k7PtYGz5Kz
	oTJiT89lxkeWn5AYsq4KH+LlTiMQWNoOyMf3SMT1bkYmIPhPFbhUpld9u4Z22KEcZb+zUNkwoX6
	PAKko6QjSAGI/gMPk8tqf3Q==
X-Received: by 2002:a05:6214:410b:b0:90e:9616:d7ac with SMTP id 6a1803df08f44-9122e67e91dmr18607256d6.4.1789373294931;
        Mon, 14 Sep 2026 01:08:14 -0700 (PDT)
X-Received: by 2002:a05:6214:410b:b0:90e:9616:d7ac with SMTP id 6a1803df08f44-9122e67e91dmr18605436d6.4.1789373292507;
        Mon, 14 Sep 2026 01:08:12 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2966067345sm391067666b.32.2026.09.14.01.08.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 01:08:11 -0700 (PDT)
Message-ID: <d9671bb6-9924-4b37-bd7c-de9e343e6f4e@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 10:08:07 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/17] phy: qcom: edp: Add Nord PHY power-on and reset
 state-machine callbacks
To: Nabige Aala <nabige.aala@oss.qualcomm.com>, Vinod Koul
 <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
References: <20260911-nord-drv-dt-v1-0-e25c073cf1b6@oss.qualcomm.com>
 <20260911-nord-drv-dt-v1-11-e25c073cf1b6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260911-nord-drv-dt-v1-11-e25c073cf1b6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: fUZYVmqvGLTQgk7Nue0M9HxV-VCcpUnY
X-Proofpoint-ORIG-GUID: fUZYVmqvGLTQgk7Nue0M9HxV-VCcpUnY
X-Authority-Analysis: v=2.4 cv=NelzRGD4 c=1 sm=1 tr=0 ts=6aa7ab6f cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=vbpSL41SLP_TpwptBaYA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDExNCBTYWx0ZWRfXwC+Q4Csj19sh
 t1FIIECb5/HSkNQCQxBH93KQJh6f2TqW5dCO2EFX5mwQ5EM+2+pYoYgpE6fB3pBsCWOQVqDCzk/
 +uPleaCYGfRjZZUwkqaBaUNLQAXASuw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDExNCBTYWx0ZWRfXw1jwCLgtkTpC
 irPFDb3TNSp0WejKDHqbjhfIXxWRMe60msQ7mdPOOSERy99tOgHVOUhBhPcwqbYsA2apljgS8FS
 WEULH++lovHCublBLQxkP/K3XX1SCkN9UVXCkn0IrWP8MsPK53bpj0JUPiSyuIM/R8q1rqXqI70
 IKQeeW+qUhv4GuFKiUxwqKjV0dbWOUxE5OKSKVmX1hu53MMlFXCri9g14V+4xDFA1e0X5vHOASy
 oWckrTAGksfPLj/Cz8RTgRmErbkq4yLBbpOHVrzyzbd4gzE1eOIlIh/UpsVETSnrBVTNdfQgrsG
 HgU2ijhXWSAACHpW1g0xUqtZAu4Y8Tij6YC0Vj7r3buHhgViOyTrsu0L3YvRzOl699Uaj9yhZoe
 IesEjTQLm8I4fychTLiqkmB8LuWPRcLfJQSuqM+7ZEIxjAMJK2Jw9KSMtlPpKibOwkWc66n23/R
 v6I88EbYcd8KgxqG2JQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140114

On 9/11/26 5:36 PM, Nabige Aala wrote:
> From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> 
> Nord relocates the QSERDES COM CMN_STATUS and C_READY_STATUS registers
> so the generic sequences cannot be reused.  Add
> qcom_edp_phy_power_on_nord() which powers down all lanes and polls
> CMN_STATUS_NORD (0x1d0), and qcom_edp_phy_com_resetsm_cntrl_nord()
> which triggers the reset SM and polls C_READY_STATUS_NORD (0x1f8).
> 
> Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-edp.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
> index 64878398f43c..6cac4b55b66f 100644
> --- a/drivers/phy/qualcomm/phy-qcom-edp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-edp.c
> @@ -1612,6 +1612,31 @@ static const struct qcom_edp_swing_pre_emph_cfg nord_dp_swing_pre_emph_cfg = {
>  };
>  
>  
> +static int qcom_edp_phy_power_on_nord(const struct qcom_edp *edp)

This commit introduces compile warnings (-Wunused-function)
> +{
> +	u32 val;
> +
> +	writel(DP_PHY_PD_CTL_PWRDN | DP_PHY_PD_CTL_AUX_PWRDN |
> +	       DP_PHY_PD_CTL_LANE_0_1_PWRDN | DP_PHY_PD_CTL_LANE_2_3_PWRDN |
> +	       DP_PHY_PD_CTL_PLL_PWRDN | DP_PHY_PD_CTL_DP_CLAMP_EN,
> +	       edp->edp + DP_PHY_PD_CTL);
> +	writel(0xfc, edp->edp + DP_PHY_MODE);
> +
> +	return readl_poll_timeout(edp->pll + DP_QSERDES_V8_COM_CMN_STATUS_NORD,
> +				 val, val & BIT(7), 5, 200);
> +}
> +
> +static int qcom_edp_phy_com_resetsm_cntrl_nord(const struct qcom_edp *edp)
> +{
> +	u32 val;
> +
> +	writel(0x20, edp->pll + DP_QSERDES_V8_COM_RESETSM_CNTRL);
> +
> +	return readl_poll_timeout(edp->pll + DP_QSERDES_V8_COM_C_READY_STATUS_NORD,
> +				 val, val & BIT(0), 500, 10000);
> +}
> +
> +

Double \n

Konrad
