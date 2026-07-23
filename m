Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E375C43F8B6
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 10:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784803753; cv=none; b=g4yvdiNsN6bVWjOrPFhBGA63VZb1UHFuqanFX0WiLi6eF2eiAhErR01g/f/PswDZzKRa6A5e6LYRXF7GbDTqvpKWdXSuGZsbl6q5bkekH/y4iTF7NGaEGRjlsel0tnn4r6CDUZFMMVFz4PxnnjcQB4x5ZqDCBw3uhVOKnFahLR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784803753; c=relaxed/simple;
	bh=QON2PHVweGoUtL2sEBtxm1pos4WoqKP3hUIn/qW0iA4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IlcLRbj+GLTXgeOAQ0BewDe4jxzxhDuQlnAmyTiSbnCd0MkvaIr+Za92NNGrjtbWPwRljfeEEmfuvpWfn1qF8THdVwiqtIhTt9mA58x812O/ns3o/L1dr0ki9xneqCYQG/H9pYQCbLncU/FiBTcLTJa6XMNSxtpprC3hy+VUX5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AC1U3uUw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P9k+CjKN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AC1U3uUw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P9k+CjKN"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8qfuK467824
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 10:49:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Re3yCZBWlEjS1PUt043mIvak
	0+Wz2BK7cm/d50zPimE=; b=AC1U3uUwLWrrMgWqRj0ygCfIOsiourKGY9GcaIdN
	5D1sVtQwCjkJ3HpoCH7XPct/xbo7tVvySoKzHefgeq6U3EhLGVZs0EXg9pYMoaMR
	qQE6Tpk4mo/a/jDSgh5PLc3zbttPsXUp72gubGMzN/HpsMP6G1InHvPBfopDtNS7
	4QGZLtFl2DdmWEJ+oOwN0KlURRG2Z0N3lm/7zq/GOaxVNdmDfx0/Ffejvo/kynuN
	Sr+Dx8KGieAZ2yjw5xeoEtkJ0tkV8RAoUJzlj/ypTDin8MyhuhW03aD6ymyrkGD+
	/JnhPP4U3b36gPxOGyyr2+mZhxWMkzMqvz97OeuFUK/KkQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk28xun31-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 10:49:09 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8f113592bf3so10347986d6.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 03:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784803748; x=1785408548; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Re3yCZBWlEjS1PUt043mIvak0+Wz2BK7cm/d50zPimE=;
        b=P9k+CjKNiChQxaTZ7YJbpEPagGBGro4YctSQQWqqghFcs5vfvrmkrLwc+YuHvr3xuy
         iOPDnxkHTLZVhFRSY+n3CSA16Ie3fOadKtqBGwBcrqGQYI4Ufh75N2rWIjJp3dGHTaYy
         W92KhVg+mf0FGkBX563g+7nQKcv8F8I4pvCWXizxwGpDxEvL9QPNhEwBH1ninwzz+3U/
         UUn+0+FWRTleAi89GADNdbnGdReeZC/hxnxku7m8omSOLX1xcCK3YPW6WxNRDXzqJO45
         cYNxTkYnDBj7pr1FhNzaQ31oI8l8nSvWE101o4Liga2ZbrruHuYSfmjeZ+7omhCxiffS
         h91w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784803748; x=1785408548;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Re3yCZBWlEjS1PUt043mIvak0+Wz2BK7cm/d50zPimE=;
        b=b3j5rXnJyPquHvnLLd7VKNqQj5eN7jv7vnfaBh21C8g9qU9Bg4M1v2n0qp48pwSUfh
         UBG2D+wFo9l+8CJxRIVHMrtMdHE3/sPRP6NLZz40qotD9+DPfQJfqr8JhveAWgca3Ip0
         74B6JkufHGa+D7ztle2OacOj/s8KsgL55Q/5IxMFB5GFAcc+cHn2r7cCuliMvtFM6fmm
         pvprMYNHsZ7utNLayifQvsCVOnyuuKDDt45m6ahXRrdhfJ/rhDvYzcd6gVgQmDpssgW6
         /9bcBA1hSYDGhguUHNw0it850Rq1aCRvZucox1YEf5MyXdj1V67b+bWTSoNl1cXaap+7
         EZyg==
X-Forwarded-Encrypted: i=1; AHgh+Rpq3Q7NQnJ3aa2WP5eAx86y2FeX/yqSp9A4ac2Vfmkavf2BurxGkV1ayM5S1t4TKtcGAbxfOR2sMiAxezQw@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+ltahOvW9adODYtGBNXpjrr+oPupxy5pD6DkTayYVUPxqQhaW
	G2VRPKpsvtVaywJHE4MdJ1XCtlXvlACKNHEmQVoby+0nFkRyAd5kAXKdOWxatkwm4QP5ygOc9AU
	M/TlNUNDorKF76iQGlLOiD+B4HCVnqMgN3ZIMu0cshzs0Wc3diyijtFZJ2UdWTXFhcPe7
X-Gm-Gg: AR+sD117et6deULtfNaLhKlEYTLZRar5A/lS5s3CtTKcbDK5MFaIBK9xuvtBbalkUtb
	6nNXx86+RaHl/hXYHDpLkkV7ElpuHV/CZStHm63HctRH40ePUOcgzfnvV7JMmKb1jj7PlGOmqvC
	QA4BHWM0J0fcNuSGfhlF+Wle+QPEe2tLKgavcJDULBaKq/uPyfrKq5w1IWQ6MYGpaoFzBAfQ6J5
	Cz5MOGeGJlCXwMl4zoJ+fvBBNxXlRXdjzkfvF3uYKvwv89wX+A4sybCVt3Y//9bpLPST97vgta+
	AwdfSSQojOMvSflRZJe0hD0hJZ7dMEERWtgY2qQPu5jTs0B6zOiXcTRM4ry4AxoP5t8LZ9OW0Jz
	kBv3AU/IlchpfQrgSdG7HRkeP2LoSokC1zd9vDlKvFoyYsuNgWa3Xhet2UTMy1yCChr3tPU7Oi3
	c4bvMHsFijAO6yGA==
X-Received: by 2002:a05:6214:5a0a:b0:8fd:6dc5:94c with SMTP id 6a1803df08f44-907ca6d63d9mr29038896d6.65.1784803747968;
        Thu, 23 Jul 2026 03:49:07 -0700 (PDT)
X-Received: by 2002:a05:6214:5a0a:b0:8fd:6dc5:94c with SMTP id 6a1803df08f44-907ca6d63d9mr29038646d6.65.1784803747447;
        Thu, 23 Jul 2026 03:49:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39ef68bb919sm8063981fa.12.2026.07.23.03.49.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 03:49:06 -0700 (PDT)
Date: Thu, 23 Jul 2026 13:49:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: qcs404: Fix DTBS Check errors in usb
 controller nodes
Message-ID: <cbbqb3vmhjvrvadlvuvckw5djnkk3vt676z7u3hqryautnofjh@faszogm5fmmw>
References: <20260723-qcs404_dtbs_fix-v1-1-c9ca0dd69f23@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723-qcs404_dtbs_fix-v1-1-c9ca0dd69f23@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: BjmtVeHxoCnxWdjmwvpDN7EARvX1ZAZ9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEwNiBTYWx0ZWRfX43pRvqvZT3Zv
 8+cT2uyZPTAKqhCJiRy9W8PlmKss7zJoq9XYMKrzMiOLnQMydk+mZh4AjJFYfpsfVp5IuXvrQCQ
 bTKe7I8s0tPvy/bxnw8BnZi6zoEBt1k=
X-Proofpoint-GUID: BjmtVeHxoCnxWdjmwvpDN7EARvX1ZAZ9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEwNiBTYWx0ZWRfX6EWNstXbCTX9
 fJfJ7QSaTlIpDwVrjgfOnCpbjQluYCt0/Q41lq9KaCk/+0OHGf3Kp1jxqY82ci6TBvRXzUfRgPr
 2ldMaJn9uV0J1PJ9bouFsBPB2LUKKz679EpDPHchxU6BKqJWkDpMtNALlpdJ/JYNfx7N+0/sNS3
 vty7HX0I/WHwv/Vyrow9Kb2Qu+crh1ZQQHbKwM+wTWd7zx95KTaTGoqohWv7+1wcaTGltP1OUPm
 f0vC0TGZGVMbe/NItaDwSWaVsdxPTiGR51yZ33+JPNbO/VKP1zGhatp13lZBSdIzs72htC8Wpgs
 CLGjlE1/SgL2TEndJLwRUwNlHftkMJ6Pqa4BQndv6h98ceg1kNce2WX3am7wtEshEQCNq4P/8Zi
 XddJt8POU1FPA2A1GpqY3Tw57aixPltmInSMxnwG0EX9TQP1clQkeVpH4DnbwqXSqMdntagK9Iq
 W9SeDTeDdRq3JOPWN9Q==
X-Authority-Analysis: v=2.4 cv=WNxPmHsR c=1 sm=1 tr=0 ts=6a61f1a5 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=8NsANrjZta-JMvGekbgA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230106

On Thu, Jul 23, 2026 at 01:47:04PM +0530, Krishna Kurapati wrote:
> The following errors pop up when DTBS check is done for qcs404 based
> platforms:
> 
> arch/arm64/boot/dts/qcom/qcs404-evb-4000.dtb: usb@79b8800 (qcom,qcs404-
> dwc3): interrupt-names:1: 'qusb2_phy' was expected
> from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml
> 
> arch/arm64/boot/dts/qcom/qcs404-evb-4000.dtb: usb@79b8800 (qcom,qcs404-
> dwc3): interrupt-names:2: 'hs_phy_irq' was expected
> from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml
> 
> arch/arm64/boot/dts/qcom/qcs404-evb-4000.dtb: usb@7678800 (qcom,qcs404-
> dwc3): interrupt-names:2: 'hs_phy_irq' was expected
> from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml
> 
> arch/arm64/boot/dts/qcom/qcs404-evb-4000.dtb: usb@7678800 (qcom,qcs404-
> dwc3): interrupt-names:1: 'qusb2_phy' was expected
> from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml
> 
> Modify ordering of hs_phy and qusb2_phy interrupts to fix the errors.
> 
> Fixes: 927173bf8a0e ("arm64: dts: qcom: Add missing interrupts for qcs404/ipq5332")
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
> This series has been only compile tested as there is no functional change.
> ---
>  arch/arm64/boot/dts/qcom/qcs404.dtsi | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
