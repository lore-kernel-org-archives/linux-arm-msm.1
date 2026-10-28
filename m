Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793190329;
	b=dy3J7ry2FIsrU7XOwG5Pcwbs7cQ9Ii5Z4DiX7QFZRwYV1dtaMsl6aVrXnjTuqVGwn4ll
	 jfOJNw7GbIA36pxO3aX4KyapCaKloTtkSgisuyCMFnxq3TFFdRhwNmT7FlYly3zzqPeMa
	 acl9IDSmLeebD1k70IYr4HYuj5LeRybcj/yalFlJz5DtBZNi6Gs6W8stvsZD7kumceDDx
	 dOhweLoyiBmSpzYCs6atZlu7+vwWfNd8MT2Mgn1KRnCuaWUushCbOtUwO0BuhhHfxm3K2
	 fZQIZhr+AX0F2Ap5OlxnG5kZgum7ke7FcpwXMZDSHWrgTNBSAU545Xt7DW3spGyX9CA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793190329;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1RsGJ2QltHbA5w4L7lGT0rlrQVfd+SWN8BV1Y4m0lyg=;
	b=hNhckwaUQtOtXFOAQAUhYE27MoLowyfiOwif2x3b255zldo6W4FjNb9XM25fjIClMdcR
	 +8ak69Wo7BkkJjpbWRVk4eVZVLnyNvL4DOiUiR/DIBSHREV6n4QhbbPoZqmwO8YRg3xlB
	 oBFdL0nToP0iqMx9+mMjcRvPVezzeEw1FcOqlwgNYQHEVha4/LngN8QH4KRqIZUDW98iq
	 DMmfNdPBAxaLgTHAuzyjZXngQqHNsKmtbA3rexDXxgZSROPiLPPnuP9yxUvsKZYq6yTMt
	 C2MGZxwNQt3zkDHZsmaaW0ZC4HMOBTaichz3EFFWYf9wjZwCtJj4bhU2pJw6viYtKfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Q1ksFMMs;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DMeMdlxt;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E85FB606A31E
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 12:25:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E85FB606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Q1ksFMMs;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DMeMdlxt
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBeAi42082695
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 12:25:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1RsGJ2QltHbA5w4L7lGT0rlrQVfd+SWN8BV1Y4m0lyg=; b=Q1ksFMMsMzOif9lM
	/hAa0VBzFRCc771ob4K4MWOfDJIVRbKmwUqSLIyT2O42K7iXw/wRaHe4mk4BGVn0
	vWPvWZs4XDxfk7LIIIFQuH6omFLY1L9SH3OmxMiBV+lecYDzP1jNVwoILutc4v83
	p2MLI1ymByewjKMqANF+TqrlTBXXeBZGB1xbglkUtAQGR6jsPF8ItPh92YDrwIYz
	X4qCYJPRrf+s86o1+GVd73MvjLbxPzZxGuK3M0lFWnC/8aQbhq3CQLR7JRTa+2r4
	SefOv2F4fjhsRPFbiFtdT3r7zYxXxWwL9r2RmOZv/WykwOqHlnRJqGk1y4X2Xt2X
	faNnuA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjyjpuxrt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 12:25:28 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5eb86091358so37036e0c.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 05:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793190327; x=1793795127; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1RsGJ2QltHbA5w4L7lGT0rlrQVfd+SWN8BV1Y4m0lyg=;
        b=DMeMdlxtsy7sfwwWKbXUDEaX3WszRNg4R8HBqCsZNcXxbcGQbG6xoxgkyxdaPXCBeI
         N7qDoVAHU9sxWO5Hf7FA0I1sI7c0uFkWliD3YeKh8TiyrcySjgmV1LWfBIQbfU2/vLKb
         MDH23lszBdqpRBgFRv6HSa+yvVBl9JzMPi5vu6uiCz+0PvExPqjGfcVG3cr0/Wt9oLHe
         1sUD8n325OrCu7cIYKNErXnUYgr7gi+ZT9QnVH72R1ai9gLX9AIkN2uXUjgKnvQbe9Cl
         bT7oPdf3Q5CLInR2oBHyIaFVotujEN4BrsVJVyGWXG4lsqzf7lu1D/xG5A74jaPys9Bb
         1GJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793190327; x=1793795127;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1RsGJ2QltHbA5w4L7lGT0rlrQVfd+SWN8BV1Y4m0lyg=;
        b=e9OA0e7zxBWH0XOer6K/Kla8xeysdtFJcgM5doVO4nad5W8k9xBYuEDOH4YBDuOJQu
         6yEiTpunGhEmmoayUCOmiriX/W+jBFVjS9TlINrxBbYY30xaCnyNTaAJviHDeGcWRKTd
         w2OwAZckzmQs/jSwlFbiasnD/gBUF0efFCBb4F/Ii/tvC6SvPf8V6owlb+RjBEx271Hy
         6a+gzBNi1ilPHhALbNL2Mc1UkIEpKDBv/E1EGrxNjmpx9upTFWAwGY7q9R/ryf4mhNCM
         HJx/WrwRxhcyY87P8Z+LrvBrgcYgaTQbwt6T/xfCyOtohjKN6sInPjIKgeJIqQEe2ti4
         RHWQ==
X-Gm-Message-State: AFq9FYIXtbz4wTi+Mw7d+qyYrTIcFq5T3R6JC00EgCEOrj3v0+gQLaeF
	VFmrhczlrAaTZxZER00il/cb+intLnx8J7IQaJeXmZcFGuir7hU1/XQSHgRAG1rWvAqHDwj2E14
	HbLHVOt/DcU4+lh4zmOm8mwwAVE3+oD8l9Ck3aqhKmibH0rttOg+biLtiSVPd40W67gf+
X-Gm-Gg: AYBFou3g3nf7pjzUQnawqZ7Qs6VjcLPAd5xnQli6nyCaO5idZ8CgWvdb9jnh/GiL9qL
	BrtJWe13IgGvYeBfj8WJLyqGyFExm8a4GQW16Cae3xZWLLVEv0wZMUBcJvwSGZg6CWotzv7TgC7
	1+4fPCtWH2UF5WGaQP7UGX4vupLDV4uwBWYYUghn/A72JrLOdLaUlhhdjdQoSlNA0xGffiLqkJj
	NwDbVhMNbUXsDbem7KpuhJJUUEETHx8T+Wq6ReuAATcKpAiXi1mJeOGBxKn73qa0VzN4Vg/0Zlx
	0QaDRFWOb9m5gyF3hM6YgkFMk8Kp9R7SBZ2ejICLaca26tKNym38atcFJCVSqjZXhVh7euj4HaL
	Ix+Zom+IGmBQj40zSOqOY5BqImaZu0fcoDWvl6s5pt6nG+iRt5ZwciJKq+fM4ckmtWWyVEN8=
X-Received: by 2002:a67:f28e:0:b0:7c8:3b8c:82ae with SMTP id ada2fe7eead31-7d03a4e9c8emr682591137.2.1793190327087;
        Wed, 28 Oct 2026 05:25:27 -0700 (PDT)
X-Received: by 2002:a67:f28e:0:b0:7c8:3b8c:82ae with SMTP id ada2fe7eead31-7d03a4e9c8emr682571137.2.1793190326549;
        Wed, 28 Oct 2026 05:25:26 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4964203bcsm1386592a12.23.2026.10.28.05.25.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 05:25:25 -0700 (PDT)
Message-ID: <a31207fd-2385-4d0d-badb-b9b4f9aeb057@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 13:25:21 +0100
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
Subject: Re: [PATCH] arm64: dts: qcom: talos-lyra-evk: fix sdhc_2 vqmmc-supply
 for UHS-I mode
To: Monish Chunara <monish.chunara@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261028121840.3111281-1-monish.chunara@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261028121840.3111281-1-monish.chunara@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA0OSBTYWx0ZWRfX/XUVpWKjHiPw
 zgLRxLaYzlY7dJmmKay4WskuQJ3YpYZUCWy7s+q2y2oCBAaaewvoig/OuBFa74tKT24WXKOBuEy
 DshPBHZhbQ6ggvtk4KGF5WgDAMOwSTODVWtBZjdXWBv9dviVygdBagrteau/29Bzw3Gu72Icmj2
 I+axuN9F6xTa++S8SSFtUgVkH4n4Ec7u+6yl30Noh08jP715j53W7wagx3IjFUNFjLK1SQe5mBX
 6L9X98ajMstSwgJI0VBfuG+s0IAT9pyHE/8PoV1nJagGuPrVcvPtN9k3wYzcWu3FcxyOhRtF6nf
 vQTOHdqWfsefnyilNdvmb5Om5BbKKNbtWOH0QauAk3Vle2aJRYh8GWl/11WmLZEEsSZC4DcWZzB
 LD0XD073N0+mxAN+foCPfw78x304wmjerVsF9NJ7MKY89W8nUNmgTOL6dWjENJ6HAh6nb/SobBv
 H7IupM5/YTdO9AYQr2A==
X-Proofpoint-ORIG-GUID: gKR8c_i3CsYu8wFXNoVICSqJrgoNbQup
X-Proofpoint-GUID: gKR8c_i3CsYu8wFXNoVICSqJrgoNbQup
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA0OSBTYWx0ZWRfX1vTUp4RUqILe
 2oW3Q7kwErFb0qI8z+449T2F1SN0K3WEut7+c8d7g1JVXcyn4YgjhBbn2lDmCcAhl6d4yjgS3/V
 lCy/WJw47ZOuqt4KSqHGVNUZ6XKRffw=
X-Authority-Analysis: v=2.4 cv=JodkP84C c=1 sm=1 tr=0 ts=6ae1e9b8 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=FAfHesXRkd0e4_V_TjoA:9 a=QEXdDO2ut3YA:10
 a=zgiPjhLxNE0A:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280049

On 10/28/26 1:18 PM, Monish Chunara wrote:
> SD card is detected as SDHS instead of UHS-I because sdhc_2 was
> configured with vreg_s4a as vqmmc-supply, which cannot switch between
> 1.8V and 3.3V.
> 
> Switch vqmmc-supply to vreg_l2a and update its voltage range to
> 1800000-2960000 uV to enable proper UHS-I signaling.
> 
> Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
> 
> This patch depends on base series -
> https://lore.kernel.org/all/20261027-talos-lyra-evk-v2-v3-2-658fd5a7ec99@oss.qualcomm.com/
> ---

Please fix the base series then

Konrad
