Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1DC23DD87B
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 08:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788165141; cv=none; b=Kv7mzjgQC2jSqLACNU7JfDeBL9KSYVTm9qP6acVSr1s00naOnzvc/nRJ49+5zlNUHJMslGATXH1kBk0MRNfnl+Pb8E05pOWXh9EA3YTNDVnZRiBAqfd/8oDi2BkaWHhGyrpSJW+VAUzWydRhuuw+2vQreaH7j49KszN22vVITOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788165141; c=relaxed/simple;
	bh=3NMhs062UZc5ILZCUDGGwskGdexU3XUISRbyOQx0Kjo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hehV8Vqs/p2u3VbZf2eiz8/zpEtjhSDW6MvRd4EwrYA2jC8mchPdZafKRQ8BYGVcGZyjgSZnVVer9v1TzSFGHJFoY65PU4hIL5WqWy5YXkOmMW4K5pUa06+UglySfxKGVa4nDpVgqOdXXZz7BRqCe02B8v9Gc9e7+B+NznHwZKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jSda9+AO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KDAEw7ST; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jSda9+AO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KDAEw7ST"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V7xao62924397
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 08:32:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=AIjgpRirezWVl6oxXv0vSkqQ
	jd5sysrPBYUj+0rCmUw=; b=jSda9+AOyPQdAL2Hu8VcVeFIKyV/PQsD7VlgE8HI
	J6CfaNA822bMkV1L8dUMnqz4ZHLXkNXS/Yy3vWCeezSa5gqxqHQcP8a6MDoZoihG
	o5ShfvppJZli94Bp6ub5TPB6IjOVKqJ2G4sg0nnyiUeBEViztQiMIp/5xxYJHKjt
	jSlUzaX/NgZazScYGoZP9kJTfkcs47pMaXmb3trHnQMxEmkcbmvFT8D26LeS51Pv
	0yU6jmscUCc9Ds/oemLYs7mGa0F/+8SOssU/gTe3kI+J0/LmyiQhJqEwoV3E/+Kt
	l2TRuOfrPLyI7l/a2l2trOXP2RSsR/VHunht7I7MOkvMdQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gcv7w9ra4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 08:32:17 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9390e7e4c5eso399650385a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 01:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788165137; x=1788769937; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AIjgpRirezWVl6oxXv0vSkqQjd5sysrPBYUj+0rCmUw=;
        b=KDAEw7STX8+vkiyawWGPUWwl/qTXATGAf4rN/14YMJZQ8A29Q84KXLFW41gZ5+bRd2
         qS1n1OsHzKluGbPbBP0D0MDXx6xBY28Gw2tgbs/sUFtOnOc7uQ0lJvChPQQH3lL2822o
         7ynM4wCpzqCsk0HM2z9BhX+oCsvz2S82b0ysS8Yh/Ep0h2R358Np+x2Tp8m9Fi0V1qB3
         uA2eMM65hhS04H7GYgkR0Qqqbyo868dULj/vib92boqvYX/dLyFrELddaG9YFEBwbLwz
         reaBP9f7DYRTev6agGoTS+r6JblZ8lP1s66qICsAuf/oSQ8L1Et76Ta0flUlYE4eZblf
         SEDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788165137; x=1788769937;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AIjgpRirezWVl6oxXv0vSkqQjd5sysrPBYUj+0rCmUw=;
        b=heVcBdcL+h4Oh/0rzBaakDcin3kH477lSVD8Jylietxt4kCN9Fxq6Nhs2iW+b+MDhI
         7CnXncg9H+OMut4SPHHgTFqJEJ2yQV+TWop7uwisdnkA2Qjq0aKrz0t2W+6EmWq1PufS
         vxSt36aZ72hm7RymgUAcf0G6NXjSkrJsExwndF3gLlpNvZ3mdRTCMsSJ53EHZEnTRYWK
         SctO6GkRCIsJgH1zlsg4yaio4oBec7gA5aEwWfFDY/HJOuT9PzwNFEoennT1+/H5AJ5o
         rey8GpkoL3u6COsUhPKD3R76rF/W0Q85p348YQR9mig6+EoJ907TTNPTEkqROf6YuANO
         CkxQ==
X-Forwarded-Encrypted: i=1; AHgh+RpJ03jgIT1FXa9g4EAINxTZW73kpDi4q5plyFk3eaVtaDhNFJu1G7P4iublsNGfWjj4TG12ytMhu7joH+PI@vger.kernel.org
X-Gm-Message-State: AFuF++n7EX1HAkCqD9GJQFyN8szSDOa8IjID905qrhjtzWq1S5VBIjTJ
	1sh+oSOAN85cU3dGgBWc4/EsHvGyIf5HhdY7zN/pF8ArDLVjKOse5QDOYjqWa3fQyO1qr5x02zr
	HXWMsTYN+aqR2saU+wmLzWnCMEa8rHTKwRKywPz+Zhw2pIHXPDx8Z3fqDPYZTIIYln6t5
X-Gm-Gg: AR+sD13rTXBf+LEEHRspHFwNDs8K5a7MDrvlEqWrA1MUPX1EW/opakU4ls2PJj06swc
	e4F3aWVdul4RIQMjH0pHbxJjsIN/gPNzMxX/FZMZrada87Pwszn9BsKoU0DSDglE+TqK3POXytS
	0JXA9PrF25RqNzbW2g8KW3eN8wk8/Ks/ZIodedJVjCKnmbKPRtMekxB3InbED9yi/SeHnTg0F+f
	Y24kEygokRTTdlCIL61xvIZky9EeX4INo+fIq0N/1tir8TuL0HunzlqShDqx9WPR7HjsrPxfvjV
	q5wQssWiC3DbWK64N5Vly5n4R/t+CO/BfiGHQTZMjL7HSuZGa1HpK+P5agFgy9wtQHpKX20zrX9
	oLUo2E1lHOGcq
X-Received: by 2002:a05:620a:9496:b0:937:7db0:409b with SMTP id af79cd13be357-9391396b3ffmr1959344485a.35.1788165136548;
        Mon, 31 Aug 2026 01:32:16 -0700 (PDT)
X-Received: by 2002:a05:620a:9496:b0:937:7db0:409b with SMTP id af79cd13be357-9391396b3ffmr1959341885a.35.1788165135980;
        Mon, 31 Aug 2026 01:32:15 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b90f78244sm311240445e9.10.2026.08.31.01.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 01:32:15 -0700 (PDT)
Date: Mon, 31 Aug 2026 11:32:13 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: qcom: hamoa-crd: Add thermal control
Message-ID: <hjtx5ingztc4ebbbqtkxli25ula5ndvrivzmvkfpighyys3ume@k5egfu6rq64k>
References: <20260830-hamoa-sys-therm-v1-0-27108c40fba5@oss.qualcomm.com>
 <20260830-hamoa-sys-therm-v1-2-27108c40fba5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260830-hamoa-sys-therm-v1-2-27108c40fba5@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=E9f9Y6dl c=1 sm=1 tr=0 ts=6a953c11 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=XIS_O1AsPdluS6PUsbsA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA3MiBTYWx0ZWRfX2q1osnQbFWYY
 tEE4r8+2+LfvgtF8HqUkuXTDDxVM12TnRSxcfSz5jKWjz72/lBqpXdbHTVMYxaBNcidBO0iNoPH
 tG+M3/iD946IF6Eolg2fMKYh/9jegMY=
X-Proofpoint-ORIG-GUID: qxViAxbBFZuImCAHpJwEyzTLBnnhW4dA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA3MiBTYWx0ZWRfXz3pYGMCgUatX
 wwR4t/r0eqFaC9NNuSeMfkTe2Pdhu/tYZN2M8Ub50L64gjn1pfQVyAXbkB4r3gcvaBG2v80kEgJ
 BwwezXFJMn15vykzf3EqT9MJzkBprAVYA+PhkWOTvx3nKUirKagmGA17bQ+GyVtkM1I3hfZ7Iy8
 L7DClPkXmFAB8wOhC1NpPm1Vt+ZTR4BpmCR/lt+7c4rdp+uzZ9vjaOenMo6HKj+mGAJa/D53a30
 igEmz9R2I1xmFCq1btsWh74ODhfn1cpZ1QtL+z9kZCx3vjVCF5n+QTgSBrf8FnZjAlCqZLPklCr
 ja+8gxvBm5yNpXXd5qkmhJ7o6pymW4daCiToZ0ah16MzvC6x9qS4D5zOiL1WENEP/eQUy6hVK+6
 V+hEw3zn8TQA1lYikF7+vgNnKy3dLNugMs0Q4PJ4Bah4vOZkmBIyPfByDTBhZJ2/OXRBsAkutqX
 bGFwvjQtOGE/2YNRiFQ==
X-Proofpoint-GUID: qxViAxbBFZuImCAHpJwEyzTLBnnhW4dA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608310072

On 26-08-30 21:02:03, Bjorn Andersson wrote:
> The "limits" hardware performs rapid thermal management of the CPU
> cores, but during prolonged CPU usage the system's overall temperature
> need to be further managed by software.
> 
> The reference design provides seven "system thermistors", connected to
> the PMK8550 VADC. Particularly interesting is the "keyboard hotspot
> thermistor", which is wired up to sys_therm1.
> 
> Use this to throttle the CPUs, in the same way that we're throttling
> previous generation laptops based on "skin-temp". The trips are chosen
> from those existing examples, but are comparable with the ACPI thermal
> policy.
> 
> While not used for cooling/throttling, also add the other thermal zones
> for temperature reporting purposes.
> 
> Enable thermal-monitor mode for all 7 channels in the ADC.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
