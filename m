Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0011B377553
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 05:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790746062; cv=none; b=OWxenEoaRXSZ7oe8TyHQ0BuO0wb2siLqff7JEeDdXrpsODv0Kn/DOnwl1fXF8q8gYH240BFr0XcLQrrHRZRL7wpUy2joKGtw5VLU2hybQrlHJANc4M4XZd2YRwmhqifPXeOhgZd4zV8MeBfCEaaL0bqMDFJSPCMgC3xuPi+WRvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790746062; c=relaxed/simple;
	bh=xfDGpQNGJre9u7xiddz0LBjMkLCm7TSvQ548tiK6mr8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iVo2MGqsBHOqMvZ5rHv8phkohfTiX4rcIE35EfgGTdeZ+dqpe+r9GL5DISIKPTXMqrWdQ0Dy+Qhjf1KHZeanadzl8cgptBJ1UavJnTqOJFKu7PmqFBOkuvbB1081xHojRefiVTid2AaNq+HGL2noJHkQD8gdWU2dtZ6JHVwOwYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lv9kgHdE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J4ZurM41; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lv9kgHdE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J4ZurM41"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TNPwSn2876889
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 05:27:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9peh67OgvZH3C1vmA/mVc2eb
	alFa6I/ZD9JE1WMeqWA=; b=lv9kgHdELLTnFWB/RCoXHZ+ckoLtE4Gvnd89SOKl
	DOHMU804gJu5pbnNHSd5hUkrpT71dbEJMosIBHuiH+8pOjLSPDLTbpUzRwo5f4Eg
	+Kz0cpYOX8xHiANU4q+qeHk6el/q88mGigLokisJS8DJV0s1KJ2jx7pPrVPag+NR
	Gc4pBaSl6A9mdQEcBolGD13eFJKL5RQZGqLx6kCxQnsTcCT+kEYEdN5EYJUP3KOr
	4HwvjpL0NxAsW85tNIuzWzgjcs+AqRdAyoyNU7JDyFwyIO9YkzX9ucDRBCTML+4I
	WD5ZMhIQ36OrQIqwpEF22wMy7+oNIr2u26RdcFvgYGK+rw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0et2bkuu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 05:27:40 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33713e5e6daso7314096eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 22:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790746059; x=1791350859; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9peh67OgvZH3C1vmA/mVc2ebalFa6I/ZD9JE1WMeqWA=;
        b=J4ZurM41sqcTUKtEzRdRTsWdnZqMCnKaJLV/oYxND/oC975NMKpz2tZX+dNsUtMB4b
         XY2bwrj1MkwPW1KQPsI3R3qrDiTLcgligChgjZZyeD8yJjdVE1vXeVYI9c/KrRN42Lsu
         nCXgjBRztAhdQFZcvTqCyEAvh5+bcsefcb4FHO7fowb5KX+glSIF7XqlddtwCe6D9nhJ
         S15sgVFOwH9JX8RDj3IrJjOfztdbO5Dcd/WmOVfCPYf93Cb736kT1NLmJD71u+mUihgm
         8nJ/FLViJfwtYvDxbk+ssVjgT/+LsHg90Tnp7KWaBO8mNtQF0l9rzDNOL7D6+7Cg3gCZ
         VDFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790746059; x=1791350859;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9peh67OgvZH3C1vmA/mVc2ebalFa6I/ZD9JE1WMeqWA=;
        b=GShXfEDp2PQ/ZVhU5MzjzMCK2VGvgYh+hJTNxwWvj7a3WkCIT1XiqcSNMAqmpjF4bn
         YGzN8iM0Aj20v/taf0wucUmookN39FDb++davA8nAowqcqOuRRzsKryJkWYpQ0IICayN
         Ylr1REXFt0ObWKVDJq4DOI2U+O1hJMgYjDTU0NCd5hWt9b0HpwDscDh+UAXfKG8SCUXk
         P0sOQeuHzObA/qqYLcFqtqtHQc6WYGFUVDkee62tF9XrFB4tly6MrIH6m+y+bfuZEOTx
         bOdx9DS8ucg3rNCBFo+Yw89SjisdDHbRjl4cs2OvQ37EcH/3fxxHhzNQwR9rFTd8LJfd
         P0vg==
X-Forwarded-Encrypted: i=1; AKwUvBwnYw4WDsIZWMxqrBDpHuzASkaxL4vv+qtYpgeqU2p54QB0uY1WOngdiU5/9VvROGnR6TCSNqSx7yUp9JJG@vger.kernel.org
X-Gm-Message-State: AFq9FYKeLziiwEQb5Jxd82QzQpvhAaj/soilE7PKkR7gPMOa6qHI+8UR
	Fb7mOTzKRC3zQFGnD3GEXJGzr2YwERRBFcYtY+Wk1sZMoG6VRDuCTBNvDBbcAu3r4owpK7/S7JV
	9aXb+3gGfK9BcJ81eYzBEpKvLy3uEmTpzmIK9ZLHjkM0T8TQqgwoI7kF0deKqxRieaz/u
X-Gm-Gg: AYBFou3Jo6nqfBggr3rGrJZzPmvMkglFsIWHecjiLAKllQMtgQfVwsnwSEdt7GMk6KU
	joGCesS+Y0wWQj5s1FauV3VUjOarTiXytCLrkt90fT0rkvcyQWpMxkqTM8A9vMK7UAvFhkdG3oN
	bh3jcCz+MTlWDgv8Stt6iAMe2n0eDl5Hfgydz7JVFlUmfmhvBemm3hF5NPAMMqmCchnYgtnmaTX
	ugft2vTZ7JXnc5fhNpHs+/uqBztu7PtVXvTo479KINh6QIIhwKkBS26AsujTBunCv8UQVi1aKpF
	CkgMcvBWK1V6XgJtiQ/AYFBrK8fjhBmwQ9EK2yQ+KBgPSC8dWwvZSgNI7wEC0l8+asBjkGDtCcJ
	RMqs2HOh4D10rB9y2F4e28xbYY/Sivu7NR07aB9y5aS3gR0OAuDgrt1ziZUS6Rc/2coR0jxv5h/
	5hS2QXXLE0pMoin6e4LZhufJ1UgN+g
X-Received: by 2002:a05:693c:41da:10b0:33c:e61:e1e5 with SMTP id 5a478bee46e88-34cdc3c058emr601479eec.21.1790746059412;
        Tue, 29 Sep 2026 22:27:39 -0700 (PDT)
X-Received: by 2002:a05:693c:41da:10b0:33c:e61:e1e5 with SMTP id 5a478bee46e88-34cdc3c058emr601456eec.21.1790746058891;
        Tue, 29 Sep 2026 22:27:38 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34cf613f093sm1008341eec.29.2026.09.29.22.27.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 22:27:38 -0700 (PDT)
Date: Wed, 30 Sep 2026 10:57:31 +0530
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: usb: qcom,snps-dwc3: Add IPQ9650
 compatible
Message-ID: <arydw47qwT7jHVsV@hu-varada-blr.qualcomm.com>
References: <20260924-ctrl-v2-1-fbedbe760375@oss.qualcomm.com>
 <20260928-gentle-lemming-of-ampleness-4b4c77@quoll>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260928-gentle-lemming-of-ampleness-4b4c77@quoll>
X-Proofpoint-GUID: ST1jI5KqFq0dDk0VGJTjZcwmDk6h8RJm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDAyMSBTYWx0ZWRfX7hd/DtnFRYmg
 gsGz1iP0i3uj++0FYREsSEKnunF/MYzI55sl3X2wodxULIgVvooEOMGUlGNliqd/NbdKfOUVJnz
 9rBCazpBw8Umth7ftxfl+J9pqkHwWjmT73Qq59tiNJH2vffI9nM4rQ5vfiUqNDO/KIbDYacztcY
 Y0lZhwPRXWvZCXE40GOP9j3cmBhVrZlYmZaAh8+uP41P31ACg+x38GHq3m6GbHtyvbDEmbgi9tR
 2NxSW/1S4Kn5ebH5vO56u09hNN6GbT5dCWOqypstbICI3cjTLdaj5TKaKBOffuE5KuugZOrflyA
 SPFTmNYU6k4kegsunqpfoq7V84RtLcvG8Bz7XJgMSSU1T1NTtv0NHGZ2mEZeiV+/QMjQybXBDRF
 y1OuXb1Bj4bhUVPUJN8FC9U1H1Nvf9LOUh0RceuQ6u+NeGILzF/dH5i6FxZAqzFMMO5mFTBS6XJ
 aStvZxpoYjvv5tlHU9A==
X-Authority-Analysis: v=2.4 cv=cokOAF4i c=1 sm=1 tr=0 ts=6abc9dcc cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=9ksu8lDKoU8JCIevmIgA:9
 a=CjuIK1q_8ugA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: ST1jI5KqFq0dDk0VGJTjZcwmDk6h8RJm
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDAyMSBTYWx0ZWRfX6c9ASzSYXHJ0
 wyH2x77CnGauNrH5DkOiOe8JC/OBIq6g7Fod+vNtU22Z+FLH5iDt/B71W/fy9Ot5HoHfRWjcPsS
 AmhWt8PjGTNF6MTAhbtiEaxmp5eXNeM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 adultscore=0
 malwarescore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609300021

On Mon, Sep 28, 2026 at 01:00:46PM +0200, Krzysztof Kozlowski wrote:
> On Thu, Sep 24, 2026 at 01:19:05PM +0530, Varadarajan Narayanan wrote:
> > Add the qcom,ipq9650-dwc3 compatible for the two DWC3 USB controllers found
> > on IPQ9650, using qcom,snps-dwc3 as the fallback compatible.
> >
> > One controller is connected to a High-Speed PHY, while the other is
> > connected to both High-Speed and SuperSpeed PHYs.
> >
> > Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> > ---
> > Add bindings and dwc3-qcom glue driver changes for adding support to the
> > two USB controllers present in IPQ9650.
> > ---
> > Changes in v2:
> > - Rebase to top of tree
> > - Drop 'usb: dwc3: qcom: Allow the glue layer to pass ref_clk to the core'.
> >   This will be taken care of the by https://lore.kernel.org/linux-arm-msm/20260906-ipq-flatten-usb-v3-2-13e4e0f63123@outlook.com/
> > - Add ipq9650 to existing clock constraints instead of new constraints
> > - Link to v1: https://lore.kernel.org/r/20260825-ctrl-v1-0-609e2291814d@oss.qualcomm.com
> > ---
> >  Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
> > index 9f91c8711e02..a8fbf72c6375 100644
> > --- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
> > +++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
> > @@ -36,6 +36,7 @@ properties:
> >            - qcom,ipq8064-dwc3
> >            - qcom,ipq8074-dwc3
> >            - qcom,ipq9574-dwc3
> > +          - qcom,ipq9650-dwc3
> >            - qcom,kaanapali-dwc3
> >            - qcom,maili-dwc3
> >            - qcom,milos-dwc3
> > @@ -210,6 +211,7 @@ allOf:
> >                - qcom,ipq5210-dwc3
> >                - qcom,ipq5424-dwc3
> >                - qcom,ipq9574-dwc3
> > +              - qcom,ipq9650-dwc3
>
> You had 6 clocks before, now only 5. Not explained in the changelog.

Sorry about not being explicit in the change log. The additional clock was
supposed to be passed to the dwc3 core layer for it to get the reference
clock rate. Have dropped that in favour of using [1].

Since '[PATCH 2/2] usb: dwc3: qcom: Allow the glue layer to pass ref_clk to
the core' (please see [2]) was dropped, don't need the additional clock.

Hence the change from 6 clocks to 5.

1 - https://lore.kernel.org/linux-arm-msm/20260906-ipq-flatten-usb-v3-2-13e4e0f63123@outlook.com/

2 - https://lore.kernel.org/linux-arm-msm/20260825-ctrl-v1-2-609e2291814d@oss.qualcomm.com/

Thanks
Varada
