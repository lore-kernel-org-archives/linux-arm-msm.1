Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F0A347F78F
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 06:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792389921; cv=none; b=eG+lOV20E1pgr8MEzk8EvSyspShhy1z0PKos+qwNQI8Dtb67Q6Sjg9koofed2quMGDy9gBjs8jDpuMyw0YVPOK/LNqItcUM+XhQVnoXKcdg8q10QUXO6eFz9rsmbj/gVDnv8dNbdK5PhCyvGm3j/Q+o0M59UbxshP6bzZEq8scY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792389921; c=relaxed/simple;
	bh=eVz2kOkeYGqtTtls5Y5pxyYcXl8r5yMKB0Xmf7FiKNU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sVd0HOpEz32OPLxhPG9nMOiTiqp9Fh9vTFEDO09wY2M80xLbiGmQeiJ93DLbCmt1D4eQwOMLyA0AP65yoVTFvtTm5u5YATDrFFLWMx2YAmRJUWSJcVYiDB/f3q62MZmJDVHMxvCEPqnbDxZeZT6k+OYyLsvE5mqNZ1nJG+xN4AM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MRn2PdRK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iwcz5ZTP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MRn2PdRK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iwcz5ZTP"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J4jfsf2268349
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 06:05:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tB06UDpEriWVFySp15EJ7VgU
	Kt47g1OZ4M7wqg9CBMc=; b=MRn2PdRKSHF+PI/DJ8Vuoytz4ofplgtn766QFQ4V
	mMipqI1bIovjH5aX8IdO/is0fLqADjKaiMVkTmaL3Yv8kA7jCf31qNaUpzkO3LuH
	tG8h3W9BnayOuCpSwI9nkhtIMpp/bQW3XaHnEL8iT6iZ1XeaLb3PVo3OxZ7MIwdZ
	ARC6hxvNllK0ATcpMWjz4usXc7Mf63R2DPt9nAXPXdeoORBg8WtTODhsTifSDqbS
	5a2FruVl+611AQpBStzo1vquAxt0lyVz2eywYBVukCybhC4NETeFgBsTdVTNoAMQ
	HV5Rjxhrd4OqYdx6yLkWA7UuTNUtP94lbFIRRtvSY/cimg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc0kxn755-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 06:05:18 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30bcb065bfdso3592083eec.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 Oct 2026 23:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792389918; x=1792994718; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tB06UDpEriWVFySp15EJ7VgUKt47g1OZ4M7wqg9CBMc=;
        b=iwcz5ZTPNxfAsrhW9ZSt9u87tH5/kels4NCZMXl4n3oDl1g5Apk3Fb4zwi+nXm5bRw
         RJW8r7EmQiYbhR8iKatAeJwoQ0m+P1llzo8+h77a0uJsj5rieX4eya/qDW9FZVBEyRo/
         nK/GlMy80oOWptb8ZNrTPpIrnK5HUiYpQRhc/1Ke06TfY1Ee1Cacl9Ae32Ta0Yo9UisI
         HP/JCOAQ1/KR2Z3kdU0o8Il6kFls80SnTH46GCRYcjKCkLXfD55xilEBbrHlkoY7JI2j
         LORxbWya0TzpEr7kRV7B6MdoALNhI7pE3cNZgPcldd93LCWkcFIWhPhvHNnLVArGsAtp
         vuSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792389918; x=1792994718;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tB06UDpEriWVFySp15EJ7VgUKt47g1OZ4M7wqg9CBMc=;
        b=yYYKDfO5t73ruOG1wXr/Oulx720PDJ92G350i5rE5I3EIXrMBdFEyktKXVLZw4iQ+f
         CSzfE5J+RpCxMq9SQFD0jlraxLAVnnewNMQb2UfbNzL1eelWatiZb0DlNtg1qy9oZN/S
         4y2utsvLIHf46ZXkPlQ61d4ZlK5tkxe3NOBQvoRzoSGjHLNZWAS6rbI+tAVxQrePMvIn
         Kj1teHFnmm9qhZy6l7CytghoPuDZjGZr354xmgQWLV0V7mVSa+mhuddj+XMOrPtlLGJy
         o8xeLd7+R0lWcsWqF3Jma58o0QAgeN1VV01oM5qEyap32vSLqnUBESfAzgrmPn8yf0FT
         3GRA==
X-Forwarded-Encrypted: i=1; AKwUvByAI4uYPBIn2IHiXHAXNexexhNhHgQnsAFSfJdjhYsWr27sTdnpiA/hGLdcS+28bqNas8NJeZSg/zRUL4yw@vger.kernel.org
X-Gm-Message-State: AFq9FYL+FkjD5T4ADYW7VqFBvnpeWLQzSF1wY7BlTAdOkKaMDvpm5C91
	xjKgQd1IN8HNGB+Yo0Fs2WTUct+H1074oSDoQU4QvEeQS9Vs3FwbrT5DzC03AYYY7t2u4kSXmfd
	zAKpyqXxaboOaUSaD1p+9jfXvkzfBOyLe93e9QOXDvu6O43oPyEh45Pmw/9SqSKOsgsGo
X-Gm-Gg: AYBFou3V8PICQ1xO0sl3vp4PKMtwcE/EoEZftah2CV8rWjoE+/rwS/h764HC++y6v6z
	Xw/SyjleQW5kgtsYrGmkWr6tkBKqqiVtc4zGwm9rZ3Un8eD6sRiO6vI/PcvQZVrGGNI9e11BUOS
	XMo6GQS/2AQGCSxeCSpTvoFsMM5cFCh5SqBZfJY9vLtOTlGcTPi6yTvgJu8ddWK2JXIcpeYvgcS
	XJGSuuE6PNpubSiWBpbT9QGXqsZ8zVX67cBODAwBsYfzTT4XG/0xwfmBn4FR5KaAV93MZ/GttQa
	An5MZy9zZ9axNP9yDMqUh61sjsJsUBr73Ehl1/SDIOjdVKrHitp3rJmx5Cyr0yMnpdqoNTdGQ1i
	DZ0A7/nOKwlFndAgsddafSE3+BqS6R40HiZqBFQmlSQ==
X-Received: by 2002:a05:693c:8353:b0:35e:fd8:3201 with SMTP id 5a478bee46e88-361a136eb6fmr8863395eec.14.1792389917765;
        Sun, 18 Oct 2026 23:05:17 -0700 (PDT)
X-Received: by 2002:a05:693c:8353:b0:35e:fd8:3201 with SMTP id 5a478bee46e88-361a136eb6fmr8863359eec.14.1792389917130;
        Sun, 18 Oct 2026 23:05:17 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360820a79c7sm28638345eec.18.2026.10.18.23.05.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 23:05:16 -0700 (PDT)
Date: Mon, 19 Oct 2026 14:05:10 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
        Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Dan Carpenter <error27@gmail.com>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iio: adc: qcom-spmi-adc5-gen3: Allocate unique ADC_TM
 aux device IDs
Message-ID: <atWzFlOgRICAGM-R@QCOM-aGQu4IUr3Y>
References: <20261008031154.3440632-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261008031154.3440632-1-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAyNCBTYWx0ZWRfX/vNd1Y1OX2jS
 0BKWN1T+QDOKJ5o5m4pb/GynWTyqn8JDWtorcCqsOj6k9/j0eGQp4qCBJNCg5qwrNNfKUaBT66K
 5y1gE4hpY3hIdUq71BzyzHcdkOPCqC8=
X-Authority-Analysis: v=2.4 cv=JpZkP84C c=1 sm=1 tr=0 ts=6ad5b31f cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=sqrxk8c0NW8lVwhiI0QA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAyNCBTYWx0ZWRfX5msbGrbRu5gz
 /u4KosLYLa0tOrZT/p83pnIYz07Nb3QkOWkF0uOTMg+f61Lq2UEtclQPEPX0RICPK48Z+EC4DoW
 N3AYeCjUBcdTYfPw+lcz4FU53AtLZByZBe+XsMxfTHZ/GJ6MPVmLCegZLAvP4f6eFri4fdoxUAQ
 qYn8kPFMLgyvzy3u4PczKiazMl2JSGkM6KcIH/LIBWjle5x4IC6hVjEy12elTWHiX8giOGckRNM
 gGCl/og8PZsVQ+IAD+XRoIjv0++XEtvVISq1G/6hJ17Mmxu23xr9EkssdXqfPxAugJpK2gvEY1w
 FPcX2cZAKBFWGmLFJXEMAkQemTgzWeOG/329h6eDynQPzvz7fIK23nKEaKKNInZmwtKkZxa0Ky2
 deCVlfC556+lTdP1Ri/Oq1tpcGF65YyuHin5WdP8WRLzem9LX2S5ZQ3rHhbH0HWIboAXk9nTWly
 l/Tz3yeplb150cjoTLw==
X-Proofpoint-ORIG-GUID: -CrfvNZCGOqjBgEgZ3uDJJdcvZM9rk1J
X-Proofpoint-GUID: -CrfvNZCGOqjBgEgZ3uDJJdcvZM9rk1J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190024

On Thu, Oct 08, 2026 at 11:11:54AM +0800, Shawn Guo wrote:
> adc5_gen3_add_aux_tm_device() never sets the auxiliary device id, so
> every ADC5 Gen3 instance with at least one qcom,adc-tm channel tries
> to register the same device name. With ADC_TM channels on more than
> one PMIC, the second instance to probe fails:
> 
>   sysfs: cannot create duplicate filename '/bus/auxiliary/devices/qcom_spmi_adc5_gen3.adc5_tm_gen3.0'
>   ...
>   auxiliary qcom_spmi_adc5_gen3.adc5_tm_gen3.0: adding auxiliary device failed!: -17
>   qcom-spmi-adc5-gen3 c400000.spmi:pmic@8:adc@7200: error -EEXIST: Failed to add auxiliary TM device
> 
> The ADC probe then fails as a whole, so that PMIC loses both its IIO
> channels and its thermal zones. This shows up on Nord, which has
> thermistor channels on two PMAU0102 PMICs.
> 
> Allocate the id from a driver-wide IDA and release it from the
> auxiliary device release callback. The ADC_TM driver matches on the
> device name only, so the instance number does not affect binding.
> 

Fixes: baff45179e90 ("iio: adc: Add support for QCOM PMIC5 Gen3 ADC")

> Assisted-by: LLM
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
