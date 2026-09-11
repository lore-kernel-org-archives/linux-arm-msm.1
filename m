Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA4F492E55
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 13:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789135176; cv=none; b=t+PXVfO4QEmFg6/b57nOoJv7/buB2EAxxO0+rYFfbAvf6p7x/VBepSiMptdpTEvJ62NAv1vJaLAmW6MCQuWqOvMU9VmFcfdv4jAibL1Rhiwxx9DkWjdqgmycdf5o+iADcLBxK6ZJFS+MpG9QnZ0orv/dnfzx1LVinAnNm57W5jU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789135176; c=relaxed/simple;
	bh=Cfk7Wf7OJL8eydsCbFx6AkcZQNkpsmWuq6yeNztYobg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DGuv8E2HYhATezWFTW1FiUsr9pjzwfj1wcrE9ftP+M9FSa227C5Vr7AnDPKwH5LmcUB33h+1wYPPrJj37qg8uMk2Mt2ElB1amWKz1/1KZ4rkAY00gJOlPeCiWGU4cgBOKvBGR/F0w7vvKDvTBPRHjrFVXTQ1fHQzj6qdhijw+UY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EaxGx1fC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JL2GMymU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EaxGx1fC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JL2GMymU"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BCiVeg3505450
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 13:59:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LDeCS3eZuekduy4ndqVJ0IHC
	QIxJlJj9sTDSGZEJfYA=; b=EaxGx1fCfdvGuDn7PdQ9L9mqLg1PORnK0PQemO8K
	LPw+8kujUEY1LyQTh+sMHJCs9pj53r0H8gAiPir8PScafxsDdMrOYvoRfalUvuyh
	FJSwVLI2y2oNnCZAttJNWgmwk1/Dt5oYU80ZJ+iaiR/FapS619+dW9muhGmsiS5D
	7EBj2RGKFpxcesk8KB9y+Bke3rQ60w3Cok3jAaLbWdOqwU+VRVzS0cuxws02+b8k
	Yjvb2PKFAIzqV6Bi6Qf5PLKUPR+4l1HQBfsvYvzIbVFNGF1ou7NjPlEN3uW8yP9k
	85PFDKz6sjvNhxyEEGmvdqG4aTaWPPSMzx/++0O4sPTvyw==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmcgfhshv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 13:59:32 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c843d5c0b7so296400e0c.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 06:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789135172; x=1789739972; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LDeCS3eZuekduy4ndqVJ0IHCQIxJlJj9sTDSGZEJfYA=;
        b=JL2GMymU0zd3k5RbyHvv4MTVa0WFy2OQtrbmLiOQbTAfTixsswr1ybZMTcDgo3iz//
         IEDCvAhSKX47x66jXolYhmIE+cbRtffLNSNN0fj4GaIiQLL5WM8LaNY5KKSG6mDDH7ZJ
         XeUpjUOfKluWCxdTdrudnlINDZlSpdX9F/L5hrfBbrF4GZMH0B+YYNT4DifzmuiR3lqQ
         oc+voHsXheBum9i8Mrpg2aEwiqZSuePBWHcNvQWkfkwEEWteVgMxkblMWG2hakXbgzBU
         4VoyMtjbMXDPox9TVnzBwcz0dsMsla4D+uQwJ+20BlktNQXo6OEppxiEs0ttyD3VY1bw
         B1VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789135172; x=1789739972;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LDeCS3eZuekduy4ndqVJ0IHCQIxJlJj9sTDSGZEJfYA=;
        b=GNRfnUv2ov3tHu7wy2buDIP+9nUUt+aX0h3LdJ1AEKo5AQT4KAlchz5X2wRpnIjj93
         TzhqpqmH6UFuHVy5FYkmLCgKjbWkNIGtM1a5CtEBrPX69Pq1dqi+LXrO6i+Kwus44Fwg
         XflGlAG+Jm80GFT8YPev/tTQH7qkIBAARI+M66VHcUADC8QlVi/m9/RSjL2JR05SnPCq
         LAGJrSTXIqbSbsNuO1F8VCBMHty5pwB2Q82/igLHpDdXgycQKIE2yBePTvs31v1Kz9+N
         e6auDp+cj++J7tL5YeO8Vd7hLYd9rHMVg8EA/0iZtlIZBxQObpKG9FIdRcTsaNqMtaVu
         JZwg==
X-Forwarded-Encrypted: i=1; AKwUvBz98IZzQl0Fohbvs4NjLy/5C3xxDws7M5ljaOvWIvgPXoPW3eYMt9568SURGjiHvuYVpW+74JrEbdDK2RGN@vger.kernel.org
X-Gm-Message-State: AFuF++lPbEMo763nBSe5VyUT6bmBEimWQtOoSxrbNJcbwl8tIxhegFR2
	Y48S4iFhtrv2nYn/lfNkz+KvmlXJEBq8rJYrN1u2aEXXsNtf0PRkuApmoV58chjs/rtxIfXPXqf
	JTqcwsKV+9/RGryabmEzzmaEJrA+6E5VnUoYZZ+EA1ieswgTKKHg6+rPW/eQH/s5abW/x
X-Gm-Gg: AYBFou38wVTayCaQtV428tcW2DkYeQg3oh6I4JpQ7K+nmX4yuOrsrn+7/bfrIl63/Pm
	jQ1QcXDtxjrh9jh2wDyVfRpjQSbgS16rEMCdTeAnZ0xiO9djdIzZVU1ABFlTAT9bRG1ajyPFb0t
	8eXYJkqlhURgYyfmhOHi9aCgnTaEs6carxZYLpJF72Yc6t2ZZO/tQ7XGHKC3Q+Cn2kInwAdNtMP
	l/tt2/wDDhRPUS4+pqXO0lhGw7V63+niV+fh4pxRv6T15iIQkmIOeW6OSGWHESdVbzWxIJ78Evp
	9C+fCsVDpZBHJFEpiav+SGfB8CbZ7aJ2Z/aQcp+T64EtY8uiwW1MTogx6S9sS862xhUNGtxPr6M
	8VLUwQVPz05epgJk=
X-Received: by 2002:a05:6122:3783:b0:5c8:44fa:7230 with SMTP id 71dfb90a1353d-5c845f4e527mr5860247e0c.2.1789135171561;
        Fri, 11 Sep 2026 06:59:31 -0700 (PDT)
X-Received: by 2002:a05:6122:3783:b0:5c8:44fa:7230 with SMTP id 71dfb90a1353d-5c845f4e527mr5860159e0c.2.1789135170931;
        Fri, 11 Sep 2026 06:59:30 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb2ed106sm5985011f8f.1.2026.09.11.06.59.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 06:59:30 -0700 (PDT)
Date: Fri, 11 Sep 2026 16:59:28 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Greg Ociepka <greg@ferrisoft.com>
Subject: Re: [PATCH] arm64: dts: qcom: glymur-asus-zenbook-a16: Remove
 RTC-through-EFIvars
Message-ID: <2jtbekwtmzi5zot4fmxj5goaw6wznzgxymx6xubc6hk73yx3pq@7mk7agqbyv5l>
References: <20260911-topic-remove_uefivar_rtc_a16-v1-1-0967d8d4b3a6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911-topic-remove_uefivar_rtc_a16-v1-1-0967d8d4b3a6@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDE5NSBTYWx0ZWRfX+e654D0U3kTu
 6DR7HMY4CfY5vg1CVJ4bW7WusEekwmHT+biOBDDHNI8ckbp0XY71EaVVBCet4EYLgZ6jt94VYrq
 TsYd0Nt2+UZaLM/fuS1mHkJtqAdM9/FZhdLlQw/SzLKuNaKXAqjSC5aXm4yJ8P8Re/w8Fx2EDwm
 R04NHpoizvEl1bO1b+YQ3miGf6BCHVByIHsfnCxpFtLl8qlPj/N/Snql7wkuoYbX2rFB62PYJru
 tdQjFukENQyNi3fdWDXdQQoBp24ZT5VKFDarqIC+PzvAYXVKGzGSOKmxPq0VHvfqqg9Gh/VdF2h
 1/rBkbp4tmO06xVYmyqd6U1zfMCCR7EwWgu6lsXZsmOPM8wHZk2ZOYZj67A/bqOEWGU1GyNgfYq
 sq3AFT2HVUuEoJJDfYXie+8CFLXXFbmcc2d3mzavmkeP0Rv3UxouvRdt+Z+qEqHfgDew8spBgFe
 vEkNP2TYaK2TQNmiq7Q==
X-Proofpoint-GUID: 4aoqpVB4VhTmC4-i5HM1W_bUAjmjQf9v
X-Proofpoint-ORIG-GUID: 4aoqpVB4VhTmC4-i5HM1W_bUAjmjQf9v
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDE5NSBTYWx0ZWRfX4Zg3Gy5dH+8U
 OwSjsw1R35mr/mSfPRIWn9WfdnkgUH39gzGHzvX3l1ffLEv2cEBo7/gvP6l/DGzEp2Tf64iy6E3
 ucYfobQ1aA/0L94SZQjQlyU4TV4aG1k=
X-Authority-Analysis: v=2.4 cv=ULtIjyfy c=1 sm=1 tr=0 ts=6aa40944 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=a8UEx8NLAAAA:8 a=EUspDBNiAAAA:8 a=6ODT9UzxMjEpfHFhlBgA:9
 a=CjuIK1q_8ugA:10 a=XD7yVLdPMpWraOa8Un9W:22 a=-yeuc7zBjbfZT8aiaP-D:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_04,2026-09-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110195

On 26-09-11 15:27:03, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> This machine, unlike older Snapdragon laptops, doesn't feature an EFI
> variable to denote the system time. Remove the property that suggests
> it does.
> 
> Fixes: e8fbbca94db7 ("arm64: dts: qcom: glymur: Add Asus Zenbook A16 (UX3607OA)")
> Reported-by: Greg Ociepka <greg@ferrisoft.com>
> Closes: https://lore.kernel.org/linux-arm-msm/20260821181148.1642208-1-greg@ferrisoft.com/
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
