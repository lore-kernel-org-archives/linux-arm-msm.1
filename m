Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F82849F123
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 20:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789762523; cv=none; b=OrsTmfnIXoZpqk9g6CY7RnJGkDAinGvC4NXKxSIQAT0zzar0/S7AysWcGlfpT0Cgmg+20i4ftd2koJEGIgTCKx5m5evFtuw0w6aqxESSxOwIw/AAgHjctVw/6ZQOiZUXvAb8LceCpmLkKFgR7Q66Qt/V/AxUhjKUPaFkjOXPsKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789762523; c=relaxed/simple;
	bh=IihQtvlu3mM7DoVd4/V7ME+mCuTIcJBZbRiO8v34YNE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gUp1x97+AcRPv2xAcF/GOiWAD7YNhEcGDXAkplsui7NircAzNoRPvJpQLPy1jl3n4dlcy6Q4QjUO+g9yrqhbQBgJ6V0uHIg/XfRnfaSIL7o8EZ31UJ/ILIQVQbnoYxStq9cXOoI021fPeyCVwwSvPMLztOkxRgTShZGCWyP1rMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fD+GOeD7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=khwwsyAq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fD+GOeD7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="khwwsyAq"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68IKErfo2264324
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 20:15:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4fphhkzCia/0/dPRwk/cb2MyHyGqohOAAxhBw9rbGd8=; b=fD+GOeD71lokuXXG
	oJyTKl62II+bfiT3x5V68weBwsLkg9k0od+HRHDm4+GZPneZ0rSVR3w2QUOH7/pw
	UNWejuimY6L0ZLLOeESBh50eAYjFNfHe3zXTwhOZP1teCpiEJouwTj8EGHL+Qdrh
	RMVz/5TxpvNsuqI8wUqK/nhIHybVDHbECqwV6i5UopMmYUHa+WXWSsTJKITIBDoy
	J43SqZyKNI4Ha47J3UAMB2X5473TXYAcCHjWOvProVmHTJZ4IbW4pi9G7Hk7AzN/
	c3svFtW3XkzaM/ld+k00yhCe2xKa+ZG3Iddv2wTj+6RaugeS9ztWVNOzGN/e52eD
	O/3zpg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gs2hvakuf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 20:15:19 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934963b2bc0so195904485a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 13:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789762518; x=1790367318; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4fphhkzCia/0/dPRwk/cb2MyHyGqohOAAxhBw9rbGd8=;
        b=khwwsyAqehJtlMHGmYIsL+PtUxpe+q82eyCpDo4wSSWjDhRrzn3V3eOUeecwIzhWVj
         vUdmvMp+j2leO/FgSaDL77tI5zvxX8tlL2C3f/q9jUIgNo6uGR9Fa5DMLZdTcVWPJmBl
         lBIvlS4hL4klX7Kzgzyyiw2pcKgDVrxEvqONpkbjh0PU3DW3WYcOSZZeyPuzNcOnnLcR
         tE9n6Jvwu8oJljnMlCfG0IUD5yEjk2hkpYcp+xopiKGk+My9ECUH4Im2N2BtbZ9dHGHn
         JqEkII9dDAfLFlvguLFigtwuVY0T8CjBYDefg3aHqmM+kQHT1as5vyaIYjjXV23rXV1V
         552g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789762518; x=1790367318;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4fphhkzCia/0/dPRwk/cb2MyHyGqohOAAxhBw9rbGd8=;
        b=VFJcDPqWFSIXJifewaWPN5C+xIe3AIfbsfSK0/E6o56FkIh3xIYBQ7nH4Me5yJoPia
         XjnOG4BFw1rBTsOjw83l3QTijuF0QYxAUQAQPh5r/PICATouI7grUTqaAh9K2NQG1Mmk
         zI7Qd3rUtBz/2IjpTTdd2hTaUevczd6fWG4VMWvlYqS954I6Q9LNrTx7W5VJFDUVmrez
         rF/TtElSNdJN4ALej7ytHq68oluCiFJHq9RJAAv06dTleTxLNeVMvNTeQr8JuzlFB8dp
         dabeEUkKtHCsFfykZSSrEFu7k7pkDDFSIx7Aco8rHJCC2Ofrbk3eRrl/fuQZFRZeTlrZ
         oqjQ==
X-Forwarded-Encrypted: i=1; AKwUvBxDKb5ioPiuFC4sS1K9N5qGLq6jjsR2h9Xh/ACrj0VuDd9ccLa6R5OioVLECg61GgvfewmTYs1EX0bupnEN@vger.kernel.org
X-Gm-Message-State: AFuF++l46k4qJGGzZA/k1iGu724r5KRwIrRLXZ2onVLgpvYw8L3d2nqw
	MyD/upSUbUAaZHh7efP4/8jYfsAxIPWXuBCevpmr3eF3AXW0A9aR5pTUknyQEbmocBKK0OO8fcr
	tpy0PoI/9PZ2IadmW7YLqFDbC1mS7GyNjMEtRrndA69HRwsdn+vwrc0Qpb31rU4GjXtqI
X-Gm-Gg: AYBFou0w6ekEFvz4fVkKjXKXHNsBhJ6XKdWdYtfAHuL6URFtPgKhpIykGp2tx7Ow05W
	xMuFPZxHqmVfPS0LrgxRH3w8rK8j79Xyaf8VV/pZQX8nJr0uCd6euVECo476Y7sWmPqFEG95PG4
	UaDpDm42Sj8IBM/XzfEDSEsuLS/u+HODxdrW1zfzhOVPMPMiW9wZNDYRfAmfp9de1wZl4/FJsak
	oL4E0k+/TQa1x5TxOk7sFl0I+UVw8yvbeluTO5JY5VI8jFDSGFgWj1uZ0Xcr/L2bg6bOn08UjST
	84InmhoMwSkwwfER6Zov1bwSzBF7+MxOzaVaYTVgJpkqwBH5TCbyYBfU7lwkX/dw4CJH8P7A4n+
	H2cRjLXM2RH9EOJVeN7EgfhUqnah/Qn1ok09YQjPoPdbQB5LxHHn/dWLnVInW
X-Received: by 2002:a05:620a:8909:b0:93b:c537:fdb8 with SMTP id af79cd13be357-93bdc6d5b54mr581373985a.6.1789762518451;
        Fri, 18 Sep 2026 13:15:18 -0700 (PDT)
X-Received: by 2002:a05:620a:8909:b0:93b:c537:fdb8 with SMTP id af79cd13be357-93bdc6d5b54mr581369285a.6.1789762517999;
        Fri, 18 Sep 2026 13:15:17 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:bb0:6e51:d247:d411? ([2a05:6e02:1041:c10:bb0:6e51:d247:d411])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48724460978sm1103863f8f.11.2026.09.18.13.15.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 13:15:17 -0700 (PDT)
Message-ID: <4189b4c4-3544-4602-b1c5-f298e033c17c@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 22:15:16 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/2] module: add SCMI device table alias support
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Frank.Li@kernel.org, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260918092951.5656-1-johannes.goede@oss.qualcomm.com>
 <20260918092951.5656-2-johannes.goede@oss.qualcomm.com>
 <2104f437-e960-4e55-b0e1-2b37126e8c2f@oss.qualcomm.com>
 <82a72918-7bc7-4e2c-892c-0dcdd6dd5548@oss.qualcomm.com>
 <3f51bf6c-5318-4e32-a1ca-3ce8cf8c4ceb@oss.qualcomm.com>
 <20260918-roaring-bee-of-acceptance-50a8a9@sudeepholla>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260918-roaring-bee-of-acceptance-50a8a9@sudeepholla>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDI5MiBTYWx0ZWRfXwKh5uLifLPdh
 jE1TeDc7WA+KTC2sEbn+yizKIhPp5UXx80fG7n8WEJMLeNaPDNaTt4DzQ1w5CGm5v994X72XjAe
 JGZG2RbQBSvxXQiOZ2x0C1eFYe3r1F0=
X-Authority-Analysis: v=2.4 cv=IOWXmQvG c=1 sm=1 tr=0 ts=6aad9bd7 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=pMJ2f0pklUtnlmghVxoA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDI5MiBTYWx0ZWRfX9+tOjpdEZVBu
 62VUmjQZvopEu8F1E8+yO+bhySjlpiziDlhWUT9Nc4K2cD1uzX5Y/LYAzUE1GRZmUQXKMEuQOCh
 Q2kKBz/nDPjV9msnW4w7BKeE0z5CQyHnpK4aixATKLjz1vEbJ7Wqh4fIhJLR8jzswb9uihIKwkz
 rUbLoBZqu8Vv56DDfFBY5DdDRZr4D7hruUPk22hNsPGS7DJzx5KtPJi7FikjF3sPL3/3jlEwzTd
 nqdj/yHZTiwt7ypM6Fy7vQiH3uDqPxdaMOTyhdn5Ndc8mGKLbOXNPTJFHouujagOgEQAfYtxDWp
 fvTSQ+02JCiUb1ToKW9ASd1zC7skshPZMEnLylOLZXrqvS4fuk9JqL7D/CZ6xapPWwj2d6Y+e1B
 pmzAbCW55HFPAw54b/M40VT1QkuPbt3T1V2CxzVwF0N+DWRgB78jktuLbA09Zsv6czx6teUrAFA
 n7AXWnhQqdR1o3uBxNw==
X-Proofpoint-ORIG-GUID: d7BajXVpVknXFEH0dbadmRIIN3QOZfIm
X-Proofpoint-GUID: d7BajXVpVknXFEH0dbadmRIIN3QOZfIm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_06,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0 spamscore=0
 suspectscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609180292

On 9/18/26 15:38, Sudeep Holla wrote:

[ ... ]

> Not related to above topic, but just wanted to check with Daniel if this
> solves module auto-loading for you. Was there someone else who was testing
> this series and was having issue with earlier versions or its you only
> Hans de Goede and it was with v1/v2 when Bjorn posted them. I remember
> something vaguely and couldn't trace back all the versions easily.

The scmi-cpufreq driver loads automatically now.

Tested-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com> # Lenovo 
T14s Hamoa

