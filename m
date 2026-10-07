Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E5E48F003
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Oct 2026 10:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791369844; cv=none; b=VQ9ramBKaWsec7pAvDZc2TCwMDH4TXr7fv9+KJKEClZ2S5EVo0bv2Lg7Qsx7epBcQSLuT4WVnMGzsVpQg5c6LNA6QCw5DzSfg6qaQsSvGvge+sQYjOOcwJ/KK8m0q++zIOvoX+J1D4gU1yygehn0sHBnXdtYB4hMjQr+1bm9pNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791369844; c=relaxed/simple;
	bh=z30z8EFGdS9MpzWJ/1rGZvI4KgHGfl74E2sgwHNMULc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XWHELQj/3AnPeoeBXYO8fU1bnSXlQ5Etwp3qiBXtSX/Q6x6uFtIgeHFKHCvCMqYd6pShO6/Jutukfx/zWtmiB3FnXVJUz1/TA0qvnFJOLyShzNNgPria9K+YfmI+OIpBfi+rS9tg2LbUI9gC2JlKVTh32z9Mfk+035gbeTfUASw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V51P7SbJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FjB789pn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V51P7SbJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FjB789pn"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jZTP3810946
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Oct 2026 10:43:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IMClJZgZh+h/7kyhDwRKLGWenB/OxKGkOyF/L/dIWco=; b=V51P7SbJLvGvEKbw
	/LzCisXFhxbYm9Y+3SaAhn9KcGJxeCifWXAMpjuLwRDb6y/P5bPtP0H/AUjuqR+W
	sAh1OGdxFTBIPy9n/68Tiujzuj4QhAlew6GKLqpPcVFRe8p58hmEmQM1bYHnk3em
	Na/ZT6tTd0vYr8VlNj9D5oPLnIK26mMo4JdmfUiDopAbyzfrZL57+mNgXetdQVKx
	RzaWO2kQt9YJSEFZ03oYgxCbH3hTvp1HTqXipg2W8dGvJQWj+iu58cDsDBETgYMU
	x3UcoZ7QTAt6lA1xpITe2wzmrXZgfjtep7l2DoisJItY3hx/n7+cvbyJ6ndmRdvx
	s8jzLw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5gvrru1y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 10:43:33 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93bfb2da664so921008885a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 03:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791369813; x=1791974613; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IMClJZgZh+h/7kyhDwRKLGWenB/OxKGkOyF/L/dIWco=;
        b=FjB789pnyHNTqnoZ6X9Lcul3yrmtHClyXztwsGZAww2PlX0LVimgkLqqq0ZUKAGWy0
         r58uilMsnHZVYy1Jet7GAeXTCsm7RDoNc0ashpFOx5sxdUBZZDYkUFNws/RWYl4Q8TgZ
         fZRtG5qlTJOospBG9P/D78KvRQcmB5eYBCDzanlA/UUklqvFuHqUm07kTrQkBYEdpkFc
         n3WgsiPEsHFiYcOurzunWVjDbRnmNtXCBruodciL0/VyqkUb9d7z4PL07QwObJF7ryQU
         PT1Grh0XQWe1+EcQPf4InIXP/ipXXKF/B10DnINJxTbv3SSt5gXZYa0JJh/Z8Y1qJYDh
         P6kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791369813; x=1791974613;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IMClJZgZh+h/7kyhDwRKLGWenB/OxKGkOyF/L/dIWco=;
        b=MSzqkU6dVYwxAYMLjRYn7DzZuejuKi+41yGJQMmNiDqc5y66NkAjgvQG0MbJqv8gd3
         ISm3kUrtMx+INGfDnB9uq2DvDyVNZBOAVPhDqG0RHWncrwUdQeosO8bGs/SHuDXwXm3x
         4NEXBgoQYOxh6KHh4WGyao7F031L4v/PWkvxxt72JS1iX6kWBYS+fWyRynwb7+nKIT/W
         aiNKjH2vCZq+uZgJN/6h2wsOv5LuAmOmHUbOTyH9FEckfPgwBkr3HKPgrLHMrBwgJ+ud
         y/zl+E3sdDeekgOeQDjRZSmXVaTWsnHixwi7TkRX0f1MlmCWZ2no2slabRgDscjvITE6
         B/RA==
X-Forwarded-Encrypted: i=1; AKwUvBzg+/pZ7ykoTeH8efdK0ufs2Rn3Jpt3qVUPilFHFx3WS881kCLDUZlr5+brYp+JrX6jKCyumERnGOhTUXPM@vger.kernel.org
X-Gm-Message-State: AFuF++lTyesIdRo7Rmq6MsKK4q6RL1YNdCCQVCrtctN1F7vhBt9MXBSr
	Z5evp2v8PzgKoZjhUv5S+Krw9GV8p6qVR9/T5rZFOOs+1Vkar5rmi28FBUFnu7oDuQQuhXYTTrR
	d5PSJocjaibpWcI94e8ueCIc9PfS6Wu+Cs8vGNTnovJIJ2HA9haN5/4mhkBUr8uwXRoQD
X-Gm-Gg: AYBFou1XiQCVMWsFtIpECi4gy4oMGN/UhTCvU3XsDhlYHtt4ODHz+oF3TEF3GnWiK43
	/oNT6Qjxme9OZ/Ukm0TJkvIXcruPTREUmynNxOGw2SQd3htjKR+pEbWL7ruOCqzSIvsfxWbssRi
	WW2005M7oJJrwkPTemTS+cq92RYaW5zQEnWPHtoj7FcURcYcduJnF93wMAvey+LlbffEORVqABE
	0X//L/nQ+DolWCoRnFGV3XW6O6HVKvHIshaK1HKepdKE6f6rsuPXMjMzbXswWyMaoetBSQ5IQON
	+HJnGkyF8IF4e3c/qrvKTy4cbJT9MPkuPltcc4Poh+ISC07fWWcMxOzfdSzo38KMFo8cgipiuDx
	0Y6r8ffuqR7WZITut
X-Received: by 2002:a05:620a:1992:b0:93e:9807:9784 with SMTP id af79cd13be357-93e9b8201b3mr318314885a.69.1791369812687;
        Wed, 07 Oct 2026 03:43:32 -0700 (PDT)
X-Received: by 2002:a05:620a:1992:b0:93e:9807:9784 with SMTP id af79cd13be357-93e9b8201b3mr318309785a.69.1791369812011;
        Wed, 07 Oct 2026 03:43:32 -0700 (PDT)
Received: from [10.40.4.23] ([37.168.19.198])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17f4eac2csm72420585e9.0.2026.10.07.03.43.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 03:43:31 -0700 (PDT)
Message-ID: <99cd4231-b186-4db1-a9d7-45926720b16d@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 12:43:26 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v4 1/3] power: reset: pscrr: add kernel panic reason
 tracking
To: Faruque Ansari <faruque.ansari@oss.qualcomm.com>,
        Sebastian Reichel <sre@kernel.org>,
        Wim Van Sebroeck
 <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Benson Leung <bleung@chromium.org>,
        Tzung-Bi Shih <tzungbi@kernel.org>,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        Srinivas Kandagatla <srini@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-watchdog@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        =?UTF-8?Q?S=C3=B8ren_Andersen?=
 <san@skov.dk>,
        Guenter Roeck <groeck@chromium.org>,
        Matti Vaittinen <mazziesaccount@gmail.com>,
        Ahmad Fatoum <a.fatoum@pengutronix.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        avaneesh.dwivedi@oss.qualcomm.com,
        Umang Chheda <umang.chheda@oss.qualcomm.com>
References: <20260805-pscrr-reboot-reason-v4-0-54ef517084cc@oss.qualcomm.com>
 <20260805-pscrr-reboot-reason-v4-1-54ef517084cc@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260805-pscrr-reboot-reason-v4-1-54ef517084cc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=W66txhWk c=1 sm=1 tr=0 ts=6ac62255 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=YKLnzF1Vlz+PFNxJOoRadg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=NAPdFkqvqfqtUqX-_sMA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: HhUxucErh4EoCMRbJ78lAmN8IAjIstBm
X-Proofpoint-GUID: HhUxucErh4EoCMRbJ78lAmN8IAjIstBm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA0MiBTYWx0ZWRfX0HEUXI8ijk14
 zueeMk9WRcRoZhuuJf1y1cQMEhdxsCHuv0sl9m9ajytoeypqkYrBbZbjuFZCCAIMPiIUCVnHCWz
 aMy6aRuHGwFW5GrRJ+NUfecKbNFQYuNZWr8WFfDMHXGNW7ilT6+Z+muRtQv0cR0kVMlKHUqXMRt
 cwAsXNleZzvqyi2DCw7+uldZm6IVvz7WYQR5dgMl+Eoce1Tb/30vtBHlk8TkbcIFLiKXQNks/hI
 W94nq+KGGBZne4lqB0zKsh31TFQfrpF9KWuzFJCascIYUkjECBfSweaY8mWgST0z1kn9ZblXXc4
 vOU+qj/cNytXTU34uokKBuKTnmFCwBfbwFxccWccQjCliZw09K0uEDaWc/N/dP8A59Ai8zyujU0
 2MZXrB0zIDwSeYQOWcuogcoeIAgINbkyKihV2Z7q6wtxkToOgOwCdZP7R9fcH3+nLFlReXl9+OC
 3oA5PwfAjXpDnej3aHw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA0MiBTYWx0ZWRfX0/WOMmNh+c9p
 ULFu8FN9PbjG0+GePaqE+DvcbiQtE5G4wX93syzdVz7EqhSCNXTSvWJNnvY9CmlM+XfF6Arnamp
 8gynwbwXK2jiLdx/sNIkN4reY+texjo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 spamscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070042

On 8/5/26 10:54, Faruque Ansari wrote:
> Kernel panic resets are not recorded in NVMEM, causing subsequent
> boots to report PSCR_UNKNOWN and making post-mortem analysis more
> difficult.
> 
> Register a panic notifier to preserve the shutdown reason across
> panic-triggered resets. Add PSCR_KERNEL_PANIC as a dedicated reset
> reason code and its corresponding reason string to identify kernel
> panic resets on subsequent boots.
> 
> Signed-off-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
> ---
Reviewed-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
