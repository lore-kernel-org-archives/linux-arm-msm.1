Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793683372;
	b=5YMN0BayueElzN31U3AmxktSXPz/3VHtqWyOHombqBUzWyIDhuXGimA3WDO/PMrMfE+t
	 zE8xXQdbyqMNgBpaxyLRGpoOFmbtUnSrLsh4oNrFJY68F/eQs2sqCABk529VV/XsHGvNw
	 2YwdLOIZE91yB2aT5R2A5QWXkcZ+dqauLjwak4IIqK4PGhilMDXJHb4Nbf75RG8BCkFWe
	 vg6FSfsgG1srq1iMh0KlL8zI3eMv/2F2oXUF3LySqUddroLYUFbvlrFoPAxujBgJdZGfM
	 SDIcKrasItgf1Q77JIis2yUbZiWiaV7PPwdW1ThPDePgVkDDxwEWk0xsBAnDoZrUIIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793683372;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=BR98tkQVks6AJwD3RBrsYEU/yAAvutTQVgyJLvDwq1c=;
	b=u4GO/1iPEF6xXutaeHBD5MDYc0076DbFAyUdm0qJl5AiJ5/0d48Gv+FhdLLBE3bGcv8X
	 UhXDvVQIkrF0kFAdH8+FKtMS1GoTHLnZuAeZm1OPk1o6VKPqNqMNle1gopHV0rjg+4EZJ
	 t9w/6axIAxlo/jrRA4TqQ7Yob1LxSwmuyQHfWhpdn0sh2ulBI5mc0mb42ZBbbYQjJkYBT
	 Pe+SgLIPng2fzFlrz0QyRgc654gHOgsnSlKvpvZZAZDYD+CskqXesNnxNTg0rc5wHJyWK
	 jQeHBg7srHhcq81H87SHcg8zKt97QbvRaZdkeoRIetztivNmYF++ZLrwfiMTQuBj56A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LkbyEAQI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GiSQvBxc;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B85CA606A326
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 05:22:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B85CA606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LkbyEAQI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GiSQvBxc
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A32oe2J2609020
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Nov 2026 05:22:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BR98tkQVks6AJwD3RBrsYEU/yAAvutTQVgyJLvDwq1c=; b=LkbyEAQIuZ1FuxcC
	E+js3EmF9O8e6tCqEO7ccWe1jjgqM6gtp4s9G8kKbHnpO7DjwL3ejMcUy1a2BoH0
	pAvN4fvOVdiIkA4OQ5dsBF5YIs5IdeBwt1ScdgeuMsJaR+jGffOhFtm7MhoBPHZJ
	H9zMcQUdRrTfKGu9gWxR4sf7ybWUoHIBmQqlV6NcMafUOPxUuGZX+lyBdUVIDzJo
	oR7frJPUD8jpVHmCqT/tlM0OwmJ9cpPptwGcf9dU+nvyM2/ulcGSn/g5IN7zrtqk
	Io1+qFixD0t0WTE8U7LRM5KiqvTQkpJ1c9pwCh0DkDqFhp8cOdU/kazPsLMJ1Mr7
	1vKp/Q==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq76d8fq5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 05:22:50 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ade5b3ae97so240768a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 21:22:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793683370; x=1794288170; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BR98tkQVks6AJwD3RBrsYEU/yAAvutTQVgyJLvDwq1c=;
        b=GiSQvBxcB7BgUobbQdfi3JXdzCdxibGo988G86roq4WYUHSld3TZYLocamJ0rFl0TQ
         pgvnO8q7XpNs33VWAQCg3o+ELJeUYEKl5ttnvBIebcNngECNyYpJOjbPchAIjpRckQKc
         DIhL0+M13Liv1Gks4Imsf212iK4JVx+jhnhUj+Pc/Nz3lTd8E9/1hTZNZxWBAConRP11
         0u0xKaUc0hO4FBuM7mRErVV49QdiLJzNbV3kMu3Ogf8QJLe1Ks5b+VaDkAJLslqkQAC3
         r+7N2HBk9Th1d34CkMw7Uzx3+aW+0ervrvGd2PhA+ck4XIP1xhWjNp+vFLspVIKICOoH
         fi4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793683370; x=1794288170;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BR98tkQVks6AJwD3RBrsYEU/yAAvutTQVgyJLvDwq1c=;
        b=ywl7EVOdZgPg0tFETE82Rd5u12Yw9KE2ggVimEC/wOnKBhEX16CahgwDAX+W9t/hY5
         BqlBG8gH2X1Kwr0ryiPpIlvODzd3tG4Vz6engyUg77zkBwFM/foJrxXVOR+9JoHyPC94
         qbgTny713Vx79zfktdicufLGaUTVcY/enyKIILtgznqrKGc1zNSCLsad/EdVxVSx42Lq
         XzS4P6GppkEK/7hgro508xBGOjKzeNiw6hIDl46T+/tT3wm+leTVTrzw2T965/fA5ZhI
         oULBqw3uQlxj/FKHUshQc4TJxap20g+wd6PpDC2SdrpTlEOs+hTfkWudy4YRh1+LwF3F
         aePg==
X-Forwarded-Encrypted: i=1; AKwUvByslZ6Fr4b1OwC9rmydITmVJrBDbluBn81wCH7fgHfFwJJ1MmBmkrGLW0tcpzw7bKZqniGrduwalx9d2eXC@vger.kernel.org
X-Gm-Message-State: APuU4Z8hMH+BgMp0KJa2irMcl/n9P/Azrp4c1V5jyTwqvNTG05708yuP
	nBy6fCarOAVuhDWV7QDoAEh5spGTuI6qb1ouTHtfskFNWO50q3XdPwEWKHvnvmC3pjxVOuXW6OJ
	NAEBd2pwEtdKz4Gnrg04bVnC25rGvhXcE4FUnhdV8oyfWTTV47gnuPBYBdJVKmZ7Iz5Sn
X-Gm-Gg: AYBFou31+gX/m2htRsV7nxXYuwljwPBzvNllWKyyR6na9Q4hrCTRiSgIJfiaw3oSEbD
	bz6Cz+MwhBUAcRJtWz62aup7yPjLe25UIO9lHXiXLoEUdQfFYI5IDR2XffKq5oDd08JHbBMKdtj
	WeIV9lc870BEWpGkvGrVdsDEqd7JBx5j7BJ34IhmLEHsJaGciKfFWcWSBWhaxFzXCecUbkkHOet
	6EisLX7Rt5dAH1DMwFERjIKHioko1CS3gBzlHbqNZQdFxINWd3fZsefKs5Y0ZuTWx3paNhpc6nd
	1pDoMdxrButneE9N79zuSMSokbRn4i/oSEmHzNNBKk4bAR9KuDJ0KWe3wtoeNYFFwaaY79/169A
	zhxu2dPBdKw8SFXmUKK4zaotcYF+OBtrA/E0UfO4Msu/LGR2rixIzz4Y9HJ/Gk+9NhDgUZv9ons
	G8T8bp
X-Received: by 2002:a17:90a:d887:b0:3ac:7a5f:2cee with SMTP id 98e67ed59e1d1-3ae6f015b72mr10962235a91.39.1793683370097;
        Mon, 02 Nov 2026 21:22:50 -0800 (PST)
X-Received: by 2002:a17:90a:d887:b0:3ac:7a5f:2cee with SMTP id 98e67ed59e1d1-3ae6f015b72mr10962216a91.39.1793683369533;
        Mon, 02 Nov 2026 21:22:49 -0800 (PST)
Received: from [10.218.31.237] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb363a62e3sm688502a12.4.2026.11.02.21.22.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 21:22:49 -0800 (PST)
Message-ID: <3a8bf3ff-bd02-47b7-98f8-e568d39cd086@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 10:52:41 +0530
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
Subject: Re: [PATCH net-next v3 1/2] dt-bindings: net: qcom,bam-dmux: Add
 memory-region and qcom,vmid properties
To: netdev-bot+sashiko@kernel.org
Cc: stephan@gerhold.net, andrew+netdev@lunn.ch, davem@davemloft.net,
        kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, loic.poulain@oss.qualcomm.com,
        ryazanov.s.a@gmail.com, johannes@sipsolutions.net, edumazet@kernel.org,
        linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        deepak.singh@oss.qualcomm.com
References: <20261021-qcom-bam-dmux-vmid-ext-v3-1-cedd1f681102@oss.qualcomm.com>
 <179292379798.3134.3640182983987741764@kernel.org>
Content-Language: en-US
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
In-Reply-To: <179292379798.3134.3640182983987741764@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KJTPn1Fo c=1 sm=1 tr=0 ts=6ae96faa cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=0nVg4KMEP9fHxcKd-jEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAyMSBTYWx0ZWRfXyWvj9f8I46L3
 qRGq//ycu9IUMZPFLTnP8s1ONyy+7Bw0tmIJ9HI07F8thXIViLxdHztOSNtw6A5HuOIqDYt+U60
 QWKrhEqCg/unwUu5d1giSwGd2Ip5JM0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAyMSBTYWx0ZWRfX1DYwYEOL/pV4
 AmEneiB96CzvyT8vFAm0siBUfT4cTPPBAucJBVjkm1JzTgNCvKuyan9VeEfz60OvcImlkGHFcN7
 NS0Vrwq98TMGjiV3s2zwfWPz7iI8ifY3+JzBuqEeIHsbk16gua35KM7pEsbAga2qc5xagkJm0Hz
 2gqmgfHnwH2+tck++K1wT8FTqXUARgGBIG9PAkWoak2LESYEkIhyBMrKr7C/W6pnmmngdQ+JsAx
 7HCt3yayJ9RSGVYmeti2ab1mi3+VyyihAzhSwJzQaVUCj3Wn2NH3MENBfUV2F7KUEu5veqUDqm8
 C27HiMxJdUljEb5z5OeoKWNk4doq2ZEnNpIWY14DbXwZ2Z/mEi3nQVLv6MeILLE6rjgQqoMr50C
 HUJRGF8gzXd186gCiUXNfuRCNOjyVgImoPFAu4lbQBrl+G+VXv5vXns8fuX3eKxhYJ5+vYpnCu1
 A1QxuyB03GW4/qP313A==
X-Proofpoint-GUID: TTPyggTwy-9mRf2IsKqE4KDgFT4Ad4l4
X-Proofpoint-ORIG-GUID: TTPyggTwy-9mRf2IsKqE4KDgFT4Ad4l4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030021


On 25-10-2026 03:53 pm, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential
> issue(s) to consider.
>
> Critical: 0 · High: 0 · Medium: 1 · Low: 2
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
>
> - [Medium] The new memory-region/qcom,vmid properties only cover the bam-
>    dmux client node.
> - [Low] Documentation/devicetree/bindings/net/qcom,bam-dmux.yaml still
>    says (lines 18-21): "Note that this schema does not directly describe…
> - [Low] Baseline decision: false (resolved later in the series).
>
> --
>
> dt-bindings: net: qcom,bam-dmux: Add memory-region and qcom,vmid properties
>
> This adds two optional properties to the qcom,bam-dmux binding,
> memory-region and qcom,vmid. They confine BAM-DMUX DMA mappings to a
> restricted DMA pool that is shared with the modem through SCM. It also
> adds a qcom,shikra-bam-dmux compatible, with qcom,bam-dmux as fallback,
> which requires both properties.
>
>> diff --git a/Documentation/devicetree/bindings/net/qcom,bam-dmux.yaml b/Documentation/devicetree/bindings/net/qcom,bam-dmux.yaml
>> index 33746c238513d..f7388d24c8612 100644
>> --- a/Documentation/devicetree/bindings/net/qcom,bam-dmux.yaml
>> +++ b/Documentation/devicetree/bindings/net/qcom,bam-dmux.yaml
>> @@ -22,7 +22,11 @@ description: |
>>   
>>   properties:
>>     compatible:
>> -    const: qcom,bam-dmux
>> +    oneOf:
>> +      - const: qcom,bam-dmux
>> +      - items:
>> +          - const: qcom,shikra-bam-dmux
>> +          - const: qcom,bam-dmux
> [Severity: Low]
> The description at the top of this binding still says:
>
>    Note that this schema does not directly describe a hardware block but rather
>    a firmware convention that combines several other hardware blocks (such as the
>    DMA engine). As such it is specific to a firmware version, not a particular
>    SoC or hardware version.
>
> This patch adds the first SoC-specific compatible. Should that text be
> updated too?
>
> The commit message also doesn't explain why the no-SoC-compatible design
> is being dropped. The only effect of qcom,shikra-bam-dmux is the allOf/if
> block that makes memory-region and qcom,vmid required. The driver's
> of_match table only lists the generic "qcom,bam-dmux".
>
> Separately, the subject line only says "Add memory-region and qcom,vmid
> properties". Could it also mention the new compatible, since that adds to
> the DT ABI?

The compatible was requested by the DT maintainers so the schema can
enforce the properties required by the Shikra firmware configuration.
The note about a firmware convention therefore still holds.

>
> [ ... ]
>
>> @@ -72,6 +76,22 @@ properties:
>>         - const: tx
>>         - const: rx
>>   
>> +  memory-region:
>> +    maxItems: 1
>> +    description:
>> +      Phandle to a reserved-memory node compatible with restricted-dma-pool.
>> +      The BAM-DMUX device uses the pool for DMA mappings.
> [Severity: Medium]
> Does a pool on the bam-dmux node cover everything the BAM accesses on
> Shikra?
>
> The pool only affects dma_map_single(dmux->dev, ...) in
> bam_dmux_skb_dma_map(). The BAM descriptor FIFOs are allocated on the BAM
> controller's own device in drivers/dma/qcom/bam_dma.c:
>
> bam_alloc_chan() {
>      ...
> 	bchan->fifo_virt = dma_alloc_wc(bdev->dev, BAM_DESC_FIFO_SIZE,
> 					&bchan->fifo_phys, GFP_KERNEL);
>      ...
> }
>
> bam_chan_init_hw() then programs that address into the hardware:
>
> 	writel_relaxed(ALIGN(bchan->fifo_phys, sizeof(struct bam_desc_hw)),
> 			bam_addr(bdev, bchan->id, BAM_P_DESC_FIFO_ADDR));
>
> The companion patch "net: wwan: qcom_bam_dmux: Assign restricted DMA pool
> to remote processor" says that "BAM-DMUX DMA mappings and BAM descriptor
> FIFOs must therefore be constrained to a designated memory region", and
> that accesses outside that region "can trigger an XPU violation". It also
> says the FIFOs are covered only "When the BAM DMA controller references
> the same pool".
>
> However, Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml defines
> no memory-region property and has additionalProperties: false. Nothing in
> the series changes that.
>
> So a schema-valid Shikra DT would leave the descriptor FIFOs outside the
> shared pool, and a DT that works would fail dtbs_check. Should
> qcom,bam-dma.yaml get a memory-region property as part of this series?

This is covered by a separate binding change for the BAM DMA controller,
which goes through the dmaengine tree:
https://lore.kernel.org/all/20261021-qcom-bam-dma-vmid-ext-v3-1-299355e8dd3b@oss.qualcomm.com/

Vishnu

>
>> +
>> +  qcom,vmid:
>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>> +    maxItems: 1
>> +    items:
>> +      minimum: 1
>> +      maximum: 63
>> +    description:
>> +      VMID of the remote execution environment that is granted access to the
>> +      restricted DMA pool through SCM.
> [Severity: Low]
> Nothing reads qcom,vmid or does the SCM assignment at this point in the
> series. A Shikra DT that binds through the qcom,bam-dmux fallback would
> bounce buffers into a pool the modem has not been given access to. Is
> that gap between this patch and the next one acceptable?
>
> The next patch in the series, "net: wwan: qcom_bam_dmux: Assign
> restricted DMA pool to remote processor", appears to resolve it. It adds
> bam_dmux_assign_dma_pool() to bam_dmux_probe(). That function reads
> qcom,vmid and calls qcom_scm_assign_mem() with HLOS and the remote VMID
> before the DMA channels are requested. The patch also adds
> bam_dmux_reclaim_dma_pool(), which runs on remove and on probe error.
>
> The driver matches the fallback compatible and handles the property
> whenever it is present. So the fallback semantics look correct by the
> end of the series, and this is noted only for completeness.
>
