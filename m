Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792660068;
	b=jMB1Dc6tklyq9Ux8CTFC6NJ7/vVCh8YTY1T1HZZRCifhQNi6Yb9wTtCCqFVraRrRg4vA
	 EqlUkyjgcdmuk4MS9hpnXwQ1KOW+kGKYCFn4sw7UL9/jR4kNJjCY+OX6LxM1OhNHbQu2H
	 8nJuu7M3iPZnJG4Xt3OxZsDueMv/zVj7vk/mfdesNp4rqTTMqHNFT3VVubKvsOO4M2qCU
	 zlWhfOGLOzHCJQ9dSS6p+sKJbA3HEmHuZrvE+XO8M03W9omOyPulZtiXZQXy89fpZbii1
	 A5vhN0ZJVZGIuGEY5UnDy6QLzqgsMaqdvgFE+fKmjogOtludjaL5nuE3ARl8budrLuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792660068;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=0qu+A/DrU84k7oCYC9haIMhGuasFxzNnyZOIHQ+S7Jg=;
	b=XPgMyNuIQ8eP4tE6PjFbwDI7vHQzIxqn6KzMCR1MoL8C3i10TeqEKn2KVA3VMEGQTwL/
	 LxqYYUN8LDHhmB/MhJhQyxCVrh/K1ThlEB42hTmbFgrqIwKfWgMsx6UK0K5RYbcNd+rr5
	 ofEf4Y5rrhAyLU06TJFoRuL7NM2TOTfPlW0PzhqzNVcdNid1EpqeEhhZ0zMe/GcT2kJ4j
	 wmYvCVPtKaqdazB4DSrId+WFTOC4jP72wA2II202qwPKA62SMQx8asR65OTpWsyCVLT/0
	 qzvDVOZ2FUT+evcQupGy8eMTje+eJLVjsaWOpS/B8/+2LJRfqi9GP6vIe+jjt5es96g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R4vyjIq2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EfJaJ2K6;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 394CD606A321
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:07:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 394CD606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R4vyjIq2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EfJaJ2K6
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M70Frh2516207
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:07:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0qu+A/DrU84k7oCYC9haIMhGuasFxzNnyZOIHQ+S7Jg=; b=R4vyjIq2Cag29CA8
	G4x6yXFU9bVRvJaCxHAHKK21/QDksBa4W3iQwfghy4OArd1fa5BAEKpgNFuMm811
	s4ZDQkT9Q+pzZ5EJSN8yqQQ+aC3d5umK7YrCL5VNf15qEOzj5NmSjjiM+BomNkXm
	KFdAQEJYZie7sRvpKs04i++qDNl2H4HS6U1+yiJINSiBApcfSR2BKKFJ9Rbs7neA
	eylqhMXVkzVtV638K/yOFEVmjZuju2tCXHN8SNpAzbITz0TmuM9KM5P4uXCuBsxl
	Nafotz2yQ980oZBjQYHLbTvGak4/gGUS3eNhz01F1IGcQcndKt7skDzR/su9U7UP
	nQzhTQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93a9md1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:07:47 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93e58614290so35915485a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 02:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792660067; x=1793264867; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0qu+A/DrU84k7oCYC9haIMhGuasFxzNnyZOIHQ+S7Jg=;
        b=EfJaJ2K6gdwriTj6DBb559BRj3Xee45QokrItQKeAJ23aWQ+QcaIa22+X0LsXxrGTk
         E7GFNefEMcBd4ePCFbyqbiV3xL+32ZqHjYjd4yqYOFUWOuJvF0ySpSXQ0cSb4Vuf4BSt
         d4ncNWlziE83Bckksqi4UPUVS6CsKoHdr3Ixlxme23CdMukLd5cNOlsrna79zBkeQJp4
         JQdegbxJsfBGn9ILykBRXNOhgg7nwb7vgiIKlh7F1Twpmc1zIY8b/u24e2xuSGLBW7vK
         MAug+od6V14LCAguWjHFBPVq3Ipjmhk9+KsoU6Kw7Tckk8oDENC6ZwQDbedeFw48znXa
         uNGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792660067; x=1793264867;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0qu+A/DrU84k7oCYC9haIMhGuasFxzNnyZOIHQ+S7Jg=;
        b=CxqRKNcZb70yWMUcB8Ce8s3L/tQxHc6YzuCrWAoLwrwZkDp++INO7x2bZpp5KN/Vrs
         R91PF9BpoZE83nTouCIy+u2AvZM+s/rNO3Wz2kgc5ZiKuu0okW/ukjPfIEF3vQsd1+dG
         8X2fhpPStEUPPbVnf8pibJSFRUKVxSi1kpDRP5bWBxsiaepB/l1E9ISqmHy3qUC0gSxJ
         uL7C4IdWPSLtstWWgfhutiTEiKFyhgOBqr1Qbz123+ZtwEx70IzThJrYmpN1LttxayEJ
         Uky8wNcYkuWXo+g6700ItXwUW37IFE6pN83s3v2ESlubXGVCiFrKRu0OkUUO6JjDIkVG
         goow==
X-Gm-Message-State: AFq9FYK+ieUf71NMwQfcf06awjnmkepIEr2UqI+nh6dqMwvnbQ9GWjik
	IFhbpGcBeDf3Jua1M8t/qi0XN0zyxVtGNfgI1Qe1khR8zXldZLnJgoniWueiRmerHfLF1X87RGn
	C0BbSvfmVNl7mNesrQSe+NIzAuBf4B44q7Sn0dFtd8xDanOIiFf/+cvGf0uYF8mhpbLiq
X-Gm-Gg: AYBFou0lux9G3bSuG+Otzfh/VWZRdLV4FKE9q+T8aMGO0Y3Q1xqx7t+mcHlUNRz29NP
	tMBm7f3y7I4+TQySCq6VNOYqszBVwQvzZTIfEZDHfyGChxGEI/t5ocqQiBPTJ3aR6JsPH2aiNaD
	0iA148TviwisIj4LhgYbu5O2JF/zSP+1ABOrWrDHOV+RcWuSjU9H/xPjDgk+7+Gr+KtW1RAQ7ic
	usDfUUtYoPBO5FPW7nwTFCPktFdtFmnC0Hxnqpca8EEL+GAOGu146ODkkU+tBqzbsDbGu8U9dTo
	hSh8XI6li7KJRXEY5N0rDHzsAhQ+7vtSqutQZmPQwHSdAfQNZBuJvQjym6KULAiaJi8yojxsCCP
	8UP/zgwGYvJiFdQNqZU3dLA==
X-Received: by 2002:a05:620a:6084:b0:93f:1fc5:f07b with SMTP id af79cd13be357-93f57eedc95mr955688385a.2.1792660066443;
        Thu, 22 Oct 2026 02:07:46 -0700 (PDT)
X-Received: by 2002:a05:620a:6084:b0:93f:1fc5:f07b with SMTP id af79cd13be357-93f57eedc95mr955683985a.2.1792660065814;
        Thu, 22 Oct 2026 02:07:45 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a4ffcf7sm85290266b.24.2026.10.22.02.07.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 02:07:45 -0700 (PDT)
Message-ID: <8cc2f172-0df4-4494-bc1e-3124cd25afca@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 11:07:39 +0200
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/5] arm64: dts: qcom: sdm845-hdk: add display card
 overlay
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Abel Vesa <abelvesa@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org
References: <20261019-sdm845-hdk-v5-0-4aa7e22cd0ed@oss.qualcomm.com>
 <20261019-sdm845-hdk-v5-5-4aa7e22cd0ed@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261019-sdm845-hdk-v5-5-4aa7e22cd0ed@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=JudkP84C c=1 sm=1 tr=0 ts=6ad9d263 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=amIBzKCq339hV6VJ64AA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: V6MTfpteKay7rFN00stABZs2ZvZZWQL4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzNiBTYWx0ZWRfX9BO/HSGs4MLA
 jCATg1PX9qs5yYjL45EAFOL9+cXxhg0nC4qdUUm61YLx2pUwBrOafO9Sptb0+Za4JODlw2KMygP
 La+wrVp2K5i9+z2YEQ0EDtqBVBfCBYs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzNiBTYWx0ZWRfX4gW8QVEPWsSa
 MKGs20EXQ0kbCK0w7hgiyzl8dBXgRRa5T3oLqDOMqKF6iLFJE9m5gPmu3hQS+wlj+rIBmIMjGF+
 ggJexPkRbnYebiNeVj3Y2KpKq3yd3t1QJn3HQWYsCohEFZQryYU+Ucr9rLgaJ4U5j1glyqHGI2a
 nUyfpdRikunSXMrBHefU/QD8v6n4MnNoStNDjk1LUaH5yFmX8xWcDw5cg6j6K2niXU0fBxvRegx
 8cfxlZ1UJGWHbPwAgj9GGzZkAU9SDKBDonI7NOzsEC7ObTAUSMdHlqkIxgjV6ZbaJ5Ctr6Ks0PA
 YyuARMb0oQP/yH86cs3vlqFaqDE4IMD+Ee50NZF6iwKe542W8DDjblUBzNmX4uLK6iYGg03rDI6
 zf8Ji2QGf4hBjpMAgR3N62nKvIcUWB270GiPk3L1/sTtokBVj0gcBAwMmT2VGdvokp0lvnfpaO+
 IKueqDmhQaE5oW2fd9w==
X-Proofpoint-GUID: V6MTfpteKay7rFN00stABZs2ZvZZWQL4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220036

On 10/19/26 11:18 AM, Dmitry Baryshkov wrote:
> The SDM845 HDK can be fitted with the display card, carrying a Truly
> NT36850 WQHD dual-DSI panel. Here it is powered by the PMI8998 LAB/IBB
> and WLED, and it is mutually exclusive with the on-board LT9611 HDMI
> bridge.
> 
> The configuration follows the vendor kernel, with the bias rails at the
> 5.5 V default of the LCD mode.
> 
> Assisted-by: LLM
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
