Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB8F4CA76E
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2026 12:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788785855; cv=none; b=V+f9kJeZlp1aLE/ti91TOtMblS0V+jaZBZCoeEVTTIMJ/lIQZuYMiJYwu8C3dxU8/54mTj0/M8ugaBvkKnP+zUZ5PjmJ5HhDY7hxZqIKb0//41cvqHGAk/B6DbIGqHXLUzaP1MS+kkrK8ovXZuBjxk2lHhAWX+ZUnm/fOnTap6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788785855; c=relaxed/simple;
	bh=ikOeO/tWibSC6iQA7mD6jXYuV0kQJtjOsGaYG7zTij8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fg/pBcXWUdg653YCpO5qMoeBWAWT4LpZ8mSUURU5Q36W0pSRpMDEuZ16HCgY1xlQI3+UHRWZMoWZ6ishYWJtYFeNoincNWKrgC+DIbVxKeFPGvlYiA29E76UnF1la2NQK6QMy4t0pM5/fAA06hWqelIvi2zK5Du1raqoUHZKjVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cswsJG+z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IT9AY/ne; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cswsJG+z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IT9AY/ne"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687AvM2v496217
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Sep 2026 12:57:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Kg29QPdhTI8NHpjy2epN8WVYhTronX+r6+kH71sWj04=; b=cswsJG+ztxu80V1X
	AufJmu+uZQIDXqjTm0wYgchxoEqga3lk9IT22i1b8lYDGAzM0r7rsfRJ66SKl/dk
	NQIfAYmYNrPu1ugDQKjQS1ADhQuKUabGuvWGi2pRvgaajKoJPppm/FwEVFHyxaX/
	286AK4L8I/7aCppG5iGK5IVBzALfaBtlZ4iSPc1l21Gu8kiPSU8F3xQ+x01fyejb
	VLrZa3oAJJuTWAike9EhoUiucg0MNMvlN8ptcAP3+Aiy+az2G1iceV6t46vXsi91
	l/VJA1tL/FtbY6a33IYcfSbq8SsVMuDrLvpKD2gy2l2L0aoYZvRtJNkD7eVtBjlg
	7rVVag==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghuyk8ct7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 12:57:26 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-90cd9fe6336so10308856d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 05:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788785846; x=1789390646; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kg29QPdhTI8NHpjy2epN8WVYhTronX+r6+kH71sWj04=;
        b=IT9AY/neVxIE8NuQ8cr0E1rKAZGZYk4sil+ggYe0cYz2U7siIwj9a4IU+XPSUA5oF2
         1u0N1u3s5V9HSh5w7VVVJtBHUnq+jPa2OvutbFDvv0uR2JODtBGpeeuVkK/p2CCShcgT
         EIqFGiiIyBvDMW/TtFNn0ejy6u9YunmlcUAL8WRnBTqhO+UbEUOuIP+145eYFhsxPN8z
         AVkxizbho8FgCjbXR3c73fLXsqO+kFUH6HkUUPiGQeMjTumzFaxesOqohzIqNDXqfYP8
         m/Obupl63oc+gMjABOc831V/KaHmRNQpzoGQVCagFJkyzX8cmUnZ2C9HdP4neE/fxk4H
         OYJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788785846; x=1789390646;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kg29QPdhTI8NHpjy2epN8WVYhTronX+r6+kH71sWj04=;
        b=Y0pHNbnw5B1mIV4n7IOQPddkDNQ50l7bZceRWkcrGCZv46vpXSedptt4XMvZrsRQBb
         6pwrDvtRQ8Y4jz9c2+vdzGXX33y+wrE/0QH6Dkv3WXtXX5Jss6QFi0tqBURO7+R+RJIH
         LrELO7rzA6clvPe0tzyDWEgOKil6QqG6wd/t8ieelgsO7xUljClFHIIH3Y5bNGa0tZ66
         1jKkgzKOyE6BU2d0dYKE8lbRBMbqqDJVb1AfglxQ3kPjDJRKJUNbrbDee3EmclJYJ+Mk
         4IZAhMhINWRZbtH75NqGSfYvqZoEXKxXK86gBsLo0kUx5KKWWqGJpnHoPmaPLG2y3Z3P
         Jtxg==
X-Gm-Message-State: AFuF++k/VtVL175HV5pyBgsxN7eul0bTG+NFNsBMcgqcjXsxlOzrHcNV
	FS5QHVWyXgPk5LC3fDgfwFXnpImswRudbZeUEh4males2nHBs+lX0BitksuXpPdvhUQ/sMIrmHJ
	p23kR4X1L93upm8cciEWudJ3wYtUmpmn9aTcto19obar5zjaiomh3bWasIoIU8Z2gf0i7
X-Gm-Gg: AYBFou3B6vnSQsfY+2krOEMSXyE+66I8dN66shbnYifC5zIwzgvZX8Y4B8Js6cYQ6Xp
	I4MdMbTuCOoYOBiys12EQngAStP7f/CGWc1AfSmyNpXW4CvueF+yhMW/aoUsdR9VwLNIXLEN/dx
	FvuJMn31SyspXmwdsia6IpEyP/SPZFSEDLvEHbL9uF9J51kEYiT/Itp0nrmukMdSx4kXamsqD7/
	Mqli1ySxm9hWEkEl5kppE9K52+cak7+oJXEbs/z6jTkCU0GkYnGLVtgFF8L4SZmWe+afaoL1Tr/
	HvuPb2VcoUnII23ostmC6nlcKhhB58bkVWm4gVmjWwSRIw20B/sz8DcH4bUESEPxPD1jC7GVJNO
	kOx+2K5691yvsqkUWnCZJVg==
X-Received: by 2002:a05:620a:7103:b0:939:9ef4:79eb with SMTP id af79cd13be357-9399ef47a04mr808266985a.6.1788785845724;
        Mon, 07 Sep 2026 05:57:25 -0700 (PDT)
X-Received: by 2002:a05:620a:7103:b0:939:9ef4:79eb with SMTP id af79cd13be357-9399ef47a04mr808263685a.6.1788785845319;
        Mon, 07 Sep 2026 05:57:25 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2622a7c677sm361995266b.9.2026.09.07.05.57.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 05:57:24 -0700 (PDT)
Message-ID: <615579df-d37a-4917-b2f4-2ddf0d595f9e@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 14:57:22 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/10] arm64: dts: qcom: ipq8074: move DR mode to board
 DTS
To: george.moussalem@outlook.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
References: <20260906-ipq-flatten-usb-v3-0-13e4e0f63123@outlook.com>
 <20260906-ipq-flatten-usb-v3-8-13e4e0f63123@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260906-ipq-flatten-usb-v3-8-13e4e0f63123@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDE0MyBTYWx0ZWRfX1j4XQdB6dFdh
 c/QnIR8DAPHwLv5am48Qxr2RGO4Rl5R54DzpHuGaFc3tUXQgy0hf/8+dHWMj4g5y9xZUVYeQ0ZS
 LwoKVxwQh1iv0UG3bu3h8wtMvn5PMhk=
X-Proofpoint-GUID: jh0l1jGekYbXNVYlUPxxkG52M4OEqmeY
X-Authority-Analysis: v=2.4 cv=ObSoyBTY c=1 sm=1 tr=0 ts=6a9eb4b6 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=3QQp2-qM9dL-h2NKckwA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: jh0l1jGekYbXNVYlUPxxkG52M4OEqmeY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDE0MyBTYWx0ZWRfX27PekclKeyJ/
 Yz85OAo38ivLZ6Fqt2Ra+KBoJLbecTYEQzRbJacTJgLewlEBRYyu0FWtiCwaITBIVESj/5tnntf
 vIujuMp4k3rhOYP7loRK+x8Er20OYrlyUoLSZNjHb8Y6JNNNq4ikyoGmp52u4OfBmTOZjDK7FjS
 pk5oQsbBs9UYgZ6rRHPpAbifREQjiSGYQOSppYOHvZHSZIAjQtEwN5K0wMuy16+Id28IDAJpS/C
 ePGAQ+P5KjWJpDev/eplobh3x6fsJzKXotbckfXj/TjdIbY3LdPuLhjPUqy39k65xM7Wd6nXlck
 Z/5SJulGaeImY9vKNG70+YKB7oLNMtMbZd9VzbVwhVYzakTgjFNDYCfj41AoyllXVIklL96M059
 ocy6yr2FV/jRRHDvKl4i1GO8FcMESW7rADJUf4GHGHrNnfNrmLI7ow+RqvrxwN5Cb/m4jUaJJSq
 B818gfN9F9Oa5qEcpLw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070143

On 9/6/26 6:46 AM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> Both controllers are DRD capable, but DR mode currently set to host mode
> in the SoC dtsi. Unset it in the SoC dtsi and set it as host mode in the
> hk01 board DTS file.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
