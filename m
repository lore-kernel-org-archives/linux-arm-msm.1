Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793604244;
	b=WJvOIoGgh4HcKBmU99AssKzrJvDfvnMkLvHzieA1cCUwzynnczZvyPi/qtgSlGK8u+4Y
	 a4EFgmbGedjyPecrfeSYEs/e7vBr1KGRBVN24Mx4kkir6dQs3rd5bYVkGA+h52fwsyl1y
	 ZdM9KB893m04JHCoMP55Jevs0LdKkmT8qx2jcY8JbYspV20h0nCecieElySKPvdBOfq5Y
	 sM2+L4AHMJYbN4h6xlogNZklSn6jAHACdFPjKkIiXyrxlqtsKlDd/IeA+HJniIbSgLSH2
	 8jALqSVuIsskTC/GPsAWpCNaXl+xJ8dudRoLpUIUWJgZlxzjTRp8e6feFd6rApN0dRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793604244;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=E1wMT+/ccKcF5sYLZnsI1jaWTQsigD5t+XChwFqJkLg=;
	b=A7GznkrhZhNt811wqNTv0CRS20ElerAVSPLDJYeRL12Bes00hiHpVy5ohV6QPyweA6Ro
	 4osiXDb80a3GfKjvGfPRo07+N6ObygcVEgyFJ3Hn/Vxj5k5MgHYNC+1NZpBag+NIA2RvE
	 ZLcFRuPP6h44l8j7WR/JW+33Ig2axZQI1nOG5vXLl54zV04JmqvbYyt8tdFPwuG98Q3DO
	 nAF2gwhQpGnBRcw5R9uGAWsduV0CnBIndARl2IpS5Cr296TeRLkfE7Qq4c4YLQN1NfQVC
	 UpAchc0APaqqfM44uUP7TM265wA+0OE2FmBPokPAlGsR8G0RbcU4cNiel6+1f5gvhVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nnKj8gyD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iVy1qdG3;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AD07606A32C
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 07:24:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5AD07606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nnKj8gyD;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iVy1qdG3
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A23vEGq3348765
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 07:24:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E1wMT+/ccKcF5sYLZnsI1jaWTQsigD5t+XChwFqJkLg=; b=nnKj8gyDjIMqMZhg
	Zps7qYWTR0bBKOMv6zZJo0Eu396pDcc9Bu08rQNbvKXfShVl08suoOu2ZHNxTyvg
	oDyczpkUwDGPm0rEjTk+QhcCsg9uoOlmEZ6zRu+oAGyKyF4uUeJakt5ExPSbzink
	DR7My4eZjIkfXjkfPh1gLWHJgIqJs17ZG/zrqKwI5z7hlVckbqGkXPnkNFrz2tmG
	7lOThCFqboVfbVZEndjz/xh5RhVIJ3+sd4auujgbJgIuNXLqPwMKQkKda36FuvIj
	EyFRv0vqSumHR8WnnRcPWIWMv2h8QHPZQAKkPcaj+7s3Ae1MTYEvH3z+3HMjf8oC
	/8eTHg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn7wxnqcu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 07:24:03 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ada8bc8575so6080570a91.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Nov 2026 23:24:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793604242; x=1794209042; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E1wMT+/ccKcF5sYLZnsI1jaWTQsigD5t+XChwFqJkLg=;
        b=iVy1qdG3hBQXMFSEdCjUXwwNL2pep8OtxPQOzV60l7gJ2pfyhdI93BR8gkOCGFXLcK
         B8JyXuzCyAYjBctYp48j7Q4/+k0o792wrjdhUcIwJ/BZ4BK09DYrUI2+zkXgOBCsAqef
         7XrjVpCIufqZi+gjYacRD3LGOLEW6DpmUdILgQ6TxzMsdmbbmDO1Rjn+b+w7vEPdu/n6
         3SKFdhdh0EWvYCAVws5cm+rXLRFC3yx399vtjHWy3UUZPPl/kOmtKANAF44ljF10+1UD
         ZZEO2ngx27bHsgv9lYEXAayp4ilYxE9cZFe8U+sRc0UaACfkrsoKJpnmMG20+NoBv8bO
         j6pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793604242; x=1794209042;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E1wMT+/ccKcF5sYLZnsI1jaWTQsigD5t+XChwFqJkLg=;
        b=r1KZ5OPbF0yg4gs0bDFIMZ1qhAnwtHcFF60sD1NPTV18xYW2BDTTc7I0wjdO1YsbtA
         YvQMYggNwaixoji3HW6BfMc7MrgMM505b/e1kX8y56YgYSS+jZpskYqUr++zvAIDgfI3
         e+K/11IIVlBxyt5LXCao3Hfoy4ChO4ROlk8O9kpXHxR/2y8OJKnDy6DhEYjrhv7tjLRt
         Et164hRUK7XawF4oTupEgC7y/+UyUbT1Vw1MNIuLKv4mSy5a1nF9oM9ndEK9Siev4Y0k
         djLVRqE0KtWsn371vOFgW1E7y41/vIcTJo79nvjNLjPlUXMLHwyVz1juYlkZ5/Pg/ysZ
         9xKw==
X-Gm-Message-State: APuU4Z9N4G8hkr1Yj/v9yJCw8C96LGPsn6S+fIi2e+3MyS9fsWaVOkMT
	EJiYuROfVES2wK3sxVBRQdNokUFPtcDDgpwghVYCAtVtjsR9EFa2ROXVeuBtYarRVLkeM6qZ7gz
	gEa0BMWDTZlb3MrpOeMmGAABfkqr9R5F26cdX3yHoWeUT0AYrAvncs1kIZpxloMcDr7c=
X-Gm-Gg: AYBFou09Ka5jrJBLIPNWQqQcwvLDrMEl4nDCoWNAmYVmRHduvW8h2G8Hgm8CJdNVRy+
	27Pn54ktgaiFjKhDgLAF/zj43slmorRlmOPsS2EqPG9YIqXwvk0L+GvBwgTgu99EEDkPhg2U+II
	+fILnIkt4NGkUbkNeVmG20ql0311U8+WS6Z4fKC4CdxKH78LHeKBupZdl1BJwrW2YQ6tEwoy9FG
	af2JZLCMV0Df6a+EHZR7qTKkqCWjA+vOokEP5pxWZYiJ60UOV3IfEiaCPLo1bdXZrEEf4IB8tur
	VKZW9sVJAh7u61/oULv5EOSDVN0emmzA6dujwN6Y1/IEz05BbgyOTseMGBLd/Ti7CUVKMuFe/Fg
	inOuvijb8F3jFLCWh7l6qL/T6glB0Xp3sRO5EcwfIxh604MxJmecWiPVn7aAzphRaUwzkZGKc5C
	2m4Q==
X-Received: by 2002:a17:90b:1f92:b0:3ad:6090:a183 with SMTP id 98e67ed59e1d1-3ae897c8014mr7947707a91.16.1793604242179;
        Sun, 01 Nov 2026 23:24:02 -0800 (PST)
X-Received: by 2002:a17:90b:1f92:b0:3ad:6090:a183 with SMTP id 98e67ed59e1d1-3ae897c8014mr7947678a91.16.1793604241625;
        Sun, 01 Nov 2026 23:24:01 -0800 (PST)
Received: from [10.218.33.235] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3aebc8942e0sm4048361a91.7.2026.11.01.23.23.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 23:24:01 -0800 (PST)
Message-ID: <310fd443-4cbc-4dcc-884f-6cd23d5f9c10@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 12:53:52 +0530
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
Subject: Re: [PATCH v17 0/6] power: reset: Introduce the Power State Change
 Reasons Recording (PSCRR) framework
To: Sebastian Reichel <sre@kernel.org>, Benson Leung <bleung@chromium.org>,
        Tzung-Bi Shih <tzungbi@kernel.org>,
        Guenter Roeck <groeck@chromium.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Matti Vaittinen <mazziesaccount@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
        avaneesh.dwivedi@oss.qualcomm.com,
        Umang Chheda <umang.chheda@oss.qualcomm.com>,
        Ulf Hansson <ulfh@kernel.org>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Bradley Morgan <brads@mainlining.org>,
        kernel test robot <lkp@intel.com>,
        Francesco Valla <francesco@valla.it>
References: <20261019-pscrr-framework-v17-0-69ea6cdf4731@oss.qualcomm.com>
Content-Language: en-US
From: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
In-Reply-To: <20261019-pscrr-framework-v17-0-69ea6cdf4731@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 2tg9BJLyvDMvyoJaUfb8vZafDfG4H0Ml
X-Proofpoint-ORIG-GUID: 2tg9BJLyvDMvyoJaUfb8vZafDfG4H0Ml
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAyOSBTYWx0ZWRfXwUVdFVzQu+xL
 79dPXHUXGi/bnjJubFBCnvwzdjMh2x07PBj3A0phL4FzU/af4VTuoY3k3QFjFg/FQ18Z+P9T3aZ
 hWZfFX2EkVe27JC39YwYWW1IY47jz0U=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAyOSBTYWx0ZWRfX2DKdLp9+8j5K
 OVYrKrXjC7Z8T2Qpj3mk0GGD/JlHsC2zuA+SFi7Ickea3F5e+XzhAu8zVHPwKtRFMhG4JroYqbm
 k5Pn5e1czSQb4FmbPysM4AwuVQ3pTHL5Wq3C9vgGe+83cnXzmGuGJ5h0NkyniNWfWtsHIz1wqEg
 5MG5sZ+4GICi2F+UzD2Rs58bFLLrPFwccjaiE509sB8NfEbDH7oO/CMUddbzpbODhMJPM84Zzqu
 cVapLHQcnaNfZEbBGKZj1twtwI7Vc5T5b9a1Nr9HM75ilr+6tBWR540tpKX9FWlraPyPyGcpftd
 gIlFaIR5hKWL/yVacYFUqArId4RK5Eq8nkmlMS69zImo6SL6EgvJNQyUrtq7sUY6A3U8+dc9hKi
 Ebi6d8xANodLGEHtU3oD1PfQtQmkulJ+NCOmLurWK8TKA7RVtQAmFPXG1EdEUxJ5pPAj1j5BvEr
 dDUV1TB+jeDxbRQaSbA==
X-Authority-Analysis: v=2.4 cv=JLquIMKb c=1 sm=1 tr=0 ts=6ae83a93 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=ftlb9jb6QNwlQdeFhJ8A:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020029

Hi Sebastian,

Gentle ping on this series. I've addressed all the comments 
raised till v16, and there are no outstanding concerns on v17 
from any maintainer --Matti, Daniel, and Bradley have reviewed 
with Reviewed-by tags, and you already gave one on patch 1.

Please let me know your thoughts, or if there's anything you'd 
like me to revise.

Thanks,
Faruque Ansari
