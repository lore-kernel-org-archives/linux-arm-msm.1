Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 309DB35C698
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 12:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792065748; cv=none; b=os5FBHSpd49sYLK8uPKoLRM4xIait+ZE11i/4YDm9Ghcp3+Unm/P4p2dzr8JPx6LegF5WfuyoBpfYjA1nEaGxAmPsfU4TtlXRxmWtimJ9rne3y7G8RnwtdM7/iW3aXpnX24vtiqNlw5oLAewUxhYKrrEAyYO+udkHvsVPIq47Xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792065748; c=relaxed/simple;
	bh=RW90kX5UXhPbMuU773cswcseDtRVTNo/H9SZj3A2zhk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DETNBp6uVtgkwDEcXWeZloZUMe3EEKrXbqR9VohhyG1PImb6hdqAnlDyIbUfYlXVYyv/dWZH0KE1rWJymRF97mXvuiwsowFsniuv7zjl8M5sPd+ofgjq9VsncWlvF11pL9VwEXwGajUcLfH9kaI/prTF2a5Ubxto2g0Qkx33IcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RO1T7zJE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N1JMR2qn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RO1T7zJE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N1JMR2qn"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jOph2114165
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 12:02:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u5tUO2j5Cw5lTw813p08QZcgp9r68LXyMwBdh7jIMAE=; b=RO1T7zJENzrvXhIg
	kZIGA6hBp107Y2ZD3YxOskODR/SK3vv+O9N6rpbOmPOi7uy9zaIJ0ZMmgTjwMph6
	J/ci8p92bafH3WGxWJ/LRCBtHIreig7rai0GT/rHF23Udy61e2jw85RzTIJZjbcj
	coanBk27K8kCtxLczcKA8P2N1f09oUNEkXkQu/9jmbdWI8X5zCrE3V5E0l+mHo4f
	A/Upnd6GnOZSvbHwyfbASbpgavZJPAxsPqsU1whYHPt5Dj1j+BWO1WtpZLKzbcwO
	E+fcG5f8TkPBbk2qKREDZrRr6mx5ly69jXfDt2tWYcQ1ZHCzRgPB+rd9yt6zXR06
	BntBWA==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hajmyawuc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 12:02:26 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c97957d83bso184488e0c.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 05:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792065745; x=1792670545; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u5tUO2j5Cw5lTw813p08QZcgp9r68LXyMwBdh7jIMAE=;
        b=N1JMR2qnowEnv+rxWDq0DjRPJjgOKDcoE7vucAHQFf+i3h5oy8wHVUtVVlsvTv2Wne
         vOcHk12P9sBtbBTOGSskLFKz6oXjbDYk4wraIQX9xm5H2Oo+0qJHoA0EowtEWAnk1Y9+
         oeAgZ2KHH4nBfWOt/3VZhiFLKdUlhve6pAuVCOAaEns7MYkiADySQHJ5GPO1uFYqhOWK
         PqAgsIhgE24fVzLLQ22kKy0AnsEef+2jqQ2UPcsB9xQ5zF9wSFn12F4IUDd8zEmn5JFF
         tnfV1lstjHbsT5i6hC8Qk3Ov8LEHgRgepsShPpb3m1juZ66haJ6W5hI2/KX8fV4+71+1
         6TWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792065745; x=1792670545;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u5tUO2j5Cw5lTw813p08QZcgp9r68LXyMwBdh7jIMAE=;
        b=sXDQk/5Kb/HigwPKy4ImlB2lcEdJzEb/N3ymzNnvwjGW+36dAcBciSi2JPOglKne5Z
         KFbWW5ABt27N4yJq+aOSvIPV5u93ukPKmdC6O0TUu/+OBt+XMTqEQ1EifZPGx97eJNXi
         VtC2HrCtqJttyre/2GcVAKTjBeD/vkZtdlqV+p3BuJumAk3TB/5AD4G5mqtTsmfnNw/k
         yLCg6IJWwLM29aXfF7Q7XeX+htPR96IL/qtjxSL5KY88Hf0AYBvZzt3vbM1P2feXfm8p
         jfwjuiHUHJ3epn2A7fDAGW6rdfj9ovzDWhDMiF7t9Jt2JVCboPHBw0IwEZkElX7kjFdy
         /SNQ==
X-Gm-Message-State: AFq9FYKr3ymhIGFj1d2K/gVJsPS3eHIJ7LAC81C15VebazzpSqo79sxA
	TNypMDabDWW5aA5UnJ09Tu+unMN50xOUOMy6la7liN7DuNnlX0POk8Km9hBhk/BB0T3R7xUFg26
	S+ZASFSioWGcXmg2SL++cp6PswtWEfAYyFoXuUkNZF6m4qDcmvQO7NfnC0YQ0O+eSJGd9
X-Gm-Gg: AYBFou3EHSOQx666bijDaO1BzgP7R4fmNKidsBkqT2X8fA/9GJoZS06MkZx2uUedEdE
	bFA8pG8KieOKbdHY+E49pUtUaPqjm/fQO7JYjNBwmHTNyMv8TKB/IGQ5QPBViDdzhFVgLBGCGK6
	QEgJTt5YHmI438LMjF99GujFLP6+BXbd7elGUorxttLNxuy7u6mwcBHzMA3N5k8cxxqUHy7bN6u
	uitCR3lTQjZmnNL8eAJoZyMhIlmoV4wBy7cA1JJqjTM6uGNPClJNMorj42YX4UvfSoGQpu3it7t
	mZLsasmtINn4aHtIyPFknbTA3mmDN5dtrnlPWiyr/5oii4cYvlLmkM6VjLz4bE/bZ3rEcHeZvxk
	yJVIl6ayM9/Xryge83JTC5w==
X-Received: by 2002:a05:6122:a5c8:10b0:5c9:ac9f:b7f8 with SMTP id 71dfb90a1353d-5e91ef9f2b5mr2905830e0c.0.1792065733216;
        Thu, 15 Oct 2026 05:02:13 -0700 (PDT)
X-Received: by 2002:a05:6122:a5c8:10b0:5c9:ac9f:b7f8 with SMTP id 71dfb90a1353d-5e91ef9f2b5mr2905083e0c.0.1792065723319;
        Thu, 15 Oct 2026 05:02:03 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3eda6276a5sm114642166b.71.2026.10.15.05.01.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 05:02:01 -0700 (PDT)
Message-ID: <8cbbdd41-f3aa-413f-a520-749abb8543ee@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 14:01:58 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] mfd: qcom-pm8008: Drop GPIO support
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Oleg Keri <okerixx@gmail.com>
References: <20261014-pm8010_i2c_support-v2-0-b395d2b3f668@oss.qualcomm.com>
 <20261014-pm8010_i2c_support-v2-4-b395d2b3f668@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261014-pm8010_i2c_support-v2-4-b395d2b3f668@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: fRtQzeco9WT6vzhp5P9jLyI5paAKxVD8
X-Proofpoint-ORIG-GUID: fRtQzeco9WT6vzhp5P9jLyI5paAKxVD8
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0NyBTYWx0ZWRfX8Nf1SFWRNCbl
 aFRveSu35BRQ1tNPI7KQntPSzpclBF8H3vK/fUX3mIbbCBCX773DGQAnhoFL92oFpWz/QyF61bD
 DiKMKgwza6wOzYROuV11etuVQYNMbHs=
X-Authority-Analysis: v=2.4 cv=TbQDJhQh c=1 sm=1 tr=0 ts=6ad0c0d2 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=ZWiXTBPgYML2d7b_3NEA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0NyBTYWx0ZWRfX/lVu+jRhIzaJ
 +2XqTOkYuwVgN6/IOAQ79zBkCO0seT3KaZ54EkLB06/cS3otSIupCczBecNgJ6GxzPgqjK3cvGV
 V5nAiPbAnm43UqZCMTtPfNKlu82+YITix7iAzi7GEy8SEBUbq/p7C8MkDu7hp4iDZRRUt7GM9RF
 8ocbyiCOT1ZpqfRnXt+UNuozy1ySChNsAT44T1Zxzq0GIT5L8IOgnDUTEG19VG0iT1/PQjpD590
 0boyW217upYSpdsNbqSwYn1Bniha67qxn6iX4/HtJiWnPLYw440XW+0VwuakFnt1utpXjRYuszz
 Rbpkz7ojQ12CXKFHCzOQuzXdLLMG//Vsv2OL0c02b0+yX/ENYRYMCYDW8TszezXf1Sz+kkIrehS
 PWMf39HYmp2Yc183vCwMBFm/2bV3OI641864vRnnx6bAimbG3QUbqMcVMeSk3xiRtmu13VTNzKr
 5IdqrCK25MdOcWnGVwA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150047

On 10/14/26 12:32 PM, Jishnu Prakash wrote:
> GPIOs used on PM8008 and also the upcoming PM8010 have fixed
> functions (reset and interrupt input functionality) so it is
> not useful to expose them for general-purpose usage. Drop the
> GPIO MFD cell and associated peripheral definitions.
> 
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
