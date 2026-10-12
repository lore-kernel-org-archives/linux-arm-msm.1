Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F5B22F7EE6
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 08:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791792746; cv=none; b=CqU2bNYLyG1qracEGrQc5ULdPMvZzxMGW0KtsS/hBiL9ruxyFtpQiHig8YmhXHTt0FqXhVmDU5koKhP3S11UuW5hY5aB/OT0bk5gwb5Is151P41uUoWQ0+Ai63GhpMtKMXRWsaXGeH1qXquy7jOV6w8IvrFb1VZFR77fgNfMBMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791792746; c=relaxed/simple;
	bh=Eigyb5yU/yoEUyJpAZ1pdAIXqCCX2dykvEGn+0HTJdU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ttz2sQfaZozLvPM5hAXbmDhDduTfb5w65Inhq8GYGveTB0vjl12LD4r2kK9hql9oGSC3672KgA5h1Hh5MotXUOgtFn98nBW4BWBsxPYbvpl803gVJvg6jSdmCCI2pqaV57eSsveeAVXJfD5pB2Mg1jIsBGJ932LBBzeIBVVhLB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sx1OwxOo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WAYKqbvq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sx1OwxOo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WAYKqbvq"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C7hVsZ1695152
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 08:12:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QDsfEPhwfstGXtyIHPjDssEUUvE4bGtbloleL923ipg=; b=Sx1OwxOoXjciOR6r
	igtohScS1Z3Mpl8wxvVlru42qxvdWipxhn6Yw3IizENNfVNb6bAL2vJA4vaB7E+2
	JTieuDGXBO4OT6t871I681OwzMarPoifYmHmrZ88/sIFghxMm2Zc2KDkdHj+boPv
	x5AS/e1GihsmsTrrwg/3FuxLOrBoJDEFPJv9A+4BzcvdWoWhpr7rpoVLs/ObcpJx
	hsOV/h7xPA38QnNdUCCNlfb3UceYuVzq4/6EkNfyzXXX19ZW8wUtfZ217Hdnn8hL
	uRhces0afrfyZLfgQVT4UpR5e6XNgnUMXNZPBMlrCn9GRS2DdhcCuWT5pu0Dx2ak
	En9pkg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8udq03m1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 08:12:23 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9179d9bc964so7902926d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 01:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791792743; x=1792397543; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QDsfEPhwfstGXtyIHPjDssEUUvE4bGtbloleL923ipg=;
        b=WAYKqbvqyz2boWg/OCHbQmQAKgiY5Kn0bxWVPUL5wT0EDA7VTtEqe+So5TVCdKde3X
         PGJzCsZkBOfzfHMpChhEjb03UiW7w29ZJfTLD9GeDvlFdHL+QiHU0qiqJV+Jnbg3Jea/
         6hRoJnSJdDCdGzHQtVrGTwdcsZpIXu7IaB5rtKxJTGHaS294BJ96QeeaXRNjQxdeczJh
         AIsgXUBVplQujrkiNdcv4NpSeB03SlAew7VmexNtHPZaT83Ta2PnJGEQZ1jEfsG4PDQW
         kHCM4mVOsWH1MywGG03qS6VQ4tRjZLqkNcTdwlxHPGvNAb2M1iOZk8Ck49KuHJBTnXri
         eVTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791792743; x=1792397543;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QDsfEPhwfstGXtyIHPjDssEUUvE4bGtbloleL923ipg=;
        b=rHgXssdwCtMIjwzo+P9T0YtwYZUZirwoZvAem4LqPQiVcHZ2DnnHjesBK93kAPGKpC
         eGW9zhpva9KKRzdKZ4Vvq4PGklTXHMKoH3uvBAfhLpsYMR5Swx4NEaOEwDkGC00juEaJ
         /K9R1gJfrRtasDUtifzyww0nHbQZ+0485wXtwKsIY7rZZ2mslSDdZTR6iNl0HPCSCPSB
         o3Todo/ljXOZ/tUvgXXYnau6C3awI/wLNkD8XjY4MRqD9O4D55xKpPADpb8tBjai4SGf
         Rb7VB78YkeWJrDiKqpmEqF8DzymgnM+8iBnP0nTxLp2+1oM3mKyLMZTbr0XNSzTezGQl
         qX5Q==
X-Forwarded-Encrypted: i=1; AKwUvBzcnedvzl5EX8bJyr4Nkbp+eKE3Z34oOcaI91vLcnhmV39METh63fhh0YAwMe5Re0bgD21/TKHbsweaTpal@vger.kernel.org
X-Gm-Message-State: AFq9FYKrX6+7ExKDs64af40Mk8oGmcjlnFSA2+ygtp5MfhE6BbxX/8vz
	yCLsqQIaPAAogwhL2bZNoMrkM+cdk12zhO++yN0mfKqNR7TcgyIQUcaqvhrwY4CUbb/k6GE1SPB
	L3aMqd+tDAxfgFLzsmGlVLwBbdpFGCW6Cgq2AGVC8Fym3ggTb/PdiZnFZ6n6qrMzA6G+I
X-Gm-Gg: AYBFou1gfXxKHPkYI5V6heOiVHlfrld7U7Tp+lkYkr9SzLQfDap++3naDznjGjQRM0B
	NM9HebijEvGWFRQrk4BlDwlu9avJmcnaG7F9mmg94tBbzsJllaGoqm/Mn+P1nkDrmM9XTiX9pgX
	q7/41+auYiMlK3a6cd9tMl001yRkQmxb9AlvnJaLjvs4YcP+5gdFc2ms7d5yPF7WihLn52VwCWD
	pqGi1UBHvW1ovrGerlRdNtpotVRtQdu4XpQsYlrIeggv4+EaK32vS/QDHa/5poAawm3rpQbem8B
	CZpf2qXM83NiZ3Pt5byAeRMDoOplVIi/9f6HEDwkWhCFOVoJ11OKOEnhTYVozKzTPl8rQjHTJa5
	VnM9sU8V2S+S/BXcSp/iFOw==
X-Received: by 2002:a05:620a:19a2:b0:93e:54d2:2283 with SMTP id af79cd13be357-93ebd2955edmr1592996985a.6.1791792742706;
        Mon, 12 Oct 2026 01:12:22 -0700 (PDT)
X-Received: by 2002:a05:620a:19a2:b0:93e:54d2:2283 with SMTP id af79cd13be357-93ebd2955edmr1592994385a.6.1791792742285;
        Mon, 12 Oct 2026 01:12:22 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9767227sm427742366b.11.2026.10.12.01.12.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 01:12:21 -0700 (PDT)
Message-ID: <582fe88d-fb5e-460c-b67d-a06072c64fe2@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 10:12:19 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm/msm/a6xx: Move a702/a704 to a6xx list
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
References: <20261010154125.726149-1-robin.clark@oss.qualcomm.com>
 <20261010154125.726149-2-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261010154125.726149-2-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=evJKXYpX c=1 sm=1 tr=0 ts=6acc9667 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=4hOvTdViVUcvaw6_JQoA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAzMiBTYWx0ZWRfX0kEZmx9N20L2
 wPLXI7DYyelOiOtuaU/Oi8V7eOshuOVgltEPMjElEzuVVsBVK6RsarA5fGcgbsBNuu+9mh7miMd
 9xn1RlZP70y0tuc5Rqxz0DAEsVyVwcc=
X-Proofpoint-GUID: Z8ddXLs_nZqcIZA2k1kHcUg0u0c3Vd5I
X-Proofpoint-ORIG-GUID: Z8ddXLs_nZqcIZA2k1kHcUg0u0c3Vd5I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAzMiBTYWx0ZWRfX4lsV1MAJhaV+
 gF/4YFjzLi9ZQo/4wZReZ45umvfZlMdbhYU5OItM5Z1fbrMSHbcGzHA/bGD8rPEnnV3O9hXIU4f
 msqkdcZKSJtFqQ0u9sECyzdwn3GTLOQvBnKNzmfFUbx8BiCojZ3CCn4DF8+MySm7qoGsTNnKIRC
 r7/USpFIhKr2ILN6dgzQTOcwHWao10EGPXAaolRjnNvdS4rIJAX1PKcFBYNQz/f3wMW2qj4F8Dj
 g5rD/OBa46MyRSJOWWuzPXTu5cmk8kAd45nlElpqgwSVpDo2Vpubt/vkj/cv63yO+9B39IlkOrS
 +XIFlPMUEE+dibn+1mAcHOB358Yg8Xq0l2Z9JJNoSmtVxHuHJxA/7rrHT+WVnUuF1JHYuQyhzsk
 E8xBrpGzGL7G4gAcjA0iA/yld6fnrQUVJunI9rRYxklYGnZtmOuskA1PQTI4TzsgsBjSQ/OzdrF
 83aQTBZwgS0k7l6Aa1Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 adultscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120032

On 10/10/26 5:41 PM, Rob Clark wrote:
> It is a bit more a6xx than a7xx, and this simplifies the next patch.
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
