Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE6146D2A5
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 11:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785323521; cv=none; b=WlNxIYex9Wn6rXT/SRWTFeygVvUUEOs/0LaJ8WmtaEbRkla2toTPCaNWzZ2mqaAh6iHvHpGzKlW6kC+24l47DBB8hs31Y0krwMTv5tNKqVY0VY8Zu/Vjo+lwmcyx33uT6S5bg4at7WKtqXhf4zHZG1Natug//t4KFwweiNydFL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785323521; c=relaxed/simple;
	bh=F5TkoHP4ysYrGn2T9rCEX81ikt+BoCO5ZCcN6FhUTjk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YtIBtVYmA9V9eoSPfYC4L9SzjqpzgFolrn1z8dTWD/iDvP845bBkbDY7lAbYUYmGmAN73XDrcD+wlxUt+anDPDnFq7bgPBExQSL69OGi/FpCij7FFcv3ChQ6W7gfgxuPSwWmcUoNhcdL62xwmrTCG05JyOgpxILAcHtFmYd49uQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=frZl6kav; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ECkYNNgS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="frZl6kav";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ECkYNNgS"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TB7GHP1159014
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 11:11:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Fggnl1LDAh6PfDukmLgSUqpHpgc1JT1Q+oz06t1ZUfM=; b=frZl6kavX/PdVO/u
	8S2CcwVNHu4hYa5dcnAxzX+fJjOGNzw9ZKUdHlVdnBBjnmcUMYoS5S/RmBAMVgdb
	1tM2PEYv/SW/O4q18dl0BPObhKIccUZHOPCqsS2THjTpKloL/YY3VTaEp+kuUdNv
	SizF4LnEUSmacJeMZbOsYgbwmRmk1hjpyyb8C5PHaMl03ZwNtAHZPFy6HbyryuoR
	HNOKVRXrfu675+MeUqMvD4/cxn1GdKe4HpQBY9oG+a6UBx4P+BBxWLrePF/cyYnD
	NtscfJ9oWQS0ZawY2cxmUuO+lqoWdU83Dw/cUxMrdA2fePp5P5GV/7BAuiHEHPak
	2B4qdA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqbn1sayt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 11:11:58 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-930edae07a7so14186185a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 04:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785323517; x=1785928317; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fggnl1LDAh6PfDukmLgSUqpHpgc1JT1Q+oz06t1ZUfM=;
        b=ECkYNNgS3ztTBGyfsUnrUD7I3ufvK9yIjzvZVUwlryl4q9q3BD5OhzSW2aNgZRUE5b
         hwmJfJJ9wIJf2baT28VTdpj038AUyW0Tn0E2m+pkCBfDbjD5SHB4/VyNyyapzyCZePgX
         FPfdmKmcUmJk/zEqELll+YU+eP5P5WGLtjDfILksYzr/Pa8PFjsQLjolNZoHu6CR7ORb
         H6/hx4XsgIS36QXjtzxQuRZpCta+oy8IXxADk/C9vKNBKBDvCpinMhKcauN4GQZVQRq/
         DmTjXyB3hsiSYeWpXo8OoIQTLpuaZKo2Gd9oWOWkUjv0KewTM2UFG6FVO3ij8EGbt6sU
         cuqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785323517; x=1785928317;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fggnl1LDAh6PfDukmLgSUqpHpgc1JT1Q+oz06t1ZUfM=;
        b=SbXqxL3RhbOerVnE3JKjSW7UTW0KkCDQoiijjJCTds7zSEyl9OU1QDQMLeCxRBHW49
         v8mtiqeVwH9AbSrD61yzGWnF0uQ7g6iMseJp8rJOzGHEUE0nm/ioLBCxJ0pfBydPku3b
         rrEmL1UWK5SNqlF+AOlJOidnctq4n+r6zVPPrcvuybdksTRl7RTwzoTAidfWjNAaGZU2
         Og1GcIZGYG8uVmOut+6hv6NVLstKh8CDN00e+0NOZLey8xwEj/KvGco+xCxBctcYvR0R
         2up8ZfvXDo9STgL23kBKWnZ1wLg6qkpeRrcnxdFBb8IG6cuf6K8dJWgLjlSxFJWrENtX
         t/PQ==
X-Gm-Message-State: AOJu0YxtuZzfXDckNoPaC2feDX2T4dbClB7np2KyEJ6jwC2r3CboD/0R
	VJEL53Odkqb6GCWUu8YixBG1DJCr6b0czMF8dOwDXOlRf2No4vFiEyOmILYr9f/O/r9GyNFibW3
	eKi3gPu9eWc18BUbnT1jlqhypnASz197p46plyXIKa3Lurxuh6oGiIY0fAKPBR0R0ANL8
X-Gm-Gg: AR+sD13rWYWUFRxds4oowR8abylWPD0EU7zEF6xuH+yXMWq8Bwo+4ghc2f4jjHVrKo8
	75Gb3+S6wpURT8IJVXo1uOUPpa4sqGkuzu0CI02GfphneecOMO80Wel8aDzXnEXatDUVzBoI2nX
	t45UHS0cyTBR0wX70WDji3/SmpE2Fs5G75xtZBOoDxPVEhqWK1GHGsC0Yc85A/y/1ciDVVsaHgz
	J8xA3e9PG6s8MuEh8SGCeU5tetphl2YXsK4a5XWXfLfRpJWREkKDTqqjoPItdC/0Xo4zBknYrZR
	feHYeoZU7RCN+r5OOH76zDy0yIT8RJh7CnxuGHedoVMauAYCc78Fa1Xi+K+77sOixoZLhbBtRmj
	oWgqX6olbxokNN4HIQEMxypy2
X-Received: by 2002:a05:622a:15d5:b0:51b:ff78:f229 with SMTP id d75a77b69052e-529d6feaeabmr53202651cf.5.1785323517491;
        Wed, 29 Jul 2026 04:11:57 -0700 (PDT)
X-Received: by 2002:a05:622a:15d5:b0:51b:ff78:f229 with SMTP id d75a77b69052e-529d6feaeabmr53202011cf.5.1785323516876;
        Wed, 29 Jul 2026 04:11:56 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1f83cde4dbsm101887966b.15.2026.07.29.04.11.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 04:11:56 -0700 (PDT)
Message-ID: <e3394d91-ddab-4983-92b5-714d5bd5220f@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 13:11:53 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] platform: arm64: qcom-hamoa-ec: Retry I2C transfers
 on NACK
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20260728-ec_add_more_commands-v1-0-771abd65ee1a@oss.qualcomm.com>
 <20260728-ec_add_more_commands-v1-6-771abd65ee1a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260728-ec_add_more_commands-v1-6-771abd65ee1a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDA5MiBTYWx0ZWRfX0hGiebMP1NJW
 eTLt+gxLC3AKDpB3p1zH7DBDavD4i11ZhzRYeIulw+YrMerl2ZhpJrFj9nBt4B21jms6K9Id98i
 ajIb3G5xjzscYbtzj7Znmq0by2vFdvQ=
X-Proofpoint-ORIG-GUID: 01A4jaeKq8cDqDB99bnC6l7c23X1J32X
X-Authority-Analysis: v=2.4 cv=csCrVV4i c=1 sm=1 tr=0 ts=6a69dffe cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=czGEQ3qvJAC79WJ7zqIA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDA5MiBTYWx0ZWRfXyx+kRT/SqoBq
 +w63Z0k9/3trKAg63t0q+6U5Tpoyqfn7nJIJw8TIibx92cXisrlPsdW9k2A3kI/ckJvG9A0On8g
 hmEQMfvPK+rBxPEPbS0+EmWR18TOC5udCi5iualbPiMH1QvmfatJUPCelOYPcTiJd6BJV7mtIGw
 vz+mES8Z1ydNe/F/fjat+x5gdm7nMm+pXrrc4HP3iwO/jaXlMB+pv/49+LdWd1XTVI/4WpNe+CK
 zC69PbQc5MQ9GsMtW9bfbkVtAeHoQVKrZamTS6zHtE9QPZDNXnouofkgq9902SbSGLIRqPLFrSW
 Yo29voStOpgr1SPZt28VosHTW6S7zd71gnx8NS/vsrheOKse/skTkD7IcWdLbjUmaGvWnS8mA7X
 zsuUseAbQTdvM3rDhWqikqIP12pl6zqzLaUhzJ7qp7IhoJYWPRnL5xkB4rYwLpCEuHtjr0xZdqh
 OQlp1xoSyd+xNV0eciA==
X-Proofpoint-GUID: 01A4jaeKq8cDqDB99bnC6l7c23X1J32X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_04,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 adultscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290092

On 7/28/26 7:44 PM, Anvesh Jain P wrote:
> The EC firmware NACKs the bus instead of clock-stretching while it is
> busy servicing internal work (e.g. right after boot, when it is also
> emitting a burst of SCI events). A transfer issued in that window fails
> with -ENXIO even though the EC is otherwise healthy.
> 
> This isn't visible with the smbus-only command set used previously; it
> surfaced while stress-testing the new fan LUT command on Hamoa, which
> issues raw i2c_transfer() calls more aggressively and is thus more
> likely to land in the NACK window right after boot or during an SCI
> event burst.
> 
> Retry qcom_ec_write() and qcom_ec_read() a bounded number of times with
> a short delay when the EC NACKs the transfer, before giving up.
> 
> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> ---

[...]

>  enum qcom_ec_sci_events {
>  	EC_FAN1_STATUS_CHANGE_EVT = 0x30,
>  	EC_FAN2_STATUS_CHANGE_EVT,
> @@ -233,11 +245,20 @@ static int qcom_ec_write(struct qcom_ec *ec, u8 cmd, const u8 *data, size_t len)
>  	msg.buf[0] = cmd;
>  	memcpy(&msg.buf[1], data, len);
>  
> -	ret = i2c_transfer(ec->client->adapter, &msg, 1);
> +	for (int i = 0; i < EC_I2C_NACK_MAX_ATTEMPTS; i++) {
> +		ret = i2c_transfer(ec->client->adapter, &msg, 1);
> +		ret = ret == 1 ? 0 : (ret < 0 ? ret : -EIO);

Please break this monster up. I know it already exists in-tree, but
since you're moving it around, we might as well.

Konrad
