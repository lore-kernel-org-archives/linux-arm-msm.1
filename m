Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A5F23BD06
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 03:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787629176; cv=none; b=TyG0KwbZQnMCips6/I97SN9DTyfjUrFq0mS0P68Wl+oEnGwzWkWxXkEuiTCqCVK3rFxTenoitX9TjlTHpvESDKpYlRtEyneRdqfpsE/+8ge9qCjNmLDi88Zz33HpfAApflMDb8NJT6qQ9lC2f+Vhkez+/7RDtUu5bG6Jecr1GuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787629176; c=relaxed/simple;
	bh=b5JACez2nK38fxDSCnVCINWrSOrr4lZXyjQAUn2KU1Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iPFEC7RW/V7b1UXmcKBv+7ENg0c+RmPOOhLI1lKZBtP1rsumnTEWOKb9NgI93Tz+giLA5lw9ki4VIi0Gv4mb7xgVZCD4WGKFH6j8063HUvMCFsiWDRybeTdP2p5tDGyZLMSafYps5S12+/+huhog9RiGr1uMDguEcJKQEMcPNSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rh/ABkoE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Whe7MsnM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rh/ABkoE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Whe7MsnM"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P2RKuO023537
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 03:39:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	84HwQDQ0U0qytZHjgh7YElDDyTGY9iMA6qEWfxiQS7I=; b=Rh/ABkoEOabv9s+i
	vosYXnrH2fDLAlBacNZ2SpgUMInDQP8D2OAymZQDMvQHbylwKJvI/5a6Q6kf517J
	3VkCc0imrBG/U70b0ZfHJ2brAgybv42s9+vIsDBOPAJFwMyVjAm3stEVkojXLBUN
	/ImbNS6y9lBWSXSkYrZvwMH54nzLwKR0jePDny6EMnHRc9/yZ1jbDxID2AN8LCfg
	4m/cEFfJLzgQkOromV5P3eY20MVlxWUcQqCR7uKIq3+UdiBTJf8k/aTiR/tKsKUG
	ZKCwmHl5KQCGdPC5VjMb1EjsmNhkGLyNwVKzePyyN9d/55CJV0IgMTuev2OPjqjc
	u9Kg9Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8kdskvwt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 03:39:34 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38dbe39ce62so417843a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 20:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787629174; x=1788233974; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=84HwQDQ0U0qytZHjgh7YElDDyTGY9iMA6qEWfxiQS7I=;
        b=Whe7MsnM8zqqRYwL7nPmPASPe3IcGa2adwjCnCiFSFGodWTj2pkYeHSWZe8OF0i8mK
         aQmmjRxivddLGclrVe9KfRpTSiQ97+uI0sZl8DbE1+l14KbWSWnDSw4FupdJR0b1//Mo
         orVtgiUcGfa+b84wdRWjZEl0g5Vh+LjuAQx+3G/aH9J74EBV8gwMGjoin9A2YfHTjtyD
         xWKYcO+2YuYlC9isGl7VsZWuB3FZFh64Dzl5MCYMu3K9lfZX3PeRxMYthwfuGbThJreQ
         7CdykMFKvDBNu2VfaAGVTRtVcY+4ZLy1tGlZ2AqXIejQQQ+A31Wgw+LfRtYcWk3w1ARi
         B6LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787629174; x=1788233974;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=84HwQDQ0U0qytZHjgh7YElDDyTGY9iMA6qEWfxiQS7I=;
        b=lE/ltJ74ABfRkB5uEVRl/KEBet+ru2yFVf7Q6YHumtKmfC9d1TGLZqmaQ9sJZkX9sx
         I9w6UwkboenXSGlXW6mhNXI1yORkCjLRsF6YwBIlqRHKH6cgAyTEMmJE5fkMCzYIvWGY
         KIf525GAF/AhQlzyLOJ4h1LBcLkMmuHd22d+bDwVzoXzgadhfsr+J8ycPv0byZwI1Qwj
         EZY2dMD5HuFRWmd1+ba/yEauBieZreV/rcQdXwQiD3kGIl61GR3/4CKttXWMigLOPOw5
         q6BeZwrDqiHiJs9CbJRzNaDIlovXWKywfnN6ff9FlWmjAuTVxRhLeYOkUQkhVo8I+ArR
         BoIQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq6rMi5LCTeZocFSV3o5O/lxcnZOdTLbaRNZLH+GXVV4t+jaqwvh2EgziPg2Lx054uVB/X06PnE57M/54U/@vger.kernel.org
X-Gm-Message-State: AFuF++lBffR+7X7HM8/ZV6zgvKTS4Pn3GHvm0cDyPBWVS4NGdoxhSRyS
	ebpGDQnJTGYFjEIzLYaVU71O6pcXIEpb4Cqq9UElw/sHn22a6dDJ78wGkyUu2I6EVDnz9MzNFg9
	+Enfeomihm61R1qHoeg/o37FXksG74wsa30hGyKpiRn4kxa8DvRYbwFLqZgKsmtYgXN4+
X-Gm-Gg: AR+sD12ZhC6JykSCdOJkKmYr+dLE8yiG6PbBWXyHwbylHgWnMUF458uVpLKj08bu8Uc
	qlm6qO6wDe74N+M2Yn3IQzDhhPogZhfKJk9BIMxfhhB0sv+46maUnuh48hRMv/mSbDmCYde5w78
	VBB6wwo29Z027TJ54DGoFpw8Xj8XA+j4RR0YMlMtQLveeCelW3qSrShK4Z3JfwWapOO4QIXr9o2
	c39hKGvYb3hnTG3yCh3wTGc8hPDk86VZrAzUKsc2f6LIeMSuLHPBO7k5mWza8Egm/J9q6xyZl2B
	/7Sq2Z1TgpNgm8axARQjeNnYR6Igzp3wQIXJm98CkKTbeJUFblny4xqw6fJYSXCYyvO92VKVVWl
	56oTauw8RMwuQ1F77OveS6zIS5qbWukDpHe5bfrLFosYXXTy9zRhWFbZa3Lve5VYhZgSv
X-Received: by 2002:a17:90b:3e50:b0:38e:c232:9d2c with SMTP id 98e67ed59e1d1-396459f432bmr4215572a91.2.1787629174237;
        Mon, 24 Aug 2026 20:39:34 -0700 (PDT)
X-Received: by 2002:a17:90b:3e50:b0:38e:c232:9d2c with SMTP id 98e67ed59e1d1-396459f432bmr4215543a91.2.1787629173814;
        Mon, 24 Aug 2026 20:39:33 -0700 (PDT)
Received: from [10.133.33.69] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39645d31e8csm1916325a91.9.2026.08.24.20.39.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 20:39:33 -0700 (PDT)
Message-ID: <ee493f8b-aeed-4481-91e3-1a17297a2bec@oss.qualcomm.com>
Date: Tue, 25 Aug 2026 11:39:28 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] input: misc: Add Qualcomm SPMI PMIC haptics driver
To: David Heidelberg <david@ixit.cz>, linux-arm-msm@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260806-qcom-spmi-haptics-v6-0-19fcecd5204f@oss.qualcomm.com>
 <20260806-qcom-spmi-haptics-v6-2-19fcecd5204f@oss.qualcomm.com>
 <214bbcf7-38ba-458b-81ba-d7f3a42cb73d@ixit.cz>
 <7df4c69d-9d7b-418f-b7dc-a03a710dfb13@ixit.cz>
Content-Language: en-US
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
In-Reply-To: <7df4c69d-9d7b-418f-b7dc-a03a710dfb13@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDAyOCBTYWx0ZWRfX6sKEjMBahiua
 vhhSGEtebFNrQ+LEqC5GDUSbnCUpEzgLJGoZ8BJgl87njySWwUYd1cxhff4F1aYP/1i+hfNfUBU
 cXPd/D8TiLmKDzY4NMzqaC109G4zs3c=
X-Proofpoint-ORIG-GUID: LgGojDTX1Mra0kYM6mBDAxz9Cg8ywAG3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDAyOCBTYWx0ZWRfX6tYtmGSz06zM
 I2RALuJcTxggonVeiPzhui/2v+R8+Aqb/YTkibeTOAwwGRnE5Aw/mpsA/8/rHAwa0UDpI8DF9KM
 F/Cu5e2Mon3wft8+Aq6oOQBFiMIcmTno7d2iIZl2qtKPSA3HHP1IqFfBB/F2gGz21xYvPFmqTPh
 6JhiCWAy0XcqDmq4rRIXeJR+KFy9cgfj/A7SfxJhqpbkMV5dapLYgeCB5pwhe2sQtoLSIODHADP
 iJgqotaXBpGbBD3gDeJlVsl42AjbV4Rai3XZLi5+66Q3/QFqtVToWEWfxR1IVXvb/TlO5hNqrb+
 JLgdIzug4GjyGfWPSYZLsJqFZ7/q0HyButAtG8mZu1ko8wcx0YWlKRi98cDzc4JQLUoRwH2taoT
 CqdLHinbJnh++etd7SB7IHZ9DUMGrDNq9NiYEEl3chWGhubXg8tiJhRr54/2YZxYFbgN2CN4iZf
 DUe2hByOySJLBdIBWuA==
X-Proofpoint-GUID: LgGojDTX1Mra0kYM6mBDAxz9Cg8ywAG3
X-Authority-Analysis: v=2.4 cv=d8DFDxjE c=1 sm=1 tr=0 ts=6a8d0e76 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=5_8ev1SDl5wn8iQIMj0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_01,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250028



On 8/23/2026 7:36 PM, David Heidelberg wrote:
> P.S. Could you post together with the PMIH0108 device-tree part and ideally the 
> device integration you testing with? (or at least share the WIP DT, if it's not 
> finished yet)

I left them out when I sent patch v2 because there were several
board-specific changes, and it was easier for me to revise the driver
change without them. I’ll resend them once the binding and driver
changes are accepted. You can use the example that I replied here if you
want to test them out:

https://lore.kernel.org/linux-input/02269d67-41e3-48eb-9ce1-e3775a4c2eaa@oss.qualcomm.com/

Please remember to update "qcom,vmax-microvolt" and "qcom,lra-period-us"
parameters to match with the LRA actuator that's mounted on your board.

Thanks
Fenglin
