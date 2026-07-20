Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C7AC42980C
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 14:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784557291; cv=none; b=sz27MES+MCiM/eD34ELNN74r5Gkn8pFGwgrMAM1GG4lgmkWthduZEcKQb96IdfpmlcNsA0AQiOLgpK+wMOydLSZi78Px20xfEh95mHhW0Ugd4yrslJsKluMfja6ouaSqkYiLsmj7lERI59IimD63vA0/HWbb4fUdfrx1gB+XtbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784557291; c=relaxed/simple;
	bh=FbNVOT0zjfOFochT42IbJEGWm5ppzHbSsO+Oke8RL9U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M17J/w3xrYPw1BuXGdJxKXa5v4tsWR7a6lm5q5s2uCGjFT+Ec8iHlPB5SIlyYNsvYYC7Jr981EiSLoE9cOS0vYK3XFNwk8rbH0cpXZf8VJclyVX/OnVZY6T+PF0UVgvK99XsP6lTUlPiTRRQFTg6AIxuFIT7TQ9h+239cbySfc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TNnJquPw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ww2bc20g; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TNnJquPw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ww2bc20g"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KDrFUN2807604
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 14:21:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sp97wjloZeXeCV7fe4nxHbSXC8IefY+6Yaq1KnKIS1A=; b=TNnJquPwUQfp48Xt
	zBXJUB4zfpQRErnLs+frzlE6z8YB4++0NM+Ht7DuShMGQlwHLhNn6WeRu+G3AakP
	oXyVaXPx2hhD2mH/6r8ccOuQC0MN7GH+jGUnQYJM2MSJXzdsR5uUNlmJxV54aEam
	Dtn/B21zsd9u9fAof9y06dD7E5VNbVL6lEMG5WJuH5EvY0n0vgsr2svddvqa5dFR
	PCCMLzAcNh8E1F25ws3ezS/vGOljWXgddQ2Sf0Dd0IiBCGWik8XG50rTZsboKdVv
	t9RvC2t+G/8sPd7CTU6vf2u/p159TdwFLzZ0ZAxS8XCOLCAf5b0IvKn94e2fEMLL
	O9m2LA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhgre9bg4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 14:21:28 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-930bd2bfc45so27649985a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 07:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784557288; x=1785162088; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sp97wjloZeXeCV7fe4nxHbSXC8IefY+6Yaq1KnKIS1A=;
        b=Ww2bc20gZkdVqgZ2YL7nKH/ZGdRVetWqdU61KlJRJCrbdguvm+oqwrGObIQRzhP36z
         /4aYcGQjdqlZ1MNiJYuz4qFbkUCX2Tgv6zJSS7Ae2t7xCoAu21dKb5JdBVUodL4UNh/l
         XEmdrdE+ZwZW9x7Ga32hUNw127JyuaM79fncrqEDCAFMvn/8/fRnRNEankkTX8ZKuzTh
         aJAAP/0ADSVaANUFtVXIB1ggVZ0HLtMLHNo7UrH1WP5lsaeIok0o4GJjfaIiXnS5yWEU
         z3M56BK++zDAnYa8a0ZGSsqCsFD564vo35ggliF/rV9UwEUX/M+dQIgWeQorwn0ZiSIs
         YEeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784557288; x=1785162088;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sp97wjloZeXeCV7fe4nxHbSXC8IefY+6Yaq1KnKIS1A=;
        b=k0/dV+J5MgA1dGyFcm5nq11cJkOdafgx6Ne2wK61SgHWz7ckTaNzeyY/8R3yp6SGnM
         fan5U1l29dEC4sOzzSqz/L/8qZ5m63cnrcdSftoyc9WqxaTrIDRpCL6y5n77n/6qUtha
         kvNfvQ1jqhEhLwIcRWRjFKvyBv5upOFT3aITRTmHEddFwUi2XVdKyojnqMQ0A6BKX1yE
         i1xta4K06ynGBbe9mexMjBcGxJk4p5kxDGJgJg5MMnNq3OOMQ5fMyUxhUXoMzsAkFDwP
         l42OHTrkCB0ssvnIzRTeVaPE5JS1Z5JeqZp3akj/wBS9gnLjXNTtmHWQjXqhnmR4qS1d
         Gtkg==
X-Gm-Message-State: AOJu0Yyz5IGSl1tHrj7slMulzIKiHfQoRBjA+vuUPhhUxALxCetJP4JA
	e7VuuLVw8Ao/cvqN8Bp9kaiercFHDOSmUZRvo60Ig46Lmbu3ksnJi8QwaYH5NbH+rbO1poQcyTJ
	UjVHaQTImvpM+qGBUmF64wxivSPyq8Awjm0axJV5wwMw9EFusvBvq7KlQPt9jekLensQZ
X-Gm-Gg: AfdE7cnJgSZMGXiBpbaVBPFif6/9pmDBgSniamZqXCLKlWXCzSWXZxEKoo6NJFd6LLt
	hlLfXAGqLWBbkBy5y2fcWqMSc+Vmapm38Y6P+qI0HkNkxeLe7jcQg63JdUhG/0nXXoU6W25T4rS
	vQauokba9SWJa1ZjDWaA/P7HjCBCBBkPDhS4UQY32R+ipin41yt7zog4zBOVhyUQX52p9jgSztq
	pZsqO+6ysgTa2C3l89QQlTPschesE4uagvGZK6Fxv8YEVyfMsQZVtLnA/HVr3dX5eiDAeXHLTzq
	D9vqQ7+eBk2u1rMz/wyQBTyu0g1J6TtFNlqkdfAziUI+Zq4wZOxomosaR0DMzO4ZwNoD1/kV2Ki
	+KSJnkiGkruKiVb4nubyVSE6y
X-Received: by 2002:ac8:610d:0:b0:51c:845b:ac4 with SMTP id d75a77b69052e-525f9152ea6mr8628591cf.3.1784557288170;
        Mon, 20 Jul 2026 07:21:28 -0700 (PDT)
X-Received: by 2002:ac8:610d:0:b0:51c:845b:ac4 with SMTP id d75a77b69052e-525f9152ea6mr8628241cf.3.1784557287677;
        Mon, 20 Jul 2026 07:21:27 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c17009add9bsm476934466b.1.2026.07.20.07.21.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 07:21:26 -0700 (PDT)
Message-ID: <9fc68256-6790-4889-b1d3-1802de852d96@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 16:21:24 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] SM8450 IPA support
To: Esteban Urrutia <esteuwu@proton.me>, Alex Elder <elder@riscstar.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Alex Elder <elder@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20260622-sm8450-ipa-v1-0-532f0299f96e@proton.me>
 <959db395-ae71-4a50-bd46-ac5add545a52@riscstar.com>
 <48c624c3-5408-4862-b4ec-9321ad279bf9@proton.me>
 <8309e9c7-a110-478b-8cd4-c002070d2b4c@riscstar.com>
 <3e70d77e-6bec-4e16-ae88-a4f5161f182e@proton.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <3e70d77e-6bec-4e16-ae88-a4f5161f182e@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDE2MCBTYWx0ZWRfXyNwenJo/yfMI
 Yljdyiy0DCza0BrWIdlAMMHr+Skb4kMR4C9x26JqHYSh/H0d9xyB1xrJjIBQxRxRVQtFOH5xxnI
 cchzZ39Y20Zs8Xr46bMDFMbmxklMue8=
X-Proofpoint-GUID: F9hl5PVJSwYv-2uYufkYLy0T0zRc8KwK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDE2MCBTYWx0ZWRfX6zvGHMzZKYAQ
 1f1WWymkQkrJM/nl024u7Tkt+uI3mVbO3FCT0bFXNaq46nNo4p+/fbnek+rOb7p6ZBS6iC9JDBb
 VnWqLaOnfr9qBkRnyRAFgNq26WqUey3eGzcGdNEu7SULOcYa5fB+BANoL/lfenK2BlZ+gokreZq
 rk13TN/dSfB1Gje5P7o6XB7Wz8mD7IYzck1XV57Sis4kplFuKdGSZ6gjRlwuGRsq5zDZ1BUmBBs
 m47zM5lt7IgiqOOGruP6mLRaJ2Yb95W2dF0YxLXOZ87H3ECkz3ov0OLIV/AkPnpVipoCBPNnyDG
 rfQ2F5RtGpFxCrFP0ROkMt64njYFsyRZOmSLNS75nxsbF2+GLTDG3d3oWLMJOMwgV5735F5QlHq
 3PELEQZonXhmxYi4DdZbzIDmUfOlGfAyT4WgJANcbgjHDES82VeRFR3eW4jzeYjR6FcgSIcdyvC
 /FOFoMyDeTewy7Nj9BQ==
X-Proofpoint-ORIG-GUID: F9hl5PVJSwYv-2uYufkYLy0T0zRc8KwK
X-Authority-Analysis: v=2.4 cv=foLsol4f c=1 sm=1 tr=0 ts=6a5e2ee8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=Jb5X9PtZ9yVevDr6ntUA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_03,2026-07-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200160

On 7/8/26 10:45 PM, Esteban Urrutia wrote:
> On 7/8/26 3:49 PM, Alex Elder wrote:
>> This was interesting to see.  It's something I should probably
>> document better.  Most everything maps to the downstream code,
>> but it's not always completely obvious how, because the upstream
>> driver has evolved substantially.
> 
> On a personal note, I'm surprised to see someone not from Qualcomm
> maintaining this driver. It must be hard, so kudos.
> 
>> This means that the SRAM size (ipa_mem_data->smem_size) should
>> possibly be defined in devicetree (as the IMEM address and size
>> now are).
>>
>> The SMEM region is used for "IPA filter tables", and access to
>> it is shared between the AP and the modem.  Unlike the other
>> (host) memory regions, the size used is *not* included in the
>> ipa_init_modem_driver_req message that communicates from the
>> AP to the modem where the regions are, and their sizes.
>>
>> So it's possible that the size used must actually match what
>> is expected by both the AP and modem.  If that is the case,
>> using the smaller size might have problems on whichever
>> platform (SM8450?) expects the larger one.
>>
>> So I'm not sure whether using the smaller size for both
>> platforms is OK; someone from Qualcomm might be able to
>> answer that question.
> 
> I actually went ahead and reviewed downstream device trees I found on
> GitHub (1) which contain both SM8450 and SM8475 device trees looking for
> the qcom,ipa-q6-smem-size property, which would correspond to the SRAM
> size, and to my surprise, this was set to 0x9000 for both SoCs.
> Most likely the commit I got the SRAM information from (2) never made it
> to production devices.

OK you meant the qcom,ipa-q6-smem-size property. I can't find what
it corresponds to, the name of the associated IOMMU stream
unfortunately doesn't hint at anything useful either..

Konrad
