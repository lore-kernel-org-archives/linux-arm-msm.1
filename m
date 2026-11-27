Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795781243;
	b=ZgjlZJvQqK16vgSsfuFeRhL49DuNBlfjLQBOh875NEth0pRJcvlYDPR1SeP1DljsppwL
	 wp+PoeGGxvcGyTNGrc0wJEpdqnAeSDULYdqpYliYDH/wtcKl6qVFE8cij1LWHIdwTUwOm
	 Bfv54h4gRkMhJ4BbGppYCZEtJcZfaIneBd0sc9+Pz2+axIZlhb6Dec8lyN4Ow2hLyJdl8
	 xALZgBN3C7GCxX5YyDHsatUgLsnmzJk09XGW7V6mKn03pxdVxZ3csbs9ArFk1LTkcywKJ
	 lxfaI5gRbGSz4uvFRnZ+YhCS8cRWIZbAZlSTyndH+I02PwVAjv98U1TJ1PZ8qLDkn2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795781243;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=SOyvDr/OZBYmgAj7NapYrDKSeLtN84nxi5oDtZUBZP4=;
	b=lmbQ317FDZZK2VxXuxa+jY2ed+ELwnUuNmU6/4NbESG/l6IcAGJ0zKNxUmFQn6t1HMQj
	 i3qxN27KFv1jwKNowW8KjupKnRZTraQoZkyV4nmkZGrmyOzxrDtBYoISSCOVUFQ7M5U3e
	 8wo8ZJ+vmXxueThGl/4xsFt1TTsYJByS9361Gvpagqkoe1MUe1P7PwpdIZ8o7u0cXjnju
	 u2WpoLhOKhSoYXIuKrQp9w6FHdd4H7pctGbMSSNvYFYEN8X4yqDeK3hW0evvTg2qg8UUG
	 koiHOiSNaj/PRjUhFaVNCFxAjYv3eZqTdYJY+9jlrtAFRb+OYCo5sZNXt43znZJ6Djg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kQ2sDyDH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hWKR7Uq6;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB6C606A31F
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 12:07:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFB6C606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kQ2sDyDH;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hWKR7Uq6
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARApLQT273499
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 12:07:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SOyvDr/OZBYmgAj7NapYrDKSeLtN84nxi5oDtZUBZP4=; b=kQ2sDyDHBMC66aOU
	gd0tesO1tntmzSFbpZE1WyRA7TybFx1A7bW81OXNR2BUgZuBQhdXlOkZQVDaQy4B
	8Hyn/d8UFdOcE9CW6/84nJ3RkHCGctCT7UEyPaOcfpqGtg2beKDAWLeFdRIzFwZx
	vr0Cu66TI/S8rkbrzA5mi4OaMar/7ivoyyC3ujWLpDp92Z8vL7oKA6Xpxof8Danm
	oaYog0stZcVbI5YUWhyDe+eUpxrq4czjWopczQk2VUee2FxfGKQZSfr/7NceMRDL
	2PlDPLB/un7dMPRSdqKhWbvWLvvjryGg+vvMC0vXzO7yfoJsbf3UmhUhLFcgVgcW
	uSu7Jg==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u49aw6f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 12:07:22 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-71ac6866f4cso438376eaf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 04:07:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795781241; x=1796386041; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SOyvDr/OZBYmgAj7NapYrDKSeLtN84nxi5oDtZUBZP4=;
        b=hWKR7Uq6H3sVJlnndSCvKtFOiR1+riNrKq6aTBw/WLEnatgpWDbGdX64vHP7osKZiM
         iFcu0OAFqWB8vvCfMW411rLY32LDuwuJAoIqhzMrItz3a3jgYWTVfRuP3oHnu1g8CkGX
         xGrvkyLnBpojP48BBeM/8XfWa1Tx4sESK0jzqOX/cvdwZi1CCb13L6+zV8i0gwQO5B3u
         eSBH43eIIhoQRuDAktXPKU2ZgOIXdGASKOUIAJ/j2xCcWBPhdMz3SbEBGrGSOPTX1lvw
         8tylAXd/BSqtWIXqxybaUSXf/PZ6MN4pYoKyx/oL8UDicBDdP7hkKPtwHUDOCETHm6p3
         hXZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795781241; x=1796386041;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SOyvDr/OZBYmgAj7NapYrDKSeLtN84nxi5oDtZUBZP4=;
        b=aqmggGu+77sLaToDsS3lRp4FekOvm1z8LDsjp7dDIqHUDKsvU8nPk1OgfHuyJGaxSM
         YoQ7arIbHfAlfbZmWQ2P8YuxY6gkPHqwuZt/bvY6l51Z4sgpUAY4dGrzWd/+N9ihweT/
         cvEoAHVKpz5q2PrcylUdTrYqsjYr2J5UkTmI7omqKh5dpXUqJsz8Q2Y/ijo62T9A/Hs5
         0/NwVFhPnmWiH6FgTpuVODWT2ZyPUFOl0lq+GZDfL/JNQxzJGBGgME5GaVUUYYYFOB74
         gY1kQ/WGAnYlJImigv5Rkhn8/qVP8N6rbiK7fe0xnqHGDBDWsOISR0kmjWsETlLbp/9+
         sa7g==
X-Gm-Message-State: APuU4Z8qZ6Cw1vmYgSzuSCHleBX+05H+0oWxi60UyKRiY7O/qWJbqjA8
	qzjCbkTYqmuu4aYeUj1hGoLikS0NRYO7NNMbJStSx09yt+/zfG7iwxWuARBQYk/pCQGnm6+pSPq
	CgOkxiREG2vlKSskg0dZUFJ9F5G7Zj3Vg1JwpPiMwg1qSCPNJBEQtnANdWzTxxHhY0Qkj
X-Gm-Gg: AZFdTZc2tYNUHn745rmXCv4hwQg+1FMvJ9LsLJeuMuedKwKhHFPfZXB243Ky/8FHZSU
	meUoTdkAsCbr79BYIHRu+AHetHQe43jaqlaWi7PGhn4KtzkFFAITo3A1kOuZb6li/UDn946xbw1
	DJisCaxm61uRSLDzfQkqGFDQu6WpdY+Oa8o2HKqczuw+2nD+niwvyMkwoK9VVEu44xxWY3VAavg
	J6bn5nVIZw9zHPabaM+4+iTTk6Lc0jDOQMy6tSqBtnP5cXuB1vTVimxSCx1IdP9N5958oMoU3Sr
	p7MEdnNfLfzg7VPTEAu+RC4j0rxHTEtUucEHEzWjZRuYtk7MTYnpHLr8zFzIw73h7EKcEHc3KRE
	wa8CIzTClYOvKQVt9VtJJX0Px6RkSEc8BuMtCjNRzXOnUI0e6nNnfCiKMQ9PaRllJ1g5i2cY=
X-Received: by 2002:a05:6830:1409:b0:863:92f8:b6c6 with SMTP id 46e09a7af769-86392f8d238mr1518661a34.3.1795781241157;
        Fri, 27 Nov 2026 04:07:21 -0800 (PST)
X-Received: by 2002:a05:6830:1409:b0:863:92f8:b6c6 with SMTP id 46e09a7af769-86392f8d238mr1518596a34.3.1795781240639;
        Fri, 27 Nov 2026 04:07:20 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c51a161e387sm346402866b.47.2026.11.27.04.07.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 04:07:19 -0800 (PST)
Message-ID: <10915364-1d58-475a-b11f-36b41a18c9fb@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 13:07:17 +0100
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
Subject: Re: [PATCH 2/2] pmdomain: qcom: rpmhpd: add RPMh power domains for
 Seca
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, Tyler Baker <tyler.baker@oss.qualcomm.com>
References: <20261127-seca-pm-domains-v1-0-013c28eafc5f@oss.qualcomm.com>
 <20261127-seca-pm-domains-v1-2-013c28eafc5f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261127-seca-pm-domains-v1-2-013c28eafc5f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: kOO9WRaSe4ASPP7p9BN9jDuIZUJzXmEh
X-Proofpoint-ORIG-GUID: kOO9WRaSe4ASPP7p9BN9jDuIZUJzXmEh
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA0OCBTYWx0ZWRfX+m1i6u/rTn1L
 qCeqrKWuAQPfKXrR6vSBGvTQVqUP/u9ovNE6N+CHahSpIMwZzg+vMiyQh4IYK/TsWpZp81h0xbV
 O7YxJtY/+a69tiBbW8g79D6vftenkbA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA0OCBTYWx0ZWRfXw3KQDfuGlaKH
 Ty3Z5VDceIrTkUNyoj3O71Emx/Cqex9PJWPvRxghpyGSffOQcqg2zcQZ+a3WeyA8YlNTMiBQdkM
 xLk9gVFvLVrQgKC5yHSnh9jkzVB5jC/8YnUrddgLuYA3RJdJybJGZ2K6RtZBb/78MfKxhjt96da
 zKQLH498JMjnqGdMOlioAUeX0ipb7vUAPZ47wV85t7XrLAh14covqChotCKamSG9mYlaDwRyWts
 fGhzyVUlGWxyl2VQUbBk4BPYiFb2OYme94fZDCVytuvCN6DrVp1Wm6C+mC9Ods/V23uFBmbnCcf
 WWG1LfF5ocv4NevwwE45sJJgmkadhR2AmgsNLh0Ie/2JK/r6jQb2qPOvKPbYlVMdm+MWOxZo6uB
 iyzn5UABFJvtJBZKe9K+NP9rALFmJAXWRd8ZWL+7TyIVyLwKJSlTaipJuwLq+atxIckbSkkpIho
 iiaCPFAxzFDJlAestcA==
X-Authority-Analysis: v=2.4 cv=A875rKWG c=1 sm=1 tr=0 ts=6b09727a cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=2ZRMiqlpstDxVboJcQwA:9 a=QEXdDO2ut3YA:10
 a=rBiNkAWo9uy_4UTK5NWh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270048

On 11/27/26 12:43 PM, Bartosz Golaszewski wrote:
> Add the RPMh power domains for the Qualcomm Seca SoC.
> 
> Co-developed-by: Tyler Baker <tyler.baker@oss.qualcomm.com>
> Signed-off-by: Tyler Baker <tyler.baker@oss.qualcomm.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
