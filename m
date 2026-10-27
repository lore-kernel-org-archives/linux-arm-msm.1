Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793116724;
	b=djLD+O5L3YBSSEpp2sLMT3BGbNzkFazHbu9Q9s5aCWi4zo5QQAfzUaR36LTjN43jx2Bl
	 FIVc6bY9Kzcc7iMeoJKeMJeB2z+ykIlnf44KeNo/clWiYjvlCQ42jehvjLwnlCNo90SW4
	 ahavwynqwskcbyWrsyTPXTDc1tcfW8aPNATF6xTMppfHK72o4x0sJIzBh3guykO9iyF91
	 UgPdtICQGgRTJqcjsPuKHiRQDt/I7ysJ6eTU6ICZjqpT545zZk3f7pCs3gJHI2OMc9gsJ
	 hw6kA7YNb3J/RByJZgZIrxJsBUtl10RLhwPKOxzEot9AeQGDgxrBimurcoMIJGbzZOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793116724;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/yIWyQunKXfcHJU/jPfgnmZ55cnAcfEQ8VE3Neqv5Hg=;
	b=EwDxBMxW0Y6THqU/WtfYeMDxHy6O8egUNABaGDHXSMz/G2EdhOEhwxDQVIldsn4j1Rkk
	 /fgsFLa6GsKGZk9Vrk7YA4+pvULKt3eJ/bG3yg6uDLjhihSS+QXuxJLV9WpcL6EIFlH1M
	 VTvLGmqPFjXmk4DeWMLWnqQvNW1QVPiu3sNtynqG9GA8NRPL4ekH2SJg62lAxem9dfHKW
	 zc6hJATNUpaBbmyCf85tNzLQLGNDLm7FbEXiBAqR1ozXnUI11fWLvLSctena5g8LFvoFO
	 DNnsFEsPMLdoW+GNZs/O68Zr+CbZnMEpX3uZmJ6dcYnbRv/qONKKhXIVIBA1gYZoBrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a3XNotsa;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TyvrfdzR;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 574F0606A31D
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 15:58:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 574F0606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a3XNotsa;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TyvrfdzR
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RFKwNV3085775
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 15:58:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/yIWyQunKXfcHJU/jPfgnmZ55cnAcfEQ8VE3Neqv5Hg=; b=a3XNotsaUyDQL1uw
	78FVAxhd5m0hakz1Wei7MQIOYmtuzS4v6+sM7J8u9rVcruRD4ll1kS6BxVr9GV4N
	TBrLq/o6c+c7O33ZzjbNncQUxWLVHNRYEKRdnu8lGweLfRgxyBYwaD57lhQBAZj2
	9EDgkPk0TLEe5x64l3c/pUfJZ5weO3hsEUNW+uao3Yke9TuNj8ghSQQrSjbKxA5U
	KTRlOyPSJTOXiZ+L6SHH27V7i1Ngbm1T99UmAwmIs8VGQL9AB5Fza77GP8NoXzHJ
	bYNTog9hETuTSK3U9kw4h/wVVHV8zIs5PJeQk+VIXDAV8LxnEWxXBqLtr20UTsEc
	mYKZPw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjjbtb5u1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 15:58:43 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7cc2d6292b5so57687137.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 08:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793116722; x=1793721522; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/yIWyQunKXfcHJU/jPfgnmZ55cnAcfEQ8VE3Neqv5Hg=;
        b=TyvrfdzRHIIqABPBKS89YRA/xy7guAhrqw7dUsNzy652SJxbhuJODTrRi8T/fNUF+z
         7iTK2STO3tfSrlHQYGc91Mc13N0VN9nYuoFkeXlYtwAcheXF7o6I+u6IlL8v/RTAXVUj
         j4liO2MJjV7TLk/Kq+OChIoaMf/uR6mqFxgHYQYs9HGXhVZZDHFf99Yhsi8uM/HEJ2+D
         ukDuCtcW4VXOeqaIDHcb3OqP52m4+ZiM9A2BAZwXwm37QE5FPkd6JNi5EUjadbYYTLKy
         +8H9u5jFszT//55VRwZEwk/266KIaW4uRARBRjFX9ivirNaF0ch0RpRBZX1B21lhaJdl
         fY8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793116722; x=1793721522;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/yIWyQunKXfcHJU/jPfgnmZ55cnAcfEQ8VE3Neqv5Hg=;
        b=kCbYSM4htAFjGATH9lRIC2XuAVKij45qFO5hwWxXwvm2AVkPxxkQOjlGCtJ/Q3vEIE
         WqdhDOCkqSXT8pabOCiILbs2rdL5j+OwlDfThqo6ziEzjk5bCW1uFDioX9yVVmYDsxeo
         5g4+P72FzxvGgZYdjMAr93FDqjAF1Zi8jwSyQ9mTSUuAmWxT60FbT+MEHsu5iNP5E2J7
         wYOsSB4WXmHAEgne6o6z5fLhMT5CZpdYoWq1zxoiC2EwQzY0ZZBVawyKWxUnC8z0Inji
         7GjoxsXTUHnej8ZI3wcbLgIF5kam3pyx0v9d2K4xvpY7/gtPIcNTPpgqa0VX8OnTXEVJ
         BcSQ==
X-Gm-Message-State: AFq9FYJN4Qjayd2+gUdE8PhM0Qf8YFCD8d5MJOpaoEwCAoTl/4p9m+yi
	RcljjMILa55Y5U/Ja+tyG9I1ctU/ksJdHh7QkWX+swTZzEAAUbvtcvtokQTPA2uMt9hSrkMbgLn
	vbgZyVfwfqarU4wQE+QKK1TpCfoCgId2lV7CDCgSGfrIequTA4KhqK0mqkEbEIBgBP2w8
X-Gm-Gg: AYBFou227I1Ir4qddvTWwYiGO3jJZs5e9FBI/BxR8TeWDMdJasaHpbZzYjrovGrNH1x
	gCmW7zLSvHmQcH/Sgn91Lz2YjotRJtUXgq99u0auNPcWrp3Rv5JPxfBmQZXCxzD/iRuQrFUDG1+
	RgizaQniu+Q/gUuZf89Pp1glFjSo1rniO+DBO6ksFAcordgh9FvOTKNOeDANZ610JF8V6CDfRx6
	o0FpkAnnFEen/Mo5o0NeZ95KezxrUmIVDyDEVgHEBCaSTZTSPibFlY7WWw8eN/VyGbN+bn0HGlo
	muzoOB2yGz8nhWfnfPKnLjhHrBa6wYe4kmIbpUhU3KfI2PDzlbfJ27042ynS0FpCOMV9K8tydH5
	9hEYjBg/KDIAN5dTKdmaVbA==
X-Received: by 2002:a05:6102:8699:20b0:7c8:3b8c:82ae with SMTP id ada2fe7eead31-7ce5cc59d5emr3593361137.2.1793116722549;
        Tue, 27 Oct 2026 08:58:42 -0700 (PDT)
X-Received: by 2002:a05:6102:8699:20b0:7c8:3b8c:82ae with SMTP id ada2fe7eead31-7ce5cc59d5emr3593344137.2.1793116722060;
        Tue, 27 Oct 2026 08:58:42 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b49640f1b9sm227658a12.19.2026.10.27.08.58.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 08:58:41 -0700 (PDT)
Message-ID: <9a299c47-a92b-4086-8218-3f6a06a25460@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 16:58:38 +0100
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
Subject: Re: [PATCH v2 1/3] firmware: qcom: pas: Add optional video memory
 protection op
To: Sumit Garg <sumit.garg@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Jorge Ramirez-Ortiz <jorge.ramirez.ortiz@gmail.com>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20261027-pas-video-v2-0-5b52bca5add6@oss.qualcomm.com>
 <20261027-pas-video-v2-1-5b52bca5add6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261027-pas-video-v2-1-5b52bca5add6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA2MyBTYWx0ZWRfX95WW23ay2/2S
 6iO14wS3LNZVsDk6I6a4xYTRRr0KnIcUa2hlcUPReq6J/+s8Z40ILQVbtl/SPkT8jdfwd4k0lxh
 8RWqEMMMRDeoXXBagV0sw8idgQP52tk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA2MyBTYWx0ZWRfX7CLrGbWHxTZy
 mBP0NATLMdrDY/plIwgh5VbRDQOZ2kZjLKoj6h6S//2LfUdp2H+PaoujC330btapDlW/zQHF2ha
 50Pbmj9jrtrtHPNA4eBCqBeQ0yRVGuoG53oTKFXkwq4ho2Ag9cFhAn+6gyI8ywcvCquOaV4M6La
 qq1nhXvcTDDkX1hAGIKa5oTa1XJ/Qge3IqAVPFvYJMZDuEMhqBEtCCPiPpLBx1ml6DkRk/G2Btd
 x1SoiwLKCRgX9IgmX49oPNj1PKl8bTI/Kp75nwl2oHUT/IarGPZD2KCXve3j6QGWRjh+cFlliFT
 iqH3xftXtaRHXp6S9C0862lVSw+0jpNj76AICF+Mq9KspYwpjCBimqPZ5dZZdeYxM+E6OT0iiFF
 ems2I2zRs6F0nSj7azf4/3YRm2MvSDZp5bG/K7PHIIQjkJHNpnDxugd3VSaUTUrXkseqcErJU2q
 XZVZCEAhPZ1zEAJ5Rlg==
X-Proofpoint-ORIG-GUID: m7UtsOW6cvhbHxX-JLnLhTiepCuPEcUO
X-Proofpoint-GUID: m7UtsOW6cvhbHxX-JLnLhTiepCuPEcUO
X-Authority-Analysis: v=2.4 cv=XaIcX455 c=1 sm=1 tr=0 ts=6ae0ca33 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=FUnjqt_kGT4GknzHWowA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270063

On 10/27/26 1:39 PM, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> qcom_scm_mem_protect_video_var() is only serviced by the SCM backend.
> Other PAS backends, e.g. OP-TEE, own secure memory protection and don't
> implement such a call.
> 
> Add an optional mem_protect_video_var() PAS op along with a generic
> qcom_pas_mem_protect_video_var() wrapper so that clients stay agnostic
> of the active backend. The SCM backend maps it to the existing SCM call
> while backends leaving it unset turn it into a no-op.
> 
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---

I agree it's imperfect but it fits better

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
