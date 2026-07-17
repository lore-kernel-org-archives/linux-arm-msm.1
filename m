Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D8631AAA3
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 03:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784259698; cv=none; b=IUpkDdZim/z5plySIZIVgVMyN6qaRNyulPSVmaGZVIz5JKsHJlOXZi7lswZ+CcS+gR4Kd2NW/f5OBCXMqHWo2Jdgtmiyu1wGF2zZGUKW0AIzUvoWg89R2R43AKVUzmX6MRZfDiWeuHd7ZXM2SzqCemXruANcIdq4WaoKRNmFL5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784259698; c=relaxed/simple;
	bh=p53ALYQS+L5bADI3ICQaxcHUx5mc/nr55b6UmAc5ry8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EAW0Ux+QowTyb3w5ynSWgz9SxrLKvDsE7h/K9aTaCb2CxYfXMvkvBkfXnjWSEtCAMDrnyxzs4GUUfyx2sqjdYj8XImB4ysI1G72BE0kjFrLaGhBzQr/Fauujz3VwjIrVJIInR7mZe+Owsfrx1IwzUyhUea6gsUyRyf1CTRgutMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H7CAZJXz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jV6DEmqa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H7CAZJXz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jV6DEmqa"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H33ddB580712
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 03:41:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7kq0ypRTY8LlhSggMVl3rvqS4X9hu7uUgtI9ZDu2lTU=; b=H7CAZJXz4re/nHaP
	3Lnac1Ktq/K/Y6zifF/w1YIE38869QBnUgoRL0tI7rKQOe0Zw/XUSvYhZGUFonRa
	MgVjOdF9RWEL9Cjbu3UsHz0iKOJr3LXeTfPa6etpLZwmSaUOYImu69Qhc/t0FWqQ
	GNGQzu4MDcYTxRq+YXPm180kOxfHR1b0/PBarP6bSTFIy83oM2n1dG3VEjtP5jHf
	af1cuEFwu3CpTa65lKpx1E7/BkCjBlQQFSKwIp+DiA72j8uIN8KRv2x3jcD4dwEu
	0VDAY+fdiJyqk8epN38wyTZFJqkZ72JCMvooq+S7aERSNORu9Um4dhQqKwV9I11T
	/5ZomQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffbqug66n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 03:41:36 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cc5faecf01so141923615ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 20:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784259696; x=1784864496; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7kq0ypRTY8LlhSggMVl3rvqS4X9hu7uUgtI9ZDu2lTU=;
        b=jV6DEmqaD4HxFKZvnkz5fvxykJLX1g6R1SUidAoIA8wvj6Q8KZrNHOh/gsyZtTIl85
         QvOf864Rlu62zynwQ3RF53/7LDcT2ywhz/lLRreFQHgBkiN9D9ocyY8vXQdvXn9qVIGL
         4qp6CSs9ltWp5rsxKGzldu3W+OkH1WYaf0Xw3DQLhsZFXN+XJsYcLq1vYmeQfA+KHw1k
         Hw6Sf8Yyc8jpr/VjgGr8S7wrwU2vMwxM2ObEOMdtRMOEmbv7hiYbMobN8hnLNn8zSOSz
         zBN4pZRpB8yElBA46wH7pJeuJ3vwOOPPQSU48mNqWsjpImAIJaK7aQa2dYgYif/1GJp4
         vQ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784259696; x=1784864496;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7kq0ypRTY8LlhSggMVl3rvqS4X9hu7uUgtI9ZDu2lTU=;
        b=n2IWmldWdyeUjjs/g4PR99uRY5Va+d8zOchpWBn/GFIreCByPJy3VmGJqOBML6d0Ss
         14zspN1H3TxXPyhH2+n9qsLiJh9ksR/t9AsKovuKeUZEYxHSKQ2n2WnuZVTID3/TQxjo
         rH/iXI62y27PPwAf1MSW5pUmnt8gX3hUAaE3w0jGA/v+ObaZnGFvE4+MEjj0QwEir7mS
         NBNAmFd7TTdvSKPRnr5HzysMz/jEyueJzfRVLp82e6KjIY9xz/XXfr5biC/BJvKPzfRU
         +DIGGJydU7Bnuo2VOTsDLb3j3eOeqUl7IJfq6fgtZdHzk1zDu+F4XcEy1bCwbJUkxnvk
         v/jw==
X-Forwarded-Encrypted: i=1; AHgh+RqjD8wMav/O5uaOkoJT2nndXeN6zdry5nzr8B9scIYUG+k+P1sUr9q/YKDk3AOxesXxlsdfMdlvbgZWvTfZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yzhq+rkrCrfPod876vY1Mn5KsHfLFbYTSq8MkbVfwLHpwieElLU
	xOXLdcmqXWRHnXI+RPITJDAErniHiON8ogcJBtoqh+QuKTJ0bZt4eYiI+Z9VxauUR6e3hTke5MK
	+TJT+rcthK3+GFKys1HdiOEoaqZDPkdhOgJEpUDHc7neGjR5EebO7jRaNZtCRs7PTzcPl
X-Gm-Gg: AfdE7cmY95RTkL8juHFjWT9wlRMXuNz0EqqtJeVwCnnkAyRy+/2JyjiHdpIl7WR4k4F
	F1kHoExdxMO9VpVQw0YD+A4768T/PzHt7+BtprO2NZbssP6LIm6epHlcrNZPmD/HaPqjgEM5V1m
	TAeJIxQ328ImnZbegtCWbeJmtgYT6LYkU74WuuICzBNa/BKjLKP/nMF9sbVnHPfiPSmg9KYjpF4
	WP3E4GwK/EEO06eUZ5gJFq/lIOsbJbYELxBNvvCMP8HNZBcws0ZT+9+zrSsaQSasVZIndA1oW7G
	bzdBlBRjDeoZMh+d1BLXsSQ4Ca8rgV7hwszb4Hn8Y54dhDUVTyn7k1MvqNHmkLRroChDQgHPLtl
	/DWxp1yBqmkBs1svCD86Wa7lhbyGfTA==
X-Received: by 2002:a17:90b:4c8e:b0:37e:2005:6509 with SMTP id 98e67ed59e1d1-38e4b417444mr741494a91.3.1784259695587;
        Thu, 16 Jul 2026 20:41:35 -0700 (PDT)
X-Received: by 2002:a17:90b:4c8e:b0:37e:2005:6509 with SMTP id 98e67ed59e1d1-38e4b417444mr741468a91.3.1784259695109;
        Thu, 16 Jul 2026 20:41:35 -0700 (PDT)
Received: from [10.217.198.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429f9d44fsm1553673eec.1.2026.07.16.20.41.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 20:41:34 -0700 (PDT)
Message-ID: <64bf3979-51cc-42ed-b66b-c7af04536481@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 09:11:28 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] arm64: dts: qcom: purwa: Drop the Hamoa workaround
 for PDC
To: Bjorn Andersson <andersson@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260715-purwa-pdc-v3-0-be08934dc916@oss.qualcomm.com>
 <20260715-purwa-pdc-v3-2-be08934dc916@oss.qualcomm.com>
 <20260716-starling-of-heavenly-symmetry-09a73a@quoll>
 <almDHnEcruBl-I3l@baldur>
Content-Language: en-US
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
In-Reply-To: <almDHnEcruBl-I3l@baldur>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: lFSvB0B96q5qvm0hXBllHT50fdEJHZ5q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDAzMSBTYWx0ZWRfX6cYHT12jiXjf
 b7u8ydHilyHhmmio/XwRGIcyh4wQmDr8IclKE68Lq9hTedcgDCYXOWymq2oomUOsSgqCXImMvel
 KcUV9GwxwNQENh54nQKndHSL7W1a1MCCfLEixvJvngDTBqJbdo82ihJ/2RjqbmWCKQBTaFUOwuW
 MUML7zwGYnYdjgc+ZVSQGR/o1zKNHWDLnzO7dYze3+bhgwsGnK1/Rlu7696c/pgtvsEClf5Ju4v
 B2fa2QXpgPHCkDXX9bOb4ZUrSRYZL90JF5EuJ3l1HNcsMrBET8oIjjS93dwe68hB8EnMKJoT1lJ
 LDslLkH6eo+yOaChW2vPK+ITl1WjqCyrn53znHGA9so30tKl+kT11nJvv/uX+JHxHXlkVh5Jad/
 xxNlS6sPO2Vjz6wUxwJ1USPHAMSwdZz/RnNiZMdeJhcJEyzfodoEiaa+r7HLWu4yaUZEKp1mPWz
 NYP0RkPwMY+CSeWvBcA==
X-Authority-Analysis: v=2.4 cv=NZ3WEWD4 c=1 sm=1 tr=0 ts=6a59a470 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=AKtfWkbxmUR3Wn90oXcA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: lFSvB0B96q5qvm0hXBllHT50fdEJHZ5q
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDAzMSBTYWx0ZWRfX31AA4puN3TVr
 udFlxR6PHLzQU8BIzLf1qhI9ghnvln/lEmUQrXdCANiSGN85S/FyXelAE4+vkZ47aspv/mrdTHD
 /bfVs69u0RP4XFaGcNviHPWawuUxr40=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_01,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170031



On 7/17/2026 7:38 AM, Bjorn Andersson wrote:
> On Thu, Jul 16, 2026 at 09:59:44AM +0200, Krzysztof Kozlowski wrote:
>> On Wed, Jul 15, 2026 at 06:52:01PM +0530, Maulik Shah wrote:
>>> X1P42100 (Purwa) shares the X1E80100 (Hamoa) PDC device, but the hardware
>>> register bug addressed in commit e9a48ea4d90b ("irqchip/qcom-pdc:
>>> Workaround hardware register bug on X1E80100") is already fixed in
>>> X1P42100 silicon.
>>>
>>> X1E80100 compatible forces the software workaround. Use the X1P42100
>>> specific compatible string for the PDC node to remove the workaround.
>>>
>>> Fixes: f08edb529916 ("arm64: dts: qcom: Add X1P42100 SoC and CRD")
>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/purwa.dtsi | 5 +++++
>>>  1 file changed, 5 insertions(+)
>>
>> Why does the DT change appear in the middle of the patchset? Please read
>> submitting patches documents - both of them - and maintainer-soc
>> profile.
>>
> 
> I thought I had figured it out, but I'm not sure anymore.
> 
> The claim from the cover letter is that patch 1 and 2 are completely
> independent, but patch 3 depends on Bartosz's thank you letter [2] that
> arrived a week before this series was sent out.
> 
> We're not merging the three changes through the same tree and there's no
> expressed dependency between patch 2 and 3 (only implicitly by the order
> in the series). But as Konrad points out, in-between patch 2 and 3 we
> would not enable the secondary GPIO in the PDC driver, so Purwa would
> have broken GPIOs for a while (not ok). I think merging them in the
> opposite order would be what we want (i.e. 1, 3, then 2)

purwa-iot-evk.dts where firmware sets pass through mode, so current order of the patch seems to be ok.
(patch 3 as such is no impact for iot evk)

x1p42100-crd.dts where firmware sets secondary mode, applying in 1, 2, and then 3 may leave crd boards
in broken GPIOs for a while after [2],  so yes order 1, 3, and then 2 makes more sense.

patch 1/2 - fixes the purwa to operate on correct registers.
patch 3 - Allow crd boards to re-set the mode to pass through

> 
> 
> But this series implies that Purwa has been broken from the start - that
> the PDC driver has always operated on the wrong registers.

yes, purwa always operated on the wrong registers.

> 
> Perhaps the impact of this was limited as there's not that many direct
> &pdc references in the DT, but the patch that Bartosz's thank-you email
> was sent for got merged as 77fbc756d9cb ("Revert "pinctrl: qcom:
> x1e80100: Bypass PDC wakeup parent for now""), and that would make a lot
> more use of the PDC.
> 
> So while nothing in this series states it, it sounds like Purwa might be
> completely broken right now and this series aims to fix it?
> 
> 
> It's not clear to me why the driver change doesn't have a Fixes tag, it
> seems like the patch that introduced x1e_quirk was broken and should be
> marked as Fixes.

x1e_quirk in the driver via commit e9a48ea4d90b ("irqchip/qcom-pdc: Workaround hardware register bug on X1E80100")
says only about x1e/ hamoa specific bug, it seemed it never wanted to enable the quirk for x1p / purwa. the quirk
rather got anyway enabled for purwa due to both hamoa/purwa sharing the same compatible.

Patch 1/2 of the series aims to fix this (and patch-2 carries the fixes: tag).

Thanks,
Maulik

> 
> [2] https://lore.kernel.org/linux-arm-msm/CAMRc=MeU0QuRozMscv02M59+a66S05Jm18CyvNE-qSYrY=S7hQ@mail.gmail.com/
> 
> Regards,
> Bjorn
> 
>> Best regards,
>> Krzysztof
>>

