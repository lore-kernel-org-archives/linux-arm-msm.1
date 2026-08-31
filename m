Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 953533DB645
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 16:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788192005; cv=none; b=k6igCRR0hf9Ea5EnahxzKpjkqaHFahuvRMj3we5BX4CFzif+DNDnKFzyDzjvpnDXcXpL9cp2GRpbeZ4nHmWWoG+2+PYQX7pb+GkatOnm/jiGGC2x8GxqCB77JyKPpOyaKKfETWIR8kOz61/9Qw8pYThB/LesMOfi6zRfUNPuvLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788192005; c=relaxed/simple;
	bh=C2HsrkAsY551zyQVjhc/uoCKFo+qO9kHWqJMqFvLm7s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u9kJ2AfZjA5LpT5DfNU2CAI7okSMvYbPp/p1Bm01yyLfZiTwpl+/hsM2JhIeyKGI8gl3WuEztvJsmZOHyh3YwCU5ZFJBur7283sLAZKGkFeDf6rE6rnWJTfNz/9Wwt4Uey1pQCn9aAfOlv5HlI2B41izSqrksQCTqVdj0x9T8MY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WA9H4rr+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DzbrXQr5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WA9H4rr+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DzbrXQr5"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VFrPKC3891198
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 16:00:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I76VLQrz2FsEqHBxgl+gJTgbNgwv1LFzl20Eqv99Pco=; b=WA9H4rr+fNwvKyra
	gGCUywkf0DtM+OjQMqc75kAqo6KISiN2lHaiZhc00deAZWFCVycXI9uXpsGZLfPc
	OEjJ/YMfKCOSO87Jk60/wjDWVAPvWdy4Eu1U5aBwZYlFq0GLyFU4yVjy0E+LzTwP
	bYsc5rgo1G9BsJbsP1/epknRev6ghsbqu3BO6oqKpezojq7Ob/UPRHcTW21JYN86
	ccrm9R+ykmX9lL4g3l31Xs71gd5LmFdKnR8YhjfjKG2wt26V3GMKA0e1YOJdF546
	3gu/V0JJvWJyIJd0sDL+Ey0pFBTho2bpEtvG1NHRacjdWTZfNUzoWyFxpS5IDVUk
	bVD6gg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd6yasnwm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 16:00:01 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-ca8aee88725so6312154a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 09:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788192001; x=1788796801; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I76VLQrz2FsEqHBxgl+gJTgbNgwv1LFzl20Eqv99Pco=;
        b=DzbrXQr5/AysCz/ydddu5uqDrp5Ijpjz3AF9eyMnPZ6uUI+YplU79TNfj4m1R/UMiz
         oPPNAb+59DCmjPuoy1YfmYy0elBnDeBCLdk2gVN/1GL9LCMaZjjsuOUIvRSmaToQbCGv
         4NQVhRkt2R3wffdqA6BtVBiYkA6rphI5duenc2rFKk7UTg7Uzm5aosuNaXPeGnIuwib8
         AsWvrxnSDbOv76Xuk+b54nOicxFd4ST8tSosJlTZa6/UOLjDT8HH0RgQ1AOdBtbIB+CE
         6xozRLWJ/dyiB23CbFk4dmMc5dZtVbPm6XIHLPKhMLENYpO4tLPntRjLw+NOdDWCVRj1
         nXzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788192001; x=1788796801;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I76VLQrz2FsEqHBxgl+gJTgbNgwv1LFzl20Eqv99Pco=;
        b=g6n5NDBndkFO1rmLDC46Tk10S0xzAQrosN66PEppxHDxr8TmO1eHIBLtNAvkh9+oAQ
         FWBOT+WxoyE6XdyhtzJS1oSErQifHON390MpQlEH+RG9ObD75+F35r/0mydBFll7cxIp
         4BbRbK5HN4Du9m2n05ZyHGMvgKUvytFgUkEvhBt/TLwVDazNfjRuq7wLIoSFvjMchxSV
         QkqExcG2bLcdDP/beTnGO1AEgxHfCXnmcYPMHS4MFqkZFyVwN6kgoOli7L7sqbLSxC9p
         Ime/KnVL/b4/M6wL5DoeXKBvaqg807AqC8Lt0LgW2bfGsID5t4CUwg6CzA+dcGPoNx5V
         eipg==
X-Gm-Message-State: AFuF++ls6l8ZYy0Ac8M40SCP1TsYfU2XGqVMPeDpm6bUHVDxaBWfRebm
	zo3j6K92m9hWZ5vlviayeXWOW7Hs9xc7uEu5sw64A5nBblLlpyNVfwV+Fx1IORwqPRT523Z644U
	TL8F0QVqA2bUd39LVHQfRVBS0bKvDLzbTSS7JYv3iHV7+jciwmHJMJRzw6GzkM8ijmhWX0FzN5q
	xj
X-Gm-Gg: AR+sD10c77CCPCAjkqezcFJGCKk7x8oYXnamfykzF1Ayho3YipwMZP42b5na/F8ys3W
	beZKfUu1kj5s/2eMA7/1Xa0JFifFxwTlKQq7YFYs+NIx7DtPF6wnaugzthE3MPfVeF53N5diNXd
	Ho4gFrIxnxQ4HAa3iVX8qk6ZQUcRhXsCGxgzrInGhRRPY9noBRwgl0nX2DAJ3X02JjCO4KWkkjN
	CcpULdgSXbgWSkPaLseCBMRFjwoKJMLHZtXC1QJG+fK1+NaQ3IfEAGHfAdx/wF3f6tR86cpB9JG
	dtnhy1q11MyVoup5n4/BmUivHmL3gTeOvsefP4VNTIvw8IkNMvVU06PrNn1f/xpYaoED+2KkiYp
	fNzzDhXT/qEFwbV7iv/M07aL6ONTrVgx7Sw==
X-Received: by 2002:a05:6a21:4593:b0:3d2:2afa:d85 with SMTP id adf61e73a8af0-3d7af82fb8amr2661666637.13.1788192000725;
        Mon, 31 Aug 2026 09:00:00 -0700 (PDT)
X-Received: by 2002:a05:6a21:4593:b0:3d2:2afa:d85 with SMTP id adf61e73a8af0-3d7af82fb8amr2661610637.13.1788192000244;
        Mon, 31 Aug 2026 09:00:00 -0700 (PDT)
Received: from [192.168.0.102] ([183.83.143.92])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286fa20e2fsm31401770eec.28.2026.08.31.08.59.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 08:59:58 -0700 (PDT)
Message-ID: <5be318fd-5413-4d6e-a8c0-f1b1eb35393a@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 21:29:54 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] serial: qcom-geni: Fix port_ida handling for console
 and probe errors
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org
References: <20260831-master-v2-1-0032ec7fd1ca@oss.qualcomm.com>
 <5bb31efb-3855-41e7-b011-1a5a94fee59f@oss.qualcomm.com>
Content-Language: en-US
From: Aniket RANDIVE <aniket.randive@oss.qualcomm.com>
In-Reply-To: <5bb31efb-3855-41e7-b011-1a5a94fee59f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDEzOCBTYWx0ZWRfX8MDbLtHp2Pxu
 WJ1hfBe1se5KrQOrcuFli5YfVdBOOtTPJO2AcbrUEixo2WuSiIqqYBOCZea2WBHVFDxFmOJ/GPT
 Urmbe1qzB9Ww2Kw7v6AsJc+Ungd9klU=
X-Authority-Analysis: v=2.4 cv=CpaPtH4D c=1 sm=1 tr=0 ts=6a95a502 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=XkslMnuk+fwelqvQqm66dA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=t_IBPTLT0seuTEbNzfsA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDEzOCBTYWx0ZWRfXwEO/5gFL8y7O
 ZrAwpJ3OSAHwLBuwqcTOw1TnMlc/9BjnR0h+187qDlgThNowl00w43meuPB/LqNBf2XeC/uLBVB
 ntKfZohM24msxpcGLdDqFRA+xbEqM6a70VDvym5+Hjl+LAy4p4rhNZkwzoSF/GliixaRfmlsZhH
 T+WFphAZCiOo+TCkxx9WQQpAh5WiMgg0F5qio1fUTykNRg1MMU/0ZbbkNrgHttLf8Yju83x/drt
 K1ZaWAcBh9Xx+HH7bVMZn4pQ8OtHbfTugj0D8wDxTLrh2Vm7PVUSfzOVwKoJHzXPWEuRjt7KYHC
 +xB2pyxjxUFWd5PY+qkcDf0jZQ06mWjt4AdclAjJbIfPa/LiR1XLh1I3dWTdTFP7UgbawQLj/29
 BlD++nTpvRUNdNKTrnt1kJ9eoEQ1m7AqT48+5nv9tVA+a1+12FfGXE2eJZX523+JFsIHvtK4fXs
 KsgviUFWiDijgyAeepw==
X-Proofpoint-ORIG-GUID: cLIDHMMv-7Ac2qAc4SIwExf5sFvej80E
X-Proofpoint-GUID: cLIDHMMv-7Ac2qAc4SIwExf5sFvej80E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_05,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 phishscore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310138



On 8/31/2026 5:08 PM, Konrad Dybcio wrote:
> On 8/31/26 1:12 PM, Aniket Randive wrote:
>> The console port uses a fixed line number and is not allocated from
>> port_ida. However, qcom_geni_serial_remove() unconditionally frees the
>> line number for all ports, including the console port.
>>
>> Skip ida_free() for console ports so that only IDs allocated from
>> port_ida are returned.
>>
>> Also release allocated IDs from the common probe error path. Currently,
>> IDs are freed only on the wake-IRQ failure path, causing leaks when
>> probe fails after a successful allocation. Move the ida_free() call to
>> the common error path and guard it for console ports.
>>
>> Route resources_init() failures through the common error path so the
>> allocated line number is released correctly.
>>
>> Allocate the port structure before calling ida_alloc_range() in
>> get_port_from_line(). This prevents IDs from being left allocated when
>> memory allocation fails.
>>
>> Signed-off-by: Aniket Randive <aniket.randive@oss.qualcomm.com>
>> ---
>> Changes in v2:
>> - Route port->dev_data->resources_init() failures through the common
>> error path so allocated line numbers are not leaked.
> 
> I asked GPT what it thinks again and this time it found that this
> will cause a double calling of dev_pm_domain_detach_list(), which
> will mess up the refcounting..
> 
> I think the fix here is to drop the manual detaches since the common
> helper uses a devres-managed version of attach.
> 

Thanks for catching this.

Looking closer, this appears to be a separate issue from the port_ida 
fixes in this patch. The dev_pm_domain_detach_list() problem already 
exists in the current error path and is not introduced by this change.

Since this involves power-domain cleanup rather than port_ida handling, 
I'd prefer to address it in a separate follow-up patch to keep this fix 
focused and easier to review.

Is it OK to keep this patch limited to the port_ida fixes and handle the 
power-domain cleanup separately?

Thanks,
Aniket

> Konrad

