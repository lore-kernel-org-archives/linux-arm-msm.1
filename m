Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792992785;
	b=cPliIvMe00zndEFrtrXa6q9Fj8Nt1i9afQMyR4UrGkukH4RJhH2hmx8hVXXO6DaeXVGJ
	 BSmN7TAwe5PIUOSuLDqfW5JgUYPUrA68GNbclafeWukgzuT9ndiZw2twOokqAGDfO0NRI
	 6DbfCRldqTBYX021lFAqPsoM6ergA36syHPdrfRVcgC3aOsSGAFRpSOjyorgZmvzKkEJ7
	 aS4HdCKp90/rCwe8Peh+bP1gnDj6h/ubqmxYHx3uS81dkDb37ZZXtySqdP+sV+dZpnNQn
	 N6Zr9CP2Pi8FuX5fnpVWJvCdFSM06Igc0hEDu/cRs0gJIuYtWwLM0TGpLV688A06z+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792992785;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fw3YBDnl2JEKQGYwhV1bigEwA0pD9yqTO6oVKeScAcI=;
	b=5AXjLwsY7HKUuaGypEKdlDXPl9t+8bBMuZcYuP25Axzk8/Z5XTvA6ULf+sN2yTr6oIZi
	 oLRnDyIJDjxJnwI4xnUzXpfhbrPtkiL2SdWioNpTRAYuzCj7Yq3U/wyColq4cNkroUhsG
	 BXX8JpZ3iY2AJHEwOyszY6WfTS+VfbU6xPwboHpcbEwqyswxMdxdEg4VJ3PJlnQKpuCxk
	 parSdig1iwBTKOXLh/M9JnzqnSpGc5HCOVZBzzWvU1G8D0j/X7FNmPzR3xAC4ykstRyky
	 Tl2j9m8zOqOlo1EDLHg/Zw72LdYJ7VURhxuPpfhurwutnckv+2L5FnAQXOoQHtqoDZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Po056Kel;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BzSaZtqd;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 397EF606A31A
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 05:33:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 397EF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Po056Kel;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BzSaZtqd
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4asMU3303622
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 05:33:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fw3YBDnl2JEKQGYwhV1bigEwA0pD9yqTO6oVKeScAcI=; b=Po056Kele6m1al/C
	bHUihIf1InO6MSspmTFZcYBqxJq37uAFUxQaiCbE7L5kGRsIvgTHoUUEYMwAP8cK
	oV5VxVzJ2XEwZPoAodrIsg/BhHq67s+yTAV2t0tvHrq5kvFwgzeRpLZXd6XB+PjA
	nyorGltDu4kFjH4QhIpUpe7fC1noEfs+6w1OJYcJWvjodWrzpuj9x6MD7rUPgvfw
	4loEg7ogFIgwKxhKcHv8AYAkeRScK9mk/s5dPcHnNH1B36u+Y70c+wrKpzsqnPzN
	nbch5FYzA+yskFFeEqzczxRCZ0WqTzx+MmAvFNcYsgdY9f7+DZx9jsG219+4HVCV
	GPQEyw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgkmscyyf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 05:33:04 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e60770381cso26273895ad.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Oct 2026 22:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792992783; x=1793597583; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fw3YBDnl2JEKQGYwhV1bigEwA0pD9yqTO6oVKeScAcI=;
        b=BzSaZtqd4yzulNAG2m1xLNRl1KUbZrkPTMVkfE4SZYF6Ebq/WDR73aowY2WAWtjR7k
         G9Y8Ver4uz7n1hFD0rmMX7SpwT0CnqJVt59xYiin5dhlZRRzHwiKdfIpovES8NthMFIW
         izZxrK5kgX4OPCWPA+y02+0L44eTWkt70WV6OlgxSuGAY/GHF3HCp6OXk+Q5pwjC29k5
         t7BXcppNu+gCK8S3JQQOOL7PwDfZ29ex9kjeAIzBIuxkQ3iSWBE+TeXHLEMw1b1rDihZ
         IiayvJaV06+QR1EaF0cXX/v5lou1hio7P1Vp6XuLiSKsjKBImHIhlkakMzzzrOYiMxrj
         K8lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792992783; x=1793597583;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fw3YBDnl2JEKQGYwhV1bigEwA0pD9yqTO6oVKeScAcI=;
        b=EipZlot9P82//t3WHcV/EnRza5nNEzPNZbmle6VGuLH9UeVlo6elAohiJ7Lsg6rmat
         PGZD8NGQjYAIFbF5iJ6JNLoXP3bp315hPohb6zQA6d0TD+N7Nu2sh19q/a6U+OOdeSLN
         9Tqsy2tfTI8zN8iLqI726vihr2MXgy156opF4zMRbW7zt9e95Ao7fZOpC1kLoHMj8Zy6
         Bh7za+jT7j5gZ178NfxYgxUAnwdiUQzWMgZNPFtSUkctQaOWcn/pxGH8c2uziLRcJFcD
         hKWwLhRLn6jpII8guP6u7y+MpRYbbJymQ+XJ5tGWGuJ1iePkSm8bcA2mJZtywkJYD2/J
         Sorw==
X-Forwarded-Encrypted: i=1; AKwUvBzwXNUx5kpjSIso848FFwKVQI8Fh+blXxFJv6uihYTMfdUeVKI8yZ4SKpbo0YobFScnsE6AlAVnPknMTXFz@vger.kernel.org
X-Gm-Message-State: AFq9FYICNFqA23F7VKN7BZi8KXWqiv46G9LptRDT5Zl7oJ8RkQ2rLtjh
	7rJJVQuwb4nfCWaxrIV1+0Th2MMDwakVwmPyQaCeDjrndu+YS7w1bTmxw323klqHA15ViY4EhlX
	mOixwN0x5IfjWOs2eJL88dCGeugx1ozz5hEfoBUbeRz273AhVpC6SmQbtdJqF9gVSBcYb
X-Gm-Gg: AYBFou0Nxh5TSLRIFUrIcdE2bIxfr79+2sHoKc4HPgn+ZCbQ6sVsYcfHllHnsMhBkM1
	4R+ZKnh+sAqwM/s3kYBSH8WtFlnrucE8aQg70VM4jVLFmqu6+nktvNwSfqu2WaktDF3Ge3eLPn3
	KbPiMeotMIi0IsCzkYqL/tYkeULj9CxRM9HbmgFBl8PhMbU5uniPjQSe6C9IgTzT+TvSuyv18qk
	G7ojX/HskLt3Y2LyriH1K+ILQ0Gtd3dPfXx3UiriscI8AnN14FLXqksWj3H10ZhaGsh8BKod1Ec
	IQNMYAx6kvC466lnXukrSU1ePSSll9PbKyG1Cv3i0jxF9l4pLuG4Lm2af6uctnxmtYUBCJIpT7u
	9xn9bKoLQPV0hGHOJlf+oHoJ1fuGCLw==
X-Received: by 2002:a17:903:1103:b0:2e8:3e5d:b2b7 with SMTP id d9443c01a7336-2ea9c8754e2mr48634115ad.40.1792992783518;
        Sun, 25 Oct 2026 22:33:03 -0700 (PDT)
X-Received: by 2002:a17:903:1103:b0:2e8:3e5d:b2b7 with SMTP id d9443c01a7336-2ea9c8754e2mr48633935ad.40.1792992783091;
        Sun, 25 Oct 2026 22:33:03 -0700 (PDT)
Received: from [10.219.57.104] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9b1dfee1sm11154465ad.64.2026.10.25.22.32.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Oct 2026 22:33:02 -0700 (PDT)
Message-ID: <520a64f8-db87-48f7-bff6-08a4bf6fa2e8@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 11:02:58 +0530
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
Subject: Re: [PATCH v2 6/6] arm64: dts: qcom: msm8996: Remove FastRPC compute
 CB9 entry
To: Abhinav Parihar <abhinav.parihar@oss.qualcomm.com>,
        srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de, stable@vger.kernel.org
References: <20261023090308.2898683-1-abhinav.parihar@oss.qualcomm.com>
 <20261023090308.2898683-7-abhinav.parihar@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20261023090308.2898683-7-abhinav.parihar@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: cJXFSYZyniQz6TYlnyPNo77VN7Aank3Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAyMSBTYWx0ZWRfX2jBK61+hiC9D
 s+KNbG4UjQFGfO9DyEpk7bHof0l9j2aM6vkFL2pAmcy7L1lMu66sM+gsvnN58gzS2guwO2p4ZPC
 QQNW+f2f7HeVyLTMq3bxjXGS4yW2Kq6Lm7BKNBOA5WKGyGb5ruW8JVe4sav92Ihr88rQET3RKDr
 Ts1xu9s3GN1Ty9VOYq8WnF0YV2aNrdS7DZVyfZhv6HwCdL0GZthza33ilcyHaaESTyetOouUKw+
 i6IdDbb4dGVZuJCMAyjyd37Ef7Yj5YhZoVQJC+fM05Eo50tP/ecAcRJwBJHoBgWZGpkm4yjNJE6
 Zf1jWRzZawsI13sk0novBhOxQL7D5dPw9xFUb8SrDLv2RtASFPuRXvtgKx8GOq8lLknddFSBtPU
 6FuLej89WfoozKxRmWwn+fk46oK1Naa6sy9NXKXPcgksKuYNaD4ClYcLmlugQwRDdiJ72Jp/rhE
 as8sC9Zr+NG7WsYhXnQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAyMSBTYWx0ZWRfXwy8LIInPKen1
 UWLYi3jr0sK1IIgaFk+e34QJVN8b1QH0+SJeFTeA0JA3HNali3koawA0oTRc207O2mbcThMeaqH
 +CzgkQuu1HUt7l2ZhcBqEgFBPMl9LoA=
X-Authority-Analysis: v=2.4 cv=UqX2pOwB c=1 sm=1 tr=0 ts=6adee610 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=jtUn83jyyIc8HPFL8BgA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: cJXFSYZyniQz6TYlnyPNo77VN7Aank3Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260021

On 23-10-2026 14:33, Abhinav Parihar wrote:
> Remove the compute-cb@9 nodes from msm8996 device tree to
> prevent clients from selecting a secure context bank for normal FastRPC
> workloads.
> 
> Secure use case support is not currently implemented upstream.
> 
> Fixes: 1b80b83f893d ("arm64: dts: qcom: msm8996: add fastrpc nodes")
> Cc: stable@vger.kernel.org
> Signed-off-by: Abhinav Parihar <abhinav.parihar@oss.qualcomm.com>

Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
