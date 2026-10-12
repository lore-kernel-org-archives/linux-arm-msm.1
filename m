Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B81377ECC
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 15:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791818585; cv=none; b=lYxruzjXIHMcpAk9YxnOFV6cxusYjHIIdbRPxjNa3EN+J/1LO7qOa2RAC9xTVsdmg1y7PENcFrUjUYKc/hoCyb3GrERPZLzyjdLa2sAUOEHl+m7ckPRKHcZFxzYGJkHBog77V12fQRrcWt4YCzsvOWaXWZQIhRj4W4u9ZM7MO80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791818585; c=relaxed/simple;
	bh=IJRoYw6sJZ0+0l+od7X0+0OrpYFWPVf9diA5uu82KIE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f0cw0wcbAQJise9KgEeKSWOzhQUuZ+nqpsJTS899IWhQD9sm73Fn7hL+tZnzPCJlnCjt3yWiBNQuHQbwTy50PNuOvQTg09+CRLmpFYdtd0ZoxmNV/9sfjwsrvs81/20Jrwkm9q0Z0bWENLgFd2dlo27vsvrLiYjS/EbmxRaz3os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pTdvI4Bn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=guAGi9Yk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pTdvI4Bn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="guAGi9Yk"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0B8S1686419
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 15:23:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2GOYKBkBIe5rfJaEIMD6Cqv63TqMggSTQREHcWWPJLc=; b=pTdvI4BnS5SyTvkL
	Y4PuZh9TQazHicJvSVk7SPAzIMnWeRBk1CXa18H8/yhFoxuiRX4173x854tkoImr
	/vRw1MBCynC7RuyUZ2DnXk1mB1JvwrymZyC8XBvfxAegGIAs9/1e9+xilS2ttPzv
	F0wrH5GCSB9vIvlqiVeAM8Gw1RBr+BO1awD8XtFV4BYivElD7uVWTLJoHYq2W8JF
	tR3LP+yyRzM+Rb3xBgTAo/HAy9ejM0t1mIYUJ8wiZnuJbXkycRlwLT2rVLdL0P/W
	U1PSKYt6rBTUdro/f02/nSSAIu6tN36a5LZrBRHE6fBSouiwLNaKqNyscq5cSIUA
	Rm12Hw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wbc1f6g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 15:23:03 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7cb9f12d351so28974137.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 08:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791818583; x=1792423383; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2GOYKBkBIe5rfJaEIMD6Cqv63TqMggSTQREHcWWPJLc=;
        b=guAGi9Yk7qBAHjTe4iuEtpVNtOmGew8Ox+Kb52mqMtrIhvj0Z+qCHnB4QV5EeLYwWt
         yNUrzHiMZx5ptWxA3y9tuGuF2DnctkubeNX3NlQ0zdQBpDuWoJ31ytmaCafXSxbR0p+2
         6LGJARAQKpZGHzfiZ//KuzJ/kRVENR446DssD4sdyl+TAr0f83BGe/ON3simODEZ7pN6
         BW/s7s7abmvyCrYZrKNpcNMAE8wA0ZowcPystbv3FZ8P0gQY/5ZXRlI/ozEY8Pnu+gn7
         90m4nz+SC43lBUA2aDfBQ2e2qyLIUt96c95K+BjlLPMCeK/uLpwVxwrExsbW/C8LOyo5
         Hz+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791818583; x=1792423383;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2GOYKBkBIe5rfJaEIMD6Cqv63TqMggSTQREHcWWPJLc=;
        b=0CqLWvZpAZMapzP2hNW/ktNEKf6rb8J04N1rDdexHSFJ5qiPt/tNwcU2lGC5ruO5Dp
         vXNXMdleG1FbQtmmv9XpSt4Vpa3TESKDzCH27Hz/7aRwKZOICJsf7QoJXROpxL00UUZ3
         I0BjJqj90Vn4EzYkuSc68TuRkDUYSWB60+jRI7zPZNkJQDxeIu8sHNS0UP1Q48JdYBUm
         x4rFGkxGGspN8mHM1wKwuUlAC4JGo9S+UpSUA6dTAoxomT1pmk0DC2D+pRE7oH/F1SQP
         YJGrNK09Z+fP/62oYK/iAV1jS6V4SvJatsnNM9QrKg6we48ht3hlrKxmtlH9oEQKB8EE
         rrFg==
X-Forwarded-Encrypted: i=1; AKwUvBwWIJ6qD0O2xk5jzNozaFX0FaAI6v2S7yqlCGynL/wxNycbHt4TeX2g8lzUKdgmeiyyXyCPrmtHMEIYmKp1@vger.kernel.org
X-Gm-Message-State: AFq9FYLd8uSKUrAYRKhoiG7Lvw/lULQB48w2tioYEhcYkMKkqkunLKnv
	1lWnSdYZUoKSV9qrxfiaQUlKH65phYgBkQ1Q8qCx1lFq7IutRakhR0PzlJgoBDyFesspLE8iswM
	ASZZPOzw5qDZQ5lv+HQD40vxPRVswKCuH+wgPCyxn1fGdubdVRXu6TWq50Db/WdFOwG0k
X-Gm-Gg: AYBFou1Ld4x/B3IU+WsbU86fxX8/u6FCStAaFQ25F6fWYU/eZ7CmzxKJU4LfXGugS6Y
	aygiDqQQPA6RYXdtar6zGbefChIWLzssTl+y95f4z2CSiuInzvFpZSjnI8LgNvLqiNTm7797onb
	Y92L0B+EniIay2io1K7ozxnolnvFyD5xqB8TgThhSt8C2GJPKv/SWstY3yD3wvsEnAXyU8VjqLN
	h/c5X5++NHfRJ282Srph+rrC8DPJC17R3vYd4jDnrVvjnjfUxr7bLgzc0AY1CJPI+P0ZokN2vMj
	Ugoj+WoFhc4UP2O+ihn66qyJM0wpICUsGN+6I3DG7waxq43t9i/UrWGzgZtOwth605IDQpa+g07
	fWHFa1jQSAqh6zu3aB8eE4g==
X-Received: by 2002:a05:6122:a5c8:10b0:5c9:ac9f:b7f8 with SMTP id 71dfb90a1353d-5e91ef9f2b5mr1350609e0c.0.1791818582762;
        Mon, 12 Oct 2026 08:23:02 -0700 (PDT)
X-Received: by 2002:a05:6122:a5c8:10b0:5c9:ac9f:b7f8 with SMTP id 71dfb90a1353d-5e91ef9f2b5mr1350605e0c.0.1791818582263;
        Mon, 12 Oct 2026 08:23:02 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b1cd4a1876sm1011273a12.19.2026.10.12.08.22.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:23:01 -0700 (PDT)
Message-ID: <51f5c9a7-5b5e-49b2-b8bd-a900a906cd2a@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 17:22:58 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/38] arm: dts: qcom: apq8060: Add newline between
 subnodes
To: Waqar Hameed <waqar.hameed@axis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: kernel@axis.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1790892852.git.waqar.hameed@axis.com>
 <1651102270b2dbf6d21809f94d00af11f3aff98e.1790892852.git.waqar.hameed@axis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <1651102270b2dbf6d21809f94d00af11f3aff98e.1790892852.git.waqar.hameed@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfX3dzk7yOvKLFk
 e/NpbmPF/vTVfnMzicDE/UVlgrRD8szmpQA1tR60fGeOSmYcpZdKLkJ3XudLnaUdo/fKCiYYkdG
 6aFHULCcLycHnnRihT6IV6XEuiT5VAs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfXxjW4aZLhJ8lo
 yQavEjlEMdrVAqA6sWO3PYf0js0iDJyPkIz3cXMrlb3Pndl/lSK9+sNqy6HNZVN2z2y3UR200eq
 FUxClZ6svb+e9oZlpdeRJOwRP0TfOMLxMMGDiNDfzBG2NRmsftyfZvINc12m0Y54cP8+E7VIw51
 I00NZqT+tsDN+eMTpUxRhQPNxKdCR/BV2Ig/U0cnKSfVsdvjMQSKCMnLCk3evKfUJEATHxApVg7
 cgN6CaYKdChed8S+BY4nLeQBQl64bC799NPFSzzzHM0aqJNZMU9ZVIFU36YHU1+GANgSdr45rY9
 IBuNCeDj+11DLOGrScIiYKr//UH3CNK3Xr/jjOryRLUWgbLGjpBevrytObqVMpUpwgxTeXhJDYY
 knkIueTk3M/AqTC1gt4m4Dng/QddhaVKE1z6abbgKgEfVstPqGJA8O7YixOgpGLWtAIu1cwQy48
 mNuKnlsxtHMEILQxqwA==
X-Authority-Analysis: v=2.4 cv=C4p8WgP+ c=1 sm=1 tr=0 ts=6accfb57 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=3-RhneuVAAAA:8 a=EUspDBNiAAAA:8 a=WWQFUNGd85j635JlVwcA:9 a=QEXdDO2ut3YA:10
 a=hTkh0tvSPVsA:10 a=ODZdjJIeia2B_SHc_B0f:22 a=VLVLkjT_5ZicWzSuYqSo:22
X-Proofpoint-ORIG-GUID: fgDwcdFhksbxQRYniikxJs-shSCoBGHa
X-Proofpoint-GUID: fgDwcdFhksbxQRYniikxJs-shSCoBGHa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120061

On 10/2/26 12:36 AM, Waqar Hameed wrote:
> There should be a newline between subnodes. Found/fixed with
> dtfmt (Devicetree Source formatter).
> 
> Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
