Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E89D39A806
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 08:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791881679; cv=none; b=WxyuNetF+V45QXt2qI4P8d0iS+yjqWtE6NUTaCW9QbAqoUoo53q3aSsfFTvYDYt1UmtRl5NmCkokAJ9zZkK+zFLJymHGCLrhkoXDTYMrsNLkyd4CENAguo3oliqnKzIKD/FRE6zhcyOL4sAw6+B0g3ktQ0ShdS+y7t8B5iyVtAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791881679; c=relaxed/simple;
	bh=RRf0QNgtNhxs+QIpsqcDuxMucwHO76f+rh6FFGEKfZg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SgZhggPg5QVSyglzh5xo6Vs355x5HumeZxlIwhaoQzLRRaQ/OdQeIrK+XlV3yb3Kq7CqO/14K+izkPko5OWdwppsNoEt1bt+pSBE/pS64eElBgDvusOQdxqG9yVD2rYZuZa/QVFaqOfYpmefrFC7Yxz6zmiN4GCDVA1cVcNpVZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jQFw8Fw7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cR/fMFNK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jQFw8Fw7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cR/fMFNK"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D3xKHn3476152
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 08:54:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7f2hNXCavRHTd0MsRhfBFPNTvN4Mh7PPmelvArEONJ8=; b=jQFw8Fw7Ma/RCxZc
	9cASf6SF6yXQruiLVtJvjcjJourUetkScclTHVlo51gLdP3t0tpW96OnM2du2pwJ
	xJez3lWwdoG2vJUdVx+sO1xBzDiAZPF4eUaVe865752JzJ5owkL7iBRTih3Y6lry
	R/Mg2ru2c2GoqL0IQbIQsQ87zKLfEkGWR9Y8RZJPtKgTnvE+Ch9NgB5Lry59xw8d
	okwPYTS2BsGbFWYbbJqE9zyB/c+xnk4jIxofjA4d6oIolTx2dG9nkSZCEi4ZJ674
	klrPchZ315kCsAz3lOdAHdDomuKPfwLchCkpMuPlfZBHh0ayPR8PhJT+veY8xmv9
	XaFzTA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9d7j941a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 08:54:36 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cc40759b2so612623285a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 01:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791881676; x=1792486476; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7f2hNXCavRHTd0MsRhfBFPNTvN4Mh7PPmelvArEONJ8=;
        b=cR/fMFNKVqBMAp6LjH/lRkK/qkOSG7aeAS7N++VgqbR6+ICvNcHTPKEMNKpvfWNIGY
         322JT+yDK4+POsJOiFCVQwDUY+7saArG9RPuJYS9Zjrwy7FX6x55ShCnz9Sk5uytMlcn
         z/md4ekcwA4vltddUU49zSuuPAO6PdNc/a+s7zJe+ARFhlFxNj8NL8uCCV8gPFnscTID
         ZfX6fTnxG4i9mx951T0BblEctJFvLgg/xqVroZKoPzy6O58H/jdgDtl1uLs3QmeJxSry
         wQ7e98y9kaUU0RpOdkJw39b5eqVaxA+XN14jHz+jQpE4kCzWxAbAoaDsC5nzTVNOZMvg
         zNAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791881676; x=1792486476;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7f2hNXCavRHTd0MsRhfBFPNTvN4Mh7PPmelvArEONJ8=;
        b=Iws9jy0I+TxH61VoBuRKZI74kZiIWvj15ATIHpjwsyefyjZgoAsYkpKCL7OGjazsMN
         ePEZtE+ExN6656DAlivkcwM7prX+i/Sg+ZPDoWYebPbfopsZIF3mw6802mO4lzAL80oA
         OnEiKz6yOB2evX63u3nvlNFK1rbIR87zVhsJ0Q8RQDvVETbtaVpHFraIa7WHzlHn4+91
         PCsSibMczCOfThXPovJf+mF3KSjoFDJz88bNLmLb9GkPdHYeSigo6Bd8CNDQ8OSxpbyr
         Ci/uICpsbpVP+fdO6l14oIAfttC1idb0KDiu5jbIFb/vA54u3evijiSAE28EfSprYsWy
         dL5Q==
X-Forwarded-Encrypted: i=1; AKwUvBxqvxBmMuKHGuVBydJ0SkrnS+tRBHD1nUMfP3hIDuMh48lbZ7rNXDB6FKBMGViX1iCP4upBRP0NXi8C7EvI@vger.kernel.org
X-Gm-Message-State: AFq9FYIzkT1N6qMjueyAFqbyrKvR3Q6LBqk/JzV09Wa9WHBk5wqdhN01
	H2O3OThHcTb47P2DGR/1YNs2YQX6LL1h+9nDIzEyxWkOnT7QMey98tPZh8angYs6dl+LTKbflTR
	JXW7Or9QRRqx8jNVtqTXs2IPKUMbU8vZ0ZSRO5ak0dgdfByh4NhPYxmgM27N9QAKyRAWv
X-Gm-Gg: AYBFou3a+8eT5etBaZEsD6r9F+IHep7oaqji8fc/c7ZLQ2LuFYNLk3BU6kayhteSNgv
	weJNsuPavp+OhItsB57LDXbrwM/Ckgb5E5trELKjSsCru77jqvbPXPUMi7blM1pfmtdHBklFrsp
	l4BhPuM12mMSykT8brQ2ZdkXdvLe+Jr14oZ7Ik5QvbnjQpeRQ8jhT77NqYEG7KLYUP04GJYgmv5
	pVAaahLBJk+l/PBgWwNwOyWHgMwUM7w2IixVe9h080L/w3DQx78PU5DOAVTeu0cMly1mXX3ILOp
	Wmb3k+65mGM+vfWiDFpjQ40zOLxvV4X2RDftEfLl9jbv8wz8KN/B+5vRpBd0+ouREvM9DTGYyVx
	1b+yAGYEch8bVloD89HXMVE7AB2UQNwLPfdmDe4003VelLHb/6qQ64/A98Yfc5A==
X-Received: by 2002:a05:620a:19a2:b0:934:ab73:ac53 with SMTP id af79cd13be357-93ebcc1186emr1872339285a.0.1791881675669;
        Tue, 13 Oct 2026 01:54:35 -0700 (PDT)
X-Received: by 2002:a05:620a:19a2:b0:934:ab73:ac53 with SMTP id af79cd13be357-93ebcc1186emr1872336085a.0.1791881675017;
        Tue, 13 Oct 2026 01:54:35 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7? ([2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18be97d1esm554068365e9.8.2026.10.13.01.54.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 01:54:34 -0700 (PDT)
Message-ID: <46521411-fd68-4ead-a487-f2277a1d1d8c@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 10:54:31 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/7] Add Initial Support For MSM8952, Add General
 Mobile Shamrock
To: muzafferkadir@mainlining.org, Srinivas Kandagatla <srini@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli"
 <gpiccoli@igalia.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: David Heidelberg <david@ixit.cz>, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-pm@vger.kernel.org, linux-input@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20261011-msm8952-initial-support-v5-0-1857074992ec@mainlining.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20261011-msm8952-initial-support-v5-0-1857074992ec@mainlining.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: YmrifieKpzBFXpaAQzMBug6mICHI-OXe
X-Proofpoint-ORIG-GUID: YmrifieKpzBFXpaAQzMBug6mICHI-OXe
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzNSBTYWx0ZWRfX72/jG9O8Cb2u
 bctr4Xbp9A3IK/hy+kI3QLFsDNkJJlobQH4LRYsNXTt6PHPumjj/uf8+jtVp07UpG/ZXjjDuqTu
 NGDV6M1lni0G8o1loitPZ+QeoeLPtV8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzNSBTYWx0ZWRfX2d2ls7rOdvti
 LWM40CWXcdzzvC9IFUYIbPYhTFBXQB/VkwYM9/5VxIFecCPiBrvbJRr0myrlCCw1T+p8w2R4K4+
 eVsOOgYyDHjmRa+9bsdxj+KFLOyGVe99ZBJu0VzFeUiCi4cgGUky+df7lqImD69jsjS3f/RfatM
 WaNdX5KBpZl1VZBHzS1DTyPIRgao/1BZJIBFHAENz+mqwlX4g5RalnnZSdjl09ndSZOdhBC9XxS
 xUKyNRLTdfgGJ4WwUsKLdK/a26GBX+K08l2aS8jW0rrVUOfcaPzFjsy7+O7RwA6D3sNOUGZORVc
 RDACn8/w34gngDcat2HF3hS8Ah0s7H2DmvRGlbtKrolGimpb25kOZfLR9yba9GOe/vSxBYn2aJD
 uqSYpBKJXL6uiNgNFwvDoEH8482J7cCUcxZ8/OBkpsszy4uTiNb/FX61dEPUI+gYhqmrP78dKTC
 Z08DX0wmj/dny3o/ioA==
X-Authority-Analysis: v=2.4 cv=PMGaavqC c=1 sm=1 tr=0 ts=6acdf1cd cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=OuZLqq7tAAAA:8 a=H-LwI_JyRwchcv6U7CIA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130035

On 10/11/26 18:51, Muzaffer Kadir via B4 Relay wrote:
> MSM8952 is a SoC with 8 core cpu and Adreno 405 gpu.
> 
> Ported without uart connection. ramoops and usb
> mainly used to debug.
> USB is not enabled in this series because it
> depends on the not yet upstreamed (and not developed by me)
> pmi8950_smbcharger.
> 
> General Mobile shamrock display panel driver
> is generated using MSM8916's mdss dsi panel
> driver generator and tested with it. I didn't
> include it.
> 
> Pinctrl driver was submitted and merged here:
> https://lore.kernel.org/all/20260907-msm8952-pinctrl-v5-0-9a2d8d72ffdb@mainlining.org/
> 
> Signed-off-by: Muzaffer Kadir <muzafferkadir@mainlining.org>
> ---

Applied, patch 3 & 4

Thanks

