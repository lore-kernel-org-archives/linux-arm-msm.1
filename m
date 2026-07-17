Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DEB735DA53
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 11:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784287826; cv=none; b=u9zcxmWz4sv/QI0siLFoL1jGxKcu+eKaud4mBAgZdVx4f/yDMnnst3497WFKE9NheeFZcnI/oSjDr1aJnKdEFzw5oPJ2Mjr4wz3N8vjizwn63CDM8OrmgZrs1v9TGpIAjxWYmOh08GK+29VSfXON6gKCJgZZsAepAsW/nawlfq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784287826; c=relaxed/simple;
	bh=ctsqA8eW2YgTkr/ZrLNiW+2zgf1ef27dlLiIERHimeE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J3Ru2mbmRGK22f1+iLQB8uuTyV5CIHD8Epon7gWSOji3DlElvJegynFfwrd83aIK46bRVp7/9Ozepmgo+BYVuZaX6tNph0Hx3od3xYv57jooCd0riLw0gXLrZPw5epdvuvLYsfR0Ma2vZZfsNyDQNL/pxeL5zYjB0nZW2mHpqi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RfM0zDci; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MiYGBYRY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RfM0zDci";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MiYGBYRY"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HASsBT1191432
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 11:30:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zr9ahte4gVexpnMGm8Z28hPfzVF+lobJDJhET4dQ4Bw=; b=RfM0zDci2hpk45J9
	/lmwj59IZ+OVyCnkHZnTUoB5jCtjDfnJkpLgQopZ6HpbxFkdInxHWvOOgJUeR8on
	wTVwJmWW6wdRW1HiEGJaSKdgONwv4fSFyDMp/VP6Q1XnwVg2CJ8thON5ad/WEeFn
	DFbD4/L91Bg7SgVI2L9lwmO8N3FFpbVFnIYjzxn9ArXU4H8ffxruUq2coy4I5g1H
	6A8f2Xywn4/OtPQV4/aDkrHpvpHPvtnblFtBOFQePlynJqrvs8Q8po3kgBUWyaVC
	SJeyszAxdtoacbPDMjRebhjFDuuzve9h30IIjzE1ybfvbcnysNRlrtkloyfHvhOt
	YgjClQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffj78r9w3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 11:30:24 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c15c77619so19142021cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 04:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784287824; x=1784892624; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zr9ahte4gVexpnMGm8Z28hPfzVF+lobJDJhET4dQ4Bw=;
        b=MiYGBYRYfB+kBr+eqnfsMVkB0UdifZZE9aoI7OLyo/NbpkVFlpbNv6dCaqiCQXBbd3
         q/KIEiT635d4kqDCUXZtpWVDk3ihs1zr3aQyPacsxf2N9WwuYlCXCOg0dX8XxJRtsXgb
         zxmz+a8y4EsCQc2+fpN7Y+iK67nKkoPTa7zrGPpKs0377RV1XpFV0SvuOV/mlfPVKFDg
         iko7cq6xD6CN0ofd7DpFutWkr0A64gIGneWlZfO9lqwVpLkG8enxGih0HcRf0R53BsRV
         /YZpbEBsmKG9m5XBbr4QVqGwZSqmYggzBUyZSUdaOZqGK2uSa6ZfiOxUwTEo38mDJaiL
         sS/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784287824; x=1784892624;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zr9ahte4gVexpnMGm8Z28hPfzVF+lobJDJhET4dQ4Bw=;
        b=tMY5WFG5QZEJOI+yRTHPhAEoKkSOTcWiqIyMZ9gaPMNEOojHBzkLs8BwAhzNKT1OdW
         1FB0k4/c6o+Rgdz7ko7UY2w9uSAY7QXTVHEs1M7QdBK27dRWnRUHWcO2FhoS4tYFA5k4
         QFolrfxKurtnQY+BUgFdWdgO+5cPLTgPriTp4VG/wvNqdCZwt2zdNXEIR+TZtfSS161S
         tc1hyUrfn0t7Xc1jaZdyvRHa9n6RrIPTisSiAwnvbhVCyMuyGoxy+MWsySJ1p/DPuBuM
         uZldLRgTFkpWGDKXRC8a0YCG2YymK5eQf2wekr8m/XgVU/8Vi4zrxOiPZgYQgmtrf16S
         0c3Q==
X-Forwarded-Encrypted: i=1; AHgh+RqJgjDQM4AqE9d3r9vkcV2SEYUst2II/JVRhclbCgsFCwq4wIADvYLhRveMcY1kt50JeDWo4K5khc+AY+2I@vger.kernel.org
X-Gm-Message-State: AOJu0Yxj03KuFLFJtcKeMX6t/jWhuH2q10c4Ir5G7xpNI9iMh5GXtgtL
	tx1kp4ixEOjTi4Om4yqgvPqkg6q2nTJzmXIxhZeAT9TIQ7hPS4UfBa/0PR3cCHLu439Q7Cw65v9
	E50qUGio9r4ehI2t4oDliHbc4HZXuhOE8kTAnkaPyUeZSI/rd/R2wPlSQo7zU/nV45nuQ
X-Gm-Gg: AfdE7ck9HWCewEJfQu2oer445Lv+QqwI0GTxuM0wSiRcno54yBlHBIesDMk0AcbvqcL
	3LhqWQ+CAYVY1vE8BP7yRHWF5XuBsgM+VcbvZHRj6PkpMV9DzMGJHDdosO5THpCascZ86DWPqBo
	Vhf+zaer5HzKvEfpLdoJhySGIZKZPKCdUU2VlgCjtNhplrOGIvRRXfk4Ik6dx1Hlyz1lk1ZyIoQ
	m4AGCfFyZE/fzg1iC3lsoReBqxWwfeDTH9yHZHnnZ4mDZMDfm7VHCXeQNlkpPpHY7JsoG97DzUy
	JzdKqyqtDNLrPmoMM6JDsdixEn2yXU94Wpc1eMRfc3HhaZsGWe78Z1sQfzV4aNQouWzjDV1t0vP
	lSiRy/d50kChzm9Wqo7V/meoI
X-Received: by 2002:a05:622a:11c5:b0:51c:1744:edf0 with SMTP id d75a77b69052e-5214034ea39mr14545961cf.9.1784287823484;
        Fri, 17 Jul 2026 04:30:23 -0700 (PDT)
X-Received: by 2002:a05:622a:11c5:b0:51c:1744:edf0 with SMTP id d75a77b69052e-5214034ea39mr14545191cf.9.1784287822904;
        Fri, 17 Jul 2026 04:30:22 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1735f20279sm58707166b.53.2026.07.17.04.30.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2026 04:30:22 -0700 (PDT)
Message-ID: <43944722-3eeb-4e02-b3a6-6251d5fc78af@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 13:30:20 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] arm64: dts: qcom: qcs6490-rubikpi3: Add audio
 support
To: Hongyang Zhao <hongyang.zhao@thundersoft.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Daniel Drake <drake@endlessm.com>,
        Katsuhiro Suzuki <katsuhiro@katsuster.net>,
        Matteo Martelli <matteomartelli3@gmail.com>,
        Binbin Zhou <zhoubinbin@loongson.cn>,
        Srinivas Kandagatla
 <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Roger Shimizu <rosh@debian.org>, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260715-rubikpi-next-20260605-v2-0-67601d7a8581@thundersoft.com>
 <20260715-rubikpi-next-20260605-v2-6-67601d7a8581@thundersoft.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260715-rubikpi-next-20260605-v2-6-67601d7a8581@thundersoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDExNiBTYWx0ZWRfXweUglE1iIvIi
 eVMzU6JarAd3HRxBnq+Ra9Vbn4B0pK3rdIJJF1i7rTccmtxbafC2A+3W5167Oc6Fa3SSHNrQyg7
 F/VlnPJosJXlMTdzV19yo6xXdyfteM984ynYfsHf4o4sndnmkasuesXiOMWT5jg203CPKxoEZu+
 FXmAQ0EVChSc/WDD4CNHQ37r9bxwzDN/I4OlFES6eVzy2ihhpYxS+PdOMYwsAmDwDQVA5ZrHwmn
 XePDbIRxaUvDvuexXXvrWRBLf0ViBRKDPyYRLW8AGxUVQTZvKPy/nSNqdmb9Re5dDT84eXX+3k1
 xTUDNmOVlzlNbtI9R6IR0PxI6sN4xZKZ/+DoRvecCThrbAJa//TwQZ3Oc8UZO+FiPHkRRMmBYKW
 spRSTCKjElZW5ZBBHqjGxbUcrhXxyS7aLe51B+rS0B9XEKK0msBfYSENvGDjeFvchWxOVNCv1K5
 GWhYR/dNarOsCMZS0mw==
X-Proofpoint-ORIG-GUID: ffpm_U-VKc5bDrzw_-TPoEGl0z6sU3N8
X-Authority-Analysis: v=2.4 cv=U9Ciy+ru c=1 sm=1 tr=0 ts=6a5a1250 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=-lbNPa_U-NigBoBspYsA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: ffpm_U-VKc5bDrzw_-TPoEGl0z6sU3N8
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDExNiBTYWx0ZWRfX1Uf4mYfXJV5Y
 zc9HiLmaqIRdNyQEx/0m+8WhYHWjAek2ofiW2SGczYUJ6VL2lesXqKFY7hd3ID04zVTv7lYlOdy
 pj3zVxMtftqpGOCnJU+lIJnHrJSbF2E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_03,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170116

On 7/15/26 4:02 PM, Hongyang Zhao wrote:
> RubikPi 3 uses the AudioReach firmware path for its external audio
> interfaces. The primary MI2S interface connects to an ES8316 codec for
> headset playback and capture, while the quaternary MI2S interface feeds
> the LT9611 HDMI bridge.

[...]

> +	vreg_es8316_3v3: regulator-es8316-3v3 {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "vreg_es8316_3v3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +
> +		gpio = <&tlmm 117 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 = <&es8316_power_on>;
> +		pinctrl-names = "default";
> +
> +		regulator-always-on;
> +		regulator-boot-on;

Does it need to be always-on? Is it really on at boot time?

[...]

> +	mi2s-playback-dai-link {

mi2s-'c'apture < mi2s-'p'layback

Konrad
