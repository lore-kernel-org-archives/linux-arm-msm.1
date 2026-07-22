Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB387470133
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 08:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784707316; cv=none; b=hq4WC940+v3xn4uWBl4YEoEej0KE/zSZSOoCb0tHN+DCFR/fyUA+l7u5ee3pZT3Bx9+n/daHxPNAsvFxiijbb3BPAmQ0J9qj4S2ZYHCBCc2NMEgNf1XUKXTSlTxFchchAuj+oIlPZiE1jzdyQmoTcTc91K3M80TQpI07ymgnozU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784707316; c=relaxed/simple;
	bh=cYwI+q9h+f0CG2PVbWY4xscz61HWZ5seZVknCpfbBm4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kk6wzkDs4GrYHrrDdFmF8wffu26P/KvqhjSX9ep3cfD5e9Z/JGTIXeqWS63aNU7XF6CQ8q3ywRSfBeLfx8BYxYm+4qYBwn2oukslJVRm8388rioub1eOo2wa+QHYow0/6Pn/5d+vcm7QYmfxoH8Ax8nXYxX0LAscno5zGtKzqls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SbHBj6HR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hhaKhw6+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SbHBj6HR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hhaKhw6+"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M53wwo3996358
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 08:01:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N4axgCtA+ydIP0KGHfAe2TgBgztZ7sCb/n8Mziqx73E=; b=SbHBj6HRh8FMYBxp
	DL38TtF+nrNPm5iwaQklbVKWqpwHtbuQqkn4gOhRrrdp7ZXGERDSUTGAnS0MnjQ3
	EYbgRekhf5b9PyB/zaLbUpFJswUamfa0FulIh4/JLESbmvVoXjxrTUyVYefXagLw
	lMEYaTQAPP2p42YIaUUfATyNsNcLFPd7imDDZCQZwr3QnF2D3fgsrdQRTtZNjK8q
	kVnpVw/SDRJOUEG3tTirh17meUJo3y3UK5I1sR3JdvXNU7OP84eQiN7id9VPN53E
	oWFAWfSAXJHamPAOPEzieA7OFNoAlrYXhyviAuRyJySrAaeCEdpL1QcLVsV5f20+
	dWcQAA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd6d2xwc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 08:01:53 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8ebb599e528so28178016d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 01:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784707313; x=1785312113; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N4axgCtA+ydIP0KGHfAe2TgBgztZ7sCb/n8Mziqx73E=;
        b=hhaKhw6+KW8666ooPf5RBOIkrnS/zNpDiwfCYcB77vLE3m0v9wcLjncLCPtTFsIMRW
         EmrEGJxFbrRdwQe9cJ5LGp27rDak7tUB8q+2/FqzqN68bhMlMjx5J5Nh/Zw2oa5ZyNPn
         yhtnpXmjnBIKEKr5oFMZALAa9rHeg7+qZmJ3jZtGpCH0inA1CtVZ9pcZVhV+XiK5Csev
         Q+/fMDvuqhxskL39EUZutYL28PFPuRfcf8JV7ygvKTGpFGsORNOkKoUCw1LMebpW4RjO
         wex3HV0/M6HmxQo5zZGrV9P4zgtK6Ob07WS9Pz++8SYPDrXnmc5OL0oFKnS03b75C8vw
         +kMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784707313; x=1785312113;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N4axgCtA+ydIP0KGHfAe2TgBgztZ7sCb/n8Mziqx73E=;
        b=RqRwJjr+cYu5S7lltM1qlbthBaO3Q2pNUb8CTU6eiouXnyZSU+yy8g2B2kXM/nlHJx
         fF+d7IpPZ/7GBFoKmBRzJ0DTVArBPhVM7V4aa99gqzp0hiikczoY5uHMTrhwVPhdLzYH
         EhhnYahW0do6deS4en6Swb5jBe5GUASx+RrrZ5qtytXy9x2jGfLlTS/m31yW+9G0OSNV
         cfM4Yxh33xOtOW6Xe0fIO9Cp+qoFGlkZCZ7Zpi4yHgnQ+8W/Er6bfTwAltvrfWMInwkW
         dNPygXGRoerA3M0C+cNTQeWk2maGXlJr6pst3VQLFo5xv7g6WZzvePtRzRts3l1bPu8F
         5/6g==
X-Forwarded-Encrypted: i=1; AHgh+Rr5JqdKabtOeVfV2y62mX6ZmyD8C5ql+sA1Fh+f3t/eqi/TCXfPS6IyntIlH6T+0nLsxtOEWyzL9IlcU6XG@vger.kernel.org
X-Gm-Message-State: AOJu0YxAnbbnubmemL6YIVWNz60NMwfQrMBPv1zFFCIM1PU3O0Yf3uKS
	wjvAxZkTooDoA97Jup8qoqfnBaO16zEigdM7JWdQQCvrTN2lZC4gOZM57dtsb74A47LUlcRzeva
	qs4EWzJgMgmICqD85SWcGi8BoPpqDjm+CuQxD+CTsizlUfm3/3Nd1Nn/IVCBlN8jBvYui
X-Gm-Gg: AR+sD127aht4X+ZgNzBhkv1b7uqyfangbztdekZlu+9ApMeBmox4Oogra99YJrAJzo8
	vz1u3s+aN5locQOOfijcM9TFGxj/TnM2i7MjyOC7ESJ9oIzbj+Gh5hwjfbLboKSG9JAqa6ryEBc
	uMWla5jWPAK2QcMyCUdPu0oWfleOmJqzqfPROXwT0dSvgsHunBkKQAy1oQ5oHbhX2zgJSDy0hCV
	TpEdxRikbl8KiC0WvwQIlazQncAoaq3TS+RGZ7/6Lv+1DpaEyAkjnlBZg0Gd520mWGDVTMHGw3N
	DJ1x/oflk67m99wTCJvQ8lnX4dcqJH9NEX1tA1/lT+26vWhtiTHIdJFstRRtABeEZ2uDmbb6/Ly
	A4wfL+a8KJvsF6vpwBTz4OgfU
X-Received: by 2002:a05:6214:27c9:b0:8e8:a3c1:48c6 with SMTP id 6a1803df08f44-907af46a568mr61129796d6.2.1784707312710;
        Wed, 22 Jul 2026 01:01:52 -0700 (PDT)
X-Received: by 2002:a05:6214:27c9:b0:8e8:a3c1:48c6 with SMTP id 6a1803df08f44-907af46a568mr61129346d6.2.1784707312225;
        Wed, 22 Jul 2026 01:01:52 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32ebcc4dsm67396366b.49.2026.07.22.01.01.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 01:01:51 -0700 (PDT)
Message-ID: <ab7ea0cd-8762-4727-a15b-2e7b6a7cc55c@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 10:01:49 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dt-bindings: sound: remove google,storm-audio binding
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Christian Marangi <ansuelsmth@gmail.com>
References: <20260721-drop-sound-storm-v1-0-23ae4a689ffe@oss.qualcomm.com>
 <20260721-drop-sound-storm-v1-2-23ae4a689ffe@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260721-drop-sound-storm-v1-2-23ae4a689ffe@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 3-INgP0E88lwV1YjWA9ndxXKN5TuTevB
X-Proofpoint-ORIG-GUID: 3-INgP0E88lwV1YjWA9ndxXKN5TuTevB
X-Authority-Analysis: v=2.4 cv=XaG5Co55 c=1 sm=1 tr=0 ts=6a6078f1 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=aqVG7i2cBqEi0EY-6egA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA3NCBTYWx0ZWRfX6+BwojX9mwhA
 pw5TGv/G3ge0vbFwQudIqQPK1FggptvQBfONpmLAL696FVEkuQuSbGVDyMetxW3Twynpjt+rl5j
 sOMS6QUjcX/scupIlS9tQPTAB8sFSRg0zd7PjfBrmMadfIQu2FtS19KZPkcs1lBeEKVk4vtZqPD
 cfNHQQpRR5nOKHjHS0EFLqxgLk2BVXbQSUFWu8dI+qucSA7lROH+Jr69vC+Ga3CrA9Byfm7B6S4
 W11YNrm7qn3uQ6V4zZHKaJh5I5vGpbTzydXy1fh1PMZqJ0yeox995TGx8ofBCjV//KO3ZmjXxIe
 4lPEiNEed5LrP1kVlJ1LejyzlPT4ECGaF27/iZ87M7GxjvuOX9nqT3RWdQpZYDX+0LdlR0t8DVg
 +DUUt6jL6iKOC+aoG3m6og9fV2ip022B+YIAIqmE+zl+hplk5MgoF7vNVluz14BJDMEkEEl8oFa
 T/HorLJRDXH02N1/KKA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA3NCBTYWx0ZWRfX35Tk/umbJuAV
 +j2EVP6cyVAXNpGw5HmIXtqClh83T1IBQUqNdWECsS8Obzkd4tLfZpZCtCvIZgB24Ni+KQrggB1
 RBOyAtKNosMH/iqYd4P7TifpDD5wUsU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_02,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 clxscore=1015 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220074

On 7/21/26 8:12 PM, Dmitry Baryshkov wrote:
> With the ipq806x Storm machine driver gone, the accompanying device tree
> binding describing the "google,storm-audio" sound complex is no longer
> used by any driver or device tree. Remove it.
> 
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

"by any driver" goes against the sense of dt-bindings (i.e. Linux
doesn't have to support it but we agree on bindings anyway), but
the "board may as well not exist" is a very convincing argument

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
