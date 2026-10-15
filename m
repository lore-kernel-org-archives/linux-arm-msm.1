Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 088AE4FB9B1
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 14:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792073209; cv=none; b=MTb8m+qNFJwEoK1+FdPL90w0TAe3esnq7QOM0e2uNXdSG28hD0s89RMA6vBU51NbvOJ8aQwv5Qo2Osv6DrMn8qTXJll+I3Yw4cW+wEnYCKA1pOi/WcvEyvlN9LI2qXeXWFCQzC+Bp0B7F1IR7bPPxMOPBcPM12nLN4itRva9YxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792073209; c=relaxed/simple;
	bh=uJsacMW6Bz3Nv3pvumPMN2VFItWY87v1HYxtmx89e1U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iuFAKzk47aH3Ah5NbKD9sYZVGIkEXz6pAdyLdy/JwkfLAkCYfS2izp38JmMUznWMUzqqRjRDvkAocllJwqn2EhY8G6JF3YeiLXR93M2WhIMOnnnftxROrpaEVAiMEZiqD5gE7FXE5eyE5S18B2VwSfOYTytEHQTST1rAyJiKonc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RXMcu0Gc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ppaym+Y/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RXMcu0Gc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ppaym+Y/"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FAQObY1597262
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 14:06:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h7nQZ/e8Knzo4MzaXh2frFTin9XEvMhbWwFnpxEu8qc=; b=RXMcu0GcdXKOOA09
	Ox+7zsR0qqqB2NcJAo32kaQf4xJ2YnaT6FGZzOISloAtoavxkhAI2cIWhqYWjDAr
	1AgqgFgs7KdV+HepckEazbH1Xk16pbcTGSAA5Ub0DWXbwg4rI/ovC50q9OyFK/+2
	gXPX66zTSnl4pekoNOrv/29tqutRql8O6xvoZxn9FBdN2dXQXybcqcrBxMbvZDYj
	ehdxE7wCr3sXAxn9zwF3oOe0h76e1fSZ3eyQ++bYU59h271IZcxjLgh6zy8fi56j
	udmKqxsJoNMm+lVajZatb0bifYX2jutEDLnQDh3fnxT0xdimwbEqBGAhjrCqK7G/
	VzlOYQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haw2v8ug4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 14:06:47 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93e629c7b16so86025085a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 07:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792073206; x=1792678006; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h7nQZ/e8Knzo4MzaXh2frFTin9XEvMhbWwFnpxEu8qc=;
        b=Ppaym+Y/cwrHEOAiRDmFDp8gHm+emtR0oc3+ykEn/GvV5aSWv5xOrW1ISLP0oaRdfX
         CSlDPLuBtZtCO6dPZu+FpRBEJFJ3HZmM9U1HSpE5cyTDxe66aBqk161HsqUZr4pT8SuA
         4eJTZEbfVIoEeLdeFUs48MpXAO0juTaIKbo+0A0oEgUq+avyMl0DHix1fEOg0bd8JJHT
         y52ZtydQHyl3SAO67MkO57Dnr79L3b0iZkGWJw0bpr0Q0gndvvSb0fV6c1Z464cvSR96
         cTjWY1oLwVomyWu3WTahWX/mzWm1EObodaYSTrjLC0ycKe3DXjLiDYxi0g9QHV9PT6aF
         C/VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792073206; x=1792678006;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h7nQZ/e8Knzo4MzaXh2frFTin9XEvMhbWwFnpxEu8qc=;
        b=XbhjIdTge28mihWvMXOJZy19zFHNJaJ2zNPi2MeqwW+aVJYcLZC1bf+rEFStdnH4/W
         ptn8Abd0IqFyh87FThwk+3Yj4thK5MBPF2niDCDvgmDtg05FaICasiy0Oa16NKp0M9ZD
         jn+qgXdfPB77X3VTq1e6NLOavgwF/+iOcrh9+BZtIjM7GlkFjJ1cpl0NdfGu+D30ELp8
         2vi7ag9Yol82dGUENcF79OMnQEQypzewPDzz61sdB9bHv5qLM3GoPfbq1boWaJMFtQj9
         3lyH31/HucYq1w9DjkErmVEhCSYFedzksT3VdrfQcLT+N/s4eJNK41CGQP6l4SmSjfzj
         WYkg==
X-Gm-Message-State: AFq9FYLxsM3NWFFEBZaISJfuq42jYBVcfHpbarTShy1M9TboOwzlH4KW
	cVzz61su8OgMR+JcwIZEP56PQ+Q8m1xcz9R7Gie7uqtV3m0/pMEjzNHHYoYxnGZuTf/7PTunyFo
	CQGhgOcngcDCQEX8WdzLAkzUPDtH8vksmA/rwhP0OZw847FsxwJATQuf7QFWrx+vxS36V
X-Gm-Gg: AYBFou1aOVsNXerN97fzjRPk2phZGkM3f1m1f0yBDVJzC+NcQFMbshQMzXTvRyzIyul
	mQ9hU9eLEJsBYIfNS/RrMDs/Kwit2CFPTUHj0Fa/X1/ySGwF5/4MXuECUKyFsIMdiUwCCO/Wz0I
	YPkFJjinoQMoz0EDqVlWiWSVF29frQWMEfp0TvLkt0j5LP6N+HyELMe3FAJMMJx2QeHHCkrwSxO
	4G2ChqlaS9BnFZoig/2fqIlhJ2GE4UOo9QpSI16ugwOyaCvlQ4c6zpo2407Y+IOCdezjvUvUpJz
	GnyA1BCkc+XjQamzl45ouYjsoDZAhJOerHtK64VqrnBY4FXsh3AiL0N29J9tC5MdwF12jPrEVWq
	CG3C2XAsG8f/sMv16JgP7PA==
X-Received: by 2002:a05:620a:3725:b0:939:94c4:b799 with SMTP id af79cd13be357-93ebd25945cmr3560052585a.5.1792073206020;
        Thu, 15 Oct 2026 07:06:46 -0700 (PDT)
X-Received: by 2002:a05:620a:3725:b0:939:94c4:b799 with SMTP id af79cd13be357-93ebd25945cmr3560047585a.5.1792073205506;
        Thu, 15 Oct 2026 07:06:45 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be33d856a2sm1370965e87.48.2026.10.15.07.06.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 07:06:44 -0700 (PDT)
Message-ID: <a504fe25-f798-4077-9625-70d8fc4a957f@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 16:06:41 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8] arm64: dts: qcom: milos: Add Adreno 810 GPU and GMU
 nodes
To: Alexander Koskovich <akoskovich@pm.me>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
References: <20261001-milos-gpu-dts-v8-1-98b14721b7e4@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261001-milos-gpu-dts-v8-1-98b14721b7e4@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1NiBTYWx0ZWRfX74AV/BzgtEp/
 IWOq6zoYg8KriVZS6GdADdNWwzI/fF8Qo7pPU5iK2s4E+vC+Qt+7XYJ+w01L1q10mu/q4VvTv5+
 S/IUP6xHC3prSS3U679GolEpecDX6l7Nh03lPxF40IFlXkjVGKqtTorZkpAAjxvDmcfTYd/hU04
 Y3DIgmPYPKYXdg8kjWq1/FeXsGUxvd8a6rcn1cQPX334KM4wlG4YaB5AYpeYsGtO59j/2R8inx7
 qEEN5sZKhSJNy0bQuvV0Ve0tqoba0BAX5ZZjCty2jDfCJMyC5SB+GGGmMPN3/NFIbr+LbDudv8w
 4Gcb0KwyvTPQVEPYr7AnvVTd5fcymSfCWBdsFPwX6F6WoUTksIpxICCa7db/y5V3CsBrJw/1JP2
 caSmZyOXPE+MXjld2shMrXblmlOF8dorGUIQ9+4yXWXNxEFg8X4cQo/AozKfMUegAsGdIcPOAfX
 Iy8JKf+f8YxrHld3kCg==
X-Proofpoint-ORIG-GUID: KajhcR2uO7sSkHV1vHMO2Kri8PAow8kl
X-Proofpoint-GUID: KajhcR2uO7sSkHV1vHMO2Kri8PAow8kl
X-Authority-Analysis: v=2.4 cv=G/CJgNk5 c=1 sm=1 tr=0 ts=6ad0ddf7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=as5TUAiMO9X00ovHkSMA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1NiBTYWx0ZWRfX38wS0AhUy5u/
 2fieKZbjmYflc/c1RY6inYw69nxm/qzZdyoPQC/6fw24c3sNI5m4sUunnmuhA78kOpurcEjOV9A
 aHoj164q6UkWGJ+JUIWCqL9eZFhz0H4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150056

On 10/2/26 3:33 AM, Alexander Koskovich wrote:
> Add GPU and GMU devicetree nodes for the Adreno 810 GPU found on
> Qualcomm SM7635 (Milos) based devices.
> 
> The qcom,kaanapali-gxclkctl.h header can be reused here because
> Milos uses the same driver and the GX_CLKCTL_GX_GDSC definition
> is identical.
> 
> Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
