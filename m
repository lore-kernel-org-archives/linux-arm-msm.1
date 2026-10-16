Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 274FA2C21ED
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 04:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792126185; cv=none; b=sU54wKXLMBy1OFiWxx0KB9j7CwSh5LeIpeoVeysKUY/ZBepXXwZjdFE3pNWsEOYWGZwI2Acan+bbvKAR+QylXGjN505Uz0FhwFZ9pG+f85EqFL5UQqyXePp15nctFDKovCLcjvBd01k5RmcgveqzkVdpyroyfCjFWTMCXRt1p8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792126185; c=relaxed/simple;
	bh=P6QREhrPkh3hAO4eclPMZIrbH6fv6en1gjJrqbnO1H4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hxR1EWeaIOVHU7caWo5701VsQG4WcmDUBYhB2ypYsWL4ugr5prV/TRehNY5kNw7ZQ/WIdhHn9dcb5Tq70XhDK3MQRZLoeaGgJ07pgl+uF34kZtXpM0yBKlHOxGR3hUfOCaVW+hgM9fZOxgo1E/kOT0aJMiohHfyebK8jnFwqZUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PT8jt63Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J+OVRi4I; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PT8jt63Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J+OVRi4I"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FNg4vG1635423
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 04:49:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	th64apxFgLFzfeQxoVzys9Au+jR1F6aa7MWWhFDWu+0=; b=PT8jt63QnZfmFmIQ
	pp9xhv/Y+xzLWZxYVgsTePa0aTFkNJ5G1oSbaHloDyIl4eNxP/sJoJSUTC5GOUY/
	VEI/s8xTaw7XuKiQoT1jgiiMIhVNKKZlgQzSZNkiQWySQwtkmwIjL4hsxckWr9wI
	7IfoCwI4Iw8ETNouWjM2x/jwZreevfbpeGYEiLWMldUzZ2xZJ0IrHBI6UkAPLxjb
	/IjGuqjp47WigXaSnQ+EQf9iFCQjmVEtXQwBHqPAQsFXszSr4uatKLSZ1d/8/Dff
	C+7eYv+FjrpdnV5ApOqaRf1s5J59H7J5eY+s9fxYWVubolf3Dv2Ut7JJLe8kgL85
	gzrItQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb8r10vfw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 04:49:42 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35c5aef2a74so7216454eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 21:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792126181; x=1792730981; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=th64apxFgLFzfeQxoVzys9Au+jR1F6aa7MWWhFDWu+0=;
        b=J+OVRi4I1zgLQu6p8Gagofr2VLFbCT/WeE/wkRlZkTVpA7EKkezDZSs4vkdl1qK+xk
         BwAvJt931ucYH0Dym3ZGlvSdp+8FPIkxAr1tyOITDRZfJsCwbnrhtJmPD6Z8wMWCYVIj
         GzP6V/9TppPYM54uwQ2BgLvhQvFk9uf79xy7bKSt1takq6+qPLAFOJwwSl6eoCIFwJul
         568snHTTC79wGnsEjE+XLGYaBv1FZO0DZhVNqCmby9pF7TwENuRuBDCxR8G14zRKGvL9
         hpiNgdFhFD96xCSf+TfnuQu9lZ7Jn/mEIBUvN8CSa/T+TkB1xtjdWB1b6CoX1sQ43+WV
         TUlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792126181; x=1792730981;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=th64apxFgLFzfeQxoVzys9Au+jR1F6aa7MWWhFDWu+0=;
        b=PLdj9PUTFmpPlkY+GHG5R0nAP95b1TsNO9KOmZJGznIj6+ln2k0AOT/K+4jczRrqSj
         tjsK9LuiT0NMBG6NrUbf2SOPcrL4Ez9FjS0RlR6SbiHRrcPI7+witeWSPKU2CJgz1qri
         najiOxrXtFjo7GzFasBEqlMNxGWX3CirAEiXGFEajQAK9UmHVtb5D89sJ2oHG/3kGrQA
         lAJcbZurvLP6ppennaz7SgbECqZsH4RzuRM7fz30seNAKQnP3SS8+P6wVCTSxGOIIke2
         oU36834w+bBDzWplmKfMxMmVT4UuVt75M/wVTUa1c3SpydGZNzxVNHpCNY+zGaLX3muZ
         0kgw==
X-Forwarded-Encrypted: i=1; AKwUvBz474qmehql9TxPLeiSf6+i5g8mMyMhU0SnKaQu5Z9ZRhcI/8noEf33rU0BW1guXL1Mbj1KDYS4axh29XoR@vger.kernel.org
X-Gm-Message-State: AFq9FYLgDXw2cIa53dAtWIbaqBHhpvGft5Nbm28Cs2DTE52J/v2EZr8c
	FOi3JzFxAeR+ZnLdzZuqxNbAW9QgdDxlmQMvzYpQzLqKYd4d9ULzP5Q9H/6lx57ISa7rmWuKZqJ
	oBnc5BhJFYJPpGY9a9l8kEi0sAcIIRfnCRfhJJomPZbhNhyw1hfHoFnQZoAjwPJWp+00M
X-Gm-Gg: AYBFou0Ao0hz0yXVlBOGW27mgTwNN6gFshMZ+R5YEVSTxIRoYPYjNKGXvVfrWpiRZTj
	FBYh7vJ1dtGq64kDJUqXkb5VLakri6/HjcOcs7tAqa3X7JOGZfyqi8I3GKKoDAr8IzbVqTu9a2D
	PiOTybUVTBKPMahpqjDLJYX++/KbGidOjJCRvZNK8CHXfO2Nm0f6KvCXeSs/SmIIhwiwx8/bf12
	tZeSIzNhFC5e9UtTmbrXCDdLr4TN8OPdkXjZJOAdBe16/TvklrSw1Jd8Wbnm9I0uAgUURQn2v34
	T1qlp0vO2XKvmbT+BiXYNggUp70+rwfycwGS6TD1a/4XXQpU5RDX2ALSc9Vcl8WtA1TtnK1l7UR
	a3U01g31yybFgU/I+PUnSPMSKN3CV
X-Received: by 2002:a05:7301:d193:b0:358:cddd:5ba8 with SMTP id 5a478bee46e88-358cddd5c1bmr25526155eec.13.1792126181424;
        Thu, 15 Oct 2026 21:49:41 -0700 (PDT)
X-Received: by 2002:a05:7301:d193:b0:358:cddd:5ba8 with SMTP id 5a478bee46e88-358cddd5c1bmr25526126eec.13.1792126180897;
        Thu, 15 Oct 2026 21:49:40 -0700 (PDT)
Received: from [10.219.56.188] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b6ca5sm2837094eec.9.2026.10.15.21.49.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 21:49:40 -0700 (PDT)
Message-ID: <d4ee5594-293b-48fc-946d-db086bd9ca18@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 10:19:34 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/4] arm64: dts: qcom: sm8750: Make the ADSP remote
 heap no-map
To: Jianping Li <jianping.li@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com
References: <20261015071511.977-1-jianping.li@oss.qualcomm.com>
 <20261015071511.977-5-jianping.li@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20261015071511.977-5-jianping.li@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 8tD4aUg_Oe6K0uJ-WTpmJ3vt90ZrDQ0-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAxOCBTYWx0ZWRfX/8VKRk5XZ3L5
 Zhgkfa2JB2k8MeaTett5Pe3h0F25SNHif14CCirKXRd0L1c20npvfA3yNIWuZoUurqueIXZ9Qn7
 Gl9WfzYhaaYHlTNWDbMTl22E6FEMGMs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAxOCBTYWx0ZWRfX6oT7ejqQXvvM
 wMygoEQKCIe8gTay2AVps4Pw0nVBpB6pYMIvwt8tYhaJ/gIRMc8RU6rwgJU3OJUSDBWEiCBwdjs
 WlhOkOZJaGTQI956O5FwzxVyAAnEIf6S0z6d6+/odF2Aqy5cH4fU0BJPukmz0TvKpA2T26ij3B8
 2nEyhKzyvTN4bHabSluKjSOTiQW52/z8mqHJuU8VrkeCTM+gfdfYEsGBz1odsEmugTsMbdJzuNP
 hCJld+DDNho6B/WF0PfKmG1EChcBqUq58PmMlw0BWQTvWE38eIVTfql+kWyjyuHy+uT6d7aRaDI
 4pTR2oVleJV/EY/dZqWE8qDhxqJU+o6HIREJ6VUH0JMP2FzVFgIa8Ies24fu4b+UqjQqPor53go
 6024in7bThYdIX8QoBCHb8xxjCI9G6o2lMA8EyhHnfror2QjvfvVV15YF+jNIATHGzvehVugLCo
 eOvwUc+0e3Rj4Ubxe4A==
X-Proofpoint-GUID: 8tD4aUg_Oe6K0uJ-WTpmJ3vt90ZrDQ0-
X-Authority-Analysis: v=2.4 cv=L/CI0OT8 c=1 sm=1 tr=0 ts=6ad1ace6 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=WxrJ1OjRqBU2I1o4brwA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=bBxd6f-gb0O0v-kibOvt:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160018

On 15-10-2026 12:45, Jianping Li wrote:
> The ADSP remote heap is declared as a reusable shared DMA pool.
> Allowing the kernel to reuse this region is incompatible with handing
> the entire region over to the DSP, as HLOS allocations may access
> pages for which HLOS no longer has access permissions.
> 
> The same configuration has caused synchronous external aborts on
> other platforms when the kernel accesses pages within the ADSP remote
> heap.
> 
> Replace reusable with no-map to keep the region reserved for the DSP
> and exclude it from the kernel's standard memory mapping.
> 
> Fixes: 0bcf9ca23a873 ("arm64: dts: qcom: sm8750: add memory node for adsp fastrpc")
> Link: https://lore.kernel.org/all/20251209-sm8750-fastrpc-adsp-v3-1-
> ccfff49a8af9@linaro.org/
> Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>

Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>

