Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5305137E5E7
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Oct 2026 11:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791199091; cv=none; b=bbO4N4pADJRAJBmgNUPdTqxHGqZ5lZch/Sr7seKEeIDRCFzOTi6vdexmLc6oXiIb/BA7cxKI8d9pX5bBAP/hR1I4doTORb3aFKtfzlrho20Zy1XuxW5SrRvGfsbIv8CGabS99lCUD0hUIoP4rBzTVPNgmw24HYHpaIaURc2jeAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791199091; c=relaxed/simple;
	bh=x7290+K8LDLQJRqw1lTNeGAFCtidX+nxRjEF0hEh1GM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m7jFxwVmsG96AUJfLlcgKir74g/Enf7PjIA8+gZ6bTAtNghLt5Ng7ocvFJJzTOjS6UQhu6B8iejkOwC4eFAGMxLytY7CVWDMLfznJb9D3EpTsLV+5tsmbUK/IWwPe8Fwa6UAw5qEJAU6JoaOu//rokFRZD45zSgUoOsKbsRtaZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=omXrQawA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hu29Vsv9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="omXrQawA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hu29Vsv9"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695Aocnn1541858
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 Oct 2026 11:18:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+nl4ZBj/sgZVttd2nadDU3SE
	QhAhmStSAizdtAchuBo=; b=omXrQawAJWxTwbu6A7T30G8bizluVgW3suoorbBH
	0K9y/Tyqusek9E6rJf6RDBmwraZY8UjSTVQVEFY8eOgem+XoLVmaHROGXPMYrDtb
	TK6sq4q9XsUNSrZJ3yeQpz5FYu847oGrasFRFUjXrdLbES4i8wzBz9cwupzwOPL/
	WUht0Dxm8lSNJV9rWu1sQ/oGhpeZXvDwtl/NgkAudgpUY4oM+uqQ39mIJokRvT/L
	BacO9lI8A6Ed4arp4GxBsHdUO4W+fZIS+S5T1F7y5zRM0tTjAXgQlbDmd1M9S3Mj
	zOv7+hFRqUl9jpIf6DMzSq4dVOap19KUjS3uSg+TIGXdBA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h3xhs1tw0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 Oct 2026 11:18:09 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93ca9b53afaso433495785a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Oct 2026 04:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791199086; x=1791803886; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+nl4ZBj/sgZVttd2nadDU3SEQhAhmStSAizdtAchuBo=;
        b=hu29Vsv9kOH3nBh546Gy4Y9kdd2gRbviXmFSVKAFCtDdDgWetxoPcoNwCQuhNPdq/D
         T8PL6sOsxJgttFzwwb7mVH0Z66xrK5SHvRpx5DV9r97gO1tftckLg7HyFkk1s3sOZK2D
         0w8vv+5ukVyUhzPcWGhXPJnVAv1W+TBsl1Oj+hL6CrlvzCGNUI5USYxgzbYVz/fBVC0B
         s/gZPZU6z5r2agE0oYAuaDnS6rDLhl5/6/xaQtyrjKel7AE5mGXSf2pqqSgZqsDnH1em
         scpzwS4OUwHfJN+3Auj3K0sfacLKrgEb/BtRR7cnWKA2CfzRBfXe8663kOzcYwktlbhL
         0zLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791199086; x=1791803886;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+nl4ZBj/sgZVttd2nadDU3SEQhAhmStSAizdtAchuBo=;
        b=XRI6sEMJw/C0mELSrp9PL3E9RQPktVYBvZ1xE2O1U/5Gsn9IfH6VCBec50Wc/Q/gXP
         Oeh5lRLwdsBFHzANPAUbRR+GLs5F5kYQW0DN1sbVF7FB84Ga4Vkt/Hkaoeo37lueT0od
         xpFafaiP2vvO8boJD9+d6qnfomFcBYBXhtud4BZ3ESSJfb/wJ+aCbqvSm+qUvdlUg9qh
         4WNZvxbdW/xZm4vI/nh+sL4p94bMOKUKVRlkWbPbr8G/L6KwDDzSOSgg75IR4h9V2tXR
         s4kfV9qLKGALaljDtiIMtPajc19HXj/qi7ltJ09SgvvW1jPh10SEFL9uCiyXSQYUGSxN
         eZRg==
X-Forwarded-Encrypted: i=1; AKwUvByM4bKoZYobqKuChule8WIeY5wBNi7nH8iToj3oSU9N1YEEKKNYV8HlJ1UHinK+eVsC9ANrepqh7nJu3uQh@vger.kernel.org
X-Gm-Message-State: AFuF++kxz830/x2NeKpLhyNA0bwDOqy4YcSeLbQlyTvq6EKbOZ/Op6MF
	pp5f+U2u69TGwmLc5t5k6yBxMB5Ne5/0u6POM69SXpnsPMIrdYHYpMbH1aPe63GnHCjxB0jyL5Y
	hdez1rqUbT5b0wfXaDDn/nOhCaAFOTzKrNnPhD7Ij9pvXSZ2euZ3d4rBZJifdcJI2TcuA
X-Gm-Gg: AYBFou3lCwCsD2isT7VOKYk7XguitNVqnUmvjgKSpnBDIMdh673owfSvRbdkGTNAxxq
	R7PK5Ly+B4M7d+2ZWZa3tpJPPQGYi6qyTqPedvdQSCBoeSynL8xw/baCGmzpcP2YbRPAvvA2Saw
	/u6UrCYUrd6LqRIsY0tmeUZvqpvEnDxy0qoKPJjX5Vled2dNCdsAWfLJ3Av2K6LMBnF23RJL560
	kNk1Kfttpl5ecGP8r9t+8lNfNvDtFhtJPqlDRQ61O62SaSl8b8X1jTD4lar8pX+EPpYIZzK7XHC
	JXmibn/Tibd0a/b75JZ/cdkrCBsrYTQv84+f5EIFpXxVaS8vNi37/7HJJCxyzoeQV7EZ6dLCG7u
	4CHKZrBbyOGwAzHSRQhGC1Ip578HMLKQiqgS2ovG1K1GxsiXBzV2kw6cz2K2C/KigfneTb1OQB2
	Awd1vAa4w2fKrm
X-Received: by 2002:a05:620a:3196:b0:93c:b420:c2b8 with SMTP id af79cd13be357-93cf1a50df0mr2022035785a.61.1791199086416;
        Mon, 05 Oct 2026 04:18:06 -0700 (PDT)
X-Received: by 2002:a05:620a:3196:b0:93c:b420:c2b8 with SMTP id af79cd13be357-93cf1a50df0mr2022031785a.61.1791199085999;
        Mon, 05 Oct 2026 04:18:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bb7c7b04fesm3065087e87.69.2026.10.05.04.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 04:18:04 -0700 (PDT)
Date: Mon, 5 Oct 2026 14:18:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: shikra: Add EL2 overlay for
 remoteproc SMMU mappings
Message-ID: <gbod66s7mtmmx5uj4efkc5sxu2za42pvn3ojumpsdua2hng3es@2r4bf2becz76>
References: <20261005-shikra-el2-v3-0-618f7343695c@oss.qualcomm.com>
 <20261005-shikra-el2-v3-2-618f7343695c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261005-shikra-el2-v3-2-618f7343695c@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: oL09xM3-eUUKpE1eXi6rGxNp1T2OVA3r
X-Proofpoint-GUID: oL09xM3-eUUKpE1eXi6rGxNp1T2OVA3r
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA0MyBTYWx0ZWRfX6h21UUTYIPlK
 qjUNYiSjoxX9BCSArgufts+95ZUanYm2uNR/80fcGA/a1VH0r5sUbOXyS2u5L4jVHNBixBDDf7r
 N3IBHny+TeLsmmXNpqniX1TFiK6ppdU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA0MyBTYWx0ZWRfXzGwuPivOb+bN
 b8JKI/lQoFA7R1Co3uYvME8PG60N4p1TKGb15A28bxbRk9Wy0G3/WsTJXALgt4l61oL/TgTiAxF
 IRZYTb1UwX7h/1VSpR4K1ZhupWFZOppQmLELpkMc4ICvxZo1HSpp/rWxEBIADZAYR1O1GF8YHsK
 xaVEkojtoJEtlbIgGCJ/tzis4ZNPDCt9RHfXUD6DNtlsBNCzuVT1g47uy1hsa3QbfG79B8G4psk
 6T7j2uZPUw09j9rG5+iW04UQWVy0mJ5nTwtyUXSk1GDdYHpXawV3SfeM3qu/HbEKVkDsF4eojwk
 UVxVKcy23vW++LKTMJeGA1OHLnJDIJv1OmXdXHrMGnPfns1JF45/uQXojU9ijyLJN5aB3Q8M42K
 TutCv50Fr+HMq+fShfJTNIXiTtyB4XYPnqA5MDzq5VJkSKGAxfL8g4f29wTWXDfefTWy6i01p1O
 SjMIFUCbVd/ojynvh5Q==
X-Authority-Analysis: v=2.4 cv=Q6tHcI2a c=1 sm=1 tr=0 ts=6ac38771 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=mkGK_8PVERwZuiyPypMA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_02,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050043

On Mon, Oct 05, 2026 at 04:44:46PM +0530, Komal Bajaj wrote:
> Shikra boards currently boot Linux under a hypervisor, where the
> remote processor firmware IOMMU streams are managed by the hypervisor.
> When booting Linux directly at EL2 without the hypervisor, the IOMMU
> is instead managed by the consumer of this DeviceTree, so the firmware
> streams for each remote processor need to be described explicitly.
> 
> Add an EL2-specific DT overlay and apply it to all Shikra EVK variants
> devices to produce an -el2.dtb alongside the "normal" dtb.
> 
> Co-developed-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile        | 11 +++++++++++
>  arch/arm64/boot/dts/qcom/shikra-el2.dtso | 23 +++++++++++++++++++++++
>  2 files changed, 34 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
