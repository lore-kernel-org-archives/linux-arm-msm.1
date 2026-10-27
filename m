Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793094577;
	b=ubBpK6Ft70RliTVKcwCB7b90vf6IoH2iq1LGgjPf8lUrX8BTr/iYJQd77qapekeYUgQn
	 M3sjyZEDBquztossQfOEYKsCSo/5jfDNDZxMxNMH+K+x0t+/mlg4exyS/nIcc1Ze95GG5
	 E0VUWyLemn6e9e2ZOWHn5iHSfVKL0tCq2oxy0GHBNi2Bp2MGFg5G9rLaACXk/RqZj+tgl
	 x4Z0sDAvY71CKu3KYepf52PzRpYdW1A6Tupn7vboXdnlWsb3ItUw7+ZyX9yuexK5XUDw8
	 GJOvVt5veDZmfH7Og2v1cBkWQ2RTf5XrwyiykujJKkuy3h8W8qoEEWPX5AqOPAuhKVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793094577;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Jt/QmsAqJV1uP8PozVMgbYsAMzltv04Ri/WJZgPNi+4=;
	b=3AnDLQinFoLjU1WQqxjCoqF5VBLm6RkXOdLH7luMl+qdf4mlj2nIQIpEtXryKL52Y5kW
	 l0X3VEw0eNIyKpclEWaEIeVq0bf+6pLSaqCg1aRjL7W6td96It0arr7Mcj08cIHzD1qZV
	 yO+bgy2kxi6xrlvIKVyYTksT1Iy/FBglH7yqwvbWX23WYOyiQZHT48/MhezyEgKrsds3h
	 foiD89E1vEvKuygLYB8hzblyh70XXLUF+rS0jevo1u42Ulw3vlreYfAZs3XCTOAG7MZDk
	 CYT0SqaU7t9dlNjETFQAXCn4coUa++w/YaTqI/TivuvoSrRkQrFGAOmsS9a9nvZV7LQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FP0sJ7tE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Hl6NNdQy;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E01E606A320
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 09:49:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E01E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FP0sJ7tE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Hl6NNdQy
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R8g6aK2761011
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 09:49:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jt/QmsAqJV1uP8PozVMgbYsAMzltv04Ri/WJZgPNi+4=; b=FP0sJ7tE4x9HyrGl
	jFkxQXdqYiFLQzzSGStG49wobrGZ7NF1p3Aba6esfC4PTOoKrQSeksTrz8pogcUc
	MToInCj7y3yt7Xe8gYyPSBJKbII2eGYiaG69direbwkZWcdtSJvXYsRvw6J1Intd
	87Buv7yDvfQnwlU6zi1sEo56b918cTiEvsRu5fI5p8/w2J3OV8Bqa8miV/LQWYad
	LyuLM+zow5AupnviLSNuBIBLHv5IVh+7YamG0+d3wai3hpZbWCCcyMAP/LLkHDpJ
	HLXwMcfsoFBUv5KZMZFNEgCNdJgRTq/lxY+kaeKXDkZCrME9qWfcF8R+gj3MRhGl
	rOWZGA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjh919u4n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 09:49:35 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a5971cf7ceso2400531b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 02:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793094575; x=1793699375; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jt/QmsAqJV1uP8PozVMgbYsAMzltv04Ri/WJZgPNi+4=;
        b=Hl6NNdQyuH31wKXzChGGoe4LJOAFWnl88VpMkQE6yB1fNU+UZk+choE7EhbjIL3VO2
         cwRI2gE354XDtJBbspbOdbe+xZ/Lox/8Dxwg/kOhvoNnxcW+KqS/pr1OZZN1xHXDDuZr
         YJgZpGMM8Fc+5OoRGfWuISeX3DsqHTJi2XdM8nCJV7lpjyPibXrKLCmg1ZBQfdkujO2P
         mXof4GFBMYTLwb7jyJuGSsgkuTxf1MkQP3kI4iiu4DKhq88D5RGyKttsjMTZoh0j4f5h
         I86rTFbqfwNreZWFUT/kDcQ9rRpyAiFmntZNOZMa/PuK8DtmxO7NrYU+oedckilAo8I8
         vHYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793094575; x=1793699375;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jt/QmsAqJV1uP8PozVMgbYsAMzltv04Ri/WJZgPNi+4=;
        b=CmOhugnRomjDC0jeLL2Uyt7uZNM1F9qpjZPo6TpP3zFSHd4gsXOOH+ofOJp4Iy0sIP
         eMmiuPYMwft24VftjRaCGaSJEz5CrU0pmBRElegiMAHtFs+Q2Zv4pNaTMKdmsBrXCLaR
         7qaBeI3z+VSzUI788pLm3NynB0Q58E+bG7qp4joypB/Ql4j7ZnUrrnBy9Ih4nNlkW+Ia
         KZcdzozdQWyvrtzH2po0iDeAC3K1z8dkVxHZDQn+vIoTf8p4ijIO+zLLFfM1Qa2GBgPX
         6R2HI4zCH7ON50l2EiYHItGTuPmuR3nv1RXsKVBCZDIleARnupU5KzBA8dsBb1gnpx2n
         ufVw==
X-Forwarded-Encrypted: i=1; AKwUvBww5QuKOaVW9QjEqsauql0vdRb58TClyRP14dEPaVIgMq6wrQQODfR+LRU4exi3//Sc/b8Lv5DFFTFXDehR@vger.kernel.org
X-Gm-Message-State: AFq9FYJtH9gBT6zeQOmWbZG8exBZQ3MlOUpH2wFv938wUZbVvbPaI+sC
	XpUEQiTFFISvAjPj8wUvn0r9DaAdsIuEY3Fvzr0G951jPtPPmzZ+pldttusYLRXl0IBCONG1kSe
	ISlZUkItUWu/VS0LPKww7mdStWnugbB7Qti9TaXRSWUvNeK2hW+cIc/ZEelN+tY2KdNm3dCW1rl
	V6
X-Gm-Gg: AYBFou04Nb2t4KRL9jLmWDIU9ucCXq8g4xJyq1sOhySoGiKV/hSG2uJTCc93W/cknN5
	k67oXA9hmFHjPqx6WEfvDLbFhRCCb4ukCln79oZ3BWplvjhuFJCtkbDHF+F/IKI/BFWjlge0P3f
	GPz6MAXAs0OyCtheuWcICd2J/aiJAE6SK73nyW8tufHqAmutX3dAbdEcbKHcysw8Tso4Irxqf/F
	6Yfp366ra/rq9dwZpHYCPtaL5zOyhyBWhM6HiBoXNYRmZOEEbgGvpplP0RyoHl4d06cCwYYWg2R
	SmP5zL3xljWgNQ2xhovX/fmzIzGhX/hxNKpJx0yjvDXobH+BXIWEIQSLx7utzFRhCL24aYeY9EZ
	3bxVFR7C+StUBngq71E2T3tU7JQ==
X-Received: by 2002:a05:6a00:1382:b0:870:c2db:da2c with SMTP id d2e1a72fcca58-8a366f6724bmr7261017b3a.25.1793094575103;
        Tue, 27 Oct 2026 02:49:35 -0700 (PDT)
X-Received: by 2002:a05:6a00:1382:b0:870:c2db:da2c with SMTP id d2e1a72fcca58-8a366f6724bmr7261001b3a.25.1793094574626;
        Tue, 27 Oct 2026 02:49:34 -0700 (PDT)
Received: from [10.217.216.29] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a36c0fdfefsm2076232b3a.50.2026.10.27.02.49.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 02:49:34 -0700 (PDT)
Message-ID: <b63a7285-88cd-431c-9d66-98abd3ecad3c@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 15:19:26 +0530
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
Subject: Re: [PATCH v2 3/3] clk: qcom: dprxcc: Add Nord DPRX clock controller
 support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260924-nords_dprx-v2-0-fa4364e087ef@oss.qualcomm.com>
 <20260924-nords_dprx-v2-3-fa4364e087ef@oss.qualcomm.com>
 <7a6ef006-cb76-4e4b-bd31-886af708b375@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <7a6ef006-cb76-4e4b-bd31-886af708b375@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: u-Ov2pCBJy5_t0TLEgXJb8bV7QKnWKJ5
X-Proofpoint-GUID: u-Ov2pCBJy5_t0TLEgXJb8bV7QKnWKJ5
X-Authority-Analysis: v=2.4 cv=TuxzFzXh c=1 sm=1 tr=0 ts=6ae073af cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=EDPTx0FvkmN4Oe4_Fv4A:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAzOSBTYWx0ZWRfX6LUWNI9ipmvB
 ITKjgCyeu4RL3OcEiiIcvHIkv28HLEuk/8qwoG58zdFLuYLbI64IwFHjVVFi2SAGG+a7NVGbWVk
 ivFFpTVEOz3N7jO0Yk+tvyQ+lSqLhOti8qjUTF/tyW9sp74W+z7PmSItGYWiOIJMUOR8RrSYoZW
 SkqQ5DJpwOl5Sq7TGc17T5tqCbEwImhhlu+iMURE3hU4i/zfirAwTHpQ2RIqbuJ20zgUawxv9Jr
 6SZ0tadHaVq5hooKtgYzejmINHFCQ+jXSKAP8VdTxLoj+pHIrhpMWJcby17Yw71NSekV4PapiMf
 XfZhe5/B7q6Q1PRMzjI40vjS0uy/q7kVyeVLyBmkdxjWoYWygSzcpaWi8BzwsISGLA58eeqnbCP
 1mI4p+7CKPHKvOH8Gsq8kxoH69qHthFD64UX0ANRMbljFDSXBmzd+FEjrnl2nr+eHFdVxXmmeEG
 NAULRaeyV501NjUezXg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAzOSBTYWx0ZWRfX9mWb4X/sccmo
 q5T+Bgn4t6fHrQYSJGSKUIm+LqOpIHQVj5MMp85vxuep+uK+zTPZNc6WIdDVTb2BOP/VmXdLUIz
 LBDNX8abL17XCpK9G6HkvL14zw09sl0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270039



On 10/15/2026 7:51 PM, Konrad Dybcio wrote:
>> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> ---
> [...]
> 
>> +	/*
>> +	 * Configure cdiv 20 for core aud and 11 for core ahb clks of DPRX CC
>> +	 */
> Nit: this fits in a /* single-line comment */
> 
>> +	regmap_write(regmap, dprx_1_dprx_cc_core_aud_div_clk_src.reg, 0x13);
>> +	regmap_write(regmap, dprx_1_dprx_cc_core_ahb_div_clk_src.reg, 0x0A);
> Hex should be lowercase, but preferably please define some sort of a bitfield
> that this value is written into and run regmap_update_bits()
> 
> You should also set `.use_rpm = true`

Will fix in the next patch.

-- 
Thanks,
Taniya Das

