Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A56F33750DB
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 14:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787237272; cv=none; b=sPQHID6JtUBCh9bBMrucHDUsjNMTQvbPbD+K9Qunkci456Dtsy8CCwWnPzWBXX9RGIj3TeCoxDikIptopX7qVdK3Xxu9cE+MwYw4MEfMOfulgcIL9jyS7tJ9Pa4A/C/BYBB2rRRpZafzCI77c9HXPF2NaMw8BVL9f98j5W0qCXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787237272; c=relaxed/simple;
	bh=qIVQNmetZ+9Je80JhKTUBN/bhZyc0umpRAFBQGCaHVE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UQTmZhK3pVPl9tmw4KYIzZr9oIQAs2mms0T75oEp5pWpoSzog+ID8R+Cl4RYWm5uTa3jn1IQlpstUevShbR4GFODU4QBPvu5FV2HGG0MpVA+GNpugC8EVKzgT24vuNSYrZCczTLMJ1cthygTvhYJMBhEbr7YoEHEm0YKNukgAZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dN4hVNRq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YVFMFZxo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dN4hVNRq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YVFMFZxo"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67KE7jLT3650471
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 14:47:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XkA5jKWJFPeAwLC7LOJ512QuTujwvvBJ6DDWfb5DnVU=; b=dN4hVNRqec/PQpy4
	7L0NoWIJ0JbZCd8Yi+gSH5Ju6Qbiz7IXjY2czlkv3viRipvnpEHNRCyijT0MY7bF
	MXlFsZKJ080KCQW5Vap7jv6NarqbPartTA6o8nz+daKxcTnhhqKaROxeOioc6a35
	Iveu1m5rmbZXybof22ZN5yP6j9vQ648WZqrNVgweyy1vKwRzVxLAu932ocIivN0M
	y2NUmExpDLdu2LDwMIXIRtQ98twGfF+V5KCeUyMU9pCXuPln3c9BUJnVbi/et6O+
	C5A4x4LQ03kvlFr/t8eUebFn7I49phP9Rl/EJaf64X7h43/FADLER7I5R8sajkOd
	jGCOXA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5w499syn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 14:47:49 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7530aaa7212so104929137.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 07:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787237268; x=1787842068; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XkA5jKWJFPeAwLC7LOJ512QuTujwvvBJ6DDWfb5DnVU=;
        b=YVFMFZxoU0EciQ9GN67W/NaZ7QgwkCwgdYN/JEVIcb2Cbf5aGdb/b/ppgzSwZ/lD+b
         aybdn5DPAii+i0l+B47Q92C/IiSWa97YmESsoxeprq67NrCwWR+3yVG7kvSsk/CeynVe
         E6D/dJkjXScoHgPbeVRaF773K8ikDMA8UfdoE3IEGD+4MtPFqEneifkBL+WKqDzfSoaC
         JTykqAjYpfQavrhfasmjAp8VW6JWsn+R+yDgN/VWKFoBFLQbQFCH0MZi6sL5mwYkmceG
         iRAK78VDImkcjbZYg5wBNqp1FlujstfJ0Zt0b4Up57paYhCCyKKY/YiSXSHexcLn9Jz4
         mhCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787237268; x=1787842068;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XkA5jKWJFPeAwLC7LOJ512QuTujwvvBJ6DDWfb5DnVU=;
        b=ikKzgci8qQLJ10X5mGVQSHbSBbZCZqUpe8JFFoPCIolJRMRmt/JX6hwdCndhIhKQ8D
         9DLNgOI+6qV0D5puXvefaHsbcHaoeabrRXrFCndgF/sKCHzvqenN6AY+dos1csx1rjVb
         rEjCrqWyaVeeLOqSmDUjKQwxvued+u+MJIX/SkcmJRXlAGuBbgW8S+GQxQpJLNdBOJk1
         KQPc9CBUE6rCML+12nSSIDbsgiibf27Tn2PPa4paXf59CmmmEQ5/kGA4ELXqSdlMXrkQ
         toU5SD2UnEK1PiA5wtRg3+QuKejQ0k6A4av8Iee8OzOUV+bkGf6w33lzGSb8EswMeveH
         ZnVQ==
X-Gm-Message-State: AOJu0YyaApDTwwy1HlFTtJlrmi3uUXmVuZYPm5ZdDQD46qJF7pbqVFC2
	dGkSDC4Xk9aXEkkcGDy6Oh9VwczP4ttf34OeSbArX1BWBmZCrnRNB50/Gao9WM49XQxCWMMRcYh
	DuIGRdKIb17dTD/2tjNhDlLnlP0sScORcFhHW6WO3sL2RuHF19R0D9a2bv6Lxq9UVo9+y8oiTxc
	D1
X-Gm-Gg: AR+sD11azZGYhrLB3Kcz2SXYNcP/PtQorRhzW1rMKYTgnmPuL0oALXISZxD6jG5+2WR
	9Uaw3OUNV5QLxKWW+ash96mWED8R2feIY8pwaS7sVcFLR+alc9BYOxvXRclpOyx0af1FVQ1WvNt
	fQZAmKPf+dckk5NzbNIBssbGMJlS+cRUw9lr5868hbSQ2xWsLgnPt51HG4eN2cH/w19lJ1Vd3uW
	gSqzOClTS+3fEfJtn/6wrogG596A779gCwDmpnl3CCpSwZzRm+UORdq7Kl6yx0lQkFKYiIQsC1i
	FHAL0h6BiiohQhSbJttc739FPyBMyRwzUXoQj5EIl8L4hfUUetmC4a5lu6Mj1Vij/xVxDPbDbTA
	roE7XpwuKmRn7VUVUTJipUBtj
X-Received: by 2002:a05:6102:404:b0:778:30ee:f44a with SMTP id ada2fe7eead31-77830eef735mr1453136137.0.1787237268342;
        Thu, 20 Aug 2026 07:47:48 -0700 (PDT)
X-Received: by 2002:a05:6102:404:b0:778:30ee:f44a with SMTP id ada2fe7eead31-77830eef735mr1453123137.0.1787237267726;
        Thu, 20 Aug 2026 07:47:47 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b478854400sm1327959e87.6.2026.08.20.07.47.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 07:47:46 -0700 (PDT)
Message-ID: <87650994-df88-45b1-9793-038af024d27e@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 16:47:44 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] soc: qcom: geni-se: Fix write to read-only
 firmware buffer
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
References: <20260820-fix-write-to-read-only-firmware-buffer-v2-0-7badcdc455fe@oss.qualcomm.com>
 <20260820-fix-write-to-read-only-firmware-buffer-v2-4-7badcdc455fe@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260820-fix-write-to-read-only-firmware-buffer-v2-4-7badcdc455fe@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDExMSBTYWx0ZWRfX5S5MORA0QOaS
 pfZgJ8Xs3NCugi4cUr5FNvqE6aQH+9Z/4BiBdK9KypQLhWGojAj9g9jjWXPRtx82TbOPiJ+9MNk
 bInMgGpbuvox14ulB0SvzDofSLzPxws=
X-Authority-Analysis: v=2.4 cv=YP+vDxGx c=1 sm=1 tr=0 ts=6a871395 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=u9qNNwF8Ye741BRZN9kA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: 7dQFUR0UB_rn5pjcxJAmMnyLLrEjQwQ4
X-Proofpoint-GUID: 7dQFUR0UB_rn5pjcxJAmMnyLLrEjQwQ4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDExMSBTYWx0ZWRfXwDYmpHWaHOHC
 kSQfNpsM2TJcOPd8r+J9QB8YLeCzFfeeNRVCMrBb4L2iITIPHc/9AbgtMJo19s+Nb542wpQPdDL
 TVwRKqJWu1jri1ogssNCDo3Fl/wpdXOIfKL8j3qDIxtZtBF1g7caUz81AuAWIsIHUtajhyIf93p
 HqlN4lwjCd4k46wT3XJf8D5LpAY3+mtQ2TgQ8dhWDZtaD9Lyhj3t8DGVZuppXfvSCx/GvuTKoTt
 TfcP3/FE0tN8v5YAbeucgl+FzJvUYG4bIaxT72GRpJN01Kkh3xvUqhpMQMJ8Sm+rC5ErPgn0sHV
 5kxArCpHWCbwgsir8e8uF2h+QGDjTH+PDqXnMlTyquYZMkig32AGtnCRxoJQhCBUzXUS1QXR0vJ
 QS52VNkuqY+CY7gYqFueKzipYCUsB2GX8Qgh9rhb2i5cqnG1bknEVUwduM4tzBdPrRAU++dJkcZ
 g0mlyFo6pMS+Pds2O/w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608200111

On 8/20/26 4:31 PM, Viken Dadhaniya wrote:
> geni_find_protocol_fw() casts fw->data to a non-const struct se_fw_hdr
> pointer and writes back the rounded-up fw_size value:
> 
>         sefw->fw_size_in_items = cpu_to_le16(fw_size);
> 
> The firmware subsystem maps the firmware blob read-only. Writing through
> the cast pointer causes a level-3 permission fault on AArch64 and
> crashes the kernel during driver probe.
> 
> The write-back is no longer necessary: the previous commit propagates

"the previous commit" is discouraged because it's not guaranteed they
land together

> the rounded size to the caller via fw_size_out. Remove the write-back
> and make sefw (and the hdr pointer in the caller) const-correct.
> 
> Fixes: d4bf06592ad6 ("soc: qcom: geni-se: Add support to load QUP SE Firmware via Linux subsystem")
> Cc: stable@vger.kernel.org
> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> ---

apart from that:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
