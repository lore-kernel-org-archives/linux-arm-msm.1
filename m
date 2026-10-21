Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792574120;
	b=mTzejvJv7RgUmulssROw1l7X5vjz0MH+tlKHYsY6GSHzkFZc1x5W6Sv9qQNWdE0D/+jU
	 vGM62Gxs/Ds/dsVnl1BvKaEo2ZmuZTBGQaSa/c/JwBaPGuFWBs5q/EHFr6rhE6xxIWFYr
	 +91vqEnsUDFCeK7cQLUUxXgeZFZPqw2Q7I5i2va1k62zxOGj4YO59foskddYldBhbYTxz
	 nmwFwllcKsL/UhCu457/OmcAK6wzPRRFFdYFZHDgDlKXNxoRXlFGDhEwroEf2ZACmu3qZ
	 0ZLUMZlsItMo4yDrzdd64g/qgTPppACzv/9KqqYQmYFrA8TNXjuZGUPKSbqi9nFV1ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792574120;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=gnqxoqdPzbmnA6z7Madnb8lLgkBAcqXse1zxHCEfMLM=;
	b=g6HjdH+zornoeEYsYdstVzbwXg6QncD8s1S/NmSk2SaV/o9EO4ihP7NqPjZab8FmDxLd
	 JBGHze1W0KsuFlLNv4pnwD5VKPJPhOE1SheQcs1iIRk+iQzESXDCjlHVdHYKrVFxyEKUa
	 174c6Z5bBtNq0seU63mPZqrqwDdlSXfeDSvZFNPpuAmUgwkihLuV3tWEXt9ej+ytyrhNf
	 jCpdqnVoPFg2Isba6mremTw43m963VheVJqOdi3DMcKVgZ0+yVetD/imjixqk0S1ouYc6
	 O7r0kOip5VhFCBje99Ow8FjM62Z9CDGabCIXi1m1dlcmAfa+sIOD/TzA74GfofwUy/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="b12SUz/x";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OKlLD3o3;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C651606A320
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 09:15:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C651606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=b12SUz/x;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OKlLD3o3
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L9BlWG213241
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 09:15:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gnqxoqdPzbmnA6z7Madnb8lLgkBAcqXse1zxHCEfMLM=; b=b12SUz/xLhut5xmq
	2IjoHS0WxqtZODDh7nb7E8B6e4EmviGp76fFCN2nzgqmIHyqE339I0khvz6Z9iTp
	uUR3GXs65UxoBg7E8EapYGbTO09B8z/c5D9D2I3vvah1IBx/nYpPJPBUj0tWSQUj
	lzu0jmwLK750MI/AkGmskLGHSpwPmk0/Fpc/mo51MsA458n9dkY/BdtQ0f/HGBmw
	vroFdkh8lMaZYuJvD32n8RnwfFPCqUoQF1/Sk1+jewoTkaYpXBE7H8FoBGlvJ8WB
	f4lbkDjkczn3mhZsQ/SvdVxTYS70Z19U1PCkSWk3VdQduTq+sVP341/G2I4xrKCZ
	Gj66Rw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hetj480eg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 09:15:19 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f1440e081so13512485a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 02:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792574113; x=1793178913; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gnqxoqdPzbmnA6z7Madnb8lLgkBAcqXse1zxHCEfMLM=;
        b=OKlLD3o3yO+/vB9adGz+imN+eEruFBnT8tQZT4R9+OyQXJdW6ttHt8+acqaarVLNew
         gTWMwpd5QMXpxbIT1//M+d6w+XjcJPf5fWK1XzcNMEKNcTJDPk/c+XtAOITAafc78F6F
         OsXdHGyvrL6w9X1mwI0PbalTLnR/J0z5j/wymwV+FLKqZYemv+arzv5NTG+kvx66tZxI
         HzZaSa7t2bJ+oUpV42Q8Vcx/I9JGPPcBUc8Sv/x9phRzSeOLlC8xQiHbhwVOjE0t1FnJ
         aDjNM0AgRarSc+YDT12VGhypv9TTrSZTUAqd+1eio97pKlHKKqU2B7WBgwV34aTINpJR
         Tisg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792574113; x=1793178913;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gnqxoqdPzbmnA6z7Madnb8lLgkBAcqXse1zxHCEfMLM=;
        b=c4gfQrlbtpbNvMkgCj6Wg7nzHL4IuBmdYxzvvlRf+zvGUKM6WG5eagJHISK6agP8zQ
         4gH/ZOSGSI3sIQWUSKo5aAwx3oH6M9gbdyfb+uwyOgGi2vW3gDnOBY2JEQb5JiopvfY7
         +VgwoTTTh47q/j8d0/CqRz9qbzs8C+4bCs6pfkrky6ZJI5IggwWF3rIIy0bNBCzE5vie
         3Bc5Sb6RbMf1fmuBjCbZe2aiQo0DHqSj8l4+9m7z2JVeqpalwrP2FZUbuYWClaJoxor2
         q5TBptIe6dbpB/xtLv0gNvAxNAxVZIl8RLidyOSYoxeXTyhNOKIjpgLXpEuhwc1oy/p9
         vfTw==
X-Forwarded-Encrypted: i=1; AKwUvBwEWpud1xBIjsdETiREabBT+uJVybEOTZRuwmrguItm+FG4BtMJSs8rm0Y+djZHbm4iZwehxA+IzMYvsUSl@vger.kernel.org
X-Gm-Message-State: AFq9FYLF22apyZdToqkc/7qmmyYog7RSRz7+vHDxnLe7fbdZaaiqtGHD
	nKSnPkDMwOZ/uGhAlDS+mpbXLLX9tC5p2ynp/C1xB5FIOWsaEHsVihK0E2MFCIvwSIzGqlxbFV1
	iJInrse1LqGpXlij9JN/xXbtXk8+3JsBdDlFUgBAGbF+6DzB9m0cumQT8sElxVbiIeDEwL5FoPD
	GuAdIlqw==
X-Gm-Gg: AYBFou1EBIVYpic+KLGZQWcmTHYGhyp0QoOnkaOMsaAjHnsoOXk5KORbA5xeAEIa+FP
	MV4a79JlroAonEp63jYRCr9eNPq2y/2XY0W7173s6ZvllQiv/ggpUwwvzlxhuFAr7QH/Hzk1GwF
	XYWVS7Cg39lRjRd3dxbDygzq1uqPi6rWjhwGlrf5vs5xB7SmJ8d942jxb9JcwI93f4mltHaGk68
	ogpqhed3+Zx04f0DJ04xeplwRU501HVH/1XpyAVs6GbrzX/HTw3iMX5x+2xZWvUmh8rpKbC3FWr
	vlECxU38KcEkUsXL3kTbTdrLHjFqcjEKTCUju1bY6u0lVBLH/IiFTWKt+R34RAosjou8fNjuJm5
	WtbOnWN1LZNH/0U21drRZiA==
X-Received: by 2002:a05:620a:4511:b0:93f:977:5d9 with SMTP id af79cd13be357-93f57dbe348mr367645585a.0.1792574113557;
        Wed, 21 Oct 2026 02:15:13 -0700 (PDT)
X-Received: by 2002:a05:620a:4511:b0:93f:977:5d9 with SMTP id af79cd13be357-93f57dbe348mr367643185a.0.1792574113116;
        Wed, 21 Oct 2026 02:15:13 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4030db3e8sm620229a12.8.2026.10.21.02.15.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 02:15:12 -0700 (PDT)
Message-ID: <3530adcb-a7ce-46c9-95b7-28aa544e8fef@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 11:15:09 +0200
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
Subject: Re: [PATCH] arm64: dts: qcom: shikra: Add RF_CLK2 clock to
 wcn3988-pmu nodes
To: Cheng Jiang <cheng.jiang@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261020130852.3049639-1-cheng.jiang@oss.qualcomm.com>
 <f3240952-f28c-4c2a-a4a8-4492aef3a88a@oss.qualcomm.com>
 <CAOK0kb90wYEQU8e9wfQ8g_KfkfqwiQ9_ideg2=mSrU8OuTLxRQ@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAOK0kb90wYEQU8e9wfQ8g_KfkfqwiQ9_ideg2=mSrU8OuTLxRQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: zzNAuPjiYhLkN77RLHu58X1TFG294xuP
X-Proofpoint-GUID: zzNAuPjiYhLkN77RLHu58X1TFG294xuP
X-Authority-Analysis: v=2.4 cv=N768hG9B c=1 sm=1 tr=0 ts=6ad882a7 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=s_4eQB3tgPlORBrTjR8A:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=zZCYzV9kfG8A:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzNiBTYWx0ZWRfXwyaSwxOIavQH
 p3L0B56sVwzrXPbpoOhqur1kTj+8coqeeb5KizuCqQv0vven/nyfEB2GEwE+ikW8MpyJZhWDcZi
 gRCnS5kyu2Su77iB+dMRfmeh1RpvZ0C9kkqN9aHBRmUDKICmljAHvKXGrvRZvLFEBdZ0dmX8RPe
 jeO57mOHyZm01hhN4I2xyCY0c2VW/Ew5P/L0cMu//2nMmBV8SrHdYA2RMYQMD89USJpXShTCnSv
 g22RNY/MMgaLJ3IKXdt7FbWhd9JBC/PFec9x3uxsKSBPYwqZrDaQj8BI+UZq+Ab/7X9nIGZ1sf4
 kn8ZIMgzpf/BvaatpK361O4HlEpF5FVAfCeUA3YW3i2Vcppxi4HJGB0Q51mXQ5dZgImd1GMZfkH
 /FyRVpRY3C40ls7eRuB/EDEm/o2MjaycYIhCYJSh0pE1EVEAtcwQz+HsCf663SWZBPUjIU4HPZF
 19SQVvxb6ed1TpP82DA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzNiBTYWx0ZWRfXySj9/NkQVu79
 ZrQ+hLwtC0RZRPyuWF6SjYB14vqwNO4P5rmBGiOSHnPPsLRriT8dBlpoZcnqqd0BKjuRh386Q/4
 AJog7rRzrxGdVrK/bPlYgnls98e985U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 suspectscore=0 phishscore=0
 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210036

On 10/21/26 11:05 AM, Cheng Jiang wrote:
> Hi Bjorn, Abel, Konrad,
> 
> Please drop this patch.
> 
> I re-tested on Shikra EVK with and without the RF_CLK2 clock described on
> the wcn3988-pmu nodes, and Bluetooth comes up in both cases. The
> commit message claim that Bluetooth fails to come up without the clock
> does not hold, so the patch is not needed for Bluetooth. Thanks to
> Abel and Konrad for the reviews.

It may be that you're lucky on the timing (or that clk-smd-rpm keeps
all clocks online). Please verify the schematic / clock map. If that
clock signal is connected to WCN, please go ahead with this patch.

Konrad
