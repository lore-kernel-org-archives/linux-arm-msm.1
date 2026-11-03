Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793699577;
	b=m2nyeywG93dMZjN9TxVJkGkOZDLT80RSJ8I4O/xaQDPK6UkhSfum3PtD859LFMfCROOd
	 zaTYzo9Py4bk9llhZOd1kyUvEdnHNZvpY7lWIw1k8aOu0mL/SvQPAyBoxmOUjKq6PD/P9
	 4LItnWKqZzotY5nirNj2DekG/IhID1dc3DlvnFw3J41bayW8mhPwX8NWysWNm49HVd42G
	 7CJmg9vdWwdEwOGcoha1PBPxg+D0G588vV/jNEeDDqxEvNOpmOVFKsMEGwVRVy0glYMYj
	 pDWq58tKhCVeyqgCVZMkNZihSMFqD9FTtonXyJrk7GI3YiarA0OH6XyLqVNDBkCvlFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793699577;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=V2vKLAbaSmHgptJneH1h5y6dZZy9cK7QL+l/UJYqCHM=;
	b=VMRWPpDRlHmaXKrwLG212x5cOwK/M92VvHq9CqlQETQZo6TQ9F3B8uIxVLSX1KTDy3Ce
	 uvcJbDbRjpMPrAB+XRTumbKYYiHWNjyGJv2BW63EtZwVqdjFBry7uc/mlmb70KinZwrMk
	 B3QNIJ5brmvK39wgGGh0Kt2iQ4pIEpTeGchTU3WexlhN4O5LmBx2mMAbJFBaRX9UJTq4v
	 FjUS+GoiPLKbuQ8ExBlDc9wsLjXxIaxZbn1RCk+aEAfxNT6zBbr3tmExfhE/4ZiJTe1WY
	 1Vl2jrfybC79T5kVfp3P47BDwhc9frXZvImk3gRpu3pF8cjHxKYEzhryHD/5wDG9QCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SQiqC8J0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kgfpZNjn;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A11606A334
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 09:52:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8A11606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SQiqC8J0;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kgfpZNjn
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A352kFu2449012
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Nov 2026 09:52:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V2vKLAbaSmHgptJneH1h5y6dZZy9cK7QL+l/UJYqCHM=; b=SQiqC8J02pCozqhU
	iqF0eV572zDi8yFJatFb89kEKJrM8W3qbmf8Gj5FceM+xmt9lZr+71yZe/Dy0Gi2
	WfoF/BGPW1LEgoUKK/b8WzkhNIL9eIgB9Xho65imx6vqTHX8BIqfjpgGsWBGJQCT
	zdSEmLukpei9MUT1XEo4ox3zhNOa1vxjv1R3NrYdplRjncDU/orqVSE128hQPpHq
	QLhL+K3VHdjSrgcEMst04EQujdPlxauTRHXUN88qAsN5uPMnns7UfBLU7gtuosGU
	dxdZ2CH4Zx1AAVFkagXDmOWitCi5MGt94irBh0+dEmaUJBVtGCZz26mmLRAxJ69w
	nszajA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq94cs3r6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 09:52:55 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7cc175cb172so3421240137.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 01:52:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793699575; x=1794304375; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=V2vKLAbaSmHgptJneH1h5y6dZZy9cK7QL+l/UJYqCHM=;
        b=kgfpZNjnzwEG43J1phEbY+v/tfQD8Ps+LfgRRPAHGKoAI9yCXg6DFy3FaQYDPHqXvZ
         0B6GW0sLlrspS8FeezFz2yxfucIUAs0UvdwMPFVAVo1YznPYPQ7H2ty1kR60tg594Vfk
         bYrfjd2p1/wHFYfDtgVxcMcRM/k9Mv7pO6bq1ozqY9kPXtW45hZzLk1upl1on4/Xumd7
         fUu1x3ydJrC76X5uAgjjtr9qxvdG4nKMV8g00ynyskpeU0Gt5iJuqR1xQla+cScbKhfk
         M2pjRXYJP69VhTnDnYr6AwJH0rXLHSzunGC2z1OM6lkQMpl1FG9MKIDCyL1lR0tS69zY
         dAqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793699575; x=1794304375;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=V2vKLAbaSmHgptJneH1h5y6dZZy9cK7QL+l/UJYqCHM=;
        b=f/xzhq6ZDnIPPdNSFtQmElP0Yqbg7cwoZPym/URyb1HCSjQPT/efOFcgbHCoafemFz
         UPi4nAnAzTqvnf8FwfZ9TIIeKQRG2B8rIzke0YGYidEvGtAZJIdsPJmFEtVLguVp8gQz
         j3tfRE86Pb9jO3qRXnB2fpCdP0G8LLdEv3skkd44nsoZDXnu2ZpCH1igTbkoRoAUDmpC
         Zu1UE8k0clahvKcTeclpLBr0xc3Ei8z9XCRx3t+kcC2DJHJiz3wzA6XTphT2Vw7cbyAf
         fqdBLOKvc+wNegwf9wWveF2hTdP0JnPPry+LwuDot8hlU1sej7UF7m4eIMBGRXjlBriw
         27CA==
X-Forwarded-Encrypted: i=1; AKwUvBywnp0LwWFnRlRk0DJ/cNhlZx1zD7M1xB2NzdXJ0LDJA+GNw6PegvrV6roHWL7Xsv6xY5ssNRoHXUgOtDt+@vger.kernel.org
X-Gm-Message-State: APuU4Z89AmjJxNiQ/FaOpVsuG3P0GcUVbOkgHDF/CK5D9kd8HFzusAvH
	obUpPwARNJsdl7zkH5S7ZBot3EO/fKjhVsPQ514iNIiu32rEyb/3E3G+G9Qmie6vTw/swUJG78N
	3LRjUMAoTgttlCAXH687+LyjbN3bVnVD0+HaFeUCa9LVfjp9QSWEwo4zd+Y5GFovzEo3B
X-Gm-Gg: AYBFou3fAi7VttgrQLzSAluaBlvw7vWG4Fbkr60eccqH+pNcNYAHC5A2W5bOk2mb1zE
	1ACu7HSxJCoGI/hvM0skAhsf4Xd8DS6i2ZAJz/LEwygU2+Bvwsvv3EaCt4n2yXdF0aaGM2deKFp
	p0I5qSUAqWT6xSyG0XKHBOUrPH/3+A7rRAjcwpyW+6t4FL2AjiuOw8PTQbPeCclOceYcubCfKLk
	M9EEYvfQzH7ZFKOAXhIZSx0bGUp+v5xkd1kDrDXrDtJLWjQdcjUUSRpUR0f4H+azf0ApBep0JFa
	WnN7RF1U/fi98pgE2/ekPBGzeBWEiaphB5UUJM+aLNyhLgA0hh4kz3U1sR9X5kOf+PA6hh9dAdf
	GpQ2aCAibhMvD8rdD2ThOW6FdsVzqLoGfBqhi9xqvyvtVrTEqZJnVz8zjo2cDv2k=
X-Received: by 2002:a05:6102:5093:b0:7cc:16e2:c1a8 with SMTP id ada2fe7eead31-7d07261536amr5055174137.8.1793699574816;
        Tue, 03 Nov 2026 01:52:54 -0800 (PST)
X-Received: by 2002:a05:6102:5093:b0:7cc:16e2:c1a8 with SMTP id ada2fe7eead31-7d07261536amr5055154137.8.1793699574067;
        Tue, 03 Nov 2026 01:52:54 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71bae0f4sm21429736f8f.58.2026.11.03.01.52.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 01:52:53 -0800 (PST)
Date: Tue, 3 Nov 2026 11:52:52 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Lukas =?utf-8?Q?M=C3=A4rdian?= <lukas.maerdian@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        srinivas.kandagatla@oss.qualcomm.com, akhilpo@oss.qualcomm.com,
        jie.zhang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: mahua-t14s: Enable GPU and GMU
Message-ID: <73wofgp2y2f5gwpdqg7rlqolidb6kwxbjay66qo3dbabjw3w2s@doxzoh6vj67n>
References: <20261102142812.1353199-1-lukas.maerdian@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261102142812.1353199-1-lukas.maerdian@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=O+KsLx9W c=1 sm=1 tr=0 ts=6ae9aef7 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=8nJEP1OIZ-IA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Bn5j7JmbtJmb3Q6V_lIA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: 3Q5oa1-qqkwF_7Noc8ygt-X3I99Dnw_i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAzOSBTYWx0ZWRfXydK3EEjz1ulQ
 Jp6seJv/JAZbv2qMW2OIE2GXdkO9NJWaeM9AVvGQBtz++dDYUd/IkWlAqAVeJSB8d+qNPBbkotd
 vUzgZR9duHhVEO4KSHBS5YFzSQ6AULBDTRF/C1W0EtTbUP0NHYcYorthQzS0rSwmhv4Oo4l+hda
 y06YAE+i28jXV2GvpGWZGZJKGz5PtLjGyu5b8JvlCu1F13LruIrdfQ8UAmJyye+Ufk99e2e66/v
 RBONQEG4xC1F+XQdD2LMPFw7j+0YRpfFumv2HsuiQ+14rMRzz74gE0VfKb7rPoxpJNo9nOG7hQm
 9bpkF35d9+ucp+maVRVTRSGQLYl8eoWTel2vEKKEzksybStCqvPQVkdmBeh6wM5MA9HZmi2NO0Y
 2e27SAYqNnETw4fEnJoKWiDK1p8gFpp+0gUXhTx+xOaYlJigMINxJkriYB7I7sx4WU1QJxN6HaT
 6EUXh+A0Wfp+qE4Wrsw==
X-Proofpoint-GUID: 3Q5oa1-qqkwF_7Noc8ygt-X3I99Dnw_i
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAzOSBTYWx0ZWRfX8OD0CTlFfW15
 powkj7jexiTAfqbSZt11DZ4zwbB1zCheVVM0A2pl4InEG5NTGzwUNpqCHweV9H8ODcBtkFLaaSn
 aqnNalqJncwXskOBIqSihW55cjVA5Zc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030039

On 26-11-02 15:28:12, Lukas Märdian wrote:
> The GPU and GMU were disabled when the ThinkPad T14s Gen 7 device tree
> was introduced, as the Adreno X2-85 found in the Mahua SoC was not
> supported yet. Until then, mahua.dtsi inherited the GPU and GMU nodes
> from glymur.dtsi unchanged, describing them as Glymur's larger Adreno
> X2-90, which is not what the Mahua hardware is.
> 
> Mahua's own GPU is now described: mahua.dtsi overrides the compatibles
> with "qcom,adreno-44060000" and "qcom,adreno-gmu-x285.0", and the msm
> driver carries a matching Adreno X2-85 entry. With that, the nodes
> work as-is on this laptop, so drop the board-level overrides and let
> them inherit the default enabled status.
> 
> Tested on a ThinkPad T14s Gen 7 (LCD): the GPU and GMU bind, the
> gen80100 SQE/AQE/GMU firmware loads (GMU firmware v5.2.38), and Mesa
> 26.3.0-rc2 reports "Adreno (TM) X2-85" for both OpenGL 4.6 (freedreno)
> and Vulkan (turnip).
> 
> Assisted-by: LLM
> Signed-off-by: Lukas Märdian <lukas.maerdian@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
