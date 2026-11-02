Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793620488;
	b=FnRT2ykrIXI/Fp5lnBqRBajJabuWpMdtyWxJmM9lY8LoVNWpGtj4Kmjy8DhpJiIvsY9j
	 GdoDXg3FO8BgWmxlQ1U2r/PGQQkNvd9JyF1PTUIfL2BRbomaF4q7H37XIpaVGcRFpj9Df
	 YXrHa/IWIAhhqcZMmNWnt8tnXcJfg5AaSaAs7IfCpogWMThwPwhmWBsy0UUgy6eA1ffcy
	 KBZoie6XqbDH6ug94iAMnUPt9wgor3+yUxhZA5aVGxZgELrgkZ4ucly7+QOsaiHU77ndk
	 T8yYVv0BGKO2aAU0bu58uNN2YxD0aXBhoGU2i+SfqiJaG9s2tQayv85EEkYuyj/A26w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793620488;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4N3t4eDhampYwv7B5sS3V2bq9ATvW0NO8kdCR9rWbEw=;
	b=c1jdpw5jpqL8zbBICxMvC90sq0GzsXCXUTz60k85VZpSP5AB07i+lIbK0SK1st4+HilC
	 3j3DqA7zl/pZtI/43XVs4OzKDF5zw8SLx6+bz/WptTJslRp+4EEUc29tSh9IYm/mQuuyb
	 RwmjD+7vTCo61JeI4LIjeZR1trdYdCJ6FD3CG3NdIlIqn0dgbDRjql45YJqI44C+K4QoB
	 /FBBrKOadt+diu9aYZN/VSsnqUrCDoK56WiqgsbAnHYXw3ReMMWxZcNvyscRPXRuhCoI5
	 +TVlir4OqXVq8ltS35R78LU/viiV18axyCCwZdxyj997o+L7MiBgdi+e2x1sXTMyvaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W3bRWMVp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bvXxk9GF;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A09606A327
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 11:54:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09A09606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W3bRWMVp;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bvXxk9GF
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2B4KQ72616160
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 11:54:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4N3t4eDhampYwv7B5sS3V2bq9ATvW0NO8kdCR9rWbEw=; b=W3bRWMVp+/iuWIhT
	sG5pY52IZ0yJhEEwBCO3o58i+kUz6HxjW6gnDjz46lg2cugQrJYe5qscPdrX6EIS
	YrZpp/i6i7HBfQnTFWQ4W/E4jTADjVoFS+Wrg6wi69EW17zJyOHDWoxW3z6dvf8m
	lml2+4uKy6RAxwyqR9d+/bLQJT8jFILSfoLSEmoOEXTHZE+PJqeL9zQ/ebfnimxi
	aSGtaEqTw5sSHuyGauhyf8bF5FzdiBdCih7NaDv2BVhk5GAkrm9p+rINg75P7iBU
	XfOF1BrjKZLOxQzzkr6CBjg1exXSJihqsrerrVSv77114bLe32Eew22pBxI1hRoA
	5e9uEg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpsavg5ef-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 11:54:46 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5356c6d98cbso4523831cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 03:54:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793620481; x=1794225281; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4N3t4eDhampYwv7B5sS3V2bq9ATvW0NO8kdCR9rWbEw=;
        b=bvXxk9GFNgA8D9vTd72Lkv0tK8aDlBHRk4bFfnGmhcC0fhzWlEY2Zifhw5mSZDVK28
         lmCouDcCxUPMj73En76TO2SU4y+rkvMpPNiQDGsAOruUQVM0eHjFOvd5dNw7QiTvGnoi
         tHLCuSHgoPYHv/dIOwADilIn1e05mvTa1+CasI2559DCWChRbDMSZuNhM110nmYW9D4g
         guVtek/6To3XJuJPnecaOP7QMYe4ddZt5E15m8LJyYa4qRiuVr9Oe23znTh1gccv/jM+
         9ozBqefKGT4+/tg8tD+pxA70rZv/GLbBLqeADk7mU69z8eKWv7B+QNnV9c4BcE6kcmXs
         zilw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793620481; x=1794225281;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4N3t4eDhampYwv7B5sS3V2bq9ATvW0NO8kdCR9rWbEw=;
        b=wTNamLqQ95FFdp4N7YAWrYyQau1ZUGfQmZhyxOToeOGWLD8RyyCEbzpok3NTDCfUt5
         RH6FrUWYzmSpjNURy3SrCxKWSTRtMHSoN+vN+xh8eVRlGzpySDIshRlbiQGddO7Cxris
         uFF1NU+ZeIanF8hUZqn4OATAgA7Ac4MRIFA9nvQjOoFSrrIY5Yh5390NLtP5YtbFU146
         E+6WsWAYEy/iCcXKveuVJ1AVyGweAfh3LiH3A1nj/y3SjYHfzoBOd/aAEBLYEAQkGN1L
         PWsQiNGhElUCfZ96qATTg8I9EDxAqsks7WQrSZIwqWCgVaAToM/CIfRyl8Q+aJUlJzWo
         Qi4w==
X-Forwarded-Encrypted: i=1; AKwUvBwWPNeje9bLsz33fdBJFXXreZd4ED+Q7mAgtuTipGdCFHRwpgNpMBENgR28H04Uaqv3HaAITguApTm0mhEe@vger.kernel.org
X-Gm-Message-State: AFq9FYI1sxaAueVTl3H09kSVnSzhzks6jzrr1oknsKmddE9f22m5kcn8
	ucwarvh13wvlX06/Uif8WWDvqib2/SGnY1yroYolFeTBJUhZxruaBi3EfGsHc0QrkHXKT0BKVLe
	NVUxK6a0mPrUJcGfiHkR0aW5+LeoTNFc+wec4M16InH4p8/bgp1+euokLfwgb/k7xB8Wg
X-Gm-Gg: AYBFou1oHL1WlTjGqYnlfGYJfr1Zhq2q7y2RoKzvGRBTmmAjF647RmKxZ5591SvFmAm
	jD7haPjioXpD61xNsQfJpjI+jn/4VgWDn1DYU2s7IiTjJcl3vbIGdszMVH+D8dzDHOwUYicYPb6
	CQD/Cti3V5a5PdtVlbXj6xNQkYmYRgD88CqNWV1ewPg1NIMp+gc3HJa2K+Qy3MNHrXkkwXARkDa
	kEkObUxycMZg9avl15sP8uSiGj5D9R23iuRwMJEwhJ4BcI0UKJJukT0f4OKb204jxC8krGEgE23
	4WSzHReUjJaw2dD2c4BFv0U3/iKeWD0/5kcFg93a+SwXeWLG5DvufZGquvvEJkxp7sHBhaMn6XF
	FPz+AbusRznMNoyev38q7cVAfljayHICxIdKYTX/KUomiKlPGPf2VxJLFlUnnS/dvYdHj8y4=
X-Received: by 2002:a05:620a:6f9a:20b0:939:9205:4d78 with SMTP id af79cd13be357-94421654ce0mr1515922385a.3.1793620480888;
        Mon, 02 Nov 2026 03:54:40 -0800 (PST)
X-Received: by 2002:a05:620a:6f9a:20b0:939:9205:4d78 with SMTP id af79cd13be357-94421654ce0mr1515920885a.3.1793620480494;
        Mon, 02 Nov 2026 03:54:40 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabe10133sm376949166b.46.2026.11.02.03.54.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 03:54:39 -0800 (PST)
Message-ID: <34479df5-3f4f-485e-8204-3744a09ce08d@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 12:54:37 +0100
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
Subject: Re: [PATCH RFC] arm64: dts: qcom: nord: add ADC-TM thermistor
 channels for Nord PMICs
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>
References: <20261028150103.520428-1-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261028150103.520428-1-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0NyBTYWx0ZWRfX3pFr6UGG8fpE
 fqi1/SOlsTvTq1tCRdM1RlRQxwq+SHeYLjXMjGulZ0lkzeklHCNtFX+i4XsrqHCnjrI2nrPiqFx
 oeRwN04U+aI4eLlfCYuaqaMhUjWPnaIaWELHUr37TJJaJpUM+v+ruIfyEipFZ6/pe2pr2Ur/HhF
 F0xPyyIy5g9g9DmQqXWWA3qNhzb3yyGq5RTBaI4IAw45c7VCI6k9A06MyfsVhDES8HINhT6jxjG
 cdeIx1mAlrQOWsuMN0NCqRYqWo3/l9UPREgt1BR1gHkrnRShvGFBQfiHvCxkSmkqzUpe1fP1Dvd
 d2yN2jbL60sIOWfNTHD/XsUoRZ068RZ7PBiSiNrH9IfTz/O4ZGHGvKdBLLeed6jYvdNNUulhIeo
 CD7qd1pPi8k9n7wKHcvkTIWfVmwO/bcncbSPd+OnTgDU1+4MtgSaIAi/ODHaKdwjHJGXCcugX1h
 vQ4v/5maThI+8Pe02lg==
X-Proofpoint-GUID: qJ34NxmpMH37nlk0uglk6YWpRyWBv0hm
X-Authority-Analysis: v=2.4 cv=FZmiV5+6 c=1 sm=1 tr=0 ts=6ae87a06 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=dR0caxw8Kkv1fo8ERtEA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0NyBTYWx0ZWRfX4kEzBqntSGZn
 n56AA7hedA+3x8DqStHQR8JKcsrJ6H9e1oBHieLLKHnH4LplX/FxjzhY4E+hhKMWXEE/1J/Wp7z
 5gQ49GMAShGJ011y22MI7KIMtMUFsWA=
X-Proofpoint-ORIG-GUID: qJ34NxmpMH37nlk0uglk6YWpRyWBv0hm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0
 malwarescore=0 spamscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020047

On 10/28/26 4:01 PM, Shawn Guo wrote:
> From: Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>
> 
> PMAU0102 (Kai_MV) and PMM8650AU's Kobra_MM ADC5 Gen3 controllers only
> expose REF_GND/1P25VREF/DIE_TEMP calibration channels; none of their
> AMUX thermistor pins are wired up, so none of the board thermistor
> rails feed the thermal framework.
> 
> Only 3 AMUX pins are actually wired to thermistors on Nord, all on
> Kai and none on Kobra: Kai instance E's AMUX1 (SDRAM3 THERM) and Kai
> instance I's AMUX1/AMUX2 (SDRAM1 THERM, UFS THERM). Kai's other AMUX
> pins are either DO_NOT_USE or wired to voltage-rail monitors, not
> thermistors, so add only these 3 channels.

These thermistors seem to concern board-side thermistors, not
channels coming straight from the PMIC, so these additional
thermistors belong in the board DT

Konrad
