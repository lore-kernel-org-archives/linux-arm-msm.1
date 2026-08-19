Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F96544063C
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 20:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787169822; cv=none; b=u4rs2Kiuj0zJTc2eE92Vf7aTTG6Oty0pfWAMxlnVlvqzX6lMoXeIU8qmDOrAeiJUlHB8VS63CPVBCX2Y3GePgFsef40OD80wH4akioy2doxtkH922UA4z3tKvRnaKBsJXY16JJeqrOQx+T1hDcCgttsQIlMtYt7ErFKJZcmv8vM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787169822; c=relaxed/simple;
	bh=TOeW46gewsoOttmuhKmEkmPzOZ05ChEhCpfGAlPCj8g=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=n4M4duxqjRJy1Gydxc8Ojg4LPpEidmdrAHrBFtjYpNnvgEzzfzD4gaqj9SRUKDaDP1/kqoGhdWPrXG/S0+gdvvhPXaNMEh+agdf55g/P//yMVGVXDtaOD+/XlCVyZEye4NWAanvXyNsr7WW2DzF8bZrrUEpuGL8knwkX4IOmFwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HS2NBXLN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PPCnFGd1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HS2NBXLN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PPCnFGd1"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JHpuxH3993122
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 20:03:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kMNhPiiJvgRATbElI68q7fZ3hCQDPIHgGuHiAH7uOhs=; b=HS2NBXLNtQmLL/e0
	Bi7ALIkPMdk6fIh03Lz5H5mGJD1mioaFTnxf2OCe8vwU0dNGC1K27qWlDR103lLm
	m7CfwHqbxk7V44xs7ubb5yomFpr4ha+IAnhs0acgugHANb1UZWyXdhAaJYbPPQy9
	Tp4wK8DcNlg5N6nNzKsqA6U9xqpLMW2Um9VYnjC8IJCBtywjRMaROCqW80Wy9IIc
	1zotSjhXgGAOr35SdWTKYJcVqH35HEZLRNucwdpXppmfgIr+aonBSPzaDe8g+iw6
	IhFIlL1ENzjYp+oId5rUc9OygXeOMV18FE9gyWP6xoi77DOkO67oIzNPPl4IRSww
	OkyqPg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5esase4b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 20:03:39 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92ec3146553so274429785a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 13:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787169819; x=1787774619; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kMNhPiiJvgRATbElI68q7fZ3hCQDPIHgGuHiAH7uOhs=;
        b=PPCnFGd1OwhhaMJGAws+AVexGi77ycP/ZM1sOhQLnPNXxpaXOyj0m5aAWvz2oBVPpl
         h/SglWs8MQyymmGfXgg6Ru3aiH1lN2S3qQ49X0NJyl11+BE+FI1hne37w6x8ZQSu2jYa
         sgOWqRZjqXfCqdaYCXLA39zpXpv8o4MFbwXph1O425OtiWmYbz98BO0iEgb/kimij3hg
         SQKVvrB7i374saBGSkaHCTv+QLrpUMFpWiuF1JOp1t4/oB6+wm4UvsYo9qvzyR43PKxo
         qUwuaIUHScZRC5kpdbKhu2HR6eVkQWmkIHEgoPfTFDlvMbZW9ajKktF3l9MRJnpHcHOS
         QRfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787169819; x=1787774619;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kMNhPiiJvgRATbElI68q7fZ3hCQDPIHgGuHiAH7uOhs=;
        b=atA56L+UHeeBil9RVzrY2zDwxBdVnWvtNgGyf/3fi1IcgrfegFvuwvS48NVcJiC4Uj
         H34MVjMgszQfrkqoRH7WYHgfnpLzLCL/RS6A24S1vLe35Fb5vT8/NxJBcj4Nme6nmZX8
         wxoA6JDo2/hQS/qxzpYS2Lf6RpJ35Sw7mX28gYQrEibYplb+ocQtgYmLTVtqmEXRHR0v
         XDZzhglG0nXG4Tt3Orllki+vHsEv0QT8kEW1J+l0P3gy1DpTr/0eOsyFink8AUuLp8bB
         QoChL3WNKJQUkS6UT/vecpUvqLH4XS9qBEN9v6lC/tgJlCyvIlwzSNBlZAbwKOJPh7mu
         t1iQ==
X-Forwarded-Encrypted: i=1; AHgh+RoU/Q9cFMQkAvV0Ou+RriE0HFAkYxC1L+dIvlzuQO5FLy8E45W2u8ZdYMB0vIkaPLi9IDdXJ7ZzVAWdJrge@vger.kernel.org
X-Gm-Message-State: AOJu0YzW4o/s69QhDqyAtq/klsH6ryz3w4nsGSP97IpB+O0UHD6DilcZ
	XyTVmZ68+wN+7a0ABqlVO38EobBbSTzeGpJWrbrkuf9P1W79xfNBx+ThbnW4TNy/3P6U3Hu3wD6
	t6X+vonAbx/rLAgD0NemEDiZZz4QdEefOVeZu4FH2+2NPWW0NApVzhuxqityOVt9HuIYp
X-Gm-Gg: AR+sD11dqcwizzfywVmTH00vqxr6NtJUwZYDG6tJJxm4H5fM9EL4X6CZVHH+5lhOjXQ
	u1eMZqbfRwu5IHosgC8K95dl9PWXch9N3szJQs50sgs92RoX/TiKUh5bGpZXqegK3+RVOPSWDVM
	x9+kpHfS54HdkAXal9UJz1be9IXTzxuohK/XgJdavU8gUP/kSI3rk5mURHXp2LKW6sqiuhee/RY
	SrO4DEHRQ1BNVefEd2DIIMO8E5W5L9G9PWinqMnPgJaOo2qAlfuDpuBATNzfjI/R6W1aZwxXSye
	N+sJWdEpokPFzqZKBd4FQ1154mJswLsjCoVgwu7wcREmLBVzeZdHOkSxDvUQF95uM0puprBIpIf
	HklwdVU0w1+xKSqsmgwmLDUelq/8s4eSH0UYMO213O359J8/ydpFQqOrz83nyyQ3esnEhsaOZUS
	A9bmxIGC0yNG1FaeYrjtkmldGYsFPB0ITWLbUUAMIyKUIheH3zJHbIZHa8xFOPsJEVXu8=
X-Received: by 2002:a05:620a:27cb:b0:936:9bc3:e10f with SMTP id af79cd13be357-9371e1f80c6mr817451685a.5.1787169819151;
        Wed, 19 Aug 2026 13:03:39 -0700 (PDT)
X-Received: by 2002:a05:620a:27cb:b0:936:9bc3:e10f with SMTP id af79cd13be357-9371e1f80c6mr817445585a.5.1787169818682;
        Wed, 19 Aug 2026 13:03:38 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a411971b19sm128391a12.11.2026.08.19.13.03.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 13:03:36 -0700 (PDT)
Message-ID: <ddafac9b-bd8b-4edc-ba91-077769ab88a0@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 22:03:35 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH] Bluetooth: hci_qca: Do not write to the serial port after
 it is closed
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Ibrahim Abdelkader <iabdelka@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org
References: <20260819125425.192316-1-johannes.goede@oss.qualcomm.com>
 <340c1443-9e2b-4224-9029-f1defc644494@oss.qualcomm.com>
 <CABBYNZ+cFGH0kD5iLw1WnUWuhSxkgwu0BZ1E0WYCzOg9D92quw@mail.gmail.com>
Content-Language: en-US, nl
In-Reply-To: <CABBYNZ+cFGH0kD5iLw1WnUWuhSxkgwu0BZ1E0WYCzOg9D92quw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDE1NSBTYWx0ZWRfX74OOExE6iUaT
 Uag1t2pqD9eDIj+TRdarZoI2sutP6IQcy4hzLAm8GEL7t6sC7mnb74+52CcKL7+VOID1NO4myuL
 v18wg6+hyPlbpPgBDpfgdyWCBaIJbqU=
X-Authority-Analysis: v=2.4 cv=fKcJG5ae c=1 sm=1 tr=0 ts=6a860c1b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=dlFzzRy74kIF9YYi:21 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=lp5izKIPRPbgdJieGxoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 1ve-uM08dF-CYy3v5fm8r_4gQticq06h
X-Proofpoint-GUID: 1ve-uM08dF-CYy3v5fm8r_4gQticq06h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDE1NSBTYWx0ZWRfX9AN/aOx3wuyT
 p4h7LxkwDXRNUYmUfe3jpeq/4QIsGljqDWuLmAEpyqFvSmraeJbW317dFebUvOoAhUKEF/f/IYt
 eg8ybxKRh8x4hEt8SStRIPqeFYP0Cur7CaSU33IfrCKuot634Qgi4WsZxccTkAxgf5GQIfOWqPE
 DBjXl1XgblExxzklYBqI+FNJPcqfHFW7uJT2X5z04eY2RPW0D+7AO8+CLlnO1zopOPDkniKdd+i
 /gx8FVFEA4JLuPf1jvATwl5AaDFAoIFyeedGbHtvXd6gimnYauyo2dFY2znlylBDNxVdfErSqBl
 8pC/Kc1+H9OS7Z7aOWCpnZNk4y628njgiXk1zGR532G0fPPbarQrLujNN2/UAbz9c82U9r7MLtB
 RcGCQm1REv15S1XKL16/s82Xf1HlJv3xHl2ITF+16eqgVH0Xr/bN3p+OqN6R/gB3E/fDc+8U7FQ
 vk+FyHS75ueEyGM0pTQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_05,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 impostorscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190155

Hi,

On 19-Aug-26 18:25, Luiz Augusto von Dentz wrote:
> Hi Hans,
> 
> On Wed, Aug 19, 2026 at 8:59 AM Hans de Goede
> <johannes.goede@oss.qualcomm.com> wrote:
>>
>> Hi All,
>>
>> On 19-Aug-26 14:54, Hans de Goede wrote:
>>> From: Ibrahim Abdelkader <iabdelka@qti.qualcomm.com>
>>>
>>> hci_uart_close() closes the serdev port if HCI_QUIRK_NON_PERSISTENT_SETUP
>>> is set (for example, for the WCN399x family). A failed hci_dev_open_sync()
>>> following a successful qca_setup() calls hdev->close() but not
>>> hdev->shutdown(), so the port is closed while power->vregs_on is left true.
>>> qca_serdev_remove() then passes its power->vregs_on test and calls
>>> qca_power_off(), which writes to the closed port unconditionally.
>>>
>>> Seen on a WCN3988 by unbinding the driver after a controller failure. The
>>> trace below is from a 7.0.0 based kernel, where qca_power_off() was still
>>> named qca_power_shutdown():
>>>
>>>   Unable to handle kernel NULL pointer dereference at virtual address
>>>   0000000000000038
>>>   Call trace:
>>>    tty_set_termios+0x50/0x238 (P)
>>>    ttyport_set_baudrate+0x84/0xc0
>>>    serdev_device_set_baudrate+0x24/0x40
>>>    qca_power_shutdown+0x158/0x1fc [hci_uart]
>>>    qca_serdev_remove+0x54/0x68 [hci_uart]
>>>    serdev_drv_remove+0x1c/0x2c
>>>    device_remove+0x4c/0x80
>>>    device_release_driver_internal+0x1cc/0x224
>>>    device_driver_detach+0x18/0x24
>>>    unbind_store+0xb4/0xc0
>>>
>>> Check HCI_UART_PROTO_READY, which hci_uart_close() clears in the same place
>>> it closes the port, before writing to it. The regulator disable is left
>>> unconditional so the controller is still powered down.
>>>
>>> The dangling serport->tty that turns this into a use-after-free is
>>> addressed in a separate patch.
>>
>> That separate patch can be found here:
>>
>> https://lore.kernel.org/linux-bluetooth/20260819125748.194377-1-johannes.goede@oss.qualcomm.com/
> 
> Hmm, I wonder if both should go via bluetooth tree?

This is just some hardening to turn the use-after-free fixed
in this patch into a NULL pointer deref. Since NULL pointer
derefs are better (easier detected for one) then a use-after-free.

There is no dependency between the 2 patches and they touch
different subsystems.

So having them separate seems better to me. But either way
works for me. If you want this to go through the bluetooth
tree and Greg is ok with that, that is fine too.

Regards,

Hans


