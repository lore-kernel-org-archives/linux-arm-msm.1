Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B4E4A68A7
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 09:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792055252; cv=none; b=WNyZCUjbNQI7C1axWg+VHsd6WWVh5PHsyo85npsNxbPRqRdHs+GJw2iwoNNBWcvv7l6M9437yYaNECiwxVZ9OA0DH8k7oh1mEOOnbaT/Yvo3w7rKdh1rtVv+2EN2ZArU9yWNQa+AXziBNYdEcE0gkWAMc+PRFD1LExRSn+mxagM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792055252; c=relaxed/simple;
	bh=pT28VLTnN6oTqyjUQpAeSvi86mvUtNst48iT3ncZwpE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RcqO3l3aQhwmJFRQAGu5J3DbHWEEvurOC++kPStwgJOgS3deMNkd2GF9oflqcx4ULOdW6LEkVtE1Xujl4F6s87CPs3/yWn/dMvSlGSZZ+bLOBPmSKY9Mmzm8tgwFZDQOqfNjg4s5KE1Ix2BQ/L/LuvWazRngKn4MFteSNm2qw8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MlojPCFM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kjNZ0T7D; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MlojPCFM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kjNZ0T7D"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F3xUD11641221
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 09:07:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	16+CFkNGAgeFwZgp4qxyDtMVX6T+gcJkkNHWBb7Gj+E=; b=MlojPCFML10sz+jZ
	ez9F3H6RpIIgwnQ7Q7C869aOC6Worx0NvXOsfcLDvXpzx+IU9HM+TJ6wf1trLmFg
	vI0nxWo3T16gyUPtWpAF2NjUG6sEXVE/a3Jjvy3igsnA/DwarmBuBjA2MDh2J1dI
	mRLo7Z6iE2l63xvKMincG1rlBEBMDbmwkzjLr34aCrjFcuHU1WZvqdtipjrki0q0
	N9ync8pq49qLGwApNaabvzyYvpTZo1NwSLDn8ikZgjRbKpY4A6hwoFDVZGgrEBCJ
	LokP1pUF3GlzUL2EXmGX2TgP3b+0OmdaQXn4foaOroDHxmwDpLJvKntkQRxddQ7O
	T7WW+w==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haqdhh7bf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 09:07:30 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9106bb33cdfso13355366d6.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 02:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792055249; x=1792660049; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=16+CFkNGAgeFwZgp4qxyDtMVX6T+gcJkkNHWBb7Gj+E=;
        b=kjNZ0T7DrG4xBVPCclQO0n6MOkPv1Wc4XuVHjfgUBbY8n8AjPdpf/E4fkKt89CwcxB
         HozeR7hkzsF+ZIZ0i5YNuZSbV9Ekhot84oTbqFE+eXLhQSGrWXiJouPQmVyjj5s2oTvF
         LnERUpjiDdacIGktArvLc1QBF3WWZHpLgxIVdsPkpyKbBhP1XSelDM6BnYTme1uDQzyg
         nP2vuU5wUwxB6qI/B+0B211Srn00Wl2XdfVTWIpLTa/XEZDH+485gSQh94nAv4TLCh2a
         EBSqurt4k6lGvKA7hWGl2hmV7xuZEQMDwYHhHzQRWb3A+Lk1hOGlCAYZjzyko8vpA9W9
         HJTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792055249; x=1792660049;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=16+CFkNGAgeFwZgp4qxyDtMVX6T+gcJkkNHWBb7Gj+E=;
        b=vNsuTZ4nzxPNv7JnkeEPp2r1R0NAT/P0DxThUCi3qbCgkXwsqKNoE6TegViPn8sb5n
         WDeDJjmJPcQwqUtwnIqi/qS93kXc2IYDrF0ewaBg9Tu245/Sz8ucf8JL/bmDLDvwmj1o
         +l9TlKMlPg6h32vmtoAb0TdH2KCONwiMe7lBYDWcm6ik9CEEGNU9ZsgMuYmZ7mXKK+Sv
         JdpSb/zd8NgqC++ft2mn9oLa4JB8MT068N0/IH9i1C556fBlOCJtLJZCQCtqDRI/c0mF
         Q1VFsgkHCvRVckeTyffK7xGLQQNwxOYndgiVWCA99nVLjjeTpyUje8zSvoLxyhUcPUf0
         11AQ==
X-Forwarded-Encrypted: i=1; AKwUvBwyKikVr3Zj4ds8W8DZxH8RERQQpTtq9Q0P+dTHGOaqi0gF93ZJbKQXXiheAXqT0CmjFDBxVvCf4oG7u5+o@vger.kernel.org
X-Gm-Message-State: AFq9FYLp9kXNQ7EONZ0bVm7l55lOGDfu5wRGY5TU3yFVL8FcifKgaqEw
	lzUsszf9VOrjnj6v83b/n/1Qj25JNkJQLf5MXWRfwMCfA65+kagKeqzOxe2WoJfSrd27bEhBnm5
	ub0xBXAL/UqBlPalYtBdyCRguoPFYFkt8sgSAFv6Q8H2VhAbMGzrU1h/rQBOL1kiccP0n
X-Gm-Gg: AYBFou2Rf/MjvdJqV3UHBBxZGdNm794Rce3rTzqDulFglnvsazvERx6eEX8POeXJOvs
	1z64GYmZLVKlkJl6Ihbeac4A3iKDhZdRvRLs/X6Z2hD4J78hwqrp1du+YAz/fQ2euS2N//mi71s
	2/mYSyV+mI92pttGEtg5bM0LkX/uykcYydh7ci6Y2fk2kV4t3mM3WGDzejZzSvbILapRjmkvNDZ
	iG/TLZumz+TGfQ4pgjyUIvM0IvJZz07A81NX0N0ND+cIZPMz6+FRn6YkIdIu542coR9B26IhxzW
	3DIt+PE9xqa3y6bmGZCUyYrNmSX3uFnbd81kELS76OB1/cZTaQ63Uj6CwE7iUYrR2Vq/+e2pgnt
	6jWsRYhdwCo1ad8AxiGrqwA==
X-Received: by 2002:a05:620a:458f:b0:93c:61e0:81ff with SMTP id af79cd13be357-93ebd0a3722mr3625340685a.1.1792055249284;
        Thu, 15 Oct 2026 02:07:29 -0700 (PDT)
X-Received: by 2002:a05:620a:458f:b0:93c:61e0:81ff with SMTP id af79cd13be357-93ebd0a3722mr3625337785a.1.1792055248826;
        Thu, 15 Oct 2026 02:07:28 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b203762b86sm2295665a12.3.2026.10.15.02.07.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 02:07:27 -0700 (PDT)
Message-ID: <61d16700-ba79-43e9-91c1-41185363eb92@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 11:07:25 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: mahua-lenovo-thinkpad-t14s-gen7: Add
 Elan touchpad at 0x15
To: Luke Macken <luke@phorex.org>, andersson@kernel.org,
        konradybcio@kernel.org
Cc: abelvesa@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, srinivas.kandagatla@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261014234949.1730808-1-luke@phorex.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261014234949.1730808-1-luke@phorex.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzNiBTYWx0ZWRfX7mc+VycAI/VO
 sCsalL3B/LcNkU1g+gzW8lTKLtPqEdHOLrF46pZoUTDGI3kCRCyhCjV1Ro+RC7uNue1YZP2RbTr
 UxlYdxOU7lXjjH7RWiLZ/w8hTtnxDAufe7b2QGS9AVC2+cBc1+Dgodf0p7M0+DjKdfbNikIHsEC
 d7E1ttFrqGzNLBVUseoShRC5rn2OZi4eqI2I1tb+8Bgablt7JqCOMWlw5WW5PcnLeLIbbStvEUe
 pomy3PeK8+booP83epy+Xamcl9L8lAYy8hHotSzYlXpf13cGhDYLQNLOBe9yzTtY9lnwbqCLuKl
 AiVl45W/j0OoxnqIG2B+KVjigP0ZBIyXflxL9ZN9x1mblB4ZbJtE/KrhAwoQJqhJjTZM1yzN8XR
 2ruzoTJCxGM23x2xaB5Bjq9vRu7MdOOp09JDfQkG4iAiJO3XiCzhaChDzAZMWh7OoZOl/Ia02+M
 agKqWR7W1KgbJhBE0Ug==
X-Proofpoint-GUID: J85HGcVMF-JaLMUgYK7j9AeLHUVnC4H9
X-Authority-Analysis: v=2.4 cv=DeeCOftW c=1 sm=1 tr=0 ts=6ad097d2 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=mO8_gwkcAAAA:8 a=EUspDBNiAAAA:8 a=mPIaOuxEOtotnp-c5OAA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=InTEqNb8lIr1xazlwGwc:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzNiBTYWx0ZWRfX98Q++Rbx2CVU
 AbOqTKTXa+/pk4LDl0BMSdcm/i65CHvyaZZ0/zh2rMA8z8YY7zwtzT5Gk64VcXEvIH0CdKdPKLN
 +qL2RppQLEn4wp10tNy4L/HVIWNm/Jk=
X-Proofpoint-ORIG-GUID: J85HGcVMF-JaLMUgYK7j9AeLHUVnC4H9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150036

On 10/15/26 1:49 AM, Luke Macken wrote:
> Like the T14s Gen 6, the Gen 7 ships with either a Synaptics touchpad at
> I2C address 0x2c or an Elan one at 0x15. The dts only describes the
> Synaptics part, so on Elan units (e.g. 22A7000VUS) the touchpad@2c probe
> fails silently (nothing answers at that address) and there is no
> touchpad, while an I2C scan finds the device at 0x15.
> 
> Describe both, as x1e78100-lenovo-thinkpad-t14s.dtsi does; the absent one
> fails probe harmlessly. Both share the interrupt GPIO, so move the
> tpad_default pinctrl state from the Synaptics node to the i2c0 bus node
> rather than have two nodes claim the same pin.
> 
> Assisted-by: LLM
> Signed-off-by: Luke Macken <luke@phorex.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
