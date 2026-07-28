Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72DAB3A3816
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 09:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785231171; cv=none; b=YSoPVvBq1GMcPg7GmYalEOsfCwrADEp4pegih6lqfCvQ8mQ20GOxQIFhBXuNfNySDL+noQfW/AvrzZSArmmrLQGxG28RfYTKXs996pf+vs2q7amDo5ImFDjUBXU9V9Zit0OSumlTxfv26WKJNAKF7Z1fJWl1ctwIMTpHQhKzjbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785231171; c=relaxed/simple;
	bh=rBxi0jOZcQJhPl1DG2Oby2J+QY6GfRXtXkrMqD2D/6s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Im1iv5H7/9ZBynKRYSYObC/1O4pEapkAgAf77H50+lYoS62mAs1edkVYWWHBtjtmopMbjDAjzLLaJYahYjDloFZFUGYFnlI94HCkvA1pUZy7V50In2xCaRKx8hETEUTCJD+RoZRcQ1iLhNYp36kXWvEXIeDGQx60K00khWYdycc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HSh1RSWg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TJAs7AUD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HSh1RSWg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TJAs7AUD"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S82EK61908724
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 09:32:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xt8W0Dz4iDVn/lAenonY/3tV
	gAl698/PBkXcOP4l1Kc=; b=HSh1RSWgGlnzGsf5unhtI4nfGkBOK9GzB+9sGlIw
	5oBJue+7+E9YhV0T+hBooEUT0YektMLRIEa6sGnI3rJYUQnaA9vMx6CIaPVJZOS2
	WhjccYpngFVyi75uTZFaLgxh9O0Kglq97X7N+EXkh5SKueosyJeIhEifvvPHbejj
	sIqylqfWSjew1+6Qwkf+pizS538AsJIiUKYzDlfHnUaxNSTTPRpNzDk+cyHAJ2h+
	Z7+8IvxBxDlYf6HM2cJQDwk2jziTQZYAJNg4wZo7NK0rrHXJMJBVjBO9OY3SNiu5
	ZLNhz4K0pBQHFIZWe6nvfyZXKYQ9JbGzJ4sl5/KLVrwOcA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpbp8bkee-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 09:32:49 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38ecc48b3c2so904099a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 02:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785231169; x=1785835969; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xt8W0Dz4iDVn/lAenonY/3tVgAl698/PBkXcOP4l1Kc=;
        b=TJAs7AUD1Ln3sqa5LrHY4uTUD/vEMM+6MyhGlTb2t9VQ/JYlP5kuswtzD4Q0FdF21x
         UYpgC4EjEMnqn/GhnXwMAbfxFClOyt0QwmbC0bwSPdV7jDltxh0AFK7HuuJULHBj55CM
         e2gGLABQ3oDhWEKPmbE/+BkY4Hl4x5nj7pC6wg/i1kAtzx6l6TzcYtz24jRGCFPkTGAT
         IdMwxRThq/Qw6hQ0zAl1EQU0khbU6o9C/yESRjhsVPw5cW0dKdwsVuyOeVdhrHk2qadp
         qJO/tpCwfUhKKf9MCFpoefOqXeT0eDbR0o+SYt+M7AtyYaJVIBF4om3L7cdgZc88y0fD
         BZEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785231169; x=1785835969;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xt8W0Dz4iDVn/lAenonY/3tVgAl698/PBkXcOP4l1Kc=;
        b=eKoAydAZmhu/TPATJhhhFcsmjZEpjj3u1qhOrcm54NzcMaj4+dPqkKQJbpb1Rg/CCA
         m+eBeQdFwlF15fACoC8du7JSTpn79TNhhPlWVZMmFz/X4gqHiW2yrg5A57D2GDaRfkm6
         IiHdG5weks5jQdAdCu2+qaxdl7xWyq5d9Y/rPnrwwImqp/JPavt3v3UU6Niuk2XUxMRb
         sKn2KNQJ0YI1WuqcZ+lUM3zvuK/557rlJRRx4vF/KHLB73XXQHIYCuUmQdXIti8icp6W
         pnQ1AFwUltOCV/7v7XND+8GNs+wG9YNVcRT5NVFjHg6mW+1/EhLl/AKlN91yxAFPyEAb
         SMpQ==
X-Forwarded-Encrypted: i=1; AHgh+RpRM3Od6e7dtay9tvciTPakpzeM15FWzehkO2cGtr5X2ULG+9ngwBmF1/mNH+DmJy10+a1SB6AzBh4UZ7Gd@vger.kernel.org
X-Gm-Message-State: AOJu0YzdDsYDkhkf4RtX2akn0p8kyYg4cDEB5Wdd7okDy/lYycYzXWJR
	cwhQe606HVn5vWIZd2QrLzZStyQwjy+klbtYevPVeRBqTEFSY86/aLVT5I26O8t2tCfYGNksHkU
	jSi8MX/fZ/03l2RPknxg5RA365TLdP6vnVXAuxFIgTGyTUieg+gd+Cn0nImekcKR4T2Mt
X-Gm-Gg: AR+sD12wJqLErwPxlL+RbyuDdS0EOW0GEtlLfnJGIR7aK7WiXarQE0/JZgOecR4i5S+
	dffX9ce+0SF/FcBOxt2zd3gjIWAov6qkiBGtrVfUdSk+XGEf14Sc9hjhfoOYbj3iBaL+aTLzy5w
	qp9fisBBCZ0t74KI0TW+VbQEdVEUyskB3KbY1Kz8l62wublFr6fHvu2GQCtioGCkPxVgbpMkK62
	WNR5TWjRMjz2520w8tuqp3PYvKxjiBqRc48JL1nq8o7hya8/K0k2KUFhsrgBSCPkGdHhnoZ4j+E
	deO6QhWBKlVQolH/LGlNvgMAHAm0PyEr2a4YHl/5wuqhTznu8KBlrWFUqwWv4H8H7dpiYaaqgbA
	1j9NTwDj9kbVAL7hKyxWCjYhzF4U=
X-Received: by 2002:a17:90b:2e0c:b0:38e:4482:ab15 with SMTP id 98e67ed59e1d1-38f6a51baa2mr1808772a91.22.1785231169008;
        Tue, 28 Jul 2026 02:32:49 -0700 (PDT)
X-Received: by 2002:a17:90b:2e0c:b0:38e:4482:ab15 with SMTP id 98e67ed59e1d1-38f6a51baa2mr1808728a91.22.1785231168426;
        Tue, 28 Jul 2026 02:32:48 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc5a04b2sm38522512eec.28.2026.07.28.02.32.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 02:32:48 -0700 (PDT)
Date: Tue, 28 Jul 2026 15:02:40 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@oss.qualcomm.com, chris.lew@oss.qualcomm.com,
        deepak.singh@oss.qualcomm.com
Subject: Re: [PATCH] dt-bindings: remoteproc: qcom,shikra-pas: Allow bam-dmux
 subnode
Message-ID: <20260728093240.rbncqxse2nomvbrt@hu-mojha-hyd.qualcomm.com>
References: <20260727-shikra-pas-bam-dmux-binding-v1-1-c0159c7c3ed4@oss.qualcomm.com>
 <20260727144105.t2yz4jpkuiykem3a@hu-mojha-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260727144105.t2yz4jpkuiykem3a@hu-mojha-hyd.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA4MiBTYWx0ZWRfX0eYW02eHkuV7
 aRzeQhw2M6AqCCsQT8d/a517z0PeB2Rsz2rivZ62rEDSF7Ejj9OpkyLC4Jy2MBzyav9CSQMlIdX
 YiENR6M5GfsaC2eZSTmF+5YBy01ImwM=
X-Proofpoint-GUID: 4mVAzdg81VBrdNm4gndpS6RLqsImKins
X-Proofpoint-ORIG-GUID: 4mVAzdg81VBrdNm4gndpS6RLqsImKins
X-Authority-Analysis: v=2.4 cv=KLJqylFo c=1 sm=1 tr=0 ts=6a687741 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=m1b5yMoVOdqxLKxJPrgA:9 a=CjuIK1q_8ugA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA4MiBTYWx0ZWRfX5EmjuUkJPJJb
 CarLWhy08urRXdiSIuOczHA2LwJ0s1BoT8+jrcvGG8Y8QRWRIyDyViz53BRLRbRDHTO51hkKRJO
 qsAaM+AR7KTG5xQaUvBUcBeVYRVaNLxavQBgJ7BkpWHHN8tIWznNTwXLrxK3dQLbMrZHGrAOj4d
 0EiJ/sCvBsbhr13cwLj0RZDhFZSBJQPSZRpYyiNVfXD0nshO1aXK6pobOLDQY1KMr7IQ68IVltW
 iaUbEfxR1T8V4hdoRHYmRipwvBK1gZMlYAOHOtnH2/PvCOdrccabQXBsFL4mn/+6HY5fgsRe4z/
 O7hANLgDvtVJu7fG6yuKzliAsoFC9hfj4MyMIcZqti6DCn7oSDmvn+8K2KzDuUanvsqoVHQsw88
 hVu/oOUNJhiXjjH6mmRiIbpCFGR/e1S+pYmN1QhffkGEAKfqUZ9wAc0T327Rixmi0GjSvDzCHlt
 GVStN1J39RJ5dGGqlbg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_02,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280082

On Mon, Jul 27, 2026 at 08:11:05PM +0530, Mukesh Ojha wrote:
> On Mon, Jul 27, 2026 at 07:47:33PM +0530, Vishnu Santhosh wrote:
> > The BAM-DMUX node lives as a direct child of the modem PAS remoteproc
> > node, but qcom,shikra-pas.yaml has unevaluatedProperties: false and
> > does not list bam-dmux, so any DT adding this subnode fails schema
> > validation.
> > 
> > Add an optional bam-dmux property referencing qcom,bam-dmux.yaml,
> > mirroring qcom,msm8916-mss-pil.yaml.
> > 
> > Co-developed-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
> > Signed-off-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
> > Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> > ---
> >  Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
> > index 253b14eb2b598f0ca91854c8ff4d0b785090e621..17461d92165b26eb669809ed7dcdf029530c9223 100644
> > --- a/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
> > +++ b/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
> > @@ -44,6 +44,11 @@ properties:
> >        - description: Firmware name of the Hexagon core
> >        - description: Firmware name of the Hexagon Devicetree
> >  
> > +  bam-dmux:
> > +    $ref: /schemas/net/qcom,bam-dmux.yaml#
> > +    description:
> > +      Qualcomm BAM Data Multiplexer (provides network interface to the modem)
> > +

Sasiko has valid comment on this, please address.


> >    glink-edge:
> >      $ref: /schemas/remoteproc/qcom,glink-edge.yaml#
> >      description:
> >
> 
> Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> 
> -- 
> -Mukesh Ojha

-- 
-Mukesh Ojha
