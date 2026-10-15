Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D5EE51C066
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 11:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792065579; cv=none; b=WLsYRFY9CCuy3OODSeqLxMyKwjNyO0+FEyg82hoBfIdK2bgDRsueOfbpLZ/0taBPSJamZvdFmW9RKOe8FcSCv9aUencw0FWT/MBTj+1ew1qW4vd66U7vXRLaMiESNGXYcrgr60jV1qzly00s0/ywEUdK+mkwTT4RuJpTi9SfxX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792065579; c=relaxed/simple;
	bh=KsRqpNKyvdGxdAlQ+dQiJscOwjRsmt9DrPpTB9AQPgM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XcYVXpdP84LhS3yINiWHLRzJAw2dtf2GVUdqX42kNjFEwgtq6Z1yzClk9etQGfr1cdfzAdZcgpc+Y1+gP9Je2UF2rm1OK32Ckn+z5Ikn6G2wUSsmexaP0S88ohHmThyrWy+wRnjpNR6Z01wV7XQcm+38eyKR6PikbgMf8E/IgJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ceTGjTNy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HILrSOm7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ceTGjTNy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HILrSOm7"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jZgh2966414
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 11:59:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hz3e3KoQEXOCa1kQuXBEWFHTKLBA2FOGUwTwnrDmVDA=; b=ceTGjTNyUV7B1Alu
	zoT2RM+AO1LOtYqjAyUZtXi6e7Hq0Ft8fXgDB3CiIhxSZk1HySKfH+ZB+svgKsD4
	yCskWG28DM2gumDogbXnJ7lGftiErgEV4QAiyf0BDVuRXB6fm6/i9eb5nqhooNgC
	KLX5bPFRvmUS9cKg+AFQK+p75zavi/Ko3isV/K2hq5RBe6IVRXxOX/RP5xkzdKev
	px46ov4UnFYKcAdS8BA5FsSoliY2awyoj9UMCaJeLETzbFV+OWTwc2woAON0/cI4
	Q6sTyEYD+CcNmdh5CkqGh//QIfauojwR8nD3N5dqZz/9WiME5dgxxQ+OjLgte9Dv
	R2wQrw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hae4wuw4u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 11:59:35 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5351b6bd8adso13422101cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 04:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792065575; x=1792670375; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hz3e3KoQEXOCa1kQuXBEWFHTKLBA2FOGUwTwnrDmVDA=;
        b=HILrSOm7HXvGmDnFpB+cWC5yC1EnO+YiFR3tFtro9vrVPyp0r1A2sQrd6gtT0Rp0O5
         sCs2iAzCSgUtaoPE81CD3ve76J6Wgzs6+9yJNcPXcEbSL/eQs8KbLEOxbaJmCIFvS7Q8
         qfb5wytM3oUKWhdjQ5tF7dUAIdfu9lysEiQw+tsgMCOUbGQA9pZ8htBniJKjOLqYhIbi
         /gcefDbsfne/8MSDxNgXfl514BbTtEjIkuqWUGyHaZGZWujOXit6I127CrKUQdyQe8iQ
         RAkzEqZQNao9rbNdU3k2QOh85fKRzG0g76xnUG/fXbk9Xp4ud36eXYpZ9Wb1MPb4cI8b
         tjxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792065575; x=1792670375;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hz3e3KoQEXOCa1kQuXBEWFHTKLBA2FOGUwTwnrDmVDA=;
        b=ZsaZT4V2yu4ov93VH5e4W3ueDryHeAtisuBJ3qSaXF3AyPjj3d+8Tt9ftnTEBv7Be+
         JCgRymrElQksa4suiCRIPFAa0LawyKAriAEoMZv21gqnzV3aFi6XEEDuBq1pHTcrwoEe
         d6isKeaTGbkObHrc11m9OqquMmpRckCSu/UcV9zIppAN9olsKgx9bp9L3aHTyoyKl1Da
         xfm6grbcceyfAA9Qwh/r/qM5S4k7CIE9+nYfwnkcXKaXmvkVZsEFV0IpFbKrEhy/qV7w
         WTFNwuZO1t76Ybvcny5I0mGKmCU/h0ZjInke3JGJmxt5tPfSMlTZmRcESm3XC9d6nfh9
         qBFQ==
X-Forwarded-Encrypted: i=1; AKwUvBzSBTIOu+jbiEPSkgfVHXipZ9sJzxm7FuIU7xDLDOG/TGJZDVYYp1vlkg3V5s5TL2cXhBh+d1pBPjhWYSSW@vger.kernel.org
X-Gm-Message-State: AFq9FYL1uXR0CWamzjB0nRtoo41aQuWTfNqUUIylaAnOdtgaz2f7iH3x
	oE8dVh1Jsnhws2Qv/Qb6/cwLnbr1P7u+hJhbztkOtQI/3tGeuu8s5gnTbDp4+v5ZhBffj5lMuMs
	WkKh4+upeQ+wLxtjuPBfXo0cd3iWE3HooFMExZcBndh95Szs7uJx0xwX5maTwo2tTVf/M
X-Gm-Gg: AYBFou0pVk8FypffA7Xu/x7KbMDAtM+LDIpzsSpgUFI0BHMvkUr3YCFJzrbE748PKZ8
	AHCaZ1R4AvxTIbHfkgg+ctZfckQ9RegaS2x52d0KBjLDCBmYIMVtsC/p0N0FEC4iu3vDrG+n3aO
	zkb/8j9evl7xjfNIheKjDp4VJTZtvXMemUKCgpdI0uUjpGbXzS8K0HGh+XdL60nOby8JoXeteIP
	KgJq/M7jUSTeQlC+yC0TTfhmlWigNjsitrnVESAPTddpPJ6hGZFTuiaE1Vc+68nViYK7lJ9ch0J
	bs2sKBmU+oAKSIuXLSgjnCcAfZFw1/qz+ApP7AjHhGhO5LrkThL3pWB9Ve8x5xFuP+XHr0pw27z
	tmwmAvQwJj1csCq1a+FU8xg==
X-Received: by 2002:ac8:59c6:0:b0:51c:2324:666 with SMTP id d75a77b69052e-5359fa50f67mr358234281cf.3.1792065575221;
        Thu, 15 Oct 2026 04:59:35 -0700 (PDT)
X-Received: by 2002:ac8:59c6:0:b0:51c:2324:666 with SMTP id d75a77b69052e-5359fa50f67mr358233841cf.3.1792065574606;
        Thu, 15 Oct 2026 04:59:34 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3eda3352a7sm117007266b.59.2026.10.15.04.59.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 04:59:33 -0700 (PDT)
Message-ID: <bb2f2366-2525-468a-961c-41fb81bf2d15@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 13:59:31 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rpmsg: qcom_smd: release channel OF node on device
 destruction
To: Avi Weiss <thnkslprpt@gmail.com>, Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261013055642.793161-1-thnkslprpt@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261013055642.793161-1-thnkslprpt@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0NyBTYWx0ZWRfX2xIxowokph6y
 +Qd4w4YgM97qZVmzGE4XkJgqhTiiie3OdrT1XVRJmEjV5OGQL6pKN4TUAE6gXJYzZSk2TzEu/F0
 354pDwrrxDF65cdB3Z0x/Uq5nN576UM=
X-Proofpoint-ORIG-GUID: kT5jLxOcr1TwX_3ikOjqZOxtvFuDuEUc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0NyBTYWx0ZWRfXxXg+HdyNe18j
 PKF0ystOo7Q/K/BqCMSgn2mqYbOqb0Z11Kc5PYXDeucnJvxk8Ez2cAcSBbevfdi93tZiEyf4m2y
 vQMJhTF5uTE58w131ltJ7kJ+rx9aiWEp6j2utX5Rgdts3etqGWx0jMrxxWZkaD3Bh5dTv1bS7m9
 Sz2Y5bJQBHr4rmszEHTP2fWG1RMdO+eU0+JJyO4sTDfhN34mI7PciiJu0iYkOxOPrVNYqOKlKJ5
 lKwIn1KFDc8USXGQk6tQ32a9l7CWui5MM8g3Js6Y8RO+cl8UEAvd1GE+I7XmSCbcdvrBaXyDhka
 w6mzUA6OOVSR4NgjkCBllrp+rtv56KBNP7NsbhZI+XDJ8IDD2CK1XWHmgOQcaJuejWKWDTaK/b2
 kei4JRYDFP0TWuCb/mz2IMtpHw3s27Ty+OwlpLK/AhYI9SPmSH3oeQoGX+nHEHN7x8Hu8NV6EP4
 zMTeeWIwGEqvD3AAfUw==
X-Authority-Analysis: v=2.4 cv=E8BYNqdl c=1 sm=1 tr=0 ts=6ad0c028 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=xj2EYvY_aspI9gx2kb4A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: kT5jLxOcr1TwX_3ikOjqZOxtvFuDuEUc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150047

On 10/13/26 7:56 AM, Avi Weiss wrote:
> qcom_smd_match_channel() returns a referenced OF child node,
> which is stored in rpdev->dev.of_node. qcom_smd_release_device()
> frees the device without dropping that reference, leaking it
> when the channel device is released.
> 
> Release the OF node reference in the device release callback.
> 
> Fixes: 53e2822e56c7 ("rpmsg: Introduce Qualcomm SMD backend")
> Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
