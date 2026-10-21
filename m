Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792569528;
	b=N0/I2F0cf3Wi5vgRjk0/AvZ3+8iCQL2n5uJbrlM8hZjid3nhbHvEsJ0He+tilEuR8IeN
	 SIkFCnc5S2h6RbMDecp58jDoPOPr+/DBoEneMG9PAt5EnlUVDP67NCCgmwjxkQURLxZd3
	 CwCf8sKUQ4R5Jd2bDok70aym5/LXy2S/piYFS/f9QMB7hgRJMY5XNlA8HNzntrRwEgWjx
	 6tMMGi4CViAcUgAti7fBh6C8DYtEQZPCbxtep7l7ipJa1Q4nqmIjBadm2R2AXWHqlIvsi
	 mmEL/w6dfuQnqpgcQTCexfJ6uNSJ3qmQrfvEHFVgFeiz+MM5shAYo77DJVSLPXA3cOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792569528;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5/AXDMg9l2eWOjQuJXDZBYdgVgc6l9PLPze5lgXhkRM=;
	b=yZe7c47jdHvpiDK7B2vSWmDMmDRE2ZxRoiwKY2Twv4QnUv5c9SyWlSPkiXUyo9pr7hl1
	 lVhlOldnj2C4/9TYH2XMjhU00/dME/lmFWx/V6oS6/Jc13i8gaaF7HU+LHlrCPIxFdhes
	 DAzjkpXPqeIOAoLdCy90TAXx1j3uMb0H3KFL4AUftloQlJDhmuxREi0NP3oyQCbVYjm2P
	 EMyfWDPpR7QCt5haSk9bJod/rJvgRYV1mz5K4Uwmumkvaf8td1RWenFbTTQLHm63YTImK
	 FjIhf4VeZxMHPKKtio6Oahr/MILRVgu39Pvn/TKx8TAo1qrgq2Kvbfs2i+vk2Bk/ZJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZCppyAF4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YDhvGLjr;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B853F606A31A
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 07:58:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B853F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZCppyAF4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YDhvGLjr
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5is3B3018434
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 07:58:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5/AXDMg9l2eWOjQuJXDZBYdgVgc6l9PLPze5lgXhkRM=; b=ZCppyAF4iD9eo7Ff
	djLO5MAMC/3oIOxgBbLUCm3c/TYVxQgd5gX3Q7VHl6q24nAEETxzzq/OPSO5/xC7
	jwaxAAgmi2HFC8A43uxcM0Rsd6KymfI4cGtziWegJu7deyqe9GdryUD8Zeq/8/lQ
	Jm17wYZfM3arSKuT2tRaD3DKNYAjgHNz45seLuGZ/OHT6++qnZMpstzKvGFFnNlR
	lUm6gIkqAZFdaNqqsVmTpv3Mjm4KO2+9j4ZaY4TnQW2E+MX/CWOYUqWGmClrFE/q
	EqS7TNPcNladRqFbaD7YxP4yVoq4A/3pzmVWFZ7la6I3QTkoQhk8uchyO93UsZVh
	CoeNAg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hebyd32y8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 07:58:47 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-917a04d1cb2so1519716d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 00:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792569526; x=1793174326; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5/AXDMg9l2eWOjQuJXDZBYdgVgc6l9PLPze5lgXhkRM=;
        b=YDhvGLjrIDEhuGo7Fhzm52vLvD2utcA4m5Oiqfv2ezQiFUjOe89/DvsIUx5l4fFWfU
         CrrpWR4H2CggzX/tZJyID8pVQ1VRysvgcwoScv9FBV45AsR6CS92fMibsl/bE97488R3
         y00vfKQN+CXajTIVbUD/exOmeMR3zy7fpj3UY2ARX14QIujiZS+cofW3SrPZRxfhjqiO
         +GmO0bMMiwzE9AxOTlb19AWokgkN1+bkkRqiqJASZIksxwxSSWcIrSpAlmAPgCObf7O9
         wJ0h7s661viptUrrN1fc1USq27mX83Su8+gSChAl9P0dZuOSoHPxABBzWVWiiyJeoNj9
         FZ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792569526; x=1793174326;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5/AXDMg9l2eWOjQuJXDZBYdgVgc6l9PLPze5lgXhkRM=;
        b=Vbs7aupaFiUXvzwBtb1zzBGf2qgp+ZRAYAJaDrnKcaq11jeP/o5KB37K+byPvlt5Ji
         hAdDsXntIT5OR15g2E9ur0Sj+nlcb6mLhZ4drpl34Q8zT3/E50tbP2DjbW1yF1jLf6jk
         mEaAEJnl2aMuQVwFbfyHFWb4GbfzkElDhY6W1i6dwey4WaA0AgQkRhCrHwybE2HoGvkN
         DHHEWCEhFKoks/9loCsW3ViQlaeRvXbKuCkzVIc4a60RaubAU9G0EQ2771+9ADj3iDci
         GsQpapFqP8S9gtTDbkEjxDEATuTJwyCKoNNK7aksqWmmnvnUdvZKE0RX07bAnT9ENvZr
         TeGg==
X-Forwarded-Encrypted: i=1; AKwUvBzajRigx82KTXBN5XHlWYfh9YS3GmxBbzF1QN8BcpOW/tRJAF9cvCLJ/OSUO1R5bGU+vv4IxaAtRcJoercr@vger.kernel.org
X-Gm-Message-State: AFq9FYI2YG8EuLnrl3Qj1vmKAb1ah+f0XkUXh0i/N/T1zd1YkpJ9HFWd
	6PZAR21OEdgMoixtxz3+gDWtxtHZ/ZPn7lGMuoDKSx7yJB1EJ0ch40sUGWEwEmBma2lAGZ8t7gN
	5Cq0h/KJfPz/JYozQP2axwoU+a7eSPYLrkI/gANKurx4DmJ22TFepe30xx1E1NwBrYf06
X-Gm-Gg: AYBFou101/G2s9uA51ic7IKaVkJ04DcS2K7Ae53L224/F3d8STZPTgPf8XahFyQfRna
	Lx0NtfpaNUf2zZW+0TC11hgoYrOeDEGov1UH32GglbN7477Vh3sFcfeBQtjdSALtgLmhg8ufiZf
	GgTf+fMO+mHJy+9HRXAcxyklorumfzLXhlCyITG1Gj8nFgOItvOXrrrrOO2lhum6FjRYBRd3xso
	J/MMIPb4pao94WLlj5mqTnNEVqzd+MgwBSLvfqY30seWyPlo0fTBnLZd/endEnmIolYx5CPsztS
	muPDa/yIYK+a72WT42WqSTx3p4x1lRDuWtDDQEGDp1ZsTLnytuUeVGgqAEFBs8EbT5ayH3YkvrJ
	+oP2xGmmaflIB8oGIOSKYrA==
X-Received: by 2002:a05:622a:1aa5:b0:52e:3991:84c8 with SMTP id d75a77b69052e-5369b5536dfmr22605711cf.2.1792569526098;
        Wed, 21 Oct 2026 00:58:46 -0700 (PDT)
X-Received: by 2002:a05:622a:1aa5:b0:52e:3991:84c8 with SMTP id d75a77b69052e-5369b5536dfmr22605431cf.2.1792569525647;
        Wed, 21 Oct 2026 00:58:45 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4678fba0fcsm49248266b.48.2026.10.21.00.58.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 00:58:44 -0700 (PDT)
Message-ID: <ec32a20d-bced-41a2-8993-6bafbfb63159@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 09:58:41 +0200
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
Subject: Re: [PATCH] media: qcom: iris: fix PAS ID passed to set_remote_state
To: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com,
        abhinav.kumar@linux.dev, bod@kernel.org, mchehab@kernel.org,
        hverkuil@kernel.org, stefan.schmidt@linaro.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261020204630.1175058-1-jorge.ramirez@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261020204630.1175058-1-jorge.ramirez@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzMSBTYWx0ZWRfX/qtogmjzNYb1
 PkHmT2jAbnRLOBMpeKC2TGDV2UT9QtnisXB9X9w/S7ZAcs52IQPztdGuHjYQkHkJXaxXxFWlnfG
 oKgZnQZd4/aXCDW79WBeQE5zrEjwFdstXSFYN+SM4GOS1czPYN51hTfBGx1zCy8h7r8SB1yiH7j
 916mw6DkPnnur9tP7sz7yIxcgi3Czf4hLvPnEXGaKKbaXNp2ASt1gYi69bhRqzScJdIUJE2E0Iu
 Pw2WaX7YpSpPU6AomkaQySxHWZANI1OakWk7zQFKZvb3163k6Q19wpCdbi0Rn0ZO/myGwC411Eq
 ML4DuFewq9vgG7rxWyull7pCCPZroQe+xqpVJ+e5EniN5UTwCaHDlXFeURGF9y+WflN9GLK+RE3
 eRTqoPxeMd52T988klYmHqTtV4QrGAqtUspvua9gC1iZysY5/l2apfZ/K4V7efywjRRgmLFD3VB
 0YDArRZkMpVXKwQlmrg==
X-Authority-Analysis: v=2.4 cv=TdsDJhQh c=1 sm=1 tr=0 ts=6ad870b7 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=W3aFgimVbiLOBcthf_4A:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: VSmjbQGjlPfFnywjZ4C8M8GZyOvrg2O9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzMSBTYWx0ZWRfX+9X8xz2u5Jpz
 O/imetJYhdrJPhYQXkVyUpBF7R3++nf7F6RWEeC7D6wiSwkWFtS5Q3bTyIJRgl5H267ntUw6CzK
 yxfF/9ryyo+jl7tB3sKo4O/JIpDkeHM=
X-Proofpoint-GUID: VSmjbQGjlPfFnywjZ4C8M8GZyOvrg2O9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210031

On 10/20/26 10:45 PM, Jorge Ramirez-Ortiz wrote:
> A PAS ID of 0 does not identify the iris peripheral, so the
> remote-state update never reached it. Pass IRIS_PAS_ID, as every
> other PAS call in this file does.
> 
> Fixes: bb8a95aa038e ("media: iris: implement power management")
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
