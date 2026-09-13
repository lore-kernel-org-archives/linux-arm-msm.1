Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2FD539F168
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 23:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789343892; cv=none; b=cdJeU9eNepqm27B6kwWtQowRZRHkNFvxbKnuO2jMQllCX9e37nWh6LDUV8VxPJrLZ4Nwfcg4nTRMdiKiGBmYpFU/KxQT6sgZnCj1+A8UkUtU4tUJUUCEuH5Gp8bJH+GqPr7wbJugxu/Dv+Jvsh2RrqFr9xmjT9kOZmLBaQ2282k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789343892; c=relaxed/simple;
	bh=NI3vFkLPM6fB4QCNrO6VWVzL8tRKBp7ABCq4XIArNBE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D7PEUXlcLzz707v6yNwKMvLD2rUeTxRvjjHRwri1XvMUnawPriFECBOupvUCHGrglHDjjZ5q5FBNKY+URMZ9hj/p2bFY7Y0s3Q527MsDyE1K3scUcT3wQfK+mveddAGX93JzXv76XcljIglcG31a5mTzdm2qZjx8D45S2GYvjZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FkRM+T5s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D24l9Z5n; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FkRM+T5s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D24l9Z5n"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DNYd2Y3652288
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 23:58:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FDBmdktdlLUHhDlg6uE58fcH
	cyrR9lGGu3jE4lq6oo8=; b=FkRM+T5sbuz1jXUjWOTE+kewEZ6RHwSJ9mZ4QqD9
	yiakrA8NhqWb8EUsreZp3Qi+ly3i5wWSVjcwqRHts0gw2fxY4YNDO8qMDLb/CTcg
	2RIMA2SimlmBlkl+H1hl71enAnp5vf1iv4EfvLTQAaacAVWWGK30llcslfK0b62B
	zSK5K+jTYIutCamRepU7rlDPZ/jIl7BtrDGeevzwcFDUd5UlO6ABh2284EzK9GfF
	EOK6Yd9ZnfrjnPJSCMyhOlQnjq+XAE4hqyOYYqTjhVqhnHWEwo5pmRmei1jg6Odn
	/Piq0KNwXAGYy1clYyBFFRepvL82/n3WvFdwTG/PsM9XnA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9dmcwm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 23:58:07 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-78580a6b2fbso897721137.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 16:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789343887; x=1789948687; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FDBmdktdlLUHhDlg6uE58fcHcyrR9lGGu3jE4lq6oo8=;
        b=D24l9Z5nKrtXfonSYTEjwzQy+hvCF3PL/HgMlTlpFAiADgeFUlbeac9cV2BQMztxWq
         wTcQ5tnNf/rISN7L1xVS6OrjAG5A9GMwJYbugHfV4g09EWMc1RvCT/X0m3VBWcWajqAT
         iporN0X4VixGYrbse1VSGEXyEOBkn/m8tUvDGgjYz3q3bOB0n0N0WQs5Auom9Ma1jezX
         eIzjDBKhky5wAE7f5jyDV0jDYwdp/9MTo8T4aQA6eCXDlkQsTHSSIi5WLB9HipoAEmOr
         6qVpsxhYt8RUY+rC78MFkuG3Eomg6Qpb+baaXyK+3nISLd0UkEVdQTHQ92YKWanfb71t
         kGuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789343887; x=1789948687;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FDBmdktdlLUHhDlg6uE58fcHcyrR9lGGu3jE4lq6oo8=;
        b=VckQYytFsDw3jv4NIe0//NH6wSLPxIVj+SLQXRPPGjiCO+ee0LsijVF2fBgBlH3ZUe
         ctIqndOkl0UYYp0ddOkzP752oxz/y2SPewJzRF6N7bXV9Mg9S0CeVJWm71PnIoz0BLUr
         vkBjfr3KnyKnQ4GfR08e0qw+gAkLHy3goPUMiHRH7FCQsufpqiY5HTvcstclZlMMnsGk
         2XJgoXHsfSKV1E1GrlIS+yK8wOrN1CQiHPANOhH/HtBwm4hmrSgWk06/MaVQwHVOaqFY
         yjCkRRPGnBM/92FWNhLdIkUgUQege0gy9UertjKoUhpmUs0xs2lUK2d6mcPcU/fH+p0w
         UcGA==
X-Forwarded-Encrypted: i=1; AKwUvBzrev3iOuLG0Dzs+aAoA7eORfI66TkS06Ee9T+9mBqS+HGE0g1YTm5Z7YWxCilliDqN/7oBOZCBYEIy0Dd3@vger.kernel.org
X-Gm-Message-State: AFuF++nEBs8uRq63U76CC08pOA0aQA+ioW7AoV+GTI9c780m705j45Vh
	Gz7P0lJvKqRv63J6dgUo9Zaq+8CpwLKJafj/a8pw+qZwhpSU6SSRw8prA+lPyzTQhh/QVOG729f
	TJFTqeXM4KTEREiMLMyc2lPBxgETDowLIhc26M0Sd1KaAW44O0JQFirwHeHakjOW2Mqay
X-Gm-Gg: AYBFou11ZJgx9qvlII988yyuPzRyiDnr0wpcXdC9CcSvxK0XD7iwS4hdEaKiC8Hg34B
	RUGep8lOgsU9D8/QxB6ZnSpci0jUTXyAkYONsNbLotW1VwCyEOqUV29YYdAO8PkZqA56jxQHwU2
	ztRqn9NWLrfkmdULxYYcBPEPXjM3m8irvIXAziv6faQEbuzVaUoNnbhnGIYjuifWEmX/Q0pfHMe
	eoXaOJsTxmcRrQCHpoZP1IbzyY8w4st68B1UauCVp0ZUfDqirMb0CeiGSoFI8F8ET1Q/hM8lGid
	dRkt0/vI7ojCmS22FSh/3wVQ/sHyKyNJT+9riW4ykrncghXxMqsg0vahrXCOAa6ASbht1OvaJ2Q
	ktQU2zZqKDEUW4llDGJ1FV3E0GgR8NA7ltwFiWxUPTAMR1dt1uFpW4p7hcTH/imJGT/wEdG+WOB
	zo2mNxZnl/7855
X-Received: by 2002:a05:6102:149c:b0:791:8f69:b802 with SMTP id ada2fe7eead31-79b5992c78dmr36580137.7.1789343886545;
        Sun, 13 Sep 2026 16:58:06 -0700 (PDT)
X-Received: by 2002:a05:6102:149c:b0:791:8f69:b802 with SMTP id ada2fe7eead31-79b5992c78dmr36574137.7.1789343886082;
        Sun, 13 Sep 2026 16:58:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a5a33263c7sm21510611fa.21.2026.09.13.16.58.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 16:58:04 -0700 (PDT)
Date: Mon, 14 Sep 2026 02:58:02 +0300
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
Subject: Re: [PATCH 07/17] phy: qcom: edp: Add Nord-specific register offsets
Message-ID: <t5thwekhz7wyhmyq3nobm37kag6n7ef2z2xpuwrqikv4aqniwc@ha2pjr32ecrp>
References: <20260911-nord-drv-dt-v1-0-e25c073cf1b6@oss.qualcomm.com>
 <20260911-nord-drv-dt-v1-7-e25c073cf1b6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911-nord-drv-dt-v1-7-e25c073cf1b6@oss.qualcomm.com>
X-Proofpoint-GUID: nDC0TghRWQ-OY_-Xl7Y2znYIg4SttF01
X-Proofpoint-ORIG-GUID: nDC0TghRWQ-OY_-Xl7Y2znYIg4SttF01
X-Authority-Analysis: v=2.4 cv=NelzRGD4 c=1 sm=1 tr=0 ts=6aa7388f cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=y1iHI6lx7uGyBqjubtwA:9 a=CjuIK1q_8ugA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDM0MyBTYWx0ZWRfX563g1LCInSut
 TGZA0hoQ5xZyy5Xgzz/BpsFcqaxpqj/0YUM7ARnsUugCAsiKv3b/rskUP1bPkYI1am9cv9u7z84
 /uEKPl3+vkJmrzqmvYLGNsTFL4jH2Pc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDM0MyBTYWx0ZWRfX3h1Hx+RtZBMU
 kTHmvz8Vt6UJHLoO6UEP8UNYrhbWOc876oS2XoQtpsqjZMmCnyQnYiEKBc4U/RzK0wfHTO3Rg8X
 KVQPkYYoM6vjO69rnGb6PU0aCNV3oswSTbXvwsJJpMKWdUvm1vYcLLVwDzAtBGaXTF4M0TG2D1e
 Ni+uBPbxOlgkJj01Q8UGe0UYZS/QWLXPm8NGC7KCSZWbtiX5XF7x7nDTwKlI0ePyix2sy8OhXfA
 IDzZ+cseoQMhZI89TDT+5UfnosARq4Vq6Ac0GJQ/+6dE5VXVo2/mo1SoBcs18igN2aDaxCFzuaA
 LKBNt5KNCjZ3f6/3GpINhnN6A1WT0upWkLLi8rlMMNIBpx1ncndXDrjWIs+7xyOHh4rxUqu4HI4
 77gT/HJMIPTGGJ0HibNah12Pl23qfHoRO4JgbqT8AcvcebRYoUI08t3JNYaIQZbOFp7kpMnO6iQ
 pa8oz7AQ1xjApE+qEmw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_07,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609130343

On Fri, Sep 11, 2026 at 09:06:38PM +0530, Nabige Aala wrote:
> From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> 
> Nord relocates several DP PHY and QSERDES v8 COM registers relative
> to existing SoCs.  Add Nord-specific defines for the relocated and
> new-only registers in phy-qcom-qmp-qserdes-dp-com-v8.h and
> phy-qcom-edp.c so Nord sequences can reference them by name.

If the registers are reallocated it usually means that there are other
registers being inserted (or deleted). Are those the only registers
being changed?

> 
> Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-edp.c                   | 10 ++++++++++
>  drivers/phy/qualcomm/phy-qcom-qmp-qserdes-dp-com-v8.h |  3 +++
>  2 files changed, 13 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
> index a3c893f72908..bf8a17336c7e 100644
> --- a/drivers/phy/qualcomm/phy-qcom-edp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-edp.c
> @@ -41,9 +41,19 @@
>  
>  #define DP_PHY_VCO_DIV                          0x0074
>  #define DP_PHY_TX0_TX1_LANE_CTL                 0x007c
> +/* Nord uses a different register layout; non-Nord value is 0x00a0 */
>  #define DP_PHY_TX2_TX3_LANE_CTL                 0x00a0
> +#define DP_PHY_TX2_TX3_LANE_CTL_NORD            0x00c0
>  
> +/* Nord uses a different register layout; non-Nord value is 0x00e0 */
>  #define DP_PHY_STATUS                           0x00e0
> +#define DP_PHY_STATUS_NORD                      0x0110
> +#define DP_PHY_LDO_CFG                          0x00f0

Why does it not have a _NORD suffix?

> +
> +/* Nord-specific TX lane registers */
> +#define DP_PHY_TX_LN0_DRV_LVL_NORD             0x00e4
> +#define DP_PHY_TX_LN1_DRV_LVL_NORD             0x00e8
> +#define TXn_TX_BAND_NORD                        0x0024
>  
>  /* LANE_TXn registers */
>  #define TXn_CLKBUF_ENABLE                       0x0000
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-dp-com-v8.h b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-dp-com-v8.h
> index 93edabb830af..008b17222a8d 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-dp-com-v8.h
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-dp-com-v8.h
> @@ -48,5 +48,8 @@
>  #define DP_QSERDES_V8_COM_CLK_FWD_CONFIG_1		0x2f4
>  #define DP_QSERDES_V8_COM_CMN_STATUS			0x314
>  #define DP_QSERDES_V8_COM_C_READY_STATUS		0x33c
> +#define DP_QSERDES_V8_COM_SVS_MODE_CLK_SEL_NORD		0x17c
> +#define DP_QSERDES_V8_COM_CMN_STATUS_NORD		0x1d0
> +#define DP_QSERDES_V8_COM_C_READY_STATUS_NORD		0x1f8
>  
>  #endif
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
