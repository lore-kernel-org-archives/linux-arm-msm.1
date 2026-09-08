Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C85AA572676
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Sep 2026 13:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788873340; cv=none; b=ihzCGXk7aM6DxWbAWFZuD5TFxdSGe/SzjtRhj9okSK9Xo2GLgHvApBJC/pvBSgwQ6+K0BE7O5mIcX1/cy3A1QLh0nL459CX46bpu6wpUMNaok2Ozit1PbcKbD0qhiSa0eAm2hZrKFHBEr7dQGAVXLtXTNrL2OlwsiMC07p+dJ5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788873340; c=relaxed/simple;
	bh=Zcdpx+RNhi3G5SXrQ458cAnUNQSGCbuLRxF/WFPWRuY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JhgwvAL+2c6w62BMjsGFOilwiVY45Hay+nVB6dyGNjKlftuvzir1nUu8KDT8U37Ks+rgSqgkX+4FWyslVZvRvA8P14OTgPgeKFGSBolO6vQZ/M9/iXWVfSlg4bYS3FWIAUR9Uc6PhHX2lD4kZlqU/MsLnSEgBSpEYJpTMJddMkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GuxecpYO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xjxh2zgu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GuxecpYO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xjxh2zgu"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688Ckn1M3573830
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Sep 2026 13:15:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Wqg4RIvj4EDznPdH5QGIsGmd5X2+Q2zBtKlvYGU1LoU=; b=GuxecpYOHeqk9Hn5
	tMZ/7WCZnCZWme6Z243IfcJ3Uw4W1q/nUlhC2aHKoCQX+uAzg36m+C9UeHSDKfOC
	iPsmjW9BtXfrMUyo8dgm2IQrJAetXDdaViKKtzoJasolUNlcVK7YvoV0+Xf2AfUg
	YR2DdW8RdyRAR/eptdDTodJqUm/0MhgUq5LeW8YYDNH23dweth+m4NdpjgYsW/NG
	SGkK6bSLPX0EpkiTm+WIHwomulj44VxqjVEqnnSGIrdwLiDSszbUqB+VaFz0YPxW
	3h8L/C3SxAJpzObxaJWQFspvASbh0Ht92F5OK1VmxCGDDRUDG3MdZwrqVX9llJ82
	a2trtw==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjfp48ut4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 13:15:37 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c6e562b059so77243e0c.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 06:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788873337; x=1789478137; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wqg4RIvj4EDznPdH5QGIsGmd5X2+Q2zBtKlvYGU1LoU=;
        b=Xjxh2zguwvL/NWWBWCewc/lZMIYertvOR549mm8JkT3JE9GNAo25OWwG2NnwVc3rZn
         dXXDamrb+PfF+sDkLrHCFvaV+0ehz7JFosJYv3IB45i7A0rF4FQ6oJuWeGhOstrdq+pQ
         611P58KIpYWbKktqRUt2z/cBvCCHU04cG5UU/sIVwE9CGnHRrne0KMvqmjvyMxduEIhl
         ga0mh1/YasQ5zzv1BxmwapGIgPhDzogDQfAVOmo7Nhru+iUkfyzWmgKxWhJEwSTaq4Z5
         7NUC7ZhuxFvNZSI4vb/qUA2hnYYtBgglS1gmHbiApOI+RKRu3I40n97i4knW6P+w1ML5
         juZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788873337; x=1789478137;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wqg4RIvj4EDznPdH5QGIsGmd5X2+Q2zBtKlvYGU1LoU=;
        b=S9T4IksJwzDKtXFIHo0PScJGsZAWTrDr7VUDwvgJk2sGqRWjn1bJ8bYzRD/hYKIPC8
         2wirD+9L8kC1tt4j0FHZjq6BAB6ugDvZ0feJ4rHjGwNhijk5n4WxA27g1UqFzHvNfxy/
         +wzJhcwTfp8CNI7yh9D1B/jzmO0uO2SgifDBsKDIQJZkH9Ln4D8F54uNXwmtoFyxiYIZ
         HgsuVoXQdo1+fkB8/6lx+NU8lQ25Q9bQx/3WDroyLrPTKOFhHx28pl9PZj4nQhuPcAge
         wt9CG2mSSiZS/DptJgkxTccF6plxGHdlfJhR2jsZE7EgpDz2xvvXw22VDDD/5L+QdoI4
         r98g==
X-Forwarded-Encrypted: i=1; AKwUvByNetcro1wo4yjBXWar9NDHTovReMqj7/OC/FG35GW7Ut+3cain4H9Ozv5nK8q0AjlwSL5rvYFXiXfJuNDD@vger.kernel.org
X-Gm-Message-State: AFuF++mZ7bIqVDsp1JZmPu6gCWXVZxjfavwgk+edlPqL0fM85rEIArjY
	/6ePDJavCHHWKOH+LzQlnYIbEW+my5EozFgAfgyILALpeNeg4eMnUVfyIgGs6wTExZUDy58vPx1
	GiBUrLdxirkh+1udEvsO4TLbjGeEcgYo1pjgMa//J1tNdGL0lNxFVqfOa6BaEgWZ1PaoV7Nh+rN
	kq
X-Gm-Gg: AYBFou1NsZswG+Q27LD/WTRQLu0Gt/0rb6Surkfx7R4hQDsqikrd61HPxde9usd/tiY
	eTR8TsP3Bdnnt8uCAqSg4bt0636X5wc5WmB45kbe60CQgYyuT9eq3ryiXiLwY7Q/5Kmk+fzILLp
	M+UbQM1NZ/bw8hO6bFO22u3Pp8LdW+dBwSlTj4DGt8Ml4DuSbGzahfARdDRlxVHVyIaWMOhFpWj
	0gtgCCSU5ojGlx9Fim8xIFc+EKSfBZ0DSNJEPn6/Vw6gDKqeStcgKELr8yZQAD4cgKi2BI3u3Pj
	bFAfJThGTbhkr4y0VitiYFUk8ph9bbqMkS1ONkmFcjubjy2i88wybGYSEMYlRCSXyulJwG4mi8L
	Eo3l4LrAGsiOMx53Tk5qp9w==
X-Received: by 2002:a05:6123:5d9:10b0:5c3:b339:7b19 with SMTP id 71dfb90a1353d-5c7fb7ea227mr24548e0c.1.1788873336809;
        Tue, 08 Sep 2026 06:15:36 -0700 (PDT)
X-Received: by 2002:a05:6123:5d9:10b0:5c3:b339:7b19 with SMTP id 71dfb90a1353d-5c7fb7ea227mr24534e0c.1.1788873336105;
        Tue, 08 Sep 2026 06:15:36 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b6167031f1sm3053010e87.60.2026.09.08.06.15.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 06:15:35 -0700 (PDT)
Message-ID: <de1c8eb5-c965-405d-bc4e-551926a886d9@oss.qualcomm.com>
Date: Tue, 8 Sep 2026 15:15:32 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-oneplus: fix fuel gauge
 compatible
To: Rinat Muhamedgaliev <rinat.muhamedgaliev@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Caleb Connolly <caleb@connolly.tech>,
        Frederic Laing <dev@fredfunk.tech>
References: <20260826233818.124278-1-rinat.muhamedgaliev@gmail.com>
 <60faed5e-8a19-4eea-8272-145aca3db2d9@oss.qualcomm.com>
 <CAGHQT46f3wexEQHpcp_aoa4MHpi6vrtAd8Pbmt0KANdn9rANLg@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAGHQT46f3wexEQHpcp_aoa4MHpi6vrtAd8Pbmt0KANdn9rANLg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Qu9uG1yd c=1 sm=1 tr=0 ts=6aa00a79 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=ApsbdhC_8wnva6kFnVgA:9 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-ORIG-GUID: YiXrh77fDRMtx3lvsoAV2FhJWpkThAUv
X-Proofpoint-GUID: YiXrh77fDRMtx3lvsoAV2FhJWpkThAUv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE0MSBTYWx0ZWRfX3MQy9dZSmcMV
 MEzWqHIONbojGadUzGnDdgv0P7iGFWPajf2rSAEoZh3v59FiTPd4eXauekPGAXdXldS5mHuyOV1
 LPR4E9fcqIGSmIeBU7R3j6uIZyg/pnzBuctMC4kq1dI9KgAUPSvxuQ2egwZN+/mDDjiasGAUa58
 lKhSxJShddsKnhLhs3J2RHPzgSoIAg71Fv9YxWJR6wDLQx2E/K+uq9ejmWPRAxl+Jm0awepVCof
 4jdbf5DmPV9zYldZKgMTiYiM5V+HIsogQ6iDg4gSqBSJcTlf1Ec7r6FURuv+pbpCFWO7cX9HJgj
 ATinCP+620FTwntLPfIIhUWO8xYEzQBKCEr7KcPf4ZtmbY7CMvWrmZgZpj0g4H+1QFNYTHLuMjD
 15GgX9kqs9J/K0Qx3L+dPOtMOuxVv+5qMwRzgSkHy7N+ewiieLsmdz6tRNJIdWmxON+G83wS9bR
 7HIcnoEtNiHUpaJ9nTQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE0MSBTYWx0ZWRfX1G70ntwUk5ZE
 zA7v+ToxneBfVfGjv9A/XDQ6gHsX4tF7011XorNvWJMJt7OgnScBoTZukTZqV2+yWS5MZ0vFx9n
 rMKGo49RHhnPv+/sLMXFJK/C3FkSxlM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_02,2026-09-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080141

On 8/29/26 11:03 PM, Rinat Muhamedgaliev wrote:
> On 29/08/2026, Konrad Dybcio wrote:
>> If I'm reading that thread right, this IC is on the battery itself (?)
>> and it seems to differ across different units / suppliers, would that
>> be a good interpretation?
> 
> That matches what I found while looking into this. Both the bq27411-G1
> and bq27541-G1 datasheets describe them as pack-side fuel gauges meant
> for integration into the battery pack itself, alongside the protection
> IC, rather than being placed on the phone's mainboard. So it's
> plausible that different battery packs (different suppliers or
> production batches) could carry a different chip variant, and DT
> can't detect that at boot time - the bq27xxx driver picks its register
> map purely from the compatible string, with no runtime DeviceType
> probing.
> 
> I want to be upfront: I only tested this on my own OnePlus 6T
> (fajita), by reading DeviceType directly over I2C on that one unit. I
> haven't verified whether other fajita/enchilada units report the same
> value, so I can't rule out that some devices out there actually do
> have a bq27411 and would regress with this patch.
> 
> I'm not sure what the right way to handle this is and would appreciate
> guidance. A few options I can think of, roughly in order of effort:
> 
> - Ask other sdm845-mainline users to report their DeviceType (a quick
>   i2cget on 0x55) to get a sense of how common each variant is.
> - Leave the fix as-is for now, since it's still strictly correct for
>   the tested unit and the previous binding was wrong for it, but note
>   the pack-side/per-battery caveat explicitly in the commit message.
> - Longer term, add DeviceType autodetection to bq27xxx_battery.c
>   itself so the driver picks the right register map at probe time
>   instead of relying on a static DT compatible - though that's a
>   separate, larger change to the driver, not this DT patch.
> 
> Happy to go whichever direction you and the other reviewers think is
> right; just didn't want to claim more certainty than I actually have.

If the driver can do autodetection, then that's a good idea

Otherwise, since based on David's reply there's strong reasons to
believe both variants are out in the wild, no autodetection would
suggest we need 2 DT variants (I'm really a fan of the other option)

Konrad
