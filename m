Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794420768;
	b=Ohg7Yug/PPX/o+ePqZ8KuOC/OWCnet4etI47o5lfclcrzbS6stNU6dhVF6GHq4tomo2z
	 YQWAX7KTbj9lHAIFfO97loGz3LMgAklw3JMNGa3ZTzUDNcsnkDdZwpPbVxU5qcaJwnZWN
	 wr3i3EHw1cimB1thP8tbSrGSQE5FoazXZvI0heIKPYlylonB7/uVulhE277LtMcE1karV
	 EIvW4lZGQdtvIDoNPXzv5WL3zvUpbYDHoQM184GwJmyoWI7IJpbiYZrBZU52/sE44c0P4
	 Z43jvvBEQTc4Rz+dBP22WDSQJCNQewVSRXOucRkSSR75h+UKQEY71IVR1OJJOi4EKbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794420768;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=TpPJpMAeykiKgpS6Mi0eAQJ5tovbRl/3UVD0DVrSzfI=;
	b=l18RR41o8xAkKkdWMEJPAc2jCMZq6YvVAv7MijkmKD3WtKPMUlYZRhCrpL/O9+EpDPZW
	 O5wHA4R9Sspi6qvj53zQPi2wtkSbqcfaHH2yh9lc7kaNjj9gTOC66G8jfvbnc9AJ/SA/I
	 eUZQ1aCqRQ/nDwXATnp9kSBCquJFPiVTgZJ6XtdPn6iD5rY+ymhYo0cLPnLNoR/EgraBF
	 ek8NnzI66ejtUjq/AjlZTT+slyBfFCbOICXDupTSHDzCLtdWl9J10IYUT2BCNdGkWASwm
	 gsX6tZgSOnC3LG+7uC0Qo65yxLII0CSpQxxOjmcgOP+CsrIZOpsYAEKl91sMOtyLC4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ARLkfSdQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Wus2ig0h;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB629606C14D
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 18:12:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB629606C14D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ARLkfSdQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Wus2ig0h
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABHuR3H355796
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 18:12:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TpPJpMAeykiKgpS6Mi0eAQJ5
	tovbRl/3UVD0DVrSzfI=; b=ARLkfSdQVS2TC9m6CkNI798Zv9qBSMWtcTE2iZn5
	SDFjKpoOZxE5RE9jg18lKnNpM+YjZu4VFePK18NW5XOYAaFQzMjuB07KVSELqchO
	gRYClwlEK7Vhsk75GfiG7XOvQpbNp/ZM4BVCzO9OV2RWST+oOilqAEGh5omut/jM
	rQ7FIOc1238CCxui37iRvEm1QPePj9ZbMc+qCUXNOExHpSelMuQ7m7ApuTGBo60y
	TdCUmuBjUsrvXZhaUjTvB6dgPgzQ4OchwCPtEi0baTEkWSUmhr+ECWdkoE9Ge0DL
	aPkUXsIH0myPC1b2z9T1K6rQKptfUvgPBM3im/p0rb8Hqw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvtymrqjk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 18:12:46 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-948d83322f6so118064785a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 10:12:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794420766; x=1795025566; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TpPJpMAeykiKgpS6Mi0eAQJ5tovbRl/3UVD0DVrSzfI=;
        b=Wus2ig0htXxL2ImJ+M0Qqn9vdzbSiHk6XK5+srYC66DcjjSszkqpaAk17+HWKo+0KH
         T6gHFkHkMjRszsMCPfNSZuKD4e5UG6Lq+3smsfU1nJ353wTMg9EjUw+sXnRw/x7VPfyj
         f27Bv9RABd4VSY73d/mPTyTaYaC+J3xBUaNJCpkCrFnYBHlq2UN3iAFGadRTcN/0khmD
         1/LzAiXewuy7cgI9MBlKx741i61j7oE/PU+kj4MXuM+VvjaNIaJV+USQ1u5u7qji5a1F
         RDPuKPz/iST5H6/N0gBRHq62kjlIeTS56DDm7sMqypErKsPEAfHxZIhS4hiG7hfr2Msi
         VPSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794420766; x=1795025566;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TpPJpMAeykiKgpS6Mi0eAQJ5tovbRl/3UVD0DVrSzfI=;
        b=wQ05Kz8NkKg0jaOXhwDM17RtovUIww94zrFQVbf20aHlAFJM8X+XxBgk2xmdDeJxZZ
         DmU1t85JFtoaeIcfJu7y2f3o32KHsochruO/gOb5W52RC1ZmAZl/74iQEvOFGGL2cNg6
         jXvV3X6uOEjkuwnSriiuiBAEmrT0rcZcXWGEatEmmdTU1HUjZc5OvYYlKCl4yVTbE0EO
         aKcgzU0P5sfCH9VuxlR9M7oZoB3Pbh4mXecKVs1J0P33jrCppu1eeGVRLzGg0FK2fJi5
         Rskmuei5DIFhv1eHVXmVAXFqAFm37YKVb+Gz9T5JKUDuMnEQ1yyNBI9dZMFj6G9slWBs
         UthA==
X-Forwarded-Encrypted: i=1; AL+hErErNXeFQ2roZvnf0B4ukmn8Lthx46H+P3bL1m5Lwc9g2w8f57RzJGDqsXcPeIS2galGX1B1gRnyCyB8jwGV@vger.kernel.org
X-Gm-Message-State: APuU4Z8aVZq/F2Qe4dHtNY80GXcI/DeWPPeQyhwDsINMFrFonRVcoESV
	zwdJvmHHQd2qBAy1FMXD5Ny/zcNYD+ElrHqE6H7ftTu/H04uU/H6Wb8xDEyjWGrUBXHys8E3v/j
	ihBTu/HWYHSrhCB3GwTXcvrJAxykPongj1RSphVzO2eNfZHb+XRX9izSJ2OjZC6Db2HAz
X-Gm-Gg: AYBFou1oLa9E5hT9mNrRbIKp+tlRaIfXujFu/pQLQXl9kdXlcNhd4KQIdN8tqx/+S2P
	+dusoK94D2QREaGFHziOoaVivFWA1sjK1oONBVBlljv4MYW+QNhBHwNwQQNi7SL8XGlmrcJlgfu
	0CjTASt/W8v29627hpvBtXdgIf/1osWvIRueD2BgRuWAyddQOtiX9KorH8ykVcWZGo8cc8fepmG
	ZIHEn6xcDDDYaPuoqcWGoZ7Y28dmypqDxNEC/a5QAGzxelnSyIcDGWFAUyHuY+hk03DlWKgvltj
	66rENVfQYS8NRAi8RryVuuOC4bVZZZqxcbWa4+gK1O+nkuLd+i6i4vpeCrC8mcXjMIfsrXEwflT
	oCo4s9hTFOQOgsyBnseU4qm1n6R4gWBjBO27TIQ4psJHcWhEQIsOMPByXVw++BmrCIwiNa29lzN
	CDrkHFZm+g60kh9Kr7oMJzAjh7ew166xBpvvQ7GcPccHMcW0E+cmQa6phCP1kjtw==
X-Received: by 2002:a05:620a:3955:b0:93b:d7a2:83cc with SMTP id af79cd13be357-947b001b12amr487870085a.59.1794420765691;
        Wed, 11 Nov 2026 10:12:45 -0800 (PST)
X-Received: by 2002:a05:620a:3955:b0:93b:d7a2:83cc with SMTP id af79cd13be357-947b001b12amr487864685a.59.1794420765248;
        Wed, 11 Nov 2026 10:12:45 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae115a2e05sm6544391fa.19.2026.11.11.10.12.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 10:12:44 -0800 (PST)
Date: Wed, 11 Nov 2026 20:12:42 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Del Regno <angelogioacchino.delregno@somainline.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Mahadevan <quic_mahap@quicinc.com>,
        Richard Acayan <mailingradian@gmail.com>,
        Danila Tikhonov <danila@mainlining.org>,
        Robert Foss <rfoss@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH 3/3] dt-bindings: display/msm: Require DSI graph endpoint
Message-ID: <wtwyi4b4s2mynolj7pqk465cugahmtklhodmg7yehdmvubusbx@p6dhg7iwon2h>
References: <20261110-display-msm-of-graph-v1-0-0f3106f817b4@oss.qualcomm.com>
 <20261110-display-msm-of-graph-v1-3-0f3106f817b4@oss.qualcomm.com>
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
In-Reply-To: <20261110-display-msm-of-graph-v1-3-0f3106f817b4@oss.qualcomm.com>
X-Proofpoint-GUID: -4-xrzTkvRuiKJK4it9eBo9V5knbFr-1
X-Proofpoint-ORIG-GUID: -4-xrzTkvRuiKJK4it9eBo9V5knbFr-1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA3MiBTYWx0ZWRfX8P7Ub/wt4+30
 3c8kH0JdiDZ8BTMSHWfueYePRSoDR9XwRF+40ewrqFYBQg2A53YDdPn9Tmu1JYK4X7Nva6Nbvu7
 uf1eIFwQdd+Gj2xw8Y/BNgUPWm1KLupvNg2sMvClZAH2uqiPUtuYZZ8LphoBk6EhsM/Al2tKr8P
 frXl7zJMh+gH62UUt6vFVFYwZjLM9wiLm0pMmxUs/Z5j0hb+rnTE7xc0PgvEc5CkVB5Bd8PquxB
 jbYb8YI/FThwMINy/n7VI3liZpe8sKgopsh6TXNi2ztExefdaSynvxJYjWV0ZF3PpW/32feDPoO
 I1SuHcwigJX8vhm9Bl0/40t+BIGX6zAhXQCA9Elr2QNygT9Mmo7aBRJzbciJRP6nYBIeJ/uCwlb
 f4D8D1+ms2K/UE4Jme4t603rBpEtAi2/5e+ykiOghC832dmvKbWgDiLCfNn+WZb8kVWoDk+2yPA
 8gceB7BHaCY/U9s0yYw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA3MiBTYWx0ZWRfX/IjtP9P5sOD6
 75g2+IGpmuvE42SD6FvqmAiaaMc7PBYchRNmkjuXqqH8uEheg7OvK5Vkf/Eg8sn24MlRigagpwu
 DLpgW6Pjbipar47TOHHlmkh1zfQFCPQ=
X-Authority-Analysis: v=2.4 cv=Q4BHcI2a c=1 sm=1 tr=0 ts=6af4b01e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=T4xdjuEbw3p0ivj6QRwA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611110072

On Tue, Nov 10, 2026 at 01:57:44PM +0100, Krzysztof Kozlowski wrote:
> Technically, DSI controllers do not need OF graphs with endpoint to the
> panel and could rely directly on their child node (when panel is the
> child of DSI).
> 
> However Linux Qualcomm MSM DRM DSI driver never implemented such
> approach and it requires a valid graph endpoint pointing to the panel.
> If it is missing, the drivers will silently accept such DTS in
> dsi_host_parse_dt(), but later fail on dsi_host_attach() because number
> of lanes is not initialized.  The number of lanes is initialized to safe
> default only when there is a valid endpoint which is missing data-lanes.
> 
> Extend the bindings to validate existing DTS to match expected ABI.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/display/msm/dsi-controller-main.yaml      | 6 ++++++
>  .../devicetree/bindings/display/msm/qcom,milos-mdss.yaml          | 1 +
>  .../devicetree/bindings/display/msm/qcom,msm8998-mdss.yaml        | 2 ++
>  .../devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml        | 1 +
>  .../devicetree/bindings/display/msm/qcom,qcs8300-mdss.yaml        | 4 +++-
>  .../devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml        | 8 ++++++--
>  .../devicetree/bindings/display/msm/qcom,sar2130p-mdss.yaml       | 2 ++
>  .../devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml         | 1 +
>  .../devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml         | 1 +
>  .../devicetree/bindings/display/msm/qcom,sc8180x-mdss.yaml        | 2 ++
>  .../devicetree/bindings/display/msm/qcom,sdm670-mdss.yaml         | 2 ++
>  .../devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml         | 2 ++
>  .../devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml         | 1 +
>  .../devicetree/bindings/display/msm/qcom,sm6125-mdss.yaml         | 1 +
>  .../devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml         | 1 +
>  .../devicetree/bindings/display/msm/qcom,sm6350-mdss.yaml         | 1 +
>  .../devicetree/bindings/display/msm/qcom,sm6375-mdss.yaml         | 1 +
>  .../devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml         | 2 ++
>  .../devicetree/bindings/display/msm/qcom,sm8150-mdss.yaml         | 2 ++
>  .../devicetree/bindings/display/msm/qcom,sm8250-mdss.yaml         | 2 ++
>  .../devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml         | 1 +
>  .../devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml         | 2 ++
>  .../devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml         | 2 ++
>  .../devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml         | 2 ++
>  .../devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml         | 1 +
>  25 files changed, 48 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Note to myself: per Rob's request this should be applied only after the
DTS changes.

-- 
With best wishes
Dmitry
