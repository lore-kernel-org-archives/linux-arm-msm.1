Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82364330666
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 05:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786425202; cv=none; b=BmqSXiGbMqk0K7YpHuGCfehaXJYrY/NTvBcEXyZ4b++pBOwkIJvZL2j+2DDn7OpoLkLgCHI3AjLO+4g4BAxpXNk8jSfDT/7YHtt6H7Shd4AtxAMgALnNFZo3ClL2SWZ89iwQNIuE82A09Su8ZaGCy9hspymWp/lzW7Lsj9ZwYpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786425202; c=relaxed/simple;
	bh=slbINWJ6kfsbOKBMsD58k/lwEYZ+DQ1p7n5fU1WFEXc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U+CKeqdnDrKC67bVy6UNJE5ggwC2QKB6h8k7ZUomJr4cpOLYltg4kLWD8ophasCrprOHljKRbm5MPLpBwGkuSQHZMEWO+047g1Nccz1v+CYU8QlmjY0a4pTWopKFovd+s/X1GXIpHlN/B/83kcNygm8Gb9AHmIgU1KDBDxSTwN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ppb2YtYA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bm+c/0Am; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ppb2YtYA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bm+c/0Am"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67AMprGZ2705341
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 05:13:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uQ71RBCr9eC8+MxkhpbhMOfqcDdwyszxu5Aw9UOKM5c=; b=ppb2YtYAT6y1duq8
	K2tm8t3J4el1rDFvE/w9yCV07TdBGJ0owhRp5eab1F7NfeKd78JCaWOIh1iM7+9H
	qWpvyz9RWnf0CfD6czTm125x5OHXfJYC9F4ol20cZ6D+9JIVFx5ht/hnxhy/QRUZ
	h8uCffNXkvpJLOxavv0leJQ8WLZGprHd78xAuVOxCyM66zNytyu+NEbCi5LTBNfn
	hGNlGsbCnCb5xlOjLyqkyNOJYiGS3EOYVyhJI8ohKbn18lln/AnHSDPcQWl1X/sC
	ej2gnOIHZeIFmjbk+3B2uJhYk504AGnoRQ9Nfw3/TblLrpfyze+sbKUYKs6zI5XV
	/IeRNg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyjk62e7u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 05:13:20 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb48f41343aso444450a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 22:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786425199; x=1787029999; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uQ71RBCr9eC8+MxkhpbhMOfqcDdwyszxu5Aw9UOKM5c=;
        b=Bm+c/0Amq/csqFFFQt7TYML7d5DxMIKbUacUbqAZGJYciM7K1HaeeM6A9Ii0NKkRDO
         5L0AOwTIezRaYgTwZsaiT59vpCSlJ1nN0CIjkdrqtMZqYwu38pQ9CTw9zlsv1VdiiFGe
         GYbeUtd4uJYFWPiirvwQXvC60j8bHjOmLI0WJmYiZQXpKzJUdXv8N+ksxCEmdOeE++nP
         Oefl9+5zdOI6YEL40d2FtVJ5vexFZXbIDiBJQgxJyzWxyDdWkQ7pACy7LXO8rkB1tOgD
         //pySL8+0a6SGpd1fa7aZRgymB/GNERCB+QXpI5gWncmv/mBLP359xtq6D6HF0QcP4FZ
         9H1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786425199; x=1787029999;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uQ71RBCr9eC8+MxkhpbhMOfqcDdwyszxu5Aw9UOKM5c=;
        b=fdGC80JqCbVvk772JpsrDJplomYL0D7XrCc3/gTNUhVJohpzyCHT5bvGbfFjSM4uO1
         roZtEq7FTHCLYH13NYKI0/X4sz6PUMUOwcFD0eobiXry5vmIkPOaHeelxkE8i/aq3H+x
         0nUyNfLH6smCRdN5sqLjSbvPGgqE3uT1395qmChkuf7Whz+OAe1psBhEvcYUtCDSNc9K
         qMGBTQAW6bAm9T+Pj1JPLjtETEVnszGzpVRDMEQEMxrPTpRyLPWPgYygseg9sAYWKhfg
         RAgQAKedJcPJ0hHAn+qi7VnJXL35bQG5zI2BB4uOnbM3ce+nfiiq9wdO2jBzRRBuFdnk
         6bBg==
X-Gm-Message-State: AOJu0YwVh0mPmERjUal/AbN2MnM7HQqi0+VJgnU8G0+ti4TjoURT22/0
	AmOOAFakgRJEaHYwNN6t7lFQlr8lgqMjPQQGnDl5zCHIRdGCY2w8ow8gaTPDq/wnMdlhZXJUCx2
	XSvWMXXdzwPSNgLH+HpqKdJVZivxVRNAlEke54po0DOvVYysmLou2LynEDuhi1QX0ZznCNn50tJ
	Bh
X-Gm-Gg: AR+sD13NEl97/AQBl5csklAZ5v2S48RX+AsGdXeIUINRENrB1LBqN7juQy6N1JdvgaJ
	6N/HfaKXM6pnxj4gi4MDGkpaCs/VunQpIJtjAo7/QJoyxHTKM6d/X3Md0MbtOxZpegMywQFkMME
	1AULXzOfMz5NJkYzBIniDPwr+UEWNrxRV3156I5WerIl65cdY7fq7q1WcKqKNet8rpjXUwA/GOM
	EA7NimHBgLmvdvCl+ra+FToUyI5uNw3HInk4P4X8FGfz8GgzB8BWRJ4GwoNtZxUE3rJQiugOP/P
	skBEW6Wnvy4c1QWuO4IjVp3+rIAf4Ggsubq88q19gN1UUmClVjdAMjruvPTBuIOAImWbCN+Sgg2
	ZEXA++qb+g8p20wHNx5GSZGNRrvlQB+zzFg==
X-Received: by 2002:a17:902:ebc1:b0:2c7:f5c6:c4a6 with SMTP id d9443c01a7336-2d31910b535mr2130055ad.7.1786425199400;
        Mon, 10 Aug 2026 22:13:19 -0700 (PDT)
X-Received: by 2002:a17:902:ebc1:b0:2c7:f5c6:c4a6 with SMTP id d9443c01a7336-2d31910b535mr2129915ad.7.1786425198984;
        Mon, 10 Aug 2026 22:13:18 -0700 (PDT)
Received: from [10.217.219.92] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d3160f47easm1486935ad.64.2026.08.10.22.13.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 22:13:18 -0700 (PDT)
Message-ID: <f9104bfe-4016-4394-a895-a392fdcde59c@oss.qualcomm.com>
Date: Tue, 11 Aug 2026 10:43:15 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] slimbus: qcom-ngd-ctrl: Implement disable_stream
 callback
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260810-slim-disable-stream-support-v2-1-c2e8fcc3c99d@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260810-slim-disable-stream-support-v2-1-c2e8fcc3c99d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Nb3WEWD4 c=1 sm=1 tr=0 ts=6a7aaf70 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=zAWa6mL1YnOJid713rUA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: SZZZpBoIOOYgBtVQqgMCgbp0xa9ojAa0
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDA0MSBTYWx0ZWRfX/jZqFkKRLskD
 fYtdl+T1hFSP7ZupGXM7yFCIgbByfuQf4HnhZiflQ6v1VvUbEfXj8vKFgm3z1/jUNLWNlYm97MH
 cPo4X3iPwnWlmpNZ5eDjrQQ7Xh15hpo=
X-Proofpoint-GUID: SZZZpBoIOOYgBtVQqgMCgbp0xa9ojAa0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDA0MSBTYWx0ZWRfX/cZqy/Cou+mr
 4/upyzqktHZxkNgY/zPvNL0T81tMK8Bz86/jkccJpAqmvnuVAgfUF/OvIEGGJw0DekV812r2IjH
 mhuSQH8ydsz7YprTc0+7E1rzR5U9Vdh16aiNjDoFLD5S+Ov8AYc7XA6pQgekYLF677RnYr6svS1
 r2wT+0sx2WnKj9NJLCqoh66DDOtPwuhXfkiasOGRnRPDZT5unvH+0ogoQC1MlGC8oltysNUomM+
 vRuN32tV5RYFAuzFGE3+7SwrZpHqSl4wuq1+QiTDw0K5zWc02pTr+I3/jn8fTnL4QxKSQy/M7Sd
 uUaNdiu2RiWklBTzODhldXrayWZv2e0DaUZbCnPVMVa6aWiHQ0J3cMGoX6AuMMXIFkIrYJqLD+B
 VSIDmoQVb/GLYsIc+HSwuuRdrTsJ/lNibJfeeSx3XqfB+RrUGEJxQ2vssToe2TCwmKSEGFfucKW
 RPPgwoPOHeSKU4/imnw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_06,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 suspectscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608110041



On 8/10/2026 11:22 PM, Viken Dadhaniya wrote:
> Switching a channel to a new frequency without first disabling the stream
> causes the channel to be re-enabled without a clean shutdown, leading to a
> crash on the DSP subsystem.
> 
> Implement qcom_slim_ngd_disable_stream() so clients can properly close a
> channel before switching to a new frequency.
> 

Better subject name would be "Prevent DSP crash during channel frequency 
switch", it highlights the issue fix.

Rest looks fine.

> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> ---

Acked-by : Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>


