Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72C2F35C6B4
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 06:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787294243; cv=none; b=tg82bXJ2G63vsbtXbuUcwkJu7nYHVS4M2EmBkQNwVWjSbw4JBGMS9SLXz+Qfxwg3uTKOjaKgWVNZdcL3dsTKdGuReqPbgPZ9738cbMzVGfr4GfrtTi7GWdgIy0Z7Zjs6CCayvoM0/n4LcE7itCkViSwAbii5beS+EqewsOz+g9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787294243; c=relaxed/simple;
	bh=wZESmlO1iV9+RROarN0x22kTh8ptZYURyvi6PCt59j0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fs84u7zFsjSe5lBmXfpuq454OTd8mhILhVlD4IWU6BWNj0Y0qGITm6gCeZKgB3ae7YtT10942Pr0nWhn6ZyAQaw/35Cgj3kZ2saLWe2YftyQWQpOz3TODBkRLil9PnwqcROH4RxRUb2vYmBIObD9JCZXRxpDu12ohEObEhIhD/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q3YD7rns; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YklM1pnT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q3YD7rns";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YklM1pnT"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67L5Tlhs1478282
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 06:37:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jeMD6AU6ZvwajZgFqFJf4kwShgYfauyoktGJjtsSb7g=; b=Q3YD7rnsnFbyCJPu
	iWlkl0GaFy0BPttRtkcKgOGuPUWE7rEBw4AhHkLD2uxDw+QpPsgXt65n8y5j+PjH
	kytzknZW0n8n1lomLgdpUWM+NKm3dAWhLRKYq5hLTkwATyTGsgFV6Ki32bGWLxmw
	8weHu5gCDR3B27BN2zgMO0/GIwgXr8rsgFdGym1MGJIpLw/EeeRc9wJI4hAU6nRP
	YRRGGRxwdeGNiotN+46z6Ykw7DZVGwXfOMX+gOmLBmCa+sM6ChMaGuBs7bMyj3h5
	J+WJJzuCxwLHc2uj3y5DE36Op9f6FcXbH9DdXwY1Z2kDe8ey6VnB7rFWweqtl96z
	1WyIAQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6gddg7td-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 06:37:20 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cc7e86e7c5so12086965ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 23:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787294239; x=1787899039; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jeMD6AU6ZvwajZgFqFJf4kwShgYfauyoktGJjtsSb7g=;
        b=YklM1pnT/I2EQ/UTmlzsxV3MKnd2KMq0C6U22R6JAx3QWEl0dd0DHC6Rps1HFgimFt
         jxKE1ZU8m9oiy/QwpgnIvTDoFT2oKHY6nf2S9myGO2o27GIyaiDAImstGqwW/qX7wPKr
         TvmPC8rWkniLIQ/SsR9+NTyRn05dszSr4gOqbuDewjK958uizZWskanbTRNNGm6y75c7
         PSBX67UvH310xgQXSzAlO3D6z3vqys15yZlR8kS6oD+KwSLxXBeDjxY22xWhTDvcF+Fm
         l3yMnTlPBjSnzyWC3jL+eeTmz1vTKhUpSKgV8u74sni4ywikuxkKZFhzLk1jbIhQ8EXn
         CPHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787294239; x=1787899039;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jeMD6AU6ZvwajZgFqFJf4kwShgYfauyoktGJjtsSb7g=;
        b=MmkVcsDS7nxfE/cHqrHOHoq10pyniNT4OKtIpMfp/DqGpZxVIZGY5yZpflq3RqUAj8
         pIXJ6ULBaJ2+gVy7Fe+GaEmNA94frh2tkZ4sWqK+oz28s4BxX6PlSmuqTDJaePTNx/mh
         mAgikjVMbYIAE+LPeJCPJIjjITlfcqBEikD46ZtmK3i2bXFv/2fPPlEyHXD5ne72M4Z2
         8+spRFoIVCdeWaFfpxPXyFqrKtOqAXUzM1OgkhbXxUD938cQp952nppjwX5sENJ7sRif
         OujHUmMmKsq78dRwoXjTCPG2Fl0ub/RPZgf/8hrhNTJLIGCfZvLu5pKUM/bUpmj5nPGV
         0gIw==
X-Gm-Message-State: AOJu0YxkQh/Qg9eK2WwnwyHAsRDkJANKpjnRzjxsaNIxZMtFAJXecQso
	Y09ZkXlojYGK2yk8zQfMyE7prVwNi2Pj7oxhvFpW4MtEkgLFTj7N7JqQeN8NUVWKEQIMy0Axzel
	kHCZuUsvaVnizKGWNgOCekciRi/9N6W88dC1VdX4vYJ2drjRykCUdrfs4It0vsxoOCJnz
X-Gm-Gg: AR+sD13CqdKxAEzEGO0TlejGdH59cViJ5equUhY7w57pIze0yqzPVuaKJe8Fr9GakhC
	TZF5UBYjjrYYkJf7Nx567X9AcQfTg2N8cxqGIT93o24UiucMkWijfyM7TaHBxomldYYtj2IShJG
	JYXQ6LM/2P72drf6D4ZLuJrPk0irjqr4QQiTZTWNYnpS+h6kwXEbDlqBgDH6GgccL37opA+636w
	sLt0v/a9OUOFcJMFVUKpEbDmGzYHSCr0fCgRe7TyPNkF7hKdRekyqX43b7WyIXH6VWrKKuxWP3Z
	OXtDnQJkYPAvTk+7VAnMNhTwCwMLg/GYKlm7hDrc4NmykyWMSol1YufOLuB5GKqMdsgBVFyxnrl
	wolBzkln+nD3e/lo2q3GhXAjq7NT4hWRQ
X-Received: by 2002:a05:6a21:7482:b0:3bf:6237:4d3f with SMTP id adf61e73a8af0-3cd300c14b3mr8395187637.18.1787294239277;
        Thu, 20 Aug 2026 23:37:19 -0700 (PDT)
X-Received: by 2002:a05:6a21:7482:b0:3bf:6237:4d3f with SMTP id adf61e73a8af0-3cd300c14b3mr8395103637.18.1787294238790;
        Thu, 20 Aug 2026 23:37:18 -0700 (PDT)
Received: from [10.218.4.101] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc15b1074a8sm2243243a12.28.2026.08.20.23.37.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 23:37:18 -0700 (PDT)
Message-ID: <429f7d23-0cad-406a-95f3-916fdccc15c2@oss.qualcomm.com>
Date: Fri, 21 Aug 2026 12:07:14 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] soc: qcom: geni-se: Fix write to read-only
 firmware buffer
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
References: <20260820-fix-write-to-read-only-firmware-buffer-v2-0-7badcdc455fe@oss.qualcomm.com>
 <20260820-fix-write-to-read-only-firmware-buffer-v2-4-7badcdc455fe@oss.qualcomm.com>
 <87650994-df88-45b1-9793-038af024d27e@oss.qualcomm.com>
Content-Language: en-US
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
In-Reply-To: <87650994-df88-45b1-9793-038af024d27e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDA0NiBTYWx0ZWRfX0b30vHnUE4Ez
 Ru827FWd51OdzzCsr1Hn6FNsQZb9cz4hxsNuhU68+i136zhDQ9Rhvjg72N4QZWpfB0yE42CVE1L
 Uss+pzemHkDgRz/AclghQIaocS221dY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDA0NiBTYWx0ZWRfX83keirCs1ot1
 LctumUoeHibmvDRNy88BXWuqsO/bJaeAP/D5bQ187kjOST4IKXQFvvLl/HncZRQbVwO0hLFtZSA
 KmYBSavv9a+Vc8aYWgcDtj1Fiohpsmer2Uz/Wbrua1q3yjFhiX1LNTRPy2wFvcXTnKhTnSDYnId
 /W82GVdiPJlKWCc1258VG2lGbqJuaYcqEdqzTM/K4qE7LxdvBJuuBI5gCUOSYcOb72NvUb0QeSw
 2QJmNp4twjjAut5BhoaC/gDpvYW+UqhZHc5cR5U8VvL6emSOeny5iSd8VKehq6h+6dZ/FMvn0IT
 inpFAIA6yItVHvIqF3Yg00jkGTf0Zgp1eMrvn3DwKORUR/fB4hMlCe2OzoYpqw4tXYrYEqPyyMM
 /rBwlxxr9hDi7jKpRkQ7Cq112xZ7ZRAX08J1iKhHhrUF7uiVIIzI6bBkNgsrDBMry6vd+Qv8aXd
 RK9ESCrrzGazldjteYQ==
X-Authority-Analysis: v=2.4 cv=ApHeGu9P c=1 sm=1 tr=0 ts=6a87f220 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=RXRwoF4V8URbrJj5kzUA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: Uj4xvy6V3e2Gq1rEL2m_PtyMwK1vd2V8
X-Proofpoint-ORIG-GUID: Uj4xvy6V3e2Gq1rEL2m_PtyMwK1vd2V8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_02,2026-08-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210046



On 8/20/2026 8:17 PM, Konrad Dybcio wrote:
> On 8/20/26 4:31 PM, Viken Dadhaniya wrote:
>> geni_find_protocol_fw() casts fw->data to a non-const struct se_fw_hdr
>> pointer and writes back the rounded-up fw_size value:
>>
>>         sefw->fw_size_in_items = cpu_to_le16(fw_size);
>>
>> The firmware subsystem maps the firmware blob read-only. Writing through
>> the cast pointer causes a level-3 permission fault on AArch64 and
>> crashes the kernel during driver probe.
>>
>> The write-back is no longer necessary: the previous commit propagates
> 
> "the previous commit" is discouraged because it's not guaranteed they
> land together
> 

Updated in v3.

>> the rounded size to the caller via fw_size_out. Remove the write-back
>> and make sefw (and the hdr pointer in the caller) const-correct.
>>
>> Fixes: d4bf06592ad6 ("soc: qcom: geni-se: Add support to load QUP SE Firmware via Linux subsystem")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
>> ---
> 
> apart from that:
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad

