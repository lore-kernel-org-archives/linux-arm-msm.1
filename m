Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795603838;
	b=DzZIdmDcY+mnALuC9TS01M0J35SNfV03D8/98vdUUQi6uoPsom4b+4QX+Q0QlvZlzGYt
	 0E4VWA2kTpTGwe87tujhR9RZ25l/gkTK3RxsV9F28HGZrs5qHZkk1YFDLbnxmN6v56J3C
	 5H9275v4JbnVnO4Yj4kyYMr+ke6yEc6FLm00Ifaay1SvZyN6CTeCPQ80jdPitzvHvDxQ4
	 RZ9SE8JnoIoGJDtV/NZ+/n6gZNVKG6pRX4H8x9N/je8a7V3oQryWqL8BpfZAxeZ5UZR8b
	 5b7tp7iN+fK4w20olJPqfIexO1qQ0Izc9s7Imxfr3bbcdh3p522TQdSbis/5fDUX7Eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795603838;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=UvouIqI63TSn1C4q0DezWEvkmJNltGoCbWvIDB5fyEs=;
	b=C4SybWH6MWj0uJ21lsgVJSMFM3QiyZUOf7VGr0EEQyEOXBd6V/UDq0YZ1xfpxCk9Ts3m
	 6Dpxk8+5P8xuUzVu2jrEU2s8GBcyEoxqO8CjuNc+xvHU5GfbSKUXSOXZE9h2AdP/FnVa0
	 /RwfAkrG1WWluBglSQnWMKvpi2CaK79aRHBrJ9KvlvqRN7Odwm0s+6ITLPsr6QPRS2Cnf
	 1/svrWJpEhosJCkaswfCSA5eCjVjqQetzjihZaWjE4yagiXqh4oPyD6vlMZR6K8FydLxE
	 jakA232iW9a7a7Qh9Lsb4xRwHOurKsQXj0csbiUTyrB5jBvdrYHOhAmxXqfeV3Sh6iA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TleGhjP9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=adri+XPa;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA8D606A323
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 10:50:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAA8D606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TleGhjP9;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=adri+XPa
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mh2G3642160
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 10:50:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UvouIqI63TSn1C4q0DezWEvkmJNltGoCbWvIDB5fyEs=; b=TleGhjP90vAJirP1
	uRWTJF5wFA/lIJlTCjId0A1sxByTdk1IgbbIx78cD8acha/op/5lohbRM8uKTlli
	o7jVVhkkt7pxpNf3Xasjb+aqLsyGZnqz3npkOaBE+cQrpWWScD+Tqh9DQIRcaN6R
	fIgVAYkl51dEHr2YUgREojZ7FZ9Cz6SIPY6beMDvTuaCKVFlsih74P/m/FXasJyl
	ZoCXDoCoX3EUm3x2TL9M7MMPzjUuxaySsDDdLlW0LJ66gjXnQpSqbAu4C5cRtygw
	uq2g1BxGdjFr3b2x4ogetoIvDYZOzxyfzCWd+FtCMB8iRD688BYaaJO162v8Uag3
	ZbXnLA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5mc2aevg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 10:50:36 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-949d87937d8so29767785a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 02:50:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795603836; x=1796208636; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UvouIqI63TSn1C4q0DezWEvkmJNltGoCbWvIDB5fyEs=;
        b=adri+XPa7Snh7QJ0HVyWCvU4eP/G2C+eLAsAqFPeDoZ/LDTygwnFtTxCz51FZWcEL0
         S4MevqwM4o5yO3zE0g+gun8yBxpzcijQmR9GInPjEldMfKqORAHniO9lq/TSV2xiz8jt
         nmHw6drjFHQZyIWnl4ofpoj2h+aIqrEQJ7c5KORwLtZ0mXGmtWwPEJmIlNFBwCE+e0fR
         56hmdL7vBmUpm7UP+0wcjamFTXGjmmlW0A5wZdemPMcXccU20kqDQnif1Yw66lfn6HH1
         tx/a6tJvSq7PyaAJxQp6KyuWRv2fFFjxHrQuIMEMtnlTHkulLq6nJU8tVviKz2IGs3Mv
         sSOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795603836; x=1796208636;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UvouIqI63TSn1C4q0DezWEvkmJNltGoCbWvIDB5fyEs=;
        b=mZ9MZ86uVPAasmTJvS8VRl53pdbjlSfsACmXyTUmwuPmf1UyLFctFpiLgKlpPaW6yD
         IRimAP6Awj5YEoishev8D2iIgGCV/Ysq6e01O+FQDAfJmkp2pqnTvDqL7EsvRLlFI5Gi
         Q0+aH73ojrtRsvIc2i/c5K6sA/XT0FBAalluuEfzLcH8vGnkSdQmBYBgM2bVUmSlDoM6
         70im9bnP3GzIxwkL4aTdjAJairy/OMcyvFikMmIGnv0OVKiXl+xKlKWZSUSpNKqdPS/l
         uqMDLW7fqojS6Ok2y3hwccVt7KId/wwMr0p4Bazvcup/U7ZCCRS22ZBp90XC1LkWlBvT
         EgvA==
X-Gm-Message-State: APuU4Z935NUJDMF7kGBsjc6tqOwRHrrSfyja5oPK9YHiVaC1fZcks+iY
	wPRx2ZDZzchU2BmYNmZfYwqxMzqWcTYHT6PJyfVpo2QqRfNEyPrLi5ZHRmFiHbwp0fWqv2jG39h
	939r88jI3eG9cSpFNi65BddbnMiQGo+vl0B65nKkII79oCeQzntXLyLtO3S3GmWDybiXZ
X-Gm-Gg: AZFdTZcEOQPTmqnIvy8Rki7EbzXTCu5Wa5i3P2sD1/QZtebY5JxFoq5HoKqoRo8u5Dl
	rgq9tLu/JWIfbXKW6jqIUWOJfogHxIwHZKfzGHWAFLwXBZP6N/b3QbjUQxYI6vBUGwQX08bQ1pO
	k7pKvN41IWPedqpyBGTHaHIls11qcwErH2CC3Ha2N8kkX56Jr4I4UIS6Hajdck0vqSkFiPPQig6
	n5lLiABvmV+NUKVBDS8hzi2mYAfT3muj1WNs7rhFx87l30wmGuDpv44iLZsGpGbNUFQkN4Bct4L
	3HnivbkllhhoZf/8VjwoAKxURJM0SAouuxU1tZ67b/SjHjFcgVRvREmAUNjnk4CpJ3mCmq98Sdu
	uMWG9wEow1r17O0glc4cliixWYDlFtetmEzT0J2GyzfmJ2UWFEVrDnT1xudTr3vGoGgyKEd0=
X-Received: by 2002:a05:620a:a50f:b0:949:a6de:cf5 with SMTP id af79cd13be357-949bab1db0amr3229761685a.5.1795603836156;
        Wed, 25 Nov 2026 02:50:36 -0800 (PST)
X-Received: by 2002:a05:620a:a50f:b0:949:a6de:cf5 with SMTP id af79cd13be357-949bab1db0amr3229757885a.5.1795603835728;
        Wed, 25 Nov 2026 02:50:35 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aea31e4sm624414666b.39.2026.11.25.02.50.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 02:50:35 -0800 (PST)
Message-ID: <51e487c5-b18e-4940-9353-ef5300c51122@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 11:50:32 +0100
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
Subject: Re: [PATCH 05/11] pinctrl: qcom: hawi: mark egpio as a GPIO pin
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
 <20261124-qcom-pinctrl-egpio-v1-5-34f2c06b2658@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261124-qcom-pinctrl-egpio-v1-5-34f2c06b2658@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aPJlOr9m c=1 sm=1 tr=0 ts=6b06bd7c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=cf3dnyIY6h9DwwF8UtQA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: jmVWRn8ZvFVawbiyJILODT0YGnjXqTe_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0MiBTYWx0ZWRfX2/XzNRRhhG1L
 56WjkmwDuczQaSRqCI33kG6laK2e/yPHr5vgtxxSIbrRKtGe92RANPkAzFayZbFSRk/Zqahelez
 43rV9oP7vl+qdXG/ikTnW8P+Y0elv6Ef4HluId0sUuE9cOg2Zv48qHUB9HurVxBWhUxKXKHROYy
 KlG/L+1IcRzTf5RALkNomaBIBNVJ2MvYXNlghINUlWg6aAhzo3CTc04eqTSq14njHdah8tT6W8Y
 B/qkJm9FARpl3oENpWLN+aO2uzMzWtB1QARY0P8fj5CD69tTp321VOwcFdWLAEl0i5QUS74JXRE
 aGL4Zzd/b4qhIRgpEkEYSsUS3jHuYJmcjgY326Sd1kxFUca/+/x/L0Pg+jcfqSConWjkeIWdaFG
 SLKZYrYs++Pqhc1HflPm+jIahosQcyWJdK16jXhLYer+rvzqjdZLRBLT6YCGVkAeNysuAOSPY0T
 OROyz1xsMjcc3vFYmOg==
X-Proofpoint-ORIG-GUID: jmVWRn8ZvFVawbiyJILODT0YGnjXqTe_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0MiBTYWx0ZWRfX/3iAQO0DZ8KA
 CViSsnc/GwcEgwcCZJsceFlQ6sZMLa9cFmkPQm+bF/z4f3lcr6r6QiKr38I/aJczI7qL8zPr5pO
 AsCkLgD2JfkaNXrUQBdsPU2Ncc43T7Y=
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
> The egpio function in the hawi driver is registered as a strict pin
> function. With strict pinmux, a pin muxed to egpio cannot then be
> requested as a GPIO.
> 
> Use MSM_GPIO_PIN_FUNCTION() to tell the pinctrl core that this pin can
> be used as a GPIO.
> 
> Fixes: 90700e10d2ad ("pinctrl: qcom: Add Hawi pinctrl driver")
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
