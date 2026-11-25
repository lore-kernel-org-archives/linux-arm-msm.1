Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795597271;
	b=sHmJC4jVjVQq0zWRZQzTR6+wRbK6rZ4tmf1LdKS1f629OPhJrfbRox0KgHymAcZ6G6qe
	 158UDSJ1VY3YFF1+K7/dHgJWhn7hqLp5GteNkzcVhdpMIAFRmoqaitAPvG19xoS8C6X9m
	 vfBCYaypC3IiqF8ui/0eYYsp0Wt3p013/wIKWMTEC49hz6SPhgowiLUVDXIiKsA7KEfUH
	 ioAu3EeW43jrlDg4QGXTBVpwbeV702/qAC2ThJBmZLja7s3mb5NUWS6FWU+i+afzDByEo
	 jQxCYNlAQhdnVNpwwla9IHrmGOK2Szitnlf7CPimxTzx1vDOmOAwtnheGYb4OvxBZvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795597271;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qEYCHONLfjiDlaQnUG/xCKXVK/LoPfBJywqJSXoNvis=;
	b=nXpIW7L3pMfqJLgqKSSmevPhYaIQYelBkeyI7mDh8Ghe5srf9DvUPsUfrV5cBJeNPQEF
	 YRIwUak1F2nrlTKCmwbUnSshkw1jKYJ4359Nk41aMils4ROyP5W6u4MQCB7jSOXxNFDsy
	 xynG8H8nZo2WxRHmtZ49rXHmg8bzc+z776BIexoTWpZXKltZoBumGPzkjx0wJp5ApotXG
	 siKb6pdUc9gqmnulFvu3MfsPu8Mr1wODky7UOCBgdRuA3b7k1Q5teYBOk+K7iGEKd2T+a
	 wJCl3c8p5OxSldthN/32kT9etnCQr/MbUWUTwPZ4v/JvH+ShGPQCcyYIGdDbTTw6m3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fTeakWP5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hSi3IEmQ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B6EA606A321
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 09:01:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B6EA606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fTeakWP5;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hSi3IEmQ
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP68eSl1860824
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 09:01:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qEYCHONLfjiDlaQnUG/xCKXVK/LoPfBJywqJSXoNvis=; b=fTeakWP5KilBgsyo
	J9Kjs8DqJVco9O+MIsxMaEU2KcXohMAyrGpV50tRJMCKr6j/vbCQxZ2YFJwElEY+
	0nrJ6NdlIDsFzgsAdePFxVI0KJ0aqErCicJ9uIfN/gFZJ2xfjHEEis5VQm8Dw8Nh
	0wERmjZEHi5E0fBah9M4OpUenQx5ZB3QThdh+E+NdlkK4Jc88+vGF3JoacJpnMHM
	RD4ojEsd7G/FYo1I+4JtUZ2TDYaJ1tpRPr7j9u/2oqi9wrifCkFLco7b/o0ycPlf
	niWAuqs2qPGqDeaM08XlXuUpAL9+dbkb6S3z8r4O0OdMkvmxzVIkVoCTy4h34M65
	AlLNAA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5nu69mhy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 09:01:09 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-94960bd17b5so900714085a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 01:01:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795597269; x=1796202069; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qEYCHONLfjiDlaQnUG/xCKXVK/LoPfBJywqJSXoNvis=;
        b=hSi3IEmQtTXfq9mCLyDxmW5j4v4M3cVH0GR6VXGpjAMpN57M2bXyB1VJs4s/KSoTUp
         SOZIR7UtEdFXSp1Zyrqi0pJYzzPqD0Dtz8SDxZRw7tE8dL341Hu3bKCJJXhlE0ACaf0+
         J+WkRos3pSK6rgWZDAiCw8Nju3NWn5EZ7SDGi6zVr6PsratPS1WK/Rw2Om1+dKNioWP1
         dELc7aA+x8vcjUO7Jd+HfnSgpflEBIXO9Quz+NrY05UcO/ItEUiLNbfVS4DOwxBoT1zN
         PF8mqE4STdypdmIrbyeRA5b7gIFyHQMV3hG6frviBnwYPglGjhz+T8CP8GGnE3mLC1gV
         111Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795597269; x=1796202069;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qEYCHONLfjiDlaQnUG/xCKXVK/LoPfBJywqJSXoNvis=;
        b=kODOEeowX59i5UBkq2hfkS8KIN9tfQ4/wLwZ10MPnqG17bhbyMQ80BwfEwLJFwKYWZ
         29euct5X+YjJKPbtjNld1GzKZb/qUD3ZJY3hfvYwyXt2re02YBwPEx78rUmdIlznR3Wr
         cyPsXchfdAUV4Kyh5tG6dK3nffk5Mnwy79/YJsron/ENx3qgaRRVbuUv+zvmcJ2jkhNO
         cwrBXjCxnDiLBLgaVDlxXEE2JxW4urnPwKn69W1ozPVLC3OnHDeX7EIPUaRZ90ynE4ph
         djcr/JaLs7a00l7m7Ez/0zaqKEjzLsVrln96HV3CozGhJSW7edp2oKtzANCGrIu3t1fu
         lvuQ==
X-Forwarded-Encrypted: i=1; AL+hErF1+82wS+oF0ivKKsm5l/D60tvJHcM5k4ljvlqqfXe7Clj/dujK59E12GDBL2oCINDFxLRlTT6xQdE8iJx8@vger.kernel.org
X-Gm-Message-State: APuU4Z+MUigYDL8QRtaHVE7sEhHP7gMorFvB0kS6nTBNHb/vFLdjjk8X
	XZuGZ7zLAioGuCqHdN+PGdQhDP7HtxnaShszLJnQK45Nu0tU446gNztO/6pmUjwD1vcp/wbqYzI
	lc3ELcpaGJtjB5oHP3OgBn2jDA4gtbnDMENoL0INW6CJM3DZo1Y+kBVeqP6MEQJiLsjRb
X-Gm-Gg: AZFdTZfVSzD+2dJEsv/kin2DFo9QWiNnFjA+yQV5AJC4kaiDRngxHEdx4bOtUwkK3Eh
	us+jE/7OW19vDWdFyyzGLeNQwzUJn17lZGWY9HkDQYyB5oCs5e7TIwfUazTaJlLToTMypQFB6TN
	qmll23AzZA06E5tWafyWmewInOr0QyGvPFMda4DxQrJNmxzdld9HXt7z6RAx2f8Jt/IRFo+qpI5
	/Y4L6WOzdeDceRnhmtCTzN1/oa+kTJQVPUvJLaToxc45PFo66ljDq/YKt+JhOEddm4OyOBbWt8P
	gGJcM9avKPwC6CRjxgWQ3cOskKuEQs8eA9Gv+EayNGiVgx0Ned3J0dhZJBF2syM9+H34eSHY595
	3KrQB6WKtzqUlgU6LuEL/huG2TGqbN9ovxWUAq6Up3TC47MiaL/yel4B+xtlA98liw2YcNh3Jmt
	ocyK0OzDihuC2lEw==
X-Received: by 2002:a05:620a:4491:b0:939:a0f3:6aef with SMTP id af79cd13be357-949ba95e8e4mr3024915585a.23.1795597268812;
        Wed, 25 Nov 2026 01:01:08 -0800 (PST)
X-Received: by 2002:a05:620a:4491:b0:939:a0f3:6aef with SMTP id af79cd13be357-949ba95e8e4mr3024908485a.23.1795597268240;
        Wed, 25 Nov 2026 01:01:08 -0800 (PST)
Received: from [192.168.25.64] ([94.155.124.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884911e3sm606266235e9.6.2026.11.25.01.01.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 01:01:07 -0800 (PST)
Message-ID: <0c0b3af6-4fea-422a-a7dc-76e36a3f5db4@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 11:01:06 +0200
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
Subject: Re: [PATCH 0/6] media: qcom: camss: Report the hardware SOF timestamp
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20261123-camss-hw-ts-v1-0-7b62dda6d7a9@oss.qualcomm.com>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <20261123-camss-hw-ts-v1-0-7b62dda6d7a9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: xHClx_LUgT2755f4NjqLWI9gql9ToKWI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzNSBTYWx0ZWRfX1WxlSdCYs2L/
 k2OcQJNL+6kR4ETrp6SrC6QGqgiGFA7d7NIt3vQZy+NE7Mcb3fwIg5dRQITiHr9P+etrlpDBTJ5
 TM38iZPjElSwnqTAkiI1gv4W05bSDpg=
X-Proofpoint-GUID: xHClx_LUgT2755f4NjqLWI9gql9ToKWI
X-Authority-Analysis: v=2.4 cv=Vra2kO2n c=1 sm=1 tr=0 ts=6b06a3d6 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=eGCDHFSXubCXFTSSGhjuOA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=mMDk5lcDQkvegnXiA_gA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzNSBTYWx0ZWRfX9j9Dw3P5PRfs
 Xcwdi4H6uyw5w/UuxwUptiaJoe0TDvXHVyhiz1hSnALzvLIPcqVkLr7EEIJ4/xeewCQTK6VqslR
 9K81vLY2x+yftf5eYLJqnT92CLMQr5B9m8Dn+fqlR/WHmlztORPH+7L4ThmkHgsVZJLT6dAxrvq
 VdU8NhMnWYD30pw6HqTRqaicUw2NBjnvzcTFfXHp3Gg19e7D54UC8/pTS+yWCKHVkVd7jLWugCh
 KtLO0N2GtV+foEBSXtKWI47g3OG0+W/NJzKzvBrIGRpj/Pod4djA8RIJ4vQAjoCREA5Cvtvf0Aj
 EgCQi2je+n3lTV5Kq/SjuIedKPiAqCBK9zShTupJ95rT4062+ZkJ8mEdd3v9CKcf8J4n4xSR+bq
 RbizlW2wo0wYdGiY6RIVDuwHgGkdFG66F1xKnRI4NX9jSKEOGOiqj03u6u9umjLOvpshrH2mjLx
 DFvyn6ZYSNpVBCYHfyA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250035

Hi Loic,

On 11/23/2026 7:16 PM, Loic Poulain wrote:
> The CAMSS CSID latches the ARM architected counter on every start of
> frame. This series exposes that time to userspace, both through the
> V4L2_EVENT_FRAME_SYNC event and as the buffer timestamp.
> 
> Until now both were taken when the interrupt was handled, or worse, when
> the frame had finished being written out to memory, which is about a
> frame period late. The hardware value is free of interrupt latency and
> is directly comparable with CLOCK_MONOTONIC, so it can be correlated
> with other timestamped data such as IMU samples.


Directly comparable with CLOCK_MONOTONIC, does this means
that csid timestamp is in monotonic time domain? 
In camss video the flag V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC so either we need
to provide timestamp in that domain or convert in the driver.

~Gjorgji

> 
> Patch 1 lets a driver fill in the timestamp of a V4L2 event instead of
> having the core take it. Patch 2 passes the SOF time down to the common
> CSID event helper and adds the counter to CLOCK_MONOTONIC conversion.
> Patches 3 to 5 read the registers on csid-340 and csid-gen2. Patch 6
> uses the same time to stamp the captured buffers.
> 
> Patches 4 and 5 are picked from the timestamp support Bryan shared
> earlier, with patch 5 adapted to use the conversion helper added in
> patch 2 rather than its own.
> 
> Tested on QCM2290 (Arduino UNO Q) with an IMX219 sensor.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
> Bryan O'Donoghue (2):
>       media: camss: Define timestamp registers for csid-gen2
>       media: camss: csid-gen2: Report the hardware SOF timestamp
> 
> Loic Poulain (4):
>       media: v4l2-event: Allow drivers to provide the event timestamp
>       media: qcom: camss: csid: Pass the SOF time to csid_sof_event()
>       media: qcom: camss: csid-340: Report the hardware SOF timestamp
>       media: qcom: camss: Timestamp buffers at start of frame
> 
>  drivers/media/platform/qcom/camss/camss-csid-340.c | 37 ++++++++--
>  drivers/media/platform/qcom/camss/camss-csid-680.c |  2 +-
>  .../media/platform/qcom/camss/camss-csid-gen2.c    | 32 ++++++++-
>  .../media/platform/qcom/camss/camss-csid-gen3.c    |  2 +-
>  drivers/media/platform/qcom/camss/camss-csid.c     | 81 +++++++++++++++++++++-
>  drivers/media/platform/qcom/camss/camss-csid.h     | 25 ++++++-
>  drivers/media/platform/qcom/camss/camss-vfe-17x.c  |  7 +-
>  drivers/media/platform/qcom/camss/camss-vfe.c      |  8 ++-
>  drivers/media/platform/qcom/camss/camss-vfe.h      |  1 +
>  drivers/media/v4l2-core/v4l2-event.c               | 20 +++++-
>  include/media/v4l2-event.h                         |  9 ++-
>  11 files changed, 205 insertions(+), 19 deletions(-)
> ---
> base-commit: 2ad58ca589da80990b7afbcff018777851577f89
> change-id: 20261123-camss-hw-ts-e0297adb69d9
> 
> Best regards,

