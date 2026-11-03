Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793665291;
	b=rBDRKKEzqaEOHnkMyafl8bKnl1Z9pIDYnWQN3EdawAVwIkXRRczn/ErEO3pdnuTr3wej
	 YonQjkpo7iBQMqf2Nz6Nhp2AyKvoAZed3p4aHBe3WxEFM438BKZOL4kBpJSi41QEzmlLP
	 KZD13ZoMEtcURnqpnLJg9T6Ach1GXFEnGdsMsQ6aHtMTEc0PMqahMEQFplrW7zmkg0WMe
	 QsRzozr+UAmEK+c4l9tW+Cw1SOoMoTa4fvaNy5XLuJAPhMlhwS4q5ztNzXrrfJQMutIMJ
	 Zm6QvdSmG/oAIOwMUnrfpwnllBt25JGl89cIu2l7dro0aDDelyiRJYFMzqXtlnac2oQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793665291;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=m1CYVddtSAfgtkCDt6VccjVuQkJ2y3YjAFo+UlGYC+M=;
	b=VTq+lK8TUT6oB+MTNHB8nqcT3MtfKn9v/b1B56m/B6NEutDMSK3aRnq03xdEGE/haX/u
	 rAxMniMvO8RHQ8bbZJ7tTXiTSnw3ouwrgoTLjKh/yY1DjhLxupA1D6cqIUP4DD+3mfTBr
	 M/Ai5NDUheXaYWzoMb9zNGvfkk8ooKxJszSDZbOuOCdUWlVWzVh7QcdYb4QnRrr1UM5Pd
	 OupgTVbKzS8AqBm+5tTU1JQn5ez8hZmaex2Wen9Y3134vyloaBI9SEDKr5V4k03WPZvPF
	 d142JqlugKZSgp/tedoJ2y/0QOd1M9vh3I4LQa7VFrJqIcCjTBd63NelKe5UUUrZkJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AAiMmWvz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A29RzVuY;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1014606A329
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 00:21:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1014606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AAiMmWvz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A29RzVuY
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2K60IK372000
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Nov 2026 00:21:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m1CYVddtSAfgtkCDt6VccjVuQkJ2y3YjAFo+UlGYC+M=; b=AAiMmWvzUkKHut6Q
	ulNXTMSVgicCv1fNnSxRvXiJ6t+aFn74HFgqhOfd7c0gYb8q5CYSFoxDogS7yQlZ
	dCnx7bq8U1H+Xf14+rKXEq6YZvw+5wgB+DWiVMNe7QJEhCPhDoHZLDHB/rlmDsEo
	RbJZAxp0WaOXPCXdx8RrtTpaPrvDRwIhDrK1Kf9BDxkRiW5WQQlyPWw2gIHl9qLD
	jdsxwWmMTA6am3+D6xjIr8JO8y9ycMeSJOSCW7MvcnXumccJvw8lMQ4vRxd/hHHz
	ikGuDdxT9WaqTK7a54Hd+BP0oZ1J3TniDgWpHHSYOlrwrrw/hts31hri9KFLEu0U
	Mvhu7w==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq07r14e1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 00:21:29 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-341eff9e381so8199400eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 16:21:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793665289; x=1794270089; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m1CYVddtSAfgtkCDt6VccjVuQkJ2y3YjAFo+UlGYC+M=;
        b=A29RzVuYqO1WenXIJEkRiE/kDgO20z32vjxdpmfcI4o/MZPWVDnhH9dG4ScsafzguC
         XY8pyY6R0J4V4dhG3eAsMvCsDRFJCkXz1yXtdpLFzh8lqzgXzwd0Z/dbqe+kf1G32g5w
         T8yTOvgs05BeV1beBPkhcaCwhXXi71sZ9Y5Z1Ghy4tqrG1g97DuyviDaY2Qcz3KNcIeM
         4dOkw3VfyIyjwoPYYgQ3aTYaJGglxidwO2ncPoHsw/5tgW1Q4Jf+zTAg2Q9WJ1SyestV
         7XM166VNpXyrd2d+OTN3qyiSvaX2DRiLmEKPID8G8C9FkM0XkD1W2C/6b3fdhxKSr+Ho
         Pohw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793665289; x=1794270089;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m1CYVddtSAfgtkCDt6VccjVuQkJ2y3YjAFo+UlGYC+M=;
        b=xIS+pM29kBhxh00V88uTkrbZ2KE0V6ltNnZs1RgzvFyh7DaP17V7039w4vTkxalk9X
         MTEFDe6vPcQa3uvQJPpMLisQc+9ywOxS4Mgs5c7S5BbH/5fwM+aPFyLslKAvTjeAGaQQ
         Av+h+sR3Sw78HS7BkP21kLydWZowWxhSwEreR9yCk4euhCHZ3SR+Yv9O0shQHTouduL3
         mwW2ZEiiBv6/76qspBSEzUFdL1PhRss5Unmbhl/zlwQnDx4XnXzkERYZejbnG9kt5k76
         l4uxzMqat2vgXlyZcZeecqSKqYZr/fXBELs4R9D7FLjab0UkTioUdpIf71KZkjZKAN4Y
         M9ag==
X-Forwarded-Encrypted: i=1; AKwUvByS7cHInjL2rfNrCYK2iKT4e7hu34MqmlORnjf90sJuIkUv3duhXB8EoGZxKFwwlL1+GIjgf987WdLzp1Ep@vger.kernel.org
X-Gm-Message-State: AFq9FYIVkDcrHmLq8aY88HMv5Ijr9O/zO3mOssDYuM3YmIxtGIHbzmam
	bdyh3WD2MsqYcRl0kc0eDp8+5jiGqtZa4OOpA0HajWB5S5ruEtZPgDc1zzKx1foQMeioSnbI5me
	og8hrxm7F4TUeozSZFyQS2v9yENYVpzCPECdsOseyFYt7QfqnVwCuj7NNeUOn3JhOwiFz
X-Gm-Gg: AYBFou0XxBsvHOTvZG9hglJji1fxmRiqer766y1QUKk/zpO6HuA2PzTuZR9IU7bClo8
	9gSqUb8v4przf04jCV5+gU9iSiGySWMRDoa8+gguyA2XSc7yS8rjFZvWCDBqyIfc3eIhkRApUBt
	4n6hiZ3u19iLz/9olii+KIw//soTISfB2OGT6r5teGrQInUT5SGeeFICuXgt0Zw2WPCO5PKBCdn
	aoPfXknsz6UTy6YEVQRqfC15a2PvgKlWJzExKQBJztU39siFfLBocs0it2joEkLTk4sFMYRXWq1
	id2ID63CJkk5LDb/HQYwnGNrdaMohgiVk/cSli4EXMsTiULzr7XN1sTduBs+rpMIeC3gS8Nq3Ge
	gkcYwXpILZKGQyTKZHt90g43Ncmxlw9adRJwwpzXONh3TkcT1PKYppRSSmpLkwUor6E+MTPoKZ0
	vipXWfO54mSBc=
X-Received: by 2002:a05:7022:ed09:b0:159:aa67:28c1 with SMTP id a92af1059eb24-1ac5c92da58mr16984822c88.20.1793665288363;
        Mon, 02 Nov 2026 16:21:28 -0800 (PST)
X-Received: by 2002:a05:7022:ed09:b0:159:aa67:28c1 with SMTP id a92af1059eb24-1ac5c92da58mr16984780c88.20.1793665287605;
        Mon, 02 Nov 2026 16:21:27 -0800 (PST)
Received: from [192.168.1.148] ([68.248.129.193])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428c17bdsm40121421eec.6.2026.11.02.16.21.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 16:21:27 -0800 (PST)
Message-ID: <7005e138-6d5a-4c39-aef0-7200cf3bf911@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 16:21:26 -0800
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
Subject: Re: [PATCH net-next] net/stmmac/dwxgmac: Extend MTL/DMA support to 16
 queues
To: Jakub Raczynski <j.raczynski@samsung.com>
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
        netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, k.domagalski@samsung.com,
        k.tegowski@samsung.com, cs0617.lee@samsung.com,
        abhishek.chauhan@oss.qualcomm.com, lorenzo.bianconi@oss.qualcomm.com,
        sarosh.hasan@oss.qualcomm.com, hongmei.xu@oss.qualcomm.com
References: <CGME20261016193835eucas1p128cb1712afce0314b1ecb65b0c0fc841@eucas1p1.samsung.com>
 <20261016193823.2711773-1-sagar.cheluvegowda@oss.qualcomm.com>
 <atXhR0sgdW84YxcQ@AMDC4622.eu.corp.samsungelectronics.net>
Content-Language: en-US
From: Sagar Cheluvegowda <sagar.cheluvegowda@oss.qualcomm.com>
In-Reply-To: <atXhR0sgdW84YxcQ@AMDC4622.eu.corp.samsungelectronics.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: grNh8lirw-UakFxAOkv9TVp2InlGqn-8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAwMSBTYWx0ZWRfXyTtzRSGoKu5w
 nd1016Z2U1hFNPdNQFPSSAsm6Za3IuAWSZNxk2qYXALUR4dFmPoj8C/YDsKRf7/fommhdSX9tRA
 SDxppZhPUE4LbcWXhHJSBmSV23n/r8BPbCzhmCdq253QIWOZignqJYF37aoOfelN7fkIqLhnGGL
 ELrNleXoztFCtDF/t5/M4JkKlBqqofAqMN3DiS2GVjim2uwqUoSIMBoZmKMv5myYcKDGZRsJt23
 2Rm6SG4zyb4DCBlfckOgxIQx41OW+ExReUkqa2SbWh6J0pzu8awD9rFYA2uLWv8USRXgENObLjJ
 SBR/7NumM0RwuqHl1jvlILHrfQqyq2vV91WMxaMdJTz6mLgnqu3GYsTWUKaHUEJVFqniDgepc3S
 VmDF5th1gApyWJIT82ASbBQ6pJjQSuqOre7XgM2lRFt3dBMdTrwaM92mMnz2anyXrLyJ7Mst8iM
 8+QYf3a5Tyrk3aigN5w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAwMSBTYWx0ZWRfX3pv8ZrmTcLSC
 3ZTP8TjiQ6q7Y6KHMdVQEH3cKL1yr1bizI4RCe9ozYdzn6BoPNCHvscLr1hWi1Ze8zHStvK/y4M
 1SsU8iplPZDZR0IRRKkPBlvUk0Txpro=
X-Proofpoint-GUID: grNh8lirw-UakFxAOkv9TVp2InlGqn-8
X-Authority-Analysis: v=2.4 cv=NZlzRGD4 c=1 sm=1 tr=0 ts=6ae92909 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=djYDpCgIitZxdph7ACYjJA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=XF986EujfQmVbk2RL3gA:9 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_06,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030001

Hi Jakub,

Apologies for the late reply, and thanks for the review.

> - Does it work if macro MTL_MAX_{TX/RX}_QUEUES is not increased?

No. With the macros at 8, the DT parser clamps snps,{rx,tx}-queues-to-use
to 8 and ignores the extra queue nodes, so queues 8-11 are never set up or
mapped. The patch has no effect until the macros are raised. Our 12-queue
testing was on a tree that also raises them, and my note under the "---"
should have said so. You are right that it should not go out on its own.

>   How does it look like in your hardware? 12 DMA and (8 or 12) TC's?

The Nord hardware supports 16 queues, but only 12 are enabled in our SoC.
It has 8 TCs, so DMA != TC here too.

>
>   I agree with comment by Jakub Kicinski on my patchset 1/3 that I should have
>   implemented it better, but never finally did. Issue is, stmmac driver
>   assumes number of DMA = TC and uses {tx/rx}_queues_to_use everywhere.
>   So proper implementation would be spliting DMA count and TC count,
>   where both can be verified by stmmac_get_hw_features().

Agreed. I went through your 1/3 against the databook. One point on flow
control: XGMAC_Qx_TX_FLOW_CTRL(i) and the PSRQ(i) fields exist only for
i = 0..7, since PFC is per 802.1Q priority, and 0x90..0x98 is RX_FLOW_CTRL /
MAC_RxQ_Ctrl4/5. Bounding dwxgmac2_flow_ctrl() by numtc is therefore not the
right limit: it happens to be correct for 8 TCs, but wrong where numtc < 8,
and it should be a fixed 8 (the PSRQ window; MAC_RxQ_Ctrl5.PRQSO can shift
that window).
I will review the whole series thoroughly and pick it up after testing it
internally on Nord. I will keep your authorship and sign-offs on the parts
that come from your patches.

Thanks,
Sagar

