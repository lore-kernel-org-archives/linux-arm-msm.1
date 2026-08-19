Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA872DA74C
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 12:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787143139; cv=none; b=PA3YRD34S1IFpIw4pO8nsR3q9+ufIU5ntuoOsqQ99iiNQORvosHfA+Rqc3sUk7fi3GiBKOPp4tsBlaxIvzi/KnEZJnKgdIpmZfgFB8/6+n+O0uIywUYIgLCI/YAH3q62zkM+gR7uVMyIcWaJUwkN75RX1qZlX+mONGVc/BLNKbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787143139; c=relaxed/simple;
	bh=ti+q3Ez+5lurJibGp/Ys+prKkmqpOm9ANEMYbROgczk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=a/4JkXKilyYC6sq7/HbN8TGlB025/mxEm64TJD5fPdcf4lrybArwOV5HSpb/pOdzWe3H/WcJWzLkpvmQPzcf3iDb7lSw7i8YW3JDaJ3Y/9zL1XiLmyja9fqvIP5q8xY9BRubh77s6mjJk5gzUflNPjmB07tqLLlrdf6cVPd6z1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LvPHDw8G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mo959uDT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LvPHDw8G";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mo959uDT"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JA7PSI1018947
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 12:38:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oeaL78ack5YcCyf6GgMSt/F2woxmb8WSjxxW/++9c40=; b=LvPHDw8Gmw5gi+zw
	2GOted65+0U5P8yXiBVt/EGYYo5UCVrqGmfpjzRS+xHJG3syk42AQYNvS0mLyL99
	0EEj5THHfh1/JYa6S0qbpviZ0wFyRgI6kk+cvyW++njOqC6cOVSABG8y6rj5083a
	M6ANQmAzoS+BvbaM/1P3dytcvz3oDPaAksJNqB1eHb6o56qizXiW1AqUNkWSmyWU
	TXUyiR6s4MlD8CD8Xg20mODJI7fP2FiQKEZlyYiniLZOa6avpCAkt5uez6eeL3Ld
	nNvClfQVooLqtbxZsBm2wzeoh7SXKu0JOM1iANNTySdlgSykFrHskKnhIji9VmAG
	Vzgt2A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfm3698-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 12:38:50 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9308eafb465so195966185a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 05:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787143129; x=1787747929; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oeaL78ack5YcCyf6GgMSt/F2woxmb8WSjxxW/++9c40=;
        b=Mo959uDTZEL1FuM3PTp6ZP7KpTRqTsVkuMzuUnkohLzkPnHsQZLgiU+3nXO0koLtte
         ylropOAwTwn4bktcdHwYpHEkInQi9Mi+YZ0Lz8z/HVdEFL7hhA25NE+aY+1LLGNGHkgt
         lBmAo4GZeQEYgujSLE5OMa+JwVMnPOwm7TjdWXG2Zkmn6prQ0vr18QvTt9y1OZotVfBZ
         t09WyamyREDLmdtmeSPICYqVer0gsz20aCLVqNK0RtBUKPGhOoaiyknESteIppO0srKG
         ILVuipMXgwr1pyCCbkMxPBV7sYQqEd45tmuqdT6bhkrJB/gzaQuCLsi0ujpB2B1zbK62
         pUPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787143129; x=1787747929;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oeaL78ack5YcCyf6GgMSt/F2woxmb8WSjxxW/++9c40=;
        b=f7IVTyhpK4DuWYAz53afmLI+S8YWoCjHq6azT3aFl/EqDmK7P6+h5PsxitprIQvS4V
         Dqhjl7sNu6yUQ34tPlnbSTT+ulcr6C38miMqFqYPBvaBZP3wjcc0nUPPkvXaXbJW1Qai
         o9V2T5ixp+ysxmn2fqY/8CjM2Gm3D17aHAetveWbEnX9tnxIVFLS9a6VjleRBvKdMtcx
         mspwadVYwEsn9M1sypuc4PnAmmpG2ggoyjN54ferkZ14Gxoe9ue3W6VKf7Q77d/93Gd3
         phHATKZtKXs9rlYq8b22vX3p3Bl+CnLs6F+XDA060AsmTOYBdN4p0E5ZwyxehlIXVnh4
         7WQg==
X-Forwarded-Encrypted: i=1; AHgh+Ro23vZktI2IiYSkJWUhEcXg9OEGtRhThMDjQWNDBP05vgQpm427VGxzZ4kWVDH5bMSLnP28kGhl0eI8WlhA@vger.kernel.org
X-Gm-Message-State: AOJu0YzXauL2/IpuhiLD4JReJN9kvbYGJFrl0/uRLh6DAkCSxmagivuq
	LaXKRnTSSSuq0zcLsKC4RRaPnp3jqQcK8ouQTGJw67XiLY4RyVRg6biK20UbGqAw7Z3MCXfoWX0
	IGvTGZE8y/TEGwwvAWQLR7gK0gMc3pGx1wbnwAcGXfa6gWKHM7IKcdB35rgizo6ynso3X
X-Gm-Gg: AR+sD13bJ4kxzW2Z1RHJD4GwQLchbPvwHV2oHOAZZQxwQDmFepKz6AZ0UGdSni6PYGG
	s63iAfFW/M9ljovKGnOtOg3zJQ9wnJq27f9ap/AG8tFpr2rf0jAnxQlYjwSHI5/kOdhrRf1k9GJ
	BbkBZjBsub+hNzY5iKsynUp9hH7I+L7GDxAqpiCHG12WmgudV4JZZ7zVKgYUy8ZA0Lgbuj0cSzR
	zN6CRDdm8L6E+/gYdVT/isVS8mjxugYFPZc88sy49HZSrgL6GgTVhXECWxoGo95In8OazKWF3up
	Cy9ilGUykwBOdQT2GP0VoR/hx2Cee+d0hdLssNJL/dmbsDKcTnXAbk9IUt61QY5uytVWEYLXE7o
	6qtD9wE2vWoer9Lt1+Fr6Ig+Apocsg4G1aWlF2TlBK6LOlMO6aZI9UwLlshkCqFz1bxAIrBY5rF
	QnBJ7E49v2kyS7bZI2y9ViHCqpC3uaDsFC2wXXqhqWar989Q6LsPm4
X-Received: by 2002:a05:620a:8803:b0:936:adc5:6a8e with SMTP id af79cd13be357-9371e21876fmr433025485a.13.1787143129104;
        Wed, 19 Aug 2026 05:38:49 -0700 (PDT)
X-Received: by 2002:a05:620a:8803:b0:936:adc5:6a8e with SMTP id af79cd13be357-9371e21876fmr433020685a.13.1787143128642;
        Wed, 19 Aug 2026 05:38:48 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3feec9d52sm896446a12.2.2026.08.19.05.38.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 05:38:47 -0700 (PDT)
Message-ID: <73afb7ba-53c8-423e-81a2-7e923896c995@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 14:38:47 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH 2/2] Bluetooth: hci_core: Handle skb_clone() failure in
 hci_send_cmd_sync()
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Marcel Holtmann <marcel@holtmann.org>,
        Ibrahim Abdelkader <iabdelka@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org
References: <20260817205017.56524-1-johannes.goede@oss.qualcomm.com>
 <20260817205017.56524-2-johannes.goede@oss.qualcomm.com>
 <CABBYNZ+Bhhx3rtq8i_FGu2a_oFyWquo_gTRcmPyM6HcFC3pkVg@mail.gmail.com>
Content-Language: en-US, nl
In-Reply-To: <CABBYNZ+Bhhx3rtq8i_FGu2a_oFyWquo_gTRcmPyM6HcFC3pkVg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDA5OCBTYWx0ZWRfX/4zCLrRK3HHr
 EiuPsg1TMDP+a3qN6Yqcx+oxDeEaFJzGA+wC7dEfXMhQvs6XyRyE+u3mh976HSZPoHSWZpY6elG
 krRi0t5asCcrzeNpkvsh06/ywl1LeWo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDA5OCBTYWx0ZWRfX51j5tnX0FTFf
 fzIPTvFHyNd7vmNO9IwgB/NfrhbgUpaEncOWVhZYh6ypV3qwS8nGGr97tjsioPcwqfLLM/afMvB
 Cw1zHbNkeu7M2uAEGlSMTKDRpfyTqTfb89Ht++JRdPuDL97ECxpzZICqfUKJlXL0dfAFMn/X4Pf
 wjoD5tKmnLV6rKfxRopZAc6zgKlQxCz0I8qL2/x0xl2yHbmIE3Yd0WmFAv/1pLXggNGiO3N7xRi
 KOY6iF9PpRrxL9sNkTnmpZcKUsigS9D+54XnMpX8aU/BAiZcLB0DQ89qyEyqD4zIKJOR9TXS/Ol
 q3RNUEhkOrszcIsSdllOE0D0M6WKalzhogD06HZ7SAtnFpnchA0ejjQwnWQYtOZe1BgIr6ptMgH
 IYdbMYbi2C7MW0jUzp5XEq3IplbbeKjzCN3bmnCthK3vgsnXOf1vI9Uz5Lqny8zls0fywGvhfsy
 EXogVNDDf2aQ8DDcyCg==
X-Proofpoint-ORIG-GUID: 5WyZFoH3cdezF4Xd0yZqXkQ2dS_wfbve
X-Authority-Analysis: v=2.4 cv=bN0m5v+Z c=1 sm=1 tr=0 ts=6a85a3da cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=c92rfblmAAAA:8
 a=EUspDBNiAAAA:8 a=HAoXxi4WUqF9RrtjM_8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-GUID: 5WyZFoH3cdezF4Xd0yZqXkQ2dS_wfbve
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190098

Hi Luiz,

On 18-Aug-26 20:01, Luiz Augusto von Dentz wrote:
> Hi Hans, Ibrahim,
> 
> On Mon, Aug 17, 2026 at 4:50 PM Hans de Goede
> <johannes.goede@oss.qualcomm.com> wrote:
>>
>> From: Ibrahim Abdelkader <iabdelka@qti.qualcomm.com>
>>
>> hci_send_cmd_sync() does not handle the second skb_clone() failure as it
>> does the first one. At that point the command has already been sent and
>> HCI_CMD_PENDING is set, so an allocation failure leaves the flag set with
>> req_skb NULL. The response then matches nothing and the caller blocks for
>> HCI_INIT_TIMEOUT before getting -ETIMEDOUT, reporting a memory shortage as
>> a controller timeout.
>>
>> Clear the flag, cancel the pending request with -ENOMEM so the caller fails
>> immediately instead of waiting out the timeout, and return -ENOMEM so
>> hci_cmd_work() does not arm cmd_timer for a request that no longer exists.
>>
>> Clearing HCI_CMD_PENDING here is safe: all code touching that flag runs
>> from hdev->workqueue, which is an ordered workqueue, so those paths are
>> serialised and cannot race. The one exception is the cleanup added by
>> commit ed516e3f1aa6 ("Bluetooth: hci_sync: Clear HCI_CMD_PENDING when
>> dropping the last request"), which runs on hci_dev_open_sync() failure and
>> from hci_dev_close_sync(), and the workqueue is stopped before that runs.
>>
>> Fixes: 2615fd9a7c25 ("Bluetooth: hci_sync: Fix overwriting request callback")
>> Signed-off-by: Ibrahim Abdelkader <iabdelka@qti.qualcomm.com>
>> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
>> ---
>>  net/bluetooth/hci_core.c | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/net/bluetooth/hci_core.c b/net/bluetooth/hci_core.c
>> index 8aeb3024428b..9585b42e7970 100644
>> --- a/net/bluetooth/hci_core.c
>> +++ b/net/bluetooth/hci_core.c
>> @@ -4092,6 +4092,11 @@ static int hci_send_cmd_sync(struct hci_dev *hdev, struct sk_buff *skb)
>>             !hci_dev_test_and_set_flag(hdev, HCI_CMD_PENDING)) {
>>                 kfree_skb(hdev->req_skb);
>>                 hdev->req_skb = skb_clone(hdev->sent_cmd, GFP_KERNEL);
>> +               if (!hdev->req_skb) {
>> +                       hci_dev_clear_flag(hdev, HCI_CMD_PENDING);
>> +                       hci_cmd_sync_cancel_sync(hdev, ENOMEM);
>> +                       err = -ENOMEM;
>> +               }
> 
> Sashiko flagged a problem with this change:
> 
> https://sashiko.dev/#/patchset/20260817205017.56524-1-johannes.goede%40oss.qualcomm.com
> 
> Im with the opinion that this shouldn't cancel the request, because at
> this point it may already been sent to the hardware so maybe we should
> flag it somehow that req_skb wasn't able to be allocated, or something
> like that, but the command is still outstanding.

Ok, so maybe we should move the hdev->req_skb = skb_clone(hdev->sent_cmd, ...);
to above hci_send_frame() ?  I don't really see a reason why that cannot
be done first.

And then the hdev->req_skb = skb_clone(hdev->sent_cmd, ...) and
hci_send_frame() error handling could share a common err path both
calling hci_cmd_sync_cancel_sync() ?


Also while looking at this I noticed that hci_send_cmd_sync() exits with
ENODATA when hci_skb_opcode(skb) == HCI_OP_NOP, but at this point it
has already set hdev->sent_cmd and will also still set hdev->req_skb
if the conditions for that are met.

I wonder if this is the right thing to do, or if the hci_skb_opcode(skb) ==
HCI_OP_NOP check should be moved higher up in the function followed by
an immediate kfree_skb(skb) + return -ENODATA ?

Regards,

Hans

