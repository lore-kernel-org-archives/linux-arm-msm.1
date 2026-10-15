Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4301D4EB853
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 09:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792055479; cv=none; b=MLLxlr+jxMNUMF7PS4IFLrybh7FD4x8jIY0lKdCBWB1nKRRDHzH8JPdHRKDFhxhu96mqtPfXRRQCrAa14Xf2sjVPafuHyVtT2INc2v7j13rSPu7SkJHdRHMHTEzyzyotSN8nz2CzI1LDW/QSQ7KYSnrGeRsRG/Zk7DnE5kWbg4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792055479; c=relaxed/simple;
	bh=ZP/V+XVDi3VU7pwiGc5G664R30B243PanFs9BryZBGs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ayxq8gP3JlMfNRqjSLLthbz9EyoW1vNIYoMDXW2jFyiJT5rGQxJpbPUxKLJU4TLfvApYRV2Ebm/9m/gYZtGHB8JPjGfmwpgmo27Y67C8WRovNwrSV3WrvSXZkcn3djWBSthuwKyLqZZev93rpGWtCVQTjpdse/V+gr2nXNPIyz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AogNQwqA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Giwaak3Z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AogNQwqA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Giwaak3Z"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F8aWmr841950
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 09:11:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WdtX+dyyVh6BP1HakGebp1o99ElPTtIZjQj7vLhLhyg=; b=AogNQwqAZL9D8O1C
	72ugis4zGLSjwVmVlHqQ1Uw00SWq+/uokvuCnwPJ4aB8NypSYZHZeJDIwBmctMpu
	6lNEHwWc0Fj/+qoWLhn0wuiomkYXSJ9ZyzwaAqB73hR4kFiUyjwavYrhCRtcfwdh
	bXQ2km1dFQID02/+ouh+RwxshawH7jPobd+xw+LD+/tLOx9l71J5cLA9NcXaS6JG
	E3fOykxNof2Ai+Jx//OIEpucs3aQpydwLi6seB2vSX+y9P1y3lNLc8JsYbnZdU8Q
	Fm4sRaxUSfXOeEqHd+WLyF8xXWXbrIRLpk5WStKRD0i2/7dFhMnccPSAV0z8q2go
	P0JDrA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hae4wu737-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 09:11:14 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5338a4075d3so16136531cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 02:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792055474; x=1792660274; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WdtX+dyyVh6BP1HakGebp1o99ElPTtIZjQj7vLhLhyg=;
        b=Giwaak3ZIwgCXsYAfg/Ypvhw+degn4csvsFTBl+9EYACH4u7W+Xh7heljRST6/mWsb
         jh3ptVnOkwSC6dir1M2TfTdlLMZh/wjzGRVmbcwVSwnDgSEVcOZ82wsWemIGmMKv63N0
         /gNyDmyn1TyaPd69cogGjkGkiR9ij4hH1EBKQ4b4gS1hUmidj4nGT7X9Q9KRlRRKqKvA
         wpSx9zeuUyML+sYFO6zkYy9ILweKjH0kdodqd1E7Pe9iX/PvaOx1o9naTdXfwKVaOrlN
         cZ7Vopg0nkNMCopWhraNTd8qvM7dMIV2JhAVesj0jLL+UOCKgXlwNr0VusO+u3s/wo00
         tQHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792055474; x=1792660274;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WdtX+dyyVh6BP1HakGebp1o99ElPTtIZjQj7vLhLhyg=;
        b=wdP+Iy3uuMSPTzJKVQTd5PU5LcUwZXRHI7+q5B8aMY99GsurvPww9y8Skloz0bMf7i
         KSmDLJX/7qxP3AgLA/EBG9hzGOJ5HsIpUpj47fTearrfxnrqfnnpdaoIbtWiVu56o546
         W9B8Q29njEVwdUQPfEj7pev8Vc6GzfXTcx+GTpkR25F7C+ifgFyRwfbEE1nHhgNTaZv3
         ouw9qMqLu4T2l9K0W4Pl8z8OZL+e4nriTiC+QJ+68jowkY23ua1qBv5fnayw5UxZJI1+
         NPQh3mW8Ky0pwgZYUx7tWatgOMH9vz9yS83bYEYXbe2mbr4T7mSAREGgGrhRfY2XbNO6
         DArg==
X-Gm-Message-State: AFq9FYK7R8UxxDNnbYZbQG7OjAQBz0+M7gam3VlO7WewLRm3bX4+n0ng
	VaCD/+iuOYWn1lcywIIAAx19+KXA/JzM1wTdmJMtlT5IB/wFc8u+54tqhRw+QMGc7mEbUu/EBzb
	8JgstfN/CR1/99stPUGALsIZD3MIiGBw4bkyfafF52+TkQKNtlOd1W3iwzzzNqqF6pb4Q
X-Gm-Gg: AYBFou3TPPbvjJMFHWUDzlu66fmROiWgM3xZk6JLID9vBbv/yUuzWoxxq4KqlankQU4
	NhV+d1ZBNAsoNHVig/1gAEoDyBV8ofFFo2aJQf3wsuZmsJf0RArn7I1F5zWHTJzAt4jBsrcnOe+
	P5dE7/Hx83DWbMpuanwzUTgTYxbkYALGxm3IcYJyFJUsyifYTnR6l7OP3Ormv7a5KDICH5sUFYK
	07+EpC/hgdz7VYit/vv5VVDzvXvFQGS2QmEtsx+UmVS7zMtVZsETXECWUllxA8OQ1ggQubUzZv5
	8d4pyIkUngqbF8mka3jp/kfBNeE5sxXTna9Zy5/9ure2/qjohVv/abqJwKb/1DM3iSDVFFJMBru
	cOEqHj5hbaxpxpwBo8qy01g==
X-Received: by 2002:ac8:5f87:0:b0:535:fd16:4393 with SMTP id d75a77b69052e-535fd164be8mr94188041cf.5.1792055474086;
        Thu, 15 Oct 2026 02:11:14 -0700 (PDT)
X-Received: by 2002:ac8:5f87:0:b0:535:fd16:4393 with SMTP id d75a77b69052e-535fd164be8mr94187711cf.5.1792055473655;
        Thu, 15 Oct 2026 02:11:13 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3edab11d7bsm101289466b.83.2026.10.15.02.11.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 02:11:12 -0700 (PDT)
Message-ID: <36e8a372-3a4b-4466-831a-2445313dae51@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 11:11:08 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/9] arm64: dts: qcom: sm8150-hdk: fix FSA4480 address
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
        Kiran Gunda <quic_kgunda@quicinc.com>,
        Subbaraman Narayanamurthy <quic_subbaram@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev
References: <20261015-sm8150-display-card-v1-0-5c14928cef29@oss.qualcomm.com>
 <20261015-sm8150-display-card-v1-8-5c14928cef29@oss.qualcomm.com>
 <ddbb547a-f59f-4ad2-8c99-4436bdae84c7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ddbb547a-f59f-4ad2-8c99-4436bdae84c7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzNiBTYWx0ZWRfX4StkNwBJY8FP
 VcgcLiDcWFsyteYfH/ccOII20LfmZQjSUT/enETwFtCFMBvwOUFpHDxtpFA03uszDNLRSGPG3hL
 pheMs37UD+SFNp3jXfQshlCAwonzszM=
X-Proofpoint-ORIG-GUID: bBi5SCWSJWGDcBITLfzZZoFpMPYbV-st
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzNiBTYWx0ZWRfX6BdD8ETzW92J
 v2CiKuxcTYBldMi4wwKeMp8YIj7cfboyjbaB7oN4lGyD3+zwTUaKeMQh/mfAMu2f1KXb1xRBnZ0
 q09d2WB6wglLeQKtwbjwD0uZMjt9repEVzNfx05tr7X/Xx4mJhlizz/u8AjNrrzv3H5SZ3yl8iI
 v/DabMlHuxDiO4CvYKjt+WAVFMIBXMaHSUzvBtZLiotlG/vqQzN0EwZISHZBZfkaxor/SpbbU9T
 MwtO79Wof2OjsHkytrZWufAwXMxobJN4clKNa+2DVtyQfHquCJMNtEJ/JtiHvs3bJPg2/qck3jS
 NBgu30/0Auxjhs0hbMU7CduLZgKLQQH+IPblSRKTmCkTlCqQwBuBRgQIgAZvkK3d4N50b7hy15J
 BTH20g36kGA4ca0MqzXwRpA9kjStm3sMhpd2kNX7nxaAtQaaOWwyGriVBjvTJBg22paImS1zNMq
 7FRuRQj6F3TdMkWSk5A==
X-Authority-Analysis: v=2.4 cv=E8BYNqdl c=1 sm=1 tr=0 ts=6ad098b2 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=mAFRzXhWWU4R2_A-WnwA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: bBi5SCWSJWGDcBITLfzZZoFpMPYbV-st
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150036

On 10/15/26 11:10 AM, Konrad Dybcio wrote:
> On 10/15/26 10:58 AM, Dmitry Baryshkov wrote:
>> The FSA4480 on the SM8150 HDK responds at 0x43 rather than 0x42. With
>> the wrong address the mux driver fails to probe, the Type-C controller
>> and the DisplayPort controller keep waiting for it and the display
>> subsystem never binds.
>>
>> Fixes: ba712fd55c7b ("arm64: dts: qcom: sm8150-hdk: enable DisplayPort and USB-C altmode")
>> Assisted-by: LLM
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> ---
> 
> Hm, there's an ADDR pin on the FSA. I wonder if the previous guy had
> an earlier revision of the board which routed that differently or
> something.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

oh wait.. the previous guy (author of the Fixes commit is you.. :D

Konrad
