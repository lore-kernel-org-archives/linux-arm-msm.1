Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793624592;
	b=q6AN/bYIpEZsSDn2EC6b7vsW348UzvcPbvFYSqUImM5BhPqgyYOrHzcTF7NbWifMuad+
	 TxopVPhq30s7JtYG0q/nTKlk+RE04l58lTUNdUDMi3Nz1WbVwMtuQ94981NIbCkTzNUyG
	 B8Rkx5nP59jby+VndIhTv0jOPvXX3x58IN6gWbsL/IlPyScD/eIsWBtILU4wkXUpnKzFe
	 GWEJ1bqjNv6aKUGRxjuxQYw5RxAJ8wVF6s0osUnVVqIY7GbJ+E+8A/6ZPufu802yWXiqh
	 EvwrsiAHVdy+15If6miMkMGeiWqiMMhhIyviEmv/mwBKTolvzs8JRycCKPTmwyuclww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793624592;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rwDvCUcycop1taBMmQpXpaVGTG1WRnAIuw6p85hHgWM=;
	b=r0EqHQweQTCFOPHlL/VFHxBKasQlu1gcJc96J2SyVcraZDUtJ4Xxkmb2VoskJdZmShN5
	 /GwijHIOHe+yYlmqfClZqG72W0aWRtQHY67bV0j2O1Yj46jV9O/aJQKfxPQeWvGX+VY9z
	 9eRcJN9LU3+pDkg/fs5XH3caU+qlXoGGXKus3zfXTobJjfn4Vka/atLzt8pV3CnIGzkLz
	 SiuGiXdlxe/cyNxg62HegWh5v/eLPsHP+/OA/F5gJQYuholkRYRH6aaAB7+tMaLqH5Oq+
	 Pou0V/WQLNeTjgX+uJWQoj38MGVbhBCb78EMmkBVvYYwb63y48FtDJ3HjdQHoCRnfAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YwYVjH4Z;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UzzdYjpy;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC3860A261D
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 13:03:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BC3860A261D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YwYVjH4Z;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UzzdYjpy
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2D0BlQ781655
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 13:03:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rwDvCUcycop1taBMmQpXpaVGTG1WRnAIuw6p85hHgWM=; b=YwYVjH4ZysaBu8l4
	1s0nZo+iGjK+TUj4pKtuAYIgm2/oTd9cAZnCEL4/aJ3SCEY/bVs/r34GqFyhhDtp
	kE+HM4nuJAUnHGyB1n0J6SXPgq3yzYIdLSmt/DkJ+T1gC3BQsG47UfIs3rTpJOM/
	5jAQL7jqFSR/0nSwD+nc1UirHLDAlQtXcr9FWk1GfPinRIlawK7MsGKhEwfmUKSA
	dAQdl2CwFaleNszRvUFQjup3/S7IZXIVMB32ZADWZkIdtm1tNMWBpVv7KNKXSm+C
	C/KpfRer8MJDWFk9C1SwR1VPXBBjMbiiFOBvmgiq/yB2NbTHWtqUEGocwvSR6aWE
	Q2ddTg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpqmvrvqc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 13:03:11 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5eab0ea26afso86473e0c.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 05:03:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793624590; x=1794229390; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rwDvCUcycop1taBMmQpXpaVGTG1WRnAIuw6p85hHgWM=;
        b=UzzdYjpyi8EQyQ8p+Wmj2QfEc5ejaMd7pDw56iYCFDciustdqBC4gi9eGVIzRmumwK
         LENot1NnvkBCTAhOFcnyr04eYJPnaAmt7CGIvESHeAfN0GB984qubQeDp3hYz7QED9ZZ
         ob3UQf1zFfwFoxofgwddyoRBFo1KJG8cKZVUmz2Byob2vpKFbBrFRzbbMw1ea0byHj8+
         FIMHi1dx0TkP9SEW0MWAyprhTq9AgNMllrnaYtHo7XpSujRIp6n+XkJVcRWX29jTOTr+
         3jIQ+TaWua9qI9emMsPfN9DI+O9IWDdS4urNkW2PJq+BSehgZ3S1VnQOUQnzhS4hs/O8
         8DfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793624590; x=1794229390;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rwDvCUcycop1taBMmQpXpaVGTG1WRnAIuw6p85hHgWM=;
        b=h0gm9LbR5EQBGFlJGGVct0JqVdt2Su2pRipgf2LfsHwQoFVMhBnEttFAVp7KjdakRA
         jMTvws49tBULo8ewWSmbbPE/h5UxIwhYgpRBFODB2XmX5jX3D+TIHwdCIY+VL8QVz2my
         dtDWB30tY54WuPl2yxDgfjeb5a5Z7JdLEq/+zWt8Fa2CL1bN88Q7oR7wBCLdQYCBrGRR
         e4vTBNSEjUayLQVs2fi0qW5NfDWaTtKEqqt8KNrDYyHF0N56SNXVu23MZS/OmN18BSfm
         A1afxquzI82CAOH3Y3r+HLPR0WtivQrCMn0j3fOdK74FL3wCUCEAHBLQ5iBopfjU9E2U
         DWZQ==
X-Forwarded-Encrypted: i=1; AKwUvBxD5VOxVUIe/qdixe3PARxdBGPxLzsKlh3C286YXKM8q0FHFdtGnOmGO8mpNZDclWHVnXhRPqgcwaHKS8yl@vger.kernel.org
X-Gm-Message-State: APuU4Z9BJNAm1UE/YfoUhVEeDZ5tVGQtEvO7mTLCS0uFBoCd/Do/ueGC
	2ITUuc5jXUhIPjItJ3hzIy7nBKzFTBWedkWlyRWijrcp/JQYip/b0P7i1TO2dNtsu3zkEUwb9Tc
	gix4oW+f+94hbMmksU5LGMZtXgu5+IItB/pqgzN52SETaYx0X/AfLej7kQzDKp9i8k09e
X-Gm-Gg: AYBFou1Qf524/PlbbcA9FL6tsBb2W+KErVIj/mxggHS8udlKEq47Ys/F/XcSoJcZ/Hw
	5i669pr0sOpKyvHCIU0ZXKyzbtxSX9vNyj/eYsBuUOw8Lmf7/fxKPGoePvRroaYLZzh1jZy7Nj+
	p7xRLPApMW+kvvP3tq+GqU2ddljq5VZSVJyeuVgnbDzssrpsiIK0mLhawmDRpP86Wq2zzPzLjU2
	5G4Ba/fR+DXQDEviN1PM41s/hmIvfHrNNTKiXJ8Ay8K342FJ/Z76K5M6JSkgBQWHENUF/EKxf43
	BlKXEkXxYOsQDDZwwN/8+5DRBps4GT5WYinR5WT2gIZ7CSFigNLyeIajtQY0FLeIFjQYn45FfVM
	br5apfzbpp4D/gplB0RvLU0voHZfHFqb6Y7PEi4mTgkHEBDW62VWx4LY6O4AkkQ1MFSbjpoQ=
X-Received: by 2002:ac5:c7c6:0:b0:5ea:d67f:fd39 with SMTP id 71dfb90a1353d-5ec68998269mr4388749e0c.5.1793624590376;
        Mon, 02 Nov 2026 05:03:10 -0800 (PST)
X-Received: by 2002:ac5:c7c6:0:b0:5ea:d67f:fd39 with SMTP id 71dfb90a1353d-5ec68998269mr4388694e0c.5.1793624589652;
        Mon, 02 Nov 2026 05:03:09 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe072d19csm1698389e87.40.2026.11.02.05.03.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 05:03:08 -0800 (PST)
Message-ID: <14d63775-3024-47fa-a495-60351c31e6eb@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 14:03:03 +0100
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
Subject: Re: [PATCH RFC v2 09/14] drm/msm: initialize LPAC ring
To: Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org
References: <20261029-descriptive-name-lpac-upstream-v2-0-a21a5c850961@gmail.com>
 <20261029-descriptive-name-lpac-upstream-v2-9-a21a5c850961@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261029-descriptive-name-lpac-upstream-v2-9-a21a5c850961@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=TMDQ2Fla c=1 sm=1 tr=0 ts=6ae88a0f cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=pGLkceISAAAA:8 a=km2EZEuaMOR48S9SEsUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-GUID: Fq9CDtyjc6l3x2HfdUpUO5ucpaIURMmq
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1MSBTYWx0ZWRfX8i41nzYkbB+Z
 geV1AmwGvnA0TaYGNxIrCbfG/7uBF2Ar16DuP+wAIJLzLbC87bavHDL6eTA4PaZENWEPVYh+Fl4
 44/dg54kc4LAJ3+NxQ1p91nm4QwvP6k=
X-Proofpoint-ORIG-GUID: Fq9CDtyjc6l3x2HfdUpUO5ucpaIURMmq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1MSBTYWx0ZWRfX9KH7sUcMOf3o
 2Rsd7Eb48N515g+uBenJwGCj1drqABAfKxNcJR+D+ias1HhM0hzcxTVYiACk4dEGiwJU/X/V41W
 +MLZgF/GhPYG56axWB3+5wpJBwZGmJlS4l9bIKV1V5wBxs9IN7L/CtCtRf6JI/A90vj7H3neS97
 RigdEos2BzjdMNV5opnQjkrZQH4wTI07KnCcZORQu5sraZYZ6BUKLKtrBrIiY6tQlNcOzXLpc7V
 FkY+vYGM7SJ8k97i9mtgRKwIzrcf4iQBjWdrqbJEA+1G/+ZlReZ0/7Eu7N6q0tJWhTJ9+rfNvlK
 adSKIUzK7FDVQD/xfi2jEMrT2jMtt0fZvQwFE+qgVqZoyB40ZaTZZbpnLVdL7FsRvEx2SPD4j2O
 SepYQAJFQqU46uvE0r+WRMmxyq3LQ22+2GcKrUpXI6axmg1G4uGMM2VaJwodUnmS3Lu1aNYZ4Zw
 KqVcwOB1rzwUbzgCEDA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-11-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 phishscore=0 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020051

On 10/29/26 2:52 PM, Anna Maniscalco wrote:
> Program all the register needed to start up LPAC and send initialization
> sequence.
> 
> Additionally, now that the LPAC ring is live, make the code aware of it.
> 
> Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
> ---

[...]

> +	/* *Don't* send a power up reg list for concurrent binning (TODO) */

Here's what my robot came up with

human tldr: missing the listed registers from a750_ifpc_reglist_regs[]
and a7xx_pwrup_reglist_regs[]

LLM:

The strongest IFPC-specific suspect is that LPAC setup is not
fully restored after IFPC. The series enables LPAC on gen70900
(Adreno 750), which already has ADRENO_QUIRK_IFPC. When LPAC is active,
patch 09 programs several GX registers in hw_init(), but adds only
CP_LPAC_PROTECT_CNTL to the A750 IFPC restore list.

The missing registers are:
- UCHE_DEBUG_CNTL_1 (bit 30)
- CP_LPAC_CHICKEN_DBG
- SP_CHICKEN_BITS_2
- SP_LPAC_CHICKEN_BITS_2

A likely fix is to include those LPAC registers in the A750 IFPC
restore list and the applicable general power-up list, so their
initialized values survive collapse. The KGSL code in this checkout
has a similar pattern: it conditionally adds LPAC chicken-bit registers
to the Gen7 IFPC list when LPAC is enabled (adreno_gen7.c:652–660).

Konrad
