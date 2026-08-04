Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB4223F8883
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Aug 2026 15:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785856731; cv=none; b=Z4KExWGAEobx9WMn+W9PHnWovhhl5A6fnkiejau0hB4GCwtFugnADfW20qAfQGHmTij4xj45roI+d1IZiLu1Z1D+tRyGcEuwVh7v0Ur6EU56kQrheh+ORCnx2Bl7SuAP6As3hxfa58Of11YvLMm0S2snArEB3XBMLUi3sVBCWB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785856731; c=relaxed/simple;
	bh=CwrnEU3HCA+ZjLyrhS2d/ZHQXLlEFyFQmFNfnlbQTYM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Jf/2YBhGbUecjIM/d9G48Bn7AKo71Nrg6LvgzjM7xD70iW7uOKLLfCu4CB4uvLeOx4qvhlsHIqsCzZYrHQLKdLLAqoLGOEi6RWKvvqrcOp0m4pr0Z+FfHAXNrJ3Ck1qmZZke/l1AXVw0RMK4lO4IGLF1X4n9NOFqq8dK6exY4G0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UgNhnbwk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VtV3m0aM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UgNhnbwk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VtV3m0aM"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674D34OL4031726
	for <linux-arm-msm@vger.kernel.org>; Tue, 4 Aug 2026 15:18:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E180SL3QVJYB8O9OiTPj2R0g02zKzvX2cl+FJ8G5vb0=; b=UgNhnbwkMT42EI+T
	YKqvgAngxVINxcK2imdWH8ar9nSFt10ggaB7RHj/lTsRLlEwHmRxECM3Fgk/ee2B
	Xj04l/k0Zg/bXQEQD8brReeZUJJK1qwzSus75H5z08KZkuvmna7veARkSwLateq2
	Lr3xOSK5F6MU9oJrNtop9ud1zd4mZ9ViPVIe5PsQXGzVH6Fr/U2b/h+fS4f44dvn
	h9aKdR0WXnOJFPKe7VN1EIUHDj0NGVW6FkBFMQktj4tgWDkgnJBhC5IdoymVWX+s
	IfwR6FVejmfoJC4iFOTfobElqweveWcmgYxx+1LA8RV9PIJenUC/+OpT9lsppS+4
	+nIXiw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fugmg0p47-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 04 Aug 2026 15:18:48 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84c4cd31b51so1402831b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Aug 2026 08:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785856728; x=1786461528; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=E180SL3QVJYB8O9OiTPj2R0g02zKzvX2cl+FJ8G5vb0=;
        b=VtV3m0aMK+okjV0/mNzrANByg3zIfvZyF0VGjB0KWAICGPsnRA1VEs4Ur87xsSACEe
         ptDtCoKqZsMBpmhrbJyhEB8IW+3Ef/9WkkjR7Rr4pv897dlqbN8iRY4TSU3Hsxq8YAkE
         JgeABCbSz7vH1oCCN50TPZdtHW4NMcK41In/TMylqYMhFdimYPkxBLillY7FnMxm7LwX
         Ta/sc9wiukb80RikKnzPmmaNt3y97mvq158Qs+UeO/DahX+0FdHT+y8N7ffSq9+HEzdE
         yfCJwEW1uaxZjYCvkru/oDVlhYRq41AebvVJ57CdOaNuE5vsz3uiISfdwAMf2ouKPMQK
         XJjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785856728; x=1786461528;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E180SL3QVJYB8O9OiTPj2R0g02zKzvX2cl+FJ8G5vb0=;
        b=Mx93LSnt4dYJgdAFXf0kPWvrqVwOr6+PcBBxiophf5IUQtCt6M1GQO4GYr8lbm2NOU
         jX86V1NkMcPYk9BrAAZm1VcJ3Ia312R+nPRkj4Xcl+LZ+WszECnndSOjZo//YthiH1f5
         +GNoDfb13SMlERWeGrgH4IXQT+ow4clwv4VZZWw9OX+XgKfKr+1nSsFJeM6EeJIL9cX1
         fhr/hGF2oXP6Y29Vo9qxQKUahHgVGYNGjcFr3kICV0bSFJ98H3cJVt40gDAbpkKZPuRW
         SahRs9Qze1MIYziwitiZblcjlVqzHynx2QA4xQaovsU5n1+WbvmFjgglsli+DaMERzFj
         qF/Q==
X-Forwarded-Encrypted: i=1; AHgh+Rq3lcpKa4574YT25uraOwgJT/sTQpLapMLhpHoWldLpd/N+ytIYLLvenFrcsefCKl+AssVk6bvu/8M6kocK@vger.kernel.org
X-Gm-Message-State: AOJu0Yy551H9WPBOssTn/FTRtU5KHs8m81sat9PVTo26+Q580zdoWzir
	RQJ3dT9/iYm6JBbcwn3bUstDmvWVga/ztKV6GmhN0c201InRPTq3YLIFZN2TmZfheZMsJ+dqCGI
	a/4BRyEIxM0Njev0g0iGGj8FuSC203cum5u54kOk3V7j5RnTh21Mywsr0y+/Nyrv7BiXf
X-Gm-Gg: AR+sD13KmKHwtFr+1R6qQDbLb5/+nl3ZPKoJc59NbR5PmbZPDV32nmb0drBGo5EP0Zo
	4R8KRarRWPLu5t6xUUf2CkNpdhjm0IG2gQzFqhNNx55AKkZ7f5Ul7WsL9C8SDKmZfsNSC7d2xY0
	snMH/7ieoqxSTulBwPKfNTHxASGqQFkhlJ5bbYR4Azp7OZ71Xu7Rsmz5QukxA3Rt9hKqWqdM/TJ
	N480qaC38Ur7q2JpZXnCnrsCtre1RVFqQej7afOzMcY7piTJj4qSDUSZ0S1lNZ9hRhd4iMqqcRb
	EELOvi328WmJgQGdHsjiVfpsWllLC/WlRnMi0PozIx2MNS6xX/mXdMxlHT5Re+BonlfIIoMhNdj
	TyUHCDRT1QdEO7zm4doB9On9hk8/p+3yaGp4NRA==
X-Received: by 2002:a05:6a00:3912:b0:84e:354:422b with SMTP id d2e1a72fcca58-84f2dbc97c1mr35081b3a.2.1785856728151;
        Tue, 04 Aug 2026 08:18:48 -0700 (PDT)
X-Received: by 2002:a05:6a00:3912:b0:84e:354:422b with SMTP id d2e1a72fcca58-84f2dbc97c1mr35041b3a.2.1785856727675;
        Tue, 04 Aug 2026 08:18:47 -0700 (PDT)
Received: from [192.168.0.116] ([124.123.146.251])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84edbe5702bsm5531130b3a.16.2026.08.04.08.18.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Aug 2026 08:18:47 -0700 (PDT)
Message-ID: <c1f8b5bc-6d50-42bc-b671-7e91d76cb975@oss.qualcomm.com>
Date: Tue, 4 Aug 2026 20:48:41 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Subject: Re: [PATCH v2] dt-bindings: remoteproc: qcom,shikra-pas: Allow
 bam-dmux subnode
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
References: <20260729-shikra-pas-bam-dmux-binding-v2-1-d85fea84c141@oss.qualcomm.com>
 <20260730-organic-chimpanzee-of-excellence-ebbcca@quoll>
Content-Language: en-US
In-Reply-To: <20260730-organic-chimpanzee-of-excellence-ebbcca@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDEyMyBTYWx0ZWRfXysmvWvHScHq3
 voLxJO/1gS/fMT+MPJBPA80hjXFyPL+vnBCRFvpgltoAItkaHUV8WaM7g5idbpCqsdCXONIo3Mh
 uSSme/lNaJGIgDicBdgg7A4hkuswvCg=
X-Authority-Analysis: v=2.4 cv=F89nsKhN c=1 sm=1 tr=0 ts=6a7202d8 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=K/78aEDNEn2Q/Yuv7mVN5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=4pVsCTw3SaIgFaj2y6QA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: 0m3o_uVizMflIjiRwt__8xeUMIyaKvC0
X-Proofpoint-ORIG-GUID: 0m3o_uVizMflIjiRwt__8xeUMIyaKvC0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDEyMyBTYWx0ZWRfX44mqOSjXLhtH
 AvTWx/kQ34MWx+9Pb4cURLY0BJ2tkSA2q6TGFdsbcWDE+hb+O3QN3d6HkPqGhpRYvI/V0cj9fRK
 RefUBzo66Ai9Ape8FKas13wmLpn+MWHhT1rcFQOOAMhdNipMRYoYdvWPwZHwLenxDfCJjH8OdtW
 yTPiKCwjyg3V1reUwZuge0V4t2/ziBC4lWLVPkoVMVQhiSwN265C1w7aEeWdlhq5hcbF1M9dh18
 2Vm8BN4om3s0g21jajs5LqGa06oNFwBuydLFSGhOy1mAXbdxeAUnhQVJVK1M9/TIEiH2qd7IboW
 /zYNH4DjoG3kwngVey323McuaDNgYs1/i3lChKmRwHpJF+wQPoLnuoor8VjpjMg1DV23Z7mcsaa
 1SHN5rAgxtSDfwm2ZXUZYcEzT8DxsGqqk3clhHICxeJJ83P2ba4PcOtiQextUObfoUO10Rbx5ko
 GXdIakDx48P5iz6fi+w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_03,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 spamscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608040123


On 30-07-2026 12:53 pm, Krzysztof Kozlowski wrote:
> On Wed, Jul 29, 2026 at 02:21:01PM +0530, Vishnu Santhosh wrote:
>> The BAM-DMUX node lives as a direct child of the modem PAS remoteproc
> No, it does not. Look:
>
>    $  git describe
>    next-20260729
>    $ git grep bam-dmux
>    No child node shown

The commit message overstated this. The dt changes are yet to be merged.
I'll correct it in v3.

>
> Why isn't this part of Shikra remoteproc commit/patch? How any code
> could pass validation otherwise?

By the time the BAM-DMUX support was brought up and validated, the
remoteproc changes was already in a stable state. Therefore, the
bam-dmux change is being submitted separately.

>> node, but qcom,shikra-pas.yaml has unevaluatedProperties: false and
>> does not list bam-dmux, so any DT adding this subnode fails schema
>> validation.
> Fails how? How can I reproduce the error?
>
> There is no bam-dma in this binding example.
>
>
> Best regards,
> Krzysztof

Did you mean bam-dmux (the property this patch adds)? If so, I'll add
an example with a bam-dmux subnode in v3.


Thanks,
Vishnu

