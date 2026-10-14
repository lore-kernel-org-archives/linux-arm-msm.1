Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DDBF47F796
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 07:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791962697; cv=none; b=jKQWe5dk7+z0i/n63kOfPh78UDCT4K1gj7qi+fHUyREpWB61sKmtsS5JL8De9wJYEEyYuDYwm9084E+arM2FtNg4jU+eV2r3Sqex0W8hZdCn0SHYWZW2af+I8XwBgCxjs2iQU304A3xBNZG4jZtreibLkbi7hqUIw75vobYltsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791962697; c=relaxed/simple;
	bh=dDa3T4LL5IpxJg+Jw1O52rvh+4TrC2ENbVfqwgR4Dg4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gKkDNOuf3Cm5YLNYgtNnBj74fGo7KoDbMXoy/ftRPbuqllEpJZ8dsrx37KkOoHmFGLZdNdtRNZo8U6eBG4nfNm1WmOkjp9bODkVllio8TMGBGZJVgOd95XDIpKhS+tu3+S1llM6AiMC27Ho+arFIjnPtoVBqlO86PKQ/9A7Qrm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lw3AI7Gh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SXIED4pY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lw3AI7Gh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SXIED4pY"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E5wpEx3951277
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 07:24:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	trNalYmEySgSEmIVqxKOUHAXgXHiZO1fSqcMnYiYX/I=; b=Lw3AI7GhYfbiJz9T
	YarnYw3hvSt6xmcYyMD4WfuKKBloP2wu71X9p5TB3p7W4Ipkm8AMjKSVdWo7PkcB
	+dKkYQH4cSN/vGMgBmYRMnpNVJkXSyYIynXEOw82hMGHjQ2OFvHsd70wbodA5VbO
	kAvasZ2rLpGHxTHHkcIDJkESPu4831Slv2Z20Vl6LZ/8d5AENt6GBy+0VYbGVSMa
	EmeIXJTIwZ9euHuFYau8tDv6NBcLEe+BpzFLdm6tRaYKgqsjYNgbjcnJVPeCHUfs
	82xRsMr8n4Am2PV4QUd2wI1pfacvMja0ni3QxwWup4+O72sRbfwbuCwZK8Kayr3S
	JdIYGw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha42p0b7k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 07:24:54 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-530cd3dff25so7902271cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 00:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791962694; x=1792567494; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=trNalYmEySgSEmIVqxKOUHAXgXHiZO1fSqcMnYiYX/I=;
        b=SXIED4pY/geJzNw+kl/5OszUumsAQxIWzYQUR2uj1t6i3JoRZGP7rsy9mkEm0G1rHJ
         CRetkt3eMjuNpGFrF6E8LIiBEIRHRrlWKKUV4FpYyfcZ7djsDDASGkf7FOcCFLeUseHP
         4OlIe8acDow7fZuliz6leSuUIZ0KRZSImnJdrQVRAEB49AJ5xIy8pcLAZ+9HRspXG/Yj
         NL4TY2MSQkfbhnZYRBRZ1t2uDbglpfqK5brProCyFC6T9cTwHMrf9I6V1TCLhqs588Xw
         Z6jJtOnaepX6kZwlVf5wGUtNJ3PHqKY71JoglK7RJgueTw8eGIql2fDb1PK5HizwBitH
         rYiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791962694; x=1792567494;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=trNalYmEySgSEmIVqxKOUHAXgXHiZO1fSqcMnYiYX/I=;
        b=iqx0a0Ciiu+rsUsdqn86/SXc9vk2N302oKSSWSCQUXJhA9XkmaxZ4gn4X/t0sJdwxk
         8Gb9YlIJPlpQAWDPq8/dSzvFI2+v4iect5o8yfUfleAj0NEd9qL5i7YD7GCZBuL7Vl3Z
         ovn4HzwOXqBqGS3iz9plumXSKtY5zhZdTPsR2hsq+pt5NiG5JMP3pni0+O/0bBCRPQfl
         SmkVeRm2JCNSKzpuWVEuoJqesILh+v9x+zkM7ZPPWigIUhyherX+yzgIem2wQQMb6eHz
         4IlHAtRSe6v4SOeq1ittbOXSYP6/SasOd6UCiOr0WstCPs2sZNKK7H5Nma4AKlUN/l/7
         Q0oA==
X-Gm-Message-State: AFq9FYJV4LdCEZ2FPUngathyEDeqoy0iQgPMkMS/VlAv49wm7nVy5tKR
	VoM0K+mxmc4fOrR0SDFj8mlsjZX/HKlAraLLxo4m+aeHaPJ2d6C+qII3qhXMAJwD2WTuHAQCc1D
	uHEhvZfuihlRH1IfHDzxB4jGqxnmSaQDlvO0QNIVCuF0E+but4ChNRWRNTB9GEhfNVVdm
X-Gm-Gg: AYBFou0z7hWG4Z+JvIbdtmxynXiM8U9elgdAeWIHIZbtHKHuhs5ZW77131FCC5+cQmR
	YjfFdzFGq0cxI8B9J7X19+ig4ZyTzcIpPNkhZ8LI/E+AukC3dZ1hYw26JVDG8HOCnqs0HSwX/6a
	dqXbh/2CxfPjDip3t8o1q7HH6GQ6br5Ra/EUeco2Ev5TGKq/Bx84ogEboUX8udKG+/CwCFvqKbZ
	CjHbjkNWbs24GEdB6ra0b5LBjvKUofMd8hmD4AiYCWOCfbeEgjJ/Qlwglds6FUJ5oSiPDYKicoz
	mttbQFhEcI+CoKxPewRTo/VDq0YwzQrDyUSDPkSqEMs3yaNICtdOX4EQYDcvKviyTx6Ofkq2wT+
	LHom38HZIT84+jcnc/e+inQ==
X-Received: by 2002:a05:620a:458f:b0:93c:61e0:81ff with SMTP id af79cd13be357-93ebd0a3722mr2969001985a.1.1791962693598;
        Wed, 14 Oct 2026 00:24:53 -0700 (PDT)
X-Received: by 2002:a05:620a:458f:b0:93c:61e0:81ff with SMTP id af79cd13be357-93ebd0a3722mr2968999985a.1.1791962692965;
        Wed, 14 Oct 2026 00:24:52 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9ae4a94sm690977366b.82.2026.10.14.00.24.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 00:24:51 -0700 (PDT)
Message-ID: <bb87b142-075d-48b6-a737-f13170d76d5e@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 09:24:49 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: cmd-db: bound database walks to the mapped
 region
To: Oleksandr Suvorov <cryosay@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261013091611.2592612-1-cryosay@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261013091611.2592612-1-cryosay@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAyOSBTYWx0ZWRfX86jp0u58N9U4
 oBRdUE9zoftrhkyuUGZFe7U0Ft25VjtS5jxCX07S4eDzUYuBlYeBXc0xb3NBtnaNCuu6fgknpi1
 mzHmbOuzrQ1M5z9xeCnJxdK2ScGU9ms=
X-Proofpoint-ORIG-GUID: ePvPNhN-L1lHydCNVUs0LIFeQgVGqZKO
X-Authority-Analysis: v=2.4 cv=aeb0Dhot c=1 sm=1 tr=0 ts=6acf2e46 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=pGLkceISAAAA:8 a=rRUGPTwFRYfZxENE-AIA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAyOSBTYWx0ZWRfXwwossnVgqYr9
 A2OdXJYYxt5B77wYG5I9+SJhpsk3jaoeQygTEP6AMvuj2rs6QYLOQSzXbAYUt1YRXkYvzKnFaUY
 qPZcJypYSxfwwewuviboM8fcpovOENao/+OCI3spGrO2HlkabBCvD5P6O2LEQ1KT9sHgcM1dCQN
 o/rSGShAZG1RYxTJAlhgRFH6/qdqMlUfB3VLVPe2xRaJl7p/8R0frmj5eB1a5ClXBI2ZK5foyNS
 O3k8pOBcgxboiKA3cYQMeEKWNx+5CjiT3nMYBJs4sBgZUg2Zihwhe1qPn+3swUgyBR1KhatM7ba
 9OEtmrbSxL5qrXICUILDraGFEUWkg/yV21U9KYxcPVnWZl5fDEjdrTy34iFPLy70DQz9UCh7P+a
 NsQP1H3k6azHj3ZNRW3IdZWypB6csfAwxZOQ3XFb2BPjTBOjGQPV+6nMeEYn6uOW1sDMGGnGMwM
 24H9VYKRAAX6IRIm4jA==
X-Proofpoint-GUID: ePvPNhN-L1lHydCNVUs0LIFeQgVGqZKO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140029

On 10/13/26 11:16 AM, Oleksandr Suvorov wrote:
> The command DB is read from a reserved memory region mapped with the
> size given in the device tree. The per-slave entry count and header
> offset, and each entry's data offset and length, are taken from the
> blob and used without checking them against the size of that mapping.
> 
> cmd_db_get_header() walks rsc_hdr->cnt entries for every slave when an
> ID is not found, and cmd_db_read_aux_data() and the debugfs dump return
> or print len bytes at a blob-supplied offset. A count or offset that
> reaches beyond the mapping makes these read outside it.
> 
> Keep the mapped size from probe and add cmd_db_in_bounds() to check a
> range against it. Skip a slave whose entry array is out of range,
> return -EINVAL from cmd_db_read_aux_data() for out-of-range data, and
> mark such entries in the debugfs dump. Warn once for the first two.
> 
> Also set the size before cmd_db_header becomes visible to callers, so
> a lookup never sees a header with a zero size.
> 
> Signed-off-by: Oleksandr Suvorov <cryosay@gmail.com>
> 
> ---

GPT also suggests this additional diff to block a smaller-than-the-header
cmd-db region:

 	rmem = of_reserved_mem_lookup(pdev->dev.of_node);
 	if (!rmem) {
 		dev_err(&pdev->dev, "failed to acquire memory region\n");
 		return -EINVAL;
 	}

+	if (rmem->size < offsetof(struct cmd_db_header, data)) {
+		dev_err(&pdev->dev, "Command DB region is too small\n");
+		return -EINVAL;
+	}
+
 	header = devm_memremap(&pdev->dev, rmem->base, rmem->size, MEMREMAP_WC);

Konrad
