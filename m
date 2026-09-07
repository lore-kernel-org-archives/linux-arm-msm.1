Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DCAC37BE93
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2026 12:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788785836; cv=none; b=hMxaCAyU+/ikzwUW8hOWbKBOztld1L+/XIdo9a8LonpLf+XDFoZnncvDqEgLmpWknrE0uds3ZqnTbHbysxUeykmBRG6P1hKV8gTe+WdhKeZBHQdsgkGIXQtMBvCS2KBsLJjknzjknYoZDaD2Y5k7bnrq60Bj/IJRUOmpj3TYeko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788785836; c=relaxed/simple;
	bh=Q/jU/CzwiIUS5/1+gDBO6vEJCkuSQCJSMr8mBk+OxX4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qCuKtH4lFHVlrZ2bvfnpd/vwZdkq3aWm8Irhe384nh7guYuBVmcUaHQ9hoKS9elRBV4pvBUe/VQvvH3T4GtPB/N1CXyvUMgyv1dyd/Q1fDv890hD86HnNOy5xca6KVXMjXPexX/0LBaP4fyK9QZ2o+hLWjir6dpBwwq8XpEbsdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C7Lebzdm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gcTFQRnR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C7Lebzdm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gcTFQRnR"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687Amsvb2652187
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Sep 2026 12:57:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QVn+zx05ZG5vgGFE3mDfxzd5a7QCiGbj35+Nu9q1D3Y=; b=C7Lebzdms5HqeqC3
	h2upwCAxlpFGF6S6/40S3On/uUXxgxvT+ZEaDqDIbGVSwXyNvRgRDWK7vuue8yLt
	6HipWeu9pOELQQZuSwdiB5Haeq5ycuLUldNAWJU1zTo6Sosr0O9lJcOc4RuV8VoN
	Csm2fzKGNn9vvRPBPtuetUX0arXMaRlhQUKNWPS3XeDzhfSDrfW846fod5f5onWV
	goAKi/9PGY/Uh3HLqwvmQ3eLWUZojTUOeau/HrxeXlF6b0xvH8EVAreFXfJNsGxU
	zJqKYDhP1IXF16KiSUr8cBuTUyM3YqrpVbvJkMC1N0CLiuvZpznCHrNxGUXmi5Os
	v9YAEA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghtty0q31-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 12:57:08 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9102fee9920so7509686d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 05:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788785828; x=1789390628; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QVn+zx05ZG5vgGFE3mDfxzd5a7QCiGbj35+Nu9q1D3Y=;
        b=gcTFQRnRRnWJQcpIW5wewZzuzG9LPotcBmpB49N1vydjlLltz7mUeFEEjpStCfL7Sn
         fFQX4Xr7a/lL4GF9PU+C7kuX6mpiy3vgRYYGp9BJmZrlaPDYduXhs1OD257pm/JyaMd4
         KTqYxpdne3lSCphnT7xcjhPYNrW6ddsXBSl5Dy9f3e6HGf8fpDYMMLWN1SY8EIPaXnC8
         VQ6qPlDb1oVsGBu4ZUFlVQQSfWCrAdYsdxOpL1jHqWQPEijEUzIEjHnqbVp40r1Qtkr2
         o7dBYgnaydPEtvMeBMvqGzf8uylLkqhszIyvSEjavFN9uuo0gWea2rE2bFSCGrzqfblC
         +EOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788785828; x=1789390628;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QVn+zx05ZG5vgGFE3mDfxzd5a7QCiGbj35+Nu9q1D3Y=;
        b=CGbWWwlST/JUzy768j2qrI64vXeYcz8V2bVdKawk3UaHpKQCs+zLL1N2QN7FdnczWJ
         aGE/1hBFGAiiDUqD7Y68UPV9z8yHFivI4FU3j/8aVxOBIkdZOfKniUHSLIfr2niQ8j5o
         XB8M0ifMBnexeYIKcZDJN9pSauAcnY4CU9WcdnR85nuCeTATTdhmnECNFaYLoZBu0LED
         7DsDWS+wZsDDtHjoPtWfoSCg18Hak3XOQp0s1LJgrOdduFCzpuVYLllPdAPi30bgg+oE
         Oh0eG0aZhZj4ph93bLp04/QJ3PonM+1GY4dens7wll59Jcd0AISSpSwgFzOjLxbRRTnj
         XDEg==
X-Gm-Message-State: AFuF++leysaNFkh3PcjN8h9cwejLlNFxcvSPZLyx1eSJVTzdAd3zMiOJ
	/N9l9yH9eRrUfTvJ6GHqHNBJY5FpgufxzobSfPKuKT+n6rEbONjXARRpH1IZAgxTP5LhpP6ud4P
	6CVHKPLxvFxaBbdKhtrietjhxbCAGGPkNCxD+x/ktmi8jSp8drZa0PfTxqlZgNzJ2jLQy
X-Gm-Gg: AYBFou3N2CAPcO0BAvbLNLXB7RBu9bApz7ne6kER4rBqJSbH42BjZn5q0avNUZ1cGI7
	/i6Vew1n9bhLtqtYdYUSH819E9Qmjd6ypEIIhC/U7FaSXpi3aOaBKiXuDb0H9L8JiBy3iH+jgMl
	eam3EqH6XGlKAy5e2wydjwXohy/+9gjAPsxduCjf/LcC55GzJzbBOU5iUWVSjLUJb0GVDV2bRJr
	S+TTsaYtuwQCl++Hv5dnwgxS5nCrY83d4ELkr96MiVXRZeEis9bOJnW3WlvO+0CjKD9ZIf4Ke/u
	2LD3Hq0GxJrrheLBlxwobCNVg9TXzdWF3OdVGCLMYnMYRZo3+zLH3zxFRep203V83IRTWicMHNz
	yC9IEpW8GZP8sIUuZC6nyYg==
X-Received: by 2002:a05:620a:4141:b0:939:47f4:935a with SMTP id af79cd13be357-9399188d614mr1231542485a.5.1788785827994;
        Mon, 07 Sep 2026 05:57:07 -0700 (PDT)
X-Received: by 2002:a05:620a:4141:b0:939:47f4:935a with SMTP id af79cd13be357-9399188d614mr1231538285a.5.1788785827480;
        Mon, 07 Sep 2026 05:57:07 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d5277e6sm459162266b.27.2026.09.07.05.57.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 05:57:06 -0700 (PDT)
Message-ID: <7284d02a-bfc9-4d30-87ff-32f9ba65cfec@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 14:57:04 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/10] arm64: dts: qcom: ipq6018: move DR mode to board
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
 <20260906-ipq-flatten-usb-v3-6-13e4e0f63123@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260906-ipq-flatten-usb-v3-6-13e4e0f63123@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=QNBYgALL c=1 sm=1 tr=0 ts=6a9eb4a4 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=EtrS5e4rPv2Xu7PadmEA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: qaxBStiRGrmfQAk3PXG1W3DHHQM9jw-x
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDE0MyBTYWx0ZWRfX/sUSbqWSq5mC
 VskbugNAUJS90C0t354ZVeZ5iMp4O582F+Nud2+NBjGxKS1tg1K0Cn3hMlkiggnrlZBE15is3hf
 JhCHWOaq/RlLCHUyruivLZAa3KjmlfA=
X-Proofpoint-GUID: qaxBStiRGrmfQAk3PXG1W3DHHQM9jw-x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDE0MyBTYWx0ZWRfX9qWDd4JHxNxZ
 GEReAEyLKIV5QCnt8aB6iTv9xIoLuj3hH+/Xq03vuuRwUBKmsIhlaRFAwGJ1qd0YVBS7GuXvsl8
 ZDc59Pa275ftxNYplHwWZaPQmYolhnX0mK8crbh1RuMwmdP4mdx8JmnisUKdtAz3VnC/dbQS/ua
 Yi2VrQgURdJVaoBVIXuNc/mjBRKcY4Im/o8XUgdXs34mYKrDRAb5mT3iBhDC4qFh+DwWoPFnMnn
 qHmic3MBgmWogPdM8gJtvnxV5ZF7RlvWLhmxiyISWWxsvnOEGojcwlx6a28l7o07Dcsin3fzTAR
 dxhbgSQeOMk6D9ceQLaf9XrfCfO6YYe5bUa77liiby4OW0knczghONe3whZGGF6e1IIpqEngRMp
 N30JUYT6GCj0xu2oQuqSY62Tq+FKkXj3xWRuJOqO9tKSGE/sD0pyDvkvcjyCCmnLojCzwP51tii
 IXM13J3HBnaFBiDvNhw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070143

On 9/6/26 6:46 AM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> The controller is DRD capable, but it's currently set to host mode in
> the SoC dtsi. Unset it in the SoC dtsi and set it as host mode in the
> cp01-c1 board DTS file.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
