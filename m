Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B13C30CD95
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 09:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787219222; cv=none; b=eJyluD4NseW7SfFYQ13fTYnzkn1xEoXdEDBo1WWR9cwWXzlnWTWR301wfCA8VS1+Chh8MjWCvuIfVbT7vL1ZHfAHN+sEq1dK19l5LkYwhadETjnxlyZhk4/NqXYmBtMybp2Gj1JpozDiZvzLfJsxmW5c5cO5O8MmjyW8sL5FyJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787219222; c=relaxed/simple;
	bh=iDH+nyelyD/JV4iokJkdB8QOLatA1sqp42eElkpny3c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JcGfwZNQCTiE4O869yUxJOUl8bDgvvMXCNTeweYgLBgFvSejI3Bpzgvyuc10Aj4buIB94ufMJSj5vnwBFmvpxbqWfgdUhCCmBelM7OhKlWROonhkkmO/F31bgnu9aLUU8EjzHzrgv6Vp4ALkqvWaFYB/s5qdGPiBMM/mYolNft8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lIWiud6a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UXQtdwkl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lIWiud6a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UXQtdwkl"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67K8Kfha1680225
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 09:46:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2/+At+cNTnKuyLOXyiUGjsSs
	wthAb+WEn20Wg2h6kK8=; b=lIWiud6aqv/XfoiJpM47kS9HPDXYJHSlkkrcFjrt
	w6xZEn+hfHGJhPb5hPSo5JX321qKYGBcOy86c/eUZ3RjxNjVMqwzjXNrjM+7ZHzl
	TlK9Q0Zc4lgcnFP1rY9c6J++R32dmFcOCwJ0loWjYj9drzTUZTNePBRXSJfsQECN
	5S26JBLarqSPufWG8AZRKWGSofRSur6HlBwxqNd66mSYpMHALK+rUJ1cKvvaqLPF
	N3ltnuRj5skDP8mr86xSDHlpTZkfLOU2yjr+M65+AQwP2Bn+TxlsJ9hPRsGmnGVu
	MyuBgU2Ya3PgNUOFQUf50wSci9io9M4N+h0n3bjSYPrQIw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5x05ra8c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 09:46:49 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-930b6bdcb4fso294563685a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 02:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787219209; x=1787824009; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2/+At+cNTnKuyLOXyiUGjsSswthAb+WEn20Wg2h6kK8=;
        b=UXQtdwklmu32Qf23GQYoNIvjMjL1eozca76SlTpVZSisa8fTgjYNIOAzg1oRFuH9lx
         qdgJj3GMoNleoOmKu1XWn+X8eDTY6w3Gmod/67ht+LO/UL7c5aOiEhpHeLu9E5qYW7nd
         bugPJOmwi28ImW6wnp0A/9VGLXTuoZwJFBSB/lktGhKXv5/4yYGEhcG4RKuRe+tXBErK
         WbzdZnosn+aTgJOy1kcJ+2YSE3l7FNiWosU7sJtK+2IaPIpfurOglHd1MMxUkn/tRwpi
         LkAQ/PcP1cHAp1WvVJkHAN+SUyA/S4TmbzhibYu529Arp5daUsAWZBuSMW0YyqsDwEb1
         LD5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787219209; x=1787824009;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2/+At+cNTnKuyLOXyiUGjsSswthAb+WEn20Wg2h6kK8=;
        b=CghaVmLLGnkOLEcTXtlENkJQL7eN/6o3omnyH9K0aAvLPjmVirjkr53I7AygLmGZ8o
         imeRm+7qxbu6DE4Lr8IKYcL6+VR4ue/0zz8u61h63qHgdm8Z/FDPzk/C/rHg/m4N4ZBq
         bLYWYsJOvV5szQqHsYV72cnKD8AkNz/LWinUlqiwt4R/ZCEr5oaX235iVAyMlaX9jAW5
         EtuTgyFsfpx5nuUcd9Ot3umrqu4Z0NBXTEQvtNgZ66sj8ybjkSW7WVMbf0lI7V8UsvA6
         1Swb6LFhN1QqXvD7j3HvKdUNdDzPuUxdIaued0G+VXQY6Klzoznf6C1zaG3/juNdpQI8
         NVQA==
X-Forwarded-Encrypted: i=1; AHgh+RofVemVKb/NRtFkF/bM5LHREnOPKxSm87++rhCndxqMF7IqUX7mthRhi+dXuGQ0AGQx8fablKDLv3dUOPHy@vger.kernel.org
X-Gm-Message-State: AOJu0YxRkgr3UlVNHnOrRQu1CkHuDQxr6r0l0YXutO1f2NCauajtyiXV
	KH1QdTEbSs6Rur1IXSKIJ9vyf+R4LuUMJX3LWVdDJJbVaP19aTBOLWevgGfCZPSQffussi5KSuY
	QBGzBM3pH2IrxrnnZDurrgB+aak0Bz5ZdwHi1PjutMlho7itl9F7uL21N2DGcuVIF2VxM
X-Gm-Gg: AR+sD12NTU5z33qKKbmrXLqH1vqbovxtF7Ak1YZEK1WvZY5nk/907N3OoohoGLGknS7
	FaC7WmG4uuKU2aS0HCp1pM1XhgyiMSSHsUf9SoA7Q8U0GC6SpNdDAhodB7gzrEOvtZhn9K1p3Cy
	o57aSnaNh9RMP5RqbqBrnhraEr0eCsaVoZdEyc/xLg92EnQtWtm2I574r/WQDqja4GkYmHLRLDi
	w9QUFrwOgiUM5fbkukjHE6ujKORaPKpYW6fiZJT1FtyRu25FX5v13NK4w9MaP8UAjmYakbJtO04
	zjhyMyEuljNsr2ioPJlHewoNvRz2Uia16D+p8Rd64jWScKVijMHc4+udFFBM4C+hhD+Q4y63o0B
	i2BBEHeoejJoTb38=
X-Received: by 2002:a05:620a:4152:b0:92e:f3ca:2eaf with SMTP id af79cd13be357-9371e23b365mr1023560485a.11.1787219209049;
        Thu, 20 Aug 2026 02:46:49 -0700 (PDT)
X-Received: by 2002:a05:620a:4152:b0:92e:f3ca:2eaf with SMTP id af79cd13be357-9371e23b365mr1023552785a.11.1787219207172;
        Thu, 20 Aug 2026 02:46:47 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa1111b2sm179934075e9.5.2026.08.20.02.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 02:46:46 -0700 (PDT)
Date: Thu, 20 Aug 2026 12:46:44 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: shikra: Enable dTPM on EVK boards
Message-ID: <cpfh6scrn725pdpfn6xuvdmhv3pds34olardakbwstuos2rsbc@er3alzckvpn6>
References: <20260820-shikra_dtpm-v2-1-bc6698564ed5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260820-shikra_dtpm-v2-1-bc6698564ed5@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: KSd0uUixpPKY1RGJegKs1zum7QjXMzlF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA3MiBTYWx0ZWRfX1+JIYLVRuXAz
 la7n0Ofy6tkpDLvtErrrEZQU8Zdpi0o+Oe1Ir2mEfMHFro9vnzVmQi9FeWuTWZg1VDW/UwnBz7+
 iNmyHthK5qIXtNCJh9w6KHIsoFeQeH1nk8jRpUsF4l+X/lJvZXFXT6Q2Ad0aXpdmUWfzaYVOa6K
 QAeaE2Sa1TG7bqzwpZ3HeuknGRbOebwUkSG9WT2Wyf8TyEZV2EhcJ59r7I/w9b3I0Ol5u1d1bJ7
 ql/Q7TxCfn4QjrhFNbyf8TZOZdyVJZV9gYFHdJuinnqegHK7A0IoB52T3EpH2f2XSERhY+D4xsd
 UZEKuyPi8Ty+f46+fw4IyQ0Va8zRPH4V0aNUeJH/uwXuOvhwS5YBdORYCzZbfJi2FNUBTbJkUb2
 rOp5nGPojxVjLwKhD5Vrl5q2HkuVR1wfcaJuTQAn0qzPD1ibItLMgKdgoEqn1HlA1aY3j3/p7k2
 SQN7E+qg10Vf92L/dKQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA3MiBTYWx0ZWRfX9w2cBSLPE4kU
 GW9H4hYLWNt0ph0IaCZP7FVvd6GMPZVEUPt/gXwxgZRx6kQIhR9f7rpjXzqyemCbJlE7RayDziD
 d76wZ6ztkj1g4+z2NIyGkeWdbWoifNA=
X-Authority-Analysis: v=2.4 cv=VfPH+lp9 c=1 sm=1 tr=0 ts=6a86cd09 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=VPIKziwejObZ-StCHZ4A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: KSd0uUixpPKY1RGJegKs1zum7QjXMzlF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200072

On 26-08-20 15:08:00, Khalid Faisal Ansari wrote:
> The Shikra EVK boards (CQM, CQS, IQS) carry an ST33 discrete TPM
> connected via SPI5. Enable the SPI controller and add the TPM node
> with the ST33HTPM compatible and a 20 MHz max clock.
> 
> This change requires SPI5 to be enabled in shikra-evk.dtsi [1].
> 
> [1] https://lore.kernel.org/all/20260820085347.822-1-xueyao.an@oss.qualcomm.com/
> 
> Signed-off-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>

Also, you missed some R-b tags.
