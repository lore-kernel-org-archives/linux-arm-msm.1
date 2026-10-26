Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793027344;
	b=uS1EO3amuKt6q0zWzxA2/OWeuoSLjzYshXzCiShkyAT9XBLwR527l0dB1w06xPyF9Uic
	 8d6vohpuZSkLdtV4VyP7xzTpplx7XHJUDLrPMjv5XQwYSS69jKJKs7K8Unk6PIt26qWE2
	 CPsmWqMrXymaYvGkYH+cs18zrcSwGx7SnbvxqN0icFfQdB0vvbd3OfW5GO8XRm6GhyLB5
	 KdPljX73fM9R19hjow/mV4cJRXR8uz5+zztZHvwnZgOSrVRJS983bjYyG7uEO1PA9QUlF
	 aszPzqgL4NtmzN/p9SEh+xma9fAjPGU/+bmUXGoSlNwrNBmjT2bflIcZLK4IR1ZyyPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793027344;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=KWMNpUaY5pYPifFWu/XjdFpZWwWZTStRMKXLqRxU7fs=;
	b=fGAtz2Pn3s9DtW/e289tp4aIuUGUkrJ+qs+P2MctEJQ1aTAkTXMRiPPTjYpM5rY6QUeG
	 sht7bcep2cLJyca0roRYF/wV7GBquR4nsR17CHMugEvXJ0KgMAgJTh4+qcYIq0QluqZeL
	 Ml/v1gTguVVj3Hw1vy2w/ly1dNpcRnrOGaQvycqY7bxsjhauRioBNF9GdU4j4NNcd5HZH
	 hcjt9bqlJlUGopIcQcZpWwzu/1T7w2puwZKqAdW4x4ssX7DPICZRpUm0lTNVXIWNvJE4V
	 PztfLpPgOY/dEN1/RcNj+LIrkMx2P9SrFm1MFnoakkch2ljJRBz8y6XkNvLQdt2HM+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ihIRVT5v;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IuDxWcE3;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E303606A31D
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 15:09:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E303606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ihIRVT5v;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IuDxWcE3
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QEvthk3567322
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 15:09:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KWMNpUaY5pYPifFWu/XjdFpZWwWZTStRMKXLqRxU7fs=; b=ihIRVT5vmXCv1SWr
	qXxBu0w5zJft9G1RPAp3A3HlGrvpZk/U8PBzPKBHZjWut7z3ELbI0NMoRCVUwd6v
	+QHH7B8A8Zxc6umqNjqRedI+ryjeB7aYD0HFesQmuKMzYetpgTEe0J4qkAbZy8yB
	fBSrPm3HglHIHR0Jo9MYBTtrVR+mUjLIm18bDUo/KMVdaXvBUljnQP+MXswXoXZF
	pzrrMmW2PiyRnaUZMLG0/NVCvPxAwtxUhNliVRCbZ8jCY92V6p2wvpKA+G0Qf2/L
	tyXCS+ERi5tb/b+Rn4a1BB9uXD8EKmAKaB0SyTsRiFOPfkQb2Wzm1oS6emdOmezL
	y6+0BA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj56y1138-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 15:09:03 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c97957d83bso163863e0c.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 08:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793027342; x=1793632142; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KWMNpUaY5pYPifFWu/XjdFpZWwWZTStRMKXLqRxU7fs=;
        b=IuDxWcE31f1sCReB/OsOLgJvAopz/3o52fw4rd7TUGs+fQnFo+o/pByTBJeh90kjt5
         GcTINtGUDWO1sGhvnBuCrwxRaOtuUbJOGi3OvTXw+ccpP03odd6JCmaUxdhlPOUMY9Of
         ivwOAvTjxtTrV9/1RDeFMc9h9Tkbm8I1MBtT9ceaAEriYQT8UYhd0IC/GcBASZKZXzTJ
         6Cf2jn8wgVAuTBT0bod4P2GQX3MCaSa8yiO7NnZpx4lOxryd1CoFPo8auNlB405Z+ZDp
         wLNDZl15mXDoYkM5b0fc/lJwqbKSnWkwF/1H/PW6gwjuWeYYdC0IvUKONlwbngfOGCD0
         6Y/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793027342; x=1793632142;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KWMNpUaY5pYPifFWu/XjdFpZWwWZTStRMKXLqRxU7fs=;
        b=IIUamLDsPPZYF7D+VxKr29kUb6xLAAiuVoOy+xXjCm3uFhVj21tDJonhQ/u+bCC+ha
         AAZ7d8v/m5M/xX87554ATVg/DSdukPXa9dCO6iMk7kovVj7bscq05Iaff6+uS5yL1hTg
         JJ40E+xjsAQnyAIfFiVtzuwdmasUom1wmPvddac1ieMxezNysIk+ZJmpYcLMef275KCV
         YfXkQyyw8anIn8eHdcBFjtHwtiuyE2AO/yc0rjwO5t+WVBudCyn2Mi3q+MtGT3UrtFAU
         azzD2PRJMBJbSzN2fraFPhOrBmThZ1aWKbRCSqXh6uh2h93RBummTmadFeqv82Drw5D0
         OYPQ==
X-Forwarded-Encrypted: i=1; AKwUvBww0ReM0h9mg6Z5QBEWwImmFQ57Is3ee5SItA0WuylXA6crJCGEx4VuSuy1t7ajN8II3UvtEhH1jUluWZ4+@vger.kernel.org
X-Gm-Message-State: AFq9FYJ8WEvmhAScQrRrFHx4VF5l3Na1i3Nl5EFoofKTmpz9iGd41b9M
	rvYwOeioZiiT4Muc7YYbc60ZpsjuD+8aZdbfLhkWcT6WZok5wK5mvMO9yvCrXPKdkx8zaW7RIlH
	mZQm2w0npK0pNNHP8vVgNfItxvbXqc5RI1Mz1+5lnkeUTSm6CeXAgChn3s0T1GIpucX0MMwiMM4
	O8
X-Gm-Gg: AYBFou2jiBAatinB1TtJYzUzUuI57AUsLaIv3HypMhcYmbkDbC3d85RH9SKllDZb405
	zudoxrM50+VpjZHS4OwrC/Q7DwrxOfmqAZqT1A/MF4O8aPROnxb2VFnkXyLhN2HiubSDkxRrVe/
	hGGQPeT+Wj9rP8yjBVg1rzG8gm4M3+CjNUova1LMBS5R2fKRio17qgc/aIZs7H9JARX6Grd7sn/
	0/2eiLXEMxGIO0MUo2BPO9yPbqtXkLMRod0Fa48Ywr0ZC1JOrEktyImABRVpNkSnD4S1oVfhhZp
	88bjvHnYsFOEAu+NwVuGobiIaP6wf/MKp4BhPXO9u2YDI/cXema70Z4MfzOhu7SVpSfodg/PSXN
	v9Ua1qO6kIwXdqBQAiLYnhw==
X-Received: by 2002:ac5:c00f:0:10b0:5ea:e18b:16a8 with SMTP id 71dfb90a1353d-5ec22ec8268mr2282423e0c.0.1793027342356;
        Mon, 26 Oct 2026 08:09:02 -0700 (PDT)
X-Received: by 2002:ac5:c00f:0:10b0:5ea:e18b:16a8 with SMTP id 71dfb90a1353d-5ec22ec8268mr2282365e0c.0.1793027341885;
        Mon, 26 Oct 2026 08:09:01 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd798391sm332866066b.71.2026.10.26.08.08.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 08:09:00 -0700 (PDT)
Message-ID: <93418e3d-c491-4724-adfc-21e31904e815@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 16:08:58 +0100
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
Subject: Re: [PATCH] arm64: dts: qcom: qcs6490-rubikpi3: Keep WLAN firmware
 memory reserved
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Roger Shimizu <rosh@debian.org>,
        Hongyang Zhao <hongyang.zhao@thundersoft.com>,
        Christopher Obbard <chris.obbard@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <CGME20261022085853eucas1p1204878da3c0f519bcb39bf11ad84bd97@eucas1p1.samsung.com>
 <20261022085844.768508-1-m.szyprowski@samsung.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261022085844.768508-1-m.szyprowski@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA2MCBTYWx0ZWRfX5/92Cspcp45f
 ZT3guDlUFQKUtPbsCckoY+eg/f3WwJJzjwaBxLR16a+AuMuNMMK3uONje/i/HREnC12sfVGH2i3
 AxFvHHH+5yjyvCC2AMVvqayJes/B7t8=
X-Authority-Analysis: v=2.4 cv=eMeGH3p1 c=1 sm=1 tr=0 ts=6adf6d0f cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=o4Q9ZarbzXqV1QZr0XcA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA2MCBTYWx0ZWRfX31dA9sB0E62M
 g5kNoW8r7JT0AUlvzqpBvppygDRaCgI1Q/owdmflEp1KBB/TcCVerMfPBZu2k0LYqMOKrFleYx7
 5BWxJqjCWYgtDLljLxeXfzH2wVnq1glDgxreQ/WxvigHGvBrhSOD04l0+ikkWlDLwDrjzNt0DwM
 QQHTgZUdhdiQazDwLlzINRwMBOLPkMaoaiOggQh9XyEUToKnetdvhyqdjQ1QF474bNCmF6mKvVH
 VwuxdvZIPHbf7lviCAZ27GvFJh/MxaendbuRE71PAr/SpFzG1TcScRDZ8SWDCKrdRUF323z3/UO
 t57JCohmiWREY8Vtoeqqun+veUFN8VhvEyLSOsn7Hf80ZfOmHvIvYJ7ckYg097yXUXm9iZZOrK9
 3ZseoNKoQgP2TGTF+AEHPaj6whOv0j2k6tux7AfWWDtt5qmtmAKdwphvWI7YzBLmXEXL3Ed5IMu
 FNhawfTiq6hAg9Pp69g==
X-Proofpoint-GUID: X2gOp311ajiEV9SfsZqnG4mLpxOE8pxR
X-Proofpoint-ORIG-GUID: X2gOp311ajiEV9SfsZqnG4mLpxOE8pxR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260060

On 10/22/26 10:58 AM, Marek Szyprowski wrote:
> The board dts deletes the wlan_fw_mem reserved-memory node inherited from
> kodiak.dtsi, because RUBIK Pi 3 has no WPSS and uses an external WLAN
> chip. However the firmware still keeps the 0x80c00000-0x817fffff carve-out
> protected. Linux treats that range as ordinary System RAM and the first
> access to any page from it triggers a synchronous external abort.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
