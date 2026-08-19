Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FC8E2E737C
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 12:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787144359; cv=none; b=mo9Msz+D/7XHaM3m2ee+3Q9dxln8/mMHGXt2aV1CsYmIMOunXSpNLkZGTpe7rTPwjOYDSA1Xjd+ZcjwhvIbnvJT072IO+TFYOnU81W+c/GWMK2jWplQCicRerzSxSCZdhTfOVXNAnteGqUidtPQOyOhzhvUs/oANT0E7ly/orYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787144359; c=relaxed/simple;
	bh=CuTKmQnaSx5nkqFsu5L1bo9ZzMMDup2P89U7vLFzymw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=tIErli4b866HLhEYAH/cEkRJ4/1JtAHUDIU1FNp1KAZLo85eTRGluNRsD75JHKVtLYgrmhGH+YNU2wmpld9cp4EmW6nKt6tqXClxuzW57pBZfgu2IZ5VxW2Ybpsen6V/LC+7aixTv5diifDxkDppBn15Ker8WWQcs66lvBYjygE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kMs+gCue; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AqbS7/HY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kMs+gCue";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AqbS7/HY"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JClPL7143816
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 12:59:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IzHa8M93DFFWzI1AxZRwzNbo7KrgJCHbFTJdy8UnY5M=; b=kMs+gCueZuPksMkV
	GRNfnszoLPsoko2GRZQaH+61rUJOkjCZsTtw/Azr5yoYIEh+uwoIdVGhVMz2+bLB
	FtRc/yPez17VPlTnyWnPgv1RouhbnHz8ZZQsRdsOdKUL5yVIiZ6Q+FnBAVPE2GDJ
	KwgXXxAAu4oyNQaKIlWb+zmisC20r2hiziosnLNPwaLS0VXC3fitIFb7Ql26T1Go
	t30V2qHtTTcxgBJZ5fvlvMInXJh51gDyoi+HWnsD78/G6MLuuEG5+c+4+rwPPhte
	xTJy7I+wro7RGyORe4p1mFLcy2mskUc9k4tlIppF8AoOji/3XF85ZNasC2b8a3yx
	c0m1lA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfjkcmf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 12:59:17 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92ec3146553so186928985a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 05:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787144357; x=1787749157; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IzHa8M93DFFWzI1AxZRwzNbo7KrgJCHbFTJdy8UnY5M=;
        b=AqbS7/HYvKsLyx/Kenh3qgmjBoX2/rYIScg4521maH0ezo5AvTFFoWEQ4S8fRI8S/O
         eWE4fMHbiJFxNuN74r2oeV5NzXHdXnerUQ4JLgaKoig2fLGvAvRuLpKq3yCZN1tOFqiF
         iE9fJFHFpCx44uDMk+2v2NaPuh28bgFSoLJzbDa/0kyqSIududdlSIO9eTQSqgEexbct
         BER09yEr3VN5TU902JRLAmgxjJ07JCMoUmvK4618jcw8EWoaRFY0yJDTxUxOh1mEsR5d
         4bcniViE3VSKoXyTPM1U+XlJvOPDKe81Rc8NBx/veuIs+ZRsgIiZ4E4/no3pkCODMbwN
         Khiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787144357; x=1787749157;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IzHa8M93DFFWzI1AxZRwzNbo7KrgJCHbFTJdy8UnY5M=;
        b=GmzRMRWETV80wQXFtuv/Cers5AoqWKHCydy8/1LBj/T4oVViQjqbNIhUsCjCMb+wwz
         6pPhZ7FJ2T+i0F58UsY9j+MI5GOB40sUlP5DU3ujwN88woyB6IpwKHR5ucPp92I5VLsG
         tnXzVWeVdsucp/lopgmsu/7kl+S6q8ya/JcgMphPuRDl3rvKVjacCtTtiiuhEC8NHHL7
         qcBI5TM4ascihFTDIee8eG1EXzSrDIVbw6wtqzehfO847oOK+Ptd7PTJlDInMcrt7cnM
         Vn3ws3b7IRtjaDl3POeDNxgEfSUdqn5OSyfUCOWWXwm3d4C2uGkDFWetP62U9p7QQTJI
         cG+g==
X-Forwarded-Encrypted: i=1; AHgh+RqVuXEanJJ2rGmMQaDIquHOfd3G/xto4usDdhLRX2cAu5s3KDrB0CwaHRYPqKmAVYtnin3gElK1Am7dHeWG@vger.kernel.org
X-Gm-Message-State: AOJu0YwXZnYnBb8YwwO8bOlWQ8VB2WDXWWs5Ug3FAq91NX/OXQF4pa4V
	4BIXje7q+/kfVNFfEyCB8GCjKy09JtoK9CY5kJcJGIj2QO+LeRHSV7wR+aslCZG8zrH09rokCm2
	PacqLvyNAg4sPNbzVZm90EpGw/QRljAsX5n1jxMN4ZvkfEf798e/Tg+g0wxQYVopQxIh+
X-Gm-Gg: AR+sD100YR2dBDSCGdMVta7AzTFLBpMELWEzDBNH0AX/M9cHrxh3i6U597vjPPDxIe8
	DFJ8zS5FtLxpb+No05S0luMHL46H6+ESADD0n6m5+6+p8XV9Sj0bMsyMT0o6Sn/Z9EDT6Mv8mzU
	Iu9NaltATQYSZen7P7IEBdBOXZHFLxsug3rZNULHutDJdGIX4dRKpcvNKj3UfGCZnAqXIkFOfsM
	g18KCl1wphcJwxpELlOsdsbkVMIWwqCchO3qAaTKbKE723DJO1+sPcwFIjqFB80XS4mjMkJi90o
	60IyxkN8iTqoitF7ZFc5+Gw93eAykSMl3I1SZpI/GBN+ENGZROV/dQLoe3ZC7/gqw09xCILItuR
	/8OyEky+t66nQAMMp4ve5xM+WFNmnehVaFbbi7GIhJDXlJqbFIHtuZDrm66nhlp/sNNfdzxMqwu
	ijeX41JhfKzoIBpSCKlXT0xGguty9En968uXkKyhLHF5vSPlLs17zQU3ortdlUh+fTCdg=
X-Received: by 2002:a05:620a:1792:b0:92e:5d44:73fc with SMTP id af79cd13be357-9371e23b130mr395728785a.12.1787144357007;
        Wed, 19 Aug 2026 05:59:17 -0700 (PDT)
X-Received: by 2002:a05:620a:1792:b0:92e:5d44:73fc with SMTP id af79cd13be357-9371e23b130mr395726285a.12.1787144356650;
        Wed, 19 Aug 2026 05:59:16 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c243c8e4482sm67698466b.1.2026.08.19.05.59.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 05:59:15 -0700 (PDT)
Message-ID: <340c1443-9e2b-4224-9029-f1defc644494@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 14:59:15 +0200
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
To: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Ibrahim Abdelkader <iabdelka@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org
References: <20260819125425.192316-1-johannes.goede@oss.qualcomm.com>
Content-Language: en-US, nl
In-Reply-To: <20260819125425.192316-1-johannes.goede@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEwMCBTYWx0ZWRfX/hXWBg4XU+4V
 oIz0VCHyZIGP/2dKTt3zQuRRcgAv0eBCa2OI7y+DzX6fVJyNCup3Bg0NmqXYCy1AawHHVzbSOS3
 8MBN0fEpx/VUe03Js2kq5l541LBzDEm4WEA5mEPhYWmHOd8ffKuw2seTBGxE6hEjri0qSOPUhwM
 dm/FMJJxRxGJecfIRDhJJfTJArrtQ9yefUBSEWHIU+So02V0tmWh3QBdX+aptnlCY+5VecaWWtU
 NUaCduDXWIcQ40zU36bB24h/5sOr8RiWqzcmKoMfGRV5xHYqgjeUVdbW+ioBjdF7PEq31FuGZAm
 sOQgAB4EXGDOUHb3t1uK/NtawAUo2cfLl89MXS3ibhauO/57XPBiYVR52eE5vtwzJeZ7W30iySh
 Cctjs+tpeN1mxoTw9fYnSL+vW5Np39Ryw8Mhy82r9+lSnnRMtpE+ztrRs3zb3nrysiaR5LEAT8Y
 z9qj4qfrmAWAoE3q01A==
X-Proofpoint-GUID: 8YT_B4DYZUdQxYeISwjt9xH1TS4VU0IZ
X-Proofpoint-ORIG-GUID: 8YT_B4DYZUdQxYeISwjt9xH1TS4VU0IZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEwMCBTYWx0ZWRfX/xDIQ9uP3qcH
 rqcYU+2I/0x1JhBUmqPfeAYZZhclzXeKehmcaEhmzvsDjarLV9gW8sDaLu8wIagioR179v9WmEE
 nBuQBO3XQxDC5rXzy+Qbg3sFetSK8KQ=
X-Authority-Analysis: v=2.4 cv=Sb7HsPRu c=1 sm=1 tr=0 ts=6a85a8a5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=dlFzzRy74kIF9YYi:21 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Je4mtRru6RPz1SsRR2UA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190100

Hi All,

On 19-Aug-26 14:54, Hans de Goede wrote:
> From: Ibrahim Abdelkader <iabdelka@qti.qualcomm.com>
> 
> hci_uart_close() closes the serdev port if HCI_QUIRK_NON_PERSISTENT_SETUP
> is set (for example, for the WCN399x family). A failed hci_dev_open_sync()
> following a successful qca_setup() calls hdev->close() but not
> hdev->shutdown(), so the port is closed while power->vregs_on is left true.
> qca_serdev_remove() then passes its power->vregs_on test and calls
> qca_power_off(), which writes to the closed port unconditionally.
> 
> Seen on a WCN3988 by unbinding the driver after a controller failure. The
> trace below is from a 7.0.0 based kernel, where qca_power_off() was still
> named qca_power_shutdown():
> 
>   Unable to handle kernel NULL pointer dereference at virtual address
>   0000000000000038
>   Call trace:
>    tty_set_termios+0x50/0x238 (P)
>    ttyport_set_baudrate+0x84/0xc0
>    serdev_device_set_baudrate+0x24/0x40
>    qca_power_shutdown+0x158/0x1fc [hci_uart]
>    qca_serdev_remove+0x54/0x68 [hci_uart]
>    serdev_drv_remove+0x1c/0x2c
>    device_remove+0x4c/0x80
>    device_release_driver_internal+0x1cc/0x224
>    device_driver_detach+0x18/0x24
>    unbind_store+0xb4/0xc0
> 
> Check HCI_UART_PROTO_READY, which hci_uart_close() clears in the same place
> it closes the port, before writing to it. The regulator disable is left
> unconditional so the controller is still powered down.
> 
> The dangling serport->tty that turns this into a use-after-free is
> addressed in a separate patch.

That separate patch can be found here:

https://lore.kernel.org/linux-bluetooth/20260819125748.194377-1-johannes.goede@oss.qualcomm.com/

Regards,

Hans



