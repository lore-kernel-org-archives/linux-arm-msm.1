Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 212703EDE6D
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 07:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785309645; cv=none; b=WKZW4pofW3QpsCWBA9QykTXpIk42R9s6Bof3nN7pCdtkxr/D77F1kJtuV7dAErADqr+0C2I73oeqgJNlGjJ6eqIg70ehMA8XgEyWDjDh7tknzXrqRGTbtx+UuL4eNWRmWx5iVpSwVs4c/htD6QzxlpHJeCPfioOT8C3P43v30EU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785309645; c=relaxed/simple;
	bh=F3osq0NQLSA1IaSPhSx8AeYk1CenoWaLoKonJzx3tfo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cxD4E/wQ8ziKTzRwaIPxh9e4Q0PkYbrQDmywYUt9cr1Xtm8DxAKG0QYJ0XWf1Q8H039WOJF6EVSxWKjH5RKhwWoEf8Om32apRdnGmzlVxBYcTiEMTjJrOavS7RXu72sRKMrtVInKXBIsetAh3IppsiysMionWfi4xsHQnlyWu9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VanMweZk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fNz8WidP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VanMweZk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fNz8WidP"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T5hIlY912639
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 07:20:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/DgIWD5Lly5mly0/f905YXhV
	vh1IPuOymULqG3vH/W0=; b=VanMweZkX08xlyvYO4bmHTKWP419D/58OYFGnOgO
	SCAh43pGFh/uNtg7nFiBAOt9jzQwb8ZNuYCXQ4W1fyAakMqSXF2h6dHe1r+2THF/
	5hT1u+M66yB74XD/VTwxHJewxHRJkH3Ha7pBkkXIk0QVlOnfIADLMjUo9OhxB0Kw
	iJPHw9E97MKJ+ZaUiaHswLMGExy3d6tnm7YbdfWC68bKPaw7m2Y3hZzHMwXu72rT
	J+6s93sYQLmmY3XpM2QxRBl4q+pfhCED4daV2yfkbisZ8MXaq75z4IvspDepHUmO
	E/5gtZR7nlsvvUqqhs2Cwtpv2NGRwhVxnpVvRVJik7n5Dw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqbmcrc8k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 07:20:37 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c9c26587e67so665404a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 00:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785309636; x=1785914436; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/DgIWD5Lly5mly0/f905YXhVvh1IPuOymULqG3vH/W0=;
        b=fNz8WidP988SCEE9QrqXvNxbpoCV4dnGKSOZTyV2cZZpWRmV55Evmp8R46Tl8H29sq
         7sNxNiSQ/lMu/B6Da0PppIywOrpDeXUAqGotnP3gJVdzZm08GbGc7nsRv546e9U1wFhQ
         OBu22jmgxM9JW34T1rKg7dnKbGLfIAdWPSHkUE+MIULDimNoUD1VMjSeTB+wUWY2d1Aa
         48LVFVIAZAIEjMLy6zDED0nl4Pkx/wIg384AYlPM8ggcRUfA/J6jyz2PNORx4kqFzpgX
         QcX0wagNoFN9iD4slz4tEtHpcpnM8gNuy2brll9VpSP1/wLg09GyI0Dnhr2z/dkT107i
         xfFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785309636; x=1785914436;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/DgIWD5Lly5mly0/f905YXhVvh1IPuOymULqG3vH/W0=;
        b=QYDT6zoLrpU62xFR07YZsbqe90a6A+6fnsjdmrotbDpdXp1/Q1irTuqlT8z2o8iefE
         z8hXyZV1WgIuWXZMpJNR7DP1uVQyHKEdUL+bLtrRoCrQAandvjybHkfpRMiyZ45poS3c
         ZAmS7uxuEEGVv20jTZI+uj5i2E9RoYjy4CvB+8lR3wn5VQQTnCZGE0P0R3bEoyz5DAg6
         EMX9dg4cM+e9KHm4JFXrgPsRtfM8EUneuFhKPw6/ufDAbdRQ8CjNMCmA7HfUaN1xhMCG
         YlEOMEqVouGclOQsLme36KqpmeZk/AMxICSuDtbiBTO3iaIIjjuNjBCCn930lyahguO3
         vbPQ==
X-Forwarded-Encrypted: i=1; AHgh+RqkWTS5B4DPv/DqV9ikByenuUGgAcXo/wAxPtEQrqsh+NmlfkOJ3mo08wrk6L24Nfnu9cNL0VAay5zsIaDC@vger.kernel.org
X-Gm-Message-State: AOJu0YyELFB5AuqbG6mHTCgTd/hQ8jBAU3cVm6YXv1RaOdtJCQCyZZxo
	eh0C4ImBFrtDqRpypMeF5OJ5YXrOd74Uc2gNDv1uYw6rThI7+7U9oBcI4vXXTIe/vEvQqqD0l8w
	Xzt19ND9J2GPBjTcu0yZORrYBgZjK87UlR8jXQY3C/4VZX3Mct4+H3YXzJJkWWBr6vRv2
X-Gm-Gg: AR+sD13ez6dz6/N/LSy97G8fCxZhL+ct+WjEU6zRxcItCkt0hFCC8BkNgFWvRzwKmlD
	Ksc9UqIXKZrpFbB0jA4cPbTHjn64SjTEfSpFhu6x/Ch/hN2pEh50aV+vPCwZalpY9DGiGyVUL3r
	4i1H7kCawwkp3SUedNgR77B4l71N/c3RW4Rbc+aerv63fg1X9cWJDmaIDOHrMGEkxeTXz94hgXL
	kSG7XAE57MdErQ3gfhEhaiq0EbfAA/ibEKTs1AwDDuF1cuzW70TEbnjKXym8FQk83uaS+SLDJ1E
	m70GNbfxc9GMAu6X/Zyqn38X3X8r2AM4QPtVXZByF7iWS9lzYBhinDmNJyCzrp4M0lhjiHlQpF7
	mevLpWTlpS1T+1S6T3QqXsWv5f/mAsgn6kY9xFft/IWw=
X-Received: by 2002:a05:6a21:3946:b0:3c3:d298:81b2 with SMTP id adf61e73a8af0-3c8e467b0c1mr1234260637.1.1785309636083;
        Wed, 29 Jul 2026 00:20:36 -0700 (PDT)
X-Received: by 2002:a05:6a21:3946:b0:3c3:d298:81b2 with SMTP id adf61e73a8af0-3c8e467b0c1mr1234227637.1.1785309635643;
        Wed, 29 Jul 2026 00:20:35 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbdba351979sm514790a12.15.2026.07.29.00.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 00:20:35 -0700 (PDT)
Date: Wed, 29 Jul 2026 15:20:29 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 0/6] Add initial device trees for Nord platform
Message-ID: <ammpvbKeGgComA1L@QCOM-aGQu4IUr3Y>
References: <20260729010022.875799-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260729010022.875799-1-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDA1OCBTYWx0ZWRfX5Jmajr68zlOm
 8TNzWSJTRQkQpR9C2nmu9NovNHCj7RvlURbGaZJDcGAHX/iuc707Ok8SKJbsIqSsYMw7cqK54hU
 LgWfk1KibxRrYYqmbQ9DrVLLNPrRoM8CijNQWDwdZpXwGKY+WQ9VL7S0lywEdDx5qQ+yn7JoyD1
 EXpKmGyCl/uvsQrW2wz4M6qig/SXqt9b7/PCmV8VOus37pqMKwITwR5Kw2VkpteRJsu0vJtjHdQ
 ncamnUrmpSOs3PR8A4f6B14uPe6nCjM7pKLwrGc+6UEHFzxHxNYN+AzK+UCJSgnJdorbnLYekS3
 5X4ScovZR9ab/nA2SRpFt1J9jHDL6UDratJNVkk5eDNtK9LgWHwNHIH9ZtV314jHe6RsLGHlo2T
 cc0bZvx8BDMbaw36FZNuRKp+jh/YOtCShbKzD6apFAQjYqnwUBa0VwGNu4Ytc1eE+tadPLw6KfM
 ptu/X7BsROohVwwmWow==
X-Authority-Analysis: v=2.4 cv=HP3z0Itv c=1 sm=1 tr=0 ts=6a69a9c5 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=yPCof4ZbAAAA:8 a=PPB80SP1y2LXfg1cI6sA:9
 a=CjuIK1q_8ugA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: ezd0vAX5vDZJfYuDhI_2nT3-ZpUdKRns
X-Proofpoint-ORIG-GUID: ezd0vAX5vDZJfYuDhI_2nT3-ZpUdKRns
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDA1OCBTYWx0ZWRfX16fl7shugmt4
 CFjrGcqDujVS7H2TfSMP+jHD4YVMgYqfv3uXhFwIOoBxdgfyNT886WZhW5G4mIe0jhRSJU//1/b
 ATA7/gm0Mt5Gfn6TLzPT1Xipg0dI5g8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_02,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290058

On Wed, Jul 29, 2026 at 09:00:16AM +0800, Shawn Guo wrote:
> This series adds initial device tree support for Qualcomm's Nord SoC
> and the reference design boards, SA8797P RIDE for Automotive and IQ10 RRD
> for Robotics.
> 
> Nord includes two variants, GearVM and Embedded. The GearVM variant has
> platform resources (clocks, regulators, powerdomains, etc.) controlled
> by SCMI server running on a VM. And the Embedded variant has the resources
> directly controlled by the operating system.
> 
> SA8797P RIDE board is built on GearVM variant, while IQ10 RRD is built
> on Embedded variant.
> 
> Tested on next-20260728.
> 
> Changes for v8:
> - Drop UFS support from gearvm variant to clear binding dependency
> - Link to v7: https://lore.kernel.org/all/20260721044005.2882803-1-shengchao.guo@oss.qualcomm.com/

Hi Bjorn,

You can ignore v8 and just apply v7, as Martin picked up UFS binding[1]
now.

Shawn

[1] https://lore.kernel.org/all/178529373848.132455.4656284480950878568.b4-ty@oracle.com/
