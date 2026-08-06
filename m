Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D268E78F2F
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Aug 2026 06:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785998863; cv=none; b=LVHZuDxugklydzdTmhwmBROOzj3QiVKySCVNhLVLB7NqpPGMGSGa7QTQrJQBSzavkMXjPnhKWHVPiYOt/t23wn0KprDc43oYGSkKErj1bcfPeWyjX49VbgPDer03VN/f089MwlkISZ6y3nta985KdXhq7gDkonUd1AlEtPT83U4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785998863; c=relaxed/simple;
	bh=mfcLSBBh2K5RahyMEi7FbWhptWuC7NOml9wRV9n0qw8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gjetezqQ5y8P4kk3U6IBP2SG8dJPj/SgDDVXwJ7WO3286CvgAfRdkM1/LT3UkA53yMw5hR3B2hZ/zQN3Q5CYteJqz7wjPud6qm1izofSOm/AChngJJn9FWzuy5k95rvlbZbD52ZrPiyOsN6ARSXhnFzXa7thLigKcWeXnh+iDvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pl40vv5z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BlqPfXtN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pl40vv5z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BlqPfXtN"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 675Nb9p9731547
	for <linux-arm-msm@vger.kernel.org>; Thu, 6 Aug 2026 06:47:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sANdx/y8OUkXFWpqvS8Ysve1GT7xFYY0KjCx9nxXRik=; b=Pl40vv5zGtnyVu0r
	TGrOWc3vdfVz+LQqfHTplqCoLYfbrBuDCXN8gDt7An366hbJIsNsNoOVQlYwQM6F
	ePmq2egG3zNuDsyqjOqU+yyionc46pAaUhgiIoC1tj1qIolfyk1+/857htEfNP+W
	ZgJXXk/E+3X3AZmQlwWLuYd6IqJqsXmg+8y1ESFf4+qRSQs1PAU0x16zBm0ZmZUT
	OE71g/tFLxLCLwg25+wTA8MwMwplPawLwe+4WBduUWv1thEZFxlDdoIkk93HIRXw
	dqCH3FgsrVVJ3JWKT3AUMFrJ4XqRbx4jt5zstiTIqhi6YF9C6aZKp4/PYxeQSjUE
	nLZYvA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv5dk41q4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 06:47:40 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cfa55c9430so18388555ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Aug 2026 23:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785998860; x=1786603660; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sANdx/y8OUkXFWpqvS8Ysve1GT7xFYY0KjCx9nxXRik=;
        b=BlqPfXtNF5iJAknSwpvz5IVM8wTThW1oSToIHgBEaEOaO+54at7qdtorESAyQSRnDG
         CxwAEDn8VUTkEUK7JTF6d7q/wp9fNbKWL5Mg5uT7KTMYAEQo6tzN/LM7DOtRDW3OP5DN
         +UXpYM1PUEk7Lfs2jIXD2rFiBSObr4GeqZS8M5gDqzNFFg9h6Uxmgz39mM0+8P46Ugw9
         PqyRDDPwLr3r9p4mt4tbx5y0F0dkqmMT0Y1vPN37qVXSAm/tg1Mnbrfw1E/xliIeqegl
         7WzkVA6CCIowWL5HWxbVLrNaDKIyJWN3TKS5ndfqvGMK2jCGcikHL9KQo3s3Re586gkT
         n8AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785998860; x=1786603660;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sANdx/y8OUkXFWpqvS8Ysve1GT7xFYY0KjCx9nxXRik=;
        b=s2RsOLJ86LetvqJNircgMH4CZHh/vQ+D8zuv7KaboyLwODVuFi34244S0PdiKhA//3
         NHSkMvIU/WG5yID2LL7/305C8Cta3v8EZOkuX7MY99xflIQ1HYUHvF7MkDDqLoc7YSnv
         50UsVfJKguQayMpR619dKiuS5Fz4zVeSwqLQ3MxO9b70prdk1bH64uUfxUX/WDl4pzlZ
         srCb9xAnP6Yc6KizqHZPD8p3MSXnOzb18vSMJpU5UW+9ePfuFi6lAVxgCaNTMDa2QtGV
         8WF+zoPg5y3ueVac2LYMpC4HF8ks3ioUVQKOO+2472jrsvmF1bftYdK+EPLnIT38Acti
         J6lw==
X-Gm-Message-State: AOJu0YzPMmiXSZq0+Z/I5EtHK/UxMO0WzTnFTMBOhMqjYCjn0dzF4J57
	aJrKUKdxTF8/EDYLVWa7M2JKkcKqIBhadfnzE0UBc517CMydXB64zQPWXSH8is0dyzHFM23fhne
	aFIcjQYXK6Zs+a/tMF24OsXgYPSbj15qONyeZOjOm4Dj35SCy5cMNxM7mH3G4G1+HgNSs
X-Gm-Gg: AR+sD13w2o/HbYMBxqOkqfzraJk8R7s7xVy/1LzsKgZAJmvnJRcCY/xJKfpvsJDxUf/
	qKbS4L9nW2RXqOUJsoo0MgBG134MZnhV4S+PksyqOP9t8W+lIfHBicUYKJJNLEU/VZWvqkg5Gia
	0kgwtT2V0HPJVvWIImYLCSTIDkafV7BFAubqvf6musOxWW5x89wdz/Y6CTGGeOjN0jFsvBz5GwJ
	YtSMB+Tmgefto17rXUCI07KKBZVWmTEA2PP883iYA+PHCptzbXBvccHi3DL0SS+YANI9V4j0xdz
	X7uz9NHRb6TPxpFqi7u6gZtaEFsJkkD5k15I+s6O8v9zLgScJspxOOvM8YgtsMFeO96PfTIxZfd
	DJrZHuE0lk5I/bhnsVHQ2/Web4bYXjOPJMw==
X-Received: by 2002:a17:902:e542:b0:2c9:c991:6ed3 with SMTP id d9443c01a7336-2d0ca7fbb60mr128056925ad.12.1785998860279;
        Wed, 05 Aug 2026 23:47:40 -0700 (PDT)
X-Received: by 2002:a17:902:e542:b0:2c9:c991:6ed3 with SMTP id d9443c01a7336-2d0ca7fbb60mr128056665ad.12.1785998859839;
        Wed, 05 Aug 2026 23:47:39 -0700 (PDT)
Received: from [10.217.198.68] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d0d118a2dfsm12677995ad.28.2026.08.05.23.47.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2026 23:47:39 -0700 (PDT)
Message-ID: <9e9071a4-cd9e-4aa1-8f2a-a607451084ce@oss.qualcomm.com>
Date: Thu, 6 Aug 2026 12:17:35 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] soc: qcom: rpmh-rsc: Output debug information from
 RSC
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Raju P.L.S.S.S.N" <quic_rplsssn@quicinc.com>
References: <20260717-rpmh-timeout-debug-v1-v2-0-81ade4fcdb49@oss.qualcomm.com>
 <20260717-rpmh-timeout-debug-v1-v2-3-81ade4fcdb49@oss.qualcomm.com>
Content-Language: en-US
From: Navya Malempati <navya.malempati@oss.qualcomm.com>
In-Reply-To: <20260717-rpmh-timeout-debug-v1-v2-3-81ade4fcdb49@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: RnqcUKHq2jT1HbpsA-Gc0rrKMeZUcuWf
X-Authority-Analysis: v=2.4 cv=Or9/DS/t c=1 sm=1 tr=0 ts=6a742e0c cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=LpQP-O61AAAA:8 a=EUspDBNiAAAA:8 a=lvYFgbDYtS1g-2Oy9MgA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=pioyyrs4ZptJ924tMmac:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA1MCBTYWx0ZWRfX7TTaLMq0Fpvd
 OaI6KCqgvJmdQuhLhwqX2dszTm7yu/il/qEozJ7zuiz5eTsiy4dlzOwAvLE2+O/K58fpHKRQoNW
 JnnSbD/vD1yfTfpym6V/tQoJQp7SAskBikN/D1AhMuh/kACPXFHbcohrvG4OcCrq8oPFAWcZrri
 CjxYse3PYQUmwzJ8uiYGFdOtyrQlrKefgRV9wPk6J5PRiSSCg9A4s2Ukxo+w6dZMAn/Qc8xEN/N
 FwZlLge0ZD8K5UolGqSpL6rqtz439pZvtWruyu+3dfyZbNeXKnqRkKgkDqBalX8A2CyposfVBhB
 ie6Nt2cdDed+D+5aL7UXnNrJqhL3c0GPjdbdiGF9zPrLb+q63lMdDg1L4dXSqP5mZkWGnLUPpWL
 FKNG5tECh+t+5KOj/TxXunPv/4rrKRXtP2xmtwiOfGXcQ04+QxQqTgrfB0Nf1avAd6wHsqFKJxJ
 bny472Si0zhf5DxdlPg==
X-Proofpoint-GUID: RnqcUKHq2jT1HbpsA-Gc0rrKMeZUcuWf
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA1MCBTYWx0ZWRfX0LpHd2JSX4Yx
 hZSzqe9zIDmlaQtvbk9EdVC+zhLMuIqfqZ7k2DpSub6t5mt66nXop9KjvcFsmlKiNSwugJQi2Ta
 ZKIrCxfb0Qc2+sKQVfYMOR9kt9PD7Fc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060050



On 7/17/2026 1:19 PM, Maulik Shah wrote:
> From: "Raju P.L.S.S.S.N" <rplsssn@codeaurora.org>
> 
> When an RPMh transfer times out there is no visibility into which
> TCS was stuck, what commands it was carrying, or whether the
> completion IRQ was pending at the GIC. Add rpmh_rsc_debug() to
> capture this state at timeout:
> 
> - Iterates all in-use TCSes and dumps per-TCS control register
>    state (controller status, AMC mode, IRQ status) and per-command
>    register state (address, data, message ID, completion status).
>    The accelerator type (ARC/VRM/BCM) is decoded from the address
>    using cmd_db_hw_type_str().
> 
> - Queries the GIC pending state for the RSC IRQ via
>    irq_get_irqchip_state() to distinguish two failure modes:
>    * AOSS firmware did not respond (IRQ never fired)
>    * Linux lockup (IRQ pending at GIC but handler never ran)
> 
> - Reports the completion object state to cross-check with the
>    IRQ status.
> 
> Store the IRQ number in struct rsc_drv to enable the GIC query.
> 
> Signed-off-by: Raju P.L.S.S.S.N <rplsssn@codeaurora.org>
> Co-developed-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
Reviewed-by: Navya Malempati <navya.malempati@oss.qualcomm.com>

Thanks,
Navya
