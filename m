Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793009432;
	b=MjAKEZ59LIillYqyXB070FY665/kFtWPil7J4g+cmq1iM7dlctLxOps4aUYHf/x8f/u7
	 zQt89eJ0l3/NKzafnHhLN0fSWY+CSj8Aat66U3HUjw1Wt9aF211KeDr+W1hJMoGkTv4gB
	 A4s6AV7sUWt1a+cdkd3l/wHl7UnOuK5QD2LBPbM+kOYSjJ2zwNKJ3zZ6UjRh0tLT5zbkH
	 n7K+CYMO5bsT2VrlT4ZkPYIa04CS0BDdsPqTWNLYBiBV9RfJaEpN5ljQWdMkjVrmqq/rs
	 qPDta2g5oRVMJMzZS514Nbzzb5Dwq2+Hu3ZWrhodUNfKPN3yFY+jEJh7EijHS8wTwAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793009432;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jIgN5Cj/MtRAZOtU25eK8w/M3L4YpmVZszmhqmwxHZ4=;
	b=sIPt67QfsGROJqk7Kvf8HldVFwQGzOmt65PaisMLnGslKP3BlCyOo+laHsg/DxN/FI4I
	 2smYFB3z9WIO+MNtZLPBoP28HQjSzdNdPZPcAV6eG8DgPu7RQ9GOvHgLalFE+qWbZpMvY
	 jfFTZuUqt9mHoGr16KobkW0ybeYZCMvSf2Ec4MaNkSUGp5OPw0nXgIc2pvcg1LQAe0zPj
	 L6m5oQ0+yN9U7O1s1wg7tnYIUmVz1w+eQfA4d99JP0dn/2C9DeYuvLFGe2sQjsKMjdJG3
	 tXaUNvi2jADsQcL3fou9jZg9hjK/nCpCE15QEicDeIsOiJPnL5GjLPlIjboQUsPhCEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VCb+6FDP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V9T21mrq;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F0FA606A332
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 10:10:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F0FA606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VCb+6FDP;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V9T21mrq
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4aSPi1708639
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 10:10:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jIgN5Cj/MtRAZOtU25eK8w/M3L4YpmVZszmhqmwxHZ4=; b=VCb+6FDP3Y+nEgD5
	4/8+M2fv8ldjC/JW3P4ulme6+kJYEeKz3duC4BlEWuxilut/8XTzOTeEZRdrP/is
	eHupL6qruSxsrTX8ar00GHR3AAifgbw0YMdeoipKq1X8j2iVGMrw4pllRdkxbNbq
	p1urT2Eo0JkfB8wel2+L53r07+ZXLzOTPFYWgVDeZS8KNT31tkr2n54zttxlSqJX
	532KGSxfWWfkmWMOaPnAWxGhfnRbAUuiNdZbH9q9c8192NIpJeYqhhmfSm8rKM2w
	pLjXddHqUYxqzupxMJPzBB67ErUrDl+44zWJo8iyl5dmXfHv3sZFSbOgbAhHTKWW
	MRn7UQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhsjd9x6q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 10:10:30 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93e629c7b16so36249385a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 03:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793009429; x=1793614229; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jIgN5Cj/MtRAZOtU25eK8w/M3L4YpmVZszmhqmwxHZ4=;
        b=V9T21mrqu1SJ2bk3Xh1dLOmrtjTcmylHiHgogdyt4EdinZMperMW4yf/bZhoI4Ctug
         iPprrAbmbyCLs1ZeUDbqPf26WW04sRdNRiaA7cwoc7ChOZcrHk9eXdU1ZhXSbzEU4+Jd
         kK9B1DdeZ6iXWuee5rYoqV1AsJGnTKuDPTHLQhaSsvZr7BUsQgxkV5A47LRfrsdp8iEd
         syITfPX2lPjMvlYYYWIr2WcdL46rY6N2VEYMpLgUHCvxP2m8ykP5VuGzGIfUdUTFPvSe
         09r+2bjPgZt+8/oMkt/X2asEx/U6Q/NM4Iyag8suDYtccTinmePNBXTamq78hZfhRNGW
         9Qig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793009429; x=1793614229;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jIgN5Cj/MtRAZOtU25eK8w/M3L4YpmVZszmhqmwxHZ4=;
        b=kvKrRNREGANC4EZGmXU8gNeDNU9OFM+kvWnxgflmnN69aL9C8GDTYCyBWZqIH7yXK4
         U/MlSouOT4QBgyWfku1bZ7BTrD1zKQaAZfAEZ+G1G3qcrMdAv4h0+aUThx54GMMAAxQo
         8B5BZsr6iGREGulioMkuk2BPQd0UW4w/tGyswDINuv0jFawB0AAxCB8YU1d0T8IYo5hF
         /vtVh11gWIM/z9U1m+o34f41dIN0FZsWvAPYtNg1Ge+o+ucfi7BZ9v53a2MfQ1rx8el1
         gQ9SpB1xaAxUuGt/VC6LqnmNlmV76fxKju8wZKhK9WyqyUa0O2S2dwYFLqs5VebgDkqi
         WAWQ==
X-Gm-Message-State: AFq9FYJHQhWI9Jtg4T92agAkXvw7sNRrh8zJqkiQ/bWlQhE67ud0YdzY
	w+TaAAqQ+UiDkgCkszIuw/nqK+9IOGrEr8Pbv2p02OPkwZ0NVlzBpQd6dACpC8DoVo4/RQV62au
	PhoA55rikyBj4rd3jidyONy+qPFPrmTZ+S8ZxsdefYh1xtXrvVHbQgLDIJeKE/VBr3Cs6
X-Gm-Gg: AYBFou093WiJK1fb998XQfraQXuoOmK//EJa+7UpJp/e/OIAtrB33nXcedLnGiB6IKw
	d8wnTJBHDYyM348jvRC6nfp2kCEbUR0qXHj4Nl/n/XkEyueVzv17rPXl/4sMHJpv3gOZyXAxHIk
	a7CYm8jN41tB/m4+RbgvTc/pyNLUuDa+IUGZVBFF5rLkMObIB9p/06Ed3a6Jfw7sOYfQMM1qgvW
	Pe5hZRxPrS0x8CKbCKfWmbgYMiQb1ktumvEDbem8dcq+vxOY8IdvGzPSQEFt+KuJFc8OVmxJW5u
	Yi6Vfjsx6b6b1/79a7YBopdkn14/B+FWK1MM/fgxBqckZSdV0hR2khbEMrPqAfiOTem6wtGh1b1
	mwwzgjdXAJzXlLvCGmxrTdQ==
X-Received: by 2002:a05:620a:7302:20b0:93f:211f:7ba4 with SMTP id af79cd13be357-940ef945ddcmr914305085a.5.1793009429529;
        Mon, 26 Oct 2026 03:10:29 -0700 (PDT)
X-Received: by 2002:a05:620a:7302:20b0:93f:211f:7ba4 with SMTP id af79cd13be357-940ef945ddcmr914300485a.5.1793009428855;
        Mon, 26 Oct 2026 03:10:28 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd66fa59sm293589166b.61.2026.10.26.03.10.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 03:10:28 -0700 (PDT)
Message-ID: <a0ef39c9-d6a7-4e4d-a87e-e2fe72afcb73@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 11:10:26 +0100
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
Subject: Re: [PATCH] arm64: dts: qcom: monaco: reserve firmware carve-outs
To: Tyler Baker <tyler.baker@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261024-monaco-fw-carveouts-v1-1-1cd68aedf46d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261024-monaco-fw-carveouts-v1-1-1cd68aedf46d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: rFhMyFHAS2re7e-_aCBPGmIUoRLBjL2i
X-Proofpoint-GUID: rFhMyFHAS2re7e-_aCBPGmIUoRLBjL2i
X-Authority-Analysis: v=2.4 cv=a4elZkSF c=1 sm=1 tr=0 ts=6adf2716 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=MOOwgwI-Wrxjjh533TEA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0MCBTYWx0ZWRfX4F1YkNBRVUAP
 BDigLOtEiMR1FRU8Cp5p3qEVVhWBKOfOF0cg3tF4oUweqX4yyEBMnmyP1I8TTtgiI0cbBCeMrTZ
 LHoz2Nr5EnSau9WKj/OUERPZdkHogKg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0MCBTYWx0ZWRfX+NndaJsC5/EK
 VmACKnif8sRwBBXzTze0glQlCveOi8fxsbVs+NqzTYxo9ivzyeO8bs004dLb/MXWMy7FcxV/d4s
 DhTf3t3S3xQz9HUsHoxrvMXdyjf/jAXq2lFdQrUbCsguJ30OCV0rYCylfnykoPfecdCQ8KwTsx8
 OQyP94aMuRz/jAil6YvNu8Qt1BgV/U7mkm4R9v6RPl23iQ74ZlufciDpknGkZxfh0V2hgROfFiO
 KMLUIqB+OVJp7dlXWdWamfPBRLba/xXHkDttrkOV6D5BPPYPgu/8LOMytJVAyLCoMgjZr6qFAwl
 UcgadE1AX5bBoN41lcOQgWLgAMho1vdtZm/rXsCzzNRlFIeKz8G3mkzibtlp4luxYh84AmQVQOS
 P7vTwsdpgyZQoxtgNtAQ6xBlp8RjVG2vY1mFw0Nuld5NY5BZFunmZe8kpsi8m/OFBPX481rowyF
 KHQr30+Unkg9v1ByIBg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260040

On 10/25/26 2:09 AM, Tyler Baker wrote:
> monaco.dtsi does not reserve the DDR carve-outs used by firmware at
> runtime.
> 
> The downstream UEFI hides these from the OS. U-Boot as the EFI firmware
> [0] builds its memory map from the SMEM DDR banks, which do not list
> them, so it hands them to Linux as RAM, and the first write to one of
> those pages takes an SError.
> 
> Reserve them as no-map, at the base and size the QCS8300 boot binaries
> use, as lemans.dtsi does.
> 
> Link: https://lore.kernel.org/r/20260928-monaco-ventuno-q-v2-0-0e046c8242be@oss.qualcomm.com [0]
> Signed-off-by: Tyler Baker <tyler.baker@oss.qualcomm.com>
> ---
> Tested on the Arduino VENTUNO Q with U-Boot as the EFI firmware and
> with the downstream UEFI, which already withholds these regions.
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
