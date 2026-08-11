Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E89C1F3BA4
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 10:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786445981; cv=none; b=YEOE/JdzqEuegXr6gBtNslowRA0ats9Djmtlo06WUNX6uGQLxRV3rIWFG0WEzd2PvH+J5kFTgYhBU/uuWZizxCh9yldeKO7QSzmqIE7DcwkWIV3GM3cpkDRpyzF5HUxMqKC05Q+/pzhN6KqoFEqkHdz3TEtR/DE/jw4o+YB7aUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786445981; c=relaxed/simple;
	bh=Wc/L1rcCPuO2hZ6WlKjHGrGjzyyrJehQInhXOKby2dc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=miC7NsbX+aO+B5Tug4NIuzCHC4vMSfAV1KX/HrJJyRhtf4wZJcj1x8e1SX2/3DZSUjtICbMZjz4gYPgdS61M/6xllqXNgjqPGBVXCUWAKZx/IJb1AYkPskGa7oK7raWiRBBNxkDc1djodAmJYgYJFqkG5ZA1J83qTK5QTuimDQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EDjjV8Xf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I3DDksFY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EDjjV8Xf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I3DDksFY"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BAMjXP3781054
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 10:59:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qZ1aqfiqbRJvbP/KfVnH1D5+qDlEv3lhxnG9TbFMG/A=; b=EDjjV8Xf46u06atd
	d09KThvZAvppN9wb1ud1og2tYtx2xnY+la28kMQ3vmsSOai8yvYVIKOziBWLuLRr
	0PjfTFkCPQgl+aPgnJXI+Vx/ju5RKitGYGxHFVvqAfa0TqE+nx+49DRN3m6Qg3nQ
	FYAHx6dEwpIeWSiNK5eLWWYw5hjijhyfPiWPmrgindb69NTLD/ieND3w5JoSeSM8
	GGvuqwWdYp0bCewGlbG8sU+DN5t6C4K5ZtnNunldRm334rGV6T9CKBrRPGBNvO2o
	qov0AdyWKxSLz+t6AgyWyI3Bp9o83XteIJPy8jBAPkN+dEUg7ZVJ6hZ/BKaYTuhE
	NJIf2g==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyjk7bsfy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 10:59:39 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84857446424so4943208b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 03:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786445978; x=1787050778; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qZ1aqfiqbRJvbP/KfVnH1D5+qDlEv3lhxnG9TbFMG/A=;
        b=I3DDksFYQIg0kwWD0H1pnwVvg9FuG1P64JnLZO0UNYmnq/DB2TIOjv1CvdBaBR1JSO
         UzjBe91OSehqcdeXbDP6wpVG2zb1ubO9bh+/fYJA1QUJas1dS1L5iPmES9+Ze7ZEs2NM
         6OPRg4WupWaF3YoikzA8tXPAfeuXFLTlY6iHUZ8n1kpo1x+8Z82MJX5qdxuGuJakjbl6
         OrKGLs39OLosFbGgpaHcyF+R4pWHYTougBLzv0TwFC+GXPoJc2RopW23OaAqKZxLy1p7
         hZWJ/ihjU7fH4U0LKcbRnCNI5WI6mybfKQuA+BhkQpyc9Z4fQMozrz+EvZoW4jW4UIkz
         PCJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786445978; x=1787050778;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qZ1aqfiqbRJvbP/KfVnH1D5+qDlEv3lhxnG9TbFMG/A=;
        b=oDWtm0V1CJFPsNj0RUEtsUHw56z7pGGFOz4s+ANUURLZOjbuRQ56yOT5DCx9IYm2Ll
         vxNoNmhlbfqHkbe5t6UgASysOn3XREP6e1GxfLZGvQAzTfZs+sPIFhEZCwKLLwHbjCIr
         Kbj7yLreqfHVqlLdPhMp9+IdtfA/+IKk3cTBIOjzjpCBvIV8R0Jv1eu9w+l5J5URlT9n
         0hw6gaOz4l5tKXWV1fth5tvhw6xvu5P9SjLa6XgEbw2b/HgO2t7PqYoOVwxmw/Yg2q7Q
         u2HsbJX21tzFV02oS1OLGvj4Z30/YcDICsBSnYwb/POCC0hcMM4Q7syeFWQtQbr4KlHV
         zB2w==
X-Forwarded-Encrypted: i=1; AHgh+RqwufPWXuM3kfw22utuK4mzdOKf1/7hCtTrtn3dFmlIIew4fgXjOC4Nk11CO/wmjBC3Yam7jMa23Qhi3iNc@vger.kernel.org
X-Gm-Message-State: AOJu0YxF2nPNEgxyMps5mluxdEXXMXGzsThg8gUiFFreyNHlDSRs2duw
	DinwPgBJap7YuvXJauI34QTWkML7QB/dfqsehxMDI+3x8F6DXeAH86dbmyUjlUQ0HeLBa5HjdO/
	EUga6SDEvuJAmHvzBxZnoyt8hX3i+JKiqRqmMpnF3CK9xHooL494P+7JW422Gf1GbmULj
X-Gm-Gg: AR+sD11Ci+c8Smo4/cQ+HltT98Bm9/fyrekOJ9wFWYlgHPbBqkAHfZYn1UB21WiUCCD
	Zbip3UoZLczWUp3wNwINYNGilQA1lMbJ6t9VSYtQvWDVf+dg8T07Pf+qa+1b4TL+h3iyCpD9PTa
	AjQ9wx6hErqf9m5cVUChYAw92MVEx2FDgxPquTYIU0MxFlp+2Js632rn/mA8gIy9FsI+GvKVNLu
	AwXeo49M5MbVCdvRFJtgEj9yp2Z3vFqzk46EG/bNG5vuurLQCeekO3COHQvE3ujl2U1tF+8BpvP
	+UV+vsAJQ+uv6U/vvx/2HuY+SA/kGOE2ZU8B2E83rknJCgxYvG7f9+z8QUNGRPgWrLr6UcUkvc1
	mxEjs6KeWXnyfQ6mQRAykywDxh/s=
X-Received: by 2002:a05:6a00:1910:b0:842:7296:dba with SMTP id d2e1a72fcca58-84fa8670a54mr2141490b3a.7.1786445978161;
        Tue, 11 Aug 2026 03:59:38 -0700 (PDT)
X-Received: by 2002:a05:6a00:1910:b0:842:7296:dba with SMTP id d2e1a72fcca58-84fa8670a54mr2141431b3a.7.1786445977389;
        Tue, 11 Aug 2026 03:59:37 -0700 (PDT)
Received: from [10.239.97.158] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84fa91b5ba1sm553303b3a.20.2026.08.11.03.59.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2026 03:59:36 -0700 (PDT)
Message-ID: <f3c1f58d-66ab-41f3-9f25-682196ecb230@oss.qualcomm.com>
Date: Tue, 11 Aug 2026 18:59:32 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] Bluetooth: mgmt: always reply when a queued mgmt
 command is cancelled
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Marcel Holtmann <marcel@holtmann.org>, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        chejiang@qti.qualcomm.com, quic_chezhou@quicinc.com,
        wei.deng@oss.qualcomm.com, jinwang.li@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com
References: <20260731042920.2431343-1-shuai.zhang@oss.qualcomm.com>
 <CABBYNZJuenvKSvHuf6DCkt9hpdhuECm3gf5hiV+FyS2E9AM7nQ@mail.gmail.com>
Content-Language: en-US
From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
In-Reply-To: <CABBYNZJuenvKSvHuf6DCkt9hpdhuECm3gf5hiV+FyS2E9AM7nQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Yus/gYYX c=1 sm=1 tr=0 ts=6a7b009b cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=racmn3MOU509EMJz4VAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: EzGBqZMMBB118rfApvcWzE7-YHysEZt6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDA5MSBTYWx0ZWRfX/9vd1epM+CQ9
 Hzxx9rfRGk6hGxF85Nbc36Fs7r2+pp7up7sVBUnet+Wq66tqyNuiJ65sTyvj12tKzW1/KL1a0ty
 gIYuIZevovLHmnbOA2qLKrE2dB2RM1cbNygsgbUolPCBMMxN92A2qBwVJ0N3amyO4eZarat+DHa
 O4mleNOT4120TXfv4IPLJPFX/I0/zq8MHtcQJnX9ZYP5CWDU1Hrk/PF7QQRI89uuoVA/ouBmYM+
 VBEJiE3Kz6RjMukhwM6+BrV0vYm6XURXCWMHM2t40XYyTlnAfOTdFzlMYyTuPAUWYKll751pjiD
 3BXOGzoaoTvfl80Dcv5w7eJCaCxfI9Iz67Ooq+4RfOa2+IUaYytRspsq9JO8OHgBH+Epli51xZA
 fyoriEtB8pWVcvjNt7r8aJZIRp7+oX1nuQaf9/gtEmAVjojslYaeiN7CULvghj753xRR0qV8pcJ
 Yg6eBFNzoxbGL11mWCg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDA5MSBTYWx0ZWRfX4SEriCKmPNt4
 O6sHhGJv0qoz3VLRJtWo47qd6QYs50Yjhd85VPihStd0c9dyvSTJHiR5s4zMIoz4DGmuqptus1e
 g6iZZysZvCxNmgeQqST1hyCJipPIZ8g=
X-Proofpoint-GUID: EzGBqZMMBB118rfApvcWzE7-YHysEZt6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_01,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110091

Hi Luiz

Sorry for the delayed response. I was OOO last week.

On 7/31/2026 11:25 PM, Luiz Augusto von Dentz wrote:
> Hi Shuai,
>
> On Fri, Jul 31, 2026 at 12:29 AM Shuai Zhang
> <shuai.zhang@oss.qualcomm.com> wrote:
>> On boot, the kernel's HCI_AUTO_OFF timer powers a newly probed
>> controller back off after 2 seconds if nothing has taken ownership of
>> it yet. bluetooth.service is expected to take ownership within that
>> window by powering the adapter on, but on slower boots bluetoothd can
>> start late enough that the two race: HCI_AUTO_OFF fires and the
>> controller is torn down and re-initialised while bluetoothd is still
>> in the middle of its own adapter setup sequence.
>>
>> When that teardown happens, any mgmt command bluetoothd had already
>> queued for that adapter is cancelled - but userspace is never told.
>> bluez's mgmt command queue is strictly serialised, so a command that
>> never receives a reply blocks every command queued after it on that
>> adapter indefinitely. In practice this means bluetoothd gets stuck
>> before it can register the adapter, and reports no controller being
>> available at all, even though the controller itself is healthy and
>> fully usable moments later.
>>
>> Fix this by treating a cancelled command like any other failure
>> instead of silently dropping it: always send a reply back to
>> userspace, using the existing "cancelled" status value. This mirrors
>> how other mgmt commands already behave when they fail for other
>> reasons, and lets bluetoothd's normal error handling take over
>> (log the failure and continue) instead of hanging forever.
>>
>> Verified on a QCS6490 rb3gen2 board where this HCI_AUTO_OFF vs.
>> bluetooth.service race was reproduced: before this change, hitting
>> the race left the adapter permanently unavailable to bluetoothd until
>> the service was restarted; after this change, hitting the same race
>> no longer affects adapter registration and the controller comes up
>> normally.
>>
>> Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
>> ---
>>   net/bluetooth/mgmt.c | 7 +++----
>>   1 file changed, 3 insertions(+), 4 deletions(-)
>>
>> diff --git a/net/bluetooth/mgmt.c b/net/bluetooth/mgmt.c
>> index 167d75e34..9031b5d5d 100644
>> --- a/net/bluetooth/mgmt.c
>> +++ b/net/bluetooth/mgmt.c
>> @@ -301,6 +301,8 @@ static u8 mgmt_errno_status(int err)
>>                  return MGMT_STATUS_ALREADY_CONNECTED;
>>          case -ENOTCONN:
>>                  return MGMT_STATUS_DISCONNECTED;
>> +       case -ECANCELED:
>> +               return MGMT_STATUS_CANCELLED;
>>          }
>>
>>          return MGMT_STATUS_FAILED;
>> @@ -1338,7 +1340,7 @@ static void mgmt_set_powered_complete(struct hci_dev *hdev, void *data, int err)
>>          struct mgmt_mode *cp;
>>
>>          /* Make sure cmd still outstanding. */
>> -       if (err == -ECANCELED || !mgmt_pending_valid(hdev, cmd))
>> +       if (!mgmt_pending_valid(hdev, cmd))
>>                  return;
> On set_powered_sync:
>
>      mutex_lock(&hdev->mgmt_pending_lock);
>
>      /* Make sure cmd still outstanding. */
>      if (!__mgmt_pending_listed(hdev, cmd)) {
>          mutex_unlock(&hdev->mgmt_pending_lock);
>          return -ECANCELED;
>      }
>
> Which is why we consider -ECANCELED as a NOP, also if you dig deeper
> you will see that hci_power_off -> hci_dev_do_close ->
> hci_dev_close_sync -> if (!auto_off) __mgmt_power_off ->
> mgmt_pending_foreach(0, hdev, true, cmd_complete_rsp, &match);
>
> So the reason this is not working as intended is because we are not
> clearing HCI_AUTO_OFF once we receive Set Powered command only once we
> run hci_power_on_sync which create a race where the likes of
> bluetoothd will be trying to power the adapter but power_off work is
> still pending, so we should probably clear HCI_AUTO_OFF whenever
> setting HCI_MGMT as at that point we know there is a user already
> there is no point in powering it off.

Agreed on mgmt_set_powered_complete, will drop that hunk in v2.

On mgmt_remove_adv_monitor_complete: the __mgmt_power_off() path you
describe only runs when auto_off=0, i.e. when bluetoothd explicitly
closes the adapter during normal operation.

In the race we are fixing, bluetoothd starts late and the HCI_AUTO_OFF
timer expires before it finishes adapter initialisation, so auto_off=1.
In that case __mgmt_power_off() is never called and there is no other
path that replies to the cancelled commands. hci_cmd_sync_clear()
cancels them with -ECANCELED, and the complete callback is the only
place left to send a reply. Silently returning there is what causes
bluetoothd's serialised mgmt queue to stall indefinitely.


>
>>          cp = cmd->param;
>> @@ -5651,9 +5653,6 @@ static void mgmt_remove_adv_monitor_complete(struct hci_dev *hdev,
>>          struct mgmt_pending_cmd *cmd = data;
>>          struct mgmt_cp_remove_adv_monitor *cp;
>>
>> -       if (status == -ECANCELED)
>> -               return;
>> -
>>          hci_dev_lock(hdev);
>>
>>          cp = cmd->param;
>> --
>> 2.34.1
>>

Thanks,

Shuai

>
