Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DCFB2BE034
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 01:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786497687; cv=none; b=ry5D93Xg0IjI2n9dD6WYmk8/ucv8FyoMmhS5KMGRYbsxkWuykCop/4Hm2csWdKAx/NBTWuTXad8dDnMiPZOOqPBWAmbwtycuz4XFYNLtP6Fk07kJt+B2MJe7BmIpDh0CkPCUp6R5RgLoHCp1b5pcxUM4BMF2chrQT5PJdnYQ7xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786497687; c=relaxed/simple;
	bh=9UYl61WOmOuArFng3Xrwkw7uxon5EPQbUBcRNOj54pI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kQKRcDCXHfpzwcPzUfWMaufCx55zQ5ZB6taJWI3FXw5s03kICx0Kyn+rtO9UtmNp3lXa6ySz+fSMCf72EjddGh6rl2HGCyJ451N4CvPra9UOYE9epOGm5xudTjUFzm2Zr/o0B1/vvUPHrna7LvpmNEyEOmZFSDo/InkQet00ROY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=icWBn7Aj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z0ny01Vw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="icWBn7Aj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z0ny01Vw"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BNH1n73209067
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 01:21:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5a3XBzcMA6vkW7LRI5Be/dhO
	NOD7PfEohmvAk5RCvEA=; b=icWBn7AjaNso3Q5fLbRB60DIvvB4jGkoxD+iaD1y
	HsoPnruWyxwSx0LWxjhJyQZL9zY4cRC+RefHozoMGSUbLZZOL01rq6BsNCpZqvTu
	535BhWfUnxNbop32+0SCi+DPmNeHZMHN2sD7UseyFJBVsMo/lIlUZAK6fbkgyoiM
	Z8qsjhSW7cTAxDK/6E/gdaNVG+BDJdpRJSzNU+wg0rhzvqwnKBLRQpXpbVBdKcbb
	TffZjgB2ne85pASICW94OvfCOwlDI3HtzLKQP8eh4h5MKflMeyWnscVnUOSZidnO
	ggw2S/dW7fPz45aUG0BW+fAvCK3fXqIwTyPEFRIE1QzUYA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g049btupj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 01:21:25 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c860544c077so772643a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 18:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786497685; x=1787102485; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5a3XBzcMA6vkW7LRI5Be/dhONOD7PfEohmvAk5RCvEA=;
        b=Z0ny01VwH0G7nl28K8R0UMnxhrXFZvsq8I9FLJkKkbho3HmEypcpI7AAgJKO3bXctc
         sVniy3ORN79ktKnLmCoobF8W1Fx2S+vS3seJoFtkh8wOPJ7Sc1azFO9omfxk9XHM43+/
         lStbr/3GfY95K4PfE0PkT9NIQM5DrGI/dW56asXNKf+vn8ueDxsCj9L21NXq0gxFamAt
         ZZHcTkJubuHUbB6Dm3/jB6ZG++lCgLGWgs4DBioEI7WmqAs00JQ6pbkpzWDk4GPUKAPR
         8MWnsAb+Q4uEZuDBOuc1DnqFBWi+P1SwJVyfajuijfZxxY/gvCyVcb0FE21F8rbaCapa
         0SvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786497685; x=1787102485;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5a3XBzcMA6vkW7LRI5Be/dhONOD7PfEohmvAk5RCvEA=;
        b=nSxaQmtf9Qeau6Qh7OpvM1GUeFdTi54Os3QbG6j0rSRKpM8+j540nR8GRL1AiX0NHy
         2KQbLI3Ih7ckM85MDyXFqABCJa6ddKGFgFwu4MfEDSI5LLspor850aIoUXoTBqeKsxCB
         GaTuHdL1EH8I0XfFfvu9pltJNnBFiwwPX9+6s0z6FnF++Bppx9uchOIjjRo6uSWpD/H7
         f+ZIRKjjYXpRiRR37jhjVz4b+IlBUMP7o1sRgvy4m2PRVUbdTUdTi1DaLPtSPZQ58MBj
         uIfTyyPcfq0ykRYrli1uRGWP8DKKqacxz2lHtxMp8HmdQbb690TusTS0E9Jx7uULKDZo
         oixw==
X-Forwarded-Encrypted: i=1; AHgh+RrTPxpTnSBuAvjWoYd9x7YCJWVT+bX3//HMAINE8eoSPYvb/tSgcKUe1g/Y5jM5eAe8Mk0xvO5sm2b88u+h@vger.kernel.org
X-Gm-Message-State: AOJu0YwXcPdshPdKv/lT6+JglIpxpaSN1/bbn/mmBaQAIAh3+fD1Yf/Y
	a73PjvyJM68GhRLiIafk8kzzOXXmNyHUrx09uJNJqV4k2CM3GeGxkrstza44Y9hx6deCFw0WopF
	YBWu6pCNHRHfTXXmIAcJzfPIg8X2NuPFkdnzcylZOR24crSYIeqIDs/8CSP0dMpNGJF2I
X-Gm-Gg: AR+sD13XjHqPqCGV1V0sqpi/MxL1dH3+9xMe14YDUODR0x/+DvH+871yX9ox7B6RIgQ
	pK8fy/RlPvJP8STnwNPBHH/nHSqUQTnNlcgBAanyUUWt22vUkRFg5pmykjZCC+TJX8H14dq0V1E
	wKvkVkl1VC/ND+VH5umN0ols6JNMJHgEzHh44Ut9zd4gJaq6r4WzWzm3QbA01pS31Em4UpspeT7
	YN5bJIpMltfraUoX3M+D6sWi52nkcxa8GCzddC3g5pMG7ugwu2LxslXArC7D+JCGu9r3SsCSAJI
	jx0yd+5qMF1m4hlHSKFlM8xowJqSta5nAV1G5zC3DUcvHBwA2gAQ/McIzQ36XBTSEfLf17QqHQK
	OB6xpXIXREqXOgN0j6E6kn/FRmyHzaVPGwaLK1ERDbLXDeKUJLT7Dfw==
X-Received: by 2002:a05:6300:95:b0:3c3:b57b:6285 with SMTP id adf61e73a8af0-3cc3f5cee4emr1257761637.13.1786497684828;
        Tue, 11 Aug 2026 18:21:24 -0700 (PDT)
X-Received: by 2002:a05:6300:95:b0:3c3:b57b:6285 with SMTP id adf61e73a8af0-3cc3f5cee4emr1257699637.13.1786497684277;
        Tue, 11 Aug 2026 18:21:24 -0700 (PDT)
Received: from hu-mdtipton-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31cf3624c6dsm5983243eec.4.2026.08.11.18.21.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 18:21:23 -0700 (PDT)
Date: Tue, 11 Aug 2026 18:21:21 -0700
From: Mike Tipton <mike.tipton@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>
Cc: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: clock: qcom: Add Hawi camera clock
 controller
Message-ID: <anvKkfkiWEGk6ODs@hu-mdtipton-lv.qualcomm.com>
References: <20260723-camcc-hawi-v1-0-7057658c5c47@oss.qualcomm.com>
 <20260723-camcc-hawi-v1-1-7057658c5c47@oss.qualcomm.com>
 <20260807215046.GA2074060-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260807215046.GA2074060-robh@kernel.org>
X-Proofpoint-GUID: gyaWYXLTxpz0iZ1gcLpvdRARbC2wm-un
X-Authority-Analysis: v=2.4 cv=ENg2FVZC c=1 sm=1 tr=0 ts=6a7bca95 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=ln3hM7--VPYWvVz1xlgA:9 a=CjuIK1q_8ugA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: gyaWYXLTxpz0iZ1gcLpvdRARbC2wm-un
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDAwOCBTYWx0ZWRfX6bPrwuQ/3mj2
 +s/FYztVWpMG4qABMSM0oY0Tvz6N5XsTCNnzwvOgGdoQBPM9pW+Uc/HCuSaG9guESxnNQPmVNXN
 Cly7CDlB9Qjg7nqdDhVy6ZFmsi4ebyFBApYsQ7vUX8VPN7/zgZX7j2j0wBpo55/4fg3d9SnTyfs
 IZ/cEK5N2LP9m6yKyuibrzcM1SkDswQD2YavbEG9QtrYETPqA0q0r8Gvu5gPCz2sPZky+Jf5Hwf
 wLiBYD/YUxSEU6QMqmLat/VSVj75T9XKgSzk/nIekpJ3j9DttrZOMsBmA6QjlN8dSKOtx6AGuvt
 7PZwCiB0cZ1Pr0VAyov41Ben8y3vD+HZSt850iKI3A/gssnNL9so1v6a6aU5Solm2BFvqR/NKoe
 3pcFniFV6JHB1l8teRj5o2TT8wH5s+ASZ5FB60ST5kZ2MLmNhvbUvBEX3De+9qv3zDiiAmRMqNP
 9uNzFcki3JLfw9U37Ew==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDAwOCBTYWx0ZWRfXy5qkDyghN1CU
 BmLHSPiP/ZKAzatvv/HD7VIVrBMDWau8z5g0zjrpdQkpBEVpB7d9cwo5l2WhU5SnC5KwDIsLybB
 pKWWVUdWU+5XVUc1J2ohQ9pf9t0mopY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_06,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 impostorscore=0 bulkscore=0 clxscore=1011 spamscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608120008

On Fri, Aug 07, 2026 at 04:50:46PM -0500, Rob Herring wrote:
> On Thu, Jul 23, 2026 at 02:38:57PM -0700, Vivek Aknurwar wrote:
> > Update the compatible and bindings for camera clock controller (CAMCC)
> > support on the Qualcomm Hawi SoC.
> 
> That's obvious from the diff. Explain how the block is the same or 
> different in Hawi.
> 
> > 
> > Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
> > ---
> >  .../bindings/clock/qcom,sm8450-camcc.yaml          |  36 +++--
> >  include/dt-bindings/clock/qcom,hawi-camcc.h        | 165 +++++++++++++++++++++
> >  2 files changed, 192 insertions(+), 9 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> > index b41247b257b1..cdc19418c064 100644
> > --- a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> > +++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> > @@ -16,6 +16,7 @@ description: |
> >    domains on SM8450.
> >  
> >    See also:
> > +    include/dt-bindings/clock/qcom,hawi-camcc.h
> >      include/dt-bindings/clock/qcom,kaanapali-camcc.h
> >      include/dt-bindings/clock/qcom,kaanapali-cambistmclkcc.h
> >      include/dt-bindings/clock/qcom,sm8450-camcc.h
> > @@ -26,15 +27,21 @@ description: |
> >  
> >  properties:
> >    compatible:
> > -    enum:
> > -      - qcom,kaanapali-cambistmclkcc
> > -      - qcom,kaanapali-camcc
> > -      - qcom,sm8450-camcc
> > -      - qcom,sm8475-camcc
> > -      - qcom,sm8550-camcc
> > -      - qcom,sm8650-camcc
> > -      - qcom,sm8750-cambistmclkcc
> > -      - qcom,sm8750-camcc
> > +    oneOf:
> > +      - enum:
> > +          - qcom,hawi-camcc
> > +          - qcom,kaanapali-cambistmclkcc
> > +          - qcom,kaanapali-camcc
> > +          - qcom,sm8450-camcc
> > +          - qcom,sm8475-camcc
> > +          - qcom,sm8550-camcc
> > +          - qcom,sm8650-camcc
> > +          - qcom,sm8750-cambistmclkcc
> > +          - qcom,sm8750-camcc
> > +      - items:
> > +          - enum:
> > +              - qcom,hawi-cambistmclkcc
> > +          - const: qcom,kaanapali-cambistmclkcc
> >  
> >    clocks:
> >      items:
> > @@ -67,6 +74,17 @@ required:
> >  
> >  allOf:
> >    - $ref: qcom,gcc.yaml#
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          not:
> > +            contains:
> > +              enum:
> > +                - qcom,kaanapali-cambistmclkcc
> > +                - qcom,sm8750-cambistmclkcc
> > +    then:
> > +      required:
> > +        - '#power-domain-cells'
> 
> This makes #power-domain-cells required on existing platforms. That's a 
> separate patch and needs to be explained.

It was functionally required already but was never documented as such.
All the pre-existing "-camcc" compatible devices register genpds for
their GDSCs. And all these camcc devices already include
#power-domain-cells properties, so this change shouldn't cause any DT
validation failures (at least for any in-tree).

It could certainly be moved to a separate patch though. Hawi isn't
actually changing the fundamental requirement here.

Thanks,
Mike
