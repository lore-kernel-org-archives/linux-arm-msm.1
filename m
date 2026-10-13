Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991234E06E2
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 10:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791889040; cv=none; b=nWMzXWxw3JLUkesbbHDiRh/5pCOdKPGgeksZAbH4FoKAt5cT+QHzOsjWVktq5yCYtgvUnloQGM0vo2e//Huya5/KnaxIrmo4ajpqx7qif9pTJrIctTFrJ1R88q96pn2UTV1bLVfMnwdEBZ6F2Ha7PHYrO8247Gpo6ou7kA9niuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791889040; c=relaxed/simple;
	bh=oFzLmBDZ1BZ/S7//QkibmaQqya60kfws2K20oEotJMw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GalDJLLmnXq2w0IsntfbbsubRF2dGEOB/uWXIMNIfIEK3vid8tZofLqtXvfC11SG/BQVpW91VdrFNEQE/T0h1szE4Dil1ITqiE31OjZjMzAnunVM+oAfZwmz6fzmYhpj1Bk8hDL3f7tq9HpdtAq36k5fk3RybzPqO9FuUpi7Isw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RH1HSja6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SIizeg4t; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RH1HSja6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SIizeg4t"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8UvxT924255
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 10:57:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	riNBUs4T/qm7wz/92/UFK8rqhKXsDLbF3jstOsmwjno=; b=RH1HSja6OzwULZOW
	n+75njZxui2mLMKvE+9lWApKRd/Tbf6gBy0ROetmD5BGOaF+zps+guwsEVsPnybd
	4rTQ0B26ue3XCBvmnV39dH7eDhT/rK0hkfufv+DvNDkRDqur9nqZO3Li63raOBJo
	81lLepfchxAxTEohy25WIOJalI7hi/cIEU0ZNStvge34Wv3NKmomoIpJDn7DKYh4
	bHOknMC6Pkvu3az5oF5c7BaVlxRsRbxUu96oHp0QiMTCeQ3wiGx7PCI5RhLbUD6+
	xTFij4jZYcdfVlQz6IhHOuAOfHjisVU0b/nTTmCkz+tVyRH1kp6nskL8DtAKKiAp
	emrhBg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h98h1tjkm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 10:57:13 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93df7a9466bso28754485a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 03:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791889033; x=1792493833; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=riNBUs4T/qm7wz/92/UFK8rqhKXsDLbF3jstOsmwjno=;
        b=SIizeg4tosgM2abIM86c7IDwAnVkLhauK59bDZfCmw4vwfmHdOP/fw7y/DAYerCp57
         Oz1lPBWhQT+vCdFpNd+oOrJopSKA8rybsL53emIs0DnxvJq2C+FqNt5V/nvAr18QcKJA
         7pixrShYbXkY0QYT+JPHy3IIJdBv2uS/QbfgIxXrBmljMntLIZdmD3ZtYpsWfSLyobbh
         +8nHBg4ma6jKX2tORKvMupbI170UVCeDJ/x3mB7sTE94FkI1wVTmaf19HWbtzJXxflRI
         9iIXfBYUcbbtH4lZ+jh0NuG8cEmpmjk16PxAmOTDYHkMq0Q9Wju4fV9vt9r8kXCuASVk
         tn3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791889033; x=1792493833;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=riNBUs4T/qm7wz/92/UFK8rqhKXsDLbF3jstOsmwjno=;
        b=jHa8VXTkDjRuJuXbaay3apvLS0xpkLsdL7KrxSKMO475qS5Na3ss1lRuftoNhbOH1M
         bsvC/VHDrkvqf41OKFMwIUtsqTsJXtE227RCpVM9MsYZ9nCRiEaR406qgma9w2tmDQKB
         2314tK6IhBL83g5YjE+akh9D9Gycmfimyh/evkXID3gwF9/Lea7q/W3rk7/5iis2fKiR
         HZJ6WhsY/nO/BOX5XDQNtq0e6+QPTvkQYJPHkDSBN7eTXBMNZDKU1cR77VEOr2QWYTDw
         Dj9XMH15FapuD8l4HiSw3BIAHGXBdNLCbFTWmwH8yirl4qtA8a05kp7GJ6yfLM1GsyML
         Ytaw==
X-Forwarded-Encrypted: i=1; AKwUvByv9fIEjwG4ZCQ9rmzniEEYmeJ/8/wIxLsODTJW27+E8YxGiriyLqqtmkTlwuOIJC93bm5ss+9Ohy5aPQJ+@vger.kernel.org
X-Gm-Message-State: AFq9FYLY0WS9GUN1igdt7bFqVApOWL9vHwErc4Dtx6Lo4yUc3G65vPjo
	0w3MypXju7EtQxMNw9KmCZ376eMnvdT1eOrReVoqdOw/i38Hoc/KJNpruIusfCcCluE14jLFCnB
	69/Fa9DfmiVIEzbdi+UnMwtl3m7hoBbRDKprGta90LnAcvt0DIwcRIRE4o7CrJjyavmZB
X-Gm-Gg: AYBFou20HNRT2JZTrv+Bf4GrfJsBv7GKIpGMnOVOu30aYnKR2oGKoCH/speaS4mqOYy
	FLEU3JDQnT9KOm3ue5WZAz4SJabtrdG7u73p7XYHz8xXDPG4GybZVfAX1bYIUUuQxE2bt+UwTsP
	6EPKufNbmzA2n3bUVokWs2XhQdUp7fbJbDSkJTL0M1ssqa3iHV0Wv+17XfqYs/ZRH9BUwWst8Ec
	FkdXbBSkhs7wDTP3/9WnPV16JCYidNhBHYPOJ/b9OL3T342SMjyKVvmkuiKaFnu4/yq7UkT1F7k
	EYhatgxkfUah0vrAF6h8NFkSwBtXxrXIWAPjclOF62LlQPkB2dOB4qXuRCqFvj8gJw1CJCSqwDc
	/lmjR34M2PwqqhZ53VF97CQ==
X-Received: by 2002:a05:620a:3186:b0:939:8bc:8826 with SMTP id af79cd13be357-93ebd10c0e2mr2382464785a.2.1791889032625;
        Tue, 13 Oct 2026 03:57:12 -0700 (PDT)
X-Received: by 2002:a05:620a:3186:b0:939:8bc:8826 with SMTP id af79cd13be357-93ebd10c0e2mr2382460385a.2.1791889032022;
        Tue, 13 Oct 2026 03:57:12 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b179dd395dsm6278732a12.17.2026.10.13.03.57.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 03:57:10 -0700 (PDT)
Message-ID: <5fd88970-e8fe-4dc4-bdf1-f0e9447f4462@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 12:57:07 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] phy: phy-snps-eusb2: Enable AHB2PHY bus clock on Nord
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261008015017.3359804-1-shengchao.guo@oss.qualcomm.com>
 <20261008015017.3359804-4-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261008015017.3359804-4-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=VqC2kO2n c=1 sm=1 tr=0 ts=6ace0e89 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=GgWLzTfdAFqkLYX6_IEA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 7ZRu1Q9TXXy3NYjny4-w555SwPFjzLdv
X-Proofpoint-ORIG-GUID: 7ZRu1Q9TXXy3NYjny4-w555SwPFjzLdv
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0MyBTYWx0ZWRfX8HvRcJVEBwic
 1S8669A+5nGn7nWlei/cnh7u0qVEfPtZ6lNyxcRLvvYD9fmYggbzoDefO28fZzXQbJ7Df9q8SUX
 nV4AsV18W21TnajFcdfvR9az4BJHqOc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0MyBTYWx0ZWRfXx6E0MpZhZgGf
 1NgdOdUQlSmS6jkV9hEsq30Ik0d09t6Mg7IVoEsn48UfPhkcIKCzOkzPhaqevvcJ63WbhqgZ4Up
 pDFQyNpEGHPddrGUQiYzLYXD8WDeZXr8UwhSBYy++kX4o67nK9J6Y0yc6Xl05aeJnGnMey62/ix
 f7zmLLHbWCpPzqkD07zjh7nqSPLxfOdcreIhsuBGIS5mZqy+xKR+dcu70E1v1LzCm2UGhRoUots
 ORbo1mrZ4EM7CcpQ5Tl+o7TAlkQGSwsP/2UphZmVVZaoNhC6mOPIuJgJ75lF8yoI7YRL6IaXwZ5
 OieZRnm9UOvuPUCNLsFUlYAK3kaaKI9oPqmiQfh2SkV7jlC3DD9ck7BbZmtpaOX/ngoimnkUJM7
 ESK9nx/8kjEZOMxfAglt9kRr2stUY+V85e4YFY/ww0S0aid+ha5RmqyV9aLz4HSNBz2lx0cstHx
 nRLGo89iiHiFnkYb04A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 phishscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130043

On 10/8/26 3:50 AM, Shawn Guo wrote:
> On Nord, the eUSB2 PHY registers sit behind the AHB2PHY_0 bridge, gated
> by NE_GCC_AHB2PHY_CLK. The Nord PHY currently matches the sm8550
> fallback, which only requests the "ref" clock, so the bridge clock is
> never enabled by the PHY. When nothing else holds it, e.g. on boards
> where only the USB20-only controller is in use, clk_disable_unused()
> gates the bridge and PHY init accesses go nowhere:
> 
>   xhci-hcd xhci-hcd.2.auto: can't setup: -110
> 
> Add Nord-specific match data that requests both "ref" and "bus" clocks,
> reusing the existing Qualcomm init sequence. The bus clock is enabled
> and disabled together with the ref clock in phy init/exit.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
