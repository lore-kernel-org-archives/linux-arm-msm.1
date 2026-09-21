Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B413BD659
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 08:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789979962; cv=none; b=uN7klioY8iBh7MgjrsaT2eyg8kdEn+LirmPQSvIAkkdFbYUgyPAeR7+zkG8qJaXZ/XdrBHuqR+zY60rQHv4QhPWdYma4lOgLQLMJ99mnSJmBw0RLkcQAKEn6V2TZV8g1nMGThnxK83/0gIWz1glTRwkrmFawt/zOQhGgqcjM4IM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789979962; c=relaxed/simple;
	bh=XTE0kn2MoO/iNGwudDMabaFjWA+xpSyJN666f3dQZbE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WOpdeYUemkrKPPBAhaomB1YO1nSBLNxwpKp6D9Er2KwpQij8xGNyEc+BDmnC+jpxyJGINhp1XBXCYhVLtFOiAKswow1aMA8dmRjjaAxoEuIpFWquSAiYcBuucbgunrUxz9pzUBlvSxfMQWlNG4rS0WfQowD/V2QV9kppYBgwoDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V7O/avnO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O57ATQ0G; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V7O/avnO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O57ATQ0G"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L7EFGd759174
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 08:39:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QL8zsf25qI8f6OfYJqvNvrJ7OfAtYEj510v43CBRTMs=; b=V7O/avnOinz0Bj8m
	MDWMHBuCMNM0qt/ooJDqcxX084KssfcDxzEKco/h2pp46wfYTLsD4AICKc7j7TsQ
	53tQ3LZPEvl0fnqvNPHoHnDv0EXZHmaBofuwt755qsGC2YK5nrjyvVOY7pNXf4xD
	D41z94n4K0fJhkKjl2hUFTygKC94AKfnusJEgsCr8eyynao2o4s/6RtnTUDd9uuj
	8yDs2DBkMOMGCNGZf4YxRw30wuii6YqqVaqWK6anuc21n1irEnLdgg+Jlno/XV9k
	lZZFmWF2q1E8Z5JLmYwih5ULAmAyZnFAnd6nIw2pm9Ar5pGgCGGwr514v08DJ4Qj
	ruLS2w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu0118af1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 08:39:20 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93102454272so92634085a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 01:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789979960; x=1790584760; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QL8zsf25qI8f6OfYJqvNvrJ7OfAtYEj510v43CBRTMs=;
        b=O57ATQ0GHunkJR3a0/57vuUEZHKPhM9VcsYVcWFhUzaGjc0cfCYIU9bMc90OsvAxCi
         iYPe07zEohDScFb/WW01/DjUYX0PgZp6xQ7w7NrlUMy+LfGOISiVbzVhC1WlS7pEwC3o
         kTrlm08sXjsfyounEc8SMIUOtBzIHkNebmc1cCy7lcOmwLh50ndDt4DpvgFB6WW0NmN9
         WlM4X2d68T3w2eCu6S0/8maEHt/F59SAxHh4Rt8jGuq9b3fripTBOoPX0HytVd5vgSu5
         FDMDlbsSQH/yBEo13KK6l2w2BUbAsRCNZs4ZKY38Y/d/IWT6mHenEByD58IuSJNC60MF
         NcpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789979960; x=1790584760;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QL8zsf25qI8f6OfYJqvNvrJ7OfAtYEj510v43CBRTMs=;
        b=WnMcG0XjH8arCYoKD5V6aJK4TSeQX3wGXhC99nl0BxiPQfjb8mYgKtxGSYrujIfVUw
         ZegCtjTB8oRQM33vFUaEpqr37iSMkPAXf25aPxd06pUwHhVySYYq2VsMNS+CMYVK84gG
         3vVlCYCFnDNu8xuSAs1QxLSOMu14pZTy0eDoYn9W10URSr5Fs23Z4esfQlRWqsXbbZqS
         VQt/6/3p4CGzpASQ2E1Xl5MLNaUhu8bq6QPVAoXeqA6G/a3ffpT+mvNemFoE3rMhoVlH
         IJKA2o2F+8VZDhcFhxS/s8Rufu7jEJkyrQExG+orIYlB2TQ/dOpDrtKJwhi16KrBaVe6
         8Ulw==
X-Gm-Message-State: AFuF++mpEWiBha1gJ4If947tpCfANkokf1mXmcH0qgUVkxXL3k7V0Uh8
	ut2mf7QJsdkQME7qVGjR7Z+9X8eC8TfKirIVc8yu8iDNuWwgQmBLlQI9YCgADL9AsEAoZWe1BxU
	Zd2TggqFngdY5Qw11yYxsqd9oN/xyz/GEwqEw06IYOFDGZAF04CR1Si86ITMVGp3hjjxDuWqnhn
	9R
X-Gm-Gg: AYBFou0mnNC6Vp3r+CC+03P/XoFm2PmMY6Kk8girz4dWWjI62wV6KKfFIndM7SxmGvR
	RDgmwg85Pwt+Ng33g1hGUYyxU8y1IyAOGnizWzH1EV7qniiJZMeq6q8YObQPCIr5WUa4QbgSKjt
	m0fw38rjJMuoxpf5lNgkg5ZAsCxsog4s3fXTtN6UO8lrr8PJUYgBMfELxdra1vgUfgLw9jNXuOr
	N+yHwRLnR0iO4rwSX7zHYA+bEzm9qzJ3RH+vLmxoah1kXN1i6Kti6xJj3RC5iZ4kivYmGbvhEYT
	O5ySiqqxnQfA4Q0eiMo25OfgnGbmyQ+B1QefzdUk6Bl/aN9Yu4B/WJ7Yi1W8g9AOoHq3GvtVpbR
	Hhh8Q+WVB+Hd9O1757shFJw==
X-Received: by 2002:a05:620a:4592:b0:939:e9a3:3105 with SMTP id af79cd13be357-93bf58b5b11mr914962885a.6.1789979959572;
        Mon, 21 Sep 2026 01:39:19 -0700 (PDT)
X-Received: by 2002:a05:620a:4592:b0:939:e9a3:3105 with SMTP id af79cd13be357-93bf58b5b11mr914960485a.6.1789979959176;
        Mon, 21 Sep 2026 01:39:19 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa67dc582csm3864765a12.16.2026.09.21.01.39.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 01:39:18 -0700 (PDT)
Message-ID: <d5821380-3006-4eb6-86fd-977d6e17a8bd@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 10:39:16 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] arm64: dts: qcom: Add t-power-on-us property for PCIe
 root ports
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mani@kernel.org
References: <20260911-t_pwr_on-v1-0-c9eee197d082@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260911-t_pwr_on-v1-0-c9eee197d082@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 0chFMN11vWvJNWW6iufyQNs0-0iYzmFt
X-Authority-Analysis: v=2.4 cv=dPczC+Zb c=1 sm=1 tr=0 ts=6ab0ed38 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=zKUMnf7IFlsw2KSWKZIA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDEyNCBTYWx0ZWRfX04PWN+x4FbIq
 6UnabbiFMfEx2dn2buF9fqhrTVzMev5nTT/5Iajrp2drS+OX4H7kMReMAAQTjfJICLehgMYWYi9
 eFGqTKCo0vS0eot/AQZBYYJ/UV2OtGDgaKdUSq1JqgGuZeWTW9b1vOnm4r9rwhky50h5s8FXRdw
 mHd/ipHwKeM6ETPiMlrg/uon/n9oCtgpaTtaPvCo5KJ64tJWvEWR1x7pMwfeWaP18Muc5/Czo6D
 MavLgZvfNaCGLpfXzmifPqLIKp2cE74kGREgTLS1q8j6mVPLR5wSyp7s4dXnOYBXYRM0FIcqeeD
 ctB6SNSE6m2u1RyGhsgHvQVZJ1Xcx63cpvJuSB62rLL83CB0Qg7P4EkGC7XdatlFb6WQ7VWmex0
 SgjJCmxfl7SZ7eLQpx8WhxJf2cNbjZRF1TVn+8gRec+TVvsewOUWdWiciIMQVEpnSkmNmFnrSKw
 Xnkpdlxkr1VJ9hwtCTg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDEyNCBTYWx0ZWRfX3zI+8imvfR/m
 DDDnRfeQMH5nwaIGOdLtw52osrTMC6z+FS7HRGPFqv6VK99mmlAG+zZefTtspS5MW5dFWdgrhBC
 PpZ26YWBdFVTlK8uZtLK2wW5pIEmH2A=
X-Proofpoint-ORIG-GUID: 0chFMN11vWvJNWW6iufyQNs0-0iYzmFt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210124

On 9/11/26 8:50 AM, Krishna Chaitanya Chundru wrote:
> The Qualcomm PCIe host controller driver added support for parsing the
> -power-on-us property[1] from each Root Port node and programming it as
> art of host initialization (PCI: qcom: Program T_POWER_ON) [2]. Prior to
> this, T_POWER_ON was expected to be programmed correctly in hardware or
> by the bootloader, but not all targets support this, which can lead to an
> incorrectly calculated LTR_L1.2_THRESHOLD in aspm.c and improper L1.2 exit
> behavior.

This is a good problem description. Does it have observable effects
that could also be mentioned here, beyond perhaps lspci reporting
an odd value?


> This series adds the t-power-on-us = <80>; property to the PCIe root
> port node(s) on the following targets, so the controller programs the
> correct T_POWER_ON value instead of relying on the (currently incorrect)
> hardware default:
> 
> - kodiak
> - lemans
> - monaco
> - hamoa
> - glymur
> - talos
> - sm8750
> - kaanapali

Because you said "currently incorrect", it clearly applies to all of
these platforms. Are other ones that we support in the tree also
affected?

Konrad
