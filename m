Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795787929;
	b=eoaMbmrRCtuO4WVDZq/gtDGTmmfSD2HFlVrTghAeEIDarnwvaDMbv1Z9WApxZN3mCqJ9
	 5Q8G5QJ67EVy4W4VGH3P4510QorXo0+kmT7KhuU49y4GWSV9JSAwGCir37YJcBHTWHD4c
	 xez9cokhKNyDkxWwtxYqVgGRF2OvVRGRQrUC1pqxSxBTsg+MS1cvBvnYbEChZGA38/QHo
	 T8Kl9nB8ZCpzqle0jldJjZY6ZQmXef1qaU5+/nrcYAvRdrWp1kB0CVESVYP9h1a6AoETj
	 HmgXPpcuu4MMkAJhFFOuaxKTphmFnEJIrhJ2hPam1i9ZsqOIIjLQJmZ9gn/jpx0JSNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795787929;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=cK0hfsO6LY84HqJrabEhSmxltsurGZr9GeMKtUMsBls=;
	b=Aojwwgx5mXkj4WOz7UB9qGXU1lQLx6Z9DlGxZr+HzObjELOifYRX+6rP8Ep38CEPRKI5
	 B+f2DMaFbfHZyGUnQxgr40UHbvWl+UAFWQvwsU9mJXjFhv9YeSOff7GZkhpbmI2/KdFBm
	 E3SXNnysr1dP2GjqxOq8E5XbY8+zo5h1sP7L8NYRIZdzayuvSOa+4oe4Klu0rjTNx1z68
	 zDNhrbczfGwdvKYD/trd0y6kknERKtkZVB3Sku/fhb8NLVqSAnSW6hMXzCDQ5IfoUMor6
	 Gk5ZSNBBdH4HYMnt6xwXhlP+66XrkWQHIJ6eazAtPML5U8xkIHyI+9ji9BJDPdMsfZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=n8ppqP6k;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PLqO8wee;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA0C5606A338
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 13:58:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA0C5606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=n8ppqP6k;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PLqO8wee
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARDtvrH2672231
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 13:58:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cK0hfsO6LY84HqJrabEhSmxltsurGZr9GeMKtUMsBls=; b=n8ppqP6kYFQ9GmjE
	EbsyxBbCL21dST0etq4DY4NcfHA4a8YCKJJwFEkaYOUHeb/lJEcoeaa0Ezq7K+Gv
	KPaSWVPrkNYsFJX626QQA2idA1UzBdFOI7UFW2YsxMSZZe9ZrYbUnl/RoUHvWFhe
	Wz/hbpbtji/F6oTLrcbYl2sza3wJhBpmeZaWpvE1sbblbO2VEh0MwAcBcJ1+C46y
	rpGRTDGQ2YJc6o0qlNfK8IjD4Eip72RK8HwrANfUryJQ6+7m5l2DDLcKwX98O5hZ
	oR38nCe3ed1UJu7HcOWSQe5u6N3zo7oudvF8ypehOqGj6xPmZdEEzoz1HVNMfWCQ
	LInydQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j73uhhwtt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 13:58:48 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-341eff9e381so11705505eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 05:58:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795787928; x=1796392728; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cK0hfsO6LY84HqJrabEhSmxltsurGZr9GeMKtUMsBls=;
        b=PLqO8weefJMSkYog+9sAX0nsymR1CSemcJNUvDeaF6C8G7SPJnh9qhe8v/NQke0+Yd
         abFLpCa/59rB++o/5Fn4riZ108JPKlvXVObtJjXniYC0NH4RGc6nhuntzUDbFf8E2smx
         4vtgO/VgweE1/G6UMDBgMeQDbpd7n8+WdKKsBY24yxUhRKU2TxZmY5B/vaCx4sQQQj77
         vUpvi2X7odwY3bjLLnaXX+YxXeEPERCeh+reaR7QdC27+MD3fa6ukVfCTjTgdFHpmmUC
         b0At6I64KYMz4q6YtTJapLPROpumSN3C67paKibSWBSly0j8wu1Hd6im+rXLzKjTwxc+
         JHwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795787928; x=1796392728;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cK0hfsO6LY84HqJrabEhSmxltsurGZr9GeMKtUMsBls=;
        b=fGtBm34fdUYy37qd+UjuvIfqOEbj2gNgszKfRDYQ+WiGq5kloDlu+GJFkQ3cYzDLcu
         uj5LaxVQBlLRoDUFN1A1C5o0ZvAF8GZJRNLU+yF/ITQ0xaI1JnuaoNw9OS0Tub1kBTG8
         hESfD3WKpQon9zlvP2wjIJe80Zvn5hLSUZ5cGC6fl6t6PUq4HpOwu8Wu/NJaI5/ixZXC
         wlYNKDH9ynr6eM0d+9K3IInyyc2LbYnlrI6PRqCtebbp38CEEfNvPwV6zW3uSeKJDxQl
         kBP9t3UEHuJn9LQwJS07PRvGcq06DbJlH5jYkc+zejpk6oi6+OfFw7Sx75ZKJMih7gwi
         U2ag==
X-Forwarded-Encrypted: i=1; AL+hErF10nyct1MXrMokYCdJuLhA+ygdauhsoyXNVk+kPaNxMgxwQf2lQJS4Nw/XIESEMrsAoxnUDdM3NHec62+2@vger.kernel.org
X-Gm-Message-State: APuU4Z/9hn9dXPj607c/NmiPgOSOBvOZwJvpelhskcsWMagoobgCF1UD
	YqtamnivslMsTFLKzeM0FZtf1ZWxmcGqIshwt05hf0I7zruA7f3B7wp4xwsnyK79OxDirqlwqrn
	d5lYouLOUaCQh9O4FFQOxUVEgcKeN3p3cv/GSyQcyb+1BMSH65GPMz7b3qGzJXYzGyNx4
X-Gm-Gg: AZFdTZcqdB5/yeVy9qKf+cUGVILN3tqpTu5Fpyy9TWgn+L2RcsMGa2HizLhhmKriRJh
	pPjwRhHXP+BnbMQ3A2ErC2Uf7/vSUf1wmDzp020UggsLK6ZOJAOgtDIVBBPkb0gj9iJ6kQapSwG
	8SPZKBvbmJaW65fx4h0hlV7whUXAgWPfXYpmbO+2eUQNbgU3j1hyz4ztEcASWi9IO7j5dyicTJV
	t4VDG7hRgRQNRhP5m0c1zSQacbF3EQXu1Hr+ZEfScuRjzYMKrtq+uhD8SBxqyGGw+Y13Ydhxiun
	mk0FImt6yDRHyevwqOPFtPdkRb3BO7zSUf1iFU+4ZZNRcXJCZWqyGyDUzNLRQ+wvKppuqll63d9
	IX/wIt2+qVeA440PwGSof4TtqyxR64lmaOS+4c+fcUOc4AhAuaIFETC8Rwg+xXAjlOb/9MUT15i
	B1sIZCbQ==
X-Received: by 2002:a05:7301:211a:b0:373:5561:8d06 with SMTP id 5a478bee46e88-38570c36e7cmr21793714eec.37.1795787927665;
        Fri, 27 Nov 2026 05:58:47 -0800 (PST)
X-Received: by 2002:a05:7301:211a:b0:373:5561:8d06 with SMTP id 5a478bee46e88-38570c36e7cmr21793695eec.37.1795787927109;
        Fri, 27 Nov 2026 05:58:47 -0800 (PST)
Received: from [10.206.111.23] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm69037597eec.16.2026.11.27.05.58.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 05:58:46 -0800 (PST)
Message-ID: <127c1c1e-4637-4bfa-a65d-4b820a8cb7ee@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 19:28:39 +0530
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
Subject: Re: [PATCH v3 2/3] media: qcom: iris: Fix IRQ disable depth imbalance
 on watchdog interrupt
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Hungyu Lin <dennylin0707@gmail.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
References: <20261120-fix-disable-irq-safely-v3-0-82f9561394cb@oss.qualcomm.com>
 <20261120-fix-disable-irq-safely-v3-2-82f9561394cb@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20261120-fix-disable-irq-safely-v3-2-82f9561394cb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1NSBTYWx0ZWRfX3Jtj+mDg6v7D
 vgeBw1tcUkWqADi9h0Xhi83gpj1CVaPQim8taXXRPHz4DuiwuuFma2vYK3uS4jzrGunBtpJcPQs
 k6q4Dn1YSZ9f2mjukqFLSMTya9ykPeE=
X-Proofpoint-ORIG-GUID: oeLfdjJUZv_LIGEkKFbr2tgbrZS3v0Qa
X-Proofpoint-GUID: oeLfdjJUZv_LIGEkKFbr2tgbrZS3v0Qa
X-Authority-Analysis: v=2.4 cv=BbBNQbt2 c=1 sm=1 tr=0 ts=6b098c98 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Sp0_ih0bWsTyJVZjBMYA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1NSBTYWx0ZWRfX8KBQ62Ss13mV
 o66uk2RfnGqRQZ7LNyq8FZVE4ejs8kNfbLpkzcd4Meq0b+9OCFais/qrY4gxuARy+PVid8v/Mon
 BSJY7vR47oM59LZjbb57oiPKOSjURBs1FRY0GgOicLcjAopqY9txiVPaRtPDT76TK6cwN8OgCYk
 SzSdDkqt8RmSJLiteWHqojbpr6Y1zG1U7Qd2Q+YRVubB8ebWzC3pbMGSC06DXDmzEkLFGHZXeJ5
 6jVY/F+aE19W+EiY7RLQamrKT30kb8Kgd2gNKtKuFqBg0ha0/3sRK8ebv9ID/nu7qboZpuSAFPV
 bDxDcXhCWx4znggUxYz1dqIpUb6Rj57xJyc9FzhhyYsjG1UCb0+icWcNjVnpYw2L6TxajeGNtQt
 cHiJj5B5qjmtrj+OdhRi23hTexnc6DjscKAcwwTStUFVsy44IglIgExELcTeWj3WgrbxxViCP8u
 YFVIp4XNfdJNB1aAqjA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270055


On 11/20/2026 1:12 PM, Vishnu Reddy wrote:
> The hard IRQ handler disables the IRQ for every interrupt, and the
> threaded handler re-enables it for non-watchdog interrupts. This
> duplicates the masking and unmasking provided by IRQF_ONESHOT.
> 
> If power-off runs after the hard handler disables the IRQ but before
> the threaded handler updates core->intr_status, and the stale status
> indicates a non-watchdog interrupt, power-off disables the IRQ again.
> The watchdog handler does not re-enable the IRQ, so the two disables
> are not balanced by the single enable in power-on.
> 
> Request the IRQ with IRQF_ONESHOT and remove the hard IRQ handler.
> Explicitly disable the IRQ in the threaded handler for watchdog
> interrupts to prevent repeated triggering. Power-off always disables
> the IRQ once, and power-on balances that disable and any additional
> watchdog disable.
> 
> Fixes: bb8a95aa038e ("media: iris: implement power management")
> Cc:stable@vger.kernel.org
> Signed-off-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_core.h       |  2 ++
>   drivers/media/platform/qcom/iris/iris_hfi_common.c | 14 ++++----------
>   drivers/media/platform/qcom/iris/iris_hfi_common.h |  1 -
>   drivers/media/platform/qcom/iris/iris_probe.c      |  5 +++--
>   drivers/media/platform/qcom/iris/iris_vpu_common.c |  7 +++++--
>   5 files changed, 14 insertions(+), 15 deletions(-)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
