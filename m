Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA44F4EB867
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 11:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791890749; cv=none; b=ZsAfQNZi5hZiL0uIggzEKVyBXuFxY+7CtAweX4hruagT5GGpw/mqDvpqchBgT/QsjQ+CvzM9juYoFu2vM1wLqwnlLmWuZDJs/kPkBh75Uot0qtLG4TcgAvkLZ4cmTqswSfQEieon64bjdbG/6BtE6QdiplFdIaUWvx9sWvXdYRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791890749; c=relaxed/simple;
	bh=hi6zrpo0qMf2oszDVPessNqP8ZyikArUQ9QIvDYIY24=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uwE0VaAyWzBZm+DH26BXYTLruCNn3x2Ymyz4XTlwAdOWCGYfu5pcdS7GZgt1Zy0/Fe5Mkmkuevoh6/cmSWCi6BqvmCnb6cdU0z5cGOeekVd9nuIlHdD2NRIPidIRjEEoD0vjxepx/rm3vlH99JRrZ7SLvZs5kkcPoNFrBTPiuKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GF3xfgPA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WQNSV0qu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GF3xfgPA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WQNSV0qu"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D7OWml015185
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 11:25:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rOsEth7Bogbq5lk7VZkPy+hxIiaIx/cvk7GoBqLc+eI=; b=GF3xfgPAA1j7eji+
	G0N/AFQJQU93vvRcT5peRua8T3d2STv0NQIS4dw62i1C1DuuUj3sMeDQZG8jHj1F
	Mc6TrzR6jwofrDczPxB379/NN5Tkj9TkGrRNitWNc/zSOnt+pAw/hekV2eJSVLxH
	PDtUrerHsnxxZ8U0vFyimkh4NeL/krMAlpKnCIqlJ7kmRJqzfURE79UiNyFhvy0j
	PE3anVrcp4e+sfZDslfRsmJg7ql6y0edOCKBc+7NEkn7SxR91MNhq4wPl1WpkK9C
	nyuGXQVXiFhjhQL31w2SLXoNDSxRn/6W7Qdz7hgxmgZFp0BMA1fA+SSOZhQYOS2G
	/kf0QQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9g7uh05g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 11:25:47 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3a89dd31fdaso2494028a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 04:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791890746; x=1792495546; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rOsEth7Bogbq5lk7VZkPy+hxIiaIx/cvk7GoBqLc+eI=;
        b=WQNSV0qu11UUANeqtAOh/lJNfU6auPO5IzawEGzxgPnE08fQWi0FgOylOA2z9ugCGt
         Dt0wwUBYDP5UL33TrLjhHalNYOU4vn8fQKD5MeROE+iVqJLKxEiPqyHO1LBDMSw9haN5
         pEyLGJlCPMn4d47XgKlnkhXXhc6kJPDnrFtZwkAxumlmgFdbNfptAeziQxQpOrd+n1Px
         LN3yh/eNaGwrmNHphFLdHODW8lNR+lFsgYgxboh8WekKozy91aSy8va5QJNjQPUGeG8W
         TcpSbEc28J1mj9C12DGdd4/mOIhTo9ern/Btye5VYzOXxQ1xZhRfeo5asCi2tr01YRGx
         ZbzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791890746; x=1792495546;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rOsEth7Bogbq5lk7VZkPy+hxIiaIx/cvk7GoBqLc+eI=;
        b=ZZJU1YBj55EYkILrsIW+8r4j5ylPYSqsJiay3fpVC+6qB7x7m05iZALnG04BVsZ1xR
         HeCrq1I+PkwIS1N7x1aCM15ApuOTIXTMD4NHx3LwMO2ISm6fhJeLRR5JuaD9swmTHMO6
         kift0YaO8IFb79gyqV+S6oj6zP/FW72pDK/puREhQx4sVUFgwVOJPyLOgc3N8W4fdvcU
         pH2Jid7LHcTUikxXBdC9fF89wm/95B7XHh4vev38QZ0MtofP0wC9AT1ccGxh09rDxrET
         89kTnoq3Ks9PKJXDpDb6/HD/fhMvnPMlxuhcH8g214p2uuLCnU0cbCm/GaC4mkoQXACM
         S1rQ==
X-Gm-Message-State: AFq9FYK78+O0CKaDdZxrZaOyZnbfxyNgLhjW+b8Ho27VzXk5xrDJDan8
	yGRR0fvbUMG91eg+G4bkQb+Ye2NxADwggGk30xrl3sS5/LqxHc3tiIDD2J6bs9Qwxtz2vZrcWVz
	bJVHpSnlFs6cRNHh6tLcLMtrJwv946Ugu5EatD4tSq62VyvzZFIZYasHidFMgLZ936qEd
X-Gm-Gg: AYBFou0p96tYV5spCW9JOIh8WfAXP0d+Fp+4wTL7xGi5cl6FbhOVDNP/8UhUR7R1hGZ
	b33PjTiYV3WeZUIhStUmXyXoXxF4kGDJJ2wFprvd6H0a5vT3AdLY+hU1xV8P0nz273sR7qUzJEv
	2kPTQKOrw7bUufjpnGQJLCYDfBZsVQVn0FJl1YyZE125SdYjGJ8LcARS9qRCmkmvKOhAvLQMmbR
	TMTO/oE33IQY9Oyd7uyORUF3sR9CoCUW3/mfI1slt9mWoUKqMngTd3jD0CKocvxj7Ilvoy0NruI
	+Wp8GGOrmrWsozOHvLmxhDSbpVEGapBo12vguJrisqGAPdV0SQoksrRwgt8097bRqi1oOSJeEwM
	yl26GO/nkJOXx/LyZ64CqBQaWp7as3Do=
X-Received: by 2002:a17:90b:4b85:b0:3a4:ba6b:cc24 with SMTP id 98e67ed59e1d1-3ab3ac87891mr8780855a91.58.1791890746531;
        Tue, 13 Oct 2026 04:25:46 -0700 (PDT)
X-Received: by 2002:a17:90b:4b85:b0:3a4:ba6b:cc24 with SMTP id 98e67ed59e1d1-3ab3ac87891mr8780835a91.58.1791890745962;
        Tue, 13 Oct 2026 04:25:45 -0700 (PDT)
Received: from [10.216.22.79] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab37817414sm21634597a91.2.2026.10.13.04.25.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 04:25:45 -0700 (PDT)
Message-ID: <fc6a2d33-7dce-4b93-97e0-3ccb0795cae4@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 16:55:39 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] remoteproc: qcom_q6v5_pas: Add remoteproc support for
 SOCCP on Nord
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        shengchao.guo@oss.qualcomm.com
References: <20261009-soccp_driver_dtbinding-v1-0-40862f7fc58b@oss.qualcomm.com>
 <20261009-soccp_driver_dtbinding-v1-2-40862f7fc58b@oss.qualcomm.com>
 <77e47222-e633-4d38-b598-8a02921a5d17@oss.qualcomm.com>
 <62d0573e-4085-4a74-b730-faecbe4cacba@oss.qualcomm.com>
 <b2b51cef-cd88-41d8-b9b6-3c4f5ebf3d59@oss.qualcomm.com>
Content-Language: en-US
From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
In-Reply-To: <b2b51cef-cd88-41d8-b9b6-3c4f5ebf3d59@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0NSBTYWx0ZWRfXza0lpfvWrsCL
 nSIFue7aX2JDPGAAsRkQAngVnaIncJsNEZl+CjC0MOjvYTZmUbLJXA+IMoBeMlgsvvMmdBjkW/1
 g66ZtzPPxUHXkoilrteIL3OWX+sAlFeyFgG6pnI7Kw5AxZqi6xq5/DBJcbZEcNBfjUkWbROIztU
 FX9tumO31/H5NycLpmKbajJQvHHZ8VSfPNuYRyYEIibxX5h9o/LuzmlaYIBskqEZLCVKqLe2TZ9
 rEPm2J+cFhueWe3szCpbyPUldLf9gI0RabrgANrXI8JQrLx5utZO6GhLQpUezgDyqSUVVzPwm2s
 rFXjx/mipz71AebiMMGmagP5vfQBbuh+c7Ugr3uPXlgRtf0pSKGM2EM/akswev68G/oM/Cla3Kw
 JEkta3xM4+4s4PRK7mlImT6hpBTNK7ZSdZ5lIsQLeQwUO5CkIiRw46WgmEOi9s4W3m4ZhMULz0C
 vLh4fIpnc1eGCkzNOMQ==
X-Authority-Analysis: v=2.4 cv=Z495j3RA c=1 sm=1 tr=0 ts=6ace153b cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=V_CaKR13k3l0X16DQUoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: jvA7z7p_2mjKBTQJhupYxPXTnPThvMeU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0NSBTYWx0ZWRfX9zlGxUcvGEU9
 p0rb1B2+NFUsY5UKhAK2LU6AX6oOyiyx6r9/WWVwzv/yBYpgQKjI1PfuUJRZ2RvzAsiXNcyVOuc
 XujTpG/w0jX6yxfxbafwkOoDTu25LY0=
X-Proofpoint-GUID: jvA7z7p_2mjKBTQJhupYxPXTnPThvMeU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 phishscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130045



On 10/13/2026 3:33 PM, Konrad Dybcio wrote:
> On 10/13/26 11:58 AM, Anurag Pateriya wrote:
>> On 10/13/2026 2:27 PM, Konrad Dybcio wrote:
>>> On 10/9/26 9:35 AM, Anurag Pateriya wrote:
>>>> The SoC Control Processor (SoCCP) is small RISC-V MCU that controls
>>>> USB Type-C, battery charging and various other functions on Qualcomm SoCs.
> 
> [...]
> 
>>>>    +static const struct qcom_pas_data nord_soccp_resource = {
>>>> +    .crash_reason_smem = 656,
>>>> +    .firmware_name = "soccp.mbn",
>>>> +    .pas_id = 51,
>>>> +    .proxy_pd_names = (char*[]){
>>>> +        "cx",
>>>> +        "mx",
>>>> +        NULL
>>>> +    },
>>>> +    .ssr_name = "soccp",
>>>> +    .sysmon_name = "soccp",
>>>> +    .auto_boot = true,
>>>
>>> No DTB?
>>>
>>> Konrad
>>
>> The base patch isn't merged yet for nord-ride-embedded.dts.
>> we need to enable for both rrd and ride-embedded boards.
>> I was planning to send them together once nord-ride-embedded.dts is merged.
> 
> This is not my question. Remoteprocs on recent SoCs come with split
> firmware - MBN for the main part and a separate DTB binary containing
> configuration data.
> 
> Konrad

Ok , I got your question now.

For Nord, SoCCP DTB file ships firmware without a separate SoCCP 
device-tree image. 	


Thanks,
Anurag
