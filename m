Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE552E7366
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 08:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792140335; cv=none; b=WdT/c6kuZd4+LvlF6eI0QQeeOLZo0gHTwVZ2PoiAZSQRbdYETaY9Y5SugaMqKsXEZieB647GOAKXvUbyf3wazrkDUkD0yUfxjw1bSqMfn/7SFJzSPScTvSSJVkVChgAAQsUoz/kdniP3mksk472DkwXRy2p9lRBTzetViyRPYtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792140335; c=relaxed/simple;
	bh=lEMlRpoR+kv1GJAGtWryjveEN84E7JieHkX4ixMTAyY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UIQETw8tB0jrhcBCumi4hJuqZTnWmdCf+J1WESXN3UW4Hb/752+gT4YcMr0RIz76fAV4o9fHW9nL4bNTy3OpRrY7lG7FxkwyNgI2yO+Njf6q5uutsKud7lBE5eel9v2WTLZjr4IdSEEtDCqizHZTTrNKNidgZRIUfpdKk/UtOYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YHzfYrhL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TtWwWrgP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YHzfYrhL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TtWwWrgP"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G7Idbs1635300
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 08:45:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y9vrQgGb1X1jrtBDG6LZTbTc3+/VZk6Tblt7k4JIVVk=; b=YHzfYrhLuNStdkHm
	oXVLxSnUYhzx3LNP6TRsqpQ5uMkZi1Ej/U4oFYYj7gkPb/qA+G+FGH1YQLKw1WPk
	ou1+AJti/26ga1oxOmJMILbpoqHWSAwhBRmmV3GoKA7U0OkaUkOTKSwFGOdjO3xS
	36G67YcL+mJJYLuXXX48d7e7sy6ZU3z/5U1AsblGRP1bede99jYu6DNeREoUleot
	sdLmf3TZaHnt2a0MH2xQO8uIOlR3lG8rkW6d9sLC4Oa15C+4gaC4RyBDl+Tbv3VE
	P5+kGLjdqjXXfP4jfd1Vn/Wn3MD27hC4andPbhHExmTjz+iE+3lpgoYaFGHyG/GM
	9VhgoQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb8r11qq4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 08:45:31 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5338a4075d3so19601911cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 01:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792140330; x=1792745130; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y9vrQgGb1X1jrtBDG6LZTbTc3+/VZk6Tblt7k4JIVVk=;
        b=TtWwWrgPiJAO2PnJvKcUUO3mHZr9ENTRD1gEPwIV7EOxXlOxAs6fxi2myoUaiCkHTN
         NEBLZq4laOPG2DWptD2ZjOHfqIvYQcJAUATys7CMpKRLVKSIauZpp1oL0RLD5ZLMUEmZ
         yxJADBQ14yMolL5jG3f7aUCHKOYfuwYdZAvCl9uqZnHMShZJN129VFTbmVtxgqgzm6mv
         pmTVlyDS55dEJ8O3zZME0IaeSmoyn70nmX8t2wxKbpVUQ5ByhZTD8kl9hDbZyrrDSG2V
         vZDb4wJinJyfLVOv6tpw31jr05TKVKh53TXNr0z725TlTzAyK/TdsWhqRvz5ZC0ctrVm
         uhGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792140330; x=1792745130;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y9vrQgGb1X1jrtBDG6LZTbTc3+/VZk6Tblt7k4JIVVk=;
        b=z45VYB0avP1pSZpTvcwMin8htvFdOOmQnBXn7pdqd9kOVXVowdCX6zDu7AWEgWmT7n
         PlmY74yQbkvYduZck+WXN+0TxxKkecvdPsetLTlQdgnhWJenVMG60ChjPq/oYL67gwqE
         I2ppuOAGklBO114WvHYStn/tJKh760x7UIXhhhAypuv9T0hnbANVT4KvxRtctbAp3k5/
         LENu+pZIaxzNtohlqQWZVFHXkuPl7MFwPq+Gg6Mw7nXXEssW6JjumLoidIuCZoTM3AwK
         0qbvAFC3PVzewWeuwMHWcVW4N6FZYlIXx4/lPEdrErzdTsJQujz+XKVrE72vXhcOKTZz
         1h5g==
X-Forwarded-Encrypted: i=1; AKwUvBzeE2fXN/ncqfWXVNy6TD6AO5Ffxcf9L7t68GV8GIs7YrzqiG5IK963YyQzy3WlUNK1WSee4RINLsTFpt9G@vger.kernel.org
X-Gm-Message-State: AFq9FYKP8oTHk9f+QNTmuVyQkCZCpHUhVc9YUMsWt87OXNRL9b2Ww46R
	pxZY8/aMF2U9ZtJCBdR3yC/xdi2MGlAMLE6gXpmIAivXTXqdwGziE6+PWnGxLfG/SYSVWZUf4FS
	RatyaLn3oYZ2wjkCH3ypU3QWttbgH0oHlNdAYuWs1jYGuFXVOKnjlWjGnARGJNSA3bmx7
X-Gm-Gg: AYBFou3oumJapRfrazoNgWohmZCViIXvt+UI0Bi6z3wyPN07aWwovGkO0UzNpc9VyAd
	S6yXmMTJxMqff50gt7dRj+kFvAhcT/MCrW6cGDzKujag57O3C0TPgfmsldyphtBlUz0h/jRccyX
	L2AwfQ9aGjWTkM4ULORCHGbZE+4iwN1cqKWi1nE1tlnpnpwlZKWEWUd/Kmyaq/L7nDV0Hq8+vAT
	auOa6DWpfBSfwdMzD+kYnDQg/KjIzJvSG4Fz20Quh2WPDS4uNiuagCED8BGfMf7PDVfbjuD27Er
	6lxnii7KhIbd/+Tj6x4gn5tftsCc1T0yKZi/PMmWFiBIVZqmHdtbmIv0Y4WQfOUAG/jIkQMkEjd
	HVXo8ZB4GjqkfnxGpnGCoFg==
X-Received: by 2002:ac8:7f50:0:b0:534:7732:a141 with SMTP id d75a77b69052e-5359f4f6af2mr413655531cf.2.1792140329977;
        Fri, 16 Oct 2026 01:45:29 -0700 (PDT)
X-Received: by 2002:ac8:7f50:0:b0:534:7732:a141 with SMTP id d75a77b69052e-5359f4f6af2mr413655291cf.2.1792140329567;
        Fri, 16 Oct 2026 01:45:29 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40912ce05csm52215966b.33.2026.10.16.01.45.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 01:45:28 -0700 (PDT)
Message-ID: <b0763841-cfe9-4355-b900-ae43d93dedf6@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 10:45:26 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: dts: qcom: Remove FastRPC compute CB9 entries
To: Abhinav Parihar <abhinav.parihar@oss.qualcomm.com>,
        srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        ekansh.gupta@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
        arnd@arndb.de
References: <20261016052042.3755352-1-abhinav.parihar@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261016052042.3755352-1-abhinav.parihar@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: i4Q8NpU-Me-OGvDYL3cReEHvy5Du0gd9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzNCBTYWx0ZWRfX6DEuyOd9X4fP
 9bCXTBVyTz4Yq23NMTMbhOKsjf5UgBA/t0fH9g7jfi7IJmCaq/81c0IAtjXspPat6AUuF/sfeQ4
 REtHh7YKbJ29S3Us0JIIVk2RQGvnNAk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzNCBTYWx0ZWRfXwrvK+Cuzffy2
 Q4wabAtPJO9oZdHHPSYwKB221gGeg1YnDY4mCbI7mLyUesQHZOzi1wdF19sw37d9eb7vsypF5Lw
 cqFtjr6jZudgE1fyyAdfKnnuJXY5Drl3O8LP8ST4JwikSP0eDaw9z8GpEAUmiNwlRVWMubpNBE2
 adTLTOtkAlz69mAXI22juHrdlqeiq+KbXDaxWtRHBLWhDwjrYGLCsqw++Ps05rGG4MHcZp/ayrt
 1ft5E3nL61o7wMY2qxcF8ssxqEbcxgc0gHqpHK6rAVznp5YGyPhq3U+VwFymWuawviNSrpSVJWX
 RvNIqgEtYvFGnXcjX+KHUvx1L5Q47e8o+1J6Vp/EiiO1FT2ZeVC0sMut0UOv35orxD1bO21YQ2G
 sSxXNAtfNQFhCxKX4qDKqy9OIMJPNcbhRBpB6b6PCrcyffOVo8D3qIyxRq/GeXX+aYbwkytFcaJ
 creEwQ1m7jWNVWZuh+g==
X-Proofpoint-GUID: i4Q8NpU-Me-OGvDYL3cReEHvy5Du0gd9
X-Authority-Analysis: v=2.4 cv=L/CI0OT8 c=1 sm=1 tr=0 ts=6ad1e42b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=t1DTHQtY1fS78f0Aag0A:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160034

On 10/16/26 7:20 AM, Abhinav Parihar wrote:
> Context bank 9 is reserved for secure use cases and must not be exposed
> as a FastRPC compute context bank for non-secure offloading.

The lack of a platform name in the commit message and a split over that
suggests this is a universal truth for all Qualcomm platforms, yet the
patch only limits this to some of those who currently define a cb@9.

Please make it more clear which one is intended.

> Remove the compute-cb@9 nodes from the Lemans and Monaco device trees to
> prevent clients from selecting a secure context bank for normal FastRPC
> workloads.
> 
> Secure use case support is not currently implemented upstream.

Ordering this sentence before the previous paragraph would make the
commit message read more naturally

Konrad
