Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793110087;
	b=zlSs2S5Otuy9nwKU14nlvM1MZmOLnEeNdaFlIaRoubscQOSFTG2/l5aINl5WKJhxlkZs
	 7gigA+60a3NKUXTsuuBg/eJKNMrg84QwD7pV+7JnKaTCe9t+eMaTKiap5RUg//vzy8exi
	 0/vx1lStERtNQIM3eLpQlWxkepRBIbbZZjLWBmehnXfXjPvI5AdunV91IrdlvcEEr9kMN
	 Lmzpl0XcEEB1MN+WX+b/SubyDfBRsz/o1R8Ztldzc17lvmhc/IfyJPokKXFw4nZ+80JTv
	 LAUYCCn3BGUQPWIEoeFh/MGH0oBZEPDsSQ67xlor9MpZqi1WqzbfCZFKLBInr1RYRUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793110087;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=c1Z/CCgCrrgHYNEhc4GFXM6iDrjf45bsGeiV5sYFsHU=;
	b=0Ay6z4UwR+M4mhurzdRck9BZbnfS/wvb+tCFPC5qFxWp7cdD/zjtkKpuV1glCO9BRlgD
	 6Ub0J7l65eE/3ElWZckujoqZ5zV435j9s2cg9GE7i5bCA/qmVhFIxQ8s7nlLfCNc3Lr2l
	 /zi6fTVFKz1r9lYkCtmeB3SRnoMn4x7wlORZoII6ndZExrrPx8dpxs20puD+6hcbfoMzW
	 UiXG74xqXVVWaxqi4Asn7FGti+z9KUZ4bNck3E1aAN60uBsA6hj3WgFo0bY5s6DQ8Yhkt
	 SAd9ZzGALABEKE+fgsSe8vnMqXZ52bcWPHU21ZLYuXQrb3o+AdIU915JKylHzq9kkeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CJyGDv1k;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PGdaW+61;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCBAE606A320
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 14:08:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCBAE606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CJyGDv1k;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PGdaW+61
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RDo4jM2881609
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 14:08:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c1Z/CCgCrrgHYNEhc4GFXM6iDrjf45bsGeiV5sYFsHU=; b=CJyGDv1kfrczv5x+
	zzdeblWPnV2nNUKN7sdqN6M4N4qEmTYV7S/skWsonIPJw2mtEWnbh53MF/gQHttU
	tVJtu/ehaMmUHUTq+Y1C0VCMfVHt/pbflC27WTzfHK9C+sxvfTMIgthUvVSWkFas
	xvKYTVBOdG9uCNpiB+nrmaMdctJQ/oaVj6zupB8I+saDbwR+sgCwccv/M6WDq6DC
	8gF6HPzAuijyJ6ighWZntHCj3WWB0WMHYHLBx4yuA0eYEHyaQY0ObD8ApJuxeX8O
	OMHMF4KJZ6uuPrPTaczxzvKTKa1+ZVrygUkJjtzpNpGPoIeh0muNwt2w+opoDOGf
	7pHYLQ==
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com [74.125.224.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjjbtang9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 14:08:05 +0000 (GMT)
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-67935d0ddcdso7403240d50.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 07:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793110085; x=1793714885; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c1Z/CCgCrrgHYNEhc4GFXM6iDrjf45bsGeiV5sYFsHU=;
        b=PGdaW+61CvtJ6Ew9w9m2fHhLsj4jOqZHtO/F8DVZgYIjIKo6EzOQPDyGM3MrDt8xLv
         KiwOy7+sRI7UEfYamEl4bn/ztsQulvj3b9jOQE6HdfyQNsZ9sBEQOgbGc2eJSW/Eog0p
         nrAa0tP1FXHiXP+zYngQd+Bph7iaeQ9otsoKkD5YmiHvZtqdWzxNcDkN6qNd9nf/z57D
         en4MTJiyb0FI+PCvbT3f0tC67e4KaOcRTqR8SYFCL2Bghr9JUkhvnu7ufZ9TftWhSdyQ
         XVlSqOjdkh6w5qwB4eCClpfeo+fdXDtEiXMQbQuS6R4LqvbxptGwuCnej5pI01iZKlqi
         P23g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793110085; x=1793714885;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c1Z/CCgCrrgHYNEhc4GFXM6iDrjf45bsGeiV5sYFsHU=;
        b=zFZHcY0CPEv8OCQg0d99raLRFVnvfKKe5Me6jaleNJ6X41vxCMRG29e605x80EU7bj
         B3lMU3k8Oc2pU+bIXGuBBvgZ68gpFsg4oF0+S/PWptKKPeoSZbwdn9apnzYFDOGuOf5n
         PNU8RXHwKCrNrmKy+/RNA4AiZzmh8AMXW+ArfcfJWz9x8zqQ1BOZDZ4OsdYPhBmT6oKs
         s8riPvD88hOWhW1Yq7lsWwgWyc13M5S7mL8xMvo+iRCO+wZjkHacsIi3GZB3UiDWWlHQ
         U8jgYiCBLTZfonwVbuqfGPGYL050gC1/x7O/cqY0tZ9JtCC7r356I1jgejHUObomXNvE
         6Gkg==
X-Forwarded-Encrypted: i=1; AKwUvBzomir0/oITuEGcBCTiIYG/zTh+qGOwubHiECjKSEee6K1ziUPMCnT26WmX+KKZOLc69SzqCvV55+xeetTx@vger.kernel.org
X-Gm-Message-State: AFq9FYJnbOvJXn0Q7DDfa941gNI+r+nQC/agDu+EDc6boBMivXMb2mI3
	ZvG/dChVpZzf0nM6p4rW0q9GMJ/E+NYNMqvsPZgBZ/uaiqZpKa00J8luVoixJMJvjmMXwqv1v77
	ZQMFlECZkUvVWAy3us/zD6r1x8rKuD+ChPbgcKrtnf8CpBlwI7yasekIAOj33kr2yxbp2
X-Gm-Gg: AYBFou0FIOLkjLL9d8dxYEAH2YpTqbgCQ9/Dr9zTbZ5Q8FJWv2/a71TeJ4eX5omM4UQ
	h73z1O05EdHY0AGn5TdMD6diSIfa88i+5VuT+cMtDhXMKY6L+jH2kVv03ovDUyeA0bifYMKZ0O9
	f2jyXitys7+J0cRjrOTKzZJkYi5isSYmhkGgVHcOzRJQbboFHBTErMBRGE3DTlpWwCahHeY9hZl
	4gDA2vqU8id63DUeY0ZGOoV1HvDtnoqh0Vr61jxLxo0cw1VcoYuHggs5WUgTNoBGckQDCGasPTM
	qx+fcNUt66Kkef84w4923QeWXqfm8k5oh7r6Yr4W4N/XnzS8L5HtHkZO+lwmMSzDkmTlG++w2or
	bUfYF1dNvRUJohmZkWYoPtlDz0D+U7m0BTA==
X-Received: by 2002:a53:ac8f:0:b0:679:a650:a09a with SMTP id 956f58d0204a3-67a45188986mr7162440d50.6.1793110084896;
        Tue, 27 Oct 2026 07:08:04 -0700 (PDT)
X-Received: by 2002:a53:ac8f:0:b0:679:a650:a09a with SMTP id 956f58d0204a3-67a45188986mr7162412d50.6.1793110084117;
        Tue, 27 Oct 2026 07:08:04 -0700 (PDT)
Received: from [10.217.219.98] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67a7a07e163sm127917d50.8.2026.10.27.07.07.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 07:08:03 -0700 (PDT)
Message-ID: <acac5cec-6fa2-4465-9f66-a5e533404978@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 19:37:57 +0530
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
Subject: Re: [PATCH v3 2/3] i2c: qcom-geni: Add bus recovery support for FIFO
 mode
To: Aniket Randive <aniket.randive@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: naresh.maramaina@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <20261027-20260826_aniket_randive_oss_qualcomm_com-v3-0-7f2a6e572de9@oss.qualcomm.com>
 <20261027-20260826_aniket_randive_oss_qualcomm_com-v3-2-7f2a6e572de9@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20261027-20260826_aniket_randive_oss_qualcomm_com-v3-2-7f2a6e572de9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA1NiBTYWx0ZWRfX/laqa9m1ASjR
 nFH9MKZiPnItnf9VuWyDQDtLjWKUQym6Qjrg8OnUI3EES9Wl6HjtY18bIiWPD+7BrdBaMBh60Qw
 6iYEt8qPuvmthuuMjthCH+tbJLFNbOg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA1NiBTYWx0ZWRfXxd30eEFYcJmH
 OA2qsgVNxS00vnRmTwoCYLMROdpWhLaif93t5SQdBK/tUKBjfiKbYOeHpZBiwvd9zDC2hnZQRMt
 hZrxKG7bEOgbnXbbYJb1TdbwSBg5m3mhvSMCEjr7SQZigXz8q1ujjk7vRuPUeCLA3hdSOwixlOH
 mfXqihpTjSDD/bHmX9JHOV6UN6P2Ax42DVAfZXxTxSpWsebQKIC0c52mVzuZWfwPo9o473tMAIV
 yMv8dmD8DW6iZIbIQgQeJd+/8LCHI0z4ie8CqY8Pt445vfHUoNPODLD7qI77gEhFyLU0QyHiQq3
 VouJtFvDmVoIlqpUZx7dXvXa3pn8RH+KDXjYTiB3RQYEYkLHju7srX7h9Wsx32VVb8InoaCZrbW
 EW3/6lYNC3IW2bhkHe26np9Cge/vkWbKn8BRYVBo5c/LZ6TSJ9zgDgi/fCXo2nmdWj3NOkaZuoR
 uyBOxv7vCX3KSIhlU+w==
X-Proofpoint-ORIG-GUID: 1sQ2MjIFYJrbhMxnmqaylq0X5FRdFbSL
X-Proofpoint-GUID: 1sQ2MjIFYJrbhMxnmqaylq0X5FRdFbSL
X-Authority-Analysis: v=2.4 cv=XaIcX455 c=1 sm=1 tr=0 ts=6ae0b045 cx=c_pps
 a=S/uc88zpIJVNbziUnJ6G4Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=qTkQnuk-FKC89O0zAyYA:9 a=QEXdDO2ut3YA:10 a=nd2WpGr1bMy9NW-iytEl:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270056



On 10/27/2026 10:43 AM, Aniket Randive wrote:
[...]> ---
>   drivers/i2c/busses/i2c-qcom-geni.c | 127 ++++++++++++++++++++++++++++++++++++-
>   1 file changed, 126 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index 60b6273f538c..d9e86f110ae9 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c

[...]> +static int geni_i2c_recover_bus(struct i2c_adapter *adap)
> +{
> +	struct geni_i2c_dev *gi2c = i2c_get_adapdata(adap);
> +	u32 ios;
> +	int ret;
> +
> +	ret = pm_runtime_get_sync(gi2c->se.dev);
> +	if (ret < 0) {
> +		dev_err(gi2c->se.dev, "bus recovery failed, error turning SE resources:%d\n", ret);
> +		pm_runtime_put_noidle(gi2c->se.dev);
> +		return ret;
> +	}
> +
> +	ret = gi2c->dev_data->set_rate(&gi2c->se, gi2c->clk_freq_out);
> +	if (ret) {
> +		dev_err(gi2c->se.dev, "bus recovery failed, error setting clock rate: %d\n",
> +			ret);
> +		pm_runtime_put_autosuspend(gi2c->se.dev);
can use goto , jump there at exit with ret updated.
As 4 times i see pm_runtime_put_autosuspend().> +		return ret;
> +	}
> +
> +	if (geni_i2c_bus_is_free(gi2c)) {
> +		pm_runtime_put_autosuspend(gi2c->se.dev);
> +		return 0;
> +	}
> +
> +	/* Bus clear cannot recover a target holding SCL low. */
> +	ios = readl_relaxed(gi2c->se.base + SE_GENI_IOS);
> +	if (!(ios & IO2_DATA_IN)) {
> +		pm_runtime_put_autosuspend(gi2c->se.dev);
> +		return -EBUSY;
> +	}
> +
> +	ret = geni_i2c_fifo_bus_cmd(gi2c, I2C_BUS_CLEAR);
> +	if (!ret)
> +		ret = geni_i2c_fifo_bus_cmd(gi2c, I2C_STOP_ON_BUS);
> +
> +	/*
> +	 * Recovery succeeds only once both bus lines are released. The bus
> +	 * state is the authority, while a clean opcode status with either
> +	 * line low is a failed recovery.
> +	 */
> +	if (geni_i2c_bus_is_free(gi2c))
> +		ret = 0;
> +	else if (!ret)
> +		ret = -EBUSY;
> +

Please simplify with ternary condition ?

> +	pm_runtime_put_autosuspend(gi2c->se.dev);
> +
> +	return ret;
> +}
> +[...]
