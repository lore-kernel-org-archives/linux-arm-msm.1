Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4C7404BE3
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 14:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791813777; cv=none; b=dNZUPXbg0RPgrJYXHEoXeWp0GWwGRe6D9unExD4ruDXW5uMMXTlRgAtlPP57AYQK7RCI6+AFJjqXjYOl8wd5Fw/Fsy5ZRWIIhGqUyyx1ECsPfCNqPbKiIX9LJcx19YnyqsX4BbS32OA2yQXj6/0aHOp8V0bdszNa8Cc40vpewGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791813777; c=relaxed/simple;
	bh=3zpdW78mGgp+srsTGkAiJ3N4sgm/50ly2DBLW7B0u8Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FP7k6gnQDU45XrERlGi4qpQ7I5k8i49td+hivuF6CkkGoYlNJVE6LeCPJ8cm9hyp52l35R4aK2NQND20hxk6fmhB0B7P7eefW0BuSa8WdSPKrdK1Fj6hI/W2N+UGXjrEagj8XF77qhYcp6qmrplC/yehzcaPxo9plKJ64k7LN/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=je1PnQ0j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fsrNfVRK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="je1PnQ0j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fsrNfVRK"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CBxuNx1404984
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 14:02:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y8Dhbf+kw+pyBn2iqi9fXrVlvfNKvg59yVzCbLh6z2E=; b=je1PnQ0j6JbS+csb
	Kx693YXo33JdKScIeFdE+WmSFvGvmt2676Y+HYHM8yVm9K2OmYY4MHK/yykB8R29
	gR6rO5n5EuHedTitWFk2m9l3JfjSkUYoGEJVIGLWPJ3tSSgIjGspy7nqy32YFhBO
	g9ImlzZRm+TEDM/Ga2caxf9rxLDFF3Z0xspcEocDhWp7ecNw37UV7k3ZsSzn7a+G
	8jDxWRKV2F1Lpz1WlN9NBq77eardAJkR1Ctq0ujNO8dugs4qL9+AkLs899Hi4CFx
	17PBkDfZc/u0DF1A1BSBvz2E0D749cmyt4gBAaTuNOL5FyOGpuJX/Mxtx9KuS95b
	nkauAg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8v7ksddw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 14:02:54 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7c274c15c90so32965137.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 07:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791813774; x=1792418574; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y8Dhbf+kw+pyBn2iqi9fXrVlvfNKvg59yVzCbLh6z2E=;
        b=fsrNfVRKFFDA0HHBeuVshvX81ArHV79p/sINhG855Y3L1GtWmcNgg26cbbds04YgBc
         x//BsiBBpx+1XhSoIa07zBPQ3CgqtOjUBfIfyrPN5a5rrHx111vBpf362B6x8hoiCH3d
         aIide6aYSUP+WBZri6K/SKGg85biXi3O7iba+K1Q692Tq+ftzm5hZXDYAcUFg29fR7OD
         3XP2ywIKEKeDpWlEzdYpmM23pVqKmxjQbxfakQqpj2bX+rVQnb38zA1MQvIFI+7gSl5+
         Id45F7VhbKTszJqUvFA7WJnVHnMV/VHTESaQ7k1J09dTj5wSZkvzVzj0gWerPfkHQ7JB
         wH1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791813774; x=1792418574;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y8Dhbf+kw+pyBn2iqi9fXrVlvfNKvg59yVzCbLh6z2E=;
        b=VOWsyoMmsBnFPc91fbYKrVclGiDgkKNQQCZ5pu6b61tZU6/lW/bhZQR7l0qnYfhZSi
         hSGFyBwmZq9ms0VdlXQNTvR6k8lzX75X1nxKNNHG3wldGc39sr0N6k4yk2EAWVjmDlBE
         V/3iYpPFVEjRsZ7d+GKKEs+yiWdx9FYOVi2608sAnGxGcxKRxFGMgjCgpu+pkeiVUi5c
         gO5WuOHMBjzYIi2fjE+vopwBdM69c+HiJh+lKovsAhDbbLcShYnHoVw77J+Tj2oTJ5BB
         iUMTHjGoEjOTqjZ8eldATB+6UMp9PMIdkd9mXBNsKlwifs3VdvkR8aCBCqJz2PqPba1e
         wGEg==
X-Forwarded-Encrypted: i=1; AKwUvBxp1klvk97oz7otDuWPt/3U7tTVNBHhnZf1qUgry/JAz5sGzs8LWmQNgiS9swkjaEY4464psl8kck/stX1P@vger.kernel.org
X-Gm-Message-State: AFq9FYJkAQWrJ8nl2HAIJW3EuRyg/TukLjy/NpUVgu+rF+jOoEaZO9Lo
	/mGhMqkfypY6ScVAvqKKOeZprRSGBcr9odzIOtsQD1AGrTW9Bg+CC2Jyzb5kV+yZEVL+Yzf80Nn
	iNeNZTOnvf5HRap/IusTI5vQF/etDl9EXTxzoHA3nERmsIbWlwjlxZzrQPKCSaUEuTQdY
X-Gm-Gg: AYBFou04a5PRbjrKenrrp1heyMi4txepfRz0PulvAhqw89rt6WElyKJJxBypDK9MOJA
	WDFafPp3DTd59jj6PGKrQgyxAUH+eQsGMrK0s60kkr+qgYl6MjEH6YjngvYojXg75+g4JaK32oy
	RrWDCXAy7DuSj0ENZuJ2NAqkS61C7yYPSBgovwWVtQPX/3jx0K9/z6p3I80yZtE1e4PHtUJPLbV
	dD4M4Uw58JesRkzNUxim05BryHOyojpiUEoVzHAe1IwmaKFmHQkpO0yL+OoKdsbqw8zJVN3zjcx
	VUYbtt6mTPJqURZipCWdiPaiveN+lYmOna53d1z2jVUMZL19pIJIrthJrrB1813XiJp3YGhsXa+
	xH80FQBngDok+1HSTNbV2Kg==
X-Received: by 2002:a05:6122:650b:b0:5e0:2ba:5a06 with SMTP id 71dfb90a1353d-5e91f576816mr1607583e0c.4.1791813773905;
        Mon, 12 Oct 2026 07:02:53 -0700 (PDT)
X-Received: by 2002:a05:6122:650b:b0:5e0:2ba:5a06 with SMTP id 71dfb90a1353d-5e91f576816mr1607545e0c.4.1791813773496;
        Mon, 12 Oct 2026 07:02:53 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b179dd5e85sm4897063a12.21.2026.10.12.07.02.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 07:02:52 -0700 (PDT)
Message-ID: <bdd18db7-5726-4199-93bc-e3c67100d0b2@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 16:02:50 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: qcom-cci: Fix HALT_ACK reset request being dropped
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Vinod Koul <vkoul@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Todor Tomov <todor.too@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261012-cci-fixes-v1-1-8cd4eb1fc5f9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261012-cci-fixes-v1-1-8cd4eb1fc5f9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA1NSBTYWx0ZWRfX/5QU4Lh/2CwO
 J8y6CBA4NfAvfG2XSA/EdKi7CgQ9ICO01NJX5kZmTXAI+XxsMM5UV//rNxtND37RYqX8aRZjJ3e
 AhfKLpA4Zgdg3GlkBw0qJvydO1EQvpWBoIG2AOpZfShL848M4BmD6Mu8iv40Gsea07b68rUxBF2
 a4Vn08vftFYnmgrKTlA6USNbvsd9fHdCMbB6zpWoHmHx8DGmklKpZZ1T8gnecRIOPlsMgLn72mK
 ndHjElLd7IkJVxi52MvXY4aGJeoYOpyQyEG/+OEOVkK4RYb/9/6KL0RS4u4bFf+WtiOK8DZ+YRV
 vCDJByXy9kz+XF66groCknxI89mWCjAoVX2Rv9gzGQRE5TH7XwvBRb5SmnvYaFaNj5kjucR7yen
 SOC9mktlFV5C7UsHeoofR9O9TyeLcpKB8gEH5qcZXHlGF5nJMXyWv4p+5+yOFyu+f+npDg5Ri7m
 GsAcUc7dHpe8klJ4XWw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA1NSBTYWx0ZWRfX40eMJ7vTi7L3
 id8+/wIep8j5ug8ZM25OGZfwJRIkTaSDrZO5Km55JEawxI5yersRb6p2+AFZ+SPWV+bJjZaIOHh
 SOERBypzKTcTP1T2jV9c6T5NbLsAaDE=
X-Authority-Analysis: v=2.4 cv=VOtIDNPX c=1 sm=1 tr=0 ts=6acce88f cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=vtxEUVkT7waMBiOsAPUA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: axBV1Y6dqa-WS-54qfYPcteSTOa0Dc6i
X-Proofpoint-ORIG-GUID: axBV1Y6dqa-WS-54qfYPcteSTOa0Dc6i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 phishscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120055

On 10/12/26 2:54 PM, Loic Poulain wrote:
> A HALT_ACK interrupt indicates that the corresponding I2C master has
> entered the halted state and must be reset before further operation.
> 
> The M0 and M1 HALT_ACK status bits may be asserted simultaneously in a
> single interrupt. However, the interrupt handler currently overwrites
> the reset mask when processing each HALT_ACK condition, causing the
> first reset request to be lost if both events are reported together.
> 
> Accumulate reset requests instead of overwriting them so that both
> masters are properly reset when M0 and M1 HALT_ACK events occur in the
> same interrupt.
> 
> Fixes: e517526195de4 ("i2c: Add Qualcomm CCI I2C driver")
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
