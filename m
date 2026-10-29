Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793263651;
	b=goKMgxoFsbOO3rhq47iNNL7eQ+DblXdb7Jt/NJEdzKoRx9VmugmCJlXxuysVuNoJGPEf
	 6VbqquvVKXE6NFU3Q7Ivsa+1stjgtV0AEzDR7haSIPBGfDCHlLd9L9fdURR6oXuqovSkx
	 CO+csDz7QbLRsqR39m4eg7oFvYAcekCTdK8ePpM2nIVA9sh9y9q67wg+mjnoS3rltbsl1
	 BFnS4aA33qzD4YiIf8sHF3v4qDpcZEZXLETnaibJNsx8J+vOo19cDMK7hHfYxjovxPB6m
	 FVzvfUhQYoKOh8jynKgXo0bUx2e7isGBr3QR8jgp2KojmJPlFWtfqK1sbwnAniEy1ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793263651;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=D76HTO9lfNBVTEQWZLuujhsipMwGBK+YZR6CO3J/B+k=;
	b=yp5sGo0+n0IC+udPLp1JAkUV4uq9LvRVaVPLK8vV0DVv5oUCdp/pgC8bgOXeIBEIgXlh
	 EHeH4206kU0oiB2hWmXPoqpPtR4JQLt+wNJzt4myDUmkc7OZZdxhjUQ9WqmqWXMNEJojR
	 Jozp5VcP9/5M7JGxQRuGNSzzD1HPkN4Nq00u37v6AYsZOqJ79qsv+bNMVMuEoOagCb5uM
	 wavdV4scV23XnWJew3ChTonL/t6454tQ70eFRXD14OgAJPa6twAQk/tCXlgmdBXiHftpp
	 lRKcaaf526TVuPdzPgnHilfrTbS4d+TjeDKYjq2eMkwunktelX2O071Vy2jdyDeDG3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CPcqZhJT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DU8VKrtK;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90885606A31C
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 08:47:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90885606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CPcqZhJT;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DU8VKrtK
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T5HIPG3889832
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 08:47:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D76HTO9lfNBVTEQWZLuujhsipMwGBK+YZR6CO3J/B+k=; b=CPcqZhJT2wwmPp0O
	gvuEwkBP0PFNw8EYWeesy203Iy+BXKkxUBVpqIfS1ANsAcAjqsor8CrpTve9dOGp
	NLKnct3f3ma5i6K5BPfdT8isxE4kVvjvS1fE2WprBRcTvXI/zYhtU1eGq5gCJ37F
	VH4k/n/dRfhcXtS+ke+S7k52aJhGQwVCuGw5No40ihIke0GS3ytF2+fS4VAsRwI1
	tXcrBgu9tlowR36RkyTkG/qMRI//cfMnpUejm70Fq1A9U5U5NyhcDOkb/MUm/TzY
	4rNQO1u/f+u8jN8aC3mbn0iGxGHP+yZqFBfETEpE0cia0T3Ls7EAwjSWXRkOC1Fb
	Tges2A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkpmc2pjy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 08:47:29 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5338bd59032so4887821cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 01:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793263649; x=1793868449; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D76HTO9lfNBVTEQWZLuujhsipMwGBK+YZR6CO3J/B+k=;
        b=DU8VKrtKKYdUSwlhPozH2skTy3uAZvPuQ+W1V4ThT9o2TEHSNYgTIHM1jzlcvE6O1n
         xPpYNoo+ghjUjic7OFXxLFFh2juk7qjNmUB7OJuP+9Eoa2+DjTvgLHVY/5HVDkxxOnNa
         au16Qbrfd8S5+rnbn2BvsGyX/xNeUVVQzCDMXknUjaLgaSovPXWH++SMm8BLEumIEh/0
         yssgqDYg+3TOhVMQIvF1h7fOMU+ceEWPV1Of/Ip0LeaQOyKZZ/hcEiGK6ntawi6wnllB
         frdlE7RTB/QAnwo496L7X6j/7920dDRGWkWBw7Ae0GxjXzBLOae3P92HOXwLnNVxJX6b
         NL1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793263649; x=1793868449;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D76HTO9lfNBVTEQWZLuujhsipMwGBK+YZR6CO3J/B+k=;
        b=ud9ZB7eq9KdvtUt4Ux17RvVtyVThZgkrpqDsnW2aIbkNd0Rkgd01iqezCvn2Dh6nH/
         THgXsao7lIRtbop7rwiT4jX9u8iNWPfu9FlZNOCHxcPMUIFaOO1ntiZ1Dyby/aRiDo3z
         Huudu9YvZwKWjff/92Ss8u59GH75VCdcNfkGb6MeoJiEbWoeHkV4+/jMS8dODAe68Kqb
         CMj1BO+gej/ERKTUx19k2okBvg/tfo5JJoP/cKHoxBEVQhpfTUHthbsInStpruVVBH4v
         2Kvk+gR44JI3ni+ASSPhubXyF3CwCE+5gLr9t8A35xBI7WB9LADV4U35U8vrm0scMYkf
         WnVA==
X-Forwarded-Encrypted: i=1; AKwUvBzojngaNAAopH8WNDcWYXh4fj2+Kh1GvUhHIkVxMqZ3Uzf8GHEHvkDIhZVBA4cJG8HkwZIdSp6d6q33FCM3@vger.kernel.org
X-Gm-Message-State: AFq9FYKrXumovlPUELV5EX+jiiU9DJPq/+0VfMfhaGnqVGdYhL+kBqf1
	mUsMc66EFLI1E2g1p4TdOvTZsJyiGaKIkr3+Rm79JxctPN1v+1am9MjpqdVKIhsbqKbDeBIXg8c
	+EGlw4Fbygn+zwZ+JaDuUNFz6SnKUAQZ2SuI9IYY/Gk3cKg6MCxSC1aI65A0q41IFQJ/6
X-Gm-Gg: AYBFou3wNT8hSR69ez4oXD1Xzf30i1p1fhmi+HcXmAx/vfA4ZtOcAHIwpydbePYRFID
	ckzXnGXV/bFKxjKfxGGx6WtiDNs0JiHgit4NlLXDDQA9i97CWCkagQ3d0htg01Ngvi0G2kSrhUv
	C4B+IXNPiRlqHPgcMdoBl9d09wqk2YrZfkJVObrzuBcwoJdKpN6UTI6Tk3UW+2ldIblVYgfw8uy
	WhXSdyus+ATJ7H09+lfVidT/QwuP1o+qXnjueR6zo4UKffUa5j2BjKMlZ/mM0EPTANlCDLBwYH7
	+1m6pCGIuuPdnn7qPwcuJm020CEKNQqM9JhaAYcuwXmpddzbEfrUFk76JYd6CG42cxICdNuClQD
	ifQMaiz6P5GcwNWFvEGAJ7qFGrAh4u1jUbDidGRGkaW4w6iMaxbl1TsNLlZJmzPwvE+4ePug=
X-Received: by 2002:a05:622a:7a8c:b0:536:662:3776 with SMTP id d75a77b69052e-53fcc0d944emr91974221cf.3.1793263648856;
        Thu, 29 Oct 2026 01:47:28 -0700 (PDT)
X-Received: by 2002:a05:622a:7a8c:b0:536:662:3776 with SMTP id d75a77b69052e-53fcc0d944emr91973901cf.3.1793263648171;
        Thu, 29 Oct 2026 01:47:28 -0700 (PDT)
Received: from [192.168.226.64] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b496459f10sm2495969a12.36.2026.10.29.01.47.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 01:47:26 -0700 (PDT)
Message-ID: <6eeacfab-95a0-4352-9c89-51a374408091@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 09:47:23 +0100
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
Subject: Re: [PATCH v1] arm64: dts: qcom: eliza-evk: Fix M.2 W_DISABLE2# GPIO
 polarity
To: Zhiyuan Sheng <zhiyuan.sheng@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        cheng.jiang@oss.qualcomm.com, wei.deng@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com, xiuzhuo.shang@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com
References: <20261029084203.2674083-1-zhiyuan.sheng@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261029084203.2674083-1-zhiyuan.sheng@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=X4nHu2Te c=1 sm=1 tr=0 ts=6ae30821 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=A8FiRQsTqyrrzY21g8QA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: KTgJ-iTeAZa7D62bo-hpttd-0pmsLh52
X-Proofpoint-ORIG-GUID: KTgJ-iTeAZa7D62bo-hpttd-0pmsLh52
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAzMyBTYWx0ZWRfXwm0TZUQF2J7z
 VIonk+rwvbb5cNjqqGOXNN8fxrTsVvaZdcr0xhin79oF9uQhcGQrXBBG7AtH/N/a1jf7dEP7QWU
 vgnq5dipvtIDf80Vbc/RDNt+Nxwx8PmYO3o0eOLNhcl8e9wOaeRB+wxxX1BYE2kVMio61l9HgMZ
 Tfdfcfa6wE3x3vuemki46L2Eh/3gnAoe0fUMgWInq85Hh+aS2nm55AW0MiLQzb9AaEDYKFPnnTE
 SyaziuGZHr0kx+Y6YslqbEcZinTkDW6olkiX3fgjgepB4i1bSE38p7SXXZinA+OXatuS1PntPB2
 +eeD9XKACYx7mrrTAPVxvwRW5Njh5+hw1MwowuoWMLHiFmG2Sf6XWCUa2Ln/DTdzO2+g52UwplG
 X4abg7+6QUpQ96CeRbTLnzSdd/PgBgMCn+w/red9catbVn7DpdbY3JjmGiE7/uQmePWV1qeHg9L
 qU5QeuYYAi6W/ILqVjw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAzMyBTYWx0ZWRfX314mkDwRlLNm
 IkKot/hO/RFWwEt0hT1xlEcgc/Cz9u5AEqaFrVPushvXITAJAjCmpwvXRP/t67/lBfcoFCij+b8
 XqnaP/2eAXn3Eti3AV/24E6MkAt1uRo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 adultscore=0 suspectscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290033

On 10/29/26 9:42 AM, Zhiyuan Sheng wrote:
> The W_DISABLE2# signal of the M.2 E key connector is active-low as
> defined in the PCI Express M.2 Specification. Fix the w-disable2-gpios
> polarity by using GPIO_ACTIVE_LOW instead of GPIO_ACTIVE_HIGH.
> 
> Signed-off-by: Zhiyuan Sheng <zhiyuan.sheng@oss.qualcomm.com>
> ---

Fixes: 073c6a891eb3 ("arm64: dts: qcom: eliza-evk: Add PCIe0 with M.2 E key connector")

Konrad

