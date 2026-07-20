Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FADC427FBF
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 14:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784556053; cv=none; b=mMHGqqUnpP+DTPUrfweMMviI4jY6G9p5bpETLwF+aTcfNS4WYXLfi3u81in5FECRyryMZVeZmHfCOILUkVvYS4pRI8GrKWUqGi5omzJazGgnqxQxb6eFMw1xNczNK+CrB/mkONhPMlbZj59suOoJ3V992Rbz4g50z+U9uz0jfD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784556053; c=relaxed/simple;
	bh=oBMb12/jBWSOUvFZOYBVI8AV7upjkyjqsD/frlDb26A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XkaTOynAmn9FREGgXor7/vjrBv3wXeJ423rdNvc06RlqHEJPPTwE28m1jl3J4ZQmDF302lMGR4B31qO0KCqN5WKeXpM5aOudFt9go8Zft01d+ecTiSrj/DX6EUXGRiTYtv0uiKHxvcR5XQTKjKj6AXK9sggLH5uzL3rnapb3+UQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EU6TpSs8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kHXxnJ5h; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EU6TpSs8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kHXxnJ5h"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KDrBcn2581829
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 14:00:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0k366VfeOAZj7ASsgZuqs3BZ1DxSbGgGfa+ewz7+L+4=; b=EU6TpSs8zU/dcfla
	OPJ6bbP9TUkk/NOy7EMSy1XhXdTsue8kk1IdFnr58rG8n6uOr4g7W0+hFSLmPg9E
	kzZirMVV5PIkmx3NIhhJWsEu+08c4Do7BH56KaRbjZCeyjD2NLaXE898onRvRk/h
	igAAclV9CLNvbllpGfI/2SCWb+a+6eAyZ6ZM1oETTS5ZY/rmdboq90yUhuVUECC4
	tTNgT4BA0URq5Rm5It/i9yzZNVmrbYg9zR/YXvs3071j8T580rIe8L0vIH3LwfHZ
	Zd4gy3BwNEedWQA1jlsrnZjex7t1TUeCM9FfywvyMM/ij3qLF91keE9As1j5PsCr
	9W7MHg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhgs016e3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 14:00:47 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e6415f279so144732085a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 07:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784556046; x=1785160846; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0k366VfeOAZj7ASsgZuqs3BZ1DxSbGgGfa+ewz7+L+4=;
        b=kHXxnJ5h/prbePkLOEiRY75da9wqd+fDzd4j8i7kwcsPXrQ0HXj3ZlZrFH01XhVXPQ
         oMwQvk2xLb8glVN8+HOs1l6GUVDC6+ttV22hKY4bCiPC08jru0JleV4G9T3cYlac0QO/
         gXky3u2ftJQ464WRXPtyh14kum69tXdtCP06IH+vVr35IPgV0QQttF4PFJJT5zfBcyB9
         znUmujvJ9AyGWxY4+6SHqP9Fqi6wBfkJ3en+yq5LVW9Z+R2WLod7qpx6g7NSN6OTSczX
         Ool2mOLENEWXWjQb+QeuLcvdbZV4QzPP2pc8U6N/BYdWhNTtTjUeNl61uLQ0X2iGoQKw
         u4DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784556046; x=1785160846;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0k366VfeOAZj7ASsgZuqs3BZ1DxSbGgGfa+ewz7+L+4=;
        b=VULpE6zUMWgrWgzGuK2cjvGReDRY5sLm7V7WNF9dWoNXTFvnDbaaF+zEiH44pblJir
         bjvwrM6djY/pTrkHzmHEzA1yiNSzLB9zHjPtGavjqX1uFpbLJIZlIrxb+25vSENmgtF5
         2YFAwCzXKFL72nEitJALidTsvPdw6FABRcpBWICImDS6IWWusV6C8KXmg5J1JRMkRvmb
         N5rL8AF0PWwa7FwzLuwykkhb0sOpISZnr4vluzPV8I86SUWRJxgCAEM2Vr62hj19D1Cm
         aO6/UTDI4WIWnvpbskBWNn7Y+YWdtrgCXpdPO6r7lQm1PtvXMabluSAAKUE5Muf1wMJZ
         qVkg==
X-Gm-Message-State: AOJu0Yx2TLUtpJ3fZCASwo27FWFKvLonJRQYoX4pLeLzpujBkL4Fe4uE
	VxUNhRezRLelnlDDhNLcHpCDlJEx5Cnd616zQkXmp45/+seHGlNGHPRV0OCAbxBE1K2IuQ9HxY3
	UjpwjP1OR/9YIsv3zAV4nn7Rxtd/RAFmrdnyPiLf8frvLM1PFpKVI4fnBh0k727IQTQBn2wfpQd
	Ro
X-Gm-Gg: AfdE7cnJjPGw/4DRzHQIV5CYuqeuyX8AeIMT1JSs5cK/jxVBkt5TOjvf2FLSl4p4vQC
	C1Nt/taeWa5FnVv3381uqxG67sVl3TAOIfR7XHd6UaAvL0u/x/JHQCYIhxF7IYhn9prqSm5jMfD
	+Dju5xFgiy/Pv38D5bAzgt90256F3rVlKjqlfL2ILxM2r7yHGFmMlfYbUmFzkKzpfBV1Jsq9xek
	Y504gTP8O8LDfMwm/IAzclfCrrkbu3Rua5QZd/7uARsGjUsU84c1lziJHWMVRtk+2KorTK1i+9Y
	OQuEWpX9+Xg5KTfARZFOVmvvfnRKzwP2vJWFazDD8/KehQG8IlIKD0fjCk6rze4HN1iQEGOvqpn
	RUzsIcb+5gWb2KjQzzPk48Z/V
X-Received: by 2002:a05:622a:148:b0:51a:8945:312d with SMTP id d75a77b69052e-525f5d98602mr8068361cf.0.1784556045997;
        Mon, 20 Jul 2026 07:00:45 -0700 (PDT)
X-Received: by 2002:a05:622a:148:b0:51a:8945:312d with SMTP id d75a77b69052e-525f5d98602mr8060731cf.0.1784556040194;
        Mon, 20 Jul 2026 07:00:40 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c170591172esm479090266b.15.2026.07.20.07.00.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 07:00:39 -0700 (PDT)
Message-ID: <6d3ef3fa-d7ee-4963-9c18-32c7605b762e@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 16:00:37 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] rpmsg: glink: smem: Use device name as IRQ name
To: Chunkai Deng <chunkai.deng@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, chris.lew@oss.qualcomm.com,
        tony.truong@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com
References: <20260720-rpmsg-improvements-v3-0-e7b6070186bd@oss.qualcomm.com>
 <20260720-rpmsg-improvements-v3-1-e7b6070186bd@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260720-rpmsg-improvements-v3-1-e7b6070186bd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDE1NSBTYWx0ZWRfX1yAH6UfibKkI
 8ctdZ5H7RlROcMhYUYxzIgEfXgyBokn9EBpYoRr1iVLxBMcG+QMvFPmSpxMaeSt/Na+syP2tni4
 Z/oMMq++cNepsbsStCDWL7RU1IsLV4c=
X-Authority-Analysis: v=2.4 cv=DMS/JSNb c=1 sm=1 tr=0 ts=6a5e2a0f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=M4aA-yYNIiwQogNIN3IA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: R1r41ikUUahHHxpQeSW3BUm-MTPiFaEC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDE1NSBTYWx0ZWRfX7m3qbkzTDkpH
 D0uOHouxGD/st49baNy2vfVBwbM1dg2LAHqF9fUi0awXgsX6ul0elZ/tnWxbUMjm3GtbQOmp4vn
 6d1BrgSm/El6U5CRLUpBXsjgrTJse0o+x5JOZJKo6V2EfSURrnHdWbp/Rb/ZITQRQjAiUha0cFJ
 LBKl0YufAo69uq9GNwdPrgtj4L6OcfbJXoUKyDCyBFONPI5CobOozY2dgo/1dEB3k6IKIEKE2wG
 MkwyOeeYuvXThcI65axN4iJWlzfeCQZ+VsMCQfsUELWkG7BSbg8dTq0KkF0G7//j/rbq6U0q9s3
 YxG6dfy7ZGHxb7ZAYinsG/NlScElCFoOuiUJY/nQj/Vvbh5PcWJ3UTT2Zl6ucwHOOGFVe1l6TU4
 W3Sh8f+Q12wo+FK7pLCiychxnH+T1w==
X-Proofpoint-ORIG-GUID: R1r41ikUUahHHxpQeSW3BUm-MTPiFaEC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_03,2026-07-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 adultscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2607200155

On 7/20/26 3:25 PM, Chunkai Deng wrote:
> A SoC typically has multiple remoteprocs (ADSP, MPSS, CDSP, etc.), each
> registering its own SMEM GLINK instance. With the static name "glink-smem"
> all instances appear identically in /proc/interrupts, making it impossible
> to associate an IRQ with a specific remote processor.
> 
> Pass dev_name(&smem->dev) to devm_request_irq() instead. The device name
> is already set to "<parent>:<edge-node>" which uniquely identifies each
> instance without requiring an additional field in the driver struct.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
