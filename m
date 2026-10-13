Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B67E34BD36E
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 09:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791885508; cv=none; b=Vc34yZqRfQq/vo0Fvrpt8RXifZimGG3erOTIREIq9cet12UJz/7VB9xcfuAziyx8WeR4VqLoTEAKKRK6jUcmlLohYNDim4NTyfC9jnlHphBf2SCoCYprlRc7Bl4M1y8Lh6YIdlHAdQZUq8CSECxQcxmKg+WxyfzUcfrRVYQcfgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791885508; c=relaxed/simple;
	bh=2dPTRel0DT3n+CZtpIwB+FFkdaQRRQzMwPcArTP1QWY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LtErZwWkauC9TGYWv0Xf4AA3M18LcW6IQ/8sr59eh1N4+FnyB6JLtf+k0IZ+s27zp8kfHn+Kuy/HNwTI0nFDXrrXD2Bt+Dq64Yi4NKX0R+5dKzRsJ9qCMNadbVOpJDxIJ0Noa1gGmxoBtPtlaZKydJgSbMGTmKgNY+1TbYeDhd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JMFT0x/Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NCwJ3Mlm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JMFT0x/Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NCwJ3Mlm"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D94580483083
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 09:58:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q3ffTM87Chgi1G9fTBz/2oDG9xpCCSCvK3xemsC7/Os=; b=JMFT0x/QhIve9LNV
	RmsGXNrDHU2YziJBpPE9fojAYA5Jlxpqia/OMl0DCTmM4Vl6Rz7z+t79fi9EBST2
	g15yrL/S6MtccbBV0xXN5SpU8BnQIUL6MEmSaC5IiiczaBxxa0jihurViwK+hty9
	400HpHg9UGE04+4QSpWuF+29YTNa57KpCLETyc8s1NOuLQGE1Qr1Im5af4fUGVx9
	Ht3Igqu6DWwFFxVMdjFn+tR3V/ezVw1kVP7GyQX70998I5/VFZDwb0k+DdP5g5Ec
	xNhrwLqRS+QiH+7xZjs1I3AkFA9PgCT9c3fJvLgq+gvYyvKBflej7rC2uJfH14qo
	UyPNiw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9hpg87j9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 09:58:24 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35cbea41088so523630eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 02:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791885503; x=1792490303; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q3ffTM87Chgi1G9fTBz/2oDG9xpCCSCvK3xemsC7/Os=;
        b=NCwJ3MlmJXbGTwM/QZW1zfUASLdI8bTnbsarWSs6ynhJ0Dl2YmbxaojysnJ4B+/wN0
         cq1qqd+vofYT0rGQdFOMnX8/rTvNsC9CVRURDum6I/SljCatk1YPUK+7wVJTil/X07ZE
         IOXXJKP5DL6N6w1Oyuj+7PjMmLcm7hm0hrv80J7QikRfvGybXEgQdXf67yC/bw5koOKW
         QMhWLiclg0aqGoXj4fgIw/QLfQ3DMQ25Ywl7SwpnuAtoh8sni+F5R/dMIJ4llIx5I1uR
         6SHlgsAtszJHOKo2ymN4IRp1RTqobSQL/EJZNgB9V68hkl5FzD4QlVw1c0m/EgEkkHIK
         UKnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791885503; x=1792490303;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q3ffTM87Chgi1G9fTBz/2oDG9xpCCSCvK3xemsC7/Os=;
        b=o8TAwu43yPXw0IoeFUimNRBdKg6Z6ueeqop7/y6zK8db8aeZ1JDMzAWVO6R44/zMGJ
         alsmvjxSJG9TEGO9wmD+ZdSFhxu+uFKYFyENt2Dg/1I6939akipqbiLlyOxBgspGkCPr
         DyKu2S4AH+NmV7bcuc8KiVuxtLJSppT5ywB24bXWPMaV/Id0W+Tfmk1JeybQ6WHG4tES
         5OunCLN6iBE6TF7TFg/8oCdZj8n7nbJSIGQ3NfAq30QoDOFeJlCm1XPB80vi0yNweKpI
         sApCKLWTaGQWpDftLfxQZsN+9zdDpTtC6YYohrxOFZ+QCDMoqfn45LovhBUT6xsq94tO
         1Erw==
X-Gm-Message-State: AFq9FYLSZW/ecWCC1hmTkaXjKzQJycOR1v+qVHXy1Hi9he1pK8cCJVWt
	jCH69fLMs7Seq24C+JsENfIeSZZRcFVqhR2+nCFrWBpkyX66UF+zCWk3Ht1k275j/WkmewcmvnZ
	kdDWwOYURpewiG8idn5Q+4osGfK6Av3VSCwSUtStQzEuFgy2K/OqST2K7I7gymIsAFsFb
X-Gm-Gg: AYBFou2tig7z7NO7+i2GrxhKOxbzo9Ljjh0uScVCxNJtCSe6Cz9tru+yl9NwFpa1fcU
	a+xJdQynJxyxKhKYIjMO3GhJXjAgokT5MOiPqAxjVjtXXULhcgFgYY9ZtrGAP/CxIrM1CuD6hw+
	HK2QxxUcnWF6z4xQlkTGWmNidzl8PCNpLdZhnpMWRMxVtmPnp32YkMNB5FP0DP9HdtHddDqwi+N
	9MvJRGfIBtAGtNgrFF1g8+u7afzKbOc0xZMhJ3C2gewCeP6aLDjwaVnJoVMmLy1IYaojCq2r6E+
	D/ZCAJsbsT72gT9qgz01s6SP9TUovO4M3sLqQEjVwK8Ac4eoWvVmIUUtS2czn5F/STJ0Msua+E3
	eGOblzh50t83b29mTeiSyU4yH3PkYN9w=
X-Received: by 2002:a05:693c:87d5:10b0:351:433a:acfd with SMTP id 5a478bee46e88-3537e0796acmr16646917eec.38.1791885503445;
        Tue, 13 Oct 2026 02:58:23 -0700 (PDT)
X-Received: by 2002:a05:693c:87d5:10b0:351:433a:acfd with SMTP id 5a478bee46e88-3537e0796acmr16646878eec.38.1791885502644;
        Tue, 13 Oct 2026 02:58:22 -0700 (PDT)
Received: from [10.216.22.79] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35977229a6esm27114030eec.8.2026.10.13.02.58.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 02:58:22 -0700 (PDT)
Message-ID: <62d0573e-4085-4a74-b730-faecbe4cacba@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 15:28:16 +0530
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
Content-Language: en-US
From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
In-Reply-To: <77e47222-e633-4d38-b598-8a02921a5d17@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: WDK05cxSa_peySL3OhTt8b9ANX3OX-H9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzOSBTYWx0ZWRfXxwj+vKwHNy9t
 XQOx2zK889rUKEvGeKnbkBa7Wr2h1InA10h/GZJTZ1+pjYaf3l3+7gUKGAIxa4ZIaa65Y8Ttrgq
 NodwVJfV8A7dHc9ryiLL5efphCNqmYQ=
X-Proofpoint-ORIG-GUID: WDK05cxSa_peySL3OhTt8b9ANX3OX-H9
X-Authority-Analysis: v=2.4 cv=Z4Z5j3RA c=1 sm=1 tr=0 ts=6ace00c0 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=bJu89BRhDEOEog6wxuYA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzOSBTYWx0ZWRfX3LkXFWl7yBIy
 ugM079jCckGTEwjhBwIiSzr4/4Jx8qy1ul2xYVLOlPoJ6+XACmo+d6W9uvJ8MxI1V3cc6tJlilY
 +SFhyZUp5AV095qNQgsGviUBNTG22KXayAJuwniywEjD9ue/sNXlKkDuaDBUMiTCFoCmp+yUHK+
 D0x5QikrBWAChv1FCoNEsqmHH6P6i6zoplFIChpPatXu/nDs6Gl9ZSoWxl0u2hwnadCtSnCCvcD
 LnVAO6b8XYe0q1WvgwiFGT6i+soYyLacJL3TrfE/l1cdHvjGXhinvNcevHXBRosA+RWt2TANilU
 juhTf+CFmLp8iqOb07kHDX+PVki25rCHhKjlyBCznMcqLn/buWdLZ2NHjX3PHoNYr6/2ya9ve9V
 S/6NCymhwTPkTcGDUyaCn2lRatwc/POmuuxYCUlPKuCvHUsVQuRjGLGWr0HnUKec2ljnkeGU9iN
 sUDiHL0BBqNWNYb1K6w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 phishscore=0 bulkscore=0 adultscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130039

On 10/13/2026 2:27 PM, Konrad Dybcio wrote:
> On 10/9/26 9:35 AM, Anurag Pateriya wrote:
>> The SoC Control Processor (SoCCP) is small RISC-V MCU that controls
>> USB Type-C, battery charging and various other functions on Qualcomm SoCs.
> 
> But that's not what it does on this SoC.
> 

Yes. I will update this in next version.

>> It provides a solution for control-plane processing, reducing per-subsystem
>> microcontroller reinvention. Add support for SoCCP PAS loader on Nord
>> platform
>>
>> Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
>> ---
>>   drivers/remoteproc/qcom_q6v5_pas.c | 15 +++++++++++++++
>>   1 file changed, 15 insertions(+)
>>
>> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
>> index a005546c265d..6fa958044218 100644
>> --- a/drivers/remoteproc/qcom_q6v5_pas.c
>> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
>> @@ -1545,6 +1545,20 @@ static const struct qcom_pas_data nord_cdsp3_resource = {
>>   	.smem_host_id = 197,
>>   };
>>   
>> +static const struct qcom_pas_data nord_soccp_resource = {
>> +	.crash_reason_smem = 656,
>> +	.firmware_name = "soccp.mbn",
>> +	.pas_id = 51,
>> +	.proxy_pd_names = (char*[]){
>> +		"cx",
>> +		"mx",
>> +		NULL
>> +	},
>> +	.ssr_name = "soccp",
>> +	.sysmon_name = "soccp",
>> +	.auto_boot = true,
> 
> No DTB?
> 
> Konrad

The base patch isn't merged yet for nord-ride-embedded.dts.
we need to enable for both rrd and ride-embedded boards.
I was planning to send them together once nord-ride-embedded.dts is merged.

Thanks,
Anurag

