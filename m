Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795446939;
	b=DouoNi7+EKkISEwzCG3pww1ak/2txJbpQLZHJsPBaR4WkgJEoH0qLRbHeINyquvbPKL8
	 LCgfoh+Jyq/VCk4ucJgkqbH8J4vgARe4cNJKQGxf34+qDgLKNxf5BOlKXjGNc3Dp9l41g
	 n+wijNlz97I1lgEiRZeOCg7lbdFBHCsGydF+iv1JomyAaiDZet0l4ctyxCBiuJEIA0VyW
	 oAjghhpZmCeHamXiaZQkQLjwxKrYE+6mNM+Ad6qRMSKrdRfosdK2BLGSL9BHX9+EBlkAK
	 acik8KRVE9onLLyHtmGZ1QLGC0xEnFb6RxWAiuY3/qBAIhu69OM3XTba/rNhfNS3pKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795446939;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=z/sHlCTmXYtnxoeAipWhDKUsLvrW6CekBF+Kn2H0iXE=;
	b=J74MXMMzFu5vTOEO7DFGAhtUJdZAXmTURvB09kraBSCMT8/n9kjZViA5+c5CjOoszDp5
	 oG5SVnPByRSxy8ABAwICN/DqnWO0DvcbivGU1AX6jaKQDVcXnEj1BC7KktD8+jEjPrmYC
	 H//t5a+1J+Erl1vv2bPSuHsNCYAWq5Ku9C1qI5i/FrLPerCHkCNJA+AZaiC8h/HitKlrF
	 CBZAssZ3MEtda8YLmFPNBan1ABFLLHHqg301WQ6L9xqfbBv8h5B0xoXgrIuW/kSIf99jk
	 aJh+eeAvRPmQR/uwuOZrUnCVfGQayPCFcJCv60TyvFG5qycljMgBu1gyq45ElCG6RgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RbGcKizV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d6BCFjrg;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32EC2606A31A
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 15:15:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32EC2606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RbGcKizV;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d6BCFjrg
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDL18n3072384
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 15:15:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z/sHlCTmXYtnxoeAipWhDKUsLvrW6CekBF+Kn2H0iXE=; b=RbGcKizVqDubxZ2s
	XdElEI5qb6xou9QJx8TK+SjGuoxgquvtP++YpXwPUYmDQXm55egul1rB4PiG/toI
	SNnrp9y4hSrPrhqzKwAiD/36mhFD1IcKy7MCaamk34KOqhWxPDXq1CKPcx2sIilf
	JFsh5e8fhPiFX9a7VagdYkkCLtg8dedtPLk5CBs/vdaHslnxzy6cOfAeT2nNfOuf
	eMU590ZKPuiK4MxyloRRRzC5WuaRjixhscNM6inKdgN7fgjb1eT4Q1aOVbpPSSYH
	8/CRJZQj6u3jHyKvHC3TyZkkKYwR8GWGxFPN1fKFAU38qjavmHpB20EtLGwQAKEz
	2F6bnw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4hn7smr9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 15:15:38 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5ecba171914so95720e0c.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 07:15:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795446936; x=1796051736; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z/sHlCTmXYtnxoeAipWhDKUsLvrW6CekBF+Kn2H0iXE=;
        b=d6BCFjrg13FzqfaLffeZQrCWrbVMzBhJXN+BjIu4I6axXp3bUmR9UPT2xGU3ICHHK+
         +MiiDerTxRzzxCI3S5qhF584L8V7dSHbxURfr281aZJugqcfDHR8noT50dRSLWwlv8jh
         OpZJzKQxNM4syWRLmcYxW1u8HUOypIphTuY3YLO2QitIXQ64j+9mmHablzH1A9WdSJIJ
         dC7gkqq5UJDogxoa7KIeaQ3XppFTzsIFLLL/eo1BXswv1YUnGvKqObcA9kq2FgUwF5je
         kE73HNf1DISeIPt+JxAHH6n29b/BA9lUMzNCY3PeUNnR5qH8K8LvvOvvxG3Ves1yuqhX
         KPZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795446936; x=1796051736;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z/sHlCTmXYtnxoeAipWhDKUsLvrW6CekBF+Kn2H0iXE=;
        b=ybWiE62S24jdRhQuArKOL0T1a6d12bFgnfBTanx/dt45KHfW5B350RBUjRxdPNclAt
         JWZXR5qR9Ln3fFYU3PV2vPK6FmOnh47t1TxF92aX8gd0ND5iyfX9VuN6s/+mwfm2/ErD
         BfMPO1JnS2Nr28hyqkhG8twcmZHZlf3tErz2pgXDkXKj3oVyTYNOHdF9S3tgqihTdNOo
         6ntAmlcAcqQnAxv4y5Z8RPy19M+M0pzuwf0wP5YRMwY7PoAL9p8tjPEw8Aj8VcCGB92D
         AY6EGx/h6G+CpTcQoKpo7hpuy/SQ5sZcP9mJ8/n7NYzrT9wm1CTT7VmcitNEWyAVU78f
         ZGEg==
X-Gm-Message-State: APuU4Z/2/I0X3FGxC+Wkxa6m6e2uoCleQDp2+lzUWgXeDRHnSUZjLTMQ
	DZ8CjB+YcbOWvef477QWynJ84/fNoYdh7ohWQGOrG+qId7xWGzxPyqq/KQTVcM2elhKAK5aypIA
	8Pl6ZQl0yjE4nkhChdMGIOp1pKznkoM/SHKVUJSCdbyGOFYBUwh3U1IxDODHtkHWNFtNB
X-Gm-Gg: AZFdTZcexq0B34SYdJzqFpAfF+4WhOTc610CngmPuGByAGIlQu06UvLgcmT3KkJoJEK
	t1DNXyn0OCRsYwzLz0f/7GGMcm73lZRoYSoQeUAkVstcZVbekmP1bRAaLRy2sbn994I1Yngtx1T
	2jZ5QrZq8QJLEvlBGoPMRmV+SOA0mrI4qltoOf42JwG1y455sBjLkuF1ZbamqdnLi3K3PSTzyoa
	1HLXiNvV6zUhVN/ubtwWmwEchfwOWvgSE4ZBWSYNkNWRg93vdi3AI9O94xBMD5LRAvd6HWHhZ64
	OXcNt0zTCtYkwfWNkc/iTBD37bTsAAg8BPQ0G7eMYGx9MXLDQj1IbtXhCzR0viQdcL75Bs9kJkr
	b3PlRQ6iJUfMMWIP5dPIGOw3JgQD3qBKOCzVdAhaARkMTZb2Ppl8YMco14DALujT4M452T68=
X-Received: by 2002:a05:6122:3a19:b0:5ea:c3bc:c584 with SMTP id 71dfb90a1353d-5ee8ade9b2bmr7856099e0c.1.1795446936331;
        Mon, 23 Nov 2026 07:15:36 -0800 (PST)
X-Received: by 2002:a05:6122:3a19:b0:5ea:c3bc:c584 with SMTP id 71dfb90a1353d-5ee8ade9b2bmr7855989e0c.1.1795446935797;
        Mon, 23 Nov 2026 07:15:35 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba36d730d1sm5498485a12.0.2026.11.23.07.15.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 07:15:35 -0800 (PST)
Message-ID: <7e2f2ee9-0464-46e5-875a-bf91d64dbb7e@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 16:15:32 +0100
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
Subject: Re: [PATCH 4/4] pinctrl: qcom: Correct indentation
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20261122-b4-qcom-kconfig-unify-pinctrl-v1-0-f0068f161636@oss.qualcomm.com>
 <20261122-b4-qcom-kconfig-unify-pinctrl-v1-4-f0068f161636@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261122-b4-qcom-kconfig-unify-pinctrl-v1-4-f0068f161636@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ls0HWXdc c=1 sm=1 tr=0 ts=6b04589a cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=kuyjF62R-fLzJYMBhd0A:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2MCBTYWx0ZWRfX4D/zzm0IYeb8
 /56RD6RVPPU475XBACAHWKzAT1DLVkd9EVXxjFBxXSbqQkhkfr4ABX5CegCjW5zYMJ+EQhmTJQ9
 zU7GHBAtp1CjkdvOIMzy4W4GNhpXMKASdsBhh2WxPjelBXQGhJx8+uQvaDRJwFweXHVvFe3g1k5
 sazlWJzVJG8Donm5CbVjv6rb5EMouqqrzDFYNR3G41nXUKpNbP7qfTD2zBu6aDY8Wl9CJq7R0YH
 dlp4qChlEmipZy3vqZlA48ELLJEqFgNKlJT7vxzeq79cdwWbhmst3zWcbCXUKH8WRCfLoH29MNb
 zRd6CzSx/zUcrUioN7+ILw6Sw3+Gsll4Ss9FlMylWGqnC8pIQR64IbHqV6dldkHUq+l3pF4rEFW
 G2W/x7PVN4XK+pOwYTL3aMTdfMbjXgbGguT/h8Yf09TgMeTwC2cAj3Cf1uNlqm/z5ZicPqnywNi
 HZEHlNGUmYwW+JBdGjw==
X-Proofpoint-GUID: H3icwI9XX_fjvRwapgoo8gyr_SN7IAcu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2MCBTYWx0ZWRfX7Ea3ZyeUP29Y
 FTOcR5wdOGHLKFRP+AinqVcB7eXrvd+f7w6GXGoGHB01X7JNF/XJ37cSUyO8I0n7k666FMHl3bY
 B6eHQlpZx79bQ5ztrKk+DKIGN3wktnQ=
X-Proofpoint-ORIG-GUID: H3icwI9XX_fjvRwapgoo8gyr_SN7IAcu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230060

On 11/22/26 2:34 PM, Krzysztof Kozlowski wrote:
> Correct Kconfig indentation style to expected tab, instead of spaces.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
