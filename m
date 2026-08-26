Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D27144CACB
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 15:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787757473; cv=none; b=oSk/CwTypa2+RuausRI32dK3cveYc085qnSZou02LhCRBa9H83R41T9rzC6GTSFu/jE0uZSrNK6wb/2oqMFAXOuPRkfGAIJzOpI915Sktn14m4UwYl96E8ZOZGf17Qcx4sSG8J/MvZ8ueEWJDWb0tvsKqZxxN6r1CDBccN4zgbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787757473; c=relaxed/simple;
	bh=Sk8am2Vtc6m9rrLeY1Sbj7klCd/qXHFyxywLnXgPxcU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QO3reyZxe+V4kluSVAGdB6oBKY4bljfJz+vYnyNAyj6ULwf+34kecnXj74o3+laa6Q0+Anwo5QAuOqBI1AZr6vG3k7wg91e8O3ZSYXIRhbgGIJIETvEqMQR8A1u+FP+AElU2gcxjpISE4aSo08JRojQ6LK3DqOxSDIxmLwIcA/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p5knkjHu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RT+Q3+DZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p5knkjHu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RT+Q3+DZ"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QDunGC593273
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 15:17:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ACC2N5csm/N7GWXhyzoNg/HYZa0MB3L4DHfq+Va9l/I=; b=p5knkjHuqaYpQxzB
	H7zvlxnKLQOs1cDx7G1/WbGXm7to0pWBWSR8OKDmeDK/7HsJo6q49HF3qCXkl2pE
	mjswcW8ddsNNA9po4CQBYyO8rO+rRWohR56Q+LFAFVZjRdwiWhUXmDLxtk/NH2SU
	I9Hs+ihAtA+F8wsEqoiEBuDfckytb0cP7TETqi/Aorr8CvVi2R1sLbwcf9TwJIQO
	Pu+iBTFoc/fR0G9oqKuS5sJSoJv1KrGIcf60TvK2XFasrc6EKxYsg1rtJ7TCkR+2
	Rzcaf8CJitCIJN6vpV0F/PM/IGcIu3rdEd+c4+XY8/bOhCJQVWufzo4zWgZ+zEXz
	tY/3uw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9s9gaggy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 15:17:49 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3950b1371a7so1885433a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 08:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787757468; x=1788362268; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ACC2N5csm/N7GWXhyzoNg/HYZa0MB3L4DHfq+Va9l/I=;
        b=RT+Q3+DZvckCun3HgDClAVd8dY4dqLTkoxXh1qZVVe977tkQOiKzwRyZKntbGyUI1x
         ze/O13OIps7tzbTyaTbLQcqtvacUQvLzF5fYyf6i1rO5uxSnKmHOMlR0hUtFZkg9BodQ
         F8svhi3OL60ty75CsrSsD6jj0ZvYFdbInMuUOksLx3PnAG+ZxHuH5em0EeoyA6wBAJ5H
         ehY3TFiKNQ2uI8wgcjiEnaC7bx7BWat7aJoMix1rCMyCUcgJU1/ukjBeJqBRZDc8N+Xd
         o1L6ih1edEg07pn7Py/Odff6sOJcUblKOfZ84mjY3zqXShEluTohOL4OasqwPhceNlVE
         VBIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787757468; x=1788362268;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ACC2N5csm/N7GWXhyzoNg/HYZa0MB3L4DHfq+Va9l/I=;
        b=bDdO73EyLN0nl5TCMdGZc2RkrkKfOe3zliBnAcOXB+7kBIdyGx/5aWFhvFfJl9CYQy
         Ul+sCcEyfcwEuJRREZElIR0l0jeEnYfAITFr/k0CYLO4DomKPl0cquS0GzO7XIYnNm5+
         /LwUZgmvsEQLq/X4psCdp1ssYWBVevN4Qd5TqQAW5/nqCecuwWMjWZ1bVBK4amKPLxEx
         ERFCiby1qichPbqdnsINlWYL9oeDbPXzfqUQD00F9pyxK0qJw3Lm+2YaWHjUYH5XyVEk
         e/6JyhzynxWqetX5tASSZIK+uy7mPVMSLjYmY5KuPkwiEFSt/QKzoO+lp68MOB0g0AfU
         dRjQ==
X-Forwarded-Encrypted: i=1; AHgh+RryJV1EGbCp06XVEmJ7OaBUa2z1k4hCjCvTJWQCl+b4dg28caVmJrbH0xa7UeCr6PxOIeZVCqdO6MEwNAA+@vger.kernel.org
X-Gm-Message-State: AFuF++ntbAGdDFOUocEv5CoIyNHy/BauUAFG+H7HYr2DPdrOGzFhUON2
	8ZIEp9FV+dCuHQ4jP1BYurdOdaFahwsbt7dHbWavp2bqnKgu3D1ODJyLUu2kIUdJl/RXaZltf2O
	uB8enabgENvugdolUxV3xZiwt6ptsTonPCxjIO+Xm/bZuZRIrK9k8osXUw2r+kCtMnJ7S
X-Gm-Gg: AR+sD12bCAT4A63mgQrtjunfNH1tu+ruXrBK7Z4pXFBZIuKUWJeHzphQjBE0od24SbT
	q+n7yoArbynSOiX98r/MIX5Mo4oZ4ypyuv32ZKnCcDyCXfFwrp+S4+ZZgn2BR2tGE+cvp1n/cfC
	B+xAbMdBpHoSk9LIjHrOg2JY9EZhWE36DgtkGaFTes0bgveVrkgZvK/Q2VoqMW0sXNZ0nN7cE7g
	OHArogVP9iUSG1EUdyKv5VXs4XnlultF/NwE9bDH9yC8WWdFV/3l9cEJm2i79hScYNt9J9hVYx1
	9QlzhXPD+MT3Jqk4QGaFhKKImG0N2B65lmZ0KzgdOtVUDQRnYGjSUKuoZxLnjgH7ppBxirAk1q8
	47e+YDEz/wer1gWi2cg7A2T+v0ljAH0LI
X-Received: by 2002:a17:90b:4c09:b0:37f:e177:f58 with SMTP id 98e67ed59e1d1-3966d3dcdb1mr15426107a91.9.1787757467960;
        Wed, 26 Aug 2026 08:17:47 -0700 (PDT)
X-Received: by 2002:a17:90b:4c09:b0:37f:e177:f58 with SMTP id 98e67ed59e1d1-3966d3dcdb1mr15425980a91.9.1787757467399;
        Wed, 26 Aug 2026 08:17:47 -0700 (PDT)
Received: from [192.168.0.6] ([49.204.111.175])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39646138f87sm8381159a91.3.2026.08.26.08.17.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 08:17:47 -0700 (PDT)
Message-ID: <75e6979b-84ed-49ee-83f8-bdceef2cb464@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 20:47:38 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] soc: qcom: geni-se: Populate clk_perf_tbl with SE
 source clock frequencies from perf OPP table
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: mukesh.savaliya@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-0-61171ab1cdce@oss.qualcomm.com>
 <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-2-61171ab1cdce@oss.qualcomm.com>
 <d81d61fd-79d1-4bea-b93c-0afe44f9aab4@oss.qualcomm.com>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <d81d61fd-79d1-4bea-b93c-0afe44f9aab4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: crPZsMvD8QgV6eKNFAwjxKKDAaWcqSyn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDEyNyBTYWx0ZWRfX28r0Cw2dCr7o
 ovzr/0DxCd2Q6Fd1BpzoU2zKP2ExJrpCA56CTXqdkdeczY69PtA7LcJDQAV7/0FeRwK4lpVL1PG
 7tZMtS9B2Y80O90+KXXjxf6mfmEsmp4fq047mmI2fklxcH1Ig8pr6RuSf2mgx4JmDeSNG3z63ZD
 Rh2J804X1RGOo+2nLPIIsp5+M/GQ6bx+UK5lTL2L87mZdF82uHwJ8dxWdEXaJGW8SGX7seUIyXE
 JUD0BJmU486N4Oi4f90XVTFSSKfH8WwW//JAofLX1HqhjLYC/BROfJi9e1OsZ0mt1F0r93z/ruV
 L23LoiYITLvyANi5d1bKClNtDKlH7WDX2KQgX1ltIydC4hcJRNXxSIsM1XOOy5r2PIPHuT72+lf
 IqssTzu0xUgv5qh8NLSAjheMDT/5kHh0lJx2hNcmxNxojZ+gD90Lren7Sfcd/Ep0v8MHU3BMnI2
 hw+Fej+/O6+4urUZ0Ew==
X-Authority-Analysis: v=2.4 cv=Xfq5Co55 c=1 sm=1 tr=0 ts=6a8f039d cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=MMW3c9rFXQuugNOjlkEUow==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=rko7XVifj6BEHbDbj-IA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDEyNyBTYWx0ZWRfX3s44AC8wFSRd
 QquoWjpRRBo8ZPp2mEMh4gySWQpmSWQqbTG0/gt353xCtqa1PtVQl81b7SBs8bwZA3YV0AhBq+8
 kuX+XeDz4pYIgyiQ27YU+LAaKd39z4E=
X-Proofpoint-ORIG-GUID: crPZsMvD8QgV6eKNFAwjxKKDAaWcqSyn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_04,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260127

HI Konrad,

On 24-08-2026 20:26, Konrad Dybcio wrote:
> On 8/4/26 9:57 PM, Praveen Talari wrote:
>> Currently, on the SA8255P platform, protocol drivers attached via
>> geni_se_domain_attach() treat each OPP on the perf domain as directly
>> corresponding to a protocol value such as a baudrate or requested
>> frequency, and simply request that OPP via
> [...]
>
>> @@ -1175,6 +1181,29 @@ int geni_se_domain_attach(struct geni_se *se)
>>   	else if (ret < 0)
>>   		return ret;
>>   
>> +	perf_dev = se->pd_list->pd_devs[DOMAIN_IDX_PERF];
>> +
>> +	num_opps = dev_pm_opp_get_opp_count(perf_dev);
>> +	if (num_opps <= 0)
>> +		return num_opps < 0 ? num_opps : -ENODEV;
> if (num_opps < 0)
> 	return num_opps;
> if (num_opps == 0)
> 	return -ENODEV;
>
>> +
>> +	se->clk_perf_tbl = devm_kcalloc(se->dev, num_opps,
>> +					sizeof(*se->clk_perf_tbl),
>> +					GFP_KERNEL);
>> +	if (!se->clk_perf_tbl)
>> +		return -ENOMEM;
>> +
>> +	for (i = 0, level = 0; i < num_opps; i++, level++) {
> One iterator is sufficient here

level is not acting as a loop iterator here. It represents the OPP 
performance level

returned by dev_pm_opp_find_level_ceil(), which may advance to a value 
greater

than level + 1 depending on the available OPP table entries. The array 
index, however,

must advance sequentially for each populated entry. Therefore, separate 
variables are needed.


Thanks,

Praveen Talari

>
> Konrad
