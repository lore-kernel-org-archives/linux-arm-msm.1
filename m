Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE59B41BA76
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 12:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786970340; cv=none; b=in83XaxEb5r8o6AtwMFWPT4rrpRIfAHqoY6lXcoBAeJT6DWp7YYWMmlMVFqXO5Nx5fh1zQ1eY/QazDkW4dmaEl9WZd0/UHcbVMaPR5mRLKa8S4ehoeCXkwnByTIan2vWsPXKDF6lu0z2quQuzkeyxuM4ibZbm6BN04rpfGOSM1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786970340; c=relaxed/simple;
	bh=KYx3mX+tRxRFaAr2MGjO0ScJYuXqBRBzixjQqV5/Tko=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b5EQNXnem+OvqAUUH31mRG0QqFPXGmhw6EzGwxgqTH9T7JW0hHLq91/srzvTkDBQcgo8CqxBopTaRiOCADQBgiH9tujnMmxT584n8Hu7fVfs6RvUMeUgAUN4M0fXRZ42yg1EM/rj07RfKJnqDyobAPYXVCQi6w5lfpT1SP9yhyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EJho7w71; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eW+pijVf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EJho7w71";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eW+pijVf"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HCA6h81871371
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 12:38:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zzZHJBJkIIxfrqdLYm/z/DMmA8vst/cUsQ96Y/1xjDg=; b=EJho7w71vafwzMhR
	3ArrlxASDAsklAfAiIfKUsgBzQ8g7XpcZ9bmPNijpyDquj5IOGQAbWFdHwcQQaCb
	NxxIsaF+m/49zxIptgMlYU3N1Bqs0Dm9dZ/+2LIrLMCqYpdJC0LKnURdBZbIde8l
	pfYnMgeF1jTeUPjyBrLUGjIBB5D0AL2EbR+A5IUA8UKfI5jqayfwp85Vb8vwiRWb
	BVeWK1+AKyNBYwrVTXMFji4fiz7TQ9m5N05umRocXHRAdn0/IWEdMkEGeuZ11+vF
	SkLlaC3c4EpdE093hNSoQvpfDMYh+lDjIW8pdHTlCPmiVsPcgbfSlB7SyezZiLhM
	1g/4xw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3xb1h0sr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 12:38:52 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51bfd1772d8so5108401cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 05:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786970331; x=1787575131; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zzZHJBJkIIxfrqdLYm/z/DMmA8vst/cUsQ96Y/1xjDg=;
        b=eW+pijVf+fpTNPLSK+VBffzuHferXO+bdlJdaGFxwfTnLMq7lMrQ3GWye6dmeThLl2
         pCB9wwwQX9laRBNC2PQkzK0Cxn3tbVtQJTF0ce371CvTdTyqO8+lpnIhgyLAY1hpetJ7
         a6LCRmKO0SYYYfeh7VjwuWRzy+8iZ+FGL1JywaGsig+jTtQAL+b5gpPnsG4pIz2pA9t6
         ofpGcxsi6sJoQ81s4019HELTQTC2I6NNVX2JIglYCqaHaLyDfc09X9gWExPK4fsDcPcQ
         sapav463laIvzB7+vcZhJHN/JZaGTEB31aGmyC+W4OkJwgv9/19+Kx+8EC/XIEWhdn4D
         FaFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786970331; x=1787575131;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zzZHJBJkIIxfrqdLYm/z/DMmA8vst/cUsQ96Y/1xjDg=;
        b=YseNr54No37tySLWxQr11Kb+4VoN5fGI7rvyil0klOhP/PN2WJ5UPZ/+o7hEB/nItP
         JXq/P64Vzay0I/qgEeLbglIpPzJAHDpf2qTHmdur7V4MOBG6Al6v9cEHNYwHaBLXM2D+
         1SXnE9pLsktdaKXp/EaToodY8ReJoW0RZ/Cj9tHByVtQcEs3GxQIiwLeoY45Ktd+u3Bd
         sAAt97WcH80YRUyA0HuM5doNXd84m/940Unf/r2kCAWPJAOIju80Gc8Vg6Vp8rYpZy8Q
         H73Q3dpG2fMuJjmPyKySFnteEpn3JD5ILrtF0bBLT9B55RaCi8tKrH9p29lOo36m9PqF
         nn4Q==
X-Forwarded-Encrypted: i=1; AHgh+RpX2v6wtjIsCpVuEVEVo7FqyUekhD8peujQzld7uOdiZtt1AR1grYoB/LUDQmVqmkMuAJwChV15ftOH1iSy@vger.kernel.org
X-Gm-Message-State: AOJu0YzMPjV/g82xPeYC5jsd9KDt8NmGzcKVrglfD6xECGdBs+4XMf8L
	tLbPkQMbxu6NCagtjRCiCU8hSKv/x/CpqOp5pDURELUu2AE7fweceALD5vhca3H6H10tusoUyt1
	nxiWjnrt9Fxa7PDOtD14OS6J0fd+fSy8x4RNDTJhurRAD0+Ccrftsi3akTrlS1EBlmFtiFo5eBL
	ZL
X-Gm-Gg: AR+sD11aVogq/5I7VUvJaM2R34eJ0NbDpjb2h6PhaCP1N48Ygw/IjrMyk6G8G6sKka7
	Cf59J7kzwTvY/UiXjwyStIpLf0o18/5LxH+JcM81PWZf/tExGZ8bja3PUorWfXQcOByAB4wyY8T
	DxV8PnlorRS56Uvhcu3ex7gk0rt5h7E3kQWqtvmWom0KTG7miQnZ/l34aGnfCjBoAWBIeBUF0+m
	AhV+AGpM+l0fzM7m61lMdRV5G4aJoRSWEsgHh1b7RW0hW93uXicvlbm/Ln4Dkzft16z8nuVkco7
	VYf5VReDtPHxxbOOKJbJGXwWX6ho+6P7maZaBhmt+U2dC8HHgPyTUFp2oYUWzBgIHwiMXx2zCWc
	/72s/j6vW+4oiM4ba2N3WfOtS
X-Received: by 2002:ac8:58c9:0:b0:51c:10e9:ec47 with SMTP id d75a77b69052e-52d85529b51mr185899051cf.5.1786970331277;
        Mon, 17 Aug 2026 05:38:51 -0700 (PDT)
X-Received: by 2002:ac8:58c9:0:b0:51c:10e9:ec47 with SMTP id d75a77b69052e-52d85529b51mr185898611cf.5.1786970330791;
        Mon, 17 Aug 2026 05:38:50 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a16b1bcdd7sm4280841fa.33.2026.08.17.05.38.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 05:38:49 -0700 (PDT)
Message-ID: <f13b0be6-bc1f-4024-9881-59f522566f64@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 14:38:47 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/14] dt-bindings: phy: Document the Qualcomm IPQ5332
 UNIPHY USB Super-speed PHY
To: Krzysztof Kozlowski <krzk@kernel.org>,
        George Moussalem <george.moussalem@outlook.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Praveenkumar I <quic_ipkumar@quicinc.com>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
References: <20260812-ipq5018-usb3-v2-0-8f355d7ff0ef@outlook.com>
 <20260812-ipq5018-usb3-v2-1-8f355d7ff0ef@outlook.com>
 <20260813-alluring-advanced-jackalope-55e5c1@quoll>
 <SN7PR19MB67369ED27F676F6197A0727A9DDB2@SN7PR19MB6736.namprd19.prod.outlook.com>
 <71cfe76b-ea84-47f8-9ff7-945d69efbdcd@kernel.org>
 <34503ae2-9c89-4773-af80-fa7b7439ff23@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <34503ae2-9c89-4773-af80-fa7b7439ff23@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ua9hjqSN c=1 sm=1 tr=0 ts=6a8300dc cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=UszWgs0Efp_EzN_vPCIA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: koqyG_QaCTq4ZOYy22gEi3RK-YN1z9NF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDA5NiBTYWx0ZWRfX3mkH07WCHGpk
 Q5UM5FkjsNpAuKqmt4i78zxoncUoIN+R/BXJ78y7FI7oJIOXHI7OwBqJK/6qlDNGvi2zdtSs8Sj
 EhTnhfAjlXLx22F6gvUFzDQefLuLeJVXTf/cJ+Vgn/1m5HniuTlq4tHZ2vWfLC/itjfPL4+lCKB
 rfjS0g489ZGeSxLhFJKTSp9xp9YP0615vGY87yk1MacKDaNpsiE+xjYJ7Xeo9kanh3e2opGvB9t
 jXcQSOFNgw9szaJOvBxfNQO8k50SO/OjYhq3M0/q6tOJ3s2sRKGiepzpI8zTOGC5Ycp6dnNkndP
 i5HF0oDxk/OytYyQSe9FTVBk0B4dJq351HVPkMEcDgvbDm2XJR4CatBQNNa+CAXtRegjg0DE/44
 dx7Z5PhWDaqoSWHcvLAdrx56Zwu1SG5fA/NO3pCU7lPui/li8qV/dDkwL/FaOE1kDTCCgxzTI9S
 8Yv2cs2m9QfZDpgO0bA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDA5NiBTYWx0ZWRfX9M62K4CnGn/3
 7ICRBz7l+0MBln18FA2AOBoujW9OI3ST33EUnjf8WiDWhXABRTiz0Dkyf11swl3b4c8pC2kFjEo
 egNesHsuh4W4DXe4CllcifEty9F+wg8=
X-Proofpoint-ORIG-GUID: koqyG_QaCTq4ZOYy22gEi3RK-YN1z9NF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170096

On 8/17/26 2:37 PM, Konrad Dybcio wrote:
> On 8/13/26 12:48 PM, Krzysztof Kozlowski wrote:
>> On 13/08/2026 12:28, George Moussalem wrote:
>>>>> +examples:
>>>>> +  - |
>>>>> +    #include <dt-bindings/clock/qcom,ipq5332-gcc.h>
>>>>> +
>>>>> +    phy@4b0000 {
>>>>> +        compatible = "qcom,ipq5332-uniphy-usb-ss-phy";
>>>>> +        reg = <0x4b0000 0x800>;
>>>>
>>>> That is the same address as PCI PHY, so you have one device, not two.
>>>
>>> yes, AFAIK they're separate PHYs (pcie-28lp vs usb-ss-22ull) sharing the
>>> same MMIO register space in IPQ5332. To enable USB3, the compatible
>>> string, clocks, resets, and related USB3 properties override the PCIe
>>> properties. In IPQ5018, the PHYs have different register address spaces,
>>> hence representing it as a new devicetree node.
>>>
>>
>> Same MMIO space is same device, IMO, especially that you have the same
>> registers (looking at the driver).
> 
> It's indeed one device, fittingly named "PCIE+USB COMBO PHY"

so the implementation, matching prior art for similar cases should be:

- phy node with #phy-cells = <1>
- consumer takes a reference through phys = <&phy FOO_PCIE> or FOO_USB3
- new driver in drivers/phy/qualcomm to coordinate the two modes

Konrad
