Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A17F45D5F3
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 06:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792390557; cv=none; b=sGK8A3dhF0zsRfvupgkE+UqKD0XCsks+YiCpu2Qo0DwW8PIt/nI1Ta/CPXRnYTaZrgHcwD/81/VvU63ru6Zq06LOjd99yxBTShI94KYorBFwql1ElS5U5E7eaHKeHFa/sk/wVh11TcEF04snTDb2irBTDLnXxfzxQ68hps2Xwb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792390557; c=relaxed/simple;
	bh=xhmXf1PR+SPWbydXKdG1JG0Ihlu3vWgnp2oEIJ3YqRA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dyP/QxYj33PPX1NAJCOhJ42w8ubgnKLF80fyLwv6fxsF4tazL822dtIIqkvAn/Ic1lC6CZYZY8PIdWeZtQu69ilDwQqWi4kjcINJ5xSusuJCwvPlElxeHq062sV1JnRuv8/epUCCKXl7VF4lOuhdOz8/epX/DHPDmY/aoaYd1H0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hBafz8Cp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bwn0lHiW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hBafz8Cp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bwn0lHiW"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J4jpVp2180151
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 06:15:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xnXlvura6HqbRVAHGsr8qtM9oPK7l8m6EFNCUTUAuOc=; b=hBafz8Cpu55qf6Qy
	RRsAnylBWsXPrZOVUSIJGFPsjdbUIODgR31N/lSucVSeGpCO+D3Ad8TH3E/Xlw6S
	t1qEAw32fZ3lQh7UciwTaClUF1A0L/Y5bhSKS6YK68SLOEkF2M+f/euccjDt5m8Q
	cyoEcmzjzGex1A2Hyv9zY4gaI7Vpky5pixtbbJzj0yQmXM0niutqhf181rDp3KAT
	IthhK6CMaJdiznoPfJ4ZF7okP+COcOeZr0iZu9tCEDzHIqggJDLw4nZGPeZe/F83
	ZGL7K45cBwg3tAfvoIszodOVhzMdMfH0INn6IpAAofwmd+BwQZk7W1WE1T69boUd
	tEo9VQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hd5u1h8cv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 06:15:55 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso3915594eec.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 Oct 2026 23:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792390554; x=1792995354; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xnXlvura6HqbRVAHGsr8qtM9oPK7l8m6EFNCUTUAuOc=;
        b=Bwn0lHiWiWjWhpcMrudF3xEmzBaMcfDINhXWtqWFrjsFM0IPul8CAnTfngGTprDMZr
         ehfSUh3gptDTGuHt8m8A2FvJ77XJjP5C4se0waBhahOzru0dbo64+PQgTGXFgzpKahWf
         J31YCXFA3ATn/9yXROYfWoKfiIbcQYrR9UGXsSMa7Lll4P/UC0ZWg6SIhP4V6onWoVWK
         +YlPDN8aB12FoaMdrzNeq/XInDzkCb6VPJnHjmZhrfPcpvQsO6MFieM3fmDwT3H8OZCD
         Zr1FaVRUdClIS7tkObKiyW3dAeqDiyI9bH4VnFgwMBfaIfa0RatNX33Y2U1Gu0NTA8sx
         eUXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792390554; x=1792995354;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xnXlvura6HqbRVAHGsr8qtM9oPK7l8m6EFNCUTUAuOc=;
        b=WWOcpar5GFJvWubH6rJIKij4q0L7TEmaYJ1jn9XdZaA7hILMTlr9I7zMTZdU1qxfu8
         qySWqcZixsxCqy6zdTu94yqZrKY6Hvr5dfptDVjlstQd0Ko44tMdD8uWpKOorAZ+BeOk
         6C9ZFG0LUDAgKKyP76Ox+sY3rzoMXquYtlbEHl75WaTeqhiaW1VMl4gZhmgUidsp6D6Q
         MQrHiA2EYea+HsrDDvCeWuHDgh+VQthtp3iycA1fsa7F+EWd919eB0KXOtyiGqog0vlY
         1/3RTdrAITkQIvtcPFX6k122s3NY34hEzA6ZTn/itJHS68gzLiggmdQE8oHCHP0O8SfF
         OOug==
X-Forwarded-Encrypted: i=1; AKwUvBxWKR78A4pmPKQgYmPIDyj3jWdV/sLFlXgFB/KGp2wKF/OBPFPmjY3dSYy2LCsRfE/u5oyhwL1mM7I9UXtT@vger.kernel.org
X-Gm-Message-State: AFq9FYIPAIi+xLuGLgg8Iy5CgG7eUgiZKJIEquYeTpXeV4N6lagiXA5x
	RNz5T3mU5l0fcbltB0Spw/iKSArNQsHvrQxieU4pYoNYC5CXYSp1DUceXEbOkD8GcsfLukkVDMF
	nclY0yF6Cm+4478Ow5vAYKgrmCM8+tPFxVT5tMoIRpEE/oBbPcWEkvUfizyeJc3SM8L2e
X-Gm-Gg: AYBFou2EL/C15l+Ug+/XoyCHRJInxX8nbetyVG2/mht909t/ngRirFlb/tbFsP+GNmo
	GA8FyqGSS6pbF0VQO4ear/TV8Ti7AY80z7Qe1wtVbrDtz09E96au8Bc1Xe9JIK8943OrsUTGegr
	H6VqppzzeY9nhvxa73LYUHSRbhqKc56uSGKu6NM/SsxaWqqO4FEHkFjLUJkA5wqt3U+NjYQ3eKC
	FRL381vjld1jqRUmBBgaMTn+EcLwnG3Ososp9f+jaYDkSnJVCy8mqv5dzT3NHXQtKrFutWqgvvm
	E/aY4+Qb/Vyy8lCVTpFQ+LnlUQEzzPsL9J8VSTwP2yL4nqSsiPw0lxbJ9pXOCwgncBZ2eMthULJ
	qqBRvIYyVmlCyF0SZD/KlXI8C68Wt5g==
X-Received: by 2002:a05:7301:4b0e:b0:360:ca2f:ce6f with SMTP id 5a478bee46e88-3619ea236b5mr9259816eec.1.1792390553842;
        Sun, 18 Oct 2026 23:15:53 -0700 (PDT)
X-Received: by 2002:a05:7301:4b0e:b0:360:ca2f:ce6f with SMTP id 5a478bee46e88-3619ea236b5mr9259784eec.1.1792390553247;
        Sun, 18 Oct 2026 23:15:53 -0700 (PDT)
Received: from [10.218.31.125] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607bc950f9sm32590185eec.0.2026.10.18.23.15.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Oct 2026 23:15:52 -0700 (PDT)
Message-ID: <f14e7eb7-89af-4228-82d2-e0dc6b67a0b1@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 11:45:47 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] Add TPM support via Qualcomm TEE TPM TA
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        Peter Huewe <peterhuewe@gmx.de>, Jason Gunthorpe <jgg@ziepe.ca>,
        linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
        linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org
References: <20261015-tpm_qcom_driver-v3-0-247c8e50250e@qti.qualcomm.com>
 <atKRjiZEMIx3hhxI@kernel.org>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <atKRjiZEMIx3hhxI@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 8YSdPmIE2-EG8UTkJnSwExzq9pK9-S2j
X-Authority-Analysis: v=2.4 cv=NItAaE6g c=1 sm=1 tr=0 ts=6ad5b59b cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=VeEq6VHES1BVyvH2O-YA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAyNCBTYWx0ZWRfX52hL5ZoQRIwV
 pArEoo44/45OH/0bRLy6sLGcGoWQKAm56Cm1wWBsqokaV9SQBy7S3NhgDDO51ox7L/q5acdU7mo
 pgjLjdppacKsUTkscDHOYTe+p3Zq7/E=
X-Proofpoint-GUID: 8YSdPmIE2-EG8UTkJnSwExzq9pK9-S2j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAyNCBTYWx0ZWRfXwXRe2KtM1I6i
 tiC6OhG8bxDJzkuLaPmTk1cuKIHcoEARI6JaVkRgXKgyAiQxze+tRV0oz+wdrtn58G+Ja7V/Keg
 yvkafYByCe0ecEhm2YZiNt21HIkau3Ug3o9llVf4D8uNDb6At2i6JxtNheOhzZUfpa3PB5T+c4v
 C0aulmkpj/f3XCFvrc5MheDSk1d1PmrdTUmq73nkQIjjLn1+QatQV8Bxg1BV61/+HQJrQn4wOp3
 AtfyL2PVBB5XTpZeRhhWI2azX28lmEwtyg60Nm75X6AvuIDFR51X9f5twhamzg4YKGI7edbz4yT
 IqPHOOfZvdYRayW3DucDNPek7IT5LUoIa5msnNVfP09ohxPARMEs8UUn/et15b1nu1tKHcmpoPx
 j/Ds3KIL83sJyTMpiHLPlzhgCbxDmD0+J+QUDPj6iu8T5rBJhfas8EsYLEAuLw8eONNiB3rtZ+K
 ET+ux6M1XhE7rwF2S0Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190024

On 17-10-2026 02:35, Jarkko Sakkinen wrote:
> On Thu, Oct 15, 2026 at 12:07:45PM +0530, Kuldeep Singh wrote:
>> Qualcomm platforms with a discrete TPM (dTPM) talked to it directly over
>> a non-secure SPI channel from the kernel. Arm's Base Boot Security
>> Requirements (BBSR) v1.4 require that access to go through TrustZone
>> instead, so on affected Qualcomm platforms the TPM 2.0 instance is now
>> fronted by a Trusted Application (TA) running inside Qualcomm's Trusted
>> Execution Environment (QTEE), which talks to the dTPM (or implements an
>> fTPM) on the kernel's behalf.
>>
>> This series adds a kernel driver for that TA, built on the QCOMTEE
>> object-IPC transport (drivers/tee/qcomtee/) already used to reach other
>> QTEE services.
>>
>> This patch series functionally depends on below(first 5 changes specially)
>> for qtee service discovery.
>> - https://lore.kernel.org/lkml/20261006-qcom_uefisecapp_migrate_qcomtee-v4-0-bf1c8e2a64ab@oss.qualcomm.com/
>>
>> Tested on Glymur-crd target with tpm2-tools utility.
>>
>> Validations:
>> - Get capabilities
>> - Random number generator
>> - RSA key creation, encryption and decryption.
>>
>> Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
>> ---
>> Changes in v3:
>> - Merge tpm_qcom.h into tpm_qcom.c(Amir comments)
>> - Update return values of functions and drop certain error prints.
>> - Define locality_arg as default value.
>> - Add Jarrko's tag on all but drop from 2/3 as significant changes done.
> 
> I get this because I have hard time to write "catppuccin" correctly ;-)

Lol, so sorry for typo!
It took me sometime still to figure out where i caused the typo! :(

-- 
Regards
Kuldeep

