Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795703554;
	b=sHfnYG/8L3SEZ7JCaKlJ22R40i5/ZOSOBxS1y++UBcyWteyINUrfBfjlJNTIrHytEZ3M
	 EpYhYdA6QZTOMKzwA+smvV9jkXtmXWUHTgJAf5AB6u0iPiFsaucIqTVEvSM5csmLV0sp7
	 nIPo3vaNYdJeR3O65x+gzmiQedPkc+jA2DsYqgeW1uNX6Qj7fmB9vKdVJm++q3L0Ygk2h
	 KuuZkrDhkujvuXj/jDUU91ljI3a4C9T9u7ahElwNf7MOGsdYKS9VV8t2YXLubwVpCbDTt
	 J/XjmbrcxenL1/mOqISGVFJmy7FaU0mZwDJEnWvEgbFjNxn7uQtWSdpKW9Ut8lDpZ+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795703554;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qRhERcye97/2d0BCY+uzTcTnvBAQXisDPDKwxSe/YCI=;
	b=mkHe9M3MwjEBtsP4rgh1Utx8eK9NmXc5Us05UUyBwkZKDxbg1KoFwzYKNgC0YlGnjIQs
	 KM+MplIuYmButr87qqvXtybmXWFtGF2M0Q8W7T0L3VqT6xoTjXzm2vR8pbMJwnldGR5R0
	 zBYE0PErcvtjmb3lfvAkg6GJTimZ+tIXzukxmtCy2dfPXR69Jzyk9JKyLPw9lB5mvYh5o
	 Z0zib9FBYyNGIb/aXQ0TCLa947tAsLS67JAhQYAOp1rV/sfUsscYhzHGWgBr29nZq0gSC
	 HVAiEcj2W2IGyCqyrvVE3L8dFfyI01e5sWTPEW0GiyoAyeQBxRc7r3xUBqHUxYtc7lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N0mpAT0T;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WVBusSot;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 540E3606A695
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 14:32:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 540E3606A695
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N0mpAT0T;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WVBusSot
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQEVFBD3143544
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 14:32:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qRhERcye97/2d0BCY+uzTcTnvBAQXisDPDKwxSe/YCI=; b=N0mpAT0TtY5YNQRC
	yRTjq2/3yaeQ1fJtJ6mVsoATk9OntYF5m6Ui+p6CWjC+lPP6ni5NscReuFeKerdF
	s+5YOug+xzU+qIYcD0IdA/kKw1+Ft8bZmy7O5vR3gbrAzdGjRaD+Onrm8R3iWcgV
	GiZZlkxd1IUCwAV4CmHJwnQ/cprXwz8jZPD5QgJD7WnL2BResJI2mzRxI3fd5XGE
	7TreBur+Z60yJ3PeBxMhFTNpMVHY7arBv9LmGdG79GSukqc2JYaqXCGXgu7s5cu+
	+eVurKvvrB7kqZwfscRsxZUhVKbcg5QJKo5h7u1C21qcu7Sh1zkYmcq2w88CQJBV
	ZBIxcA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j61ahvsqg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 14:32:24 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5360b8cf8f5so14691721cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 06:32:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795703544; x=1796308344; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qRhERcye97/2d0BCY+uzTcTnvBAQXisDPDKwxSe/YCI=;
        b=WVBusSotwYjhCFmAeRtn8ThCTc43hAuqZ5TiEtU5Si6p08g/RFcCxCqujRcOfAjnyv
         +ZuF238XV0yXN70bwAjhOTgulz+Z03qw5YvwrQNdfgQQy1GrTeBU3jaW/b3iHqWdX/s9
         YVUI+hj+PRes6qQ3W4AAU4LBPZ276Y//EIqyh739jvxd5i/Med88fSL3zy+igWaWCVoW
         hRZRLBZBA7lPedroZs/C3oDc0LHbCxCcuwT2uFpbJI4p2jmFeMnFEAoml8XpyHI+RrPf
         +ByPorwmT7pAkWlq3OH5NuDWnrIYcufgepg/4A3+MvskZjVkjLmfNwo8B88CrLsZd+w1
         qchQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795703544; x=1796308344;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qRhERcye97/2d0BCY+uzTcTnvBAQXisDPDKwxSe/YCI=;
        b=EV1pia8A6KWTJyzgmtywbWxstdaiv5+gsrqfPsQ4gdHNIEXd6u0Zb7lLjrswstht4y
         ES/p+lSYna9asuplbC1pw5ZtYSyncCDph9pCIRjwgGHmrJNzcaAtL++R3yZ46eVZc0NR
         hIqop9wkubba3T13Bm4BhkqV9LmQI6WaMqEy/DMllZwnDHBPFnkznfv70/GOhRcuxFt1
         xxkO8Z6cOdY/+mqKUbp8Ke5t0fdDUtHlrG76nHeQNTlW+3ntMR90n4eZ2E4ZNgshgg8P
         gxTO2SDFpEGwJWmzamiO4Bgx/zoY4GMm5xVavEbLjYwo1sGamtS8n/rBM0g5kWYWDoSa
         kyAg==
X-Forwarded-Encrypted: i=1; AL+hErHZiEukzeuxtkQqhqrlkCRadOPzY4YSVXqDrNJILmfmf7D8ukpwdKpWodGeWu7Puw5fk4Z9XvZjsZOLYZfN@vger.kernel.org
X-Gm-Message-State: APuU4Z+H82wDrJyqfkBBHdbFdsgABpCcNZUKSzeen4FsfKwkaCeCW2Y/
	VSNZvMwkA/xUfzO7JNEhGGeLNBhZEQJj7mia8T8+BbbHlWtzqSdEsNREvyllB+b12Q/pzDDAYSa
	cHuV7wQbElJkrTpRub68up/YXOLj5ZzwyucqrWjffPHPUVOHSBGasIoaCmU3iD5cSUxdV
X-Gm-Gg: AZFdTZewT2wZ2ZwNcYu9LjXEcAsi1/J96kXPYrdfo8pN5BRE8lmuk3N3d4wpL4LjRF3
	JAqGKWxlSKqqamrsCu8iitivzoGPQQvaq7kY5+1rmsZKR61yvSoeprY1ItmTp+eavYH91IrL9p2
	/TgP/WNpMBWaMVdkD61bLsilLSO/XbPKWGjqyyvVT1xSpIsK5kbOVhH2BHbVHW5gjiqfnVKqiio
	iUCGeM681Hj4edNjFydDJTwjJReIYVx9IuCXmbr8///DY+SzlttlVU4kMUHvYkKbCjLlnc+CmfU
	XJ1PtLJU8nI6HNCPPbxjOcm8cx5cK+nUq6gS1J9zq7wvBiIIPzYTmWSZ6Kbr8YwzTQkm23j/sh7
	kyh1jG527ngXJJ24jO/C5xIfNTpbjj37oPmn+VjF/WubBbH0UFgGXYCa4ZyivAWixB8LKAh0=
X-Received: by 2002:a05:620a:6695:b0:949:a3e7:e0e8 with SMTP id af79cd13be357-949bab1195fmr3255778585a.4.1795703543567;
        Thu, 26 Nov 2026 06:32:23 -0800 (PST)
X-Received: by 2002:a05:620a:6695:b0:949:a3e7:e0e8 with SMTP id af79cd13be357-949bab1195fmr3255776485a.4.1795703543156;
        Thu, 26 Nov 2026 06:32:23 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370e79f2sm9938527a12.15.2026.11.26.06.32.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 06:32:22 -0800 (PST)
Message-ID: <61abce04-a112-4afc-91fd-9591a9de25a3@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 15:32:19 +0100
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
Subject: Re: [PATCH] arm64: dts: qcom: sm8250: Make the ADSP fastrpc remote
 heap no-map
To: stoicoci.mihaita@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261123-sm8250-fastrpc-remote-heap-no-map-v1-1-68ce6470e82c@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261123-sm8250-fastrpc-remote-heap-no-map-v1-1-68ce6470e82c@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: EfdOSg8sU9SdyOb5Bxij8VZpOljZSqFC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA1NiBTYWx0ZWRfX7q0qAvU2KtTk
 KDKM9PTkX9M7J7otYM/AqmiiLZWWcGTTxnoOw3ivhjfuR9JGWKvuyzL98Or9NtxGLV9rOF+VOuf
 DrMrvRLEHVHsDIj5I4L4O9AGXCUcOU0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA1NiBTYWx0ZWRfXxj0A3I1WgCBA
 16Rdjp/DNPxDdYDO/s8X33PJPPnwhLMTQl3VxuF17Akl+Oe6ig7efrurGIlm5WdoGOc/CK5eJPo
 aNwL9kOx6Cx1vq+MlGIzusxCy/GTeAIDkWhdGnWBXDznjBuptahX56SCxcDHGtG7bYOXxizCvn7
 MjapWnR2QPneUKsMIs1Ffwaw4VEM0bv6K3Eb+3qPDXLyQ1yMtyJTPsUkGPHxJpWpKPtIMLIIUoU
 02AZQtQ7bqexIwhHsWUwPIX/WxYYrnaNogQhicotdHgwWVhUTfczI8iwP6j2uVtwDRGkgyPJZAS
 uqjRyeBbvnbsG2LsmB5F4ZDw6Y7CMFDrfya95TOz5haofEWBfKb4co7cAgy/Li8pwZNk2cyAWbQ
 3X6PZsVckvsDkqAL3ELkkWih1316wKUeuE6VjSAfqtTaodfhyh2jUPVD24lEyCnri3lmIQkWUgs
 M12r77ukZKp1pn79xMA==
X-Proofpoint-ORIG-GUID: EfdOSg8sU9SdyOb5Bxij8VZpOljZSqFC
X-Authority-Analysis: v=2.4 cv=BbxNQbt2 c=1 sm=1 tr=0 ts=6b0842f8 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=_ROeunYG8wwyJrT_Ht8A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260056

On 11/23/26 9:54 PM, Stoicoci Mihaita via B4 Relay wrote:
> From: Stoicoci Mihaita <stoicoci.mihaita@gmail.com>
> 
> The ADSP fastrpc node hands the whole adsp-rpc-remote-heap region to the
> DSP when it probes: fastrpc_rpmsg_probe() calls qcom_scm_assign_mem()
> with the qcom,vmids list (LPASS and ADSP_HEAP), which does not include
> HLOS.
> 
> The region is declared reusable, so it is a CMA area and its pages are
> still lent to movable allocations (page cache, anonymous memory). Under
> memory pressure the kernel then touches pages that the hypervisor no
> longer maps for HLOS. On a Lenovo Tab P12 Pro (TB-Q706F, SM8250) this
> reset the device within a few minutes of heavy use (browser video,
> Flatpak installs). Nothing reached the kernel log or pstore, the PMIC
> reported a PS_HOLD reset, and the TZ diagnostic area showed a fatal SGI
> on a different CPU each time just before the reset.
> 
> Mark the region no-map so it is never handed to the page allocator. With
> this change the same workload ran with the CMA area fully used and no
> reset.
> 
> Fixes: 531ce288b6dd ("arm64: dts: qcom: sm8250: Add memory-region for audio PD")
> Signed-off-by: Stoicoci Mihaita <stoicoci.mihaita@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

