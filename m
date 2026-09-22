Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62AF4423EA7
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 09:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790067696; cv=none; b=hsF3b4C0sFQEjV80fxp7n+MqlczwMHphYqdFM+tU/ZMhwri1cA5id8ehtGgyQHY3nvzaxkRMJHTU9RHnW2RM1Cn6twMNfYJesl7tF7s6hQz6yJi8nSZmh7vtZR5M/NrvarhtQ5shDUZUOyuTE1tGyBEQ/9j5ibBB+3hAUD0tDZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790067696; c=relaxed/simple;
	bh=av+aBO05c6O+92dbe3DKT23RkVy38OVygGx5jUvujcE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nteDWvimCRI/xirzLFd6AhMeD51wnb0vQP4NNFDvr8Gqy9naloBrALmGj4qZmIUHgC+l1DO/fXdwvdOBmL64Skj3BM3lfWl7fbYeTSPfb7DSN7rGvIv6v3Fwb43vpYqEAtLY24Yd0YyujGWvAnUKra+ger8motyKF4gYIuhC43s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DOxAcuWb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QaE/13e1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DOxAcuWb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QaE/13e1"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M7BuSf2166354
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 09:01:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NbKGxoj2US6xi9Piwui13+v3UWQs/y+8IIKVTQ6dkiM=; b=DOxAcuWbmFupSuyx
	du1CZYe2dVBXW2Sgp+LibQE8MoSnh83h5WNSBWa910NeSlh0tkhY7XS30kstOep6
	4rsNwMbmR1Xkes+rctyOF7UdjzJc+p6i4IiLTYinqHCQneGcriokaBJeHwnXD5ck
	obNA2I40bIVwjoKBMWfRiRIPZJgqIJOvoWKE8JdpB6hsMZJMk21KlJKa9hlCkRgN
	Q6pQlsbIERB2Ra6kbv0si310NH796/+HF93lcLjfUqeAVmdR24gwj+qcmtqt/xVe
	9vU8Wew1WBTXlfiwTEoDo57VAyR6BSPdgL6GCOT4M2lhXzi8ueiiOJ9HND7RAfDd
	zDtJ1g==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu8xeu5r5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 09:01:34 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-77f133855b9so116845137.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 02:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790067693; x=1790672493; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NbKGxoj2US6xi9Piwui13+v3UWQs/y+8IIKVTQ6dkiM=;
        b=QaE/13e1L/UNb4uajfHL0gAMforhj7Z95L7VfeDOTtuAGg3DeVeEL0XudFtKlR5/cb
         OcAoK0Pe/bMizpLtbGE+EoiONYcoZZAetv6kFyFZbH5CxK1ctlc25xyNFcO0fRJfDpZ0
         utN1PbulJ2LjBJoymd/B8YLxm0Yz9efGX1FusmZydtMmm8AFluEDpZAGHbyaZN8ajl+D
         3X5l+qRBWpJWsQdNo+p45rzR2eod0nPHxTNpWXga/PwcBvdOwr2sDpMzXcj+KhbQ9AjD
         NpqNolYU0K5v1dY6loLa7BlHY4FgTCgTp8FQCnJu8cuaiuiwcey5lXBg1sri86U1jG6b
         jQ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790067693; x=1790672493;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NbKGxoj2US6xi9Piwui13+v3UWQs/y+8IIKVTQ6dkiM=;
        b=Wd2hsvx9O/IBxYW1n6RfaCt4SkKfAhN7pcXWmFLqCNck7RNQhbf2cluKDDhGssPpdA
         BVPp3y/iR6Z9znFJu7ptf7wU9Hok/jUJv5fsJoik/gGo5w6In+2eBZYA25Whzn932IbV
         lLtpL14Na8Gdwdvvgxq9U/QArAqW6E0EHAl1otWN4c8iePFjfitpZaPLM3NdoqHfDUqG
         gr/O3T0pr5Dt1MB8YiGfN/L/nzFvSsRyjvtzusjQA4Ckb4jx++JbYWifWGz11Iu/iubk
         XEEs60voFvTD9RKksFsPS/tjk6UcrTuDiM7S/9N8xzrBgDDejMyY2nM9u2crCLuwyAJf
         R8WQ==
X-Forwarded-Encrypted: i=1; AKwUvBwxImoI+25N8Ro7REa8L3pPCobav4G4SwPNqmRHs9sknUDmmVpj7SmSRyV3EygKIhcXcj2UcL03GhxR/ctu@vger.kernel.org
X-Gm-Message-State: AFuF++l2oro8E8B9TwZ/hyW7TXiFBQLLtllbMGiXBfu3xnhcc3lJBrz+
	flnlqdX0y5BH1cuR+wPYVDXzxyDLX3hJYza5f0GROHu95VmusIh/V5Cls61zPVw57B+VzjVaf5F
	EBpWHTutkbeJBSvwI9eicEcWpWwpqIIvPYy/94TQnf4Wj/O4Qtn0SiSfvSfDIIJzmNpyV
X-Gm-Gg: AYBFou1ypeAQlhNPxk0Y2YBHLsnB1CavXS7n27Mfye4XX1f70xE9AdKLAqFsQdD4UC/
	k1Q/V+rCq/FgRFNJ+Qr3NUmLCQ1juACVTK4bd/+5RjFV9FFC+WSTngMX3LN5tg3thQsRzVdbk6d
	eJNvNYytpZFA2ExBMM17XsExDJ/kjr5qFhRXM7kEi7/pyZ7M0hG+OqAyu85ArwBXqUc0y58BB6y
	52Jdyf+vPI5IondKxqN3FhMguDg5boqhD66qhUSV5MQO6pa6WtnFZ9dTSp8hFQrTKETfTxxxpQK
	4TBLffEtEdeGIamB+LomWjhAeTLbNoDR4xzdb1cv/dRXmh5AM6u14Oe7kji2+JbUcc3vS8R+lwp
	aETTqrrcWaKZWlr5myjeilA==
X-Received: by 2002:a05:6102:f13:b0:79b:6220:1c6b with SMTP id ada2fe7eead31-7a59911c082mr7087657137.0.1790067690797;
        Tue, 22 Sep 2026 02:01:30 -0700 (PDT)
X-Received: by 2002:a05:6102:f13:b0:79b:6220:1c6b with SMTP id ada2fe7eead31-7a59911c082mr7087281137.0.1790067687753;
        Tue, 22 Sep 2026 02:01:27 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a9c5b2d17sm49927166b.36.2026.09.22.02.01.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 02:01:26 -0700 (PDT)
Message-ID: <bc2c2121-0eef-467a-973e-019a9ba6a13b@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 11:01:23 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: glymur: Fix fastrpc compute-cb reg
 values for cdsp
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mahima Bhattaram <mbhattar@qti.qualcomm.com>
References: <20260922-glymur-dtfix-v1-1-159da6b0eed9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260922-glymur-dtfix-v1-1-159da6b0eed9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: hFyS2weflg58VIuQhetY52l7SgVNJf3v
X-Authority-Analysis: v=2.4 cv=PZhqFShd c=1 sm=1 tr=0 ts=6ab243ee cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=2YFxNopJgCIckj76tygA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: hFyS2weflg58VIuQhetY52l7SgVNJf3v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDEyOSBTYWx0ZWRfXx4tmXlZ6TAfV
 9FkD7UvaXbuOilRVPZcY1eE2cbDUvbRP9DBheJw8ameHHpNbuo0h58EmO+Yxg6IF+7yC7ged1a0
 Rbs24+ZLqpxtMVvL4hcThQWRTii7UDp6lL9b89NA7LRhvQCC/tN0qemkTnQBdHZwIjqCji3FRNz
 A23p4LDqHAszljmaOB6c2JfA4+DVjPnEgREQJyN6onRtamUkQmhAbcA2alxL0hQr8zKxkon4UtU
 lGOBleDBWWUCie5LhdNjq3gQMPAGS4xMqArvs+kND3BF0AyqGsRshKZYSYS7G70nplviKZn1QEg
 PDfeVoXXfPKsqDm3t72M9pwXq74KCZ5qZ5JGzymWK6uNaNOA7kotWPeLyWeLJ//0gGjqbA2i8eP
 Ob3FwF+6gOoVJT10VDbayszpNlNDrp5Eae3EeUua88BOgq4rNrrmQM+w9l637C9lGNOu1drZ+8i
 L6nt5W+sCtNfATuD8zA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDEyOSBTYWx0ZWRfX79TSS+Z/93Hl
 YC5sZqHoUo6nlKm9k9hZJKblRx9Pf96z8KumWQE/xHvPCGhii/0N3q89kgKZkmrpLVGb8mjPaRm
 YTvqve8TPVDvMAjOeK7v6z6XzvvXABk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220129

On 9/22/26 8:40 AM, Ekansh Gupta wrote:
> The reg value of a compute-cb node must match the SID (the lower
> nibble of its IOMMU stream ID) it is associated with. In the cdsp
> fastrpc node, compute-cb@10, compute-cb@11 and compute-cb@12 were
> mistakenly given reg values of 10, 11 and 12 instead of 12, 13 and
> 14, which don't match their SIDs and leads to SMMU translation errors.
> Fix the reg values, and rename the nodes accordingly.
> 
> Fixes: cd1d174c75f7 ("arm64: dts: qcom: glymur: Add ADSP and CDSP for Glymur SoC")
> Co-developed-by: Mahima Bhattaram <mbhattar@qti.qualcomm.com>
> Signed-off-by: Mahima Bhattaram <mbhattar@qti.qualcomm.com>
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur.dtsi | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> index de7c395d9c35..51fea666efac 100644
> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> @@ -8471,9 +8471,9 @@ compute-cb@8 {
>  
>  					/* note: compute-cb@9 is secure */
>  
> -					compute-cb@10 {
> +					compute-cb@12 {

The unit address is interpreted as hex

Konrad
