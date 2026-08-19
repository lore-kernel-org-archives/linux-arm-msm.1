Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF2135C180
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 14:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787150563; cv=none; b=cKwXUtLesrjZZ0/X56KR6O7AomiLIscW1Y+P52JewzMLPGcmitKa7jGbfTG2nxgBFkeT6JxkpB98jZfCg8X5Ip+xWO/h9tCIPRWg/S65MOZJKEBsich8S1AQpY9Ei6CaLuGdtrhYJtRhzulMs0ok7TEZqYC7Y/avW+n+QSLNJLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787150563; c=relaxed/simple;
	bh=z/zZjs5bOOaK1GOv8zryaod1Cgmr0AddL3vgONRM1O8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BOX90ZAbC6RkCk9raN+NWD0EAAjriczGFO26+GeHlR4aNF381UQd+bUuX7EjSW1pXs2WlB+NHTg0jb2PRzRKFBipOrpsrJLEoiQ5J+wO2sgeNJpgTotLXETOqWNNY9ch1QIiejJEOAfsCWjynIBrR9STwsdVMe+SlBgjUi3XBkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j3wHKl6V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YU/weOYg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j3wHKl6V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YU/weOYg"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JEbtZK390594
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 14:42:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tRQxt4GSu1VAaSvVfJScpbqr50/voI1PXeAYPBdH90E=; b=j3wHKl6Vx3Y+LhI+
	5jiRcgyFDMbplJUeiVH7vUbgO2l+GeS1Is07ur+zqQK1iaLkgP6G+oTUDOWmQH6+
	etY0RqIPg2CRhEX9FHxdARyf9fpFFkslLspAagPjlWR/uFPkuLS27GWoGu6SumAD
	6er/ccSbydPxGMEa5pPARzKSznkWbIQXqCnV7JAE1fe+jsYlyw4gC7SpqoBKCGLY
	XAC8G6dsav5XNnoVzLgmsj/bjBZxCsxG42v660n3Ld6OBQ3++4kb/KkjYK1owspl
	sf0cIXd/CXkiWfTuVev0rwkmgGSJdWylOSpckQ40jZCLaCrqX9DFySzwcVZxBQrA
	Qy5mxA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfjkvrv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 14:42:40 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-936bc854d04so13680085a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 07:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787150560; x=1787755360; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tRQxt4GSu1VAaSvVfJScpbqr50/voI1PXeAYPBdH90E=;
        b=YU/weOYg5Z6ebJTDG3wx6ypA05cA1IVKk+Ur8jBnAkJYDgaBqrxfx1rAzQab17PF6+
         e1g1dQ2owgag2P50000GuE1/249BFV6xsWovYeL241QZGQJtiYUZc5cGIMuc8sx44ZlY
         sXKAdRb/jPuIeDPaBXNaxo1eeuw0c/EP1n4SkuZRfGC43fsWsQtVa3gOzpbrt52DTCpT
         MYLiSKhycJyVcRKOBusXQoUdn38M+L3Qz70Xbf3duQLu4GO3JUQyaWGiTE87j/yqQmzQ
         pRVimSKq/plWxeQPDJBuTaRskWRpxXRnJ6CQG9/BqGqSzlnBW6K2h6VGCdnHoITWw3VS
         ugzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787150560; x=1787755360;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tRQxt4GSu1VAaSvVfJScpbqr50/voI1PXeAYPBdH90E=;
        b=HUz3DC2Y4xNv/tx7RD+WKm6i2ClmmXZ8QXIk1A1UmZQ9ZM0y0YxmplFbA9hkx/zWng
         2z0MFwDJlZQJ7BRC4Heug3nIv+UOdwHhhrGXsaGKp6iaPpUf9EpcbfUtuvrJKB3DNIWp
         mpVWkJcyrCjNNpwRXxn6Q4TcBD4VTVQeCKj7Qc57H/r7aGfEIqpsqYme3gYIyGzJdkrH
         sPQK6BBROBbQUBICB92dvUcvSyie5FHG7niy2Rp3ovfg7qWWVWS15FY7+5qNXPVfJ9gj
         b3KtVApHw2yfgP/gSQ4rmR2DWiIJZq5trocXPfyaJxs/clcukSeWfxWQG/DZe/mx7KNZ
         +zig==
X-Gm-Message-State: AOJu0YzfRQCfHzxiFdMBKFx7zbQjQHxQrMARGiPS3BXiNqnYWXvzU/wv
	yI1D3BcxI6qP1uACMl5lZ5iK8Mj6fKHxqvrmjEPUbJsHMLB4nRkchsz1LwqbhBZpFZSCO3B7tja
	OF6p+SzPgTdlXUlWdNuBl6tjtAz2glLUBzlDO4lKwcbJpROYIgz6Oe4L5NvCtXDMOtZgW
X-Gm-Gg: AR+sD11747hVloxCLPab+dTpyLZeCdRRjevu/Z8BcV4lXbgnYKgYG92k8RruyMll/Qt
	bAeI8S/1MLoBoQ11fIZxI35KVq2njF4iFiwRUYZeJybFUbwWy+//A/tTZYraqBKDcXTGMmWQpDI
	I1QUJ7fWwQpGOrH6XiZsIvyirhQAPS0zSeDUUgJn6rzaIqOvhiELXHyA8fQGjlJqiobgu7RZvsS
	YNISC6gX3u8Kv2jcI4AYEBAcHABIzIUCsCYnouZIMjTlLC/jTZNgx6hrigGDshdFaC7xLP5+BTn
	b0FSydUuasYwBMS6bGjHEpBMRC+diCeJWkzSM2VTPag00BPVQ9zNG+NID6N7ATB7Lvv3/5E9o4O
	Anh64tU7yFdwq2Yn5kpx0Q36x
X-Received: by 2002:a05:620a:284b:b0:936:5ad0:fdae with SMTP id af79cd13be357-9371e7e90f4mr323476685a.4.1787150559690;
        Wed, 19 Aug 2026 07:42:39 -0700 (PDT)
X-Received: by 2002:a05:620a:284b:b0:936:5ad0:fdae with SMTP id af79cd13be357-9371e7e90f4mr323472085a.4.1787150559150;
        Wed, 19 Aug 2026 07:42:39 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c243c38b379sm90642266b.39.2026.08.19.07.42.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 07:42:38 -0700 (PDT)
Message-ID: <40e21b3b-edc5-452a-a2b8-015ac2412709@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 16:42:36 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sdm845-oneplus: Define touchscreen
 in the detail
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Marcus Ramberg <marcus@means.no>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260819-oneplus-ts-quirk-v1-0-0cdbcea195a2@ixit.cz>
 <20260819-oneplus-ts-quirk-v1-2-0cdbcea195a2@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260819-oneplus-ts-quirk-v1-2-0cdbcea195a2@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDExNCBTYWx0ZWRfXxPjvDvdJ9npp
 XN6Qe63qVm/2K+RZecZs2yunnEg+oqbq8lK2QNCiBZjlcS56SWJalSgKHZyLTDD6auR0duwzdmz
 ARiFLNcH0WayilhCbcdZ4s6LjiQFeBkXCiG0Ib6Ihj/OWJI0OzSXluGNj0DySlxvubvoP9I8wHu
 9PvGPRESNPZkYyKb0ZMq/GhHjbfVeEBdPtW840CFJjaidRruc00vfP20Egt2bjIhIxf3tny8DLW
 vc3kGS05EynkdBlilWor3FsyPpVIonlIXdBqyfXj6xDiceJudnLeVL7942Jh5B8AuDTA11F8IJs
 I+bWixrM+SMvh4AUbGVL8E8gejG/dvfDrwPo0kVzYuD2OpZ7sgIJW2S+dNcNtzwQ6gh8Vhwxy7n
 CKCy9tlbPO+8HnXCmlZqY7hyQIAqqPvyYGjma7MqojKL0XsjVLiwapmXQGBn6qE3MQs6ZkSV6ur
 JrDLzDf9TC3gCxeB8UQ==
X-Proofpoint-GUID: o9UsLLRh4Yw8Rwj7CO9mSmsOIPIJJr_u
X-Proofpoint-ORIG-GUID: o9UsLLRh4Yw8Rwj7CO9mSmsOIPIJJr_u
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDExNCBTYWx0ZWRfX2dV+M5MWVCdR
 VVRTljkInz7kO983cPjerMugvAW3En5ymFSw4cICxQUKPkfYcCMz5ws2DWl/RvvLiv9KZNHoHMv
 wyN6ms6NXg8Xn84JfsRc0I6pdd3Fudo=
X-Authority-Analysis: v=2.4 cv=Sb7HsPRu c=1 sm=1 tr=0 ts=6a85c0e0 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=ea15iDvwudEerf5hAZwA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_04,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190114

On 8/19/26 3:56 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Once probing, aftermarket touchscreens report touch over 0..65535
> which is unusable. Be explicit in device-tree to avoid this issue.
> 
> This change should be irrelevant for original touchscreens, which
> reports proper values.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
