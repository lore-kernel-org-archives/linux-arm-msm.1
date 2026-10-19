Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C77B48A2BC
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 07:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792396739; cv=none; b=qDVqMWj5LCUjG04fw4jngI1r//amm1XSvskxN6hGz08zFYS8eH0SG1honFKpof+ezojstMQMiYJH2XfBdzYv6l4j9oVu/j7wCLwmNPq8Bwp6nRIwCqq1wyAbirdWpToi7MqjTMc7pQHpmBBGz7bKi0jdUjUPyTWRiE6SGdIHHvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792396739; c=relaxed/simple;
	bh=LsxdgDgXwqXPOLGk7GvlQfV5b/AO/cM0LOJqWa7y3Fo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ssYBRcLep9jbgs0onzh8s5ApMSd9SIGllTVtwIqYFbX9daGJJWSOeDBQd8rmYxHcAWay6YUONM3uwen/IKa3PVBJCcuU6M7bMA1mdMT6ZiXTwyGAqP+GvBTXNjpCv5Ni459rK63ZRv92Z9YLpG6EiJc4dw5ciN9WxkZI/dyRvWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h5KuF6Rn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bGqCaRDC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h5KuF6Rn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bGqCaRDC"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J7j5a93167585
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 07:58:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WqX4y0x+m5aM5jJEgMqJ6SpiXmB8tCcvAgnIWrDnW2o=; b=h5KuF6RnG+6+lJtn
	i+hOmHTka/CJJ+wtOI/2Em57na0adNK+OooVk0L2YjQ9ribZkGCcCy2vplquoOUY
	+ujP1qvQEK8K1n+F/84avGi5k+oFm51Bjh56lmX67psQnBwo7PtRoMy5b5n0p6B0
	Z7jOS1kArgnuLLzXVj63UFG1jBCigrq4xXuwR/DdZZPO01jIRDAb6XxyB4HIcEp5
	R00WUWpeiAuqMaEg7qiKpH8curwVIJA214bmlD68qKJifbs7c2iT+xttGp6usmI0
	0kK1wmjp5tHWSN5EjS0noTVnbUqL6J2kaCMZfTqu0rO9BzVqVAnHAfg2ImTTHXQa
	qAKhig==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf3f81em-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 07:58:57 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93dd3c3badbso440693685a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 00:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792396736; x=1793001536; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WqX4y0x+m5aM5jJEgMqJ6SpiXmB8tCcvAgnIWrDnW2o=;
        b=bGqCaRDCK0t0ngDMKdvPHygmYbSSUlp7QUtx0ovIm/sEzEL+b55nvX7nPtjuZ+Bb55
         31PH/wVEw7TRg6wc+CnYVYV5JZULhNVuNRyEKifFBfVOKz9307TNaKK0bBq27Fp1tMb5
         5KNAgumQ3SS8PqCvBvBCy4uNHYnTjXJIj/XtNyOwJGHIwdlRHaYUrRTd2zaVPAs7hElI
         WNEzwReY+CQ1YuNZjQ0Iabyf3TWWixCnQkvz7cs7Oer4/P94rj7msBaj5geXQYUa4YzJ
         Dwr+RE8TENWyGZCruFUhBSrSoT9BjGCmF3KJkGlpj7Y4XFe93laM3aC4HjjjQ3lesxBv
         SgBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792396736; x=1793001536;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WqX4y0x+m5aM5jJEgMqJ6SpiXmB8tCcvAgnIWrDnW2o=;
        b=eNFwB6aEdkmX0j0vEDIJOEHYK2Ebluhy0UZ3h9xS52s8L8TBL7ZS/Rtuh68HHDiZx6
         cXu8nPQdx0E9FhM8039a8YuTMw7vC/O9yvaQNQOOn7Zh4UAD823XzjN0UL/16TrwfF1z
         zFYhL1OYc0B6HLsy6uvi1Vip/odfBnsXQDCwdMjEM57RdNfYY4yaYHs6yYdoPtYCic6p
         bIin1199KkATYUXVtT9yp35QBRp4dQLSXrOs5BMzdjYGZd5qtR+KIvhXf/u/J1ycxWMB
         Fdbsznrun5quo0cgmWjs2fkCc0CFt+oP3HRhnjXEA+HE+GzHSAgsYgvdbeXW1bsggjYF
         SW4g==
X-Gm-Message-State: AFq9FYKlUanbC4kmVqZgz6wNFRDpEdLCg0ORkn9JgRmGgv9twPzSNUB+
	DbEeL7r3gP2kvknEoc5xtUrHhSpcONqv7udfNLyJucbfFEQLOiJhazdJQbVMSpw+GxCMkMGvIWo
	/J1c27/dpu3DERWRUGEpZc0ejIQSFfkoum9M+ZefrzUPUYfZy1auvKZUB1JDLld9B6SAX
X-Gm-Gg: AYBFou3vNJAJ3cWbMuUUZM5Bl+vr3GNGPGa21mpdAohjodeAtKbXgxTtZoOxS1trSPc
	JXTvdU7Nps9z/0floPg2EhiLrRJHIr3mezJmUn2AburMY8ZSwWS0/Et5V7VTD1Hyxt0A29z9/NY
	KUjj57z/1nVJSsp6v0sAN+h/HLMd40CXoIj16+DkLLNHOJ3mZj7BCkn0JqUuN6bAENbFZDCgbaS
	L/2dcutWAwuHl7A3GpLsEAR06vWVcg4Z9OBBIUJPpmUvtCx7uqgqXdwEKsuElCmUi1NgLd7bxr8
	IsxM6QITE4ATHDOWSVRH5YUkKvfOpmLNPH3EY9f/B9VQKlXYkBNpVtBH9mo4wW7F838ydjtQsbb
	A7PG1BqAYuVZRwWsihdfGGiZVtrkKbcS1T2IY3dJiIwj6mXhX5ypEidzFXsppCA==
X-Received: by 2002:a05:620a:1a13:b0:93e:be0c:681a with SMTP id af79cd13be357-93f29d7b37bmr1121574185a.55.1792396736512;
        Mon, 19 Oct 2026 00:58:56 -0700 (PDT)
X-Received: by 2002:a05:620a:1a13:b0:93e:be0c:681a with SMTP id af79cd13be357-93f29d7b37bmr1121571885a.55.1792396735896;
        Mon, 19 Oct 2026 00:58:55 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:d01d:2002:4b7d:4c30? ([2a05:6e02:1041:c10:d01d:2002:4b7d:4c30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfe4d2321sm25461692f8f.19.2026.10.19.00.58.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 00:58:55 -0700 (PDT)
Message-ID: <707c12dd-6e03-485e-a913-d7f0c719c126@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 09:58:54 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 4/6] reboot: extend psc_reason with power-on and reset
 causes
To: Faruque Ansari <faruque.ansari@oss.qualcomm.com>,
        Sebastian Reichel <sre@kernel.org>, Benson Leung <bleung@chromium.org>,
        Tzung-Bi Shih <tzungbi@kernel.org>,
        Guenter Roeck <groeck@chromium.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Matti Vaittinen <mazziesaccount@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
        avaneesh.dwivedi@oss.qualcomm.com,
        Umang Chheda <umang.chheda@oss.qualcomm.com>,
        Ulf Hansson <ulfh@kernel.org>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Bradley Morgan <brads@mainlining.org>
References: <20261019-pscrr-framework-v17-0-69ea6cdf4731@oss.qualcomm.com>
 <20261019-pscrr-framework-v17-4-69ea6cdf4731@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20261019-pscrr-framework-v17-4-69ea6cdf4731@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: -obGf6Dlcp4xO0tio3fvkwPH8qiJ-tvX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAzMSBTYWx0ZWRfXxQIa9eBye9jJ
 rn23x6q7I0nsg3jJHTbXdAdFkS9xwpne9QyyDSFZPcaZpemz1wBFKwRMZR+T994dwy0j7c0UqH4
 vIMiDI1ydvX352wlrwPIdaEHLxmNclQsDa/tJygNEoFUfjM/JXKA4bpt6Xhyg8MrEmEu4INZNKu
 H6MV+TYu2uE93Po5YxpKssVyGeZPGZIQjwz2Eu2ChyM8so3pLv1iPnqRSVgUkJsnzV/Qrca+Bfl
 QSIm3bospqQXBrFFdi+y+ZA5MW0PnPgD/XJeU0gIEvLRbedRl//b6QKwfP4kFxzvcxAXswfyn6n
 /D+UjCKXFwPGMmCb6JyOFJO0tzYvRemHpPLQ2yxGIZMXmtdDi2qNy9a6+USb82hlS3AdiKgdRl6
 R20hNbBfv1+u6DSQVrCodWmBsCD+K702Nn9NaoDYfUzZoqywWzaRTYvwwnxtIVk0UKJrcYvlAUU
 gQYCPZWNOrEKtjzZHxQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAzMSBTYWx0ZWRfX9u5m1Z9YB+0f
 jk0Ov6w1Nv1hTBSrjY3ZkyZpq80F4+4lKxc924222vjnGZSx25RBZxx/R1LtSMSF4N+ogo8IsIj
 Pw2SngnOlsaDKKP8d1hEnxsTFklByHY=
X-Proofpoint-GUID: -obGf6Dlcp4xO0tio3fvkwPH8qiJ-tvX
X-Authority-Analysis: v=2.4 cv=OaANnRTY c=1 sm=1 tr=0 ts=6ad5cdc1 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=pGLkceISAAAA:8
 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8 a=-fWPkMAOK6Nn3R5z3UIA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 adultscore=0 clxscore=1015
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190031

On 10/19/26 09:38, Faruque Ansari wrote:
> psc_reason covered only the protection reasons. Extend it to mirror the
> full POWER_ON_REASON_* vocabulary - power-on, watchdog, software,
> external, RTC, reset button, CPU clock and crystal failures - so a
> provider can report why the system last powered on, not only why it was
> shut down. New values are appended to keep the existing numeric ABI.
> 
> Co-developed-by: Oleksij Rempel <o.rempel@pengutronix.de>
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>
> Reviewed-by: Bradley Morgan <brads@mainlining.org>
> Signed-off-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
> 
> changes v16:
> - Add Reviewed-by tag from Bradley Morgan.
> changes v15:
> - add a static_assert() tying ARRAY_SIZE(psc_reason_descs) to
>    PSCR_REASON_COUNT, so a future enum addition without a matching
>    table entry fails the build instead of silently reading a hole
>    (Matti Vaittinen)
> - Add Reviewed-by tags from Matti Vaittinen.
> changes v12:
> - new patch
> ---

Reviewed-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>

