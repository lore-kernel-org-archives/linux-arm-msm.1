Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0249352C3C
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 11:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787053704; cv=none; b=PptZm1SdOwwHqCIfCEGyb4yYv1Nat3R+z7Pg4Xt3CCOGK85N+pp8NJUvnpZdh+oXeHJoBmqHwouaVQhk984kfw8EZh4LaUMgCYA+Z2cpE/9oL3G5AytgO/lAnn/+bWq4fFKg8jIm6bIC1VC5IGCNEqNXQVkGemuwSiX/ndIsScI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787053704; c=relaxed/simple;
	bh=00JK8r+xOSOxAAFZmO92NvtQ9aCpSK3VHMbFQ6Xcwsc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eGB1tSZZIIzFW3t7S4UV1StzTrzBSR1rReSkz4/wSSn4fNzCZJRBPsberGt7tTFVi3xTVYycdHbU/jDX54VYPKWPb8lloQQjR0G0vUVN48auAFki3vuUS2svbAB3Bc8Rpra3XYDWYdhLHqcCLw9U/qFnb5eF8Iqy5hlYFuiUHcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=po1LRa6W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TJrx7RCH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="po1LRa6W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TJrx7RCH"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IABb4i1336404
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 11:48:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y6QFDJmo+aFscDi6EaPtAdK0x37xaU22YvjDJxvKySw=; b=po1LRa6W1GNsV/IX
	KLZRf6B9gMOmLluFVmuoYxPyKotJI22L0oEyz5Zcae2TJUhN0H9PJE9GPhRMYA+A
	a0qSLKOj74Qf1U2uLsM6DKPLOs8fhvI8kl43fBUynqwRRnQ5GCkxXG3570n10/9f
	vKUTU3dX8a79RHj5rnzfdh+4n8z1AHxRpuDGmZLzQmkZ6rWiJEUYpoykMMcAKR83
	meRtB7CpaiJ5IlfMHEnczAzsiGJS9pUtCj67IHM/K0/GLetcH+FZ36Ee8WEKwfdY
	COYJAR1y2udl6omEZ50MoxcD/xj5RXWvflNfPiukJXGfELXFaPD9qJPnjf95j5SW
	Hty6ow==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4fvp1v6w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 11:48:21 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-930f80ae4f0so29231585a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 04:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787053701; x=1787658501; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y6QFDJmo+aFscDi6EaPtAdK0x37xaU22YvjDJxvKySw=;
        b=TJrx7RCHJ3QlZDCqpXwoOq40q8RdAQ22pKd7ZOtwooadvj5VgB4YvVawXmHsAXYIYc
         456LR+uXpjkhLwnlEjgcx8ZMdiz+olP3LNdr4+bDUlxKzMsd1tyu2c0exly290BXffjQ
         GoBNagWnFrDpwvsdwFABYOTgPremqW+apw16+Xu+eUf4mtAMePXzEsapCBdy+jrrEXf8
         aeLZKSO1HsMnGjF8g9VBRWkKc7xQUfHlaP6h2mOl4q4cY8xAk+CuSrXoSJpVLWjkm+FB
         hqfmFET4W1ltZE11dgaBvC474ANdD2Wkyxtw4v8Xfdd+S7vWFBh405NiVZmtlw63KXfd
         G72A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787053701; x=1787658501;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y6QFDJmo+aFscDi6EaPtAdK0x37xaU22YvjDJxvKySw=;
        b=e4Ra/MiSt9P8sCWFMMQLN5VLS+zx/f+Zty09BZQ5k2pHRrGCN6+2oFFwv5l6hQL9/l
         meVfm/rrUpAFEDhB99GAcgwvVtX+AasRHuqKHfkkhMW9hSD4qHOFl/RcJKnHoEf+J4vO
         v0/V1QjUYb3SqnNl6g/vT2jLyfM0m4NQlT28xnxCDDaVekZ2sO6yBkDtH//rnUq14/iN
         yzpN7xTDfo+eVaMD8YTlUF5KxCo6mcM6ejtxGbAes7b66JdwPmbEUqC/EDSn1aKUnHie
         cYHb2CWjcgDb2JMqrExypEntrek8GQautvKukcRtzxPaytd+n6WLzxo+u865yojdiTyC
         FKrw==
X-Gm-Message-State: AOJu0YyyshN5rcCnaolSIVBo1w7vzCzUuacqzmZbU8+B120OGxhIJaLi
	2PzWBt3uBYz/C/E2+QAPyIo0mP0DTAv3xTlnlrNRk/2qCcg6IvvLfVnyM9vUCdlEd6dW9oH+WKs
	G1cbD5QVvODf02HwI7VbkpwELeLa9aLYI5ubS/OAl+JpPQbp0JSetKcmqGw64hM3cO7ja
X-Gm-Gg: AR+sD13M6d6WbpKhocxnHX4aD+JmAjjYImOZGzXFQ5t+uc/aIZC3m23HbmR/OfCITVG
	w4USJfnEhRstrTkKzE87e399mj/hW3vOivi0LoRb61hBdt5jyGb8UBr6SYKDzCqnrXj6w47dDVr
	c4BAIk+Dh6pA3jKB1XQXESdcgQ/IjaGN/aMHTAyqcGgQ0jTouE5Dz4pjm2OzkVnnX9DSO3dAhK4
	fem+9Kf1VxOwcbCJfqfRYOgRr4qSyIv5Lu/0+xzrPKiPio2JoDkA2srH149bg52iR/wmihVu6Aw
	5/4WZ0Nm80YchEq+sRscXw13ybjzHtAM5ydXwm/6x9r0X7z+9zPnX66QNOrYwOfEdJK2WyqzG04
	DhwNlqcsTmLV3QBrDDZPgFfxd
X-Received: by 2002:a05:620a:6008:b0:92e:6071:7cc4 with SMTP id af79cd13be357-936d23a402amr2233061785a.4.1787053701016;
        Tue, 18 Aug 2026 04:48:21 -0700 (PDT)
X-Received: by 2002:a05:620a:6008:b0:92e:6071:7cc4 with SMTP id af79cd13be357-936d23a402amr2233058885a.4.1787053700466;
        Tue, 18 Aug 2026 04:48:20 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c217fe6aa89sm173781266b.2.2026.08.18.04.48.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 04:48:19 -0700 (PDT)
Message-ID: <c556f7f5-a339-479f-af59-e5460606a7b6@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 13:48:17 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-lg: fix sdcard pinctrl nodes
To: Paul Sajna <sajattack@postmarketos.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Anton Bambura <jenneron@protonmail.com>,
        Stefan Hansson <newbie13xd@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        David Heidelberg <david@ixit.cz>
References: <20260802-judyln-sdcard-fix-v1-1-b3477cfc42cc@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260802-judyln-sdcard-fix-v1-1-b3477cfc42cc@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: stADMmuPitfcfsRF8tfbQFI-yRO8wqzU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA4NyBTYWx0ZWRfX5Kq308oD3Bmo
 hUbkKjjUVhAqAfyxVy3iVeUjhyKHH6c3XIV8RNc35OZ/a3aEY/XlrRoKzbl+BvSx1jVGT78Buem
 g7ETxHXoLxllft/C44h77D3ST3mLSAvFlAhBKgPqTBVtFAM8wc7w4E4lE1Zn2Jj8QAS3lcMVFk1
 kVriBlN1YZNEIazs5oC+sb+PWSYQ7MqmakFOtAZc0tH6cJ/1qbHYus5IHg9lMQdbA1ixHCz9aXx
 U4pCLsMo1ZyqAssjfJibZxY1wGbiVHRoN9vPsRUuWvAMh/Cklf+hUnkdAdXCkgQmQjPPYu6RENE
 8M/3jf4JXZu4YJXqfH1jhbs0reAM+sFZUqHXVdINX7RSMUWZHmmt/CfdPR82sbFg9/PRtYGYE6M
 M7kWitkbXxtoTXUK5Z9ldmsRzfuu2RX3dnuM1LTb3sCG9TY2nmqEh3yKLnooF9LvFKenGSo9iPb
 D5ft42v3SC39QNjA2Ww==
X-Authority-Analysis: v=2.4 cv=K/IS2SWI c=1 sm=1 tr=0 ts=6a844685 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=OQN141zOAAAA:20 a=Gbw9aFdXAAAA:8 a=EUspDBNiAAAA:8 a=4ygO6UpHBw7eDzxwrK4A:9
 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=9vIz8raoGPyDa4jBFAYH:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA4NyBTYWx0ZWRfX8VCiPuOmBtOy
 5Eg7rvQXPYYy/UHukOhOfOnN1FJZOBG6nXdc4qRg4pJWtemAU5pXQy9jY76r7XN95QlrjbtHe/6
 XelTTVSlzY70Rn/n5/s6ymPFomgFnqI=
X-Proofpoint-GUID: stADMmuPitfcfsRF8tfbQFI-yRO8wqzU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 priorityscore=1501 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608180087

On 8/2/26 9:06 PM, Paul Sajna wrote:
> sdcard was previously rather unreliable during boot on sdm845-lg-judyln
> 
> Identified and applied correct settings from downstream lineageos kernel.
> 
> Verified card was properly detected over 5 reboots with rootfs on sdcard.
> 
> Refer to downstream: https://github.com/LineageOS/android_kernel_lge_sdm845/blob/efa8458f79dffeb380d43b38b9403407f87d9f05/arch/arm64/boot/dts/qcom/sdm845-pinctrl.dtsi#L148-L303
> 
> Fixes: 28ae8aa3923c ("arm64: dts: qcom: add device tree for LG G7 and LG V35")
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
