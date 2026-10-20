Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792485651;
	b=i0Aa+mwuNs/laMMbnm0SN/fV6cZaE9eBCrl2qond116mYFqaFJYFYU2HCO5YCNkx+nzF
	 mxPVZl6Db6cl1fKvX7RX5Oj3HUYxCSVva4Af+x539gUZPR/zdaLocLegXfQRaugN/CANV
	 bZiyY8v/PunT1blX//YRdmcwLccuj041m3iXUlW3VOoYKyYgE/M1ht8diqktlnGJvHqty
	 fam4GDWk8+2dPjSTchSdtwuk1a5/D+3BWOBkgwM1Vhll4Js6xpyc1UqckRcpafF3OGgdX
	 w+Q7YrvOAcjsbmrfv/rXWZFTw9YcKFlMFFbMNSNMYQpsJ1GN59k1UIvvVgnQO0TyU6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792485651;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Bw2x2c35bCRKRxjofKbbTiTKrpNCpqCYi8VNtCJlIZo=;
	b=ZRwGAFCzSc0MSlD0aV6k3XJWCV/RGKhrR0rY5KYwId6zfaEWCw+RjVbVpztUT64AE2Oy
	 4mFyfADKf97bNCJBGmopnGNKXDYXSVMAnJZ6WOJuv+PWW8//TUIYM5bfGfbt+s69LcwNf
	 PGmT8m9SKsIDHXUJoUD2H7DiqmqTFYfjsxdQZYbXFjEABN6I1t1kHR5kEWnkL7qX099bR
	 ndr694bJ1Zmql2v1djojhRwSLDdJkzjipo9lboNqTozOTfplqA/zD5+JDJscBFCqSBoHx
	 NtuE1r5+JilxbJZgSZFet3/4NDnOrxWGBS3aSUnN885mjMwV2twloE1BmrQ66JqWmoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="H9w/UWrS";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O7Knniqg;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74AD6606A31C
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 08:40:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74AD6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=H9w/UWrS;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O7Knniqg
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K8E5jr1211293
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 08:40:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bw2x2c35bCRKRxjofKbbTiTKrpNCpqCYi8VNtCJlIZo=; b=H9w/UWrSJeJbIX2V
	nQvVTHUIk9+AcMkuDcfmY2K5LPB0d0/vQLZHvKJB1GgwS6ZgpF/pon2XuNLsY9O2
	1AqS0+1qP/h4mkLa0SpqgJZAr84KJmvCvmsi16dp1PD3SSnDLUEiGdDAK6FIDEGW
	RPI7o0ubiYL+rz+89OTOpRAqZyyPKwTZIhotnABdnUUaJ7ewhFxvNDo9/ojIMfU0
	G0KtJwMh0bFnuUs+5iMD2adcHim7C1qc8efMuZofUQirKu9vo4Vy7z7E/g43QsWn
	AfN0KDuPaAsmc5toNeN2hU/MviWMN2N+VeRvi6O86ZbM5wNUHYHfHT6cdUww0sNU
	e/TXJg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5p1nwn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 08:40:50 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93ea8a9cfe6so107167785a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 01:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792485650; x=1793090450; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bw2x2c35bCRKRxjofKbbTiTKrpNCpqCYi8VNtCJlIZo=;
        b=O7Knniqgo56R7scxkIF+MG+oHs9XMb7exdylrDF2sEJsub29TLyjGqVcvXtX8oF8m/
         uYTaPoxg3zZj4O4bINfv51LwSeRh3MAbc4eFIf3vMz0nU5tabRuFXoIWJ1IbslFK5Q6w
         AUyCeiETrGly7eYTbcfGje1horoJdzLYHo1v7FAvGqRZcn4d0vfBqkETYzM210dnpj8U
         ttJxGmqW+QqvO4x0WU25MJGK0CAnPJCW0zvgvuZGWor8jbm/2UMxguI4wsXzzkuCnj/P
         ELkQ2IR7Zt1u+lioLorPoJrj+klDFt872DKScSnxcxF3+Xu6jtbx8K5tTtFFZbnSmWiJ
         g12A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792485650; x=1793090450;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bw2x2c35bCRKRxjofKbbTiTKrpNCpqCYi8VNtCJlIZo=;
        b=pYUBuxCM0QdHHIj/sD4wI/dNSdcyUdF0po1pdk6nl+WaACEfKt7dGEzh2fbanitWGH
         R1mbmBDK4C7do3V0Fw8fIp/IZniyck3QH0DwPdiQllTz++XcllW0rvN9XPNB7ScFFikm
         kPl/t4KEjmiO4iz1xiZEYYOhd4sABTMgwBYajAUZV01/CSLs+Q761uThEa6X47mr3VdC
         xlOGThe4J2H95L1bnsm1dr0MOOwzKyacaFvhjmuu1Xh/a6U0xVIirQ+p9gaKRlhen6p7
         JPcJXLUbM/dl4NykqSAKrzOSu/0s6u2n1n4c2a/a4Sv9LI7k+29aUnXdyTHcMI5kYejF
         Asgw==
X-Forwarded-Encrypted: i=1; AKwUvBzV2RTL27WOlinJOS470130y69rsMN25jpIHCTsxCl1Z3nvZAQwF4uQsEPwFBgcUdAAuWKXH210XCLY36St@vger.kernel.org
X-Gm-Message-State: AFq9FYJz8duZO5h2FKamotXt1cs4HwAQXTyMHVNUAdQfY3xCwC6ElV9s
	mPcAlW2cQiuYtSRVKT8n+z7kyaslJPMtGkuNzMggGXKsSK5ZVb51jUdLwfD6KzUt2+G7R3Y6sTv
	6oIUeN+7LBgBnxHf59sOdq4apIrCeXnmKT7iX8RPAIIsVmbtJ3cTGDbUsPhehgCbR83B8
X-Gm-Gg: AYBFou2w9QuX446unPXtze3hvMH5eXXIMdi1ckaTSodHcGttH+j0zNatQhdJCPboFj2
	KeC1JRTqWOyuU2yvL+6w6QzLjzUJpU9PHLyBwskhOnSPW+qdrUQ01yPSqFJbNmUT0rc0iQVGe6E
	Nvvi2OtYhZaZM+stlrRcKuGcgFmFHZAQ8/d1S+/SBJn2CmJKIYKDfKjTlSbvgxst+cOSfGrLSxJ
	vQHJpKJfDBpCjuCdxmPgKC82f+4hF1J0cp/qAVF3AfeR3yr5F6a/QM15t5PtaO65B01pe88c6su
	SqfcC9Lmot012U7hS3iUwgooxhmZf3C20oYnW5b9YZRW1ffLlAEmaDr97eoLo31SssYkos69cNh
	6Jcch+TRiFVsdf1l2b/mlDg==
X-Received: by 2002:a05:620a:2602:b0:93f:25c7:a4e7 with SMTP id af79cd13be357-93f29d3b758mr1902089585a.4.1792485649601;
        Tue, 20 Oct 2026 01:40:49 -0700 (PDT)
X-Received: by 2002:a05:620a:2602:b0:93f:25c7:a4e7 with SMTP id af79cd13be357-93f29d3b758mr1902086685a.4.1792485649072;
        Tue, 20 Oct 2026 01:40:49 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40912cefe3sm451118766b.34.2026.10.20.01.40.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 01:40:47 -0700 (PDT)
Message-ID: <063f95f7-8499-4b3e-8641-05d2fb352214@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 10:40:45 +0200
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
Subject: Re: [PATCH v3] arm64: dts: qcom: eliza: Add FastRPC support
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261016-dts-qcom-eliza-add-fastrpc-v3-1-4e3fb632300b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261016-dts-qcom-eliza-add-fastrpc-v3-1-4e3fb632300b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: DPI5Coj6ScrV42NFk3i5vKk1dFPJ-HAZ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzNCBTYWx0ZWRfX1qC635SHX2T8
 ql6Sh59ER9cVEbvMxHD3ZpaOEXmcZfl6vbIJfQ++UlwdP+DXZIbOZ5QA+pAZ48mO6HckXfqIwai
 OxdsHk2VU0WGkqZ6LXLfBkwVQbZ799w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzNCBTYWx0ZWRfX/bCaf2YZl8M+
 kKVuL417sHZMEI9vNrV5PmoHpIlfALPuufi5wfEOaZcWobuT+aynFeeVfUkv++jHCp4JmaiJu1i
 Fs+CWtKhyuFvcZmfl5v4lXVTxHyQTnIeimtYQG5Nwq2bkV/VAdA8O4Z20Y1eh1HXGkc/sPSEKjd
 7voIEAiptSo8KZZ2OdmChgRIktchSL4pcSLur7Azeq4D5mROCKE6CP8cCRp12j6p+fUJ/YTR3k1
 Z36Ud1iZJ6WjvnlOwrMQ+njI7bskZ7wfJ0a7wKP1oJzugkXRzORUQrUsw3MRHR4SjAkTkpFwdUU
 WdxrR/syOd6fBZSW8spu15yAzvcT3iW9pdBDMVWthoFnHDH8MGg5IIBz+LaL1kjj6HYvnXdqoDl
 afj1WJDtNxtxv4oHHlQEKMyPNvUoN3AHxGh1AOUPq5TKBMIQvAuqLAeW2TUhQOHCaf5jl+zA4p1
 b/E5zVeXeWVsStUvH4w==
X-Proofpoint-GUID: DPI5Coj6ScrV42NFk3i5vKk1dFPJ-HAZ
X-Authority-Analysis: v=2.4 cv=crUOAF4i c=1 sm=1 tr=0 ts=6ad72912 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Fpyk1htM9JFkJ419By4A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 bulkscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200034

On 10/16/26 1:17 PM, Abel Vesa wrote:
> Describe the FastRPC nodes for both ADSP and CDSP remoteprocs, along with
> the ADSP remote heap memory region needed by the Audio PD.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

[...]

> +		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
> +			compatible = "shared-dma-pool";
> +			alloc-ranges = <0x0 0x00000000 0x0 0xffffffff>;

-> "0x1 0x00000000" so that 0xffffffff is also a valid addr
(off-by-one)

otherwise

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
