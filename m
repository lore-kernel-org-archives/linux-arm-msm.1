Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793380546;
	b=sF8a6/f8tWEvqmOyx+yBUbxdR4nnoAhgf2DdACL6CTXJq+RUnh7c4oRjCQyha+xoH632
	 IdmzyCrUS/kr5LxnsM6IfWWk+hwpd/jVpAuApOS2SeOsRfnYnGflGe7hWCIaMLdcrMSwT
	 JQ6hOatAottiWTvN91mcSuE04fUO2NZIYIewyk+OODLnS+PSRURteBZs/UnJ5J7e4E8GY
	 e5gkHdX6zvrdU5P82o4mV5q9qLyCv+Ctt9JEaI1w5EfFpXGau/+PpxTlec7WAykVTUSwn
	 +0ZhZt2s5l0f8HdjIL2EWf77rJS0sM8Up4HkEgp+11b/SMBT+wqPK2UwcbbbH6TrbpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793380546;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=r8DLQMv6bl/QdZfypAZ5tHl7iw2qL1i8GWHVP4CuKC0=;
	b=yw1XjJoo23R6Qm12fciNGV2+cOT7vPVLiPkZeDush8A+Ro9I9c/ZGYiLqX1qPJAcgy6w
	 vsEzRaPnCYRAbT9uiwItgmc4uJPMkkJ3yH9aF/j6qflVIGigxNMjeDY56hhdsf8pxcvCI
	 VyqD22xxpliFJ3ld60SWhiascuXDI43/9mhJ2ixLB9jHXr81TFbYm1Va+3q0rZ4wpR3Jg
	 5fzqUmDxX3tr+iYKyRnl0MwBA/IAWTO4vHwHe2hbar8rl9xOU4m/pJCyD5rEwslaiDVvO
	 B+hdc0XVNVdld70emo28EQCBR/D5haAkhqqxkGM3ffC3+/6ILDfBk/2LrbLqWQToG3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gOg5RBwV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ok7kjFAE;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CDAF606A320
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 17:15:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CDAF606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gOg5RBwV;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ok7kjFAE
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UERBpT2494578
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 17:15:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r8DLQMv6bl/QdZfypAZ5tHl7iw2qL1i8GWHVP4CuKC0=; b=gOg5RBwV3PekfPEO
	+oPNR0MVxk61KNp0EZqXCjntTL7j4cVnSVzh7z3b9qxaJWwQ/YhTjpy4PWVFXxsk
	8ofXm9Ev2QDaCKCRJ25ySsUt6Ld7Y0MZnUaM/dpFcTXfVq/ktbtB2SNXbFtEgZVL
	G0phIgX+21A2uq2glFvBM/JAXw6P7FZLJtzmdHRCtGVpORuCcknmE4OgOw5JtLcr
	FHYGSxMHu2ENa9koFK3nCZACjRCEwathVg+HlRelK3XOjRG5GqEGdT3+dya6XfnS
	hWRi+3hpz9x/oRkNoA2lis9X0ApSlHymkCPdxOPcquezvNHjijLBzKBg/lRtPUGM
	fygoGQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6p479s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 17:15:44 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30c0d568830so1780287eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 10:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793380543; x=1793985343; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r8DLQMv6bl/QdZfypAZ5tHl7iw2qL1i8GWHVP4CuKC0=;
        b=Ok7kjFAE/wMO26XgBDa8NLGudqIFB0d9pWAV3FNdTnipgS6t4j8XPRPPtwhrX+eao7
         yyneli2iiFW8FSBteIJLYXVkC4r8S05aaRuQGMsWb/y9HiMC1SXoJUW2cqQDQgGiyNg7
         fOtvGbAtRZFRkckMZUv54GhG/DbnjmM6QLYDnwlzKTQQ4hWwzOgGH0k8/hYLts7RHmrV
         b32d34GyTX6+psIY/+zvSEIZbw5s9gFUP/GiehpmhNj70EMTOnbcfQtSieMS/oUhgH+3
         oWtEB7dqIEn5wX4J9y/EgmCmNlWgwcNS0/x/mxgJJf9EDdn238m/ep77upDv2W8eUmsh
         ppaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793380543; x=1793985343;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r8DLQMv6bl/QdZfypAZ5tHl7iw2qL1i8GWHVP4CuKC0=;
        b=2ttoMPTdq8+3qQdoy6TjHDzTApJPsC+JMqXNvNp6rPI5gHRBma6PYe9m+T+gY4FTxZ
         z8AtzKYZuDCtgzsfujkJ9Cbi1zoROpHD3bcX0UpW5A7bGKdx4ObL8EBh2uPuHns5lXEd
         cC2FiMC7CYVoY+WSosmFUHDg4oLS3Cq33AkGU6kLrHRaKiI4nx5ev6VEIt7eijviqMZS
         eA638ozp2WKcub0hsQPeRYblkYlspGsdzYCtMuiRt8YSU+aO/fkzH9hoI+64bxnETphk
         fTk6S1ZzYKZDAOYEkjUNNH4ZqbSt4zf+QPGYylf6CASJ6UF9wPrgZDMYE8ZdbISGBvzd
         PbGA==
X-Forwarded-Encrypted: i=1; AKwUvBxPvek2QA+qVyid0TiJwjeRoyp8/HRjBDYdBXJLRt4cDSDKh8VJ36Gu+eHtVN2aD8nk+iERdoxOGtrt5XQb@vger.kernel.org
X-Gm-Message-State: AFq9FYJqWRTyTDe0gHhxbYa6G6DuOg07L/NsLvdzpRYaOpCT/Cn88wfR
	RNwvi362YgLbA8NaI9BQhB7Q6Ptv8lEbiszOATdQnV4ZUzEEPTd/9PjMXoMsN12rrI+p4XtadbR
	U7wTbiLOv1hHez0PUgF/d0tG9mTxvZ5H71+Qte2SGD4+XKNKK8d30FA8yMaeT+QKu41S9
X-Gm-Gg: AYBFou3rZz8jwFOcoB93qtjsmOfXVLlNfxfRLZsus1gtuuHUSIHgiU9RCwWlTHzUbTb
	TgBycjchqpRg9M3KMGIOgTabsC4hQHCbJ4rbPjt8X7BWIJ5RCyqP06MsPOdvstnbybG2rZvnlUr
	eiMfH14Nicqzn+KoMti33syzqHClz23mVszbYccpJgZPlqlHhI03zuIlzha+6qpj0D0viZfkT5r
	1WDtk0WU0wJUMN0i8sGky+FXhfAKTDM5z0pi+NAoQ1otHU6M4MV62v7JiP7G0brJIQwm4vRBv62
	pR1kxlLeckBeyWsiBkvtnW3uWLp7UFNtRskxBRR9jwRKQ+wnGIrAIMIpwOdLSgT9ByiHwlFYSjY
	eEgoCTH5SS1rQW95RohYSWyEOMfPod/32xUVXOk81tz9fXnDDPPPwOLMuL3JxNL6bciqjwUyBHH
	SWwPzbZ9lx5BCYD+S58U3ytzCdn3V6vB++YJeuZMY02HaKBXbvm72kYsHN2xIWQZYr
X-Received: by 2002:a05:7300:a188:b0:35f:4780:518e with SMTP id 5a478bee46e88-36a4238996bmr6833678eec.16.1793380543164;
        Fri, 30 Oct 2026 10:15:43 -0700 (PDT)
X-Received: by 2002:a05:7300:a188:b0:35f:4780:518e with SMTP id 5a478bee46e88-36a4238996bmr6833632eec.16.1793380542666;
        Fri, 30 Oct 2026 10:15:42 -0700 (PDT)
Received: from [10.50.42.16] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a4294419dsm8607711eec.18.2026.10.30.10.15.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 10:15:42 -0700 (PDT)
Message-ID: <ba4afee7-5c3b-43fe-9703-9cd42e0fadca@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 22:45:31 +0530
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
Subject: Re: [PATCH v4 1/6] arm_mpam: Fix the RIS index range check in
 mpam_ris_create_locked
To: Yin Li <yin.li@oss.qualcomm.com>, James Morse <james.morse@arm.com>,
        Rob Herring <robh@kernel.org>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Ben Horgan <ben.horgan@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas
 <catalin.marinas@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Fenghua Yu
 <fenghuay@nvidia.com>, Jonathan Cameron <jic23@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Gavin Shan <gshan@redhat.com>
Cc: Andre Przywara <andre.przywara@arm.com>,
        Drew Fustini
 <fustini@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>,
        Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
        trilok.soni@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        ganapatrao.kulkarni@oss.qualcomm.com,
        Huang Yiwei <huang.yiwei@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        devicetree@vger.kernel.org
References: <20261028-mpam-resctrl-dt-knp-support-v4-0-bdda1e445cba@oss.qualcomm.com>
 <20261028-mpam-resctrl-dt-knp-support-v4-1-bdda1e445cba@oss.qualcomm.com>
Content-Language: en-US
From: Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>
In-Reply-To: <20261028-mpam-resctrl-dt-knp-support-v4-1-bdda1e445cba@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA2OCBTYWx0ZWRfXyY1gMQbILOUu
 qMcRTX8g7b9hdNcrm95UfuE+jbgKqkMbEa3lw6pMdGKujXR5QrHjnp0cHcRQGYxvcr+X8xC5t3Q
 F4+VnPmI+ViVHP6ZkDk1pquO2nBFRqHTkL4wuuNOC5QBcE3KgJJ3aBYYUsqOF7pgBbDlofyTolk
 JdiX7f2FoYIXy97wK8Ol0v8V1ju6TvjtB+alkn8b/L6caRiPl5qzKgL0Eh2A3oXlL0iZwmKpPXM
 niZV/mUjMXk8KkfhEvAxsk/fWSbaYBdJQ0hx+jlpR+7/77VmTY7o3wYctzg8KertF65C4u3dTrr
 8T6dNTjxSoLJrqQng31nwNFONFoH2sYyfz6+RioNU4T6AAQm0mNxDyQMQB7AnAOlDDJEN8YMYuQ
 6fhKPWLwhJyORoYrpUJ/atJUHnKS3Fq/4f+mfHNOo7Bk2x6ELUisS+DFyRVcqlLKZdetdYSWxBU
 JIrWi0LQXChI7UYV9NA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA2OCBTYWx0ZWRfXx1jCAFHNim4T
 O9YvflR7IpVWSwU83daDgskHSsXH7x2Dd0GRydoS+vWo6Q0j407QvA/UtGUbqO1hP5xmWxq6d8N
 jzoH7TCHLPrNkLcBEit0pdeEel/Bc2Y=
X-Proofpoint-ORIG-GUID: Y1lpXzStanTsdZ1sXyUDBtSwHrymfGkM
X-Proofpoint-GUID: Y1lpXzStanTsdZ1sXyUDBtSwHrymfGkM
X-Authority-Analysis: v=2.4 cv=TL3Q2Fla c=1 sm=1 tr=0 ts=6ae4d0c0 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8 a=-Elna7LzL5zmvItKdG0A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1011
 adultscore=0 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300068

Hi Yin,


Reviewed by: Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>


On 10/28/2026 5:15 PM, Yin Li wrote:
> The RIS selector field is defined as MPAMCFG_PART_SEL_RIS (bits 27:24),
> which is 4 bits wide and gives valid indices 0..15. MPAM_MSC_MAX_NUM_RIS
> is defined as 16, so the check should use >= to reject index 16 and
> above. The previous > check incorrectly accepted index 16 as valid.
> 
> Fixes: 01fb4b822472 ("arm_mpam: Add the class and component structures for firmware described ris")
> Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>
> Reviewed-by: Ben Horgan <ben.horgan@arm.com>
> ---
>   drivers/resctrl/mpam_devices.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index 48adc49b833c..347a5a6d6a1d 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -700,7 +700,7 @@ static int mpam_ris_create_locked(struct mpam_msc *msc, u8 ris_idx,
>   
>   	lockdep_assert_held(&mpam_list_lock);
>   
> -	if (ris_idx > MPAM_MSC_MAX_NUM_RIS)
> +	if (ris_idx >= MPAM_MSC_MAX_NUM_RIS)
>   		return -EINVAL;
>   
>   	if (test_and_set_bit(ris_idx, &msc->ris_idxs))
> 
Best Regards,
Srivathsa

