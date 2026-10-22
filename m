Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792655946;
	b=X0SNRpA6Yiib7bPVSDOVezg3Zmn93S8aht1rSeeSU9DL6RAXimA5FAQsDyVAQEf22chI
	 pk9iyR1WjAnJQ329h2PaB/qmQrBrJamjOlaw8lariT6SiZSyJqXlM+OT5zQeqPLcHNaaJ
	 4Uvwj7siwB50wz6iDAwLir9tL63UWo12u7OELK3ZKbFY5r28Af6QB7RYepA95H1GHAB61
	 SL8HcPtPspCMxeCQoM0HFuH58n8RSf/iHJrbxDYXcIiksy8h0HFxJAq9z2bv3oZ/OoHtW
	 Yof7WEjU+kyhuzxdlFqv79nDS2DD43YS4bTTjUx9MR6sXUnbXBCM5BX9v1h4WfVXjJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792655946;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ybAZ3/nU0xBNVzMeDgHkYwoCW6NCybkiYuUlwpUJkhY=;
	b=NdOQFZUaBt66sapuY2/16SBCAIHCMmDTpvrK3j0CXOfL/7ZSNlO6+rT1uLH+0e/k0YM9
	 2dl1KpBQMg2b2aKAND9PzCEbDNeOvOLrtazzKXGCqZD2nsMpK0jyvQ55wL+pLo/Ese6c4
	 RFO8RPY1niY56AWIGoRSOe8B3DYIXgZRlicVwPXnMXmJjpVcGtSrdbxVV7HM/dqqS3ft/
	 PZJUKkPaGwa5OLpQfuL8x+qlK34NlAHs/kVvV5nUYytkmgnsSIL1FnGOGCcrfbvBdEHQA
	 PQ/kwzFdiSA6iqrQlHmg3VNGfNQYou9C9fvFzxwK6F04Xjbgp09pwm6J/j8n0Kcll3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mVCHJWYs;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Se1ay+r3;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B1E606A320
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 07:59:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80B1E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mVCHJWYs;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Se1ay+r3
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M6xxmK1560220
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 07:59:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ybAZ3/nU0xBNVzMeDgHkYwoCW6NCybkiYuUlwpUJkhY=; b=mVCHJWYspS+BVcex
	/WyiYlvytC76b5pQN+tQBl3JiwphHifBZksIJY1q/J+ChX2eQ7SkDu6NCvKTqkKk
	2mr4ZSZx3Ud8WEDVzfSHcAPiPyXj4exPQHyRP7Uw4kUy4R20YOGfXG7DWDcCYTKi
	reJL9SR9GiEOpVDUvvqQpvi/BZJ/HsTiUrKGHPMR+arUrqZ/ibLuWks/8OImPHYF
	TCw0Jgq6syF8xqinXZmiWyUW9wjsuXLhQwD9fnBzyG6VS/dlPJ/W88QZE2Ktr/MY
	pjSXlPcI/FZnyyF5k5DpQtnD5gYq87WaZXc5dMzLD6Mrjpae6+zZAw2cTcXegbP8
	W3Iz4w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93ahc07-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 07:59:05 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-934a8cd3a8bso20973585a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 00:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792655945; x=1793260745; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ybAZ3/nU0xBNVzMeDgHkYwoCW6NCybkiYuUlwpUJkhY=;
        b=Se1ay+r3gYDWGA9J0x1nf8GXQMfBLWPJuXvPT2C/WRDSj9PliOmeuXjRONfCi3L8Tr
         ncdD4/DYWTGuElSpPyjN9HtQsy2sNRg0xPgDMLXdieWWu3SHBX9+VSY4UbqLPX4S4LmK
         STX1TABTz8Dc7qKl8wyKYauKIRNYaxmZapk2qmheBsdXoZddruPw3S9UGj0oRNXce4z8
         gbEBSXCfWOZp3LC0H+urzcpFp639vOzIO93KAnBvIesJCzQsDeySYQUshGdwBsNjpzwO
         GsifFC+u4TVDtV3dC1wnGUcsyVVM5q95csNi5LN/+tsGcGgt3xscdaVy+Zu0UrnzJt5y
         TUkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792655945; x=1793260745;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ybAZ3/nU0xBNVzMeDgHkYwoCW6NCybkiYuUlwpUJkhY=;
        b=hEnBaT8RJFEZu4yqdp7Gkie8ZkgJ7RSxyrONndXkOcdroqxTk/BkxRvCfy9cR3A7eN
         L7IxRmP5gSwwtOdcJHX+yY0vj59v+s3ttBVcojgZm2/Zoirtd/USIezfCHYgGpWMpTtE
         +3JWSLzLXx42SJ9nJTJUi6Ou0NVAa0loRLDIsAx4xbrDJAog5IDCHcdxOJ6yuFGROhk/
         k1g0tZMkkrORo1LpW4yx2my/uk3R4u0c5iOysQHDIP4Rze24Y1F4/02AJu5R7bkBXMCj
         D8hG6Y/glest4FUIQ4l7c9leXlUUQriVf9Ijj1ecSvGSqHjId0JfYPI8VNue0YNvRdp1
         dekw==
X-Forwarded-Encrypted: i=1; AKwUvBwZU+dD4xQxDqjaI/XNaNAxvYWNiVYkkXmftD/JaHRhKnNUlnKPICde2t0c453JJ5O4be0/CTuxBBK+PnSd@vger.kernel.org
X-Gm-Message-State: AFq9FYL8egfOWEYYzcCzlW2yMvnPJodb0hjm7eSA9RtpcRf0Ywuawava
	PbH7BCXCQv+S7dO0EE5TcZYV5huziKV5KVG6lYds3kPnArj8l5ya+w12f9lHJYq5SVSzWI4SRX8
	UyG3Gu9N2si223XJDANHA2m6LvNs3X7QfBlf5mCdpDzRsQAWaQ9GYaVdlYM6fTWtpiFt9
X-Gm-Gg: AYBFou2lJ79V9oKqtzROa6ASM3KnL4GZ1qegYOHq45OlXMnH+BKC5ZdpMWHfXdf5jD0
	WjuYy+TPWam+QB1ywdsZxnOiBCYXlSn3fWQo+GbOic2Zhkm0w3Q08uw5M2Lf9fbEvHx/8+l4Css
	pk8lJ7R2ZX3zexHCBOghZ+y+lTZG2noQ58Vebxti+fcUqVCzK9hAIAisAJd9KjXYnh8LUo3CaL0
	OmKod7bBv5Wc3GM3Gw4gfwD+QFwmxGCcI4GEMj6z7SUInTQh9edCAiqIH7eL9KA2id+pqMALztB
	Vcz8+Asn2MQQkidse1TsBUc6GJxgeIcKedj/cy2tKoDSf+WvdZEnALxuCUDAWRmLtpyY7l9PnHF
	LYAoQVtBnbe37kNVJ10YXRw==
X-Received: by 2002:a05:620a:4511:b0:93e:6d87:4f69 with SMTP id af79cd13be357-93f57f3bf10mr963760985a.3.1792655944772;
        Thu, 22 Oct 2026 00:59:04 -0700 (PDT)
X-Received: by 2002:a05:620a:4511:b0:93e:6d87:4f69 with SMTP id af79cd13be357-93f57f3bf10mr963758085a.3.1792655944376;
        Thu, 22 Oct 2026 00:59:04 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a50b2f8sm79996666b.21.2026.10.22.00.59.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 00:59:03 -0700 (PDT)
Message-ID: <d8279746-7abe-4dd4-9eab-8137d2da19d5@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 09:59:01 +0200
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
Subject: Re: [PATCH v2 3/3] clk: qcom: camcc-sm8450: Park the camera RCGs when
 they are disabled
To: Sushmit Singh Rathore <sushmit718@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>, Abel Vesa <abelvesa@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Vinod Koul <vkoul@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261020142157.1749-1-sushmit718@gmail.com>
 <20261020142157.1749-4-sushmit718@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261020142157.1749-4-sushmit718@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzMSBTYWx0ZWRfX/MSzVp96Uhy1
 ipeuSsI6k2+G0rRrH01LrswhZauyGMjHjldsnHglub6B9r/IipC/byTQTYCf+2XWas5R54m9Ufk
 Nn4BT61goCH0JTB7QP/UwPnQTH0Grrjzdvg6otU/YXHet3tdhFG2I48r+06gVgXLJb9eZsV/rVK
 d4tLlj2e/emLuRKZagSvjS9s2klchXsJPGIxDSa9S5k6GrYnw5eRR+fjIyW01skq4ugq+9FVVKk
 aW2mmp9ukeTupr4RasqwFz0K4i22iDzxZ0VKoWIGbcIn6obtc2G3783HBUZwFdvhcG6KejaM68Z
 wfOnQP4cyctUTSG2M0uUhztFTSLTNV0ZPnGjKXKYUN3YFd6cG6lbOzGJyDanqqtPhNmeaEJgcti
 31VPOlfN+Du0JsYwgrRzCFIQdoe4XytIiBg9RXc7Ue2Sqxi43vqe4WvZtdkPMkYiEXxx5Tlcry+
 b57x9ZRzte1G4iqI1CA==
X-Proofpoint-GUID: EHAyKYVddGY56Qwed_KVji53htzdQkDx
X-Authority-Analysis: v=2.4 cv=feg4WEQF c=1 sm=1 tr=0 ts=6ad9c249 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=eDe05lC2xiAZV-bDqWwA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: EHAyKYVddGY56Qwed_KVji53htzdQkDx
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzMSBTYWx0ZWRfXz8c4kfPhddDU
 lPZP+yIVYhDpDLANoUzqcWcdOQ/JGdgYnp4J8WKHl+/j0rq3dCyBfrYg3KusBeX1tmPHk7Ws0fX
 KOpelDaXosAcBIUFCeRstZwyVRUmlC0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220031

On 10/20/26 4:21 PM, Sushmit Singh Rathore wrote:
> The camera RCGs use clk_rcg2_ops, so a disabled RCG stays configured
> on whichever PLL it last ran from. When that PLL is turned off and the
> Titan top GDSC then collapses after a camera session, the SoC hangs.
> 
> Switch them to clk_rcg2_shared_ops so they park on the XO while
> disabled, as camcc-sm8550 does. cam_cc_sleep_clk_src runs from the
> always-on sleep clock and is left alone.
> 
> Tested on the Nothing Phone (2) (SM8475).
> 
> Fixes: 6082037fe62e ("clk: qcom: add camera clock controller driver for SM8450 SoC")
> Assisted-by: LLM
> Signed-off-by: Sushmit Singh Rathore <sushmit718@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
