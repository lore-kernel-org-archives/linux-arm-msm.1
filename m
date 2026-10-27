Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793090032;
	b=4j7ek4L8Mu05NvlcrpWt71KzajEvkz+93q19X3UGwgrmk5uhAitdg6KtBE7D5crFn2hW
	 7EQWYPDn8oBpdwgqxlfh54BMwQGwEXXCdS/3BgjBv7ZhkX6X1tG1JTMC2qgZIfjLJHryj
	 62kgqYNdZQMXVyGfZJLoJSRS5w2KC/9yL5gDWGJ8JE2TaacTmkyqKlyiA4c2aaNcCGeyr
	 btaAkmRCmCLNkl5rdzUFRaGT3Av+jCdpnil3XtfOGOzuyZ6ZDbgKK4FsfqULoCbR/iURA
	 reFeYCWzBjyT0rZxAg1MC9yXqmBBpF6aN0XJgYzZ6Ex3Owv280Pn0qQEVy85CyqCJNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793090032;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=BtdrVNiJ3zpClPjAIw/I7/xnRjWaayF2qUMuhQOOe2M=;
	b=3CJF9le7CmjUa8j1zIiDeRaZEIuVu6kQBfz2K+SuCwLmYR1lanezWRnBBC3Sm6RH7SGL
	 Wc84xxxBDgf59L0NMNjIp16R/TGOgSwsUKH8dA3pPHD2t5u66dPGTgGyNU2ffkMMvPgMJ
	 iMFfRUxnJLA6Ax4DR2yYFVLjBOO3REKkFWSjJxOpASiePOgq5rnUcWUmVEt9WnOZ+6fBq
	 uHgVaN0IjBUi6NMHTJjENUP/JMlwcY/BGLovx1lsh/M6kGlio7O2CJbG0AfNKRUNuaLzG
	 PAqdxLxSPd0sJCrOYuwDqMtTki5ChSjfnJlw0qewnzYVBQ3M4vnS7Kaso/52ffuMdIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bRc4sDkr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CmdY25w9;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D36606A31A
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 08:33:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7D36606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bRc4sDkr;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CmdY25w9
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R5Ywjf752083
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 08:33:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BtdrVNiJ3zpClPjAIw/I7/xnRjWaayF2qUMuhQOOe2M=; b=bRc4sDkrsY+osIgX
	N8YTOL8OzPUUjT+3Hlx6GAYOW+un954QxMERGuTJvWNzUOPXzlCJ3KCJpQVG00jG
	JKOj6xWWpYgBW4XJZoaQ6D4OvX+RQWKZgHRsb5nyCxENjcdkHJHugOpyjXyqSpcy
	UQxuoAS1BiFvFS+ECU2TrBq0jDp31cfEcq/kLj4XVE1VHybBN3sP/W+J9Vu7+va+
	UuHaCGLEdqkWdqK+yCgJYLFM50pVNgYSUWvN8ZCf6o3/ABmfCp6byYubZlOtnyFE
	E5dqKy8BWm3ay9qNof1q12G3A7IqRTaeE2ROX1WVugXdTee6tHpgQj9Ioewj8Kcv
	SPl08w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjbmmap8m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 08:33:46 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-53568f05f8bso12587531cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 01:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793090025; x=1793694825; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BtdrVNiJ3zpClPjAIw/I7/xnRjWaayF2qUMuhQOOe2M=;
        b=CmdY25w9ZB2g+GoQKhru38h/lN+9wVF37A3WTcmYEpeeZzOs9QlNgtVV6ckgvi4gwc
         UdlfASUZQYW//JEODq9L37eWitckm7T8gpalwLmTs3aEIzaOzCa7TlR3xBHBe1U98ylx
         5NJCTfubIZKj89/nFr8ab7q2Z3JrRJb7JqD+PGjrnYpXlHG8b6uRLyuFfZPOgNWa+RqV
         fbDK0F6Qsk0C1j4dOMLEy4ZCP1kxizuF+jRdL/F/8hH4ulSzMiA9ovfCNt0FmTNCThQ5
         7uSJO4O4Plo7p8ZuCRVrJXABvMpvTlZnclT2lXUaUwHcPJebIX4FHWGTAWyjJLq1uhIe
         dacw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793090025; x=1793694825;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BtdrVNiJ3zpClPjAIw/I7/xnRjWaayF2qUMuhQOOe2M=;
        b=0ZbERY31v7o1oEMgWpnMfCMoNwgEuiqFylLLyV3i8LMDoDpaSGzPMmuP00ChmUfb0C
         MYS2gaKh03spxXIPh0+VWh+na+Mdh0sVp4SCZpoTW4JCdRVGHuQYlExMfum01aHmLyj9
         aioxje88XgRAlGg2jKdcB/zF539j3L+liLFsMgwC1gTnHmgRCRRuHQRLVALOPIEopSzQ
         WWbGIBDbSwqSfrHM6YCH8ZLxejocnskXbi+bva9YW0rXjysqbMzC9qPrPNdUGjdJiJBB
         sYVQyO3tL7/eiakNLgmkhV+plyc8C/GRF9zXoObMnW+M5YrjKpb5Lxm8Xh7aGx+gWj/Y
         Nuuw==
X-Gm-Message-State: AFq9FYI8ExUqn4IMsATzhAjoRWmX83kBPYbGKHrIVJDOWk+y3mUUtejW
	IISupGkQ/wALIDSYeYuhEQtqhAZuu9S59K2tM8QT1Bse63DnJs4y4fpGEaVQm5yUxBIeoUuz+LO
	EzpDeq42irDcY+iHafy2FBtxp8xSsDKudE1YPJPc8tcSRKoib2ekcvRtMDiz9jjkDU+xF
X-Gm-Gg: AYBFou3vB8rLHSYRtFf1VP+8hTROlQUsOXQTCy0V33VazSLSRqkuB5eHfXIlsnxY7g2
	GKjZojtOat5uW3iQ5xkdcgaH+ZCA2tU5+ZhYO2Php04D/K6RT2SyE9VfChnkWCk5rfW4Dt6AjRU
	cR9edf3UiZIHJf3CkQioavFLhNMSEjLxZguZd7oE+rH1YEwauDaUM7aGG/5D8EM22gwPs9BgQL9
	puUk9gI6aSJ8hi8Qm5bwVnQU1r2fQTUrV+v6ivGhgHmlX2ONIscD+B/s2twif7cgCOoie6g9fTN
	USTCv1F6W/ChuSfGWJx/A8VLOVgG7ZmABUCfNBuJuNDLJFWByXQvp3tiuPnFdjFIpQw13tcWma5
	NbZZTr18n4VvDPW4LXFaesg==
X-Received: by 2002:a05:622a:e309:20b0:536:3519:de44 with SMTP id d75a77b69052e-5383b6426e3mr142425951cf.4.1793090024883;
        Tue, 27 Oct 2026 01:33:44 -0700 (PDT)
X-Received: by 2002:a05:622a:e309:20b0:536:3519:de44 with SMTP id d75a77b69052e-5383b6426e3mr142425821cf.4.1793090024557;
        Tue, 27 Oct 2026 01:33:44 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b44595d7c8sm4686184a12.8.2026.10.27.01.33.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 01:33:43 -0700 (PDT)
Message-ID: <fcdb97d3-58c6-4996-9c66-f0dc99c6f699@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 09:33:41 +0100
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
Subject: Re: [PATCH v2 4/6] arm64: dts: qcom: sm8250-hdk: Enable the PCIe
 ports
To: ShiTou Hong <redstone.dcity@gmail.com>, andersson@kernel.org,
        konradybcio@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        ShiTou Hong <dc_redstone@outlook.com>,
        KancyJoe <kancy2333@outlook.com>
References: <20261027080758.3990418-1-dc_redstone@outlook.com>
 <20261027080758.3990418-5-dc_redstone@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261027080758.3990418-5-dc_redstone@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAzMyBTYWx0ZWRfX2ieksIvhb3sT
 GoKMde8JDAO7n/3VSG2u4iq3HJsYaXQHBlwFKgRSFePjiNChEnqyZXjfVRLtT/KY6dc2k8LhPoE
 YoyqwNRRygm/ptVqsh3y/VCZWRP9f9g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAzMyBTYWx0ZWRfX8DXesqxyBNGM
 JXgMTRYoiuXpl/c9tIsTAiAnfLE+1kMxByhN9SF5CXOTHww52gHCifqDchm3Np1+Ocd+jgilHx3
 eEuOornTdXgQtHxOGu1W2DsyvKG++YWWci6R27LZN+pZMmtCCjOeiljUe466s7gRxUDQw9CxVnA
 O8JLvaVjDu6/PMS1WWekZCqG2OwrXEvxS1dm9r7/aPyNuddwFw2QHVVIXxrontdPX74RLgxjpmd
 Y7eWzO17qdkqchVANNjVQuZWsvJAFisG1/zRgOCWhAxtEITGl8XNqbvgeHx5l89MGSHmTTAwnza
 2b0DOrcN/6xtJOOmskFBkOxhrzPg2yVHiocgH7hjn83GMVSxTNhQGdzntk/wSosgktRQttLkFSD
 lhXWWzFg2WtNhJupOtV0YMzXGNX1GRPLpKDWOHhf8BjKF3+CtNzp8nYesypuBGnQF1DrN/EoALl
 HlssRRDOmknLb/CErJA==
X-Authority-Analysis: v=2.4 cv=PrkG/AM3 c=1 sm=1 tr=0 ts=6ae061ea cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=_qlRp4P7470HW9D_qU8A:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: HuHxprms5ckI3YG2JLiw9_QDLKvCxCpm
X-Proofpoint-GUID: HuHxprms5ckI3YG2JLiw9_QDLKvCxCpm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270033

On 10/27/26 9:07 AM, ShiTou Hong wrote:
> The sm8250-hdk has 2 PCIe ports which are not enabled in the dts.
> The pcie0 is for the on-board ath11k WiFi/BT module;
> while the pcie2 is for the M.2 connector.
> 
> Add the 3V3 regulator node for pcie2.

It's a dummy regulator so it does nothing - did you miss the
enable GPIO?

Also, nowadays there's

Documentation/devicetree/bindings/connector/pcie-m2-m-connector.yaml
Documentation/devicetree/bindings/connector/pcie-m2-e-connector.yaml

to let us not hardcode things like the wifi node

Konrad
