Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A92F48A2A9
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 16:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787158085; cv=none; b=FMyeLGQQa2qtwVOvcH0po6y6I1gLwX7qGAdP0R2JG23EB8fdN0O8kZihE/UFRFQLU0qflfOq44nX6SkMsdmVYGSaJnHJeJbACj2TxsmNuNRAZAPMkwGyenNeiauXLamuSd8QcYBbVa4CDbFQ53XFdvTsMvVaXNJVdF/WRGQsO4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787158085; c=relaxed/simple;
	bh=OVCPvZKaB10efIxzk3Pd6ZRQ4K9Dv+EUbAgk0/ow4/o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PMi5Ya+oGYLk3V0FfE68yZ6YjSZ8ezLSQIa7QWinLIxVOKn8eOriFuXWhqJQAjZAIZPiKgCThj4SnG/8wyIoqKQv42d7SAc3ejVXF3yIte/NCNSpMSAUP3VB7fbhwx5/L2j0NX8XAfuB1/cNOs5vJxoiKgyRDIBPIcrMuBXiPAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YXa7ypjX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DDIo1DmE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YXa7ypjX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DDIo1DmE"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JEbQdL067627
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 16:48:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fNRwcfPTbJlPXucD5fNhFZXhOkEahzsc8J7wHk7uRFo=; b=YXa7ypjXyfBKg03o
	SyXeN1aXD3tyXDQYChqGm0KefqXHCtYj4N3J7SSjieliRVl/UCH2ENwQKNVY1nob
	5tBSv7UKAOQ3y4gDhOiH3yfuCNNZH+XvsA/UJYpZF7msuyClr7E21/p48pySZ73K
	ojk2Xk37tRyEacqCrxUkegG2D8984s4bxI+StGV+DB7viauftc92vYqNqApMj0QM
	4SD2hnv1fDLD3ZHdOmcAUU08OKJBF9mSbxFG7Iqa/M++zU6pcZQEsMnUS2XjUD9t
	YEBPID2mQMidCWvpOW4pn/PU3wZxlphmuaeSJyPbogvlYSwK3HoXQLxZl3Wey0KD
	BBubyA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5e5d0st6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 16:48:03 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51e9d892f0dso3353851cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 09:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787158082; x=1787762882; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fNRwcfPTbJlPXucD5fNhFZXhOkEahzsc8J7wHk7uRFo=;
        b=DDIo1DmEuli4tjou1VWwIAgUCkcD4hHBlgIyj5r3dJh0cCzfloYqEsUgVpJMKLnd2y
         D7O0TIdLHWW207ZMI1N2UCP1cOepjZ8R7MdTxUa0PTvyW0NPUMl2/5eoaNcVd5RxarCo
         9ELfCtAc6zX5eTW4qbHAk1bROCUcgT/tFR1ZSZVDhCLTy38/VR26Ep/bjRNaa/Occp8q
         C5TAxf+JW9n+v3sBiL4HRL1zDVP2qZU2G5UpaTT5AwhbN7EtNjvJJhWLcrcG7ZCCeQs3
         lsEPwJCFbs5EswlURn0d3Uuage/ZjuQi74Xh/gLifRILXMNmoPu5AeA6/5FZQ2Fpj4A5
         D4mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787158082; x=1787762882;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fNRwcfPTbJlPXucD5fNhFZXhOkEahzsc8J7wHk7uRFo=;
        b=iH2KHZaAtjrHxKC+bWdeQxbT7p78v/avPw6hJUo4o9gsvID1d/djRgTIrRx2gMtMw4
         vWLpEfgKwFIJUM9QmDO2RLeyGerXGkU2qvOVPV3lUuUnDG+dum+aiDYDTHJKmORCmrk/
         7HxLsBtfVk0iab68dxiAPUkM7+2lmDPca/bAEPOQMgn/K+zRlkWGQvA2nawEEdM3e0uI
         KgouaaFdku4B3ZwcCge9gHSnn8kG5QFR/wkCeoTcOZwC0rJfDStNX6FZe3IzFkvPxeNy
         mKst2r8++Vkt3upCaCYEYnzO8i0JHmwVQVi/rQyrCwl4corAAUAdbdaLlBVw4ed/5v83
         1X+w==
X-Gm-Message-State: AOJu0Yyb0jg6whB296HtuxJBYxAvK96FXq+MR0iMCCG28I6sgfOJPsBv
	H0F+Q8dIhliW82oKUwzZGkr6p1e7f4ZnIxAV5qxofpHal/INUWOtuWjSNo6CZORzHNC67ql8lTr
	7pt2j+ugVyVRdhIopnSAldZBd9xcJwiZQZQiIC4Ha1M/xg89kKm/Tn7vj/BuYOTrxthSe
X-Gm-Gg: AR+sD11eevlEVoG5S4KezEn4zMZtxjelObHFZz8MEv//Zt58D1AFTa7lNUKj85tLoM1
	4Kftv8a/Wv6n4S5MtNAtaBqB6ADS0JWiA7qJgrI47jQ3GMky4odD1e6PHeIqhjkGbp1UXM3t83N
	ZzT3j/rJMFBzXFEoLQ7YUUreQLKZk+R/X/wCMFpbcWTpUTw8xgbM3RaiprLmjsTNs3OkJilLJ/K
	mnpVtKC6TQJ0DmGn5cnEw9MVKRzOY83GOXZiU7eOk1e6oa4bFcXt233IqyB4PUNWdqh4PoP8DPu
	S390eMg8OZWga7z/+F2WiBmWsUyo0NXdyAbClI7KKIwY35StKABCJw1qIsadRbvfOd//OoooOU9
	dZZYOZs4aFhFKFcvsqVMiaY9/
X-Received: by 2002:ac8:7f0f:0:b0:517:6162:daf5 with SMTP id d75a77b69052e-52dd5c958aamr42762331cf.3.1787158082554;
        Wed, 19 Aug 2026 09:48:02 -0700 (PDT)
X-Received: by 2002:ac8:7f0f:0:b0:517:6162:daf5 with SMTP id d75a77b69052e-52dd5c958aamr42761771cf.3.1787158081993;
        Wed, 19 Aug 2026 09:48:01 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3ff0d5f70sm1234818a12.13.2026.08.19.09.47.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 09:48:00 -0700 (PDT)
Message-ID: <09835b63-ab54-4a66-afe2-12f07884f615@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 18:47:56 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/16] arm64: dts: qcom: sm8250: Add GCC CX power domain
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260819-qcom-tie-cx-to-gcc-v1-0-840034124e73@oss.qualcomm.com>
 <20260819-qcom-tie-cx-to-gcc-v1-9-840034124e73@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260819-qcom-tie-cx-to-gcc-v1-9-840034124e73@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEzMCBTYWx0ZWRfX8AHhuUthG6tu
 KhuxCsDdit5jGwkYgF3J6ejc37O7RLxMnFJ9TiFYo5jGVvSQjcHF9TmTBhpd3TldozsCs9HMB4E
 cmHsiCZjf637FZxkmEF2RBq5ZFlsVevLFN1P0yKSHJwhF0bPzd34iu+asBnjS7mhGuVFpCrStlx
 dOx3RK1HayEYEYPLI4VDjR8GXJA1XH1eKasdu/t369qb7Mjqv6cX4zSgjZLyqKwi6AG2TLagDAE
 ntWuz+m2C9j90DCKWb5whUFvmxDNfdL8rmT/ZzNx26VpKswaBd8QffXbD0jwTnUgCKkwjdnu50f
 nw+ybtksLGGBlcBYrNUrrtIV8pp4vH6PeLU8gGdJA1oxe5ElkuUHEGAnzfkit9TtuI9TZUt61Cw
 jEA7oXICaPru0v5X9zs2qg/sQWdTLjhgvFXitISo3rGlgpuJEoWF6U0ha6mirpzG+156d1Zl3zQ
 65m2Fe38yeSiiP0Tpug==
X-Authority-Analysis: v=2.4 cv=cuOrVV4i c=1 sm=1 tr=0 ts=6a85de43 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=nJhpUYXR7LpnGJmJaegA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: mpwlNuPreBTP_JKWs-MQ81qE09b4rhFw
X-Proofpoint-GUID: mpwlNuPreBTP_JKWs-MQ81qE09b4rhFw
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEzMCBTYWx0ZWRfX9lXlcXDdbWWz
 iYfbt7FgHL9CpPQ2eBkiC8IlmCompWdt/KihayQzZfhmFzsJtIT8xsySkQ+NVL2Lpu+JrlZtAQ6
 gYf0CT3nN9eLWH16D8HjBC+pMPZH4Bo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_04,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 suspectscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190130

On 8/19/26 2:51 PM, Abel Vesa wrote:
> The GCC GDSCs on SM8250 are backed by the RPMh CX power domain. Without
> describing that parent domain, consumers of GCC-provided GDSCs can enable
> their local domain without causing the required CX vote to be held.
> 
> Add the CX power-domain reference to the GCC node so votes from GCC GDSC
> consumers can propagate to RPMh CX.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
