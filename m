Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4B84A2616
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 15:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791819074; cv=none; b=VSpnaJ+Or3r8Mh72sIrVLR30VjOvUwb5zK5pGLrROurglxb5j0Osa4TvDgYmrt6Q2q8wQgOej7kUHi2PdiuivTapxAcxfaYNyUyVdVnCRRFtgh0dQM0jq2c9pc+MtRZ8F6dK8oVxF+9rUWG3O7fm8S0SSwlieg0GHMenoWhaMGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791819074; c=relaxed/simple;
	bh=J/AWg2rO9t6Li0W4BRRLPjLIlRWnFxitTywIJjioLSU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=guBRusEYM6X1p35GucrmQo5i31CzX17hM1vsLh0+0BVGP4qzDafXZZZnxqyofNDVJsGs3r5C/Gv4/XIEMsDcP+NVHUUd+jC5B/nMUHnHJynl5wc3xpw37yhqfhCZtJ9XVlE22o9p6ks4YXzDdLWdQFIDoFTYo3+SS9C0OPs40Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eS0NZrAn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I3/PWSrc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eS0NZrAn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I3/PWSrc"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0BXA2275910
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 15:31:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bvYTY990Iqo8HQRDO2/ZvwfM4lR0mz/0Ay4o4IXYJEQ=; b=eS0NZrAncxL7CP9E
	URE+uPb+lbqKEBKR12AQ7Fw5nIN+7hUtX9CjVZRyFDfMUXWNS+/vxbkGAtIJQtSI
	qo4gXMtJJmrRAUxLbNO/Yz8ubpXmaWDAMlnTnphwlJyws+0saGmPXDfObudXSIx9
	3hQ+Qbv7dxKfNp74qlfZNYcn00NODxKkvYvaIZPZIcRW37MVmOnAhejsMN1kYIXm
	+p1mVZErAFyIEfDMZnVJ9LQkhxD5r7fitKQN+AOENkZTMrEh4s/KYu7LFIZLo8Dj
	aeQWtI/wyGHmfSldgX1N4w7VEF3drN7/8+AEYlmBzEh6RNWAG+8wtpYJtoSU9icO
	RbnJfw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8udq22gs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 15:31:11 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7cba2460f8fso30427137.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 08:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791819070; x=1792423870; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bvYTY990Iqo8HQRDO2/ZvwfM4lR0mz/0Ay4o4IXYJEQ=;
        b=I3/PWSrcMa7zML1HNocFF+lCmr2Jcx3TzGxajneT0bYOnjgw7kHbdWUFwtVeX33l9P
         aucMaHAxBCPU7aG3p8SjiL/mZpAs5/zQOQrffJHkYe63bpaNZjBoW+sziKOM6SzYnChs
         HY8+h7chuzd1xEXhRc2afgvAFLLvqZUq3oEWvwdkqM00aR+WcIdGo6JjeqTkp0zqTqlY
         4KKT8y9ekslJfrY0HiVezCl1nfy5UtxQM4MWTuXelamnbpI1AYsvtdqeFdv1A7Zpeu8b
         LOPLaf9g5Duh+/xBag70MDhvszVB56rsMZv28kiYenlMbvG2+vmf9EssKUE/DKexPMih
         tx2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791819070; x=1792423870;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bvYTY990Iqo8HQRDO2/ZvwfM4lR0mz/0Ay4o4IXYJEQ=;
        b=Y6bp4Zyy0VR1QKfZJnuhLXmswq1aYrYYgDoINCVLsLgb5PEFV3PbbuMnNo1smA81eN
         wK+A+4by117a8lR+RhRCuQY+Y6mAx6Qf0T3ZfUg3UmHyl/MkO6f0ntEQPZkjY7iNTiPR
         Czui7pkphpDf1Vjdud/XjkRPoJcaHtFdYEYXP/IPQDnmXhJHgGizVVjPWh9DQvUPy4m+
         UxxhC8eYOf9wnMHVmlU9amjQj91tHTtnH2Rz7S+9HjR8gjJKaHmsdkGOeQYXnr+QNntt
         k/QaqtM+ruQicVlWcF87vgS659Mn35MIMIveU8mdDE+ZnBFqfluDuDgBsb2VXbavYmSw
         RiCg==
X-Forwarded-Encrypted: i=1; AKwUvBzGfYgjie+vcFEPZob5evmC4zM/S/nRTv66pYBRJxVkoV2St/FRWdhkwYgRr4/zbPcp2AAWDLl9EmJr5Uwy@vger.kernel.org
X-Gm-Message-State: AFq9FYLa19sNSmP8eOv3MQZZ3bz1BZEazbo+Tzb7OlBSCjMoY/1wNrSU
	kyA6HyJk3KY4xzT4ordUnmwACnLkOLIDChjaZpiHah0lVt502rr77DTnB+AuIVX/BLn8K983u1h
	rqr5O7F+mKiuO9kdICpZdGbA7AEa/HmxX9VWry3juCbFj7zYZG3mgv8ZQ7WSSvh+6ucGj
X-Gm-Gg: AYBFou3f/iAUD5OMBIjfD/IPqDcxsQyuSHyukZMqsQE9RlTYGVsRq9VAY6YyZ+Xz/r5
	+QBPK/deWVlsGih0ERgwoT3lflUM5u9IVAgADPldIR67XtqTUzLSBNLQ9TzipBz1L6CufGsG5IV
	hYGJ72ZtgvZddOjhpZ8Tls0zU4/fhnttfHzlgUg2IgXwe3SolXU+cchebVdwBRNBb+1E+U/1tfF
	DLk/A55pLsQuHrV+UBERGY0VIBVNOvEXJA8oDEKS1yJYZtaS6ac5TBLL7Mv4JrxVjnZ9H2WS/ov
	VgEqFufyJPidTKqMSStJFM46mF0vU3aYFZLke8UyLSTURLUcCdurPpbqbnnv0NtAMgICDjy9Vy/
	i+XcH7dZfrAlYl7fgw/a5pQ==
X-Received: by 2002:a05:6122:8704:b0:5e9:397d:b197 with SMTP id 71dfb90a1353d-5e9397db6b5mr1467860e0c.3.1791819069872;
        Mon, 12 Oct 2026 08:31:09 -0700 (PDT)
X-Received: by 2002:a05:6122:8704:b0:5e9:397d:b197 with SMTP id 71dfb90a1353d-5e9397db6b5mr1467403e0c.3.1791819065083;
        Mon, 12 Oct 2026 08:31:05 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3498276daasm159103066b.51.2026.10.12.08.31.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:31:04 -0700 (PDT)
Message-ID: <4451c072-3a11-4819-aff4-e7de100cab8b@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 17:31:02 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 22/38] arm: dts: qcom: ipq8064: Break long property array
 data
To: Waqar Hameed <waqar.hameed@axis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: kernel@axis.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1790892852.git.waqar.hameed@axis.com>
 <3eb4fba92d67e7ff3486e8dea17233369f62545d.1790892852.git.waqar.hameed@axis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <3eb4fba92d67e7ff3486e8dea17233369f62545d.1790892852.git.waqar.hameed@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=evJKXYpX c=1 sm=1 tr=0 ts=6accfd3f cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=3-RhneuVAAAA:8 a=3huqtpSITNoFkarYwggA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22 a=VLVLkjT_5ZicWzSuYqSo:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfX8eaw+AdPs9SA
 JwNYl+MdKcqckaKk4mkpL9jgdSeVaWhsHF4A2MnsAWkq9Vt+gMTplUJiqnpJ5/4RIAC2jvpFYs/
 9TByT0gaO+FUsm0mx8YWl7IcNNfNnn8=
X-Proofpoint-GUID: IlyHAR5VkRFceGGFURpLGq8CDY5oBg27
X-Proofpoint-ORIG-GUID: IlyHAR5VkRFceGGFURpLGq8CDY5oBg27
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfX3auqBxL3H343
 mu9GoZ9g1DEZ+CLEQL7vcfPPSv/5n312N9vsIOsRDYIxtcd/xlmHIJVwVl7sXHy7oKPBggqS7QB
 m2nrlRg/SUFalu2/b15DGVjA0Nj+kAJINcEYhuFEX1QxTgjO7XtbLaJMbW7ffwTwAxIzgZnpN5w
 aivHJg3bxLXOCFDHTP6IZrDUPX1kJPH+HDqHbUYp6DL8HKj7ESaGdo1n5A4z3Pr2amYicHj9sXD
 vhQlKvO6nSbEgtFJzz0Kaqboe+uGey8Omzso5mBauOc2IdFInrlrslFoowxE2LoTFVql8ZTZlM9
 wiyvNpugxwIsD3KnvmfCrGC5g4NUmHRPUrgyE/PUJD1OVL70MKKVE0iN07KMt1u5ZxXYkO5zNg2
 5Q3OYaPX//7+F4cq0Pmn3E224tvTabpWBR5nL6Ic1JBU3YburUqhDmJgwfU67v1jspSHSn2XuKc
 vIZ9yTvs2dUYhYhoLig==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 adultscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120061

On 10/2/26 12:36 AM, Waqar Hameed wrote:
> There is an awkward line break at the last elements expression. Put all
> elements on a newline instead. Found/fixed with dtfmt (Devicetree Source
> formatter).
> 
> Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
> ---
>  arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi
> index 24632af28d52e..d2b576a37c47d 100644
> --- a/arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi
> +++ b/arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi
> @@ -278,8 +278,9 @@ memory {
>  
>  	cpu-pmu {
>  		compatible = "qcom,krait-pmu";
> -		interrupts = <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(2) |
> -					  IRQ_TYPE_LEVEL_HIGH)>;
> +		interrupts = <
> +			GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_HIGH)
> +		>;

Let's wrap it at 100 chars. For lines that overflow, I think we may
need some brainstorming from the wider audience.

For reference, we have a couple of very long lines in the Qualcomm
soundwire nodes (qcom,soundwire-vXXX), and we just kinda let them
overflow for the time being

Konrad
