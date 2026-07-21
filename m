Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4225742A786
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 10:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784628012; cv=none; b=AR55QzfmnufGNCz7cFtx/cuAZ3WlKQiDO3+MGYPlFX/XNCg+Dny8oirbNHgomjMWAdBZGN3jEc3DxBHY9px5klIJ/lvIzWwWra8orez/KA42O98Hb3EOpjzaVvxDUoSNqZtsQeYTUi2NQdwrpeLO4KkAfFoHb3qMB2DqyB9PW4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784628012; c=relaxed/simple;
	bh=LK/eB9AmpdkVx3ygCibEBSbpwLFzjBH+wekYBxrfbkg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q6BHPUKYAvlc1t1Bd3Jb35gDzg/2AbtyCFUTrkTXeaeInVa8SrLDr7Tw8wWT0O2HdmRUVtZdKRZ1Q3B1/ya97ol055Iw4wP40Ez1RbwTOxNl5FqhvnqWnMwOGzUYzM07BiurBIZVCIh+TA8tjSDsBSbT50Irn+HYaaHnjnKTHs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VWW+aNHG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RbJF4Zo3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VWW+aNHG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RbJF4Zo3"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L9xS9Y045338
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 10:00:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bsdv14D4IxQYNMax+mx44nCO
	kZw//LLz461u2K+lOMA=; b=VWW+aNHGWqA0/XmozIT5Puye5Zgn7Wpi7l5PVMeD
	ZHdcR8NbuSGHOhh7mEf4vspUoYBiJYy3j2xlcZTiWNNs2g0MYvNTxgxHnXTsLBWT
	3N+MgwOsmMvDJF428V8R9ohtkEF87ucLk6lVAUy8UxPHe4fi7b4qaTW27VH84BNz
	PxJScPlxLDSobJRFFhBu7qR5IZZBk+C6VU37et3BvtTYdgsVlte7W4tj68PnV9/w
	WVOVAOYxRXLPHM0xTf4qhSDQOVzPSNR6Or1FpDtkyLRgo8chMjZjEipgePIAu5rx
	EJbjCXmEcfzG69hZC88jcRHe8zIWkq8w3OcJqr+Y2HJFUg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhqv5utbu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 10:00:10 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8e934385db1so231018986d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 03:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784628009; x=1785232809; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bsdv14D4IxQYNMax+mx44nCOkZw//LLz461u2K+lOMA=;
        b=RbJF4Zo3bJ/2z8agefDHfjNku6cyyoz2+Rsgxr6zohCHaRX1TG8msEp8tRcJlU+Q8c
         HgHkeLicpUdJfAHSEUa/xrcVP58gF1wrEFhz8l156rNrOqK4xyc9M4p/JW6cs3dFnk5Q
         X0s4MOAm/SsZzktS6TYnA0MNVR7BjpiSOIa89jaLApg2Jvo1/EEYC7JWVNJacUmEbYli
         fQ1ZWxenw1Ge0pQJA9SSbdTzXt2lwsOuxVFJA5VTIJJehVeQAppdY3qPedtIqSWwjjCF
         6oOKiMnSrXa8hVvyAju41DqLnhlY1fDlv36Pgf+rbojFODGXIFWudu/vqFfwtv2E9QR8
         mtcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784628009; x=1785232809;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bsdv14D4IxQYNMax+mx44nCOkZw//LLz461u2K+lOMA=;
        b=b7AClyNREBdgDkf162rFfe7FxLb0fobV7oBkR1Jy6Pa+quZRMmCotPqNlFAFgQuURf
         jKWaAg6sAjt1nWROaCX8izJpyJVPMIKtJExo7Fl3m57QQNxE6YnnXTytoTq5/iE84NNc
         HjUNe85w9J1cl0MdBVE2z5LJmvSJL1Dj/Sqn0TB56RctZD8hJeQaWUXnKhNUBMqd57bH
         gLp6g1EfQTDenqFJWYiUHRc5loT44b+7Dllsdpb+xvbJGEzKQxN6Fe/UstgMabccw+Jf
         7wfyJYyD/VFMjDk0n3yXy6mpRnQtZP2Bg+po2++r+28TsP2PvraDqvdQutojSRtdmLnB
         SjZQ==
X-Forwarded-Encrypted: i=1; AHgh+RosPpExRYSXBIutPlEcowFKyNg39w0KeIG9kcw6HxYfPpyllPiZHf5JMOA87ZSF+fi7NpxkPJDbyERt5YV+@vger.kernel.org
X-Gm-Message-State: AOJu0YyuvktecDtoSUMf+etV8unYrlAutpXwjZ4Sd3JVA4kCCmBFOnYm
	+f8cIj3P/JIs/P2m3b6d/DDIPKuqkqMqGKCoqTZYcG9xemNQJGf0QUBHyVv/L/QmIUqwEVq98td
	QISQj4+u8JK2aTBHZyq3bIzi+rI6DPALuIaw284Kudp6Tgp2AqG/IfXiVY/u+ePUINR3S
X-Gm-Gg: AfdE7ckkjaZ2DJNjraj6hfry5mD3QbO+BaFQlQsXN5v/5znPIPELGBh65CfmtvehejW
	ouVMExXJw7LzGKx6usQnKeQbxE9kfp0jI99CTAreCSorJzcjhbgk1jirB+LdgIA3pjxPdmQp2OQ
	BdUpYj3ZeqitD2jYvOOkLeqAAT0k5X2nQTvL/4VZ8jw9gqG222gIV+TYlpZCo/O+QYgWlTKIB03
	0yzjilzSViNj0Eju/qdFKeevgs07PkhLsmi+x4AowupOUaKJ0cvrUBnB7wiVD1cOEUVUcali3C+
	4jUs6AcGNtHRh7Z1Ri8/w511cs6YSz/5wPgW3Ds3tOPfrQMc5iA8adhQzIVoWpUAmgsTZTySYQY
	ftUKMnZcVRu0LeC0=
X-Received: by 2002:ac8:5893:0:b0:51c:7b13:62f8 with SMTP id d75a77b69052e-5213eb800b4mr163986051cf.78.1784628009031;
        Tue, 21 Jul 2026 03:00:09 -0700 (PDT)
X-Received: by 2002:ac8:5893:0:b0:51c:7b13:62f8 with SMTP id d75a77b69052e-5213eb800b4mr163985441cf.78.1784628008427;
        Tue, 21 Jul 2026 03:00:08 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f7feea1cdsm5601633f8f.32.2026.07.21.03.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 03:00:07 -0700 (PDT)
Date: Tue, 21 Jul 2026 13:00:05 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: qcom,milos-pas: Add Eliza
 CDSP compatible
Message-ID: <47fumz4dgsszwcvmrktf6soebwscquk4tofvszj4grukimahgu@kj2vn6vsiydm>
References: <20260714-remoteproc-eliza-cdsp-v1-0-32eb7a1f2c59@oss.qualcomm.com>
 <20260714-remoteproc-eliza-cdsp-v1-1-32eb7a1f2c59@oss.qualcomm.com>
 <20260721-benevolent-wonderful-kakapo-ca8c2c@quoll>
 <6tmbpelyk2ngvrfmcpb5owli7oo54u63i4w46jxbbj5g3fppv4@4amnegv2u3bs>
 <985af176-362e-4408-987c-dcc8d49d04ff@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <985af176-362e-4408-987c-dcc8d49d04ff@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDEwNSBTYWx0ZWRfXxguuIUN58W8p
 TVrvAkDJnof07sdMQOMdFWHxsU1GCOLq4VVqoK/MrqYntveV1xGty3m0ZHwhLLeBgjdbcbYjxYP
 3L6XeaCejfwatadJCzcJcWy0qjH+2VJxMa5omHKE3bVUau9bs65VsixUJUBjdQI1UkWbfBqEgCI
 hZ72Jx1mII/ujxeBXtGF10Cx/fRt+npT4/EQBqsCnSuwKSFyCVtCiehZfWyOkP02z3Kfvnc0Muk
 YkEU918lqjpOp5quhoBKEIIFRiU3BJ1gKJyiVozlx5esaU+u0FcAeOlgefp+fTfi8HDKbNf/y3i
 PIgN3Fo8IEQepm1GVekBK7wgOVRgS7XN/sCVU1N6ZZGTlZMQK2q7npngYnwto605rV24aD3bfVo
 5ImfxZkVKezt7Eurb2nc6FB6sEeChEjhM+qGdC1i4jfsnKBOf0s3bvo2cs+vsdWCQbMUH8rZg7T
 YPbk1YeX6PUMjcN6Owg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDEwNSBTYWx0ZWRfXwqvt3lVz9QSP
 lJxB0Gm1igQRktpmnHmPKw8RvN2kQm3P+9mAbGgscfvFrCwcyvLHjTzRJwevgwPcFqrnR9XhNpr
 elIHTlRUthFkmgV0Hjwc2ragu+B+SzA=
X-Authority-Analysis: v=2.4 cv=WNpPmHsR c=1 sm=1 tr=0 ts=6a5f432a cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=_SLZKor84fVAIWECWX8A:9 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: do-1htOsmDhMg2hugLBLxlF7_Y0Aj16o
X-Proofpoint-ORIG-GUID: do-1htOsmDhMg2hugLBLxlF7_Y0Aj16o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210105

On 26-07-21 11:45:57, Krzysztof Kozlowski wrote:
> On 21/07/2026 11:42, Abel Vesa wrote:
> > On 26-07-21 11:22:52, Krzysztof Kozlowski wrote:
> >> On Tue, Jul 14, 2026 at 03:24:01PM +0300, Abel Vesa wrote:
> >>> +  - if:
> >>> +      properties:
> >>> +        compatible:
> >>> +          enum:
> >>> +            - qcom,eliza-cdsp-pas
> >>> +    then:
> >>> +      properties:
> >>> +        power-domains:
> >>> +          items:
> >>> +            - description: CX power domain
> >>> +            - description: MX power domain
> >>> +            - description: NSP power domain
> >>> +        power-domain-names:
> >>> +          items:
> >>> +            - const: cx
> >>> +            - const: mx
> >>> +            - const: nsp
> >>
> >> No, do not grow the ifs. Eliza belongs to class of SM8750, so I don't
> >> get why it was and it is being added here.
> > 
> > I'm assuming you meant SM8550 here, right?
> 
> The SM8550 binding file, but Eliza is SM8750-based in general thus I
> would expect it will be documented along SM8750.

OK, will move it in the SM8550 schema then.

I'll move the adsp one as well as a fix.

Thanks for reviewing!
