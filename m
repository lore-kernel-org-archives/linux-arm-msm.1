Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793631797;
	b=hK7CQ600GYe2xmqb3r26G08dCxH02yAMxk+hb4YbcCFuhpHGZEd+5iQb6ZtHCNI7NgKX
	 1qvisk1GE2qmUjHffeD7DR51zAGSNSo8PUsRKsvZD2R69GApbXwiBhvt5WEvuTICK49eu
	 vMr0zOJ7K3veARWmLWQl9+L8OhiHsAUbXIBbXlmsdfLKWhHzc+rHv54PPjJJQEEaT8SzX
	 BcGYOoOqwUu6RDssFGjZ3OW4JIRI0/U7abFklmSj8wcJkNQVdqnF1rubAneHJPoP3q5PK
	 amG/FO44UWn9IkEzDP4engXoWJjN1FRV8xMaCkJ4FbcCm1Yzx13nbmACmubFIC1PR5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793631797;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=NaZIPeHJFWb9YSV4xiIF6FuEZn7FHHL2p7dwHN+KzUo=;
	b=kJ4WVeiEBTOw7htegMvNFxtK9xmE/6Ypfz2lVU3u+QvHt/a4dDwQpqlpv38azV9oTABd
	 KjcB7nGZSSfShD0for3FWw9PTdx9BrLA+6WuPBN+5Pi2iZ9bF5AXfpao0WZfP8oXxn/nJ
	 sDticIQtrphRUpboUHf7WJazYG6Tqqw20E0/dkWt57c5cdogik/LI9MkloIMxyKcKcRCV
	 8yn5cz0cRdWhJZCMk06y+pcE6VSX2qgCQ6+xOaBwW8shl+2q+OfTu0kNr5r1wVoyFjiYM
	 FTDyeKmpnrMaObd6WZnv5m3PUgH7Bl2t2cmScVlemVzh+alhSkC8y/cSLGfIgxSBY4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p1NaAAgZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dakGiwL8;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D5856082BC8
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 15:03:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D5856082BC8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p1NaAAgZ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dakGiwL8
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpLEE845675
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 15:03:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NaZIPeHJFWb9YSV4xiIF6FuEZn7FHHL2p7dwHN+KzUo=; b=p1NaAAgZ1DQr8ZyP
	ihQIlhr81paqpITIhuVnOV8qSW8FV9kvsHcrlE5YTSChn01KCpTI+3DA1Q74tl8B
	HIaYrQoAteb4uCfKxjULLlzJOf3fr1Tgm+I/Iak57E+O0r7BK9bRg/Hwvabniu3g
	Dl9HmogXKMNOSm4ZVUfz8vTPOE8nY9/SWH3jqWXmVrdvfYW0G95ob96uaZ6YXMMw
	cKUeXQAlyGnWLFh3phk4yi/UDZJEq4cB30ln+piAdCGPYSo07b4zIhNFEJQYCsOf
	roAyHaDcCelR6yxUsI0IUPUOCqsPn3xgS7OrK49/YU058VgzKpsYbg9cCbymJ3Sq
	PT8ESA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpmf1t6hj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 15:03:16 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5eae4d7ebd2so153975e0c.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 07:03:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793631795; x=1794236595; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NaZIPeHJFWb9YSV4xiIF6FuEZn7FHHL2p7dwHN+KzUo=;
        b=dakGiwL8NwpFewzI3h+SzUKTjYB8D1LOPzYtln46N9sQpqU87S7vfJBUwUk1firXel
         vt+DaKKVJo9ipjtOjCeZwJSdWwTHDU9+dCI/HrJZIzDUaYW+gqaKjO2t86Czziq82FZC
         0YRRlcBrDIlFURz3UlvuPJzVwHqrEWsBJkx+r1BmE2ushtE/ybelS7u22yJ5MP7PP40Z
         22YHEUWlCjZg62BPOsOnRvDbAGODb6NwnpAWXW/gBCaRtv3EkgutZ+Ai4N5mK4yV4Dn0
         kZGdisuxpopxZRBDxLYnrpww6a2zBOZYKnNMuKr8B/3XRGaT0Wng2fsWl/lxU50QC3tN
         5biQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793631795; x=1794236595;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NaZIPeHJFWb9YSV4xiIF6FuEZn7FHHL2p7dwHN+KzUo=;
        b=SXAHKyNCCVEY00hIu0984eMWt5IEsI/8t2OucOD1ESb5sfPSexV5fQCW84o2XNuqft
         o+Z7/9I8QdtBO0Vq3hoODOkaU7/gycFqh3dBPG5xyYB/6W9OMtRGMlGxCI3f+lMpgk13
         oR7JMlfmwM9sGBNuOFw/TlySS2wBneMM3tITNgHK8XmBmCF/6K68xCdCJ/P4q4HIGlwl
         XF+AFatrRsjxp6iGPRB1wl2hl7SnlFSicexyKt6JcFpwwcQpRl7eiuu8l7WSwcDjua9G
         wgp6R/6fmZK98cNNl0VeepoJNH7EPy7nOumADtBxLUOIEGFlgoot/5nQorzCmU1MppkN
         efFQ==
X-Forwarded-Encrypted: i=1; AKwUvBwalJ6XfG61W77uIcRPriNMHbx0gydiEaYvWztvJ6ZBRE0hxEo8LiOI8hXf79/50MqQPRdnnYOVElZVVWPZ@vger.kernel.org
X-Gm-Message-State: APuU4Z+Io5mKE7RZoR1eQe6FNUM145DJmVp7XeLt8s9/xyB2Cuk0Fpdq
	R71NIOwpWW5mIYaifXULj6oH0ObbZ+eNeODMOlZAwbD4MmwApcJX8BTa41SkGLa9gl4ovY5zoMN
	9PAkBJ+QOiWulfUsqUW+NY1Ceq48gsNU2SwDdyh+rKwXINZrtmtsMmDYEHTcCCihvTeYu
X-Gm-Gg: AYBFou0ksTxKjLd7Cu64dduKJjAHUw18++JzRgNaoW4qLHg/hVWzCM87Af3k+lqPT1p
	nGIDJdIbXmgnD5XTzjNWFkeRnkH5DU7vccZ0wRhusvKr++xvPtiteUfi4w1ulQ+IgC3pfq7/L86
	Tw9kvbLQ68BjaYBev7xL02FyGWH9qKwL7wpfPA5ElxSzM1AFZB52Xe2g/Zt3g+WmnvL/nDtyCOj
	Dy+xG1vFsW2cbHD8LLpH8QO4u54RYfvbwVe+YuCedv3vB21BvSHeUZdHOvOy6ZJhPf0LnM/QREJ
	ld8M99whCuzspKQE2ExsEVbJpBfBc3RtZSgyJz4lQPUQOfVxtl+v+mln/7wvouDdsk5avPwATpE
	jT9F1L8Np4pyr+XCnu0uPaga1WBsAqnEzIKqxV5awo+5TegiA8P7kCl3WX0MwxWsb0Loy9g==
X-Received: by 2002:a05:6122:8487:b0:5ce:bde0:9b53 with SMTP id 71dfb90a1353d-5ec6881cab8mr4165974e0c.3.1793631794274;
        Mon, 02 Nov 2026 07:03:14 -0800 (PST)
X-Received: by 2002:a05:6122:8487:b0:5ce:bde0:9b53 with SMTP id 71dfb90a1353d-5ec6881cab8mr4165778e0c.3.1793631792302;
        Mon, 02 Nov 2026 07:03:12 -0800 (PST)
Received: from [192.168.226.93] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cebebf164sm282766b.13.2026.11.02.07.03.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 07:03:11 -0800 (PST)
Message-ID: <6234d23b-09b4-4a78-a2d0-35a71cd70504@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 16:03:08 +0100
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
Subject: Re: [PATCH RFC 1/3] arm64: dts: qcom: nord: Add Ethernet support
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261101080413.1428016-1-shengchao.guo@oss.qualcomm.com>
 <20261101080413.1428016-2-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261101080413.1428016-2-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: jYgYulsSFwT7WMyBMwTTivFChTbXuU3u
X-Authority-Analysis: v=2.4 cv=bNaDs/+Z c=1 sm=1 tr=0 ts=6ae8a634 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=sMZvD66PJ82pgKsSUfkA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1OSBTYWx0ZWRfXzuarcSabv4qb
 yecq2bo8bq8OMguFnFKqofZQNWPnQJYzWeU3xMuyzgX6hhMSl03DgyETP1GsKUXO2UXGjJS/Htj
 USvT5pe1vP9qDjXVFcH0xUTZnZfUJdnHXdKuJjcrw2Em29/NZCkYJT7yWytnbST50bF0heYbohv
 5JV3BYaiNq92zJlE2HDcTmvyl/RUaZGNud4Am/ps6nyVeW9imgBCshuYfmFvqrD44gcqi6Tx7TV
 uoR4xNKUcpuDtY3KiZCOdaPSL1XBE5d/2QFjKVV5ykbQqR6nDQnU+miwYpdIcm/CzkZM8xX5AGt
 NuUBuF8e76ObnxogEQHfmkbw460wTV/96bV8o6frmKbJyAmL5oulh836okQkifjgD3sBT4BYMz9
 3Bv1DLLU/0GVjfxbaXjmJz+geEU0za+vpULC5EPRUUUslg5eKVqYeSU9MFtPH7+2P4RAYEh6vkx
 rpqSOswajlIZ6SgMN1Q==
X-Proofpoint-GUID: jYgYulsSFwT7WMyBMwTTivFChTbXuU3u
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1OSBTYWx0ZWRfX4VhGjXzp9nLX
 /VIVULcp4pHdWcSsM72RoMGvrwhTjBRVMsBJu96HKVh1V8HsZMAZZp/JgX5qQCU3Q49PbIoCBAs
 pbr+Xt4AoYAMxr/D0VPzh/tVBejAUd0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020059

On 11/1/26 9:04 AM, Shawn Guo wrote:
> From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> 
> Describe both Nord 10-Gbps Ethernet controllers, including their XPCS and
> SerDes blocks, clocks, resets, power domains, interconnects, SMMU streams
> and DMA queues.
> 
> Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

I think we can't enable the ethernet hosts indiscrimately (I would
love to be corrected here!), can we keep the XPCS nodes enabled by
default?

Konrad
