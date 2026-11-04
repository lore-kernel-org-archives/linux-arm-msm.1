Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793773433;
	b=43hunH83ypgZXb16jDXhC3r/MsS8PJdsHkfjiWzUdK0UOUxYVPumEJswGNvFnoK9w3PH
	 7qymEMxszIQatvIBAz9Hvhpi8mUfnDBvqS+LeYpZsGv6uMi7utAAgj8Ygox4zkWeeuqWb
	 q6XX2qRTez4ClnuiCAGkVc0NfzDEu+EInV6+x6MPem+PaLcM7LOWj3sKqd5oGlNYJ2jIQ
	 4wq37R0OPcIaMZsU0gsSV1wPy9lG7HGDB8ItsEs0z8g+f0Iif4vQkfKnwFP4ng8idhyYK
	 QMHPuyuiLlcHfR3L3w/UPq4T7gAbvOfSpC2bNKdG9qU0CCAx8cLSja8O6rt+d+GY8HA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793773433;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9z1Cgsk3lU7f7dR+nh0qd74TT+O1Y7WwmYdX9pHO63E=;
	b=tCMiWlfxG+lIVly5zUe8PEYJsLXHDpEkGW1Yx3lfVD358NU0UjcTtPuDqe/28RZO1Uyp
	 bia9RWKZnjo/6Nv/A0S/Prot7zl+2jE8C/8LGyBNJ1rl3c5wC+Tj+HuNEkB+9/CXmDmhr
	 P9FV9Ujgvay5cqu4GSA2UF+u+CDEYuZF1mFW2qU/oFLH4qyhsGqmusJ7XWCKp8t0OE5FL
	 lBY8YBqGQeCxzzmTzo6sZtjEMh0KyPkUc6Mk4yxowxQy5AtJOgPpH9SqR5qjphm6i9YKI
	 CZzFWGSsRv+jGAcKQemL/Xso4MUwm9W8WwJXFb9ikQomU3x4TYQnrYsF8wu+9MBBIUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MEQWRbXb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="U/bwCxpc";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 182FF606A31B
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2026 06:23:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 182FF606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MEQWRbXb;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U/bwCxpc
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A43OrI3267289
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Nov 2026 06:23:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9z1Cgsk3lU7f7dR+nh0qd74TT+O1Y7WwmYdX9pHO63E=; b=MEQWRbXbwv+IRRUD
	WgqUhcBaeDD4k2UrLc87S+HEkqublScBLvBhGbYsKD81GViUojefYFJ8+CB6/ehf
	bRUS/0nguVXS8KvA0EfAf7jc9IsUBLzbb9SY1CnaGrVpVCZjvucS8A7+NxG1xelP
	IF1+y3ivfxocdfChRnGr5TluXO9GTD78SAbKUMixleUb7KT4CwL0+7TOE4w0VckS
	KN09nKxb2fdnMFtMgjuuZekTPZQdgsu0y+n9p6Z1yW4qnI7R1hc/F2mowQwHqhkC
	Sm+u0aKIt6T6BR89erHciuVgmFxKbVKIwIS8bzOXHGHkm3wH7GcG9ZI4kdz3rQ2O
	oeqJvg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqvsg8k36-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 06:23:52 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8a5971cf7ceso755790b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 22:23:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793773431; x=1794378231; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9z1Cgsk3lU7f7dR+nh0qd74TT+O1Y7WwmYdX9pHO63E=;
        b=U/bwCxpcW75/tI7fzF43QGKzUUYGx/b9vV4W4OPYm6CTVtjAg95KRAczVyHWOVIvXO
         yYBjU1sL7eJ8VRn2qgg2a+587xRfM7iliNqe6MDYy4iRDrdLe2G68ylGpelalDjOSA4C
         jBPdW4zkupkeHGd/vpZk5hdFiBmSwuCNNpkW9Dm70YaZQfFOz3UokL5jX8QLQKPgJwIo
         yXlZLNIRoTOmPoWAN1i4R1RZbeW/O2T9KiSoIWTJ0lT8prvKsGMoWjTmfnTGVu8ECXOv
         UlKhoj1hKGuQF62SkXaqinU1m/zanqqOZ9R1Alexy69VEGSuVCUtpeIwc02PLu0f9NjA
         VrtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793773431; x=1794378231;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9z1Cgsk3lU7f7dR+nh0qd74TT+O1Y7WwmYdX9pHO63E=;
        b=ZROJORztFORKJ8XgZgrIDKVrglLYgGmuTLo/rMxf558kK4BdiwPQ02CsolGwIG1xoK
         41hhnRwCDUYCIkNqGwVyLJUUi/Z6cx33f3F1kLJiJhfafPEVark6v1QWeUYWF4W7b3ZY
         Rl+YDkwWXksYytEn6zP2BZRoc/z6njTH4VYfEBwL4asa205FItheYJ8+ui9lRyVH60WJ
         NoqsNExJHElmN9aCZ/iM19T2W8r2qfIWXeQB1eSqtBT53aF099E3JYmQDxJgQbK5qxRf
         tdE9P+tI1bBTFAMXNTx8atWqPuCk2i1JNo3MJMQooFhbD6L9am53dgR6wbPQy3VNog0B
         wudQ==
X-Forwarded-Encrypted: i=1; AKwUvBxIqM/K87D6QFclnbP0xIugOcc4K/dp+sIFSldHSFh+G1y+CpoYSRJRLm8jg6yOMMvWsQ7RpfllppV2Tx7V@vger.kernel.org
X-Gm-Message-State: APuU4Z8u0coTN7Vd/JZFa4qUKiAXh/RffqJVrctIzrzR9w9AiQFGptbv
	NBV7D0/CTQCHkfg8skTOlKB6aUIOtfgjixmhqTi/FvJk8A3nB9g7zbTt0tx7ap+EanGe2DMVBM6
	+vby+5jHIboU8J1ccDKfER6k38nbIJJNpMuaYXtapUoMCGlT6GocQErSIDwpV1Fq9NMTN
X-Gm-Gg: AYBFou0TOST/eOOJCmkVasqJCRW9dTok4LsT3quaGt40Ka+wy/Bglgd3CDNve+xOPVH
	mqsrDG3vypqdf+duwYqJJ9laBoCVbxa360tlj0V4KCmTXFEECfGWsHRwwUXv1KS3Bp2Vd9Gf3KD
	xTX/lMfChVVvyE2Apgyb/1AOUEDZuESMLbqWYkKBNMb0j6cBrzvI72Zpy0MI7PP6Qw6GEvRPtSo
	xZpfSLFTyF4AAXoFyXaJWZWlFP4HxM4GzFtFeg82lgURANrEvuX9uqCydZtu+4V6YctRDY+91Ly
	TbYNKKMcfq2JSO+R0nUIHyqgYUTtMWk9zjcgpXWUtZN0advcXRFNpzjli6a4iU7/oZopRGhtNUz
	mWD/ZQp9q0TRqd1Vs3wzPhZNbe22MA/YHDlJ6ZJfJNG6gSP+ECMoXmIHR6I/WnR0vSZhLXGxPfK
	UqtIbu+fARIB50LyWI3ohbEfAc8kpEQIk9mxSZwgdWPFUmCYuzor+faE1k1Dp/ks6t9j/ah4E=
X-Received: by 2002:a05:6a00:181d:b0:89d:7d72:3433 with SMTP id d2e1a72fcca58-8a9bd9d701cmr12728107b3a.21.1793773430861;
        Tue, 03 Nov 2026 22:23:50 -0800 (PST)
X-Received: by 2002:a05:6a00:181d:b0:89d:7d72:3433 with SMTP id d2e1a72fcca58-8a9bd9d701cmr12728095b3a.21.1793773430324;
        Tue, 03 Nov 2026 22:23:50 -0800 (PST)
Received: from hu-sivagupt-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b09a7cc077sm451270b3a.15.2026.11.03.22.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 22:23:49 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3] mailbox: qcom-cpucp: read mbox hardware register
 using readq()
From: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <d4c11aa2-637f-4936-91d5-81b9d00aff0f@oss.qualcomm.com>
References: <20260928052940.688105-1-sivansh.gupta@oss.qualcomm.com>
 <989045f1-c4c3-4871-92b5-dc9f2a18f801@oss.qualcomm.com>
 <179189473286.2132802.7434637844183959510.b4-reply@b4>
 <d4c11aa2-637f-4936-91d5-81b9d00aff0f@oss.qualcomm.com>
Date: Wed, 04 Nov 2026 11:53:46 +0530
Message-Id: <179377342626.494575.14471451763190105361.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793773427; l=2999;
 i=sivansh.gupta@oss.qualcomm.com; s=20261009; h=from:subject:message-id;
 bh=MIypmwlEgeTHx156Ttj650SBzehWo+FsEOV2l9BHcvE=;
 b=lTAo+0viCioR0U5xz3KCKjzBqiWC2flBwi+tn0eyPEvhGbSq1hq5y2fsUezkYNslmmg87mHfs
 s1CZmC+M0SNAfvkrG+HSykkbS3lkFEnwJ3W4I4Xr+0YZyypByUua3Ji
X-Developer-Key: i=sivansh.gupta@oss.qualcomm.com; a=ed25519;
 pk=FlECOaX69DTzzKU8Gkt1zsAy0qNbAjbWuX+HULfCv/Q=
X-Authority-Analysis: v=2.4 cv=GtnXaU1C c=1 sm=1 tr=0 ts=6aeacf78 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9isR7G0gReAuNv6Rn6sA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: 874t0YVQa1tNUvzdLiEu4SdyjNnnkqtR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAyNSBTYWx0ZWRfX1uY9Xd6oU/PW
 pyjcNLU3KVoEAtmmzlJPz6p+OliZCnn8u7adBYkXShHcDTtIhe7lMhk2zwKAsb6Dc5BA7YhKUlh
 JX65u4bsHoXrzKqlq9C9ZVCUlql7kFiXOYWnfhlweo91BxNpdeNebDBUNR2jar2ZsOHg1wcKeuY
 ljBKOfW8E/TvQ34KMHylUBQxhZSBfw/YUnPYT+PIrCt1094b10o3+X2qUvmfKlrcNa151YWp2Ke
 Vc+/NCRJggPHXm7zL8ba7Zf6A2yUJoN5AC7X82mLoWiVWhmkRKlA+YAmPbFX7WbtLLhaEcWbTl8
 FTTBaseWN8+m68EutESSmvBOBvuvTjC9I8fI+eiOSYy5LR2KWKtOpBWxL697BQLL6uHNTEc2Ow+
 DUS6HU5SHv5H3kEAWp+rx49vRiO2zNvpyfpFqig6M0UNDGOZVkp3y8p6wv+lu1KdXshRBNrWK9d
 cykITFSJi8BU9BljLRw==
X-Proofpoint-GUID: 874t0YVQa1tNUvzdLiEu4SdyjNnnkqtR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAyNSBTYWx0ZWRfX8oiPzw6SULgZ
 h7IiCb/Nq/fb98Di5RPB8HEq6Z+0wtlj3gG0CetWdZ2WRrmH31qIxrlj+jivvp61W0jQX5cNZlq
 D3bnVUZ8BRKmOXE0OpgObyIcUZ5Cz4E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040025

On 2026-11-02 16:56 +0100, Konrad Dybcio wrote:
> On 10/13/26 2:32 PM, Sivansh Gupta wrote:
> > On 2026-09-30 11:55 +0200, Konrad Dybcio wrote:
> >> On 9/28/26 7:29 AM, Sivansh Gupta wrote:
> >>> Mailbox hardware registers are 64 bit wide, but the interrupt handler
> >>> currently reads only 32 bits with readl() at offset 0x4 (upper 32
> >>> bits). This returns an incorrect value, while reading using readq()
> >>> returns the expected value.
> >>>
> >>> Use readq() to access the 64 bit register and pass the expected value
> >>> to the mailbox client.
> >>>
> >>> Fixes: 0e2a9a03106c ("mailbox: Add support for QTI CPUCP mailbox controller")
> >>> Signed-off-by: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
> >>> ---
> >>> v3:
> >>> - Removed references to an out of tree driver to focus on the incorrect
> >>>   value returned by readl()
> >>>   https://lore.kernel.org/all/93ce8588-7500-45da-9b9a-424c202590cf@oss.qualcomm.com/#t
> >>>
> >>> v2:
> >>> - Expanded the commit message to explain why this change is required.
> >>>
> >>>  drivers/mailbox/qcom-cpucp-mbox.c | 2 +-
> >>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/mailbox/qcom-cpucp-mbox.c b/drivers/mailbox/qcom-cpucp-mbox.c
> >>> index 862e45e8fbd5..0b584d9aad6c 100644
> >>> --- a/drivers/mailbox/qcom-cpucp-mbox.c
> >>> +++ b/drivers/mailbox/qcom-cpucp-mbox.c
> >>> @@ -61,7 +61,7 @@ static irqreturn_t qcom_cpucp_mbox_irq_fn(int irq, void *data)
> >>>  	status = readq(cpucp->rx_base + APSS_CPUCP_RX_MBOX_STAT);
> >>>  
> >>>  	for_each_set_bit(i, (unsigned long *)&status, cpucp->mbox.num_chans) {
> >>> -		u32 val = readl(cpucp->rx_base + APSS_CPUCP_RX_MBOX_CMD(i) + APSS_CPUCP_MBOX_CMD_OFF);
> >>
> >> This still retains the writel() later on
> > 
> > This is intentional, currently the existing mbox client(s) assume 32 bits
> > writes instead of 64 bits, changing to 64 bits here would require all
> > mbox clients to be updated to send 64 bits.
> > Currently there is only 1 upstream client (arm_scmi).
> > 
> >>> +		u64 val = readq(cpucp->rx_base + APSS_CPUCP_RX_MBOX_CMD(i));
> >>
> >> This will alter the indices of the mailbox channels, but it's ""fine""
> >> because it's always zero for the existing platforms..
> >>
> >> Konrad
> > 
> > I am unsure what you mean here. The channel registers are spaced 8 bytes
> > apart. In the old code, we used to read each channel's upper 32 bits
> > (channel base + 4 bytes), in the new code we will be reading the entire
> > 8 bytes.
> > If this is not what you meant, please let me know!
> 
> You're right, please remove the leftover define

Hey, APSS_CPUCP_MBOX_CMD_OFF is intentionally used in 
qcom_cpucp_mbox_send_data  as it is still using writel instead of writeq, 
as we discussed.

Also, I have since learned that this patch has already been picked up!

Cheers, Sivansh

> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad
> 
> 


