Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794213823;
	b=eRwA9LGZnT4Bdh+rRJ+RxkLadjPEqQoxpRlVmXVhjgEaWAFxyoLsYZgXLVWiwMFi/y62
	 tDUyP9Ghb8ryxaJLywee781tq1u8E61go6cN3rNTDLdEK3D5F+82RcRJgzrAISa51tPzU
	 qmGIfS4N+RFav09Yfqit7Lp7NoBc6QeWUv6Evy91NCrbPAWN8lTPddjFcaC9yV0fHhcsA
	 SItvKriKiTxM/W/0b/GquqqUqDF6QjZb5OM42buEFLmri5SEkrDo5vNUIKRPzayawNnNY
	 PUBE/4rFedMABnqQzqdjX1xrdClarcO090SusfgLuKyyhZxUPGS1ICjHibzeQzzxLBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794213823;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=QZinr1IAPmVW7r84wj/qNINxqSVY9URVBnEwGBpoonE=;
	b=M/ULpc0cNVTbK3JwuRYud4P8IgczbiW/3qnSN2STE59INu5vqeN+zlQRkvJK37Hgh5Ld
	 GlnCAKycHcHBpwa8pO+Au8YVLROmZ+RO5m4hJM+Uigcm7zdyucR5DvTm17Nc9h+GLaK3T
	 eFQ4LzTNQniAMK+kss7lQMSit+1AadQAtIYFyJ0lyHfGpsdp7rXWdDHMfPiKQz6RNblbF
	 9BtQcm5n51+cCsk+T/wQckGUlpR2cSLpkKJMbNlQLMH7WdCcgCa7BVVvE8AxEn3So0WTp
	 e01NJ6ZPxcrCa4zQwTpzNTgCo5CVaXkojmpFtcRJ3f/O+KrPYejaTXwqUEiFgguPHkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VvGR+y+0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SOGy5zDI;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D6B7606A322
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 08:43:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D6B7606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VvGR+y+0;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SOGy5zDI
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A96A99h3634428
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Nov 2026 08:43:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QZinr1IAPmVW7r84wj/qNINx
	qSVY9URVBnEwGBpoonE=; b=VvGR+y+0j8b0rhQLb0HVC4mSOI+FUqfuaAEz/Qot
	axbIu+LIoxtWGQMG7NMBK2wqU/Zg12WJ2L/eOBsviPDqCh2xbQonaFtAXHPdXrYR
	PwE3/DphKE5hepLXvAN+Tj5xf1iZAdAMlj3EQikKBa8vn5alDS2T+7eaIXOhC0iT
	0ZTAZCaTgW/N3Fqjs6c/JMWNZtQBRz34MjrAIz3R7wSMnakEv8NX0RyOvjIo4e4L
	9P6a2QVx3POhffcGv/RXdje5F/MwAcunv9j1CA6GOcgcpdlY+rjDbxCUf01sAv9S
	i4UvFFYJIpdo0x+Jx7OcfA36tAl71VPMy1/mFy6+ZY856Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hu6x2gunw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 08:43:41 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f32050e72so60301385a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 00:43:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794213821; x=1794818621; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QZinr1IAPmVW7r84wj/qNINxqSVY9URVBnEwGBpoonE=;
        b=SOGy5zDIrjS42khZEbmK4fz9VuLy7/WxjHA8vDZB6HHNH43vt0sQztxXAq7BnELLzD
         cJk4PwQBWcDj9e5kQuzljlpaW3bK/ZNSmGhfXYb4V2Aa9h/KKCSe6T3+G44b3Cm7CKM4
         2J0fDj2wg8DePiyjyvbfx9UyMuLT89YPtZuazFHEjck2yv8lOREdPxIXz/suRmjqKiT0
         Vrg3SuH5/ez+WG+1ZhYgJN4XU9ftlPWnAb3zm75BmvWGaR6wbz58kjKPJYG94iJbETZW
         wm9rIYeiVefHLt6RoiMJuwDLy62RHxAaee2Bsidz3Z8MiwydDkoYhG3JICuvdquz+IpI
         eiMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794213821; x=1794818621;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QZinr1IAPmVW7r84wj/qNINxqSVY9URVBnEwGBpoonE=;
        b=C0BX5Jj3pdglnj8ixNdew+OGd+NhctMma4fglaroDm7dkK3O/3Ji2lKHZj3EvVTPgt
         /CiRd6jVoEGGtc3TvHFWu+7DjFBy55xHA3nwqH6rkw0EGvwAt1M0oUzfdxtzgGaHczu8
         p/3yh6CgDkV26ltpy2dtP9XAicpXb2ktspDScKxTfc0V6Y1vz7WrgY02gUNtj8NkvWq4
         cliwjwtBJhov8R59dl88h32j87Rrwdv7rCXbNhemMKuVndc3gFlaKFYUQ2+6G58Aj8sr
         3rjWOzGQJJl8ZJvF2Rp7YgSerBwx90PqxRDS4ceA6D/uljTndL0ygSCX0JSns9y/KFeA
         CopQ==
X-Forwarded-Encrypted: i=1; AL+hErFuzAy8WIaOpK5dTizfEq8j4Smzo6KcJ2OO+xQpQqOCGrTylbBxUEsR8enOksoofhRu5qq1H/+xQyfhX8WR@vger.kernel.org
X-Gm-Message-State: APuU4Z/oWESMr+vBsp5TSZY1qblUbRyFWt93EniQITZBWVqBMOjpoknR
	eZdi7D24jQpP1evyF8JzYDWepEF4iGHi0XmgXzGudZuE0ikU7wdo2C3HK+1HBFxDS8fH8ql639/
	3yiE+v+IzxElIYbC8PuT9g04zjzTen6LLkMeMShSglFgqANm3+NZe2imSSCX/LPvNn9ue
X-Gm-Gg: AYBFou11/fpsA6ErjPu4Xr/y51o6fgOLE6w9PVkkFufpDdDqugzlWTh2wXp5a7UqDEr
	H5QOtfRZD+CtC+26obtr/ehiXhnu/G+6kXoYznd8Yp88glyriG4jGKdy0Aj2LwB3ODjEEOLHATh
	aWJL2jxpMAZ6NUd+/1pOFwoOBMg12U/j1lsczzFnjMplbObjZ7qmtc0ZRxxPKwjZ98mPk8IE7fg
	Dkb6cEBYV6KcPaJ02Stm7sR8WhLsIKqXdgD7HCFlucl6cFRfjEvmFeZ71SbVwAfYrmiCMX+Kedo
	ycSYXnDma+ZcfnTh/czdbsnRZ039X1ukh8r36ukAMg4tMfRUrQbS5OPyWA0wFSrd2op6ytJDi4o
	6XmpmxRfn35xYaV2s29RXEpnoE3NvMzNQcwRQMPIIdXb1aRTMNKo1Cik8zRu5jjE=
X-Received: by 2002:a05:620a:6601:b0:93e:c12c:fbbf with SMTP id af79cd13be357-947842c578fmr423491585a.76.1794213820795;
        Mon, 09 Nov 2026 00:43:40 -0800 (PST)
X-Received: by 2002:a05:620a:6601:b0:93e:c12c:fbbf with SMTP id af79cd13be357-947842c578fmr423489285a.76.1794213820190;
        Mon, 09 Nov 2026 00:43:40 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b96cd012e1sm111001085e9.8.2026.11.09.00.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 00:43:39 -0800 (PST)
Date: Mon, 9 Nov 2026 10:43:37 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/8] arm64: dts: qcom: Consolidate Glymur CoB power
 grid
Message-ID: <643lhglqyf6322f3jmioy7xwl5uuqgy5m36wfh7okny67zxz4q@ommxzt73cwkj>
References: <20261106-topic-sip_cob-v3-0-52cd3826ab49@oss.qualcomm.com>
 <20261106-topic-sip_cob-v3-2-52cd3826ab49@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261106-topic-sip_cob-v3-2-52cd3826ab49@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=TMjQ2Fla c=1 sm=1 tr=0 ts=6af187bd cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=WbsCytHUCBBKkCb54EYA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAzNCBTYWx0ZWRfX+Ncs8k04W/ND
 hrxZTQQ3TQfq4CuEFQVmecUdb26MpjDUHqDvI/nPkzPym4NGSwjGwAh360yW1tKsEIZW6iagZZC
 u48udP/ksBtrnRl5BHmv/91+KKoqJPGU8r+8UulTQvYKjbHqiOKMINtODGetJ3GrLZTLgunycyk
 V0Cym8VUj32noX4kziFbM1fNGdRNA82xF5beUe98fZT/Vg7shb0Zixjdl/3FXTLi9kk6PP4yaMc
 XRnJ6rd69puYf+EB2bvS0Wa99HVJZy7Ku2vNnY7BhyOvT8bOJUemJnVG3cNZphU+EdB2xxM52uj
 mQYH2IOPrIDljUCfoD4QIk2zrbGTgGHwRI97w91CrL6VeTmFz85Y4/r490hj0JbdXiBqb+u4nNz
 EE8YHt+mJrul2QPqc5AzdsHsuQjldGIGp3WjrgDDEqrIzK5tMpnLRCbQEax4uGs33DFrnjfOGfV
 XclkncfJLmhd9H8Wu+A==
X-Proofpoint-GUID: AgDwgq7MMf82m5fbniK6M-uZWKmzhgKw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAzNCBTYWx0ZWRfX6tniZ12jZOWl
 72bW8BkV9LOH7Ed7ufbTW4XFdE6lyynPVhILdGOC9akfMS7nFlDHBoBn8lw8Jr28FyVoItDmi07
 Mmx5XPs9kZh7QZZfsXlIGzprJE6AVak=
X-Proofpoint-ORIG-GUID: AgDwgq7MMf82m5fbniK6M-uZWKmzhgKw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090034

On 26-11-06 10:29:03, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The power grid is partly defined by connections to the on-SoC
> peripherals, which (due to various reasons, electrical and practical)
> are well-defined for each PMIC configuration. Factor out the common
> bits for Glymur CoB devices.
> 
> Because some DTs (mostly the CRD) disagreed about certain values, I
> made sure to look up the desired one for each of these common rails,
> they are now set as expected.
> 
> This enables one to take care of most required vreg settings with a
> single #include.
> 
> Tested-by: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
