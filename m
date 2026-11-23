Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447336;
	b=dz9rZ6Pv/JgTit84x9QoKmArqE4hzodr/wJHZIQRI39IM6ktaQcNmMnKlTrh2Ww7dYjb
	 6GFAJR8teg94Mcj30f02dmrepn+UaPzz4XgRYMXlIATxAt4SxPM9M8/xPreLn/VRBhN3a
	 1ZEVjEydvNZBMQnOXkfTGsH0R3Pt+gV9mtZ9RXcTphYikZ7yI9FXN8I4mgk7szl7AlVnL
	 Sw3Ofuwf8szCw3O1sMCOsuH6E4DKkcictnjDI66oM2W+hEltOss1/0T2l60tn4sQLnH4m
	 9Ydq14yEgEDTEsG3PUFkrGMhmujkRAGPKFNDNkbLi4ANmofdK6KF3iA/GlCTirLr+PA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447336;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=uxwB/tfpj1G6soQPn8hZLuqg1wnIQcFZUfB2L3eD/3k=;
	b=oxehs7qteCPYYC2zfHkPPvYmBL9ajChEgEqS0xUNzj+QmOF9oscsuCVLpNeiuD9q7NVM
	 VR3zqQJ6KOAqMLPgd3SuD0a0gElkC4+7zd3ZDL3cNHKmml+mLDhDfXh0yfUmq2I9iYAAP
	 M6sbhFQVLNUQxax5u7yLiLWcOgiczXcOg4epbNtbvkSJvwTa3rW471FLX/s0Wes6e3I3n
	 QJu4xjtZ0tyqf7Ia9MX7WlvYqF5X0lzFOuRdF0FAulnekOrKQvWITXpD0DGejYJGywGh0
	 SKy0VY0M0GK2Hw2p/QPyLI5+qDgbakxnsSS53duXv9d6038HtmOkl4xv5ir8wd7BAjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OQcPbihy;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cAfyIZEZ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 187E6606A321
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 15:22:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 187E6606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OQcPbihy;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cAfyIZEZ
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDLNhD445713
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 15:22:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uxwB/tfpj1G6soQPn8hZLuqg1wnIQcFZUfB2L3eD/3k=; b=OQcPbihyhg5ti0eo
	tMbbkVCNwxbiCeOGFtAvdo6oRuFCP3dZbm9kxrjXtOFQXQ29ERg052jHurB35L/3
	M2XgnuZNnh7jxWVJLZLJ6oolY9pJ4XaZ0VqUa9kg2UC38eiSlrjHtwbpqKaz9wRA
	piQjN8MaSbQIFGGDUevMWHr5FEDU915b/GLcexMuZHFRO1kSxljSClwa3wkU1FkJ
	UGoUvyBcoh+ticaPW8ZitaXpsTBw9XS3oBnErvJWitQqEsFWL3eLIa82A6xcGnsU
	SloY+1C38Xw8AuDWPxj8NNTTkTYPdvpE3jStV0bIeaUOBhh5e7wo/tgErmvXMiiE
	GiKVcQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g74219f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 15:22:15 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9495a4540f2so19908185a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 07:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795447334; x=1796052134; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uxwB/tfpj1G6soQPn8hZLuqg1wnIQcFZUfB2L3eD/3k=;
        b=cAfyIZEZozoYmJ6gmGAOXJMb4213eiW4ODzcjV1iprre1+Y0AVIjNSMwWAOMkll2Bq
         9VbSbAFJ4p4pIZQOAPkEhxUuC7YFPBdH62fiDVffArcvhZ0VUWt+ywMmna1la3SD3gDz
         +6dNUsKEeJLvT0l+g0h1t3FB5epji2Ng2XhqLghEeStD93ga9mDcJ2hTXPHKzQKfUKSJ
         lkxNpNC9kouW9rog8qHvsUHZvUK4+eyEyw8I7vTyW5d6pcpotjj0Atstrux+nQdfH8Bj
         nlLDQfJwfpzZ7kmbQ6BX9DURZ6+TV2MslnXLW0fvq/rWSXrUILCdvTwBSsQl/Otw0peX
         tjDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447334; x=1796052134;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uxwB/tfpj1G6soQPn8hZLuqg1wnIQcFZUfB2L3eD/3k=;
        b=CT+79iHEobLlUT1FMFa1GWqXbFSWy0toV2+iwRDLwY2/rTyXQ37RH0j137AsxIB80h
         tcmEzfnq7YD+lvMJKx8+VXkzfZ+P/VYiqYpvX/ifGxOjAC1GH+vpHsRVjK4EB5Fs3dP+
         xsRGKEZtXRxYRxoYGACOctqsZuLmFeSG6+0GNPxMz+kVRrvkuWYU7SuZ4afMaMtjhpot
         1qH3lqUG7LeRVvyiooO1JzZ2yP3afR1dhzqgT35F6Oo0gVOtmcRiHO3poZnKtRD1MeTB
         tcWBNyfiW2MifhIeJfl4Fil3ij33PmfuUJioOKLDoKO8rCa7LzFwxZtk2+uR7l5t1Gb0
         BPJA==
X-Gm-Message-State: APuU4Z/5MW5fVy5pprlN1USFFKomz1adrZczV34QU3Y8+KsWnDySeikC
	UGVX6NU6bPWcypdeQMYt79lMS9CoSG0ZQJEhmHIxbq1Io0ZbH9yJ8Q/jdw8bYT/S+SPo2q4DOc/
	p0TmkV45U0jH/xk6sbHpqZdCfla8l2To+CDfTvxJ0b0cltRMfBTLSaIEKi1rNK64zDq7E
X-Gm-Gg: AZFdTZcdbS4cXqpmMEhB0rkXCy8gllbVWzayP6mnw9YT8YNCJfgEzUDuOf0ofpV3BNH
	dlyCAyHzlkUiKoAsCW4lKC8JB99e2JfntB0/AFpjDA3tEHrUgMDnBk3lvWt9bpUasc5VhY5uN7T
	gvAX7uGMAlovNxBssfSdISxPbc+s62FStDIECyMzb3kbI/HVGM1efYKnQwuAyAv1Vmv/tyk1ZiP
	JbCaFNQRFWieqe1YkL208nTBKmZ687sLemsw8i/kAqhGGUUwih7AA4qDtMGXKPCGPgWKExy0Mxk
	4ZSW/CJtciTpEMhy0w7QRGg54+yjy3hV6TYTQ60u/nRnqS5eGdKAn0b8/UNdRB2wNd9K7UUWe8e
	YzGcG4aYbfheBxMANvOcyKXrafxJm/xxUGBxl0WJQ8X2TNd9hm3Cbm1eh0asIkom7t4bChNw=
X-Received: by 2002:a05:620a:a084:b0:949:c973:1372 with SMTP id af79cd13be357-949c9732a6amr1635133085a.3.1795447334283;
        Mon, 23 Nov 2026 07:22:14 -0800 (PST)
X-Received: by 2002:a05:620a:a084:b0:949:c973:1372 with SMTP id af79cd13be357-949c9732a6amr1635129385a.3.1795447333706;
        Mon, 23 Nov 2026 07:22:13 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae6872asm411446666b.13.2026.11.23.07.22.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 07:22:13 -0800 (PST)
Message-ID: <09f5e7fb-4fbc-41df-be25-d81616c58402@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 16:22:11 +0100
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
Subject: Re: [PATCH v2 1/4] pinctrl: qcom: Consistently restrict MSM8917 to
 ARM64
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20261123-b4-qcom-kconfig-unify-pinctrl-v2-0-958e205b1f60@oss.qualcomm.com>
 <20261123-b4-qcom-kconfig-unify-pinctrl-v2-1-958e205b1f60@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261123-b4-qcom-kconfig-unify-pinctrl-v2-1-958e205b1f60@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: -WH7Yu8rg3ORoyrh5AdjFcvOYwgAGN77
X-Proofpoint-ORIG-GUID: -WH7Yu8rg3ORoyrh5AdjFcvOYwgAGN77
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2MSBTYWx0ZWRfX87eyxSNGU69O
 yysNhfr9/GTlUGIrWktSTf9P4N759ri3Ak97Czg4lx/jXNBIHqzpD5baJTyjItpw0lumHuuA2KQ
 bQhXG4PKN0Z1JP/YLCpsOniPnI4iFkk=
X-Authority-Analysis: v=2.4 cv=T/cZ3PKQ c=1 sm=1 tr=0 ts=6b045a27 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=ilm-UVfHMgz0hM6ccM0A:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2MSBTYWx0ZWRfXxfNCTC2MjJfv
 erLRg+lcnEhdpPRvmDxJf+JXMmsNX3SHtxD9p0xefE/ac11hahDJUw5EaF/0WaPQp1lLyrV2pNE
 o+yxPH16qNh1mebylPlAIE1q9voxkkh+rpG3u7JMsTwaImo6pspFRPHPxeP2KGPLXnUmCpkYgYs
 ZwL/bwqL/ATtTT3jxwP/LNMydqlPYqbvaeWjKUfz0IBOAmION5uds2LS2p+qFZfUyfTw1nR4JJk
 uc7Mtc+WhHW9zU/ozCVKqJUyftwGHbXXoDTZBELlFx4oNv7iJQfih6YBRoYPCGlZqTpwmNS9+Vs
 oOA5Cq5K7J3x8FnRT5e/pQxoWEXEuk7UPAePjk48ppaaoVLcDFfW6a0bz3hBQDV4MJNeBZc6vOn
 F2M6a/neH3aJ/HO46wBUeIeIQHuB4HeVhTRJSwz/kvs2lF0IHYcxaqRNO6Kzv0/hlBKpoLb7HJy
 nbCsG+itg3WJKh87C2Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230061

On 11/23/26 8:44 AM, Krzysztof Kozlowski wrote:
> Clock drivers for MSM8917 are restricted to ARM64 and there is only
> ARM64 DTS, thus consistently handle also its pin controller driver.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
