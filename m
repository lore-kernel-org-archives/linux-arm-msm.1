Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A0450AC34
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 16:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790699239; cv=none; b=Kxa6e431JUvSQ1ZswNbztls625byL+bLdL4RchlM05VpzGMbeK7B36gCK35O4AbRSO+kVJ9xgsZIkXysbPS+mO2nh73m642WtHVCel14kkkkagi9YGNP/eTEqt3gubs2KbalPCkxvbeNCIZvBEjonGxLkAIX2F9YF4TqxHpzptM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790699239; c=relaxed/simple;
	bh=UwzeEm24s5OY4Y5mjrXh2r9gT8o/pmeXdUsHzDaA8A4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NKEhkb12qzL23nO0WFzo07h3NjBq0yY3VLXc4GmJ799pMhuxoul+LDMFD1yElvq6A/+oY8YX5P18A73bvvIbque5NKiYVNGTm2kzrA1KSk3x4HZ0frTCdU+ODJvgTjfwhSNUGOEOICQWsrmHWi52Cd2lJ2ffBSGaWZpcOcmqHUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bzKQ1LX0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DB00amz9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bzKQ1LX0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DB00amz9"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCw9Y53301691
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 16:27:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KrUCqsYTgbbcxI69a3MU7CHs
	c2hnXpP31LHoTjuw12A=; b=bzKQ1LX0ioMfaRQtFaoYw7wNI1TygoxmCOdaQ0UN
	2YjQsP+xr2FcYaTgM9auQI5uY+fAj4E/3jINOGwTIePoraoBYolDSQqIdL3ulMbL
	z6F9rM3+bIeaGFigLjZ5E8k0xXi5ue7UXZhcyDENA41YeWo3I3s5Gs5xtR+pJ1Mm
	p1ao/4TBFV4WSIfoAlYdxflUJiuHHVFNojspPP931hcLWtnZxYw/zqzT5Qq9M7RU
	wO6RM7oK84bDOyccJaGgfNpHpa8lJ/VECG5BZkImGyxWQ+CB16tPV7FLQjGHUgOk
	L9a/zczwG5ivEl6nxK4MgYQm1DNyltCTAhXhFB4Y2ru2jw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0dsx10tt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 16:27:15 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7b4f8ea38f7so2568742137.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 09:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790699235; x=1791304035; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KrUCqsYTgbbcxI69a3MU7CHsc2hnXpP31LHoTjuw12A=;
        b=DB00amz9kRuYJvQIuB+RpXAa8YPH7cjWCo5RJvcplnovfThKmYE3PbsTZVc9TxScZw
         VVQqIvQbnbz61D+s33Cc3hBE6/gUxo4A8BNSw8BxFpsXG3xC88hP9IV4Y6q0mIMpklbx
         VlVeecsUjF3nO+tR5y8p4JOfcze95FdrUd5HkUW2tRpteFAS6UIL2KTXPlEi5jtNIOBa
         eL2uXYXifDxfRDiNd2RfH5tqowf1I3Hc1cLJvnF/wijN3K1iV6YjaRW8rwi98rvOgEGK
         +zmDFBIwBnCmGBy5bwY1PuuCo8XcBYeEiywuZNPV7WrdS0Hh332RuU34nHLNbk+d3f63
         JA+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790699235; x=1791304035;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KrUCqsYTgbbcxI69a3MU7CHsc2hnXpP31LHoTjuw12A=;
        b=WrymNNpWGQ1D60PoyLlkx7mNMshwp+4MkRWqURZIHT8C1/R3SZjFmAEKVwTeHomGpz
         NEPEWVNfjTr9pXubINMsHJUHbilBlQ3PSKy8iEG733dJE/xm2lk4uyiGBTdeu3q/oCwK
         qw4oxAW5f7S2zJULV0ODzfeBL9Uf7EwnSIlIVHDTTDN9XSUjQR8n2D2bvXAVQ0VVkQ+e
         lSDH7mHWyztPaEGsZRq8HaXZoZMoFrvF7eUNnTfEBhVTN1kA5K6qx0BzL0vgsTgWoZSs
         tB7aL0yRiLukmsVs3HRU4onsDC7dg4XMfrRZMZ3AtWSmK1VCEN1vmjgIYb22kAK0QpNm
         MwSQ==
X-Forwarded-Encrypted: i=1; AKwUvBxXaQyrK3K6pYs0aHOprA3ubnnnOrurdliZSQhaJCunmwzPkeUnehtNpJnhQq+1eE6QljoN8tjy7qStCzgT@vger.kernel.org
X-Gm-Message-State: AFq9FYJLbrINpckmslOMHbHo6TYXC2ljoddAa7cobi568xbW6qGCrf/J
	eQzcOOtJfUk+P3Dv60uqS4DxZaL1NHqr+YWuJEgBmm3UJN+3cG7zGID7lTmHSLGWe/uXkxF4QhC
	taXc513FUEk7jPBjzRLn70s2y4QoVnaVVRz9aIwvkneSpeioaWikU2mi7usIkWpzRx8xy
X-Gm-Gg: AYBFou1KjIkpb/dvZYDC3ACLytdIFE9XEzRueYJsVT5jXJ9UMSfbH2JaYU/1oE4GSqn
	olv6qUWIBp2Qt9XU9nQ9Aa7pQD4wU1imsBI5bYDLKoadFoMfAcjqGJgUCODAlXGEUKRl8QT/hUJ
	79I0g2tGRD4+JZtX/a+UlErve5Cdsm3jHQ99MDi1q1wlq7LTd74GeKCYaPqIsq25iRi2e2Hcnsf
	uYcAqC+cu5ILpjRXbGcdarwudAXLjQSIrMOVb2NNYocKbmnmMEz6Av7LcPWnvtXLg7n/67i+sQ1
	keMUOE4hOoS+CF57GHS5Cd45iAwmciicxjHPYhr90uujOODmYV47Awoe3hMN5WTHTPOkOEMA3hL
	ue8Cs9KOJ/4geR7mnMrURisLERSdQE/ZXTF6zwsUd0ffv0WnV6+YAwDmL5yBq8+yVtbTBCtIEGD
	rdINtlyiBVkGRe
X-Received: by 2002:a05:6102:8508:10b0:7b4:2acd:fb9a with SMTP id ada2fe7eead31-7bc3d68f8d2mr11476137.25.1790699234714;
        Tue, 29 Sep 2026 09:27:14 -0700 (PDT)
X-Received: by 2002:a05:6102:8508:10b0:7b4:2acd:fb9a with SMTP id ada2fe7eead31-7bc3d68f8d2mr11463137.25.1790699234157;
        Tue, 29 Sep 2026 09:27:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a77171003bsm115851fa.3.2026.09.29.09.27.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 09:27:12 -0700 (PDT)
Date: Tue, 29 Sep 2026 19:27:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 5/6] dt-bindings: display: Add Synaptics R63455 panel
 support
Message-ID: <2iiownhw67anqqcxgvfff3gyejjzwwfxtcy4kvst5j5yg7hiy2@bry4ol7alvp6>
References: <20260727-sm8650-7-1-bonded-dsi-v5-0-c042266b9eeb@linaro.org>
 <20260727-sm8650-7-1-bonded-dsi-v5-5-c042266b9eeb@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260727-sm8650-7-1-bonded-dsi-v5-5-c042266b9eeb@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA2NSBTYWx0ZWRfX5UJUary92ugv
 dL4g8cIdg3osCws40tTCvJVQjLiYljx/WNmcQNgu8P5VsbpYB6BfzUpDM5VDgnCZtMxWNULGanG
 aEoEqIQ28f6wHjDCqz+S5WNwjcC/ep5iR52q3uqnOQd82+OuSQcUU4LSIg8W2vPrQshHdbwHw8j
 7PWBljPrkL5pw39K22ohrr+EoJsIOBuOlaTDZORx5Bd6kdM+Lm3tB8R9+n6ndllNNgyA68UJvTv
 x5+JS0bDfw6lUFDvT5prD5ZtcEYqXqwS/aZRWhFpmAt4tUuB7AU8JclQEjU8U13ybJ48LYRUKgi
 5HlSWUIBPutKa7rvV/H6VuITf/n1b9w+yNWPIx5R69Sos5SP4VqMsmRDCJKd55ItLxp+5/rN/YA
 AGaTCTx75nZMv+5yFvR/60muvXXN1WD1LWy1NlYbfCfr3FCkJudPeDEtSzt+UtbtFdZuUo6Fe2i
 5oOov4MSHvuq6AvkyMw==
X-Proofpoint-ORIG-GUID: jRob1ISDUM7ExM0oMrrPhZO1TfJaIGA5
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA2NSBTYWx0ZWRfX1yQ7/G2CgoZd
 sMSDF8pf160Ga85UJ3Prl/5yTNLIPduarho6kWSsR40rn7K4PIGbthdaE2W9oRQW9/XHmy58sR+
 1O2imtQ5t7brq3ajpQ/JzqkooVXzn7o=
X-Proofpoint-GUID: jRob1ISDUM7ExM0oMrrPhZO1TfJaIGA5
X-Authority-Analysis: v=2.4 cv=DqvDa2/+ c=1 sm=1 tr=0 ts=6abbe6e3 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=gEfo2CItAAAA:8
 a=KKAkSRfTAAAA:8 a=5IMEwuT189ni8Q75ZTYA:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 phishscore=0 adultscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290065

On Mon, Jul 27, 2026 at 04:08:44PM +0800, Jun Nie wrote:
> Add support for the dual-panel system found in the virtual reality device.
> This system consists of two physical 2160x2160 panels, each connected via
> a MIPI DSI interface. The backlight is managed through DSI link.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  .../bindings/display/panel/synaptics,r63455.yaml   | 133 +++++++++++++++++++++
>  1 file changed, 133 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/synaptics,r63455.yaml b/Documentation/devicetree/bindings/display/panel/synaptics,r63455.yaml
> new file mode 100644
> index 0000000000000..c3bc8df981df7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/synaptics,r63455.yaml
> @@ -0,0 +1,133 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/synaptics,r63455.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Synaptics R63455 based dual 2160x2160 MIPI-DSI Panel
> +
> +maintainers:
> +  - Jun Nie <jun.nie@linaro.org>
> +
> +description:
> +  Synaptics R63455 is a Virtual Reality Display Driver and VR Bridge, used in
> +  pair in Headset devices. The Virtual Reality Display complex is composed of
> +  two strictly identical display panels, each driven by its own DSI interface
> +  but forms a single virtual display for the human eye perception and thus
> +  requires a strict synchronization of the two display panel content update.
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +        - sharp,ls026b3sa06
> +        - boe,vs026c4m-n52-6000
> +      - const: synaptics,r63455

Judging by the Synaptics presentation at MIPI devcon 2018, R63455 is a
DDIC which supports only one panel. The VR bridge (in their case it was
VXR7200) drives two separate R63455-based panels. As such, I'd assume,
that this hardware description is not 100% correct.

> +
> +  reg:
> +    maxItems: 1
> +    description: DSI virtual channel
> +
> +  reset-gpios:
> +    maxItems: 2
> +    description: 2 reset pins for 2 physical panels
> +
> +  left-pos-supply:
> +    description: Positive 5.7V supply for left panel
> +
> +  right-pos-supply:
> +    description: Positive 5.7V supply for right panel
> +
> +  left-neg-supply:
> +    description: Negative 5.7V supply for left panel
> +
> +  right-neg-supply:
> +    description: Negative 5.7V supply for right panel
> +
> +  left-backlight-supply:
> +    description: Backlight 21V supply for left panel
> +
> +  right-backlight-supply:
> +    description: Backlight 21V supply for right panel
> +
> +  vdda-supply:
> +    description: core 1.8V supply for panels
> +
> +  ports:
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: DSI input port for primary DSI link
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: DSI input port for secondary DSI link
> +
> +    required:
> +      - port@0
> +      - port@1
> +
> +required:
> +  - compatible
> +  - reset-gpios
> +  - left-pos-supply
> +  - left-neg-supply
> +  - right-pos-supply
> +  - right-neg-supply
> +  - left-backlight-supply
> +  - right-backlight-supply
> +  - vdda-supply
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    dsi@ae94000 {
> +        vdda-supply = <&vreg_l3i_1p2>;
> +        status = "okay";

There is no need for the status in DT examples.

> +
> +        qcom,dual-dsi-mode;
> +        qcom,master-dsi;
> +
> +        panel: panel@0 {
> +            compatible = "sharp,ls026b3sa06", "synaptics,r63455";
> +            reg = <0>;
> +
> +            reset-gpios = <&pm8550_gpios 3 GPIO_ACTIVE_HIGH>,
> +                          <&pm8550_gpios 11 GPIO_ACTIVE_HIGH>;
> +
> +            left-pos-supply = <&vpos_left>;
> +            left-neg-supply = <&vneg_left>;
> +            right-pos-supply = <&vpos_right>;
> +            right-neg-supply = <&vneg_right>;
> +            left-backlight-supply = <&backlight_left>;
> +            right-backlight-supply = <&backlight_right>;
> +
> +            vdda-supply = <&vreg_l12b_1p8>;
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +                port@0 {
> +                    reg = <0>;
> +                    panel0_in: endpoint {
> +                        remote-endpoint = <&dsi0_out>;
> +                    };
> +                };
> +
> +                port@1 {
> +                    reg = <1>;
> +                    panel1_in: endpoint {
> +                        remote-endpoint = <&dsi1_out>;
> +                    };
> +                };
> +            };
> +        };
> +    };
> +
> +...
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
