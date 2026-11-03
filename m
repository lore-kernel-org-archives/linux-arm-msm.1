Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793705087;
	b=ujlxF3HoflqdSmt3j2MTjRQHQH+qhFTJFwbXSw58Em6CMy97iWK9PCLGAduvxRrSXNmj
	 tc8LYR/nGIekl9DZeDwLIK7br/W/wZACAPab7Ti/r15hLkMRawRQdxyDPL8lmGhjMzT5+
	 DzFRZbGBiQ8eMEktY9jgHrZo2SbHlx8eHluuZJs7BdUTbIWXZpcS5yFaQ4+H12je9nJSw
	 aB+zyF7eqKvf/DT0VesrkABpbbL/N5qHCJCA6SoSgdi0D/RKLdslYAny8jRJ7OVpFnde7
	 RxIS+cuMH+MUC6NrtwN0ndLLXQMxiaEu2kUqovYSeFp00B/Qho8hTSniJ/qaDQ7ZNSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793705087;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=QqlVyg+4SxHyWGbqD6MEOj3gqhmpTxKhd4H5ol0BuKo=;
	b=gBlfO+kml+SBPnQKxXpAXfyReZY9AiJYM0bdrPB31DUlVEftlfvPKeiLHhytTb+HSTWU
	 qoz+QBk9teCmZVjxV4CEqkZyWdIkp7gDLvgB5vxLN9d1bPnB77tQivgJvLznyY4lHCV8z
	 nJpwXyto9IZG6l8gx2vS+Ikk+Mr2HfG2e5I75L5fgoc0v8tX7/v2B78a5LckPfcmBO8U3
	 i4Wn2tdpzRJH3lJnPG2ygRQZmWlfbcMLwanMq6aGcss28oR/+L6IUMz+WeDZXgerS/tpx
	 AebHirS3SNkLWfHXuqn8pwh1+sVd2w8Ru/mFZhaJy8qcTH4svQZJ5PXj3ZLn0BW4jjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ey660j63;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EL2DlbsQ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA2A606A324
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 11:24:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DA2A606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ey660j63;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EL2DlbsQ
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3A9xEq3130815
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Nov 2026 11:24:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QqlVyg+4SxHyWGbqD6MEOj3gqhmpTxKhd4H5ol0BuKo=; b=ey660j63CcUOVg5S
	oWYK/DdDV3WsySRYf0E5QO5Vgvy95DfpqC/6EpqafrSfHCRlFaJZeNgmfCDng5oy
	oNcvREz1COh1Ca1Uxvkl3Qey5W/TFaeILIjJ/hrwM8uVt1RjKvJDMdGr8u2UNoQY
	oxfzu2x9sZ3VuzBgYUW5+rojHzjr3FIhtwkXcmGAGw74yTE8+hUIVLCgqPVe47/r
	O+NjunEYBh1vd/JSv7QWMPGq6eLFp+MTbmzvrWgDaozWpD6e/IYPH3YM4Xo27oW0
	9mJo5E/wOSDP7MHkBoLjz7TMMuJnY37nUu1Kto57iWv15sAq6gxwj25+qWt1LYN9
	FfREgQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq94csf4p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 11:24:46 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-53630cded29so7322901cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 03:24:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793705085; x=1794309885; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QqlVyg+4SxHyWGbqD6MEOj3gqhmpTxKhd4H5ol0BuKo=;
        b=EL2DlbsQxmsUO833UfFCZGNXpFuPhHZvHxP03cOHYCyCeA729yJKDQsaaiBOEG4xKk
         6LuMEKORP5Btf1X/KWZRW8Fs7UlbM5DB0x/7BEhhlZpBPLAfs+7TToRKEe2XvdFod5Er
         LGGwPR9s1GB2nRfcdrHHDUxA1QxE/aIxGfal4yL7p/CWq6Nq+6jSLYe8cwM0tNvytQ0i
         QkbODxDGZrxZlvsCSn/Py+ekCMPExF2rapqtlswvzmB18IuLQAG6ytfGar9XSZ++l/HT
         3QT0iKEhCuvhvo+7s5O+l6SPT9QjAN3B/7gzltNOXynIsp8T26SiJvKpvYxUXZ+otGfP
         PZhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793705085; x=1794309885;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QqlVyg+4SxHyWGbqD6MEOj3gqhmpTxKhd4H5ol0BuKo=;
        b=t3jsyFzIK4M346DWzh+8bqjeZvD7kJf9xwR97UHepj8+2WopTLL5R+tKDeM8+1Hc6p
         qAsmryypUaugHdAdn24tYFq/7sWjq/PpShuNU+w2O2uBCzKBhQLUjJHmDKNjObNSqT7G
         oLuLqlH69kNJXt6MsHVvSKHv5ms25ZbpeMBN9y8JGdUBo1eXTszZ0m54cPHW3op0CaNY
         sTYkPI+qcCprFxWdtBsB4G9bP93+X+QiCeWcgcqpwNFj/loyYEI090ItmIJUya7IsiaZ
         9td5KkxoeiFw4jIsYSlGlGPi4f6ZDkCTOqlr+FhdoqV2jC38k7/AMMQlkJWj25AUZOgY
         Lmsw==
X-Gm-Message-State: APuU4Z9oCeD8vFJvcxo/RVcHp67JL2YPLi+DbR+wJhjoddTiWxuy7lbh
	Dcy6+hjV8crgA6kDX6jeoYLJb7gstPYNtdqsKWcTLlDjEcj122lBMAbrJ0EWQCNl4pxh2fQjO0p
	HNmSCyO8nBe12HiljteVIW10mR+YInGTpqqZi39lGEiUw0Mw/Q6IpHaJAk6Dw9LtOOhha
X-Gm-Gg: AYBFou2WsOujvj8HdG3Rz7CSdLlgVfwYWs5vzKArCLOIALk+uuBg58CXhPsHGQZ4pbN
	RZwnJdkqygjZUzjs/shv5Qj34Aa6XDcTFH0E/RlUX2XovASMmdzpBRaNJ36KoAYZed0YibWfRYP
	EfvthAYV4OAYU0mIdtrSvysKQddyONrUS5OT/QM7wciwCsaTCekiDk84d+A5B0iP/tt02RBYRZu
	iCMSTuFpxc+QE0WuCVm+KTzRgSPkjuXirzGs4IxivMlpQrxSLVwUuJT09JOVvgrT2LZdKkwTM0f
	RIiGqACz8FIfMIZgv1n3x2ce75nq61fKKlzqYCNAsI4D2qsrVIdYqbq0vCRDL23I4Q4/OCRI6js
	/lU7K6oGNo49bH5SvwyvY5TMoVtOpG52nml8bN0LBafCJT+bpzeY65LouN1wcqFOL+xWozw==
X-Received: by 2002:a05:622a:8447:20b0:543:18d7:1823 with SMTP id d75a77b69052e-54318d75457mr189595331cf.4.1793705085483;
        Tue, 03 Nov 2026 03:24:45 -0800 (PST)
X-Received: by 2002:a05:622a:8447:20b0:543:18d7:1823 with SMTP id d75a77b69052e-54318d75457mr189594971cf.4.1793705084848;
        Tue, 03 Nov 2026 03:24:44 -0800 (PST)
Received: from [192.168.226.81] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cebf3ec91sm76164366b.55.2026.11.03.03.24.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 03:24:44 -0800 (PST)
Message-ID: <236ab115-51a3-4e2b-bf1b-6f775c387a72@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 12:24:41 +0100
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
Subject: Re: [PATCH v2 1/4] drm/msm: Rework IFPC disable
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Sean Paul
 <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
References: <20261102190010.720443-1-robin.clark@oss.qualcomm.com>
 <20261102190010.720443-2-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261102190010.720443-2-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=O+KsLx9W c=1 sm=1 tr=0 ts=6ae9c47e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=td5gT8Jxdf4Ed59i9cUA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: 4j7PNXdhnMah4m64jxeVT1Wxtk73HY5Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA0NSBTYWx0ZWRfX8uQsfPzqydTO
 G0G1ALQXGIAmxbyFWs1LnnfjIoeAS3o9uK6ZXYDwrDgjDatX6ZVwZLbnJR6azeOlMZ/A7aRHEyN
 K9eL/tGNjRwwQqH8Nt0Zwy77HMd4W5aEw1cXe/T0QDLM7gPgtwflqtn3AQn5HULx/Kf7FikBA7J
 jjcyX9+adBnAS316UDL+OyiQe53agID9qElhLwscNgN2sLh/P9fcJ7Tzf2t5V1XVxVoeI7nAg6O
 +vu00IxsA5ieMZ+kb9Brz1grWVlFxFVHWws0fu2/S9z00Yy96uKZ0F2avgUGsfR2GVS+M8S3bCn
 amQ2/mHCtxduWf7gLI9KOcivR788vRCFLU2e3FPcVyC82Thuysu8NTXuZGpYMmPhe3ZLsQ4fNMx
 3LRzw3YOBVWlqQXZoiK/mVIMnr2jUlAR8t59qP0XWKM04IKsYDTnWTc9fUth4YYCi2oEl/OzFlh
 j7H9CIUkIel2Ne7U6Rw==
X-Proofpoint-GUID: 4j7PNXdhnMah4m64jxeVT1Wxtk73HY5Q
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA0NSBTYWx0ZWRfX+CzhDvKXEmNB
 TNa5YVu7e/T6SJg54xWxGoeCHnuRsSBHFuBJfbXqBDcj8uIiW2Os6B+Xw5NPs9pOZppZtp0SFkE
 8uzcu09mNo5f8N21wPil+PDiMGNyioE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030045

On 11/2/26 8:00 PM, Rob Clark wrote:
> Previously this was coupled to SYSPROF level, which made sense at the
> time.  But there are other places that we need to inhibit IFPC.  So
> decouple it from the sysprof refcount.
> 
> Now it has it's own refcount, so multiple threads can vote to inhibit
> IFPC safely.  The renamed gpu->ifpc_update() simply applies the new
> state by setting or clearing an OOB request.
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---

Sashiko still has some comments

Konrad
