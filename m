Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB233B71A4
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371746; cv=none; b=RALYlA3ZABsV08K7jlvkuXXm69cViEPpdg4Xwv9ZLbwgksLIhQkXbT0EAm4dMWA0qUJbJD97kC7j6tZN9rm9hmR7TIuruajt13z8Os0Br7bAAWm9SS7oMAB+AO/BjlyN/NVXduipoIuQlLTNX2ueFkXD/6AlD6PxyEUMTpNMptg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371746; c=relaxed/simple;
	bh=hEGigLVsABYi+19iFHU7a7vBcEAe4a7cZGQQsrQeVtY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gjXBX5qpMXAlTIdxI0eKYBFTLMv1X00jZctgoy4VtE31fHTf3okslup8Az0xfjEOvkL3ZrCMHtDBNUwAgLMZb68ieiMcAQcsHP5O8/0E8GXwkX+qBvK08yGwZRt+2kM8kY2xPjjiCdOP3qXDpJxdnNskosF0pmoLXQcui6DNFww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lT8OwkmR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L0+7W7uj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lT8OwkmR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L0+7W7uj"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5jSr0237672
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:42:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1KPSWCtPsZzDfnveyc4r3Sgx
	7K6pKqfSWEz8fsSXk0w=; b=lT8OwkmRRJtmiY/4tCbbPA8fImxSW0A65QLf0Nrd
	4YytYhgLTovlK1VqLZSVF3QMxR/LkGiQfvJzBue42eVKaSdPu4AEUe1um5VodSA3
	PhUZICCBWI3UhEySH796Ft2Nbsd8xsqqoqTjjv3K9MouIItmhZuXuQA3HFB5g7La
	ULFMYbflyVhlnef66XLPGxDGFjZLNXfpBtD07Egg/wrAouZQEr4eAAL0IMfoQZdK
	KmMKNZu3spFrk4Jbny3+5s9pxqABV/p9E69PW3aexhOLshOvwIZTsf3iCJVatc67
	idPEDOWQ+Ji431apmCD1LVmpq3plb02wZY1nKs5+66SfPw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9dnkqg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:42:24 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-90e87478402so77932946d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 00:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789371744; x=1789976544; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1KPSWCtPsZzDfnveyc4r3Sgx7K6pKqfSWEz8fsSXk0w=;
        b=L0+7W7ujNHmORa6sLAhnjw7zeukaerE/hPFmyJndhBqT5wOSgfqfPfk8F19Igm4V9T
         VdkdkB3o+R1DvB6yra8QZrGm9eWgT9lmZF1hsbiFQMCbYrRT12qGO9Q3EXkZZT4T9LSP
         /N9DVrMNheWs8NNcfqQTBSjqE5ATTVMg9M45wuoQnVVtUc/KX7mp5bBcU1EPzELEpWa9
         ZK8+8WcKwYGBdb+tO6Gz7OxovaexQ7xoolfwD62gTFnVBCOHXCIjE5fYG//rAtuv0ts2
         ScVUUPIVisEoVK3WVjSM3rsbxNsQZ47VAt8IV0nkAOLnXvI1jfmbrkoyiVw0YxYnvbsp
         xmGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789371744; x=1789976544;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1KPSWCtPsZzDfnveyc4r3Sgx7K6pKqfSWEz8fsSXk0w=;
        b=eGKNWjlzOqH0ZzVZUZtchweheP90jTwTv6GGWZqvCOy7tkknt4frhwlLwtiFsU/LQ1
         R1D/utknPKfsPtBUOltOiL39WYFuCOhdh1fwNARrY/XWBfbvKRBVlrWYwVCriKLYp/lw
         hT50FsZi/2sRBy2gF1sHshszS/0yPG9tp90WATqCU7KdgwzuK05o2T4wUOh9NfjwuU7D
         iXVjHTX4Gz/HAVeKp58/WEdGsQ4zP79hOrGaDhdsEs6oE7BIhOhjrGJp2Kse9NyOiRY5
         xGhTgSuxnJq3B8KleToGGEUKAQWUJKVDW0VXCo39c0mXEPtq3pWn9FwJjIHXcxhFPBy0
         oc7w==
X-Forwarded-Encrypted: i=1; AKwUvBye8+g7/6iMBz9uxRqxBlW6kKmq+4STzNFfRjxenvIh2FOkkC+shbSv9A+aXdlWRVgotbG/sUqwLsUzeRLn@vger.kernel.org
X-Gm-Message-State: AFuF++l/1p69m9jEPhpzptJAmeABkQHFqbVqztamyAxPAjE5J4vZRI5O
	WBCBtcN/LwFncQAb3icFs0sNvR+HwarL83aWygb5lrFJNm18SDVy7ckkbbQoc/mStindugfokQZ
	LcOZtz7g6j5nox1FBOkSIusmZiA9GB8ZMlLLmd064/7eTLwTS7EQMxRHu4vAiOT//UoOz
X-Gm-Gg: AYBFou2VIpPZR5uOiKDeebLa53r4e8B+5sbCbz+N54bZTdhJWCroPzEup6qHwKsrC2d
	pWN+7ZP8mmAGS98ap04OZEqh0fSHslJuTaLgYUEwstKsUdN8ZbgrbratwjsxaDxK7Y3HMTp2zfU
	nv2mzKGj3JZ5qkmWggz7NfSz6oRC8A+6T5XCuWMDS1qajkWoN7XOrB2HvKFLI2HV4xje45qqw32
	ST4TmtQ4lctR+aUxou+4k2AJnipbxXntmS8LLdGSIFBQe1tR8GjWFeiVH6335a4h5In0P0dw2mR
	dZf60ulp6MV+8SMfVQqsREyTJDFlhGcPshGW3PjEIy6oPncPEoes/6s3qIQ696uv58rQRcbjWMV
	Kr/KkbDXVvLk/iA==
X-Received: by 2002:a05:620a:601c:b0:932:df7e:b31d with SMTP id af79cd13be357-93a29847db7mr177789185a.12.1789371743478;
        Mon, 14 Sep 2026 00:42:23 -0700 (PDT)
X-Received: by 2002:a05:620a:601c:b0:932:df7e:b31d with SMTP id af79cd13be357-93a29847db7mr177786285a.12.1789371743003;
        Mon, 14 Sep 2026 00:42:23 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c0cb676sm213066355e9.14.2026.09.14.00.42.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:42:22 -0700 (PDT)
Date: Mon, 14 Sep 2026 10:42:20 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 25/31] arm64: dts: qcom: qdu1000: Add domain idle state
 names
Message-ID: <ah6tud7odwqbpb6otxzmv5zqsorlkjkzyp7xbsushzxe43kowq@etgojpyqxcnc>
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-25-660c31187819@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-b4-idle-state-name-v1-25-660c31187819@oss.qualcomm.com>
X-Proofpoint-GUID: VVvf0WiEAG9XRQIOGrHq6uEsgoVuNvWf
X-Proofpoint-ORIG-GUID: VVvf0WiEAG9XRQIOGrHq6uEsgoVuNvWf
X-Authority-Analysis: v=2.4 cv=NelzRGD4 c=1 sm=1 tr=0 ts=6aa7a560 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Dm1D3uWegqzzbaKFt_AA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEwOCBTYWx0ZWRfXykv2F0nsLkMM
 apDxa3eWXiDaZSLuGo861F8aNESgGed18ALK14MWbrQ4AWWhey6rpky+qZg9aevMkIj7vz5fxUe
 j2wDntX3n4HagPk3GqwNgBpSF+yPevU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEwOCBTYWx0ZWRfX+V8IcpY4hg0V
 zOPKhC5OK7YcVdkwxWJwVoqOYMgc8ZoQCgPPZ8ksBPVFxvn0QkZIvif8Cv0Pl946UQQ9pkDIvUa
 p2+0Ty0juepVuq8ukS2lvo39FA46t4+ShbVY06m6jriawicyGgrUSWf0D46U7ZBD3c4hiFCRjCi
 ChYwfEnuuQYt1oY9jYD0vVz8achetxT4Yc4WhRANFNmrxYkAYhl/72miDhOp1+vRHe3052WVfxR
 VFiFXpy6wB5A/RATeTq7AMrjGARLEYY/raEyEEYVhRsxR3l+SLiOivHFeKyAh4iYkkhfZ0Tnb4r
 nTLgOH/tg9HIsJYoK6ltsD9nXoIsZfTicm8+9WJ7rzvbd38wjBEyc9z9eqzxBBowS1ojd47iAL6
 7ieasOu15+StJtUlXyCw/mbtl1z/TYuYq3iDNhCL0lJE/1t2Vg7FT6hNW1rOwTKOrWxFE3Y6rmY
 0kjhtR3XKDoFavWUDyw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140108

On 26-09-14 12:29:57, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
