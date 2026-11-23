Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795443156;
	b=TOzKFbpxeYPW6M9WgOaq2BXGGAxQWaPAOaayjR5mB4lvD8mqW+MQJrWZEHoiySMNaACp
	 3j+hBWdDE1X0J/nlnf2qO1LOhf0mPzkq1vrjO684sQkmRPlXtSwY5Peg0fRf557pd+vWr
	 VtnQoLfIXtNXl17RWDowzT03bYqYbFWetMY5x7u/KfrFU7UPDUuTlltGUmos3trMQ+0fx
	 b2ivlpCH5xn07ojEX2S/dhtVnxAlD2YZJm6Ev/LkndQ0//PbJKoulprjlgi4ZWK3rRHjM
	 iIeugsKJjuQ/TTcd5QruJNZpj1uORVb2FGUxRB7LblCkYaxzkL3PedM0xO5OS5oWiTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795443156;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fq75inYXxrYikV0Ezj7Q8lFn8dabO3zvGhweT2/V8MA=;
	b=LcoFaBn2oD7AAlmnCwcP83kCrBEYfnLscbfRd+2gY4/OWwTa/MmzPGMPB/J1UBJ8bM2n
	 GD5clYt9IalBNpWHR+6K7Jj42ZS47D83VUDXe+0n/0OxE1F8x9iLgD4hOQ2Gf3K68CfSq
	 am1H3DIBzAk7mLaPjntpFE/hvHhr8gm1phrI4NMtU12a+ZKK5+qOWqcZ8yhhwvZOIDkH1
	 IscEL76Qx2O8hI3RZzCw02zbZYfDL6E+EgUZ+GG9K+n3zzHlxc8/7YD9bGon62GXp/z39
	 jgwTDZKef7ZXPucPihlLtzqiyF/LhnMk9pWxRuukz9OGEOPEzbnoxn9smuPJbx8ABEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZKocMOYx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SHMSnGwT;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EFBF606A32A
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 14:12:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EFBF606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZKocMOYx;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SHMSnGwT
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDKuk33329308
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 14:12:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fq75inYXxrYikV0Ezj7Q8lFn8dabO3zvGhweT2/V8MA=; b=ZKocMOYxmja2LYus
	uJysaQFVhq0gXn7bdilgo+wb7nKzGltb5swiYoYEic8DI71pOM33oYFP+/wwYi6E
	xQjcf8zNZ/cm5Y1Ncfnb0GnnsHdHoQ9m9vZwJTpO4RM/z7NLrquIjRREQf0G/c48
	AKV8Frjrale8Z1dHRie5em5v+Cyb4aZTMarxhNG7sd+pUoGuG5eSGCLDqkhbPcAX
	4legnvQlpS/6/IPix8KBRzNPjWLSLZE5faBMbKsyYrzQhq24hWa8WSaRNd1EpQlt
	b3hIL5Umt9GsLT1tx4Q2PIgeVLj17rgEqAPvbSWIY92FoAZZ4lT+WnxzZkTwLBYt
	OE+YQg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fyd1rdq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 14:12:35 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5ecf0967947so81960e0c.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 06:12:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795443154; x=1796047954; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fq75inYXxrYikV0Ezj7Q8lFn8dabO3zvGhweT2/V8MA=;
        b=SHMSnGwTOnxggiRKitcgnBYeAevLrf8cxCOiDJdVwq02PZDCKZr1VUW6BynTpvosNi
         eSiuhBHAPF22cTQgeD13FsONftVknHPz0sWH8o8tYAx2m+HWWf0nczPvGZDURpc+F1VO
         ggkVgMPuQYKM04e+bmNSr7O2WLZXzjmziqwF7kGRqsklxU18rN9bv1tPRl5tll0NdyGj
         AuxMtNyoyjHJmBybiIZ833YQXaYPQySxe4kSHhXKOcM4fiM5cDS9R0Q6o5+In7h07BVF
         1DU7ldH6FdQrwTfjjIPvL5PisnfI/APB0EgTb1ChtXEayrntmv5THyCVR/puKqN/DWXt
         cSFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795443154; x=1796047954;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fq75inYXxrYikV0Ezj7Q8lFn8dabO3zvGhweT2/V8MA=;
        b=y+XNgaR54lr1cv6uThiYZQB/56t8DuvD8rnWWyBGDvks10lg+dBufKohkOCSL6m34K
         vp3yrNAAATvZa4dfa6AOxKpleKgfagN5dgB/Icz22P2Yq8u8T5if0BCCT53L5CUg7Ad0
         RU2gYMpMiq/sFFLsfn3BxblD3807RRpDu3/wWQIja2QH21krdMUOxVdh3TdckMtYqvSv
         P1xiM2ixX/5JcwsX9J89rF7XmAMcT8cs7YjdCrOW7Ik3YPaKU/WEUo6lYmwBIe8c66qF
         82SRnUs5zRsXPZtE86/rsKlNKkverkKjTeYAC9lgzoP35G49+hS4XEpvipCX6pdU/2r1
         dY7A==
X-Forwarded-Encrypted: i=1; AL+hErFN4p4jQh+p3oyRBod98j7gj5cMzRNG6vcRIiU7J8lcek9DgxkTXPplEw8mRATOyFJKJ0X9uKeZ0wxiUHnd@vger.kernel.org
X-Gm-Message-State: APuU4Z91c/F43YdWjjZKRrwXucMG1GUUxGBi+GLrETOJ8CVwkmgRKPrj
	j1p3Ksh6bpywuUkDq9hPtobH6Hk+Mn/tnHKZa3cf7uZ79mZhrVvJpBsosQgLFnpIAxHHNZxCge4
	MteHPBTv43G46xhZGOGclcRLR8xEUt8xbYFeRZqKXGDuh/jHOdX4E7bFx6w0Y58NPkum1
X-Gm-Gg: AZFdTZebwVt1OcgkD/275sx6gDTtMPb1QS/HxYQGJck8glUogLJG/1tom3JyPavsAPF
	cJ5HROQxKkcrv8QboUr6fJsvpfJWOGwV1TiLShqspuo88HnX2RVV+7rBhzEIaQxk7GZ+k93SIPn
	Wj1yJ2uWyS0aFNJm9wLToJoiFiZ2mmLimaukM3jM38o9Bkq3NFnGor1qvAba3+Xv+jCf/+DnOVP
	E3KPX1gwO9pwEZ5c+y1hpkbqUHEGUtAqElL/RQLjR2XN11dnWkeJed+j6Zb2IlkGJtdBGCcVf1e
	wCKKzC4vEnpCncfhpioIY1K8jpnJ7dZOMhE3WNEzqHHwOsfose6kfygERWG2AfenGGNVDN/6xns
	VbqiwM95wdosZ2v0TeDiXgnPBl1RBm4ECsmm+xCL/eELWvfzs3WfM5Cn4x5Q7PoWV+1Ydfb0=
X-Received: by 2002:a05:6122:c20f:b0:5ec:b681:f4ca with SMTP id 71dfb90a1353d-5ee8afd6c93mr6901108e0c.4.1795443154173;
        Mon, 23 Nov 2026 06:12:34 -0800 (PST)
X-Received: by 2002:a05:6122:c20f:b0:5ec:b681:f4ca with SMTP id 71dfb90a1353d-5ee8afd6c93mr6901052e0c.4.1795443153673;
        Mon, 23 Nov 2026 06:12:33 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc73d3sm409929066b.64.2026.11.23.06.12.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 06:12:32 -0800 (PST)
Message-ID: <f151aad4-4642-4e71-aa25-3811d29052cb@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 15:12:31 +0100
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
Subject: Re: [PATCH] MAINTAINERS: Drop David as Qualcomm SPMI PMIC Arbiter
 co-maintainer
To: Abel Vesa <abel.vesa@oss.qualcomm.com>, Stephen Boyd <sboyd@kernel.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261123-spmi-pmic-arb-drop-david-v1-1-c6be14d9d22d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261123-spmi-pmic-arb-drop-david-v1-1-c6be14d9d22d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: AM5NOb_YvIETuZos2-SaI2bCTRnK6jA5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA1NiBTYWx0ZWRfX4n+eGFt3D+IT
 I1XN9a3SPVASottI/6qh21COCkttTfS2ePzQVFXtnm1EHr2aewSgiehGsi/7k++GTkksdxtmMD7
 6IqpdfVET437YBSASO0hDdPQo8DP3JWikHgJYMkHChSomOj3qwyrv03CRfpBl4lECrBkzqvD8DM
 Aw/48IUsBia+FCaUKl0xtWKXz39CbxeoZsLcoQfC0uHXKQkY3Idth5y7fo1HLLYcDTs+waebucZ
 CsDz6xc18NtxXy+3j1GFkLJoHhvFVH9PcPq9FKon7w27UGRkalAxMVGnotAzR7OzhIxeruMB/xw
 /FO+5Tm4+0CPFCpeQpCUV6MCzrNjt+MvKCqaJSkr8GhiJQKRe1MLUMxs1q9aikvsSnp5PzKtvM/
 zwrdnMBpRFgHnN5Yu16QDw2WZryoFbhPHNDKjHGge5g0CmU1U7EyZwbvgpI+M3K+H33e2+rL9Ov
 UsSfrSdoow5Ob3Kb5Tw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA1NiBTYWx0ZWRfXw0TtBOhZOmbm
 zWv6AZMYiS9yXlntqixfuu+JQmcOJz4JByDrPLZIogktzYlhCk0kJm/1tc19fExqMiN7qcRPHlB
 szKjvXol0CfTF8Qkg5XT30IAiSdF20A=
X-Proofpoint-GUID: AM5NOb_YvIETuZos2-SaI2bCTRnK6jA5
X-Authority-Analysis: v=2.4 cv=Aol7T+9P c=1 sm=1 tr=0 ts=6b0449d3 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=q1OLuhYBDE6bPA1skz0A:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230056

On 11/23/26 9:37 AM, Abel Vesa wrote:
> David has expressed his intention of stepping down as co-maintainer of
> the Qualcomm SPMI PMIC Arbiter driver.
> 
> Remove his email from the entry.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
