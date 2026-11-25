Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795603825;
	b=2rH6N75yNJhopNZVZITBlJCoKGDqrhikBdfEvaSMsbwBhAY4UNVj0OW/suuRYFQusVBO
	 QCVejn60joqRNMxjXQt9fPwTwg1ASnJV8CopS4e5VSeNz9WPgDDF3VgTb9r30Vz6i163a
	 Mp7ecIUvejvEygza/sMnQ0Ye9L+bmPSL/HxH/sn0QNIQN2bwcmHWO/bhs/K0AGppmLnP0
	 Qt6sxPZgfpfF12KGhZjd43Xrd42vD830oTq1wBoKmkKgG/9SCz7z0e6PN0dsZT9yKv6Yn
	 z0xaAE83fGSRmKxdRX+90KTukH/9w96Ow82GZZN9eR50nqiTXYwJiK69I50nnJMDFlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795603825;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=CotQcIG1WKYFVOKdjhkmak6hbx+ETawh/eMnJKZBCkI=;
	b=Me4yY+4UNXbarVw3ogy45g7qNGXvFUCZZ6VoszPBTuI6IKpFRFghfstxSlUoeUWp8bcS
	 5NK3rL2vCG+K+mEesNsUvDhgyBrRLsgTdwTpUZ3B7Iafz5EiKyuWIYkRumQd/fkXbm94P
	 vElND5HKxFtq5rSyTikvcG1JVbzK1n04S8fd/v1C8jteJHTE66rJkwMx6aMrbJuT74E0c
	 AkgYlriaJiZoyweELQiYzbupBUvxaiAGYluMEbiuJ1L/K9eG3uipkKONF4+7bmcYO2ftS
	 YMbmdpO5H84G6wD1TpunqA9tEyoSvYYbqe2Ev7ibZ5Ivn0l9BG0BuUvpcleYX4j/sOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="JrO+Ag/O";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=No32w+1B;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F36606A326
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 10:50:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03F36606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JrO+Ag/O;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=No32w+1B
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mhSX3642165
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 10:50:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CotQcIG1WKYFVOKdjhkmak6hbx+ETawh/eMnJKZBCkI=; b=JrO+Ag/OwSy7VidX
	92Pk4rprgiR9E8qwi+KeYpVD+V4uTVrN9JteEFpLlUJbIat7Wd3eoTLIAmw4JVix
	DubIzrPjol3HAfgk7h+sKhDxcBu5mypa9OFUlo5AYWlyarSFNoluaV1RiG077jLm
	OBMbPWNaX+43TZaO9/UVaoEZvPTmv5Yu0JpP2AcXS+UDXJ4DJQ+JzMs8wu5z6K14
	czJRIVbjuyrq+9fsGnkiYBIYyrNTyDlP7V0wbogYCUVWLcsugNM962kXIskUf0nM
	5Vx+4tRG5VMjAisEDL4kOP4X3cJ/cAsyPs1rbXBQxV5fYK+/OzrZb567zVW75wKQ
	bYUPFw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5mc2aeu2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 10:50:23 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-55d2d54356fso16936271cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 02:50:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795603823; x=1796208623; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CotQcIG1WKYFVOKdjhkmak6hbx+ETawh/eMnJKZBCkI=;
        b=No32w+1BZ/2eMSNU4GWE6SIzQ8cYHLHMZQu8Tswu73OMyttjwxMgtsJ84NCPQaMwqY
         ZseaKziSd995RB6KsFkqH/rqovbTJhr0W5Xpoj5EGuYNqWsLg+6pmeZY/e9Jcl3WJoF8
         DS8d3CzrM8xEX0dwr8tBCbQp3eh3iRdTB3GajR9q5AAJqwMxIjE0pPIlwv8Yqm9aupbH
         PesA1wRHghAD2PzMJH/rJ9UnxeJhWSgeYTMfbGluxly5gRix9JTXEUEsJj+hlrfJz329
         /65k0LODrnu1G7AGy4qbLIkE1vVuhEtOD8nCY0j2Ydn3VmREK/MYrH9eYkKaa50LerIP
         /Gyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795603823; x=1796208623;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CotQcIG1WKYFVOKdjhkmak6hbx+ETawh/eMnJKZBCkI=;
        b=iZ3kMCkDQsDNhQ7G4xpVFBQMbgKikvTN2K85uJhGznmrQwRp9a/nEkL9A5XJ5PrjsZ
         f0wIeYF2RbGOtwLuWMLpbZogg1lUiNbUaEi4Ab7wlG1zDPn+GnhwnZxAng5nM8WEMKSA
         oNxsnAKY5FoM/63bD8qatYHCuENxi7j0+wx4boGsOP6jDnykYwF2FnaFvV5gMpP6Gqix
         eRD8KAHvMgHJ5+0Fsj1f8qHDf3GGHF1pa7Z/1BykIitQRUvXaRCEn3FkomUElbHCQGJf
         3ga/PdgZ4UMfCktUJnVcAPrsSeM0fVlv5jVssGBNXXLM457ejUb4DfHkJKIFb7i4Q+K3
         /ZXw==
X-Gm-Message-State: APuU4Z9Z6++mmqKYsqvOBOfW9cGjnKJ7KXTvHoC3Uy0YWm2MEMY0gwEq
	U8N0qSLx3EKMlIoZ5VvxqPRlql7nYg2JsE+O3uRcUadNCSHOYHf3NTTF5xaYY1kqvu+aSz+8uop
	U1/cZg2uImORj6K9isgNCnrQVnu7TWnVx4z+cbL4hZDv2iLT8Kl7aFJ0warTH2uK+1Xyj
X-Gm-Gg: AZFdTZfmJVz9KccoLITMKHnGHURS78oWW6YLCN5xAuXFGk7BWyaRa2BTBqujo6c4B58
	/SfViKKj0DXiYXlVNH8OmWT2siftx8UdJG89fKASyn4Ul8gviKe8q+yDuWiXLhCEc28YwCeEKpc
	PpzRv8eyB5svlOvMM+uyr9wdvvOGQo7RKAg75KU9IU3SnMBiV+zPaDWalJGTn81A3fYQN5V7Jqv
	EpH1BZBWl1VoRUV10lMmkWUcUi16/mywOL43Qc8A7VGCzYquF9CnJwFPH0a7FH9xnKVuvti2svN
	AmU+F/J3+sJccTHXfid8g0wa+tmle1LN5KDuLBAIz3nKRwNAdYIDMFOMezPbD2VWiETa/X4WZ/i
	R/QKQitEifK6i10D+Kir8eSkz7WGbg3QgdMBELfPBGKkyJov29muCimSAf3VqEMqmaXiqT80=
X-Received: by 2002:a05:622a:e2d3:10b0:538:40e2:ba55 with SMTP id d75a77b69052e-55d767ae0f0mr292211321cf.0.1795603823185;
        Wed, 25 Nov 2026 02:50:23 -0800 (PST)
X-Received: by 2002:a05:622a:e2d3:10b0:538:40e2:ba55 with SMTP id d75a77b69052e-55d767ae0f0mr292210931cf.0.1795603822710;
        Wed, 25 Nov 2026 02:50:22 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aea31e4sm624414666b.39.2026.11.25.02.50.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 02:50:22 -0800 (PST)
Message-ID: <f4b01bab-8ae2-484e-90aa-915ce5a984ba@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 11:50:19 +0100
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
Subject: Re: [PATCH 03/11] pinctrl: qcom: milos: mark egpio as a GPIO pin
 function
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Sean Parker <sean.parker@viasat.com>,
        Stanislav Zaikin <zstaseg@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Iskren Chernev <me@iskren.info>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261124-qcom-pinctrl-egpio-v1-0-34f2c06b2658@oss.qualcomm.com>
 <20261124-qcom-pinctrl-egpio-v1-3-34f2c06b2658@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261124-qcom-pinctrl-egpio-v1-3-34f2c06b2658@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aPJlOr9m c=1 sm=1 tr=0 ts=6b06bd6f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=DDIdZFHhyExMSTX-0roA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=O8hF6Hzn-FEA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: d2Is0ehz3ON8W6FlusqUuma63_WEqPGj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0MiBTYWx0ZWRfX8UmIva2QH7GL
 MzZYAYM3CzICJ95tGMVoLb94iC4OMZfOIA7t+zAHkwKt0AXtFBuuvGkaANMVkKapeppVI9CIpl0
 nb0LUrtx7M48ZzUiprTdGCrdIaO9gMuwjZoLxFeMSeIYQ7DstLv3M1qg3XkA0ZoZIL+AenURfwd
 vmKo4Wql4dubYPJ5/czDL+QslutiExqQtCF+ENZcK3qTQzxA6zXFBXANLc65bfmtDKzw60VHscM
 zQ2NYFuUSCtyFxFpGmnTZzVMd6e/yoCGvFKQg8OxD12OZqgn3PeZHC4Gt8cnsPli93AIQicl7Jg
 Jm8RAuCljBLcARHQ4ZjzxpYYUoEKbeKHC1C2GxttFPnZueMK5Mq/8+Bjj1fm5U9FqWM0zI8mW90
 TCc24xNR7zVm7t5IK7btDkgtLQ5oSltm1hG7KBjc0iJxvYc4mmvAZOZAlqEaEOUVNtD00vuYvZK
 cmsgqWCyArxsovk/9uw==
X-Proofpoint-ORIG-GUID: d2Is0ehz3ON8W6FlusqUuma63_WEqPGj
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0MiBTYWx0ZWRfX+5vlpQzvY7ss
 PwV6D5asDDdV+LJTIsi9YpZCHW5uVxcYyGy9EWFRw7bXJERJybhl/ZZA9fd6U85QSBMhqErKPhr
 SrphNPdsilulkxm17i9NaRXS/Iw3YOk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611250042

On 11/24/26 3:29 PM, Bartosz Golaszewski wrote:
> Commit 480dc1952404 ("pinctrl: qcom: mark the `gpio` and `egpio` pins
> function as non-strict functions") converted the gpio function in the
> milos driver but missed egpio. With strict pinmux, a pin muxed to egpio
> cannot then be requested as a GPIO.
> 
> Use MSM_GPIO_PIN_FUNCTION() for egpio as well.
> 
> Fixes: 480dc1952404 ("pinctrl: qcom: mark the `gpio` and `egpio` pins function as non-strict functions")
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
