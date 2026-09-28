Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 515EB47AF68
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 08:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790585631; cv=none; b=VWmuQXetxjLjf73l+k6i9ZUjA0mhb24J0NEeZ047s2gW51rzBx4prieowNzlyBmjGIbIN3unHljf7O7uxQZAXBFKgDnta7Iu7VHEz0TdFMjOIy8gnBKEcAvqKwPK3FL8kxuz3+PJfvKCxp2G+JFZHemvj/ibkxRB6YtiVAOFojk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790585631; c=relaxed/simple;
	bh=F7U42UvQzWZFhuElxJY3mKvQI8WKyTugGwUqiN91t+Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JN0H+kpPwl8AhGjzOtzbu9t0LHw0Gxmg8xVisrLOVp964nCHJhMir26hcIS+hI3V4sPUFJe9v+gqwPldWuPguXDEWpiWcOa8xb5jKVhWwYzb8KM/b0t0Q1kEBr75MSIyCrW2+IXeWMi6v6WmnsG5HUI5mX9NiLcoHA26/7OUTz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ewoIFBj1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wnx7VlcG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ewoIFBj1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wnx7VlcG"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S7xZDM137172
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 08:53:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dFzPDIqo25LVzunszNk3v3FTUxTHzronweZdB6wdjOo=; b=ewoIFBj1T5TXjqnn
	lkx8AbSPk2gGJhe5irTuJE7BHvPLHJbrlbJrQx/1IJ4dLHfZS9ND1OMqtRSM2bkE
	yVakiWGp9QphCsCSlLlSJgJg7ws7uvAced/Ps59Pz6QgxzmANUf+EZtlXXSgzvk+
	qQqNQkYqH80seIpdknJJj3rv5tpGgFoiSbDrf2V/06Vww4vRFZK0QL0jB9FMH9lY
	4ibwuKTTWALmzvf1GE9M3Svga/k4UAeyil7sQzX+oWUGnhlhHYmZ2XYFRbAquQJ1
	GMZUvfp005hEoDnBpMVYou2KfG2J953g3dGWMyQ8YWpoUq8PAGCtgbVQlFWYELgq
	Jw+gyw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyebq1b29-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 08:53:49 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-398dcfabbf8so8358960a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 01:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790585629; x=1791190429; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dFzPDIqo25LVzunszNk3v3FTUxTHzronweZdB6wdjOo=;
        b=Wnx7VlcGRIsCARrx9DTucYPRees2a72EUVNjfZEUzgt7IxNoY3EkHrSQaG+jFu3zvc
         RarC6SYjADqIFZkWLWv3QyZ7ypAbrTDQkspdxJegnO6Dl7brsB+nNNlaOXh5quQeF+zl
         1fpS4RhIWsBXs4BOcjZcPDtUbtPp6+AqaaT1Y6qHrOJ+DJiBBG8Sazk4och7cQPyUEuh
         Q4cSYXmEXb7KoHfcFhU8dgOFvUTGlKZUXqhy3eM4rWuYLgB6mRJqr3unRvnn5KeRUrbm
         TpvPaYnc+W2Qyt3qO0kgI0PKswGcDoChhZWbLYHOm9jkh1isdx/XlL04S6rcbsS1S/tK
         QfKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790585629; x=1791190429;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dFzPDIqo25LVzunszNk3v3FTUxTHzronweZdB6wdjOo=;
        b=b1QM8kkJdBo8UMi4UQO6d/+k/LGgqWgiw30zIqSmMMj83QvKz9RnFNb3NbaOMKbi56
         95qYTU5fh34eBQrZ65U6cmvIRdVZQq8RvHJKhwxbuUP8q8yp82IkR0hqXGZXe5ZnUhbd
         NBDNmeoZiQN8EEPEFKKBPrSwwJyEo3waqqHw5jWeYfDUE9aNaEez5zzjWBioGRpVD8vz
         P8tGppTsLCjOuoH6Mum5Cg39OJZ/qG366FcO/9MaqB67UH4exHlv/zq8KGCC1AwiPmFA
         aZYjs/10XHMWTvZCCZK+a/rj8P+Gc1nrg8c3RL9Syq3J87wEpw7wW2jz+EgiJFAKaWf5
         9ygw==
X-Forwarded-Encrypted: i=1; AKwUvBwUYn9kKA9u2GESxb+rSTfWOYVu/gJLAwfBRQxylQtqR/po98OfiZ6c7fpmXdgwQKqTgHOerxPzFhef4QYH@vger.kernel.org
X-Gm-Message-State: AFq9FYK1/GM+QZdov7rNoJtAOf97gQbjNdM4AInWIzpUCvVK+Gh4DpJc
	hKyGql80Phizc9+5Qq8+FdGHdBfwJ5brNiQnOxsoj1FZbQ4SJuBrjTvE8ORsflni4SoqgLKVfy6
	lYOqDCY76Fd8vXdKKSI1Z6l5nBNmHS0fzIX/+QUSD5YM5+sxHczy+7pzF8UiJQv452kwh
X-Gm-Gg: AYBFou0RKuAzuns+X180nXLT039PSWgEBAP6x1ioyL9VvXcoDKGbzRKJDoMZCHvuKgT
	cN03lxBY/sZbt7ll6T2EMLjVABhYzlRez2TS7zslG7u/DGiUxJloucye8TLO/cYJeHuF9gvgajz
	EA6NJpVjxU9oQ/b1fgTXhFXGzu1z4aJ9Wiqmg/bA0KCISAG+W63fiUNK+q2SYbx9ExX0jKPe5kE
	8FenQwo2Pb2CdeJJzdYXC443j1Zkjq5XjdQzScaTZthSENiDatq5Lub4rDeXSsaInVm3+i0s0fD
	gXVecTS4lWr6Opll21QOLc0FxcyYZ77RzeR7HV7saNnj6Tw6R+v+uQ0/zyfd0YOpvtx7tEN7okM
	OcvOdnpg/butb4VdhK7T84fdg4fGKyA==
X-Received: by 2002:a17:90b:52cd:b0:39e:6c69:9b8b with SMTP id 98e67ed59e1d1-3a099231f90mr9701492a91.48.1790585628788;
        Mon, 28 Sep 2026 01:53:48 -0700 (PDT)
X-Received: by 2002:a17:90b:52cd:b0:39e:6c69:9b8b with SMTP id 98e67ed59e1d1-3a099231f90mr9701484a91.48.1790585628348;
        Mon, 28 Sep 2026 01:53:48 -0700 (PDT)
Received: from [10.218.31.125] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b898cabesm20093428a91.0.2026.09.28.01.53.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 01:53:47 -0700 (PDT)
Message-ID: <e550cf6a-f21d-44a5-abcc-a14ed290268c@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 14:23:42 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/6] Add TEE based client driver for UEFI Secure
 Application
To: Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Jens Wiklander <jens.wiklander@linaro.org>,
        Jens Wiklander <jens.wiklander@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@kernel.org>,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jarkko Sakkinen <jarkko@kernel.org>
Cc: Basant Kumar <basantk@qti.qualcomm.com>,
        Apurupa Pattapu <apurupa@qti.qualcomm.com>,
        Arun Kumar Neelakantam <aneelaka@qti.qualcomm.com>,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260722-qcom_uefisecapp_migrate_qcomtee-v2-0-b8a8fcbe4211@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20260722-qcom_uefisecapp_migrate_qcomtee-v2-0-b8a8fcbe4211@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: hg48d19es2UNr6eaVo50Bu-bm3gzE7Pb
X-Proofpoint-GUID: hg48d19es2UNr6eaVo50Bu-bm3gzE7Pb
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAzNSBTYWx0ZWRfX7pKNu5OX8LOg
 D84Y1oEsZ3TLJYU8VwZYNJNyxpg4BHHp1oIJ1iRP0xfgm78LuUFoIwTnD+lSpG/NXyBC2eqzl+X
 sDh1yN9d7K4RNH7oAPJCXhUCdnCL90g=
X-Authority-Analysis: v=2.4 cv=EqRHPicA c=1 sm=1 tr=0 ts=6aba2b1d cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=tyUXrCcEVTDm3v3Bg6kA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAzNSBTYWx0ZWRfX1HNGT9YGbW16
 ZtWcm+c3zXzYb/Ao109CP02R9ilt13DFnt5G9qCeH+TbsgmKNPw8UMWmztqrkVXtKHZjts1eNZd
 rouT4Bi9Snnp30tF22aqXmBlqWB4JlC+S6prQSVQIwlt4DlAe6OHe0o+ZvHPyjEFSS2BEd0ElPo
 /iZfhUowGU2Pckn86untYlbe936mZkIs9M5/Ov2jUcW1SaTtXAme/N2t+Dg1n0Kt3ressP1HgAG
 Zeg0rCkayPlqhZ2gnE3JSo/80aeWN2Ym0BCGMG9/+V7l+WhtEEz9wTZltRWQM6WsRZnK7au/3OU
 c6MLmoc7Ep5KM8Y0SsV9LwxGbEipcK85XNjG91m5EUkKr4tKSc5Obj9dvtnC7l1+i6QsjpwtYeu
 JJWAarT+A1H0q4AXFk8zvzoSvqKbgQMYHd9YCAM58DuAPnzDdFKY0FLEObUCCxXpeg84CYkU359
 VRHy26VVH2CsZ9tslmA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 phishscore=0 clxscore=1015 spamscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280035

On 22-07-2026 12:29, Harshal Dev wrote:
> On Qualcomm SoC based platforms, UEFI stores EFI variables within the
> Replay Protected Memory Block (RPMB) which is only accessible by the
> Qualcomm Trusted Execution Environment (QTEE).
> 
> For Qualcomm platforms without emulated RPMB support, specifically
> platforms where RPMB is not located within SPI-NOR storage and instead
> located on UFS/EMMC storage, non-volatile EFI variables can only be set via
> a callback request from the UEFI Secure Application to the RPMB service
> running in user-space (within the QTEE supplicant [1]).
> 
> Unlike the QCOM-TEE driver, the QSEECOM driver (used by the current
> QSEECOM based uefisecapp) does not support callback requests. And on
> certain Qualcomm platforms such as the RB3Gen2, attempts to access the
> QSEECOM interface fail due to lack of support within Qualcomm TEE.
> On these platforms, a TEE based uefisecapp client driver is required to:
> 1. Access cached & volatile EFI variables stored in uefisecapp's memory.
> 2. Ensure persistence of non-volatile EFI variables via writes through
> the RPMB service hosted in the QTEE supplicant.
> 
> This series introduces such a uefisecapp TEE client driver for the
> aforementioned Qualcomm platforms which installs efi-var operations _if_
> the QCOMTEE driver registers support for an object-IPC based uefisecapp
> service on the TEE bus during its probe. Only new QTEE firmware versions
> available at [2] provide this support.
> 
> Thus, QCOMTEE now maintains a static list of always-available object-IPC
> based secure services exposed by QTEE. These services are implemented either
> within the QTEE kernel or within a pre-loaded Trusted Application (TA)
> usually loaded by the bootloader. The uefisecapp TA is an example of a
> preloaded TA loaded by UEFI. A static list is required since QTEE does not
> yet expose any way to dynamically query and enumerate the services exposed by
> it.
> 
> To facilitate object-IPC interactions from the kernel-space, this
> series also introduces a tee_client_object_invoke_func() to allow
> invocation of TEE objects similar to the existing tee_client_invoke_func()
> API exported by the TEE subsystem which allows invocation of TEE functions.
> Some suporting changes are also introduced to track and handle operations
> for TEE contexts opened from the kernel-space in the back-end QCOM-TEE
> driver.
> 
> Finally and as previously mentioned, access to the object-IPC based uefisecapp
> service is restricted on older QTEE firmware versions. A new QTEE firmware
> release must be picked up from QArtifactory [2] for all upstream supported
> Qualcomm SoCs to enable access to uefisecapp service via the TEE client
> driver.
> 
> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>

+Jarkko too.

Hi Dmitry, Amirreza and Jens,
Can we have alignment on patches 1-5 of this series?
Please note, 1-5 are needed for tpm_qcom series[1] merger and since tpm
series is reviewed so checking if we can proceed with 1-5 atleast and
keep patch 6/6 discussion separate?

[1]
https://lore.kernel.org/lkml/20260907-tpm_qcom_driver-v2-0-71a6b1752da8@oss.qualcomm.com/

-- 
Regards
Kuldeep

