Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793105991;
	b=2BLNGow/aD+Nt6hOtqTYHaNx4kBuOsEfHga2sFH2ZFIoeiFt3FLMTPmWI683coBzWIEJ
	 LmQ/myrNTG3IGcChddJ5eXCofATeAOawnxUz5ig/1LTfouRt0W9Rww1Qgc+xrJY8AIZ2k
	 GoG27Iff64n5VutvEK2Iig3gzqUkAFX0cJbSVrQzwHGQzshgGu8/v0CiMZrg2v2TKBm6b
	 1p6P8r1vBJhxGFMR0r1SK1Qvv7nX8noe1JvFbjxPSHE66+686reFTxCyM7xNrXFBvqUDg
	 05IBxNGF2tl9ijmLFG6dx0E6okkJ8qATWVi9/PIVXTsnYE9mWvn3VWp7pgbfzu+kXiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793105991;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qNVNz3OBbK+duGqriAAIawFlLoB+G+Oeet6IJhveSPE=;
	b=2a0VQb9mE2h5XJ8Q1Q2F5jQZJ42BvItuK2Q4kixGWn5IKZK/mSZqV2SLcJX3qVaEMRS9
	 kKxPMF0p+MVp/vSb+EP6oZ3zafdA9PotQofjYnM4ArwXDVFDAbyG3vKxaS4wje6TXI7xk
	 eJfo4SQnf+BDBycyM0b5RoDh9ci9fUk0MR2EZRcIs4UCqZhqAIWfPRxCcpp8Sgcmm9IHG
	 cPeFkO/B9UA7Z3zK8ZC1Kc6oWyNX0olnBO1Nuk1mQ6ebiDlldF07MT6F8+1FpnW5cPsK6
	 NS30nxxwR2THiINUmX/vKsWxGtAXYGXJcCXygCwiYVuIuXLqHGrZ8MDRyxdTkr3eyhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ui885gUj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KA02GGmJ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D9F606A31D
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 12:59:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1D9F606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ui885gUj;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KA02GGmJ
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAeCZZ3026391
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 12:59:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qNVNz3OBbK+duGqriAAIawFlLoB+G+Oeet6IJhveSPE=; b=Ui885gUj+bWI4Obz
	FzAbcwkFkUI6t9drRFkPFpZhgb3h2gcH5tCHP5wAncNb/E55O1IIueNEfnU+RqY5
	K/czRHq3hsydzTPh8LI6KCwWPNYhQAwOWjWOFue3hltVc8UN6110CMEcfAsm1vxJ
	hY8LF/kMUp+2V8MY3yXEJNidNEAsO683FzEg2G2hrYNVsen/xMUDD6SDNI11Keaa
	63IAqGQ67MvOmi3fllOI6fmkR5OsLGPnOygZIVkQxerI+k34gyS7Qau1FwSbvPPf
	+CTXjErNZ3fUWI9fUEh7IFMdeh+yMT3UcVqdFVVDbEGkXPDKEAqp/TNmjotZWhpV
	eagBrw==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjh91aj3k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 12:59:49 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-846863cd436so4608016a34.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 05:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793105989; x=1793710789; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qNVNz3OBbK+duGqriAAIawFlLoB+G+Oeet6IJhveSPE=;
        b=KA02GGmJFiToXYtilHil9yyy9MCX6g3bEB8kUhtF98SJ+41Z9kwJFdFSmrRbB7cn5c
         0I2O2mFu8Aat7iTiGa05Xke/iVzyVXEr8yCzyWNM9oJZeKf/gSiNGYcc+N67UIT7p1mh
         kmfeHf/KqCtJO9rup2jktjra5JHjJac4AGbVCpTQ4AcfTeAreL3KOJ8xZCLFa5S7y+Qv
         +p59c/bppCV+p2vt95Vb9uAAfGnCppJWzoDUwyRpsiMCyd2q/ImLOOjrDqSeuKKpCieK
         ZHX1MH9pSXkNX8/RdaNLvIoBB74Kmhf+7RIPjtAOqFaw1tw1UpqPx8S7zTPOLaaHQg2W
         ZQcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793105989; x=1793710789;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qNVNz3OBbK+duGqriAAIawFlLoB+G+Oeet6IJhveSPE=;
        b=lvu7YXcYuVc/hCVP1lAnLuVX9ykVOlMDj3IYf4hZqOt5dsiJsEFLH3qwPQGo3TWT2n
         /T7eqAtFwx5aDHTDhMOajo9Ox+ddQ6rlIF9Xg+I7Xtf+XI7XYE6E4GeW72pt1BmDQBRJ
         UeQTcVYfTqShMwGlgPOobbh1Vam0mcY45FbpS+Ktke6q6hZWYqKfaP9MVanrRyB4PROj
         12Qdd8xNwEPgy5IG9auDzEWc+zlyizKJcMRwdxNKc0Z258BGjU3D3D1h9PjDiNKAFgM8
         Kr1CaFIogNdhFLTTw5jMg+AxRbH1LjM5/5oPtSbrVfexJDIVUxb2jNmrYBiBlD3MpJlF
         TsZg==
X-Forwarded-Encrypted: i=1; AKwUvBzfNwVZSYtEdBvHgJAtgTg4asOCKGNIS/cohdophfb7iAyODHTDB7EOo9ht5K5d7pvEcxx4T26UyJY0QJXv@vger.kernel.org
X-Gm-Message-State: AFq9FYJSNXZ+zxODIMctRx5ZIzyK+57FHaacmecsxjx37FrkeJKr5xS6
	rk6TzobK5xbzB0AVQ5zpNp6KpSe7bQavFJLCi+YFUyKoznKH9CQRUou53cx9nksPPsTDY+rav1z
	2lwT0xd4w7R2KH1/9x6jxGmbThElitcmH5zuyGII/dF8xzbggqki6yBEoNRB/QE+EPaSw
X-Gm-Gg: AYBFou34DLEegHeSttbFZcijAJBym/LnjVwmf0ivYiWELvLe2HtVZxsARcuTISQ0GVb
	6tSJigHTsZHOCN31QO4wGUVoCEjkT4e+Jbh+I9Cct2M3Dtm3BHcMUMxIph1s0y6MfSuvDK2q6+/
	j3oICt0SHP3cMOZEsDWSS7h9t8JUe+HmU27cX1PcECQL8tVHBfkCAL55SDO2RC4iM3qJEKrDHDn
	mzOTyohZqfIXCLH9T5ZysGSArXvd2e8J9aozMVAqoIxO1vk/A9UBE5xFrLSL5lmDFoK8Yg96VA6
	r1AS3Uhsf7R27+caKbz2bX0miFVb9HiNsB1/0zsP5hbnxmurjASgSO1hTeWaPp9SH97oHLoUnEa
	KYPkd4HQ4wuZH7zCS+KH23w==
X-Received: by 2002:a05:6830:2b23:b0:844:5d0e:5152 with SMTP id 46e09a7af769-850feeb8707mr8480130a34.18.1793105989203;
        Tue, 27 Oct 2026 05:59:49 -0700 (PDT)
X-Received: by 2002:a05:6830:2b23:b0:844:5d0e:5152 with SMTP id 46e09a7af769-850feeb8707mr8480109a34.18.1793105988781;
        Tue, 27 Oct 2026 05:59:48 -0700 (PDT)
Received: from [10.219.3.4] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-850fc005bd7sm11174684a34.24.2026.10.27.05.59.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 05:59:48 -0700 (PDT)
Message-ID: <7d9112d2-c588-4c37-b6f8-dfa1afa21ed6@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 18:29:41 +0530
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
Subject: Re: [PATCH v1 4/5] ASoC: qcom: sc8280xp: Conditionally set S16_LE
 format in hw_params fixup
To: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261022094313.1074873-1-karthik.s@oss.qualcomm.com>
 <20261022094313.1074873-5-karthik.s@oss.qualcomm.com>
 <7dc5131f-4cc5-4c97-8da4-28910a312239@oss.qualcomm.com>
Content-Language: en-US
From: Karthik S <karthik.s@oss.qualcomm.com>
In-Reply-To: <7dc5131f-4cc5-4c97-8da4-28910a312239@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: BATJyUZtE3nGcGQFKFQvmyvNRP_QjHJn
X-Proofpoint-GUID: BATJyUZtE3nGcGQFKFQvmyvNRP_QjHJn
X-Authority-Analysis: v=2.4 cv=TuxzFzXh c=1 sm=1 tr=0 ts=6ae0a046 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EIM5vv4Rke_6-YXqskwA:9 a=lqcHg5cX4UMA:10
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=z2U-W3hJrleVIN9YIjzO:22
 a=EXS-LbY8YePsIyqnH6vw:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA1MSBTYWx0ZWRfX0X9KX1ioOu3F
 o87jTBTc8PI7HnRgifSQKiSDs21zYLLPkCiE9wBBMN9V2eye9Q1khHpQculC9aocu94//7a1A3M
 3f8oOiv+F81svRC8Y6vwAgsS36b0W1WNnFMJMhjZNBs5QmKdJRaJJJWYAaUTmy8djcGQ/sKsql0
 ktZcMY3+un0MNaXupYdFUKdoOh5MED1Ui6nzYVYlKAFVELXKjD86oQrbQ76Mx/fyuMwWxmH21v4
 HieLul1b98G8cDnZP/AIog8qJ76X/lYKmtDOvdoSa7RG7zTemPbLCwckb6FuTx+dU2NkqUR8VMu
 qeAAyEg3kSzZdevGbDlKfLKTApJFTzOnT6Dvc10ovX0srleL0Y1o4O+0/63L/oAaqVCF5llYsUq
 GTUOAH0Z1BSG182hNRNqQW4XRvOFAqqu/bV4nYseWneQla89AsSQ2dXZNfyjVGxcG4etBI68VT0
 ojLN3nXLbwvo8dmASEg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA1MSBTYWx0ZWRfX+oQy+XoSZktA
 yhSfk1iJQzRLLTOjEKBrV3AFxnx6U+35vZbfIWqCE13sAz9wH5IKRzk8KPvIRr1GkvdpKMBoOhS
 d6dbxnMKiEiFarwfl0XtRMf3KLK76ZY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270051



On 10/27/2026 1:59 PM, Prasad Kumpatla wrote:
> S16_LE was originally added here for compressed playback ( https:// 
> lore.kernel.org/r/20250911154340.2798304-1-alexey.klimov@linaro.org ).
> Could you confirm that compressed playback is unaffected by skipping 
> this constraint for the MI2S and DisplayPort backends ?

yes, this change is made after suggestion and discussion with 
srini@kernel.org
