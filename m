Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C609635A3A4
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 06:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787552392; cv=none; b=j51rZOzM7t0fiqxOSW3PRkVyNI5gqi/QtQqqyHN9NFyNWjISOKtu+/8pcWasI0Wa4VehR9tBwmEZF7MxUtbXxzD9cBie33N2ZQzXCGNEi7lbHxY8h5/cG8GV2hy+gRYmTDt4zuqP4DHdcI7StEcNJ8fq+V75d/NDIiI7JaOck98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787552392; c=relaxed/simple;
	bh=zhci3GeC4y3P5A9XMBDTzxBHiu9XQ7vIFjySCKubQng=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j8PLjZxWD7QviJ9Oe98I04vj768ajnVzsvG/rpbyJFigLPce4crDe5G3F1vj1umHVYMuY/BE/pSlgwuVAx2ijTp9+4bX0KPvDXW39ypJL6hQnYtlYR9KgwfY8/urPIy6SHzUX+aeflpOu8PZNYk6p+Eje8baIOoLBXU/lgo+gMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ovXEU5fq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U3f2uO4x; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ovXEU5fq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U3f2uO4x"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O5RCNJ3066900
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 06:19:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oPNyJXSmM754bjM4+PUtlpBzKwKkj7QX9fCPtPpbqNo=; b=ovXEU5fqBkRByt+e
	t4drYvpoSdvP6KAbR709xhfrW2/3FAJDVfaHrFb4fZv2oVpOxqndyjjRbAqXvusK
	e9bgFAdtjY1UQeFXhF8+zT/iifPh/649FalyqzOsgxX2u0vWLDX0B0lkBmEq9sd+
	KpFePwjy2FpO8IFzxyhy2qucoxTrnUEE6XY7FOF5mrjz7sElVk8AbuBonRAvt3/7
	2f6Dxb17ORygVAZ13KWmNuWFAU+YlAdTNiz2mZf8bcHmJ0wMk2MFgMALV0kOogHU
	KERRIoNsmtbQbPUV6wEka6/4Miw/wnqaWKU6NenUl0soyKXwaQHRN4V2DGf4sSCn
	kv+Y6g==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g88jph44j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 06:19:51 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-ca8aee88725so5452093a12.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 23 Aug 2026 23:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787552390; x=1788157190; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oPNyJXSmM754bjM4+PUtlpBzKwKkj7QX9fCPtPpbqNo=;
        b=U3f2uO4xwH52LXKAibILMvpGUkORR8fdq1XcPoLJS5lnj6kprkM+M0E9S4T+wZdi1H
         PQJiM/1O371U4eq4h6oApFEVXvYKKjruTUoEeMXik2Obpuk//XcUHOcs0rq3oerB29aM
         VsxxeDm2ClnhijF494bQbCJoT/xaz6k+uAWiFYoeEXqdayZpWdVN3HVRIl8tEr6n1Hsx
         W6q5LrjOWPZSIgCue8ZROGFENJlwZyz7AOqBc+Hpz1WV1XmirSYjhEBNcxyTN/BKN5to
         Sa0AtQmZhEfgR8mYZv+xe6gJ1kmmCKB3MnDV1IOWuNXEp5ZKKsMpvyG0NVnFxJaglyIq
         b7OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787552390; x=1788157190;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oPNyJXSmM754bjM4+PUtlpBzKwKkj7QX9fCPtPpbqNo=;
        b=ImEbCBOEYUqiL9OvXaLeA3SB38N1mHgZRmttt4uhSuQAMMIHUEqoGmMtH41xQjSCnc
         OwdBxkYGAALnHEXUIlxVzf5Y91aaMhSYbU6spvKeNpFlLG5Hldvbn96krfMnTPBkf6dz
         2R8bSa+zwpFJkB3vuYT1c6hekUq9tLrKaKTpzVgRpw6RCxG0xcSYeIDxiS4D20HVU8MM
         W5B9BotwBva9WQVLkYGDgZ1zPyRolNYgGBQEItRLBaCYB9WZNHn/DksKg50Uz3tvWya4
         Dd5Zc7uaOQ12fInVSKZraPNZ3omnAPtozkDlB00gomQmbBvFDALfgl2NIxdr29gtcD/j
         WraQ==
X-Forwarded-Encrypted: i=1; AHgh+RrIM1bdXkSbIBcZEGDGfu1+yIEH/EDtJFcZfgcfehIViUwFSe7N/Tzi5UXV3kOwIF9xTiMUiB1/8tBB28Uh@vger.kernel.org
X-Gm-Message-State: AFuF++mS2rLmzd3W9Ett1Q5gCxxCu7P0OkGk+SJGL2Lhx6TlEBANoAgu
	hN7TxDHRGj8kY8uhe/UfQxjbSXxC/h4sY6uwx3jpABN9UDwqcQ69ImqSNJE+5Nu8h9bG3QMwDeF
	UR5dqug2SJ0AtYXLqwiRPsh4KHfhJmNmJEAHyWR/9brnLhWuADYqlNZxiexqivC+pHD08
X-Gm-Gg: AR+sD125M9rvFUWXpbPhZdX1pP07UyDCw05s2a0z2kTjykXvsqrI68UFsL4OwTsRvOH
	zDI65F36oktYeI/q4v4ywDGCG2+oxYtBt0BijKI7qkxOnNQiIZa+xW6jrL1NjkMvY+lHokWx0kl
	PBZy3CRq7gQr2i4FWzSnykqEW7kWhVuaMHVcEsUVej/wP56qNmoXTHbAosJqY8zV+LTm9NsNm+8
	p9qyPH285c1t7KqiYTUQQzsTL/uER6huS2z6uZNZfqkjqzgEySdx9My2dufvISjaQwXl/Mu80Nq
	DKoxOssgmhd9cAefRfrkRC8K2WI53uLoHpHAOEN0ObP0EoS6KimcEwAzd+cyfMFZ4h/SuA1YbCW
	aerX3xU3hWssbj5CUP5s9NQw4IC4mgCQQOao=
X-Received: by 2002:a05:6a20:3d94:b0:3b3:26aa:5455 with SMTP id adf61e73a8af0-3cd300f9e23mr43810491637.13.1787552390331;
        Sun, 23 Aug 2026 23:19:50 -0700 (PDT)
X-Received: by 2002:a05:6a20:3d94:b0:3b3:26aa:5455 with SMTP id adf61e73a8af0-3cd300f9e23mr43810425637.13.1787552389918;
        Sun, 23 Aug 2026 23:19:49 -0700 (PDT)
Received: from [10.217.218.158] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc199e72326sm682881a12.32.2026.08.23.23.19.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Aug 2026 23:19:49 -0700 (PDT)
Message-ID: <29719c5f-757d-426e-94ca-c221f45c00cf@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 11:49:44 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/2] i2c: core: Add i2c_update_timeout() helper for
 dynamic transfer timeouts
To: Aniket Randive <aniket.randive@oss.qualcomm.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Dmitry Guzman <Dmitry.Guzman@mobileye.com>
Cc: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260813-master-v7-0-3f9010cf9229@oss.qualcomm.com>
 <20260813-master-v7-1-3f9010cf9229@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260813-master-v7-1-3f9010cf9229@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA1NCBTYWx0ZWRfXx5Nh30PL8Pt3
 A5QK/ihhvqbD4DbW0tf7VHVpE+zyUGMTAvtTpeLnaXM0jo+uzTO8aDFG39JhXgeiroXskKwu2Bm
 ATHfVkouvFQxttBi+VnV/tpVa038tsBeV2l52dI5Aq20/yfxWwI6AhWwySZUQveKO2oMN7QIh7v
 8naQgNCR0DQCNgBDjJRl5ohyMlTalUhi8WuLgBg7smwKrWFiy3FPAtyX8YJuISEfQx6no7PlZRX
 EeZWrHJeUd7DiP/Ez1EJhNwd53GJNBzyqw9s1vHASxFu/wdFjMZjQiTrMAfUmVmHQoGkHlPTkvp
 6mZ8nwEyYWdCSgIjtuOhkfIsy13C61hFW1mhoMlQHVyqCWWOdoxq0MzbncM/ostOe6EfmC6rJBD
 4VoJy1viIgp2ZZCv1PP+VK3zIPpcrrBLojr1B/3PIb1fy6wox1EaRePv6wsiwRxBceUCDwVnNHR
 4l0ALZKzg9LWwCPvyUw==
X-Proofpoint-GUID: FiWR4tdiufCy-0jve4RK9x7cMUb6rGBK
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA1NCBTYWx0ZWRfX/GsEuMZaTB2j
 XpbYj9tYpzVw+zTodVwdvdq4ZzZEjTOKJbcZJBMVDTwUMr3NrYDr3gd1Bf+CDtnZAA8JNJ1pJVv
 67qBHY7t5/ZtvPIguFdM1o730z3+CXM=
X-Authority-Analysis: v=2.4 cv=Xey5Co55 c=1 sm=1 tr=0 ts=6a8be287 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=KUGX3CDIF-uJIBJLYKwA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: FiWR4tdiufCy-0jve4RK9x7cMUb6rGBK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240054



On 8/13/2026 11:15 AM, Aniket Randive wrote:
[...]

> +void i2c_update_timeout(struct i2c_adapter *adap, u32 bus_freq_hz,
> +			size_t len, unsigned int safety_coeff,
> +			unsigned int min_usec)
> +{
> +	u64 bit_usec = mul_u64_u32_div(len * 9, USEC_PER_SEC, bus_freq_hz);
let's validate bus_freq_hz to prevent from 0 value in case of any 
abnormal caller.

> +	u64 total_usec = bit_usec * safety_coeff + min_usec;
> +	unsigned long jiffies_val;
> +
> +	/* Userspace-configured timeout always takes precedence. */
> +	if (adap->user_timeout > 0) {
> +		adap->timeout = adap->user_timeout;
> +		return;
> +	}
> +
> +	jiffies_val = usecs_to_jiffies((unsigned int)min_t(u64, total_usec, UINT_MAX));
> +	/* adap->timeout is int; guard against signed overflow. */
> +	adap->timeout = (int)min_t(unsigned long, jiffies_val, INT_MAX);
> +}
> +EXPORT_SYMBOL_GPL(i2c_update_timeout);
> +#endif /* CONFIG_I2C_DYNAMIC_TIMEOUT */
> +

[...]

