Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F3E7433BA7
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 15:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784562458; cv=none; b=DO/A3mnI2diugvUwiAj5N5pof/rCnA9XLj9nHHf9OVQLs6VS7izaHw40A1gZbYD8RVTw+yg+cTVOgfPru6baO36JlY6bMeE+wZvezGca/ABxgI9l6m+aMjwataSDvCOauNDNE40HZrKgH9QJgeXp0Bny+MCXIeRYxVRlMKOuxkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784562458; c=relaxed/simple;
	bh=6lATRFPxTxT8XD806au+dhBs7SL2lPkrnjUO8GWkEAU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=csjfIXglo9vBymEr4PgCzmQ1La5iN1P5oIzw1l4haEUe8pX6jjR99hDozGNYl03E8RRzcze2eUTmdlGa4DVBzzKOrpYjEohQbfLR1KloX2L9vRujszWmh8EtMw5MuLytrzRzyzdAylwad2ad6qMbuqLDUP5DtY2b6CxS9yR4xHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CLul07nl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Oq5yNzW3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CLul07nl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Oq5yNzW3"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KFLclw2819403
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 15:47:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P8ECtc/MvhpkV2EQxc5dreSw9c9e9tz4Nmib+ihrXVQ=; b=CLul07nlOyGdApoQ
	l42NO8/xTkYrBsBoxz8r5jkgyBwNZswyduQMqfQ3WZY9hupTlwl6605f5v6y7VTZ
	OZlAXP+7LTK+6f8H55Hf94w7HybiseEc4iacyJsLbBJgRJegXTvdR/B4vfoL2aTz
	7HvtLMp74Wn0bOcLexAykUOccXMjHJU6+c+Xdn5LLedqehGM1/efdBAPy2/nbhyw
	yCzegs2F+AWOm7QIqod1Ux1lP887rwvgAIo9qkqZGHheHBqVF+QCB9Ztg0Fl1vo0
	6fY39lgOoIpLGGFs9Q5PX0TIup86Shv7NYZQG1YRH+v3LBZZrAbrSXKDCgYrzIul
	eHpLpQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhggg9yk7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 15:47:35 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51caa0b48ccso19376251cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 08:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784562455; x=1785167255; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P8ECtc/MvhpkV2EQxc5dreSw9c9e9tz4Nmib+ihrXVQ=;
        b=Oq5yNzW33++JpiGhx5cpY76J9pcIMNdOvG+D/5Us47A90A7KAWa7gGpeBY4jMLy/tR
         1SWGGd6twXbLlweA7xgfgscDDSn9EQ1jTRQbtcNWMjAsmcjr5EVJnhBvM45A7RLMGttL
         XW0yICA7zFid1QT79RtKzabXW2mC25CEcmUTeQ1PxVMoiYGUBnwYcqIWf2s4pRBe1Lx1
         lB5TaBlz73xFcTCfDOhAPRYxupZBY1ppwExOvOYz9qeXyng+GFhNTY9PzGcEwrlbLbvL
         5ypjJJIi6ZNhpLp08/Tl1zJM8yBBAxQQKejqGko6UIXaN9pHFl1sDuacTJRuB4esGKxj
         8WJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784562455; x=1785167255;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P8ECtc/MvhpkV2EQxc5dreSw9c9e9tz4Nmib+ihrXVQ=;
        b=n47uQRfHcStVtKca8d+tRIsVZXRNYSK0jfHZaVZA/w5Fd6vja3nIu3cpmDQ2OjDHFz
         h7KH9HMuzpl7J1oZ+AUDPERLYabItQzf6w6fo4UM5x0iJ8nWN3qY5cnujIkRXzh6Qw2w
         TtoZ0rRo5yx75XH4W1sTdPpcH0goalA4xh2oe1Y7iQvy1+Teq7GqkMp23zN9o5tYvzKs
         +ykeeRZffltO44NvD7oOBHIqbAOn4qQGpQfgmqVq+Ylw5iInjl7N7H6JjzC10ezSVAFk
         Zl1PJXZPFq2aL6NTSn1gL5eoePhMS3E3FdQ4npH/IeIWOAY0418sYOVdieyatShohBmH
         b8Gg==
X-Forwarded-Encrypted: i=1; AHgh+Rptr0rETLqy5vE4w+Xupbsefz+KiRqgLspQnyuNqSICiAhZhytHu15heX+Rb0dQYuZis76f+yBHKQThqMFG@vger.kernel.org
X-Gm-Message-State: AOJu0YxZTEQNuYFAKdIcLgICkwnG+aTZgb1kGJqfw7dwcFbGhyGn5bj7
	/EMAGKT7/MXqNnp9uaqKOANnfCsQ2TGrI187GAxD4I9wgWt5EsRBMEqNctdIm6YPyLP00jbXEik
	J1sjGDDAg/oMFbfr1OhHb1vorURPEZYIrqMsgXaos38KO+qZuoyv/CE0uKTYEtPlZOZQJ
X-Gm-Gg: AfdE7cnwQZ3KQgwBqHloOTnEqD0gOCG/Z2s+WYQTcwDE9lwg2i6EvtHeyfmYWo1FyS4
	+PrPheydlUMzAKHQzKnbmPGxqWHfHCYlFds9dzD6zJCelR5A7mOEBu5OlIZ+b/L+Jcw4JBrdrv3
	+Zy5TsgCpNV1EcnbEhs4yUaaP699UURKEqDV9dtTL8sVDkwn1dyCdMaPeZx3cRU+szChEB46bjV
	1pWQ8XVMwN37QesSYTWs+stqXUFHBMygRLgBdlZd8XTgOVR8Iinkv6AzjeXyfnT2OZEjvuSPT0s
	BoQ21Adh33vAunrML9Z5t9hJIkHWITRM8r2z+S12dSDy3sF7O97iELoYx97mAqXHrN+rplGbwQm
	vYkRvEPq8p37gQ+D1NIMsvS7h
X-Received: by 2002:a05:622a:987:b0:51b:fe41:4764 with SMTP id d75a77b69052e-525faca1108mr11990271cf.7.1784562455388;
        Mon, 20 Jul 2026 08:47:35 -0700 (PDT)
X-Received: by 2002:a05:622a:987:b0:51b:fe41:4764 with SMTP id d75a77b69052e-525faca1108mr11990051cf.7.1784562454931;
        Mon, 20 Jul 2026 08:47:34 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1705a08490sm490061566b.21.2026.07.20.08.47.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 08:47:34 -0700 (PDT)
Message-ID: <34b0bb3b-d756-4cd6-806d-75b1124f4397@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 17:47:32 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dmaengine: qcom: gpi: Fix SE ID and SE Protocol fields
 widths in SCRATCH_0
To: Chandana Kishori Chiluveru <chandana.chiluveru@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        bjorn.andersson@oss.qualcomm.com
Cc: praveen.talari@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
        mukesh.savaliya@oss.qualcomm.com
References: <20260720-fix_se_id_and_se_protocol_fields-v1-1-e41dbb107d97@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260720-fix_se_id_and_se_protocol_fields-v1-1-e41dbb107d97@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: L-H6eHF26Jj7kzJVruJrRZ9Ms0ZejLcy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDE3NSBTYWx0ZWRfX6kmEB8jQEdWH
 UlaV5JevCISbWpBMJ2HSUmZYYf2dNdMgpoRYfVHEdWSEbJFF6wVvQoZzPOfdGSMgwOZ/E0aV6b4
 Fj0nEla3A3sEC1co0ZZ6eB0xbddmP30mx/q0E11j7PW1lSLkKPPckRRk502N8w2nxwRSy0ovvja
 oUCMkXaWAkunHJaGdBZim+U/x2hA2s2y+37VUravmR5QkBT4dhg5AUupCDstRrKznuNLJLDMaGi
 e8M02UutfPOML9YMfAsYx6aU5yMfA/uAOBxkwJDiNYJi+EIduAD0n/JOOYzrngsyHwncW59NvZZ
 4ldxe7GfkfznaekkpNwJOxDVzfQMfL05dzVak/HPYWiQkV/+TYNkDfSh1PvftmNNdrZI0jt3iOD
 kuW8ikOiHKOAQV1hi1gpcBK+1YNDsPbUSyj+Y95KfLPGc2aa3iUXfyZ19rbnruVXb5xpDIeztSm
 FQXcjkJwwXlz6H7zNsA==
X-Authority-Analysis: v=2.4 cv=RPmD2Yi+ c=1 sm=1 tr=0 ts=6a5e4318 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=4BU4YjERTYdAktGsJ0gA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: L-H6eHF26Jj7kzJVruJrRZ9Ms0ZejLcy
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDE3NSBTYWx0ZWRfX+tsqP8DXDrKA
 HVJjqCgtYc+LH5kGvsS1jWsX2Nw9CEhTOY5O+3QZ9d2QzVs0ZqYgaZSd9DmjuptmwhJBrcNo3jG
 HauRu90Hicxj6AbtYcVkNUK3eUlbN2E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_03,2026-07-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607200175

On 7/20/26 5:27 PM, Chandana Kishori Chiluveru wrote:
> GPII_n_CH_k_SCRATCH_0_SEID is currently defined as GENMASK(2, 0), only
> 3 bits wide. Serial engine indices >= 8 get silently truncated by
> FIELD_PREP()/u32_encode_bits() when written into the scratch register,
> causing the GPI channel to bind to the wrong serial engine. The
> channel allocate command still succeeds (it doesn't require the
> target SE to respond), but the subsequent channel start command times
> out waiting for hardware to complete the handoff to the (incorrectly
> bound) SE, and gpi_send_cmd() returns -EIO leading to GSI usecase failures
> for SE8 and SE9 serial engines.
> 
> Older documentation, such as the SDM845 hardware programming guide,
> describes the SE ID field as bits [2:0]. More recent QUP hardware
> documentation defines the field as bits [3:0]. Use the wider definition
> to match current hardware documentation while remaining compatible with
> existing platforms and enabling serial engine IDs greater than 7.
> 
> Also update the SE Protocol field definition to match the documented
> register layout and keep both fields correctly packed.
> 
> Fixes: 5d0c3533a19f ("dmaengine: qcom: Add GPI dma driver")
> Signed-off-by: Chandana Kishori Chiluveru <chandana.chiluveru@oss.qualcomm.com>
> ---
>  drivers/dma/qcom/gpi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
> index a5055a6273af..8f09eaf4e714 100644
> --- a/drivers/dma/qcom/gpi.c
> +++ b/drivers/dma/qcom/gpi.c
> @@ -207,8 +207,8 @@ enum CNTXT_OFFS {
>  
>  /* Scratch registers */
>  #define GPII_n_CH_k_SCRATCH_0_OFFS(n, k)	(0x20060 + (0x4000 * (n)) + (0x80 * (k)))
> -#define GPII_n_CH_k_SCRATCH_0_SEID		GENMASK(2, 0)
> -#define GPII_n_CH_k_SCRATCH_0_PROTO		GENMASK(7, 4)
> +#define GPII_n_CH_k_SCRATCH_0_SEID		GENMASK(3, 0)
> +#define GPII_n_CH_k_SCRATCH_0_PROTO		GENMASK(6, 4)

There exist protocols, such as QSPI with id=9, so this surely can't
be right (unless there's another bitfield for that?)

Konrad

