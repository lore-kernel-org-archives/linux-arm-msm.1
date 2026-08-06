Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E344235AC31
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Aug 2026 06:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785998751; cv=none; b=GwOrGEevpXbdtIVLW4gDVHoaz5Dik0IFEvtx3YHy4dF7mHvpOEECsfPBPM1HQLc72L2y4E1rhFHTHdg8wtkiuHnFuSvUteXrTr8Ewg7wWIZiDEkLTtXsCUJUH4fvtzrAcoy+0+FbW50+Z+/TbZfQelmDBJFpk4g9NInA0pq5ewA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785998751; c=relaxed/simple;
	bh=TNdqO7brRwaEyGj/qSF80gr/Z52pRjnjirsZi2hKnAs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pz9sOPqdTL/3kvSprl0OiNgZzk1nAUpjy/U2Zixc5JerXNu+ewRyVUXhUFwPafiN/tg/9bpTCq09s7ci2Z9r8dqlZjSguZAMsuINZvlBnRclPAIT2TT6kI99ioUF1GcdvRyouZVzhI2BRcoTIZM6eWentjzt7awGV98awQaPGrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YhTQWEca; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fx3OkhEQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YhTQWEca";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fx3OkhEQ"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 675Napif1354133
	for <linux-arm-msm@vger.kernel.org>; Thu, 6 Aug 2026 06:45:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BMl+CwunyU4TULlNX31iYhZaOG7oZ8f+KS+sqBYQ9gI=; b=YhTQWEca77txrB95
	cCDZaCHwBHhOIETmkUmwnvqzd41W4szpoyGfKxv7NonUf2yMk6vs4VKeFJMPh8NG
	eaOHs4Ad5TqC3odGsEEZYpB98+G1/ISKtLI1f4k9gWiFDagot1cnuxI44FtmI6KV
	TWcHTVcudyjrq9H2geNscVhG1L2oej9CCInPA+URGCTrNuE3naB9ANT+UFQZFCiE
	k2w9TErmzf4PxbAuHyqt6TSm8MSrhMJl2HHnwSFEQK4697mKGfE7IAUbGurc2CZj
	o0OrUcdSvCnYukGUYuBK4uiG6vTtnGwyheOsQOnJ6AVXkek3cqgD3QfFDQSrRk9M
	7UwcmQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv9dmjrm1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 06:45:48 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cfe48ca1efso27151795ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Aug 2026 23:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785998747; x=1786603547; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BMl+CwunyU4TULlNX31iYhZaOG7oZ8f+KS+sqBYQ9gI=;
        b=fx3OkhEQZfLHUsUxsRSUS+cfM8/NdiX/htDLJV9d0Ge0/st6Ih54bcsTszJwFSQjSl
         XdGMevbZhIQyyT/D5iBF18Tyi+MgWc+f6/ZQ38Ju/z3YUvrbdD8A7nsQ2F4GSwnaKCEF
         4oz5eALpsFiWRJTBewQ4QOMWUQvbNhGmtAe2wEMvlH4yXgLK/t6S04COoOzAj0559eQb
         K34SPE7sOCINTCfxQJb6dU3Bb5uvHMpLfUUCJKe4OcHLKYmqd1FsJg5FL3pa85t1bKXg
         ETyW2vbpTufXO47glAlHib37FpzUCeovsWapKG26HLoRva+Merzyxxb2oWthz5wEUXDz
         pKgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785998747; x=1786603547;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BMl+CwunyU4TULlNX31iYhZaOG7oZ8f+KS+sqBYQ9gI=;
        b=c83j72DKsz2cB6SIE1LAyhntD2sZzcb8A7bjc99lov1FgQpS1hJ6gMwl0yMLbatPir
         +wxiXiTnJWVj1B7DfwPCoFB6EA8t7I6NWYvdxNiiKRFrLTmudZrO6t33+WHTqMykDCfL
         W69E+hiyFN3qHKID8dsZIMwIQvLryd5TM9UyYdnd6YlxTkpUDAApS4JXFB3plKxh8vY4
         /gHnRXcaH4iD8uO+/MnWbDouxPP+n7WGU39XxhYoe3/UWqI7IGFnF8IHn8oe32MKbXVn
         NyFyCJBlaenblHfcISCmxRb7XkKnOQzVCunkVWBrTvjqdM/twfKKLEcNoljC8m/TWSUp
         n/dg==
X-Gm-Message-State: AOJu0YwLXGHsd7UAHhmrH+oLgLzTtsiikWQJttxdn6CAwaJeZzXHtq2S
	W0gnKI54h6jKMo4yUh/AdrDvxNJKrXZOg8LCzfv8/+qOB1H5wesLNlaFWQg7W5NFuhV+aob3n0W
	kh5D74ODp7SyV/4RcXIj1lBvMN0SoXsSi7Cae3VkPkGBVZWiDPeYU+kFgCxhC+fGWWqbj
X-Gm-Gg: AR+sD11tZEVFtWs4E5niQotKlkkotmpvfpMpn9Xx9li6wy3t/VJ3eKv4MUWEQrs4Gv7
	BU8QzLK3X0PS/xad8L7Cvw/7xDgCEk/eFnxpnmxUlTM4y5g0PxBrztphy+xaUmZgGoetQZLlMEK
	LUXG1o7Jl772So+dmW9GJiwpTM8Lz2WG2UbWWt1Yz6J411t4MLTaDuX9di3hs8ZYm1GTQXmv+wa
	uO37wEcMq0QQu1yJAT3392MdQlGrk0p/21lgHvJWB6Qu/PltD52Cvg44AoGu5GvkIALKhhHhQOf
	7FsNev/gyHTzYtUeXW49/qDhfxqjceG+vvFRQbKBwYEcl5sYQSAY+9USTLUR1d3eLAHrW4jcw6G
	rAB+GdfCQi/ZY6EHxGLjEaRd9h0+xaffPMg==
X-Received: by 2002:a17:903:388b:b0:2cc:76fd:6537 with SMTP id d9443c01a7336-2d0ca7aebd5mr146961725ad.2.1785998747482;
        Wed, 05 Aug 2026 23:45:47 -0700 (PDT)
X-Received: by 2002:a17:903:388b:b0:2cc:76fd:6537 with SMTP id d9443c01a7336-2d0ca7aebd5mr146961435ad.2.1785998747094;
        Wed, 05 Aug 2026 23:45:47 -0700 (PDT)
Received: from [10.217.198.68] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d0aa4d9b86sm26109775ad.76.2026.08.05.23.45.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2026 23:45:46 -0700 (PDT)
Message-ID: <1e032c84-cee8-45ef-9cf3-7654de85778a@oss.qualcomm.com>
Date: Thu, 6 Aug 2026 12:15:43 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] soc: qcom: cmd-db: add reverse address-to-name
 lookup
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260717-rpmh-timeout-debug-v1-v2-0-81ade4fcdb49@oss.qualcomm.com>
 <20260717-rpmh-timeout-debug-v1-v2-2-81ade4fcdb49@oss.qualcomm.com>
Content-Language: en-US
From: Navya Malempati <navya.malempati@oss.qualcomm.com>
In-Reply-To: <20260717-rpmh-timeout-debug-v1-v2-2-81ade4fcdb49@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TJR1jVla c=1 sm=1 tr=0 ts=6a742d9c cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=mXvhL1AVVtzIk_KeqgUA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: cZvro_6P-cyRJvFnNtx58GWx4DAhtLmU
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA1MCBTYWx0ZWRfX+M1aKRphny+v
 N55cICediA8znTBKBq2ulMNZkexgZCDBYI+Ae//C4We+sTZSauIsSSg6+AqoWd1WayFSR9mI4s7
 sqaJVELMIjFVcdTImxvwB59xFfbIonQ=
X-Proofpoint-ORIG-GUID: cZvro_6P-cyRJvFnNtx58GWx4DAhtLmU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA1MCBTYWx0ZWRfX6YjHJyYT5CBe
 1FiUrwnIr1cDRmJsDiyeHnI+S2HKCSppIs70Q8Me+JDVj0FfMpEP+EgqqZQGYgj9YZgssLI7a0a
 zoxQoa8LtyPh/a469IM+oDpPVbmCTNB18RhW/O/Dx+1xkY0V9Wi+mUDy2PFSUcNQkr9jDHzkcEB
 5o2bNsEAynOcckqHfMWt3kvxMTHoX1YqaIV5qCRPRHWH5W3hu+zRf8Ha/rZgZM4rZ105dvpcckC
 RbZZrOOaEjmti67vxFZLFLpr4HHBRWy5kP1BxWLgMzyVitgsLAOEU64sLY/md0C+l2duQVbZk1R
 mUDRwP0l6Z0pppENQtYcrSUqnMvEn7qjaDnY2qs5QzS8BCVPw3t9EVTTAc3hc2SiDLR6lvTLM8D
 6WMmhQsP3/Vlu1kAXuw0p1O7RY33k+dYSCipgatu0OJmmVHtkdjiXpTMlzDi7in4j5RX70V/Oqn
 uUXseq0gHbWO6Fhr1wg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060050



On 7/17/2026 1:19 PM, Maulik Shah wrote:
> RPMh resource addresses are opaque 32-bit values. While the slave ID
> in bits [19:16] identifies the accelerator type (ARC/VRM/BCM), the
> lower bits encode a resource index that is only meaningful when mapped
> back to the human-readable resource name stored in the command DB
> (e.g. 0x30000 -> cx.lvl).
> 
> Add cmd_db_read_name() to perform this reverse lookup by iterating
> the command DB entries and matching on address. Unlike other exported
> cmd-db APIs which go through cmd_db_get_header() (which calls
> cmd_db_ready() internally), this function iterates cmd_db_header
> directly for address matching, so it calls cmd_db_ready() itself.
> 
> For VRM resources,
> which have up to 4 contiguous 4-byte-aligned addresses per resource,
> the match uses VRM_ADDR() on bits [19:4] so that any sub-address
> (enable, voltage, mode, headroom) resolves to the same resource name.
> 
> Also export CMD_DB_ID_SIZE so callers can size their name buffers
> correctly without open-coding the magic constant 8.
> 
> Assisted-by: Claude:claude-sonnet-4-5
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

Reviewed-by: Navya Malempati <navya.malempati@oss.qualcomm.com>

Thanks,
Navya
