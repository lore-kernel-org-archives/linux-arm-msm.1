Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793353175;
	b=HBdv7WJzlZvV88xjYjW8qOBSVj5/Ab90AO4nxUDR2odqaYgr4YreeBli/uFtuu9XI5n5
	 ygPF5yiOTl7Iro9+AsAGarHHCiqAfBQbugzhsVuK8jKQitJX7R4QPSD9JOZxkYjELZNJU
	 L7RJNDfJ+bigKHvvoU3l4Fgn5evJZtfId6AMGWpVIPAxpLX/3Kf8H7+mjKqkpZHRaCnl/
	 yyzSDW2y7ZomojV7fzgh1cKyKmCAqaEnqVeCH4gQuenzZA1u0Ja/7i1DruV/nGkD6jxWW
	 qi8fG7onZmX9Tix27jgHMNz8vufmlD9RIdCEVDxzeBxadvAvehQnJPttXijl1XEmKXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793353175;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=urtOggJbUkGw4tpoKTxZdedqljv1BLA2Q2uuz8oB09k=;
	b=MSD7gtV7SbpmJ7k3TekewuEPPbYYd1L0gp8rDiZNGBZ0UexDJrKQya6vUonvDx+9NJzj
	 EogRDgzRZrGVztOm8ewQM/fBzzvlqwE0GrlLr9q7OpPBwGGXFiwJwFE0T1GYK1HEYvvE1
	 5x8XmK2Z6a725ZzTh7FrmImie7nsSndqZbpcZVQr0sJ744zCS67VnSwFAq/H/SCmvSejS
	 54iNL3gCFWRsSlJa+mKUPGLrsOecHboP8idGcBs77ZKgzR1WCltvdSI+W74kGLAXiNYF1
	 5HKNbNcCiIY9VPz3R2FsnIQgyTQWuzY3Hju4oB1wM6pN6h9E9zgQH2m6rxnhhLpJT/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RWrRr6lY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FAjljdw6;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C2A606A31C
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 09:39:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3C2A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RWrRr6lY;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FAjljdw6
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8EseV3737734
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 09:39:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	urtOggJbUkGw4tpoKTxZdedqljv1BLA2Q2uuz8oB09k=; b=RWrRr6lYaahDYwc8
	dAeWhIyeIqJ7u+wgKrKjWW6fuVo9f7ZInfVbLhyITDORMvlGYrDA8qlrtACNtD7E
	yz8s7iqTzpgzT9l4lLabTxPJDQEPvcBapWbbDNyum5yyYyKcgAqFGpYfQmJMltCB
	HlamSbXS3xEZfvZN3vq1eaQwCAGderXDodph7sv7SMPLmz0vmGr62Y69ymAOyvNI
	BbQ4uc4xxntHkNwHwqHjClnDjbRFsNr7B6XiFlV+FP0XjAjk/GHRQRv45isNXdO6
	oziz65z93uMBjG0tWdIbK4v7NXti646wbPVG7ad5MXPjYlZbEfhxZGXIMfvwDoLX
	/qKUfg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme75271d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 09:39:34 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-35c3c370b17so1149784eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 02:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793353173; x=1793957973; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=urtOggJbUkGw4tpoKTxZdedqljv1BLA2Q2uuz8oB09k=;
        b=FAjljdw6WbdGz8JKKFfBRpsr75CTlX0xKXVcU5HMRIoTony/Srp/0fFnQZStf+TGVH
         digwhqOE9NtbQFblET/bMGVzuXeS1g8TDHC48FlWcbZw6mCHA05KgK56GLKX+Bx78b7q
         wyeVtzOAsOlcy5eieG6d0IKGtL3xBRVPQhaJIviBtlgW+TPP+ZKL8YK0AB1dWYnte3ei
         +BxlzghV4rlecUPLb5RFNOhQvWRZLX4VIdTBZUfrrObINASJ8392veKNNWf8BLak/yoL
         +dUTDZXzhXnImTK7ndKdsj3kM+DJ3zPhHsLZXib+SmZfisZQnJLDgxsX+scTcWV1mVst
         Q+Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793353173; x=1793957973;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=urtOggJbUkGw4tpoKTxZdedqljv1BLA2Q2uuz8oB09k=;
        b=AAP45rFWtcdPbAgcUukZVeDpZj8qyJM+ujKrw183fVNBEkf4y/6jwufyclFyT1JaJ2
         P7qechT5fRGrR0vLZljH00Mepl1OD+yHk2vGa9qoCIJQ5yeFhZbzFQqaAfW/It3fzLQC
         n26ZdM5Z0lwQdSpTjq6dNWBzes8aV73GAA7Nq63r44FSckW1dXj6J9QnPFqg20pyxuWu
         N8D8NOue21eNQP0DDO1DCGNKQa6cW7Ui64V/SOWeuaOU/Du+gdiTsdz5QsOMbUCr5Lys
         YgCCFYoJx4lL42fFiEuaYYhLeojuRWqG32dbnwdxWq9i5QglmrQN4lMLAzs8XJpdMc+q
         Fgcw==
X-Forwarded-Encrypted: i=1; AKwUvBwSzRsKzNWLxY/TXHkl+aVtE4p5QRpNqcZbfRPt/eZXI3g676u7BGDmI0TlJtpH7GwL7bX9Unwoaf8QA65d@vger.kernel.org
X-Gm-Message-State: AFq9FYIEmA7+UVbENYpaEcrSL0GNgOGIMbZS/wjw8rdL6h7H10QAagZ4
	Gmhwu9OuQGzeglcguu782Iu/BXUE321Wg+umc17Snyx/BdT801ps+j7T6DwtDhdh3GbCAUYFevP
	v6lrj4rzP5RyyrWMdYhhs984GE6W9opjKSSMMe8ThUFvS0AzZfM4iZEbmuhKjbFbgVGyPDa/5i+
	dS
X-Gm-Gg: AYBFou0z7aSGhzREWSVvaeiQtd5RsARwKzcYKWcxuSDu4BWahSOIpOu/U5qtwa1wdoY
	52eHWYtV0rskyVw0NG0jZBmfK6vid/IWLsAQa7Mhf3oEMsrQqdvi1vWBxKOiDDHZk41AXfQWHIo
	B9OWHdCYss5iOMkimguBBPxBxXFYVnuNBA3O+6TfsxEIxpxkWEnVkvzk4GFkwyX6vtWpFone6DX
	yDrmsonGxKKm2lpUHa1394L64+1qSQOGPe3/tbQcbsu7RcIldjiOjhsrlMvcXfKfE/8K+BL0HVj
	BfXFl18emvDBD9zjJ3JMpZLw73Mn6MLD8Iz6/auKm/yxUgEUsfvOna2uCmv7qXwnTlT7mOXiSXj
	tVxSIJFlnWVoups4Dhx4+xJs0XRIk1G1dEb9yC7A1gKKRyPbhbYMFmtWapZwVbCMvXB67l1gjQD
	03Gs7e
X-Received: by 2002:a05:693c:41c8:10b0:367:185e:867a with SMTP id 5a478bee46e88-36a4242366fmr2925508eec.38.1793353173380;
        Fri, 30 Oct 2026 02:39:33 -0700 (PDT)
X-Received: by 2002:a05:693c:41c8:10b0:367:185e:867a with SMTP id 5a478bee46e88-36a4242366fmr2925463eec.38.1793353172638;
        Fri, 30 Oct 2026 02:39:32 -0700 (PDT)
Received: from [10.219.57.214] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a98f65sm5716667eec.28.2026.10.30.02.39.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 02:39:32 -0700 (PDT)
Message-ID: <2e26e864-1f17-48b1-b84d-17057e7a343f@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 15:09:26 +0530
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: misc: qcom,fastrpc: add iommu-ranges
 support for context bank
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261007-extended-mapping-v2-0-5dca3aa2c2d3@oss.qualcomm.com>
 <20261007-extended-mapping-v2-1-5dca3aa2c2d3@oss.qualcomm.com>
 <20261009-space-crane-of-prosperity-bba4d7@quoll>
 <1276435d-7102-42f7-ad92-84c61aed6d2c@oss.qualcomm.com>
 <30044b8e-cd81-4798-991c-dd2e7ca6d502@kernel.org>
Content-Language: en-US
From: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
In-Reply-To: <30044b8e-cd81-4798-991c-dd2e7ca6d502@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: hwLlSO8DeeEqayI3TkJI7r0WXvteN0i0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAzOCBTYWx0ZWRfX0rfn/Poow6XM
 KzH0Ti5D+HJqaEv/Rw9Xj/Hp7BP/nyv5Y/gJVJYQN5K8M72b6KeSwKXraWdXj9tuJwDSoth41hR
 Hgkvs322V2c6mrE9HHc7eQ1yOICN5zKXdqhL6DvMHJsYWJKLFa4xPcjYa0TWWoK2JntGemAS1tL
 yvh0k9V0pA/I/bblAfelft7etJvL5qu+9rUR6AneZIQWnAJlj7KpkgN3ubgCOcp0k6Jh/RREhAX
 /CaAhyRYyjngDNvcum6FRq64YQLVw3CoglC1B+D5SA/H+hcpK4epgpS9Vdls/1Fz3MHNajgnZ+C
 fGVhVcJb5moq/X7Q/tnOVF+pwXtDae3GL+gVHFbiU/z0JVDEkf5jY9b0pAULtlZrpVmuuJpljUn
 Wu1jSZkonzVNToDJCHfmX5zzFQF8AnjpH7X+KNTWveZvE1DL3mN6BQDolXSJsndgOo+4Sz3g+WB
 QV9f6J0BhPMk5PlBSCw==
X-Proofpoint-ORIG-GUID: hwLlSO8DeeEqayI3TkJI7r0WXvteN0i0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAzOCBTYWx0ZWRfXy+4HE1rWLxi0
 JJdAk3POouo0T1vLy1ul/DsUKBS/lwkg88+aqXg5ZlSXrgLhlF+yJ1YB17xoA5cG8gUvo79p0pM
 neoZKARRAmotfD0z+bZwaYCxUFh0KtI=
X-Authority-Analysis: v=2.4 cv=KdtHIgYD c=1 sm=1 tr=0 ts=6ae465d6 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=iXeEQ78Lhshhe8WC178A:9 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 phishscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300038



On 10/27/2026 7:57 PM, Krzysztof Kozlowski wrote:
> On 27/10/2026 14:12, Vinayak Katoch wrote:
>>>>
>>>> Relax #address-cells to enum: [1, 2] and #size-cells to enum: [0, 2] to
>>>> allow platforms that require 64-bit values in iommu-ranges to pass
>>>> binding validation.
>>>
>>> Which platforms are these?
>>>
>>
>> Kaanapali onwards, I'll update it in the commit message.
> 
> Then why all of them are changed... anyway, you responded two weeks
> after comments, so that's only fair if we also review in two weeks time.
> 
> Best regards,
> Krzysztof

Agreed, relaxing the cells for all compatibles was too broad, and sorry
for the late reply.

In the next version, I will add conditions so that the 2/2 layout is
accepted only for Kaanapali onwards, and plain "qcom,fastrpc" stays at
1/0. I will also update the commit message and add the new example.

